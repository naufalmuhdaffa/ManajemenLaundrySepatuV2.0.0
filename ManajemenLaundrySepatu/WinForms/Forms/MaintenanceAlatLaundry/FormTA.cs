using ManajemenLaundrySepatu.Helpers;
using ManajemenLaundrySepatu.WinForms.Helpers;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormTA : BaseForm
    {
        private string connectionString = DbConfig.ConnectionString;

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

            if (namaAlat.Length > 100)
            {
                DarkModeMessageBox.Show("Panjang Nama Alat Maksimal 100 karakter", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                inputNamaAlat.Focus();
                return;
            }

            if (deskripsi.Length > 100)
            {
                DarkModeMessageBox.Show("Panjang Deskripsi Maksimal 100 karakter", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                inputDeskripsi.Focus();
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
                        catch (SqlException sqlEx)
                        {
                            transaction.Rollback();
                            string friendly = SqlErrorHandler.GetFriendlyErrorMessage(sqlEx);
                            DarkModeMessageBox.Show(friendly, "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                        catch (Exception)
                        {
                            transaction.Rollback();
                            DarkModeMessageBox.Show("Terjadi kesalahan tidak terduga saat menambahkan maintenance alat laundry. Silakan coba lagi atau hubungi admin.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
                catch (SqlException sqlEx)
                {
                    string friendly = SqlErrorHandler.GetFriendlyErrorMessage(sqlEx);
                    DarkModeMessageBox.Show(friendly, "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                catch (Exception)
                {
                    DarkModeMessageBox.Show("Tidak dapat terhubung ke database. Silakan periksa koneksi atau hubungi admin.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
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