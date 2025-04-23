using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormHT : Form
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormHT()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void FormHT_Load(object sender, EventArgs e)
        {
            LoadDataTransaksi();
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
                    dgvTransaksi.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Gagal mengambil data transaksi: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnHapus_Click(object sender, EventArgs e)
        {
            if (dgvTransaksi.SelectedRows.Count > 0)
            {
                string idTransaksi = dgvTransaksi.SelectedRows[0].Cells["ID Transaksi"].Value.ToString();

                DialogResult result = MessageBox.Show("Yakin ingin menghapus transaksi ini? Data akan lenyap selamanya, loh~", "Konfirmasi", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

                if (result == DialogResult.Yes)
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        try
                        {
                            conn.Open();
                            string query = "DELETE FROM Transaksi WHERE id_transaksi = @id";
                            SqlCommand cmd = new SqlCommand(query, conn);
                            cmd.Parameters.AddWithValue("@id", idTransaksi);
                            int affected = cmd.ExecuteNonQuery();

                            if (affected > 0)
                            {
                                MessageBox.Show("Transaksi berhasil dihapus!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                LoadDataTransaksi();
                            }
                            else
                            {
                                MessageBox.Show("Transaksi nggak ketemu... seriusan?", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            }
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Error saat menghapus transaksi: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
            }
            else
            {
                MessageBox.Show("Pilih dulu dong baris transaksi yang mau dihapus. Klik di sisi kiri grid-nya ya~", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
