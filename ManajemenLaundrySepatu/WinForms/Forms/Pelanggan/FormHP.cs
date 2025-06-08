using ManajemenLaundrySepatu.Helpers;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormHP : BaseForm
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormHP()
        {
            InitializeComponent();
        }

        private void FormHP_Load(object sender, EventArgs e)
        {
            LoadDataPelanggan();

            inputSearchPelanggan._TextChanged += InputSearchPelanggan_TextChanged;
        }

        private void LoadDataPelanggan()
        {
            if (!Session.CekSession()) return;

            string cacheKey = $"Cache:Pelanggan_{Session.LoggedInUserId}";

            if (Cache.HasCache(cacheKey))
            {
                DataTable cached = Cache.GetCache(cacheKey) as DataTable;
                if (cached != null)
                {
                    dgvPelanggan.DataSource = cached;
                    dgvPelanggan.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

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
                    using (SqlCommand cmd = new SqlCommand("sp_ReadPelanggan", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);

                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        dgvPelanggan.DataSource = dt;
                        dgvPelanggan.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

                        Cache.SetCache(cacheKey, dt, 300);
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Gagal memuat data pelanggan: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnHapus_Click(object sender, EventArgs e)
        {
            if (!Session.CekSession()) return;

            if (dgvPelanggan.SelectedRows.Count > 0)
            {
                string idPelanggan = dgvPelanggan.SelectedRows[0].Cells["ID Pelanggan"].Value.ToString();

                DialogResult result = DarkModeMessageBox.Show("Yakin ingin menghapus pelanggan ini?", "Konfirmasi", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

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
                                    using (SqlCommand cmd = new SqlCommand("sp_DeletePelanggan", conn, transaction))
                                    {
                                        cmd.CommandType = CommandType.StoredProcedure;
                                        cmd.Parameters.AddWithValue("@id_pelanggan", idPelanggan);
                                        cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);

                                        int affected = cmd.ExecuteNonQuery();

                                        if (affected > 0)
                                        {
                                            transaction.Commit();
                                            DarkModeMessageBox.Show("Data pelanggan berhasil dihapus!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                            Cache.ClearCache($"Cache:Pelanggan_{Session.LoggedInUserId}");
                                            LoadDataPelanggan();
                                        }
                                        else
                                        {
                                            transaction.Rollback();
                                            DarkModeMessageBox.Show("Data pelanggan tidak ditemukan!", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Warning);
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
                            DarkModeMessageBox.Show("Error saat menghapus pelanggan: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
            }
            else
            {
                DarkModeMessageBox.Show("Tekan kolom kosong paling kiri untuk memilih baris yang ingin dihapus!", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void SearchDataPelanggan(string keyword)
        {
            if (!Session.CekSession()) return;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("sp_SearchPelanggan", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);
                    if (string.IsNullOrEmpty(keyword))
                        cmd.Parameters.AddWithValue("@keyword", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@keyword", keyword);

                    DataTable dt = new DataTable();
                    new SqlDataAdapter(cmd).Fill(dt);

                    dgvPelanggan.DataSource = dt;
                    dgvPelanggan.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                }
            }
        }

        private void InputSearchPelanggan_TextChanged(object sender, EventArgs e)
        {
            Cache.ClearCache($"Cache:Pelanggan_{Session.LoggedInUserId}");

            string kw = inputSearchPelanggan.Texts.Trim();
            SearchDataPelanggan(string.IsNullOrEmpty(kw) ? null : kw);
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDP form = new FormKDP();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnShowCachePelanggan_Click(object sender, EventArgs e)
        {
            string info = Cache.GetCachePreview($"Cache:Pelanggan_{Session.LoggedInUserId}");
            DarkModeMessageBox.Show(info, "Informasi Cache Pelanggan", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnRefreshDataPelanggan_Click(object sender, EventArgs e)
        {
            Cache.ClearCache($"Cache:Pelanggan_{Session.LoggedInUserId}");
            LoadDataPelanggan();
            FormToast toast = new FormToast("Refresh Berhasil", 1500);
            toast.Show();
        }
    }
}