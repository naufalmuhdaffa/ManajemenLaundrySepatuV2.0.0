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
    public partial class FormTS: Form
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";
        public FormTS()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }


        private void FormTS_Load(object sender, EventArgs e)
        {
            LoadPelanggan();
        }

        private void LoadPelanggan()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT id_pelanggan, nama FROM Pelanggan";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        Dictionary<string, string> pelangganDict = new Dictionary<string, string>();
                        while (reader.Read())
                        {
                            string id = reader["id_pelanggan"].ToString();
                            string nama = reader["nama"].ToString();
                            pelangganDict[id] = $"{id} - {nama}";
                        }

                        inputIdPelanggan.DataSource = new BindingSource(pelangganDict, null);
                        inputIdPelanggan.DisplayMember = "Value";
                        inputIdPelanggan.ValueMember = "Key"; 
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Gagal memuat data pelanggan: " + ex.Message);
                }
            }
        }


        private void btnTambahkanP_Click(object sender, EventArgs e)
        {
            string id = ((KeyValuePair<string, string>)inputIdPelanggan.SelectedItem).Key;
            string merek = inputMerek.Text.Trim();
            string jenis = inputJenis.Text.Trim();
            string warna = inputWarna.Text.Trim();
            string ukuran = inputUkuran.Text.Trim();

            if (id == "")
            {
                MessageBox.Show("ID Pelanggan wajib diisi!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran) VALUES (@id, @merek, @jenis, @warna, @ukuran)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@merek", merek);
                        cmd.Parameters.AddWithValue("@jenis", jenis);
                        cmd.Parameters.AddWithValue("@warna", warna);
                        cmd.Parameters.AddWithValue("@ukuran", ukuran);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            MessageBox.Show("Data sepatu berhasil ditambahkan!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            ClearForm();
                        }
                        else
                        {
                            MessageBox.Show("Gagal menambahkan data sepatu.", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
            inputIdPelanggan.SelectedIndex = -1;
            inputMerek.Clear();
            inputJenis.Clear();
            inputWarna.Clear();
            inputUkuran.Clear();
            inputIdPelanggan.Focus();
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDS form = new FormKDS();
            form.Show();
        }
    }
}
