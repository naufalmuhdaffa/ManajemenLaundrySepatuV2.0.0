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
    public partial class mainForm: System.Windows.Forms.Form
    {
        public static class CloseWindow
        {
            public static void Confirmation(Form form)
            {
                form.FormClosing += (s, e) =>
                {
                    if (e.CloseReason == CloseReason.UserClosing)
                    {
                        var result = MessageBox.Show(
                            "Apakah Anda yakin ingin keluar?",
                            "Konfirmasi",
                            MessageBoxButtons.YesNo,
                            MessageBoxIcon.Question);

                        if (result == DialogResult.No)
                        {
                            e.Cancel = true;
                        }
                        else
                        {
                            Application.Exit();
                        }
                    }
                };
            }
        }
        public mainForm()
        {
            InitializeComponent();
            CloseWindow.Confirmation(this);
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string username = inputUsername.Text.Trim();
            string password = inputPassword.Text.Trim();

            if (username == "" || password == "")
            {
                MessageBox.Show("Username dan Password wajib diisi!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (username == "admin" && password == "123")
            {
                MessageBox.Show("Login berhasil!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.Hide();
                FormLMS form = new FormLMS();
                form.Show();
            }
            else
            {
                MessageBox.Show("Username atau password salah!", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }
    }
}
