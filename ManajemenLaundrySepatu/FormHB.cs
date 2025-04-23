using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormHB : Form
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormHB()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void FormHB_Load(object sender, EventArgs e)
        {
            LoadDataBarang();
        }

        private void LoadDataBarang()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT id_barang AS [ID Barang], nama_barang AS [Nama Barang], jumlah AS [Jumlah], satuan AS [Satuan] FROM Barang_Konsumsi";
                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    dgvBarang.DataSource = dt;
                    dgvBarang.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Gagal mengambil data barang: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnHapus_Click(object sender, EventArgs e)
        {
            if (dgvBarang.SelectedRows.Count > 0)
            {
                string idBarang = dgvBarang.SelectedRows[0].Cells["ID Barang"].Value.ToString();

                DialogResult result = MessageBox.Show("Yakin mau hapus barang ini? Ga bisa di-undo lho~", "Konfirmasi", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

                if (result == DialogResult.Yes)
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        try
                        {
                            conn.Open();
                            string query = "DELETE FROM Barang_Konsumsi WHERE id_barang = @id";
                            SqlCommand cmd = new SqlCommand(query, conn);
                            cmd.Parameters.AddWithValue("@id", idBarang);
                            int affected = cmd.ExecuteNonQuery();

                            if (affected > 0)
                            {
                                MessageBox.Show("Barang berhasil dihapus, bye-bye~", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                LoadDataBarang();
                            }
                            else
                            {
                                MessageBox.Show("Barang nggak ditemukan! Kamu yakin pilih yang benar?", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            }
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Error saat menghapus barang: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
            }
            else
            {
                MessageBox.Show("Klik kotak paling kiri buat pilih barang yang mau dihapus, okay~", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDB form = new FormKDB();
            form.Show();
        }
    }
}
