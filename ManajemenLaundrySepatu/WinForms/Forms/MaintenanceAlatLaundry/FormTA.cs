using ManajemenLaundrySepatu.Helpers;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormTA : BaseForm
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormTA()
        {
            InitializeComponent();
        }

        private void FormTA_Shown(object sender, EventArgs e)
        {
            inputNamaAlat.Focus();
        }

        private void btnTambahkanA_Click(object sender, EventArgs e)
        {
            if (!Session.CekSession()) return;

            string namaAlat = inputNamaAlat.Texts.Trim();
            DateTime tanggal = inputTanggal.Value;
            string deskripsi = inputDeskripsi.Texts.Trim();
            int idAkun = Session.LoggedInUserId;

            if (string.IsNullOrEmpty(namaAlat))
            {
                DarkModeMessageBox.Show("Nama alat nggak boleh kosong, ya!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlTransaction transaction = conn.BeginTransaction())
                    {
                        try
                        {
                            using (SqlCommand cmd = new SqlCommand("sp_CreateMaintenanceAlatLaundry", conn, transaction))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@nama_alat", namaAlat);
                                cmd.Parameters.AddWithValue("@tanggal_maintenance", tanggal);
                                cmd.Parameters.AddWithValue("@deskripsi", deskripsi);
                                cmd.Parameters.AddWithValue("@id_akun", idAkun);

                                int rowsAffected = cmd.ExecuteNonQuery();

                                if (rowsAffected > 0)
                                {
                                    transaction.Commit();
                                    DarkModeMessageBox.Show("Data Alat Laundry berhasil ditambahkan~", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                    ClearForm();
                                    Cache.RemoveCache($"Cache:MaintenanceAlatLaundry_{Session.LoggedInUserId}");
                                }
                                else
                                {
                                    transaction.Rollback();
                                    DarkModeMessageBox.Show("Gagal menambahkan data Alat Laundry.", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                }
                            }
                        }
                        catch
                        {
                            transaction.Rollback();
                            throw;
                        }
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Kesalahan: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void inputNamaAlat_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                inputTanggal.Focus();
                e.Handled = true;
            }
        }

        private void inputTanggal_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                inputDeskripsi.Focus();
                e.Handled = true;
            }
        }

        private void inputDeskripsi_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                btnTambahkanA.PerformClick();
                e.Handled = true;
            }
        }
    }
}