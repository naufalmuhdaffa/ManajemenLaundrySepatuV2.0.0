using ManajemenLaundrySepatu.Helpers;
using ManajemenLaundrySepatu.WinForms.Helpers;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormUP : BaseForm
    {
        private string connectionString = DbConfig.ConnectionString;
        private string _origNama, _origNoHP, _origAlamat;

        public FormUP()
        {
            InitializeComponent();
        }

        private void FormUP_Load(object sender, EventArgs e)
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

                        Cache.SetCache($"Cache:Pelanggan_{Session.LoggedInUserId}", dt, 300);
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Gagal memuat data pelanggan: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void dgvPelanggan_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dgvPelanggan.Rows[e.RowIndex];

                inputIdPelanggan.Texts = row.Cells["ID Pelanggan"].Value.ToString();
                inputNamaPelanggan.Texts = row.Cells["Nama"].Value.ToString();
                inputNoHP.Texts = row.Cells["No HP"].Value.ToString();
                inputAlamat.Texts = row.Cells["Alamat"].Value.ToString();

                inputIdPelanggan.ReadOnly = true;

                _origNama = inputNamaPelanggan.Texts;
                _origNoHP = inputNoHP.Texts;
                _origAlamat = inputAlamat.Texts;
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!Session.CekSession()) return;

            string id = inputIdPelanggan.Texts.Trim();
            string nama = inputNamaPelanggan.Texts.Trim();
            string noHp = inputNoHP.Texts.Trim();
            string alamat = inputAlamat.Texts.Trim();

            if (id.Length > 4)
            {
                DarkModeMessageBox.Show("Panjang ID Pelanggan Maksimal 4 karakter", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                inputIdPelanggan.Focus();
                return;
            }

            if (nama.Length > 100)
            {
                DarkModeMessageBox.Show("Panjang Nama Pelanggan Maksimal 100 karakter", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                inputNamaPelanggan.Focus();
                return;
            }

            if (noHp.Length > 13)
            {
                DarkModeMessageBox.Show("Panjang No HP Pelanggan Maksimal 13 karakter", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                inputNoHP.Focus();
                return;
            }

            if (alamat.Length > 100)
            {
                DarkModeMessageBox.Show("Panjang Alamat Pelanggan Maksimal 100 karakter", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                inputAlamat.Focus();
                return;
            }

            if (inputIdPelanggan.Texts == "" || inputNamaPelanggan.Texts == "" || inputNoHP.Texts == "")
            {
                DarkModeMessageBox.Show("Isi data yang diperlukan dulu dong~", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (inputNamaPelanggan.Texts.Trim() == _origNama &&
                inputNoHP.Texts.Trim() == _origNoHP &&
                inputAlamat.Texts.Trim() == _origAlamat)
            {
                DarkModeMessageBox.Show("Tidak ada data yang berubah, ubah datanya dulu dong! hmph…", "Info",
                                MessageBoxButtons.OK, MessageBoxIcon.Information);
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
                            using (SqlCommand cmd = new SqlCommand("sp_UpdatePelanggan", conn, transaction))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;

                                cmd.Parameters.AddWithValue("@id_pelanggan", inputIdPelanggan.Texts.Trim());
                                cmd.Parameters.AddWithValue("@nama", inputNamaPelanggan.Texts.Trim());
                                cmd.Parameters.AddWithValue("@no_hp", inputNoHP.Texts.Trim());
                                cmd.Parameters.AddWithValue("@alamat", inputAlamat.Texts.Trim());
                                cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);

                                int rowsAffected = cmd.ExecuteNonQuery();

                                if (rowsAffected > 0)
                                {
                                    transaction.Commit();
                                    DarkModeMessageBox.Show("Data berhasil diupdate, mantap~", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                    Cache.ClearCache($"Cache:Pelanggan_{Session.LoggedInUserId}");
                                    LoadDataPelanggan();
                                }
                                else
                                {
                                    transaction.Rollback();
                                    DarkModeMessageBox.Show("Update gagal, coba periksa ID-nya!", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                                }
                            }
                        }
                        catch (SqlException sqlEx)
                        {
                            transaction.Rollback();
                            string friendly = SqlErrorHandler.GetFriendlyErrorMessage(sqlEx);
                            DarkModeMessageBox.Show(friendly, "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                        catch (Exception)
                        {
                            transaction.Rollback();
                            DarkModeMessageBox.Show("Terjadi kesalahan tidak terduga saat mengupdate pelanggan. Silakan coba lagi atau hubungi admin.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
                catch (SqlException sqlEx)
                {
                    string friendly = SqlErrorHandler.GetFriendlyErrorMessage(sqlEx);
                    DarkModeMessageBox.Show(friendly, "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                catch (Exception)
                {
                    DarkModeMessageBox.Show("Tidak dapat terhubung ke database. Silakan periksa koneksi atau hubungi admin.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
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