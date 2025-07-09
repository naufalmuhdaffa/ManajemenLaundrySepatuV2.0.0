using ManajemenLaundrySepatu.Helpers;
using ManajemenLaundrySepatu.WinForms.Helpers;
using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Security.AccessControl;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormBAK : BaseForm
    {
        private readonly string masterConnection = DbConfig.ConnectionString;
        private readonly string connectionString = DbConfig.ConnectionString;
        private const string backupProcedure = "sp_BackupDatabase";
        private const string restoreProcedure = "sp_RestoreDatabase";

        private readonly string defaultBackupFolder =
            Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData), "manajemenLaundrySepatu_Backups");

        public FormBAK()
        {
            InitializeComponent();
            InitializeControls();
            EnsureBackupFolder();
        }

        private void FormBAK_Load(object sender, EventArgs e)
        {
            LoadLastBackupTime();
            LoadAllSnapshots();
        }

        private void InitializeControls()
        {
            pbBR.Style = ProgressBarStyle.Marquee;
            pbBR.MarqueeAnimationSpeed = 30;
            pbBR.Visible = false;

            lblLastBackup.Text = "Backup Terakhir: -";
        }

        private void EnsureBackupFolder()
        {
            Directory.CreateDirectory(defaultBackupFolder);

            var builder = new SqlConnectionStringBuilder(this.connectionString);
            string dataSource = builder.DataSource;
            string serviceAccount;
            if (dataSource.Contains("\\"))
            {
                string instance = dataSource.Split('\\')[1];
                serviceAccount = $@"NT SERVICE\MSSQL${instance}";
            }
            else
            {
                serviceAccount = @"NT SERVICE\MSSQLSERVER";
            }
            var dirInfo = new DirectoryInfo(defaultBackupFolder);
            var acl = dirInfo.GetAccessControl();
            var identity = new NTAccount(serviceAccount);
            acl.AddAccessRule(new FileSystemAccessRule(
                identity,
                FileSystemRights.FullControl,
                InheritanceFlags.ContainerInherit | InheritanceFlags.ObjectInherit,
                PropagationFlags.None,
                AccessControlType.Allow));
            dirInfo.SetAccessControl(acl);
        }

        private void GrantFolderAccess(string folderPath)
        {
            Directory.CreateDirectory(folderPath);

            var builder = new SqlConnectionStringBuilder(this.connectionString);
            string dataSource = builder.DataSource;
            string serviceAccount;
            if (dataSource.Contains("\\"))
            {
                var instance = dataSource.Split('\\')[1];
                serviceAccount = $@"NT SERVICE\MSSQL${instance}";
            }
            else
            {
                serviceAccount = @"NT SERVICE\MSSQLSERVER";
            }

            var dirInfo = new DirectoryInfo(folderPath);
            var acl = dirInfo.GetAccessControl();
            var ntAccount = new NTAccount(serviceAccount);
            var rule = new FileSystemAccessRule(
                ntAccount,
                FileSystemRights.FullControl,
                InheritanceFlags.ContainerInherit | InheritanceFlags.ObjectInherit,
                PropagationFlags.None,
                AccessControlType.Allow);
            acl.AddAccessRule(rule);
            dirInfo.SetAccessControl(acl);
        }

        private void LoadSnapshot(string tableName, DataGridView dgv, int userId)
        {
            string cacheKey = $"Cache:{tableName}_{userId}";

            if (Cache.HasCache(cacheKey))
            {
                dgv.DataSource = Cache.GetCache(cacheKey);
                dgv.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand($"sp_Read{tableName}", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id_akun", userId);

                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        dgv.DataSource = dt;
                        dgv.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

                        Cache.SetCache(cacheKey, dt, 300);
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show($"Gagal mengambil data {tableName}: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void LoadAllSnapshots()
        {
            if (!Session.CekSession()) return;

            int userId = Session.LoggedInUserId;

            LoadSnapshot("Pelanggan", dgvPelanggan, userId);
            LoadSnapshot("Sepatu", dgvSepatu, userId);
            LoadSnapshot("Transaksi", dgvTransaksi, userId);
            LoadSnapshot("BarangKonsumsi", dgvBarangKonsumsi, userId);
            LoadSnapshot("MaintenanceAlatLaundry", dgvMaintenanceAlatLaundry, userId);
        }

        private void LoadLastBackupTime()
        {
            var last = Properties.Settings.Default.LastBackupTime;
            if (last != DateTime.MinValue)
                lblLastBackup.Text = $"Backup Terakhir: {last:G}";
        }

        private async void btnBackup_Click(object sender, EventArgs e)
        {
            using (var save = new SaveFileDialog())
            {
                save.InitialDirectory = defaultBackupFolder;
                save.Filter = "Backup File (*.bak)|*.bak";
                save.FileName = $"backup_{DateTime.Now:yyyyMMdd_HHmmss}.bak";
                if (save.ShowDialog() != DialogResult.OK) return;

                string targetFolder = Path.GetDirectoryName(save.FileName);
                GrantFolderAccess(targetFolder);

                pbBR.Visible = true;
                try
                {
                    await Task.Run(() => BackupDatabase(save.FileName));
                    Properties.Settings.Default.LastBackupTime = DateTime.Now;
                    Properties.Settings.Default.Save();
                    LoadLastBackupTime();
                    DarkModeMessageBox.Show("Backup berhasil disimpan!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Gagal backup!: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                finally
                {
                    pbBR.Visible = false;
                }
            }
        }

        private void BackupDatabase(string backupPath)
        {
            using (var conn = new SqlConnection(connectionString))
            using (var cmd = new SqlCommand(backupProcedure, conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@BackupPath", backupPath);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            ActivityLogger.Log("Backup Database", $"Backup file disimpan ke: {backupPath}");
        }

        private async void btnRestore_Click(object sender, EventArgs e)
        {
            using (var open = new OpenFileDialog())
            {
                open.Filter = "Backup File (*.bak)|*.bak";
                if (open.ShowDialog() != DialogResult.OK) return;

                if (!IsValidBackup(open.FileName))
                {
                    DarkModeMessageBox.Show("File backup tidak valid atau korup!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                var result = DarkModeMessageBox.Show("Restore akan menggantikan semua data saat ini. Yakin mau lanjut?",
                    "Peringatan", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                if (result != DialogResult.Yes) return;

                pbBR.Visible = true;
                try
                {
                    await Task.Run(() => RestoreDatabase(open.FileName));
                    DarkModeMessageBox.Show("Restore berhasil! Aplikasi akan restart.", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Application.Restart();
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Gagal restore!: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                finally
                {
                    pbBR.Visible = false;
                }
            }
        }

        private void RestoreDatabase(string backupPath)
        {
            using (var conn = new SqlConnection(masterConnection))
            using (var cmd = new SqlCommand(restoreProcedure, conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@BackupPath", backupPath);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            ActivityLogger.Log("Restore Database", $"Database di-restore dari file: {backupPath}");
        }

        private bool IsValidBackup(string path)
        {
            try
            {
                using (var conn = new SqlConnection(masterConnection))
                using (var cmd = new SqlCommand($"RESTORE HEADERONLY FROM DISK = '{path.Replace("'", "''")}'", conn))
                {
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        return reader.HasRows;
                    }
                }
            }
            catch
            {
                return false;
            }
        }

        private void btnShowCacheTransaksi_Click(object sender, EventArgs e)
        {
            int idAkun = Session.LoggedInUserId;

            var info = new StringBuilder();
            info.AppendLine("👤 Cache Pelanggan:");
            info.AppendLine(Cache.GetCachePreview($"Cache:Pelanggan_{idAkun}"));
            info.AppendLine("\n📦 Cache Sepatu:");
            info.AppendLine(Cache.GetCachePreview($"Cache:Sepatu_{idAkun}"));
            info.AppendLine("\n🛒 Cache Transaksi:");
            info.AppendLine(Cache.GetCachePreview($"Cache:Transaksi_{idAkun}"));
            info.AppendLine("\n📋 Cache Barang Konsumsi:");
            info.AppendLine(Cache.GetCachePreview($"Cache:BarangKonsumsi_{idAkun}"));
            info.AppendLine("\n🔧 Cache Maintenance Alat Laundry:");
            info.AppendLine(Cache.GetCachePreview($"Cache:MaintenanceAlatLaundry_{idAkun}"));

            DarkModeMessageBox.Show(info.ToString(), "Informasi Cache Database", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnRefreshDataTransaksi_Click(object sender, EventArgs e)
        {
            int idAkun = Session.LoggedInUserId;

            Cache.ClearCache($"Cache:Pelanggan_{idAkun}");
            Cache.ClearCache($"Cache:Sepatu_{idAkun}");
            Cache.ClearCache($"Cache:Transaksi_{idAkun}");
            Cache.ClearCache($"Cache:BarangKonsumsi_{idAkun}");
            Cache.ClearCache($"Cache:MaintenanceAlatLaundry_{idAkun}");

            LoadAllSnapshots();

            FormToast toast = new FormToast("Refresh Semua Cache Berhasil", 1500);
            toast.Show();
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormLMS form = new FormLMS();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }
    }
}