namespace ManajemenLaundrySepatu
{
    partial class FormTP
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
            this.labelAlamat = new MaterialSkin.Controls.MaterialLabel();
            this.labelNoHP = new MaterialSkin.Controls.MaterialLabel();
            this.labelNamaPelanggan = new MaterialSkin.Controls.MaterialLabel();
            this.labelIdPelanggan = new MaterialSkin.Controls.MaterialLabel();
            this.inputAlamat = new ManajemenLaundrySepatu.MyTextBox();
            this.inputNoHP = new ManajemenLaundrySepatu.MyTextBox();
            this.inputNamaPelanggan = new ManajemenLaundrySepatu.MyTextBox();
            this.inputIdPelanggan = new ManajemenLaundrySepatu.MyTextBox();
            this.btnTambahkanP = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnKembali = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.SuspendLayout();
            // 
            // themeSwitch
            // 
            this.themeSwitch.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.776372F);
            this.themeSwitch.Location = new System.Drawing.Point(632, 25);
            this.themeSwitch.Size = new System.Drawing.Size(167, 38);
            // 
            // labelAlamat
            // 
            this.labelAlamat.AutoSize = true;
            this.labelAlamat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelAlamat.Depth = 0;
            this.labelAlamat.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelAlamat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelAlamat.Location = new System.Drawing.Point(106, 302);
            this.labelAlamat.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelAlamat.Name = "labelAlamat";
            this.labelAlamat.Size = new System.Drawing.Size(52, 19);
            this.labelAlamat.TabIndex = 10;
            this.labelAlamat.Text = "Alamat";
            // 
            // labelNoHP
            // 
            this.labelNoHP.AutoSize = true;
            this.labelNoHP.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelNoHP.Depth = 0;
            this.labelNoHP.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelNoHP.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelNoHP.Location = new System.Drawing.Point(106, 228);
            this.labelNoHP.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelNoHP.Name = "labelNoHP";
            this.labelNoHP.Size = new System.Drawing.Size(57, 19);
            this.labelNoHP.TabIndex = 9;
            this.labelNoHP.Text = "No HP *";
            // 
            // labelNamaPelanggan
            // 
            this.labelNamaPelanggan.AutoSize = true;
            this.labelNamaPelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelNamaPelanggan.Depth = 0;
            this.labelNamaPelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelNamaPelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelNamaPelanggan.Location = new System.Drawing.Point(106, 161);
            this.labelNamaPelanggan.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelNamaPelanggan.Name = "labelNamaPelanggan";
            this.labelNamaPelanggan.Size = new System.Drawing.Size(55, 19);
            this.labelNamaPelanggan.TabIndex = 8;
            this.labelNamaPelanggan.Text = "Nama *";
            // 
            // labelIdPelanggan
            // 
            this.labelIdPelanggan.AutoSize = true;
            this.labelIdPelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelIdPelanggan.Depth = 0;
            this.labelIdPelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelIdPelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelIdPelanggan.Location = new System.Drawing.Point(106, 94);
            this.labelIdPelanggan.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelIdPelanggan.Name = "labelIdPelanggan";
            this.labelIdPelanggan.Size = new System.Drawing.Size(107, 19);
            this.labelIdPelanggan.TabIndex = 7;
            this.labelIdPelanggan.Text = "ID Pelanggan *";
            // 
            // inputAlamat
            // 
            this.inputAlamat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputAlamat.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputAlamat.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputAlamat.BorderRadius = 0;
            this.inputAlamat.BorderSize = 2;
            this.inputAlamat.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputAlamat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputAlamat.Location = new System.Drawing.Point(265, 302);
            this.inputAlamat.Margin = new System.Windows.Forms.Padding(4);
            this.inputAlamat.Multiline = false;
            this.inputAlamat.Name = "inputAlamat";
            this.inputAlamat.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputAlamat.PasswordChar = false;
            this.inputAlamat.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputAlamat.PlaceholderText = "";
            this.inputAlamat.ReadOnly = false;
            this.inputAlamat.Size = new System.Drawing.Size(400, 33);
            this.inputAlamat.TabIndex = 4;
            this.inputAlamat.Texts = "";
            this.inputAlamat.UnderlinedStyle = false;
            this.inputAlamat.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputAlamat_KeyPress);
            // 
            // inputNoHP
            // 
            this.inputNoHP.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputNoHP.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputNoHP.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputNoHP.BorderRadius = 0;
            this.inputNoHP.BorderSize = 2;
            this.inputNoHP.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputNoHP.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputNoHP.Location = new System.Drawing.Point(265, 228);
            this.inputNoHP.Margin = new System.Windows.Forms.Padding(4);
            this.inputNoHP.Multiline = false;
            this.inputNoHP.Name = "inputNoHP";
            this.inputNoHP.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputNoHP.PasswordChar = false;
            this.inputNoHP.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputNoHP.PlaceholderText = "";
            this.inputNoHP.ReadOnly = false;
            this.inputNoHP.Size = new System.Drawing.Size(400, 33);
            this.inputNoHP.TabIndex = 3;
            this.inputNoHP.Texts = "";
            this.inputNoHP.UnderlinedStyle = false;
            this.inputNoHP.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputNoHP_KeyPress);
            // 
            // inputNamaPelanggan
            // 
            this.inputNamaPelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputNamaPelanggan.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputNamaPelanggan.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputNamaPelanggan.BorderRadius = 0;
            this.inputNamaPelanggan.BorderSize = 2;
            this.inputNamaPelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputNamaPelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputNamaPelanggan.Location = new System.Drawing.Point(265, 161);
            this.inputNamaPelanggan.Margin = new System.Windows.Forms.Padding(4);
            this.inputNamaPelanggan.Multiline = false;
            this.inputNamaPelanggan.Name = "inputNamaPelanggan";
            this.inputNamaPelanggan.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputNamaPelanggan.PasswordChar = false;
            this.inputNamaPelanggan.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputNamaPelanggan.PlaceholderText = "";
            this.inputNamaPelanggan.ReadOnly = false;
            this.inputNamaPelanggan.Size = new System.Drawing.Size(400, 33);
            this.inputNamaPelanggan.TabIndex = 2;
            this.inputNamaPelanggan.Texts = "";
            this.inputNamaPelanggan.UnderlinedStyle = false;
            this.inputNamaPelanggan.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputNamaPelanggan_KeyPress);
            // 
            // inputIdPelanggan
            // 
            this.inputIdPelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputIdPelanggan.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputIdPelanggan.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputIdPelanggan.BorderRadius = 0;
            this.inputIdPelanggan.BorderSize = 2;
            this.inputIdPelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputIdPelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputIdPelanggan.Location = new System.Drawing.Point(265, 94);
            this.inputIdPelanggan.Margin = new System.Windows.Forms.Padding(4);
            this.inputIdPelanggan.Multiline = false;
            this.inputIdPelanggan.Name = "inputIdPelanggan";
            this.inputIdPelanggan.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputIdPelanggan.PasswordChar = false;
            this.inputIdPelanggan.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputIdPelanggan.PlaceholderText = "";
            this.inputIdPelanggan.ReadOnly = false;
            this.inputIdPelanggan.Size = new System.Drawing.Size(400, 33);
            this.inputIdPelanggan.TabIndex = 1;
            this.inputIdPelanggan.Texts = "";
            this.inputIdPelanggan.UnderlinedStyle = false;
            this.inputIdPelanggan.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputIdPelanggan_KeyPress);
            // 
            // btnTambahkanP
            // 
            this.btnTambahkanP.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnTambahkanP.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnTambahkanP.BorderColor = System.Drawing.Color.Gray;
            this.btnTambahkanP.BorderSize = 2;
            this.btnTambahkanP.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTambahkanP.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnTambahkanP.Depth = 0;
            this.btnTambahkanP.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnTambahkanP.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnTambahkanP.HighEmphasis = true;
            this.btnTambahkanP.Icon = null;
            this.btnTambahkanP.IsDarkTheme = false;
            this.btnTambahkanP.Location = new System.Drawing.Point(340, 405);
            this.btnTambahkanP.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnTambahkanP.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnTambahkanP.Name = "btnTambahkanP";
            this.btnTambahkanP.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnTambahkanP.Size = new System.Drawing.Size(112, 36);
            this.btnTambahkanP.TabIndex = 5;
            this.btnTambahkanP.Text = "Tambahkan";
            this.btnTambahkanP.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnTambahkanP.UseAccentColor = false;
            this.btnTambahkanP.UseVisualStyleBackColor = false;
            this.btnTambahkanP.Click += new System.EventHandler(this.btnTambahkanP_Click);
            // 
            // btnKembali
            // 
            this.btnKembali.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnKembali.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnKembali.BorderColor = System.Drawing.Color.Gray;
            this.btnKembali.BorderSize = 2;
            this.btnKembali.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKembali.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnKembali.Depth = 0;
            this.btnKembali.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnKembali.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnKembali.HighEmphasis = true;
            this.btnKembali.Icon = null;
            this.btnKembali.IsDarkTheme = false;
            this.btnKembali.Location = new System.Drawing.Point(7, 405);
            this.btnKembali.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnKembali.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnKembali.Name = "btnKembali";
            this.btnKembali.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnKembali.Size = new System.Drawing.Size(83, 36);
            this.btnKembali.TabIndex = 6;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnKembali.UseAccentColor = false;
            this.btnKembali.UseVisualStyleBackColor = false;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // FormTP
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTambahkanP);
            this.Controls.Add(this.inputIdPelanggan);
            this.Controls.Add(this.inputNamaPelanggan);
            this.Controls.Add(this.inputNoHP);
            this.Controls.Add(this.inputAlamat);
            this.Controls.Add(this.labelIdPelanggan);
            this.Controls.Add(this.labelNamaPelanggan);
            this.Controls.Add(this.labelNoHP);
            this.Controls.Add(this.labelAlamat);
            this.Name = "FormTP";
            this.Opacity = 1D;
            this.Text = "Tambah Pelanggan";
            this.Shown += new System.EventHandler(this.FormTP_Shown);
            this.Controls.SetChildIndex(this.labelAlamat, 0);
            this.Controls.SetChildIndex(this.labelNoHP, 0);
            this.Controls.SetChildIndex(this.labelNamaPelanggan, 0);
            this.Controls.SetChildIndex(this.labelIdPelanggan, 0);
            this.Controls.SetChildIndex(this.inputAlamat, 0);
            this.Controls.SetChildIndex(this.inputNoHP, 0);
            this.Controls.SetChildIndex(this.inputNamaPelanggan, 0);
            this.Controls.SetChildIndex(this.inputIdPelanggan, 0);
            this.Controls.SetChildIndex(this.btnTambahkanP, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private MaterialSkin.Controls.MaterialLabel labelAlamat;
        private MaterialSkin.Controls.MaterialLabel labelNoHP;
        private MaterialSkin.Controls.MaterialLabel labelNamaPelanggan;
        private MaterialSkin.Controls.MaterialLabel labelIdPelanggan;
        private ManajemenLaundrySepatu.MyTextBox inputAlamat;
        private ManajemenLaundrySepatu.MyTextBox inputNoHP;
        private ManajemenLaundrySepatu.MyTextBox inputNamaPelanggan;
        private ManajemenLaundrySepatu.MyTextBox inputIdPelanggan;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnTambahkanP;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
    }
}