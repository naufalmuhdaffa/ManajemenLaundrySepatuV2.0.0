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
    public partial class FormUP: Form
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormUP()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void FormUP_Load(object sender, EventArgs e)
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
                    MessageBox.Show("Gagal memuat data pelanggan: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void dgvPelanggan_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dgvPelanggan.Rows[e.RowIndex];

                inputIdPelanggan.Text = row.Cells["ID Pelanggan"].Value.ToString();
                inputNamaPelanggan.Text = row.Cells["Nama"].Value.ToString();
                inputNoHP.Text = row.Cells["No HP"].Value.ToString();
                inputAlamat.Text = row.Cells["Alamat"].Value.ToString();

                inputIdPelanggan.ReadOnly = true;
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (inputIdPelanggan.Text == "" || inputNamaPelanggan.Text == "" || inputNoHP.Text == "")
            {
                MessageBox.Show("Isi data yang diperlukan dulu dong~", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "UPDATE Pelanggan SET nama = @nama, no_hp = @no_hp, alamat = @alamat WHERE id_pelanggan = @id";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@id", inputIdPelanggan.Text.Trim());
                    cmd.Parameters.AddWithValue("@nama", inputNamaPelanggan.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_hp", inputNoHP.Text.Trim());
                    cmd.Parameters.AddWithValue("@alamat", inputAlamat.Text.Trim());

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Data berhasil diupdate, mantap~", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        LoadDataPelanggan();
                    }
                    else
                    {
                        MessageBox.Show("Update gagal, coba periksa ID-nya!", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error update data: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
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
