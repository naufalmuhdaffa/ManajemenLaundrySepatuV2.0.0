namespace ManajemenLaundrySepatu
{
    partial class FormREG
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
            this.linkLabelLogin = new System.Windows.Forms.LinkLabel();
            this.labelAkun = new MaterialSkin.Controls.MaterialLabel();
            this.labelPassword = new MaterialSkin.Controls.MaterialLabel();
            this.inputPassword = new ManajemenLaundrySepatu.MyTextBox();
            this.labelUsername = new MaterialSkin.Controls.MaterialLabel();
            this.inputUsername = new ManajemenLaundrySepatu.MyTextBox();
            this.btnRegister = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.labelKonfirmasiPassword = new MaterialSkin.Controls.MaterialLabel();
            this.inputConfirmPassword = new ManajemenLaundrySepatu.MyTextBox();
            this.btnShowPassword = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.SuspendLayout();
            // 
            // themeSwitch
            // 
            this.themeSwitch.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.776372F);
            this.themeSwitch.Location = new System.Drawing.Point(629, 24);
            this.themeSwitch.Size = new System.Drawing.Size(170, 39);
            // 
            // linkLabelLogin
            // 
            this.linkLabelLogin.AutoSize = true;
            this.linkLabelLogin.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.linkLabelLogin.Cursor = System.Windows.Forms.Cursors.Hand;
            this.linkLabelLogin.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.linkLabelLogin.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.linkLabelLogin.LinkArea = new System.Windows.Forms.LinkArea(0, 15);
            this.linkLabelLogin.LinkColor = System.Drawing.Color.Blue;
            this.linkLabelLogin.Location = new System.Drawing.Point(429, 390);
            this.linkLabelLogin.Name = "linkLabelLogin";
            this.linkLabelLogin.Size = new System.Drawing.Size(87, 22);
            this.linkLabelLogin.TabIndex = 6;
            this.linkLabelLogin.TabStop = true;
            this.linkLabelLogin.Text = "Login Disini !";
            this.linkLabelLogin.UseCompatibleTextRendering = true;
            this.linkLabelLogin.VisitedLinkColor = System.Drawing.Color.FromArgb(((int)(((byte)(3)))), ((int)(((byte)(218)))), ((int)(((byte)(198)))));
            this.linkLabelLogin.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkLabelLogin_LinkClicked);
            // 
            // labelAkun
            // 
            this.labelAkun.AutoSize = true;
            this.labelAkun.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelAkun.Depth = 0;
            this.labelAkun.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelAkun.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelAkun.Location = new System.Drawing.Point(271, 390);
            this.labelAkun.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelAkun.Name = "labelAkun";
            this.labelAkun.Size = new System.Drawing.Size(144, 19);
            this.labelAkun.TabIndex = 10;
            this.labelAkun.Text = "Sudah Punya Akun?";
            // 
            // labelPassword
            // 
            this.labelPassword.AutoSize = true;
            this.labelPassword.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelPassword.Depth = 0;
            this.labelPassword.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelPassword.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelPassword.Location = new System.Drawing.Point(109, 179);
            this.labelPassword.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelPassword.Name = "labelPassword";
            this.labelPassword.Size = new System.Drawing.Size(71, 19);
            this.labelPassword.TabIndex = 8;
            this.labelPassword.Text = "Password";
            // 
            // inputPassword
            // 
            this.inputPassword.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputPassword.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputPassword.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputPassword.BorderRadius = 0;
            this.inputPassword.BorderSize = 2;
            this.inputPassword.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputPassword.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputPassword.Location = new System.Drawing.Point(274, 173);
            this.inputPassword.Margin = new System.Windows.Forms.Padding(4);
            this.inputPassword.Multiline = false;
            this.inputPassword.Name = "inputPassword";
            this.inputPassword.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputPassword.PasswordChar = true;
            this.inputPassword.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputPassword.PlaceholderText = "";
            this.inputPassword.ReadOnly = false;
            this.inputPassword.Size = new System.Drawing.Size(400, 33);
            this.inputPassword.TabIndex = 2;
            this.inputPassword.Texts = "";
            this.inputPassword.UnderlinedStyle = false;
            this.inputPassword.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputPassword_KeyPress);
            // 
            // labelUsername
            // 
            this.labelUsername.AutoSize = true;
            this.labelUsername.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelUsername.Depth = 0;
            this.labelUsername.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelUsername.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelUsername.Location = new System.Drawing.Point(109, 95);
            this.labelUsername.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelUsername.Name = "labelUsername";
            this.labelUsername.Size = new System.Drawing.Size(72, 19);
            this.labelUsername.TabIndex = 7;
            this.labelUsername.Text = "Username";
            // 
            // inputUsername
            // 
            this.inputUsername.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputUsername.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputUsername.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputUsername.BorderRadius = 0;
            this.inputUsername.BorderSize = 2;
            this.inputUsername.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputUsername.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputUsername.Location = new System.Drawing.Point(274, 92);
            this.inputUsername.Margin = new System.Windows.Forms.Padding(4);
            this.inputUsername.Multiline = false;
            this.inputUsername.Name = "inputUsername";
            this.inputUsername.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputUsername.PasswordChar = false;
            this.inputUsername.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputUsername.PlaceholderText = "";
            this.inputUsername.ReadOnly = false;
            this.inputUsername.Size = new System.Drawing.Size(400, 33);
            this.inputUsername.TabIndex = 1;
            this.inputUsername.Texts = "";
            this.inputUsername.UnderlinedStyle = false;
            this.inputUsername.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputUsername_KeyPress);
            // 
            // btnRegister
            // 
            this.btnRegister.AutoSize = false;
            this.btnRegister.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnRegister.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnRegister.BorderColor = System.Drawing.Color.Gray;
            this.btnRegister.BorderSize = 2;
            this.btnRegister.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnRegister.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnRegister.Depth = 0;
            this.btnRegister.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(55)))), ((int)(((byte)(55)))), ((int)(((byte)(55)))));
            this.btnRegister.FlatAppearance.CheckedBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(136)))), ((int)(((byte)(54)))), ((int)(((byte)(82)))), ((int)(((byte)(104)))));
            this.btnRegister.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnRegister.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRegister.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnRegister.HighEmphasis = true;
            this.btnRegister.Icon = null;
            this.btnRegister.IsDarkTheme = false;
            this.btnRegister.Location = new System.Drawing.Point(274, 316);
            this.btnRegister.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnRegister.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnRegister.Name = "btnRegister";
            this.btnRegister.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnRegister.Size = new System.Drawing.Size(242, 58);
            this.btnRegister.TabIndex = 5;
            this.btnRegister.Text = "Register";
            this.btnRegister.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnRegister.UseAccentColor = false;
            this.btnRegister.UseVisualStyleBackColor = false;
            this.btnRegister.Click += new System.EventHandler(this.btnRegister_Click);
            // 
            // labelKonfirmasiPassword
            // 
            this.labelKonfirmasiPassword.AutoSize = true;
            this.labelKonfirmasiPassword.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelKonfirmasiPassword.Depth = 0;
            this.labelKonfirmasiPassword.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelKonfirmasiPassword.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelKonfirmasiPassword.Location = new System.Drawing.Point(109, 258);
            this.labelKonfirmasiPassword.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelKonfirmasiPassword.Name = "labelKonfirmasiPassword";
            this.labelKonfirmasiPassword.Size = new System.Drawing.Size(153, 19);
            this.labelKonfirmasiPassword.TabIndex = 9;
            this.labelKonfirmasiPassword.Text = "Konfirmasi Password";
            // 
            // inputConfirmPassword
            // 
            this.inputConfirmPassword.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputConfirmPassword.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputConfirmPassword.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputConfirmPassword.BorderRadius = 0;
            this.inputConfirmPassword.BorderSize = 2;
            this.inputConfirmPassword.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputConfirmPassword.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputConfirmPassword.Location = new System.Drawing.Point(274, 252);
            this.inputConfirmPassword.Margin = new System.Windows.Forms.Padding(4);
            this.inputConfirmPassword.Multiline = false;
            this.inputConfirmPassword.Name = "inputConfirmPassword";
            this.inputConfirmPassword.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputConfirmPassword.PasswordChar = true;
            this.inputConfirmPassword.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputConfirmPassword.PlaceholderText = "";
            this.inputConfirmPassword.ReadOnly = false;
            this.inputConfirmPassword.Size = new System.Drawing.Size(400, 33);
            this.inputConfirmPassword.TabIndex = 4;
            this.inputConfirmPassword.Texts = "";
            this.inputConfirmPassword.UnderlinedStyle = false;
            this.inputConfirmPassword.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputConfirmPassword_KeyPress);
            // 
            // btnShowPassword
            // 
            this.btnShowPassword.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnShowPassword.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnShowPassword.BorderColor = System.Drawing.Color.Gray;
            this.btnShowPassword.BorderSize = 2;
            this.btnShowPassword.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnShowPassword.Depth = 0;
            this.btnShowPassword.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(55)))), ((int)(((byte)(55)))), ((int)(((byte)(55)))));
            this.btnShowPassword.FlatAppearance.CheckedBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(136)))), ((int)(((byte)(54)))), ((int)(((byte)(82)))), ((int)(((byte)(104)))));
            this.btnShowPassword.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnShowPassword.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnShowPassword.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnShowPassword.HighEmphasis = true;
            this.btnShowPassword.Icon = null;
            this.btnShowPassword.IsDarkTheme = false;
            this.btnShowPassword.Location = new System.Drawing.Point(689, 169);
            this.btnShowPassword.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnShowPassword.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnShowPassword.Name = "btnShowPassword";
            this.btnShowPassword.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnShowPassword.Size = new System.Drawing.Size(104, 36);
            this.btnShowPassword.TabIndex = 3;
            this.btnShowPassword.Text = "Tampilkan";
            this.btnShowPassword.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnShowPassword.UseAccentColor = false;
            this.btnShowPassword.UseVisualStyleBackColor = false;
            this.btnShowPassword.Click += new System.EventHandler(this.btnShowPassword_Click);
            // 
            // FormREG
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnShowPassword);
            this.Controls.Add(this.labelKonfirmasiPassword);
            this.Controls.Add(this.inputConfirmPassword);
            this.Controls.Add(this.linkLabelLogin);
            this.Controls.Add(this.labelAkun);
            this.Controls.Add(this.labelPassword);
            this.Controls.Add(this.inputPassword);
            this.Controls.Add(this.labelUsername);
            this.Controls.Add(this.inputUsername);
            this.Controls.Add(this.btnRegister);
            this.Name = "FormREG";
            this.Opacity = 1D;
            this.Text = "Register";
            this.Shown += new System.EventHandler(this.FormREG_Shown);
            this.Controls.SetChildIndex(this.btnRegister, 0);
            this.Controls.SetChildIndex(this.inputUsername, 0);
            this.Controls.SetChildIndex(this.labelUsername, 0);
            this.Controls.SetChildIndex(this.inputPassword, 0);
            this.Controls.SetChildIndex(this.labelPassword, 0);
            this.Controls.SetChildIndex(this.labelAkun, 0);
            this.Controls.SetChildIndex(this.linkLabelLogin, 0);
            this.Controls.SetChildIndex(this.inputConfirmPassword, 0);
            this.Controls.SetChildIndex(this.labelKonfirmasiPassword, 0);
            this.Controls.SetChildIndex(this.btnShowPassword, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.LinkLabel linkLabelLogin;
        private MaterialSkin.Controls.MaterialLabel labelAkun;
        private MaterialSkin.Controls.MaterialLabel labelPassword;
        private ManajemenLaundrySepatu.MyTextBox inputPassword;
        private MaterialSkin.Controls.MaterialLabel labelUsername;
        private ManajemenLaundrySepatu.MyTextBox inputUsername;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnRegister;
        private MaterialSkin.Controls.MaterialLabel labelKonfirmasiPassword;
        private ManajemenLaundrySepatu.MyTextBox inputConfirmPassword;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnShowPassword;
    }
}