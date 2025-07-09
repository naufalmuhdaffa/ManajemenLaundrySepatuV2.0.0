using ManajemenLaundrySepatu.Helpers;
using ManajemenLaundrySepatu.WinForms.Helpers;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormHS : BaseForm
    {
        private string connectionString = DbConfig.ConnectionString;

        public FormHS()
        {
            InitializeComponent();
        }

        private void FormHS_Load(object sender, EventArgs e)
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
                    DarkModeMessageBox.Show("Gagal mengambil data sepatu: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnHapus_Click(object sender, EventArgs e)
        {
            if (!Session.CekSession()) return;

            if (dgvSepatu.SelectedRows.Count > 0)
            {
                string idSepatu = dgvSepatu.SelectedRows[0].Cells["ID Sepatu"].Value.ToString();

                DialogResult result = DarkModeMessageBox.Show("Yakin ingin menghapus data sepatu ini?", "Konfirmasi", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

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
                                    using (SqlCommand cmd = new SqlCommand("sp_DeleteSepatu", conn, transaction))
                                    {
                                        cmd.CommandType = CommandType.StoredProcedure;
                                        cmd.Parameters.AddWithValue("@id_sepatu", idSepatu);
                                        cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);

                                        int affected = cmd.ExecuteNonQuery();

                                        if (affected > 0)
                                        {
                                            transaction.Commit();
                                            DarkModeMessageBox.Show("Data sepatu berhasil dihapus!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                            Cache.ClearCache($"Cache:Sepatu_{Session.LoggedInUserId}");
                                            LoadDataSepatu();
                                        }
                                        else
                                        {
                                            transaction.Rollback();
                                            DarkModeMessageBox.Show("Data sepatu tidak ditemukan!", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Warning);
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
                            DarkModeMessageBox.Show("Error saat menghapus data sepatu: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
            }
            else
            {
                DarkModeMessageBox.Show("Tekan kolom kosong paling kiri untuk memilih sepatu yang ingin dihapus!", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
            string info = Cache.GetCachePreview($"Cache:Sepatu_{Session.LoggedInUserId}");
            DarkModeMessageBox.Show(info, "Informasi Cache Sepatu", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnRefreshDataSepatu_Click(object sender, EventArgs e)
        {
            Cache.ClearCache($"Cache:Sepatu_{Session.LoggedInUserId}");
            LoadDataSepatu();
            FormToast toast = new FormToast("Refresh Berhasil", 1500);
            toast.Show();
        }
    }
}