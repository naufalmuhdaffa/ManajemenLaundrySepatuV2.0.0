using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormUS : Form
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormUS()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void FormUS_Load(object sender, EventArgs e)
        {
            LoadDataSepatu();
        }

        private void LoadDataSepatu()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = @"SELECT s.id_sepatu AS [ID Sepatu], 
                                    s.id_pelanggan AS [ID Pelanggan], 
                                    s.merek AS [Merek], 
                                    s.jenis AS [Jenis], 
                                    s.warna AS [Warna], 
                                    s.ukuran AS [Ukuran]
                             FROM Sepatu s";

                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    dgvSepatu.DataSource = dt;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Gagal memuat data sepatu: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }


        private void dgvSepatu_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dgvSepatu.Rows[e.RowIndex];

                inputIdSepatu.Text = row.Cells["ID Sepatu"].Value.ToString();
                inputIdPelanggan.Text = row.Cells["ID Pelanggan"].Value.ToString();
                inputMerek.Text = row.Cells["Merek"].Value.ToString();
                inputJenis.Text = row.Cells["Jenis"].Value.ToString();
                inputWarna.Text = row.Cells["Warna"].Value.ToString();
                inputUkuran.Text = row.Cells["Ukuran"].Value.ToString();

                inputIdSepatu.ReadOnly = true;
                inputIdPelanggan.ReadOnly = true;
            }
        }


        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(inputIdSepatu.Text) || string.IsNullOrWhiteSpace(inputIdPelanggan.Text))
            {
                MessageBox.Show("Isi semua data dulu dong~", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = @"UPDATE Sepatu 
                             SET id_pelanggan = @id_pelanggan, 
                                 merek = @merek, 
                                 jenis = @jenis, 
                                 warna = @warna, 
                                 ukuran = @ukuran 
                             WHERE id_sepatu = @id_sepatu";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@id_sepatu", inputIdSepatu.Text.Trim());
                    cmd.Parameters.AddWithValue("@id_pelanggan", inputIdPelanggan.Text.Trim());
                    cmd.Parameters.AddWithValue("@merek", inputMerek.Text.Trim());
                    cmd.Parameters.AddWithValue("@jenis", inputJenis.Text.Trim());
                    cmd.Parameters.AddWithValue("@warna", inputWarna.Text.Trim());
                    cmd.Parameters.AddWithValue("@ukuran", inputUkuran.Text.Trim());

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Data sepatu berhasil diupdate~", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        LoadDataSepatu();
                    }
                    else
                    {
                        MessageBox.Show("Update gagal, hmm... ID-nya valid nggak sih?", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error saat update: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }


        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDS form = new FormKDS();
            form.Show();
        }
    }
}
