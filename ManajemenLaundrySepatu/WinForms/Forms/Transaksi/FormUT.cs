using ManajemenLaundrySepatu.Helpers;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormUT : BaseForm
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";
        private decimal _origTotalHarga;
        private string _origStatus;

        public FormUT()
        {
            InitializeComponent();
        }

        private void FormUT_Load(object sender, EventArgs e)
        {
            LoadDataTransaksi();
            comboStatus.Items.AddRange(new string[] { "Proses", "Selesai", "Dibatalkan" });

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
                    DarkModeMessageBox.Show("Gagal memuat data transaksi: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void dgvTransaksi_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dgvTransaksi.Rows[e.RowIndex];

                inputIdTransaksi.Texts = row.Cells["ID Transaksi"].Value.ToString();
                inputIdPelanggan.Texts = row.Cells["ID Pelanggan"].Value.ToString();
                inputIdSepatu.Texts = row.Cells["ID Sepatu"].Value.ToString();
                inputTotalHarga.Texts = row.Cells["Total Harga"].Value.ToString();
                comboStatus.SelectedItem = row.Cells["Status"].Value.ToString();

                inputIdTransaksi.ReadOnly = true;
                inputIdPelanggan.ReadOnly = true;
                inputIdSepatu.ReadOnly = true;

                _origTotalHarga = Convert.ToDecimal(row.Cells["Total Harga"].Value);
                _origStatus = row.Cells["Status"].Value.ToString();
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!Session.CekSession()) return;

            string idTransaksiText = inputIdTransaksi.Texts.Trim();
            string idPelanggan = inputIdPelanggan.Texts.Trim();
            string idSepatuText = inputIdSepatu.Texts.Trim();
            string totalHargaText = inputTotalHarga.Texts.Trim();
            string status = comboStatus.SelectedItem?.ToString();
            int idAkun = Session.LoggedInUserId;

            if (idTransaksiText == "" || idPelanggan == "" || idSepatuText == "" || totalHargaText == "" || status == null)
            {
                DarkModeMessageBox.Show("Semua field wajib diisi!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (!int.TryParse(idTransaksiText, out int idTransaksi) || !int.TryParse(idSepatuText, out int idSepatu) || !decimal.TryParse(totalHargaText, out decimal totalHarga))
            {
                DarkModeMessageBox.Show("ID Transaksi dan ID Sepatu harus berupa angka. Total Harga juga harus valid!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (Math.Round(_origTotalHarga, 2) == Math.Round(totalHarga, 2) &&
    string.Equals(_origStatus?.Trim(), status?.Trim(), StringComparison.OrdinalIgnoreCase))
            {
                DarkModeMessageBox.Show("Nggak ada yang berubah... Mau update apa coba? Hmph~", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlTransaction transaction = conn.BeginTransaction())
                    {
                        try
                        {
                            using (SqlCommand cmd = new SqlCommand("sp_UpdateTransaksi", conn, transaction))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;

                                cmd.Parameters.AddWithValue("@id_transaksi", idTransaksi);
                                cmd.Parameters.AddWithValue("@id_pelanggan", idPelanggan);
                                cmd.Parameters.AddWithValue("@id_sepatu", idSepatu);
                                cmd.Parameters.AddWithValue("@total_harga", totalHarga);
                                cmd.Parameters.AddWithValue("@status_transaksi", status);
                                cmd.Parameters.AddWithValue("@id_akun", idAkun);

                                int rowsAffected = cmd.ExecuteNonQuery();
                                if (rowsAffected > 0)
                                {
                                    transaction.Commit();
                                    DarkModeMessageBox.Show("Transaksi berhasil diperbarui!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                    Cache.RemoveCache($"Cache:Transaksi_{idAkun}");
                                    LoadDataTransaksi();
                                }
                                else
                                {
                                    transaction.Rollback();
                                    DarkModeMessageBox.Show("Gagal memperbarui transaksi. ID tidak ditemukan.", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
                    DarkModeMessageBox.Show("Kesalahan: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
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