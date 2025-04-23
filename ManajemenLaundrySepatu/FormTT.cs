using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormTT : Form
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormTT()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void FormTT_Load(object sender, EventArgs e)
        {
            comboStatus.Items.AddRange(new string[] { "Proses", "Selesai", "Dibatalkan" });
            LoadComboBoxData();
        }

        private void LoadComboBoxData()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    
                    string queryPelanggan = "SELECT id_pelanggan, nama FROM Pelanggan";
                    using (SqlCommand cmd = new SqlCommand(queryPelanggan, conn))
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        Dictionary<string, string> pelangganDict = new Dictionary<string, string>();
                        while (reader.Read())
                        {
                            string id = reader["id_pelanggan"].ToString();
                            string nama = reader["nama"].ToString();
                            pelangganDict[id] = $"{id} - {nama}";
                        }

                        inputIdPelanggan.DataSource = new BindingSource(pelangganDict, null);
                        inputIdPelanggan.DisplayMember = "Value";
                        inputIdPelanggan.ValueMember = "Key";
                    }

                    
                    string querySepatu = "SELECT id_sepatu, merek FROM Sepatu";
                    using (SqlCommand cmd = new SqlCommand(querySepatu, conn))
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        Dictionary<int, string> sepatuDict = new Dictionary<int, string>();
                        while (reader.Read())
                        {
                            int id = Convert.ToInt32(reader["id_sepatu"]);
                            string merek = reader["merek"].ToString();
                            sepatuDict[id] = $"{id} - {merek}";
                        }

                        inputIdSepatu.DataSource = new BindingSource(sepatuDict, null);
                        inputIdSepatu.DisplayMember = "Value";
                        inputIdSepatu.ValueMember = "Key";
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Gagal memuat data: " + ex.Message);
                }
            }
        }


        private void btnTambahkanT_Click(object sender, EventArgs e)
        {
            string idPelanggan = ((KeyValuePair<string, string>)inputIdPelanggan.SelectedItem).Key;
            int idSepatu = ((KeyValuePair<int, string>)inputIdSepatu.SelectedItem).Key;
            string totalHargaText = inputTotalHarga.Text.Trim();
            string status = comboStatus.SelectedItem?.ToString();

            if (inputIdPelanggan.SelectedItem == null || inputIdSepatu.SelectedItem == null ||
    string.IsNullOrWhiteSpace(inputTotalHarga.Text) || comboStatus.SelectedItem == null)
            {
                MessageBox.Show("Semua field wajib diisi!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (!decimal.TryParse(inputTotalHarga.Text.Trim(), out decimal totalHarga))
            {
                MessageBox.Show("Total Harga harus berupa angka!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status) VALUES (@idPelanggan, @idSepatu, @totalHarga, @status)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@idPelanggan", idPelanggan);
                        cmd.Parameters.AddWithValue("@idSepatu", idSepatu);
                        cmd.Parameters.AddWithValue("@totalHarga", totalHarga);
                        cmd.Parameters.AddWithValue("@status", status);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            MessageBox.Show("Transaksi berhasil ditambahkan!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            ClearForm();
                        }
                        else
                        {
                            MessageBox.Show("Gagal menambahkan transaksi.", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Kesalahan: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
        }
    }
}
