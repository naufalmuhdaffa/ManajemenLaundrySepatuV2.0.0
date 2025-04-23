using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormUB : Form
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormUB()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void FormUB_Load(object sender, EventArgs e)
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
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Gagal memuat data barang: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void dgvBarang_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dgvBarang.Rows[e.RowIndex];

                inputIdBarang.Text = row.Cells["ID Barang"].Value.ToString();
                inputNamaBarang.Text = row.Cells["Nama Barang"].Value.ToString();
                inputJumlah.Text = row.Cells["Jumlah"].Value.ToString();
                inputSatuan.Text = row.Cells["Satuan"].Value.ToString();

                inputIdBarang.ReadOnly = true; // ID gak boleh diedit ya~ hmph!
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (inputIdBarang.Text == "" || inputNamaBarang.Text == "" || inputJumlah.Text == "")
            {
                MessageBox.Show("Isi semua data yang wajib yaa~", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (!int.TryParse(inputJumlah.Text.Trim(), out int jumlah))
            {
                MessageBox.Show("Jumlah harus angka, bukan huruf!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "UPDATE Barang_Konsumsi SET nama_barang = @nama, jumlah = @jumlah, satuan = @satuan WHERE id_barang = @id";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@id", inputIdBarang.Text.Trim());
                    cmd.Parameters.AddWithValue("@nama", inputNamaBarang.Text.Trim());
                    cmd.Parameters.AddWithValue("@jumlah", jumlah);
                    cmd.Parameters.AddWithValue("@satuan", inputSatuan.Text.Trim());

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Barang berhasil diupdate, nice~", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        LoadDataBarang();
                    }
                    else
                    {
                        MessageBox.Show("Update gagal, cek ID-nya bener nggak!", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Warning);
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
            FormKDB form = new FormKDB(); // Balik ke menu kelola data barang
            form.Show();
        }
    }
}
