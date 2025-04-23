using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormUT : Form
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormUT()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void FormUT_Load(object sender, EventArgs e)
        {
            LoadDataTransaksi();
            comboStatus.Items.AddRange(new string[] { "Proses", "Selesai", "Dibatalkan" });
        }

        private void LoadDataTransaksi()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = @"SELECT id_transaksi AS [ID Transaksi],
                                            id_pelanggan AS [ID Pelanggan],
                                            id_sepatu AS [ID Sepatu],
                                            total_harga AS [Total Harga],
                                            status AS [Status]
                                     FROM Transaksi";

                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    dgvTransaksi.DataSource = dt;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Gagal memuat data transaksi: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void dgvTransaksi_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dgvTransaksi.Rows[e.RowIndex];

                inputIdTransaksi.Text = row.Cells["ID Transaksi"].Value.ToString();
                inputIdPelanggan.Text = row.Cells["ID Pelanggan"].Value.ToString();
                inputIdSepatu.Text = row.Cells["ID Sepatu"].Value.ToString();
                inputTotalHarga.Text = row.Cells["Total Harga"].Value.ToString();
                comboStatus.SelectedItem = row.Cells["Status"].Value.ToString();

                inputIdTransaksi.ReadOnly = true;
                inputIdPelanggan.ReadOnly = true;
                inputIdSepatu.ReadOnly = true;
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            string idTransaksiText = inputIdTransaksi.Text.Trim();
            string idPelanggan = inputIdPelanggan.Text.Trim();
            string idSepatuText = inputIdSepatu.Text.Trim();
            string totalHargaText = inputTotalHarga.Text.Trim();
            string status = comboStatus.SelectedItem?.ToString();

            if (idTransaksiText == "" || idPelanggan == "" || idSepatuText == "" || totalHargaText == "" || status == null)
            {
                MessageBox.Show("Semua field wajib diisi!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (!int.TryParse(idTransaksiText, out int idTransaksi) || !int.TryParse(idSepatuText, out int idSepatu) || !decimal.TryParse(totalHargaText, out decimal totalHarga))
            {
                MessageBox.Show("ID Transaksi dan ID Sepatu harus berupa angka. Total Harga juga harus valid!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = @"UPDATE Transaksi 
                             SET id_pelanggan = @idPelanggan, 
                                 id_sepatu = @idSepatu, 
                                 total_harga = @totalHarga, 
                                 status = @status 
                             WHERE id_transaksi = @idTransaksi";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@idPelanggan", idPelanggan);
                        cmd.Parameters.AddWithValue("@idSepatu", idSepatu);
                        cmd.Parameters.AddWithValue("@totalHarga", totalHarga);
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@idTransaksi", idTransaksi);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            MessageBox.Show("Transaksi berhasil diperbarui!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            LoadDataTransaksi();
                        }
                        else
                        {
                            MessageBox.Show("Gagal memperbarui transaksi. ID tidak ditemukan.", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Kesalahan: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDT form = new FormKDT();
            form.Show();
        }
    }
}
