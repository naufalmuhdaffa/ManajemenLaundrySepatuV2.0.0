using ManajemenLaundrySepatu.Helpers;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormHT : BaseForm
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormHT()
        {
            InitializeComponent();
        }

        private void FormHT_Load(object sender, EventArgs e)
        {
            LoadDataTransaksi();

            inputSearchTransaksi._TextChanged += InputSearchTransaksi_TextChanged;
        }

        private void LoadDataTransaksi()
        {
            if (!Session.CekSession()) return;

            string cacheKey = $"Cache:Transaksi_{Session.LoggedInUserId}";

            if (Cache.HasCache(cacheKey))
            {
                DataTable cached = Cache.GetCache(cacheKey) as DataTable;
                if (cached != null)
                {
                    dgvTransaksi.DataSource = cached;
                    dgvTransaksi.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

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
                    using (SqlCommand cmd = new SqlCommand("sp_ReadTransaksi", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);

                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        dgvTransaksi.DataSource = dt;
                        dgvTransaksi.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

                        Cache.SetCache(cacheKey, dt, 300);
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Gagal mengambil data transaksi: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnHapus_Click(object sender, EventArgs e)
        {
            if (!Session.CekSession()) return;

            if (dgvTransaksi.SelectedRows.Count > 0)
            {
                string idTransaksi = dgvTransaksi.SelectedRows[0].Cells["ID Transaksi"].Value.ToString();

                DialogResult result = DarkModeMessageBox.Show("Yakin ingin menghapus transaksi ini? Data akan lenyap selamanya.", "Konfirmasi", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

                if (result == DialogResult.Yes)
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        try
                        {
                            conn.Open();
                            using (SqlCommand cmd = new SqlCommand("sp_DeleteTransaksi", conn))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;

                                cmd.Parameters.AddWithValue("@id_transaksi", idTransaksi);
                                cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);

                                int affected = cmd.ExecuteNonQuery();

                                if (affected > 0)
                                {
                                    DarkModeMessageBox.Show("Transaksi berhasil dihapus!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                    Cache.RemoveCache($"Cache:Transaksi_{Session.LoggedInUserId}");
                                    LoadDataTransaksi();
                                }
                                else
                                {
                                    DarkModeMessageBox.Show("Transaksi nggak ketemu... seriusan?", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            DarkModeMessageBox.Show("Error saat menghapus transaksi: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
            }
            else
            {
                DarkModeMessageBox.Show("Pilih dulu dong baris transaksi yang mau dihapus. Klik di sisi kiri grid-nya ya~", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void SearchDataTransaksi(string keyword)
        {
            if (!Session.CekSession()) return;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("sp_SearchTransaksi", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);
                        if (string.IsNullOrEmpty(keyword))
                            cmd.Parameters.AddWithValue("@keyword", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@keyword", keyword);

                        DataTable dt = new DataTable();
                        new SqlDataAdapter(cmd).Fill(dt);

                        dgvTransaksi.DataSource = dt;
                        dgvTransaksi.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Gagal search transaksi: " + ex.Message,
                                    "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void InputSearchTransaksi_TextChanged(object sender, EventArgs e)
        {
            Cache.ClearCache($"Cache:Transaksi_{Session.LoggedInUserId}");

            string kw = inputSearchTransaksi.Texts.Trim();
            SearchDataTransaksi(string.IsNullOrEmpty(kw) ? null : kw);
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDT form = new FormKDT();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnShowCacheTransaksi_Click(object sender, EventArgs e)
        {
            string info = Cache.GetCachePreview($"Cache:Transaksi_{Session.LoggedInUserId}");
            DarkModeMessageBox.Show(info, "Informasi Cache Transaksi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnRefreshDataTransaksi_Click(object sender, EventArgs e)
        {
            Cache.ClearCache($"Cache:Transaksi_{Session.LoggedInUserId}");
            LoadDataTransaksi();
            FormToast toast = new FormToast("Refresh Berhasil", 1500);
            toast.Show();
        }
    }
}