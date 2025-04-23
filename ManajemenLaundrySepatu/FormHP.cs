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
    public partial class FormHP: Form
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";
        public FormHP()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void FormHP_Load(object sender, EventArgs e)
        {
            LoadDataPelanggan();
        }

        private void LoadDataPelanggan()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT id_pelanggan AS [ID Pelanggan], nama AS [Nama], no_hp AS [No HP], alamat AS [Alamat] FROM Pelanggan";
                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    dgvPelanggan.DataSource = dt;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Gagal mengambil data pelanggan: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnHapus_Click(object sender, EventArgs e)
        {
            if (dgvPelanggan.SelectedRows.Count > 0)
            {
                string idPelanggan = dgvPelanggan.SelectedRows[0].Cells["ID Pelanggan"].Value.ToString();

                DialogResult result = MessageBox.Show("Yakin ingin menghapus pelanggan ini?", "Konfirmasi", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

                if (result == DialogResult.Yes)
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        try
                        {
                            conn.Open();
                            string query = "DELETE FROM Pelanggan WHERE id_pelanggan = @id";
                            SqlCommand cmd = new SqlCommand(query, conn);
                            cmd.Parameters.AddWithValue("@id", idPelanggan);
                            int affected = cmd.ExecuteNonQuery();

                            if (affected > 0)
                            {
                                MessageBox.Show("Data pelanggan berhasil dihapus!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                LoadDataPelanggan();
                            }
                            else
                            {
                                MessageBox.Show("Data pelanggan tidak ditemukan!", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            }
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Error saat menghapus pelanggan: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
            }
            else
            {
                MessageBox.Show("Tekan kolom kosong paling kiri untuk memilih baris yang ingin dihapus!", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDP form = new FormKDP();
            form.Show();
        }
    }
}
