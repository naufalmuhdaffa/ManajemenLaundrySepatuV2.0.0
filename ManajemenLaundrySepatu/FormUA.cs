using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormUA : Form
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormUA()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void FormUA_Load(object sender, EventArgs e)
        {
            LoadDataMaintenance();
        }

        private void LoadDataMaintenance()
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
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Gagal memuat data maintenance: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void dgvAlat_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dgvAlat.Rows[e.RowIndex];

                inputNamaAlat.Text = row.Cells["Nama Alat"].Value.ToString();
                inputTanggal.Value = Convert.ToDateTime(row.Cells["Tanggal"].Value);
                inputDeskripsi.Text = row.Cells["Deskripsi"].Value.ToString();

                inputNamaAlat.Tag = row.Cells["ID"].Value; // simpan ID di Tag
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (inputNamaAlat.Text == "" || inputNamaAlat.Tag == null)
            {
                MessageBox.Show("Pilih data yang mau diubah dulu dong~", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "UPDATE Maintenance_Alat_Laundry SET nama_alat = @nama, tanggal_maintenance = @tanggal, deskripsi = @deskripsi WHERE id_maintenance = @id";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@id", inputNamaAlat.Tag);
                    cmd.Parameters.AddWithValue("@nama", inputNamaAlat.Text.Trim());
                    cmd.Parameters.AddWithValue("@tanggal", inputTanggal.Value);
                    cmd.Parameters.AddWithValue("@deskripsi", inputDeskripsi.Text.Trim());

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Data maintenance berhasil di-update, nice~", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        LoadDataMaintenance();
                    }
                    else
                    {
                        MessageBox.Show("Gagal update, data ga ketemu atau belum diubah!", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Kesalahan: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDA form = new FormKDA(); 
            form.Show();
        }
    }
}
