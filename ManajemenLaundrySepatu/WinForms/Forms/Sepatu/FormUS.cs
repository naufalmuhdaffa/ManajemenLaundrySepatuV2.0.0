using ManajemenLaundrySepatu.Helpers;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormUS : BaseForm
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";
        private string _origMerek, _origJenis, _origWarna, _origUkuran;

        public FormUS()
        {
            InitializeComponent();
        }

        private void FormUS_Load(object sender, EventArgs e)
        {
            LoadDataSepatu();

            inputSearchSepatu._TextChanged += InputSearchSepatu_TextChanged;
        }

        private void LoadDataSepatu()
        {
            if (!Session.CekSession()) return;

            string cacheKey = $"Cache:Sepatu_{Session.LoggedInUserId}";

            if (Cache.HasCache(cacheKey))
            {
                DataTable cached = Cache.GetCache(cacheKey) as DataTable;
                if (cached != null)
                {
                    dgvSepatu.DataSource = cached;
                    dgvSepatu.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

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
                    using (SqlCommand cmd = new SqlCommand("sp_ReadSepatu", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);

                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        dgvSepatu.DataSource = dt;
                        dgvSepatu.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

                        Cache.SetCache(cacheKey, dt, 300);
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Gagal memuat data sepatu: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void dgvSepatu_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dgvSepatu.Rows[e.RowIndex];

                inputIdSepatu.Texts = row.Cells["ID Sepatu"].Value.ToString();
                inputIdPelanggan.Texts = row.Cells["ID Pelanggan"].Value.ToString();
                inputMerek.Texts = row.Cells["Merek"].Value.ToString();
                inputJenis.Texts = row.Cells["Jenis"].Value.ToString();
                inputWarna.Texts = row.Cells["Warna"].Value.ToString();
                inputUkuran.Texts = row.Cells["Ukuran"].Value.ToString();

                inputIdSepatu.ReadOnly = true;
                inputIdPelanggan.ReadOnly = true;

                _origMerek = inputMerek.Texts;
                _origJenis = inputJenis.Texts;
                _origWarna = inputWarna.Texts;
                _origUkuran = inputUkuran.Texts;
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!Session.CekSession()) return;

            if (string.IsNullOrWhiteSpace(inputIdSepatu.Texts) || string.IsNullOrWhiteSpace(inputIdPelanggan.Texts))
            {
                DarkModeMessageBox.Show("Isi semua data dulu dong~", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (inputMerek.Texts.Trim() == _origMerek &&
                inputJenis.Texts.Trim() == _origJenis &&
                inputWarna.Texts.Trim() == _origWarna &&
                inputUkuran.Texts.Trim() == _origUkuran)
            {
                DarkModeMessageBox.Show("Gak ada yang berubah tuh~ Mau nipu aku ya? Hmph!", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("sp_UpdateSepatu", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@id_sepatu", inputIdSepatu.Texts.Trim());
                        cmd.Parameters.AddWithValue("@id_pelanggan", inputIdPelanggan.Texts.Trim());
                        cmd.Parameters.AddWithValue("@merek", inputMerek.Texts.Trim());
                        cmd.Parameters.AddWithValue("@jenis", inputJenis.Texts.Trim());
                        cmd.Parameters.AddWithValue("@warna", inputWarna.Texts.Trim());
                        cmd.Parameters.AddWithValue("@ukuran", inputUkuran.Texts.Trim());
                        cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            DarkModeMessageBox.Show("Data sepatu berhasil diupdate~", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            Cache.ClearCache($"Cache:Sepatu_{Session.LoggedInUserId}");
                            LoadDataSepatu();
                        }
                        else
                        {
                            DarkModeMessageBox.Show("Update gagal, hmm... ID-nya valid nggak sih?", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Error saat update: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void SearchDataSepatu(string keyword)
        {
            if (!Session.CekSession()) return;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("sp_SearchSepatu", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);
                        if (string.IsNullOrEmpty(keyword))
                            cmd.Parameters.AddWithValue("@keyword", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@keyword", keyword);

                        DataTable dt = new DataTable();
                        new SqlDataAdapter(cmd).Fill(dt);

                        dgvSepatu.DataSource = dt;
                        dgvSepatu.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Gagal search sepatu: " + ex.Message,
                                    "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void InputSearchSepatu_TextChanged(object sender, EventArgs e)
        {
            Cache.ClearCache($"Cache:Sepatu_{Session.LoggedInUserId}");

            string kw = inputSearchSepatu.Texts.Trim();
            SearchDataSepatu(string.IsNullOrEmpty(kw) ? null : kw);
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDS form = new FormKDS();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnShowCacheSepatu_Click(object sender, EventArgs e)
        {
            string cacheKey = $"Cache:Sepatu_{Session.LoggedInUserId}";
            string info = Cache.GetCachePreview(cacheKey);
            DarkModeMessageBox.Show(info, "Informasi Cache Sepatu", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnRefreshDataSepatu_Click(object sender, EventArgs e)
        {
            string cacheKey = $"Cache:Sepatu_{Session.LoggedInUserId}";
            Cache.ClearCache(cacheKey);
            LoadDataSepatu();
            FormToast toast = new FormToast("Refresh Berhasil", 1500);
            toast.Show();
        }
    }
}