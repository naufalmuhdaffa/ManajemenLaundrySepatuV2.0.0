using ManajemenLaundrySepatu.Helpers;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormHA : BaseForm
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormHA()
        {
            InitializeComponent();
        }

        private void FormHapusMaintenance_Load(object sender, EventArgs e)
        {
            LoadDataAlat();

            inputSearchAlat._TextChanged += InputSearchAlat_TextChanged;
        }

        private void LoadDataAlat()
        {
            if (!Session.CekSession()) return;

            string cacheKey = $"Cache:MaintenanceAlatLaundry_{Session.LoggedInUserId}";

            if (Cache.HasCache(cacheKey))
            {
                DataTable cached = Cache.GetCache(cacheKey) as DataTable;
                if (cached != null)
                {
                    dgvAlat.DataSource = cached;
                    dgvAlat.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

                    DateTime lastUpdate = Cache.GetLastUpdate(cacheKey);
                    FormToast toast = new FormToast($"Data di-load dari cache, \nterakhir update: {lastUpdate}");
                    toast.Show();

                    return;
                }
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("sp_ReadMaintenanceAlatLaundry", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        dgvAlat.DataSource = dt;
                        dgvAlat.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

                        Cache.SetCache(cacheKey, dt, 60);
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Gagal memuat data alat: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnHapus_Click(object sender, EventArgs e)
        {
            if (!Session.CekSession()) return;

            if (dgvAlat.SelectedRows.Count > 0)
            {
                string idAlat = dgvAlat.SelectedRows[0].Cells["ID Alat"].Value.ToString();

                DialogResult result = DarkModeMessageBox.Show("Yakin mau menghapus data alat ini?", "Konfirmasi", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

                if (result == DialogResult.Yes)
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        try
                        {
                            conn.Open();
                            using (SqlTransaction transaction = conn.BeginTransaction())
                            {
                                try
                                {
                                    using (SqlCommand cmd = new SqlCommand("sp_DeleteMaintenanceAlatLaundry", conn, transaction))
                                    {
                                        cmd.CommandType = CommandType.StoredProcedure;

                                        cmd.Parameters.AddWithValue("@id_maintenance", idAlat);
                                        cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);

                                        int affected = cmd.ExecuteNonQuery();

                                        if (affected > 0)
                                        {
                                            transaction.Commit();
                                            DarkModeMessageBox.Show("Data alat berhasil dihapus!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                            Cache.ClearCache($"Cache:MaintenanceAlatLaundry_{Session.LoggedInUserId}");
                                            LoadDataAlat();
                                        }
                                        else
                                        {
                                            transaction.Rollback();
                                            DarkModeMessageBox.Show("Data nggak ketemu... kamu yakin pilih barisnya?", "Oops", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                                        }
                                    }
                                }
                                catch
                                {
                                    transaction.Rollback();
                                    throw;
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            DarkModeMessageBox.Show("Kesalahan saat hapus data: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
            }
            else
            {
                DarkModeMessageBox.Show("Klik di sisi kiri baris alat yang mau dihapus dulu dong~", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void SearchDataAlat(string keyword)
        {
            if (!Session.CekSession()) return;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("sp_SearchMaintenanceAlatLaundry", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);
                        if (string.IsNullOrEmpty(keyword))
                            cmd.Parameters.AddWithValue("@keyword", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@keyword", keyword);

                        DataTable dt = new DataTable();
                        new SqlDataAdapter(cmd).Fill(dt);

                        dgvAlat.DataSource = dt;
                        dgvAlat.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Gagal search alat: " + ex.Message,
                                    "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void InputSearchAlat_TextChanged(object sender, EventArgs e)
        {
            Cache.ClearCache($"Cache:MaintenanceAlatLaundry_{Session.LoggedInUserId}");

            string kw = inputSearchAlat.Texts.Trim();
            SearchDataAlat(string.IsNullOrEmpty(kw) ? null : kw);
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDA form = new FormKDA();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnShowCacheMaintenance_Click(object sender, EventArgs e)
        {
            string info = Cache.GetCachePreview($"Cache:MaintenanceAlatLaundry_{Session.LoggedInUserId}");
            DarkModeMessageBox.Show(info, "Informasi Cache Maintenance Alat Laundry", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnRefreshDataMaintenance_Click(object sender, EventArgs e)
        {
            Cache.ClearCache($"Cache:MaintenanceAlatLaundry_{Session.LoggedInUserId}");
            LoadDataAlat();
            FormToast toast = new FormToast("Refresh Berhasil", 1500);
            toast.Show();
        }
    }
}