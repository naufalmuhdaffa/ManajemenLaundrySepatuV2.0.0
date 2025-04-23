using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormTA : Form
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormTA()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void btnTambahkanA_Click(object sender, EventArgs e)
        {
            string namaAlat = inputNamaAlat.Text.Trim();
            DateTime tanggal = inputTanggal.Value;
            string deskripsi = inputDeskripsi.Text.Trim();

            if (string.IsNullOrEmpty(namaAlat))
            {
                MessageBox.Show("Nama alat nggak boleh kosong, ya!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi) VALUES (@nama, @tanggal, @deskripsi)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@nama", namaAlat);
                        cmd.Parameters.AddWithValue("@tanggal", tanggal);
                        cmd.Parameters.AddWithValue("@deskripsi", deskripsi);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            MessageBox.Show("Data Alat Laundry berhasil ditambahkan~", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            ClearForm();
                        }
                        else
                        {
                            MessageBox.Show("Gagal menambahkan data Alat Laundry.", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
            inputNamaAlat.Clear();
            inputTanggal.Value = DateTime.Now;
            inputDeskripsi.Clear();
            inputNamaAlat.Focus();
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDA form = new FormKDA(); 
            form.Show();
        }
    }
}
