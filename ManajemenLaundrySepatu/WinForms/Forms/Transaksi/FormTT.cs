using ManajemenLaundrySepatu.Helpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormTT : BaseForm
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormTT()
        {
            InitializeComponent();
        }

        private void FormTT_Shown(object sender, EventArgs e)
        {
            inputIdPelanggan.Focus();
        }

        private void FormTT_Load(object sender, EventArgs e)
        {
            comboStatus.Items.AddRange(new string[] { "Proses", "Selesai", "Dibatalkan" });
            LoadComboBoxData();
            inputIdPelanggan.DropDownStyle = ComboBoxStyle.DropDown;
            inputIdPelanggan.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            inputIdPelanggan.AutoCompleteSource = AutoCompleteSource.ListItems;
            inputIdSepatu.DropDownStyle = ComboBoxStyle.DropDown;
            inputIdSepatu.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            inputIdSepatu.AutoCompleteSource = AutoCompleteSource.ListItems;
            comboStatus.DropDownStyle = ComboBoxStyle.DropDown;
            comboStatus.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            comboStatus.AutoCompleteSource = AutoCompleteSource.ListItems;
        }

        private void LoadComboBoxData()
        {
            if (!Session.CekSession()) return;

            int idAkun = Session.LoggedInUserId;
            string cachePelangganKey = $"Cache:Pelanggan_{idAkun}";
            string cacheSepatuKey = $"Cache:Sepatu_{idAkun}";

            if (Cache.HasCache(cachePelangganKey))
            {
                var cachedPelanggan = Cache.GetCache(cachePelangganKey) as Dictionary<string, string>;
                if (cachedPelanggan != null)
                {
                    inputIdPelanggan.DataSource = new BindingSource(cachedPelanggan, null);
                    inputIdPelanggan.DisplayMember = "Value";
                    inputIdPelanggan.ValueMember = "Key";

                    DateTime lastUpdate = Cache.GetLastUpdate(cachePelangganKey);
                    new FormToast($"Data Pelanggan di-load dari cache\nTerakhir update: {lastUpdate}").Show();
                }
            }
            else
            {
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
                                Dictionary<string, string> pelangganDict = new Dictionary<string, string>();
                                while (reader.Read())
                                {
                                    string id = reader["ID Pelanggan"].ToString();
                                    string nama = reader["Nama"].ToString();
                                    pelangganDict[id] = $"{id} - {nama}";
                                }

                                inputIdPelanggan.DataSource = new BindingSource(pelangganDict, null);
                                inputIdPelanggan.DisplayMember = "Value";
                                inputIdPelanggan.ValueMember = "Key";

                                Cache.SetCache(cachePelangganKey, pelangganDict, 300);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        DarkModeMessageBox.Show("Gagal memuat data pelanggan: " + ex.Message);
                    }
                }
            }

            if (Cache.HasCache(cacheSepatuKey))
            {
                var cachedSepatu = Cache.GetCache(cacheSepatuKey) as Dictionary<int, string>;
                if (cachedSepatu != null)
                {
                    inputIdSepatu.DataSource = new BindingSource(cachedSepatu, null);
                    inputIdSepatu.DisplayMember = "Value";
                    inputIdSepatu.ValueMember = "Key";

                    DateTime lastUpdate = Cache.GetLastUpdate(cacheSepatuKey);
                    new FormToast($"Data Sepatu di-load dari cache\nTerakhir update: {lastUpdate}").Show();
                }
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    try
                    {
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand("sp_ReadSepatu", conn))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@id_akun", idAkun);

                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                Dictionary<int, string> sepatuDict = new Dictionary<int, string>();
                                while (reader.Read())
                                {
                                    int id = Convert.ToInt32(reader["ID Sepatu"]);
                                    string merek = reader["Merek"].ToString();
                                    sepatuDict[id] = $"{id} - {merek}";
                                }

                                inputIdSepatu.DataSource = new BindingSource(sepatuDict, null);
                                inputIdSepatu.DisplayMember = "Value";
                                inputIdSepatu.ValueMember = "Key";

                                Cache.SetCache(cacheSepatuKey, sepatuDict, 300);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        DarkModeMessageBox.Show("Gagal memuat data sepatu: " + ex.Message);
                    }
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

        private void inputIdSepatu_Enter(object sender, EventArgs e)
        {
            try
            {
                if (inputIdSepatu.Items.Count > 0 && !inputIdSepatu.DroppedDown)
                {
                    this.BeginInvoke(new Action(() =>
                    {
                        inputIdSepatu.DroppedDown = true;
                    }));
                }
            }
            catch (Exception ex)
            {
                DarkModeMessageBox.Show("Gagal membuka dropdown: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void comboStatus_Enter(object sender, EventArgs e)
        {
            try
            {
                if (comboStatus.Items.Count > 0 && !comboStatus.DroppedDown)
                {
                    this.BeginInvoke(new Action(() =>
                    {
                        comboStatus.DroppedDown = true;
                    }));
                }
            }
            catch (Exception ex)
            {
                DarkModeMessageBox.Show("Gagal membuka dropdown: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnTambahkanT_Click(object sender, EventArgs e)
        {
            string idPelanggan = ((KeyValuePair<string, string>)inputIdPelanggan.SelectedItem).Key;
            int idSepatu = ((KeyValuePair<int, string>)inputIdSepatu.SelectedItem).Key;
            string status = comboStatus.SelectedItem?.ToString();
            int idAkun = Session.LoggedInUserId;

            if (inputIdPelanggan.SelectedItem == null || inputIdSepatu.SelectedItem == null ||
            string.IsNullOrWhiteSpace(inputTotalHarga.Texts) || comboStatus.SelectedItem == null)
            {
                DarkModeMessageBox.Show("Semua field wajib diisi!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (!decimal.TryParse(inputTotalHarga.Texts.Trim(), out decimal totalHarga))
            {
                DarkModeMessageBox.Show("Total Harga harus berupa angka!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("sp_CreateTransaksi", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@id_pelanggan", idPelanggan);
                        cmd.Parameters.AddWithValue("@id_sepatu", idSepatu);
                        cmd.Parameters.AddWithValue("@total_harga", totalHarga);
                        cmd.Parameters.AddWithValue("@status_transaksi", status);
                        cmd.Parameters.AddWithValue("@id_akun", idAkun);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            DarkModeMessageBox.Show("Transaksi berhasil ditambahkan!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            ClearForm();
                            Cache.ClearCache($"Cache:Transaksi_{Session.LoggedInUserId}");
                        }
                        else
                        {
                            DarkModeMessageBox.Show("Gagal menambahkan transaksi.", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Kesalahan: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void ClearForm()
        {
            inputIdPelanggan.SelectedIndex = -1;
            inputIdSepatu.SelectedIndex = -1;
            inputTotalHarga.Clear();
            comboStatus.SelectedIndex = -1;
            inputIdPelanggan.Focus();
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

        private void inputIdPelanggan_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                inputIdSepatu.Focus();
                e.Handled = true;
            }
        }

        private void inputIdSepatu_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                inputTotalHarga.Focus();
                e.Handled = true;
            }
        }

        private void inputTotalHarga_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                comboStatus.Focus();
                e.Handled = true;
            }
        }

        private void comboStatus_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                btnTambahkanT.PerformClick();
                e.Handled = true;
            }
        }

        private void btnShowCacheTransaksi_Click(object sender, EventArgs e)
        {
            int idAkun = Session.LoggedInUserId;

            string sepatuCache = Cache.GetCachePreview($"Cache:Sepatu_{idAkun}");
            string pelangganCache = Cache.GetCachePreview($"Cache:Pelanggan_{idAkun}");

            string info = "👤 ID Pelanggan:\n" + pelangganCache +
                          "\n\n📦 ID Sepatu:\n" + sepatuCache;

            DarkModeMessageBox.Show(info, "Informasi Cache Transaksi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnRefreshDataTransaksi_Click(object sender, EventArgs e)
        {
            int idAkun = Session.LoggedInUserId;

            Cache.ClearCache($"Cache:Sepatu_{idAkun}");
            Cache.ClearCache($"Cache:Pelanggan_{idAkun}");

            LoadComboBoxData();

            FormToast toast = new FormToast("Refresh Berhasil", 1500);
            toast.Show();
        }
    }
}