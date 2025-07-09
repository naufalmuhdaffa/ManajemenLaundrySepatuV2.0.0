using ManajemenLaundrySepatu.Helpers;
using ManajemenLaundrySepatu.WinForms.Helpers;
using MaterialSkin;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Media;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class mainForm : BaseForm
    {
        private string connectionString = DbConfig.ConnectionString;

        private WelcomeTextControl welcomeControl;

        private Color textColor;
        private SoundPlayer soundPlayer;

        public mainForm()
        {
            InitializeComponent();
            bool isDark = (skinManager.Theme == MaterialSkinManager.Themes.DARK);
            textColor = isDark ? Color.White : Color.Black;
            welcomeControl = new WelcomeTextControl();
            welcomeControl.SetTextColor(textColor);
            welcomeControl.Dock = DockStyle.Fill;
            welcomeControl.Visible = false;

            this.Controls.Add(welcomeControl);
            themeSwitch.CheckedChanged += (s, e) =>
            {
                bool newDark = themeSwitch.Checked;
                Color newColor = newDark ? Color.White : Color.Black;
                welcomeControl.SetTextColor(newColor);
            };

            string audioPath = Path.Combine(Application.StartupPath, @"WinForms\Resources\Audio\irasshaimase.wav");
            soundPlayer = new SoundPlayer(audioPath);

            chkShowPassword.AutoSize = false;
            chkShowPassword.Height = 28;
            chkShowPassword.Paint += chkShowPassword_Paint;
            chkShowPassword.Resize += (s, _) => chkShowPassword.Invalidate();
        }

        private void mainForm_Shown(object sender, EventArgs e)
        {
            inputUsername.Focus();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string username = inputUsername.Texts.Trim();
            string password = inputPassword.Texts.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                DarkModeMessageBox.Show("Username dan Password wajib diisi!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            string hashedPassword = HashPassword(password);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("sp_LoginAkun", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@username", username);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (!reader.Read())
                            {
                                DarkModeMessageBox.Show("Username tidak ditemukan!", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                inputPassword.Clear();
                                inputPassword.Focus();
                                return;
                            }

                            int userId = reader.GetInt32(reader.GetOrdinal("id"));
                            string dbPasswordHash = reader.GetString(reader.GetOrdinal("password_hash"));
                            int failedAttempts = reader.GetInt32(reader.GetOrdinal("FailedLoginAttempts"));
                            object lockoutEndObj = reader["LockoutEnd"];
                            DateTime? lockoutEnd = lockoutEndObj == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(lockoutEndObj);

                            reader.Close();

                            if (lockoutEnd != null && lockoutEnd > DateTime.Now)
                            {
                                DarkModeMessageBox.Show($"Akun dikunci sampai {lockoutEnd}", "Akses Ditolak", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                                return;
                            }

                            if (lockoutEnd != null && lockoutEnd <= DateTime.Now)
                            {
                                using (SqlTransaction transaction = conn.BeginTransaction())
                                {
                                    try
                                    {
                                        using (SqlCommand resetCmd = new SqlCommand("sp_ResetLoginAttempts", conn, transaction))
                                        {
                                            resetCmd.CommandType = CommandType.StoredProcedure;
                                            resetCmd.Parameters.AddWithValue("@username", username);
                                            resetCmd.ExecuteNonQuery();
                                        }

                                        transaction.Commit();
                                        failedAttempts = 0;
                                        lockoutEnd = null;
                                    }
                                    catch
                                    {
                                        transaction.Rollback();
                                        throw;
                                    }
                                }
                            }

                            if (dbPasswordHash == hashedPassword)
                            {
                                using (SqlTransaction transaction = conn.BeginTransaction())
                                {
                                    try
                                    {
                                        using (SqlCommand resetCmd = new SqlCommand("sp_ResetLoginAttempts", conn, transaction))
                                        {
                                            resetCmd.CommandType = CommandType.StoredProcedure;
                                            resetCmd.Parameters.AddWithValue("@username", username);
                                            resetCmd.ExecuteNonQuery();
                                        }

                                        transaction.Commit();
                                    }
                                    catch
                                    {
                                        transaction.Rollback();
                                        throw;
                                    }
                                }

                                DarkModeMessageBox.Show("Login berhasil!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                soundPlayer.Play();
                                hideComponents();
                                welcomeControl.Visible = true;
                                welcomeControl.StartTyping();
                                int totalChars = 15 + 22;
                                int delayMs = totalChars * 10 + 500;
                                Timer t = new Timer();
                                t.Interval = delayMs;
                                t.Tick += (s2, e2) =>
                                {
                                    t.Stop();
                                    try
                                    {
                                        Session.Login(userId);
                                        this.Hide();
                                        var form = new FormLMS();
                                        form.Show();
                                        form.EnableAutoResize();
                                        form.WindowState = (this.WindowState == FormWindowState.Maximized)
                                            ? FormWindowState.Maximized
                                            : FormWindowState.Normal;
                                    }
                                    catch (Exception ex)
                                    {
                                        DarkModeMessageBox.Show("Error saat membuka form baru: " + ex.Message,
                                            "Ups", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                    }
                                };
                                t.Start();
                            }
                            else
                            {
                                failedAttempts++;
                                DateTime? newLockoutEnd = null;

                                if (failedAttempts >= 5)
                                {
                                    newLockoutEnd = DateTime.Now.AddSeconds(30);
                                }
                                using (SqlTransaction transaction = conn.BeginTransaction())
                                {
                                    try
                                    {
                                        using (SqlCommand updateCmd = new SqlCommand("sp_UpdateLoginAttempts", conn, transaction))
                                        {
                                            updateCmd.CommandType = CommandType.StoredProcedure;
                                            updateCmd.Parameters.AddWithValue("@username", username);
                                            updateCmd.Parameters.AddWithValue("@failedAttempts", failedAttempts);
                                            if (newLockoutEnd.HasValue)
                                                updateCmd.Parameters.AddWithValue("@lockoutEnd", newLockoutEnd.Value);
                                            else
                                                updateCmd.Parameters.AddWithValue("@lockoutEnd", DBNull.Value);

                                            updateCmd.ExecuteNonQuery();
                                        }

                                        transaction.Commit();
                                    }
                                    catch
                                    {
                                        transaction.Rollback();
                                        throw;
                                    }
                                }


                                if (newLockoutEnd != null)
                                {
                                    DarkModeMessageBox.Show("Terlalu banyak gagal login. Akun dikunci 30 detik!", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                }
                                else
                                {
                                    int sisa = 5 - failedAttempts;
                                    DarkModeMessageBox.Show($"Password salah! Kesempatan tersisa: {sisa}", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                                }

                                inputPassword.Clear();
                                inputPassword.Focus();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Kesalahan: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void linkLabelDaftar_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            this.Hide();
            FormREG Form = new FormREG();
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
                byte[] bytes = Encoding.UTF8.GetBytes(password);
                byte[] hash = sha256.ComputeHash(bytes);
                StringBuilder builder = new StringBuilder();
                foreach (byte b in hash)
                {
                    builder.Append(b.ToString("x2"));
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
                btnLogin.PerformClick();
                e.Handled = true;
            }
        }

        private void btnLewatiLogin_Click(object sender, EventArgs e)
        {
            Session.LoginAsGuest();
            DarkModeMessageBox.Show("Kamu login sebagai tamu. Beberapa fitur mungkin dibatasi.", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);

            this.Hide();
            FormLMS Form = new FormLMS();
            Form.Show();
            Form.EnableAutoResize();
            Form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                Form.WindowState = FormWindowState.Maximized;
        }

        private void chkShowPassword_CheckedChanged(object sender, EventArgs e)
        {
            bool showPassword = chkShowPassword.Checked;

            inputPassword.PasswordChar = !showPassword;
            chkShowPassword.Text = showPassword ? "Sembunyikan Password" : "Tampilkan Password";
        }

        private void chkShowPassword_Paint(object sender, PaintEventArgs e)
        {
            var cb = (CheckBox)sender;
            e.Graphics.Clear(cb.BackColor);

            const float BoxRatio = 0.5f;
            const int MinBoxSize = 14;
            using (var borderPen = new Pen(Color.Black, 1))
            using (var tickPen = new Pen(Color.Black, 2))
            using (var outerBoxPen = new Pen(Color.Gray, 1))
            {
                int boxSize = Math.Max(MinBoxSize, (int)(cb.Height * BoxRatio));
                var textSize = TextRenderer.MeasureText(cb.Text, cb.Font);
                int contentWidth = boxSize + 6 + textSize.Width;
                int startX = (cb.Width - contentWidth) / 2;
                int startY = (cb.Height - Math.Max(boxSize, textSize.Height)) / 2;
                var boxRect = new Rectangle(startX, startY, boxSize, boxSize);
                e.Graphics.DrawRectangle(borderPen, boxRect);

                if (cb.Checked)
                {
                    e.Graphics.DrawLine(tickPen,
                        boxRect.Left + boxSize * 0.2f, boxRect.Top + boxSize * 0.5f,
                        boxRect.Left + boxSize * 0.4f, boxRect.Bottom - boxSize * 0.2f);
                    e.Graphics.DrawLine(tickPen,
                        boxRect.Left + boxSize * 0.4f, boxRect.Bottom - boxSize * 0.2f,
                        boxRect.Right - boxSize * 0.2f, boxRect.Top + boxSize * 0.2f);
                }

                var textPt = new Point(boxRect.Right + 6, (cb.Height - textSize.Height) / 2);
                TextRenderer.DrawText(e.Graphics, cb.Text, cb.Font, textPt, cb.ForeColor);

                var outerRect = new Rectangle(0, 0, cb.Width - 1, cb.Height - 1);
                e.Graphics.DrawRectangle(outerBoxPen, outerRect);
            }
        }

        private void mainForm_Load(object sender, EventArgs e)
        {
            chkShowPassword.Paint += chkShowPassword_Paint;
        }

        private void hideComponents()
        {
            labelUsername.Visible = false;
            labelPassword.Visible = false;
            labelAkun.Visible = false;
            inputUsername.Visible = false;
            inputPassword.Visible = false;
            btnLogin.Visible = false;
            linkLabelDaftar.Visible = false;
            btnLewatiLogin.Visible = false;
            chkShowPassword.Visible = false;
        }
    }
}