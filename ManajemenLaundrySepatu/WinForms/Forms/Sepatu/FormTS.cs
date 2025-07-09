using ManajemenLaundrySepatu.Helpers;
using ManajemenLaundrySepatu.WinForms.Helpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormTS : BaseForm
    {
        private string connectionString = DbConfig.ConnectionString;

        public FormTS()
        {
            InitializeComponent();
        }

        private void FormTS_Shown(object sender, EventArgs e)
        {
            inputIdPelanggan.Focus();
        }

        private void FormTS_Load(object sender, EventArgs e)
        {
            LoadDataPelanggan();

            inputIdPelanggan.DropDownStyle = ComboBoxStyle.DropDown;
            inputIdPelanggan.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            inputIdPelanggan.AutoCompleteSource = AutoCompleteSource.ListItems;
        }

        private void LoadDataPelanggan()
        {
            if (!Session.CekSession()) return;

            int idAkun = Session.LoggedInUserId;
            string cacheKey = $"Cache:Pelanggan_{idAkun}";

            if (Cache.HasCache(cacheKey))
            {
                var cachedData = Cache.GetCache(cacheKey) as Dictionary<string, string>;
                if (cachedData != null)
                {
                    inputIdPelanggan.DataSource = new BindingSource(cachedData, null);
                    inputIdPelanggan.DisplayMember = "Value";
                    inputIdPelanggan.ValueMember = "Key";

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
                        cmd.Parameters.AddWithValue("@id_akun", idAkun);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            Dictionary<string, string> sepatuDict = new Dictionary<string, string>();
                            while (reader.Read())
                            {
                                string id = reader["ID Pelanggan"].ToString();
                                string nama = reader["Nama"].ToString();
                                sepatuDict[id] = $"{id} - {nama}";
                            }

                            Cache.SetCache(cacheKey, sepatuDict, 300);

                            inputIdPelanggan.DataSource = new BindingSource(sepatuDict, null);
                            inputIdPelanggan.DisplayMember = "Value";
                            inputIdPelanggan.ValueMember = "Key";
                        }
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Gagal memuat data pelanggan: " + ex.Message);
                }
            }
        }

        private void inputIdPelanggan_Enter(object sender, EventArgs e)
        {
            try
            {
                if (inputIdPelanggan.Items.Count > 0 && !inputIdPelanggan.DroppedDown)
                {
                    this.BeginInvoke(new Action(() =>
                    {
                        inputIdPelanggan.DroppedDown = true;
                    }));
                }
            }
            catch (Exception ex)
            {
                DarkModeMessageBox.Show("Gagal membuka dropdown: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnTambahkanP_Click(object sender, EventArgs e)
        {
            if (!Session.CekSession()) return;

            string id = ((KeyValuePair<string, string>)inputIdPelanggan.SelectedItem).Key;
            string merek = inputMerek.Texts.Trim();
            string jenis = inputJenis.Texts.Trim();
            string warna = inputWarna.Texts.Trim();
            string ukuran = inputUkuran.Texts.Trim();
            int idAkun = Session.LoggedInUserId;

            if (id == "")
            {
                DarkModeMessageBox.Show("ID Pelanggan wajib diisi!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
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
                            using (SqlCommand cmd = new SqlCommand("sp_CreateSepatu", conn, transaction))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;

                                cmd.Parameters.AddWithValue("@id_pelanggan", id);
                                cmd.Parameters.AddWithValue("@merek", merek);
                                cmd.Parameters.AddWithValue("@jenis", jenis);
                                cmd.Parameters.AddWithValue("@warna", warna);
                                cmd.Parameters.AddWithValue("@ukuran", ukuran);
                                cmd.Parameters.AddWithValue("@id_akun", idAkun);

                                int rowsAffected = cmd.ExecuteNonQuery();
                                if (rowsAffected > 0)
                                {
                                    transaction.Commit();
                                    DarkModeMessageBox.Show("Data sepatu berhasil ditambahkan!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                    ClearForm();
                                    Cache.ClearCache($"Cache:Sepatu_{Session.LoggedInUserId}");
                                }
                                else
                                {
                                    transaction.Rollback();
                                    DarkModeMessageBox.Show("Gagal menambahkan data sepatu.", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
                            DarkModeMessageBox.Show("Terjadi kesalahan tidak terduga saat menambahkan sepatu. Silakan coba lagi atau hubungi admin.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
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

        private void ClearForm()
        {
            inputIdPelanggan.SelectedIndex = -1;
            inputMerek.Clear();
            inputJenis.Clear();
            inputWarna.Clear();
            inputUkuran.Clear();
            inputIdPelanggan.Focus();
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

        private void inputIdPelanggan_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                inputMerek.Focus();
                e.Handled = true;
            }
        }

        private void inputMerek_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                inputJenis.Focus();
                e.Handled = true;
            }
        }

        private void inputJenis_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                inputWarna.Focus();
                e.Handled = true;
            }
        }

        private void inputWarna_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                inputUkuran.Focus();
                e.Handled = true;
            }
        }

        private void inputUkuran_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                btnTambahkanS.PerformClick();
                e.Handled = true;
            }
        }

        private void btnShowCacheSepatu_Click(object sender, EventArgs e)
        {
            string cacheKey = $"Cache:Pelanggan_{Session.LoggedInUserId}";
            string pelangganCache = Cache.GetCachePreview($"Cache:Pelanggan_{Session.LoggedInUserId}");

            string info = "👤 ID Pelanggan: \n" + pelangganCache;
            DarkModeMessageBox.Show(info, "Informasi Cache Sepatu", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnRefreshDataSepatu_Click(object sender, EventArgs e)
        {
            string cacheKey = $"Cache:Pelanggan_{Session.LoggedInUserId}";
            Cache.ClearCache(cacheKey);
            LoadDataPelanggan();
            FormToast toast = new FormToast("Refresh Berhasil", 1500);
            toast.Show();
        }
    }
}