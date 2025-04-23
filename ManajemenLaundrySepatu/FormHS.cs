using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormHS : Form
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormHS()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void FormHS_Load(object sender, EventArgs e)
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
                    string query = @"
                        SELECT 
                            S.id_sepatu AS [ID Sepatu],
                            S.id_pelanggan AS [ID Pelanggan],
                            P.nama AS [Nama Pelanggan],
                            S.merek AS [Merek],
                            S.jenis AS [Jenis],
                            S.warna AS [Warna],
                            S.ukuran AS [Ukuran]
                        FROM Sepatu S
                        INNER JOIN Pelanggan P ON S.id_pelanggan = P.id_pelanggan";

                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    dgvSepatu.DataSource = dt;
                    dgvSepatu.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Gagal mengambil data sepatu: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnHapus_Click(object sender, EventArgs e)
        {
            if (dgvSepatu.SelectedRows.Count > 0)
            {
                string idSepatu = dgvSepatu.SelectedRows[0].Cells["ID Sepatu"].Value.ToString();

                DialogResult result = MessageBox.Show("Yakin ingin menghapus data sepatu ini?", "Konfirmasi", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

                if (result == DialogResult.Yes)
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        try
                        {
                            conn.Open();
                            string query = "DELETE FROM Sepatu WHERE id_sepatu = @id";
                            SqlCommand cmd = new SqlCommand(query, conn);
                            cmd.Parameters.AddWithValue("@id", idSepatu);
                            int affected = cmd.ExecuteNonQuery();

                            if (affected > 0)
                            {
                                MessageBox.Show("Data sepatu berhasil dihapus!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                LoadDataSepatu();
                            }
                            else
                            {
                                MessageBox.Show("Data sepatu tidak ditemukan!", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            }
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Error saat menghapus data sepatu: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
            }
            else
            {
                MessageBox.Show("Tekan kolom kosong paling kanan untuk memilih sepatu yang ingin dihapus!", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
