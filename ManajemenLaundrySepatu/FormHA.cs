using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormHA : Form
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormHA()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void FormHapusMaintenance_Load(object sender, EventArgs e)
        {
            LoadDataAlat();
        }

        private void LoadDataAlat()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT id_maintenance AS [ID], nama_alat AS [Nama Alat], tanggal_maintenance AS [Tanggal], deskripsi AS [Deskripsi] FROM Maintenance_Alat_Laundry";
                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    dgvAlat.DataSource = dt;
                    dgvAlat.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Gagal memuat data alat: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnHapus_Click(object sender, EventArgs e)
        {
            if (dgvAlat.SelectedRows.Count > 0)
            {
                string idAlat = dgvAlat.SelectedRows[0].Cells["ID"].Value.ToString();

                DialogResult result = MessageBox.Show("Yakin mau menghapus data alat ini? 💥", "Konfirmasi", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

                if (result == DialogResult.Yes)
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        try
                        {
                            conn.Open();
                            string query = "DELETE FROM Maintenance_Alat_Laundry WHERE id_maintenance = @id";
                            SqlCommand cmd = new SqlCommand(query, conn);
                            cmd.Parameters.AddWithValue("@id", idAlat);

                            int affected = cmd.ExecuteNonQuery();

                            if (affected > 0)
                            {
                                MessageBox.Show("Data alat berhasil dihapus! 🧹", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                LoadDataAlat();
                            }
                            else
                            {
                                MessageBox.Show("Data nggak ketemu... kamu yakin pilih barisnya?", "Oops", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            }
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Kesalahan saat hapus data: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
            }
            else
            {
                MessageBox.Show("Klik di sisi kiri baris alat yang mau dihapus dulu dong~", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDA form = new FormKDA(); // form utama alat dan barang
            form.Show();
        }
    }
}
