using ManajemenLaundrySepatu.Helpers;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormREG : BaseForm
    {
        private string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";

        public FormREG()
        {
            InitializeComponent();
        }

        private void FormREG_Shown(object sender, EventArgs e)
        {
            inputUsername.Focus();
        }

        private void btnRegister_Click(object sender, EventArgs e)
        {
            string username = inputUsername.Texts.Trim();
            string password = inputPassword.Texts.Trim();
            string confirmPassword = inputConfirmPassword.Texts.Trim();
            if (username == "" || password == "" || confirmPassword == "")
            {
                DarkModeMessageBox.Show("Semua kolom harus diisi!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (password != confirmPassword)
            {
                DarkModeMessageBox.Show("Password dan Konfirmasi Password tidak cocok!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            string hashedPassword = HashPassword(password);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlCommand command = new SqlCommand("sp_ReadAkun", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@Username", username);
                        int count = (int)command.ExecuteScalar();
                        if (count > 0)
                        {
                            DarkModeMessageBox.Show("Username sudah terdaftar!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            return;
                        }
                    }
                }
                catch (SqlException ex)
                {
                    DarkModeMessageBox.Show("Terjadi kesalahan saat memeriksa username: " + ex.Message, "Kesalahan", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlCommand command = new SqlCommand("sp_CreateAkun", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@Username", username);
                        command.Parameters.AddWithValue("@PasswordHash", hashedPassword);
                        command.ExecuteNonQuery();

                        DarkModeMessageBox.Show("Registrasi berhasil!", "Informasi", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        inputUsername.Clear();
                        inputPassword.Clear();
                        inputConfirmPassword.Clear();
                        inputUsername.Focus();
                    }
                }
                catch (SqlException ex)
                {
                    DarkModeMessageBox.Show("Terjadi kesalahan saat registrasi: " + ex.Message, "Kesalahan", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void linkLabelLogin_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            this.Hide();
            mainForm Form = new mainForm();
            Form.Show();
            Form.EnableAutoResize();
            Form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                Form.WindowState = FormWindowState.Maximized;
        }

        public static string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        private void inputUsername_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                inputPassword.Focus();
                e.Handled = true;
            }
        }

        private void inputPassword_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                inputConfirmPassword.Focus();
                e.Handled = true;
            }
        }

        private void inputConfirmPassword_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                btnRegister.PerformClick();
                e.Handled = true;
            }
        }

        private void btnShowPassword_Click(object sender, EventArgs e)
        {
            inputPassword.PasswordChar = !inputPassword.PasswordChar;
            btnShowPassword.Text = inputPassword.PasswordChar ? "Tampilkan" : "Sembunyikan";
        }
    }
}