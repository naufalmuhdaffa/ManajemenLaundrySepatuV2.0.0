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
    public partial class FormTP : Form
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormTP()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void btnTambahkanP_Click(object sender, EventArgs e)
        {
            string id = inputIdPelanggan.Text.Trim();
            string nama = inputNamaPelanggan.Text.Trim();
            string noHp = inputNoHP.Text.Trim();
            string alamat = inputAlamat.Text.Trim();

            if (id == "" || nama == "" || noHp == "")
            {
                MessageBox.Show("ID Pelanggan, Nama, dan No HP wajib diisi!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat) VALUES (@id, @nama, @noHp, @alamat)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@nama", nama);
                        cmd.Parameters.AddWithValue("@noHp", noHp);
                        cmd.Parameters.AddWithValue("@alamat", alamat);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            MessageBox.Show("Data pelanggan berhasil ditambahkan!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            ClearForm();
                        }
                        else
                        {
                            MessageBox.Show("Gagal menambahkan data pelanggan.", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
            inputIdPelanggan.Clear();
            inputNamaPelanggan.Clear();
            inputNoHP.Clear();
            inputAlamat.Clear();
            inputIdPelanggan.Focus();
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDP form = new FormKDP();
            form.Show();
        }
    }
}
