using ManajemenLaundrySepatu.Helpers;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormUA : BaseForm
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";
        private string _origNamaAlat, _origDeskripsi;
        private DateTime _origTanggal;

        public FormUA()
        {
            InitializeComponent();
        }

        private void FormUA_Load(object sender, EventArgs e)
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

                        Cache.SetCache(cacheKey, dt, 300);
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Gagal memuat data maintenance: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void dgvAlat_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dgvAlat.Rows[e.RowIndex];

                inputIdAlat.Texts = row.Cells["ID Alat"].Value.ToString();
                inputNamaAlat.Texts = row.Cells["Nama Alat"].Value.ToString();
                inputTanggal.Value = Convert.ToDateTime(row.Cells["Tanggal"].Value);
                inputDeskripsi.Texts = row.Cells["Deskripsi"].Value.ToString();

                _origNamaAlat = inputNamaAlat.Texts;
                _origTanggal = inputTanggal.Value;
                _origDeskripsi = inputDeskripsi.Texts;
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!Session.CekSession()) return;

            if (inputIdAlat.Texts == "" || inputNamaAlat.Texts == "")
            {
                DarkModeMessageBox.Show("Isi semua data dulu ya~", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (inputNamaAlat.Texts.Trim() == _origNamaAlat &&
                inputTanggal.Value.Date == _origTanggal.Date &&
                inputDeskripsi.Texts.Trim() == _origDeskripsi)
            {
                DarkModeMessageBox.Show("Tidak ada perubahan data. Ubah dulu dong~", "Info",
                                MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("sp_UpdateMaintenanceAlatLaundry", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@id_maintenance", inputIdAlat.Texts.Trim());
                        cmd.Parameters.AddWithValue("@nama_alat", inputNamaAlat.Texts.Trim());
                        cmd.Parameters.AddWithValue("@tanggal_maintenance", inputTanggal.Value);
                        cmd.Parameters.AddWithValue("@deskripsi", inputDeskripsi.Texts.Trim());
                        cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            DarkModeMessageBox.Show("Data maintenance berhasil di-update, nice~", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            Cache.ClearCache($"Cache:MaintenanceAlatLaundry_{Session.LoggedInUserId}");
                            LoadDataAlat();
                            ClearInput();
                        }
                        else
                        {
                            DarkModeMessageBox.Show("Gagal update, data ga ketemu atau belum diubah!", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Kesalahan: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
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

        private void ClearInput()
        {
            inputTanggal.Value = DateTime.Now;
            _origTanggal = DateTime.MinValue;
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