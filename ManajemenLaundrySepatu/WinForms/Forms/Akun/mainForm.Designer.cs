﻿namespace ManajemenLaundrySepatu
{
    partial class mainForm
    {
        private System.ComponentModel.IContainer components = null;
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code
        private void InitializeComponent()
        {
            this.btnLogin = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.inputUsername = new ManajemenLaundrySepatu.MyTextBox();
            this.labelUsername = new MaterialSkin.Controls.MaterialLabel();
            this.inputPassword = new ManajemenLaundrySepatu.MyTextBox();
            this.labelPassword = new MaterialSkin.Controls.MaterialLabel();
            this.labelAkun = new MaterialSkin.Controls.MaterialLabel();
            this.linkLabelDaftar = new System.Windows.Forms.LinkLabel();
            this.btnLewatiLogin = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.chkShowPassword = new MaterialSkin.Controls.MaterialCheckbox();
            this.btnBackAuth = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.SuspendLayout();
            // 
            // themeSwitch
            // 
            this.themeSwitch.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.776372F);
            this.themeSwitch.Location = new System.Drawing.Point(632, 25);
            this.themeSwitch.Size = new System.Drawing.Size(167, 38);
            // 
            // btnLogin
            // 
            this.btnLogin.AutoSize = false;
            this.btnLogin.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnLogin.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnLogin.BorderColor = System.Drawing.Color.Gray;
            this.btnLogin.BorderSize = 2;
            this.btnLogin.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLogin.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnLogin.Depth = 0;
            this.btnLogin.FlatAppearance.BorderColor = System.Drawing.SystemColors.ButtonFace;
            this.btnLogin.FlatAppearance.CheckedBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(136)))), ((int)(((byte)(54)))), ((int)(((byte)(82)))), ((int)(((byte)(104)))));
            this.btnLogin.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.btnLogin.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnLogin.HighEmphasis = true;
            this.btnLogin.Icon = null;
            this.btnLogin.IsDarkTheme = false;
            this.btnLogin.Location = new System.Drawing.Point(277, 283);
            this.btnLogin.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnLogin.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnLogin.Name = "btnLogin";
            this.btnLogin.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnLogin.Size = new System.Drawing.Size(238, 47);
            this.btnLogin.TabIndex = 4;
            this.btnLogin.Text = "Login";
            this.btnLogin.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnLogin.UseAccentColor = false;
            this.btnLogin.UseVisualStyleBackColor = false;
            this.btnLogin.Click += new System.EventHandler(this.btnLogin_Click);
            // 
            // inputUsername
            // 
            this.inputUsername.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputUsername.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputUsername.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputUsername.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputUsername.BorderRadius = 10;
            this.inputUsername.BorderSize = 2;
            this.inputUsername.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputUsername.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputUsername.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.inputUsername.Location = new System.Drawing.Point(277, 122);
            this.inputUsername.Margin = new System.Windows.Forms.Padding(4);
            this.inputUsername.Multiline = false;
            this.inputUsername.Name = "inputUsername";
            this.inputUsername.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputUsername.PasswordChar = false;
            this.inputUsername.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputUsername.PlaceholderText = "Masukkan nama pengguna disini..";
            this.inputUsername.ReadOnly = false;
            this.inputUsername.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputUsername.Size = new System.Drawing.Size(400, 33);
            this.inputUsername.TabIndex = 1;
            this.inputUsername.TabStop = false;
            this.inputUsername.Texts = "";
            this.inputUsername.UnderlinedStyle = false;
            this.inputUsername.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputUsername_KeyPress);
            // 
            // labelUsername
            // 
            this.labelUsername.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelUsername.Depth = 0;
            this.labelUsername.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelUsername.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelUsername.Location = new System.Drawing.Point(129, 125);
            this.labelUsername.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelUsername.Name = "labelUsername";
            this.labelUsername.Size = new System.Drawing.Size(72, 19);
            this.labelUsername.TabIndex = 7;
            this.labelUsername.Text = "Username";
            // 
            // inputPassword
            // 
            this.inputPassword.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputPassword.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputPassword.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputPassword.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputPassword.BorderRadius = 10;
            this.inputPassword.BorderSize = 2;
            this.inputPassword.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputPassword.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputPassword.Location = new System.Drawing.Point(277, 186);
            this.inputPassword.Margin = new System.Windows.Forms.Padding(4);
            this.inputPassword.Multiline = false;
            this.inputPassword.Name = "inputPassword";
            this.inputPassword.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputPassword.PasswordChar = true;
            this.inputPassword.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputPassword.PlaceholderText = "Masukkan kata sandi disini..";
            this.inputPassword.ReadOnly = false;
            this.inputPassword.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputPassword.Size = new System.Drawing.Size(400, 33);
            this.inputPassword.TabIndex = 2;
            this.inputPassword.TabStop = false;
            this.inputPassword.Texts = "";
            this.inputPassword.UnderlinedStyle = false;
            this.inputPassword.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputPassword_KeyPress);
            // 
            // labelPassword
            // 
            this.labelPassword.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelPassword.Depth = 0;
            this.labelPassword.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelPassword.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelPassword.Location = new System.Drawing.Point(129, 192);
            this.labelPassword.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelPassword.Name = "labelPassword";
            this.labelPassword.Size = new System.Drawing.Size(71, 19);
            this.labelPassword.TabIndex = 8;
            this.labelPassword.Text = "Password";
            // 
            // labelAkun
            // 
            this.labelAkun.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelAkun.Depth = 0;
            this.labelAkun.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelAkun.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelAkun.Location = new System.Drawing.Point(274, 350);
            this.labelAkun.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelAkun.Name = "labelAkun";
            this.labelAkun.Size = new System.Drawing.Size(143, 19);
            this.labelAkun.TabIndex = 9;
            this.labelAkun.Text = "Belum Punya Akun?";
            // 
            // linkLabelDaftar
            // 
            this.linkLabelDaftar.AutoSize = true;
            this.linkLabelDaftar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.linkLabelDaftar.Cursor = System.Windows.Forms.Cursors.Hand;
            this.linkLabelDaftar.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.linkLabelDaftar.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.linkLabelDaftar.LinkColor = System.Drawing.Color.FromArgb(((int)(((byte)(84)))), ((int)(((byte)(126)))), ((int)(((byte)(160)))));
            this.linkLabelDaftar.Location = new System.Drawing.Point(424, 350);
            this.linkLabelDaftar.Name = "linkLabelDaftar";
            this.linkLabelDaftar.Size = new System.Drawing.Size(99, 18);
            this.linkLabelDaftar.TabIndex = 5;
            this.linkLabelDaftar.TabStop = true;
            this.linkLabelDaftar.Text = "Daftar Disini !";
            this.linkLabelDaftar.VisitedLinkColor = System.Drawing.SystemColors.Highlight;
            this.linkLabelDaftar.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkLabelDaftar_LinkClicked);
            // 
            // btnLewatiLogin
            // 
            this.btnLewatiLogin.AutoSize = false;
            this.btnLewatiLogin.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnLewatiLogin.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnLewatiLogin.BorderColor = System.Drawing.Color.Gray;
            this.btnLewatiLogin.BorderSize = 2;
            this.btnLewatiLogin.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLewatiLogin.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnLewatiLogin.Depth = 0;
            this.btnLewatiLogin.FlatAppearance.BorderColor = System.Drawing.SystemColors.ButtonFace;
            this.btnLewatiLogin.FlatAppearance.CheckedBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(136)))), ((int)(((byte)(54)))), ((int)(((byte)(82)))), ((int)(((byte)(104)))));
            this.btnLewatiLogin.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnLewatiLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.btnLewatiLogin.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnLewatiLogin.HighEmphasis = true;
            this.btnLewatiLogin.Icon = null;
            this.btnLewatiLogin.IsDarkTheme = false;
            this.btnLewatiLogin.Location = new System.Drawing.Point(321, 385);
            this.btnLewatiLogin.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnLewatiLogin.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnLewatiLogin.Name = "btnLewatiLogin";
            this.btnLewatiLogin.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnLewatiLogin.Size = new System.Drawing.Size(147, 41);
            this.btnLewatiLogin.TabIndex = 6;
            this.btnLewatiLogin.Text = "Login Nanti";
            this.btnLewatiLogin.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnLewatiLogin.UseAccentColor = false;
            this.btnLewatiLogin.UseVisualStyleBackColor = false;
            this.btnLewatiLogin.Click += new System.EventHandler(this.btnLewatiLogin_Click);
            // 
            // chkShowPassword
            // 
            this.chkShowPassword.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.chkShowPassword.Cursor = System.Windows.Forms.Cursors.Hand;
            this.chkShowPassword.Depth = 0;
            this.chkShowPassword.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.chkShowPassword.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.chkShowPassword.Location = new System.Drawing.Point(277, 238);
            this.chkShowPassword.Margin = new System.Windows.Forms.Padding(0);
            this.chkShowPassword.MouseLocation = new System.Drawing.Point(-1, -1);
            this.chkShowPassword.MouseState = MaterialSkin.MouseState.HOVER;
            this.chkShowPassword.Name = "chkShowPassword";
            this.chkShowPassword.Padding = new System.Windows.Forms.Padding(10, 0, 0, 0);
            this.chkShowPassword.ReadOnly = false;
            this.chkShowPassword.Ripple = true;
            this.chkShowPassword.Size = new System.Drawing.Size(238, 27);
            this.chkShowPassword.TabIndex = 3;
            this.chkShowPassword.Text = "Tampilkan Password";
            this.chkShowPassword.UseVisualStyleBackColor = false;
            this.chkShowPassword.CheckedChanged += new System.EventHandler(this.chkShowPassword_CheckedChanged);
            // 
            // btnBackAuth
            // 
            this.btnBackAuth.AutoSize = false;
            this.btnBackAuth.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnBackAuth.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnBackAuth.BorderColor = System.Drawing.Color.Gray;
            this.btnBackAuth.BorderSize = 2;
            this.btnBackAuth.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnBackAuth.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnBackAuth.Depth = 0;
            this.btnBackAuth.FlatAppearance.BorderColor = System.Drawing.SystemColors.ButtonFace;
            this.btnBackAuth.FlatAppearance.CheckedBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(136)))), ((int)(((byte)(54)))), ((int)(((byte)(82)))), ((int)(((byte)(104)))));
            this.btnBackAuth.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnBackAuth.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.btnBackAuth.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnBackAuth.HighEmphasis = true;
            this.btnBackAuth.Icon = null;
            this.btnBackAuth.IsDarkTheme = false;
            this.btnBackAuth.Location = new System.Drawing.Point(7, 401);
            this.btnBackAuth.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnBackAuth.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnBackAuth.Name = "btnBackAuth";
            this.btnBackAuth.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnBackAuth.Size = new System.Drawing.Size(147, 41);
            this.btnBackAuth.TabIndex = 10;
            this.btnBackAuth.Text = "Kembali ke Auth";
            this.btnBackAuth.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnBackAuth.UseAccentColor = false;
            this.btnBackAuth.UseVisualStyleBackColor = false;
            this.btnBackAuth.Click += new System.EventHandler(this.btnBackAuth_Clicked);
            // 
            // mainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnBackAuth);
            this.Controls.Add(this.chkShowPassword);
            this.Controls.Add(this.btnLewatiLogin);
            this.Controls.Add(this.linkLabelDaftar);
            this.Controls.Add(this.labelAkun);
            this.Controls.Add(this.labelPassword);
            this.Controls.Add(this.inputPassword);
            this.Controls.Add(this.labelUsername);
            this.Controls.Add(this.inputUsername);
            this.Controls.Add(this.btnLogin);
            this.Name = "mainForm";
            this.Opacity = 1D;
            this.Text = "Login";
            this.Load += new System.EventHandler(this.mainForm_Load);
            this.Shown += new System.EventHandler(this.mainForm_Shown);
            this.Controls.SetChildIndex(this.btnLogin, 0);
            this.Controls.SetChildIndex(this.inputUsername, 0);
            this.Controls.SetChildIndex(this.labelUsername, 0);
            this.Controls.SetChildIndex(this.inputPassword, 0);
            this.Controls.SetChildIndex(this.labelPassword, 0);
            this.Controls.SetChildIndex(this.labelAkun, 0);
            this.Controls.SetChildIndex(this.linkLabelDaftar, 0);
            this.Controls.SetChildIndex(this.btnLewatiLogin, 0);
            this.Controls.SetChildIndex(this.chkShowPassword, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            this.Controls.SetChildIndex(this.btnBackAuth, 0);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnLogin;
        private ManajemenLaundrySepatu.MyTextBox inputUsername;
        private MaterialSkin.Controls.MaterialLabel labelUsername;
        private ManajemenLaundrySepatu.MyTextBox inputPassword;
        private MaterialSkin.Controls.MaterialLabel labelPassword;
        private MaterialSkin.Controls.MaterialLabel labelAkun;
        private System.Windows.Forms.LinkLabel linkLabelDaftar;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnLewatiLogin;
        private MaterialSkin.Controls.MaterialCheckbox chkShowPassword;
        private WinForms.Helpers.MyMaterialButton btnBackAuth;
    }
}

