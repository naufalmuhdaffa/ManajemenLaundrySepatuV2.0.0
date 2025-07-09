namespace ManajemenLaundrySepatu
{
    partial class FormTS
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
            this.btnKembali = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnTambahkanS = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.inputMerek = new ManajemenLaundrySepatu.MyTextBox();
            this.inputJenis = new ManajemenLaundrySepatu.MyTextBox();
            this.inputWarna = new ManajemenLaundrySepatu.MyTextBox();
            this.labelIdPelanggan = new MaterialSkin.Controls.MaterialLabel();
            this.labelMerek = new MaterialSkin.Controls.MaterialLabel();
            this.labelJenis = new MaterialSkin.Controls.MaterialLabel();
            this.labelWarna = new MaterialSkin.Controls.MaterialLabel();
            this.inputUkuran = new ManajemenLaundrySepatu.MyTextBox();
            this.labelUkuran = new MaterialSkin.Controls.MaterialLabel();
            this.inputIdPelanggan = new ManajemenLaundrySepatu.MyComboBox();
            this.btnRefreshDataSepatu = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnShowCacheSepatu = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.SuspendLayout();
            // 
            // themeSwitch
            // 
            this.themeSwitch.Location = new System.Drawing.Point(629, 24);
            this.themeSwitch.Size = new System.Drawing.Size(170, 39);
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
            this.btnKembali.TabIndex = 9;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnKembali.UseAccentColor = false;
            this.btnKembali.UseVisualStyleBackColor = false;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnTambahkanS
            // 
            this.btnTambahkanS.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnTambahkanS.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnTambahkanS.BorderColor = System.Drawing.Color.Gray;
            this.btnTambahkanS.BorderSize = 2;
            this.btnTambahkanS.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTambahkanS.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnTambahkanS.Depth = 0;
            this.btnTambahkanS.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnTambahkanS.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnTambahkanS.HighEmphasis = true;
            this.btnTambahkanS.Icon = null;
            this.btnTambahkanS.IsDarkTheme = false;
            this.btnTambahkanS.Location = new System.Drawing.Point(323, 405);
            this.btnTambahkanS.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnTambahkanS.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnTambahkanS.Name = "btnTambahkanS";
            this.btnTambahkanS.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnTambahkanS.Size = new System.Drawing.Size(112, 36);
            this.btnTambahkanS.TabIndex = 6;
            this.btnTambahkanS.Text = "Tambahkan";
            this.btnTambahkanS.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnTambahkanS.UseAccentColor = false;
            this.btnTambahkanS.UseVisualStyleBackColor = false;
            this.btnTambahkanS.Click += new System.EventHandler(this.btnTambahkanP_Click);
            // 
            // inputMerek
            // 
            this.inputMerek.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputMerek.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputMerek.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputMerek.BorderRadius = 0;
            this.inputMerek.BorderSize = 2;
            this.inputMerek.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputMerek.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputMerek.Location = new System.Drawing.Point(276, 138);
            this.inputMerek.Margin = new System.Windows.Forms.Padding(4);
            this.inputMerek.Multiline = false;
            this.inputMerek.Name = "inputMerek";
            this.inputMerek.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputMerek.PasswordChar = false;
            this.inputMerek.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputMerek.PlaceholderText = "";
            this.inputMerek.ReadOnly = false;
            this.inputMerek.Size = new System.Drawing.Size(400, 32);
            this.inputMerek.TabIndex = 2;
            this.inputMerek.Texts = "";
            this.inputMerek.UnderlinedStyle = false;
            this.inputMerek.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputMerek_KeyPress);
            // 
            // inputJenis
            // 
            this.inputJenis.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputJenis.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputJenis.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputJenis.BorderRadius = 0;
            this.inputJenis.BorderSize = 2;
            this.inputJenis.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputJenis.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputJenis.Location = new System.Drawing.Point(276, 203);
            this.inputJenis.Margin = new System.Windows.Forms.Padding(4);
            this.inputJenis.Multiline = false;
            this.inputJenis.Name = "inputJenis";
            this.inputJenis.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputJenis.PasswordChar = false;
            this.inputJenis.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputJenis.PlaceholderText = "";
            this.inputJenis.ReadOnly = false;
            this.inputJenis.Size = new System.Drawing.Size(400, 32);
            this.inputJenis.TabIndex = 3;
            this.inputJenis.Texts = "";
            this.inputJenis.UnderlinedStyle = false;
            this.inputJenis.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputJenis_KeyPress);
            // 
            // inputWarna
            // 
            this.inputWarna.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputWarna.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputWarna.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputWarna.BorderRadius = 0;
            this.inputWarna.BorderSize = 2;
            this.inputWarna.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputWarna.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputWarna.Location = new System.Drawing.Point(276, 268);
            this.inputWarna.Margin = new System.Windows.Forms.Padding(4);
            this.inputWarna.Multiline = false;
            this.inputWarna.Name = "inputWarna";
            this.inputWarna.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputWarna.PasswordChar = false;
            this.inputWarna.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputWarna.PlaceholderText = "";
            this.inputWarna.ReadOnly = false;
            this.inputWarna.Size = new System.Drawing.Size(400, 32);
            this.inputWarna.TabIndex = 4;
            this.inputWarna.Texts = "";
            this.inputWarna.UnderlinedStyle = false;
            this.inputWarna.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputWarna_KeyPress);
            // 
            // labelIdPelanggan
            // 
            this.labelIdPelanggan.AutoSize = true;
            this.labelIdPelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelIdPelanggan.Depth = 0;
            this.labelIdPelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelIdPelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelIdPelanggan.Location = new System.Drawing.Point(123, 80);
            this.labelIdPelanggan.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelIdPelanggan.Name = "labelIdPelanggan";
            this.labelIdPelanggan.Size = new System.Drawing.Size(107, 19);
            this.labelIdPelanggan.TabIndex = 10;
            this.labelIdPelanggan.Text = "ID Pelanggan *";
            // 
            // labelMerek
            // 
            this.labelMerek.AutoSize = true;
            this.labelMerek.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelMerek.Depth = 0;
            this.labelMerek.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelMerek.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelMerek.Location = new System.Drawing.Point(123, 138);
            this.labelMerek.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelMerek.Name = "labelMerek";
            this.labelMerek.Size = new System.Drawing.Size(44, 19);
            this.labelMerek.TabIndex = 11;
            this.labelMerek.Text = "Merek";
            // 
            // labelJenis
            // 
            this.labelJenis.AutoSize = true;
            this.labelJenis.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelJenis.Depth = 0;
            this.labelJenis.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelJenis.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelJenis.Location = new System.Drawing.Point(123, 203);
            this.labelJenis.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelJenis.Name = "labelJenis";
            this.labelJenis.Size = new System.Drawing.Size(39, 19);
            this.labelJenis.TabIndex = 12;
            this.labelJenis.Text = "Jenis";
            // 
            // labelWarna
            // 
            this.labelWarna.AutoSize = true;
            this.labelWarna.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelWarna.Depth = 0;
            this.labelWarna.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelWarna.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelWarna.Location = new System.Drawing.Point(123, 268);
            this.labelWarna.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelWarna.Name = "labelWarna";
            this.labelWarna.Size = new System.Drawing.Size(47, 19);
            this.labelWarna.TabIndex = 13;
            this.labelWarna.Text = "Warna";
            // 
            // inputUkuran
            // 
            this.inputUkuran.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputUkuran.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputUkuran.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputUkuran.BorderRadius = 0;
            this.inputUkuran.BorderSize = 2;
            this.inputUkuran.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputUkuran.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputUkuran.Location = new System.Drawing.Point(276, 335);
            this.inputUkuran.Margin = new System.Windows.Forms.Padding(4);
            this.inputUkuran.Multiline = false;
            this.inputUkuran.Name = "inputUkuran";
            this.inputUkuran.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputUkuran.PasswordChar = false;
            this.inputUkuran.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputUkuran.PlaceholderText = "";
            this.inputUkuran.ReadOnly = false;
            this.inputUkuran.Size = new System.Drawing.Size(400, 32);
            this.inputUkuran.TabIndex = 5;
            this.inputUkuran.Texts = "";
            this.inputUkuran.UnderlinedStyle = false;
            this.inputUkuran.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputUkuran_KeyPress);
            // 
            // labelUkuran
            // 
            this.labelUkuran.AutoSize = true;
            this.labelUkuran.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelUkuran.Depth = 0;
            this.labelUkuran.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelUkuran.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelUkuran.Location = new System.Drawing.Point(123, 335);
            this.labelUkuran.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelUkuran.Name = "labelUkuran";
            this.labelUkuran.Size = new System.Drawing.Size(51, 19);
            this.labelUkuran.TabIndex = 14;
            this.labelUkuran.Text = "Ukuran";
            // 
            // inputIdPelanggan
            // 
            this.inputIdPelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputIdPelanggan.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputIdPelanggan.BorderSize = 1;
            this.inputIdPelanggan.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDown;
            this.inputIdPelanggan.DroppedDown = false;
            this.inputIdPelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputIdPelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputIdPelanggan.IconColor = System.Drawing.Color.MediumSlateBlue;
            this.inputIdPelanggan.ListBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(230)))), ((int)(((byte)(228)))), ((int)(((byte)(245)))));
            this.inputIdPelanggan.ListTextColor = System.Drawing.Color.DimGray;
            this.inputIdPelanggan.Location = new System.Drawing.Point(276, 77);
            this.inputIdPelanggan.MinimumSize = new System.Drawing.Size(200, 30);
            this.inputIdPelanggan.Name = "inputIdPelanggan";
            this.inputIdPelanggan.Padding = new System.Windows.Forms.Padding(1);
            this.inputIdPelanggan.Size = new System.Drawing.Size(400, 30);
            this.inputIdPelanggan.TabIndex = 1;
            this.inputIdPelanggan.Texts = "";
            this.inputIdPelanggan.Enter += new System.EventHandler(this.inputIdPelanggan_Enter);
            this.inputIdPelanggan.KeyDown += new System.Windows.Forms.KeyEventHandler(this.inputIdPelanggan_KeyDown);
            // 
            // btnRefreshDataSepatu
            // 
            this.btnRefreshDataSepatu.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnRefreshDataSepatu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnRefreshDataSepatu.BorderColor = System.Drawing.Color.Gray;
            this.btnRefreshDataSepatu.BorderSize = 2;
            this.btnRefreshDataSepatu.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnRefreshDataSepatu.Depth = 0;
            this.btnRefreshDataSepatu.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnRefreshDataSepatu.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnRefreshDataSepatu.HighEmphasis = true;
            this.btnRefreshDataSepatu.Icon = null;
            this.btnRefreshDataSepatu.IsDarkTheme = false;
            this.btnRefreshDataSepatu.Location = new System.Drawing.Point(211, 405);
            this.btnRefreshDataSepatu.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnRefreshDataSepatu.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnRefreshDataSepatu.Name = "btnRefreshDataSepatu";
            this.btnRefreshDataSepatu.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnRefreshDataSepatu.Size = new System.Drawing.Size(84, 36);
            this.btnRefreshDataSepatu.TabIndex = 7;
            this.btnRefreshDataSepatu.Text = "Refresh";
            this.btnRefreshDataSepatu.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnRefreshDataSepatu.UseAccentColor = false;
            this.btnRefreshDataSepatu.UseVisualStyleBackColor = false;
            this.btnRefreshDataSepatu.Click += new System.EventHandler(this.btnRefreshDataSepatu_Click);
            // 
            // btnShowCacheSepatu
            // 
            this.btnShowCacheSepatu.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnShowCacheSepatu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnShowCacheSepatu.BorderColor = System.Drawing.Color.Gray;
            this.btnShowCacheSepatu.BorderSize = 2;
            this.btnShowCacheSepatu.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnShowCacheSepatu.Depth = 0;
            this.btnShowCacheSepatu.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnShowCacheSepatu.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnShowCacheSepatu.HighEmphasis = true;
            this.btnShowCacheSepatu.Icon = null;
            this.btnShowCacheSepatu.IsDarkTheme = false;
            this.btnShowCacheSepatu.Location = new System.Drawing.Point(114, 405);
            this.btnShowCacheSepatu.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnShowCacheSepatu.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnShowCacheSepatu.Name = "btnShowCacheSepatu";
            this.btnShowCacheSepatu.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnShowCacheSepatu.Size = new System.Drawing.Size(69, 36);
            this.btnShowCacheSepatu.TabIndex = 8;
            this.btnShowCacheSepatu.Text = "Cache";
            this.btnShowCacheSepatu.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnShowCacheSepatu.UseAccentColor = false;
            this.btnShowCacheSepatu.UseVisualStyleBackColor = false;
            this.btnShowCacheSepatu.Click += new System.EventHandler(this.btnShowCacheSepatu_Click);
            // 
            // FormTS
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnShowCacheSepatu);
            this.Controls.Add(this.btnRefreshDataSepatu);
            this.Controls.Add(this.inputIdPelanggan);
            this.Controls.Add(this.inputUkuran);
            this.Controls.Add(this.labelUkuran);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTambahkanS);
            this.Controls.Add(this.inputMerek);
            this.Controls.Add(this.inputJenis);
            this.Controls.Add(this.inputWarna);
            this.Controls.Add(this.labelIdPelanggan);
            this.Controls.Add(this.labelMerek);
            this.Controls.Add(this.labelJenis);
            this.Controls.Add(this.labelWarna);
            this.Name = "FormTS";
            this.Opacity = 1D;
            this.Text = "Tambah Sepatu";
            this.Load += new System.EventHandler(this.FormTS_Load);
            this.Shown += new System.EventHandler(this.FormTS_Shown);
            this.Controls.SetChildIndex(this.labelWarna, 0);
            this.Controls.SetChildIndex(this.labelJenis, 0);
            this.Controls.SetChildIndex(this.labelMerek, 0);
            this.Controls.SetChildIndex(this.labelIdPelanggan, 0);
            this.Controls.SetChildIndex(this.inputWarna, 0);
            this.Controls.SetChildIndex(this.inputJenis, 0);
            this.Controls.SetChildIndex(this.inputMerek, 0);
            this.Controls.SetChildIndex(this.btnTambahkanS, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.labelUkuran, 0);
            this.Controls.SetChildIndex(this.inputUkuran, 0);
            this.Controls.SetChildIndex(this.inputIdPelanggan, 0);
            this.Controls.SetChildIndex(this.btnRefreshDataSepatu, 0);
            this.Controls.SetChildIndex(this.btnShowCacheSepatu, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnTambahkanS;
        private ManajemenLaundrySepatu.MyTextBox inputMerek;
        private ManajemenLaundrySepatu.MyTextBox inputJenis;
        private ManajemenLaundrySepatu.MyTextBox inputWarna;
        private MaterialSkin.Controls.MaterialLabel labelIdPelanggan;
        private MaterialSkin.Controls.MaterialLabel labelMerek;
        private MaterialSkin.Controls.MaterialLabel labelJenis;
        private MaterialSkin.Controls.MaterialLabel labelWarna;
        private ManajemenLaundrySepatu.MyTextBox inputUkuran;
        private MaterialSkin.Controls.MaterialLabel labelUkuran;
        private ManajemenLaundrySepatu.MyComboBox inputIdPelanggan;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnRefreshDataSepatu;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnShowCacheSepatu;
    }
}