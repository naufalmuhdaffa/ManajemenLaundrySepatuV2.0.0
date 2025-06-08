using ManajemenLaundrySepatu.Helpers;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormTB : BaseForm
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormTB()
        {
            InitializeComponent();
        }

        private void FormTB_Shown(object sender, EventArgs e)
        {
            inputNamaBarang.Focus();
        }

        private void btnTambahkanB_Click(object sender, EventArgs e)
        {
            if (!Session.CekSession()) return;

            string nama = inputNamaBarang.Texts.Trim();
            string jumlahText = inputJumlah.Texts.Trim();
            string satuan = inputSatuan.Texts.Trim();
            int idAkun = Session.LoggedInUserId;

            if (string.IsNullOrEmpty(nama) || string.IsNullOrEmpty(jumlahText))
            {
                DarkModeMessageBox.Show("Nama barang dan jumlah wajib diisi!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (!int.TryParse(jumlahText, out int jumlah))
            {
                DarkModeMessageBox.Show("Jumlah harus berupa angka!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
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
                            using (SqlCommand cmd = new SqlCommand("sp_CreateBarangKonsumsi", conn, transaction))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;

                                cmd.Parameters.AddWithValue("@nama_barang", nama);
                                cmd.Parameters.AddWithValue("@jumlah", jumlah);
                                cmd.Parameters.AddWithValue("@satuan", satuan);
                                cmd.Parameters.AddWithValue("@id_akun", idAkun);

                                int rowsAffected = cmd.ExecuteNonQuery();
                                if (rowsAffected > 0)
                                {
                                    transaction.Commit();
                                    DarkModeMessageBox.Show("Barang berhasil ditambahkan!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                    ClearForm();
                                    Cache.RemoveCache($"Cache:BarangKonsumsi_{Session.LoggedInUserId}");
                                }
                                else
                                {
                                    transaction.Rollback();
                                    DarkModeMessageBox.Show("Gagal menambahkan barang.", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
            inputNamaBarang.Clear();
            inputJumlah.Clear();
            inputSatuan.Clear();
            inputNamaBarang.Focus();
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDB form = new FormKDB();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void inputNamaBarang_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                inputJumlah.Focus();
                e.Handled = true;
            }
        }

        private void inputJumlah_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                inputSatuan.Focus();
                e.Handled = true;
            }
        }

        private void inputSatuan_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                btnTambahkanB.PerformClick();
                e.Handled = true;
            }
        }
    }
}