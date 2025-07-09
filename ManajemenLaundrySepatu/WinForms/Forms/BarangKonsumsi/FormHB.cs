using ManajemenLaundrySepatu.Helpers;
using ManajemenLaundrySepatu.WinForms.Helpers;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormHB : BaseForm
    {
        private string connectionString = DbConfig.ConnectionString;

        public FormHB()
        {
            InitializeComponent();
        }

        private void FormHB_Load(object sender, EventArgs e)
        {
            LoadDataBarang();

            inputSearchBarang._TextChanged += InputSearchBarang_TextChanged;
        }

        private void LoadDataBarang()
        {
            if (!Session.CekSession()) return;

            string cacheKey = $"Cache:BarangKonsumsi_{Session.LoggedInUserId}";

            if (Cache.HasCache(cacheKey))
            {
                DataTable cached = Cache.GetCache(cacheKey) as DataTable;
                if (cached != null)
                {
                    dgvBarang.DataSource = cached;
                    dgvBarang.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

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
                    using (SqlCommand cmd = new SqlCommand("sp_ReadBarangKonsumsi", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        dgvBarang.DataSource = dt;
                        dgvBarang.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

                        Cache.SetCache(cacheKey, dt, 60);
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Gagal mengambil data barang: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnHapus_Click(object sender, EventArgs e)
        {
            if (!Session.CekSession()) return;

            if (dgvBarang.SelectedRows.Count > 0)
            {
                string idBarang = dgvBarang.SelectedRows[0].Cells["ID Barang"].Value.ToString();

                DialogResult result = DarkModeMessageBox.Show("Yakin mau hapus barang ini? Ga bisa di-undo lho~", "Konfirmasi", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

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
                                    using (SqlCommand cmd = new SqlCommand("sp_DeleteBarangKonsumsi", conn, transaction))
                                    {
                                        cmd.CommandType = CommandType.StoredProcedure;
                                        cmd.Parameters.AddWithValue("@id_barang", idBarang);
                                        cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);

                                        int affected = cmd.ExecuteNonQuery();

                                        if (affected > 0)
                                        {
                                            transaction.Commit();
                                            DarkModeMessageBox.Show("Barang berhasil dihapus, bye-bye~", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                            Cache.RemoveCache($"Cache:BarangKonsumsi_{Session.LoggedInUserId}");
                                            LoadDataBarang();
                                        }
                                        else
                                        {
                                            transaction.Rollback();
                                            DarkModeMessageBox.Show("Barang nggak ditemukan! Kamu yakin pilih yang benar?", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Warning);
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
                            DarkModeMessageBox.Show("Error saat menghapus barang: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }

                }
            }
            else
            {
                DarkModeMessageBox.Show("Klik kotak paling kiri buat pilih barang yang mau dihapus, okay~", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void SearchDataBarangKonsumsi(string keyword)
        {
            if (!Session.CekSession()) return;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("sp_SearchBarangKonsumsi", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);
                        if (string.IsNullOrEmpty(keyword))
                            cmd.Parameters.AddWithValue("@keyword", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@keyword", keyword);

                        DataTable dt = new DataTable();
                        new SqlDataAdapter(cmd).Fill(dt);

                        dgvBarang.DataSource = dt;
                        dgvBarang.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Gagal search barang konsumsi: " + ex.Message,
                                    "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void InputSearchBarang_TextChanged(object sender, EventArgs e)
        {
            Cache.ClearCache($"Cache:BarangKonsumsi_{Session.LoggedInUserId}");

            string kw = inputSearchBarang.Texts.Trim();
            SearchDataBarangKonsumsi(string.IsNullOrEmpty(kw) ? null : kw);
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDB form = new FormKDB();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnShowCacheBarang_Click(object sender, EventArgs e)
        {
            string info = Cache.GetCachePreview($"Cache:BarangKonsumsi_{Session.LoggedInUserId}");
            DarkModeMessageBox.Show(info, "Informasi Cache Barang Konsumsi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnRefreshDataBarang_Click(object sender, EventArgs e)
        {
            Cache.ClearCache($"Cache:BarangKonsumsi_{Session.LoggedInUserId}");
            LoadDataBarang();
            FormToast toast = new FormToast("Refresh Berhasil", 1500);
            toast.Show();
        }
    }
}