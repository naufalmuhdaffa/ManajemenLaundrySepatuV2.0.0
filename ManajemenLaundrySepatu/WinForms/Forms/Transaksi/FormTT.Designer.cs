namespace ManajemenLaundrySepatu
{
    partial class FormTT
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
            this.btnTambahkanT = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.inputTotalHarga = new ManajemenLaundrySepatu.MyTextBox();
            this.labelIdPelanggan = new MaterialSkin.Controls.MaterialLabel();
            this.labelIdSepatu = new MaterialSkin.Controls.MaterialLabel();
            this.labelTotalHarga = new MaterialSkin.Controls.MaterialLabel();
            this.labelStatus = new MaterialSkin.Controls.MaterialLabel();
            this.comboStatus = new ManajemenLaundrySepatu.MyComboBox();
            this.inputIdPelanggan = new ManajemenLaundrySepatu.MyComboBox();
            this.inputIdSepatu = new ManajemenLaundrySepatu.MyComboBox();
            this.btnRefreshDataTransaksi = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnShowCacheTransaksi = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.SuspendLayout();
            // 
            // themeSwitch
            // 
            this.themeSwitch.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.776372F);
            this.themeSwitch.Location = new System.Drawing.Point(632, 25);
            this.themeSwitch.Size = new System.Drawing.Size(167, 38);
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
            this.btnKembali.TabIndex = 8;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnKembali.UseAccentColor = false;
            this.btnKembali.UseVisualStyleBackColor = false;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnTambahkanT
            // 
            this.btnTambahkanT.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnTambahkanT.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnTambahkanT.BorderColor = System.Drawing.Color.Gray;
            this.btnTambahkanT.BorderSize = 2;
            this.btnTambahkanT.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTambahkanT.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnTambahkanT.Depth = 0;
            this.btnTambahkanT.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnTambahkanT.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnTambahkanT.HighEmphasis = true;
            this.btnTambahkanT.Icon = null;
            this.btnTambahkanT.IsDarkTheme = false;
            this.btnTambahkanT.Location = new System.Drawing.Point(315, 405);
            this.btnTambahkanT.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnTambahkanT.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnTambahkanT.Name = "btnTambahkanT";
            this.btnTambahkanT.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnTambahkanT.Size = new System.Drawing.Size(112, 36);
            this.btnTambahkanT.TabIndex = 5;
            this.btnTambahkanT.Text = "Tambahkan";
            this.btnTambahkanT.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnTambahkanT.UseAccentColor = false;
            this.btnTambahkanT.UseVisualStyleBackColor = false;
            this.btnTambahkanT.Click += new System.EventHandler(this.btnTambahkanT_Click);
            // 
            // inputTotalHarga
            // 
            this.inputTotalHarga.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputTotalHarga.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputTotalHarga.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputTotalHarga.BorderRadius = 0;
            this.inputTotalHarga.BorderSize = 2;
            this.inputTotalHarga.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputTotalHarga.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputTotalHarga.Location = new System.Drawing.Point(283, 246);
            this.inputTotalHarga.Margin = new System.Windows.Forms.Padding(4);
            this.inputTotalHarga.Multiline = false;
            this.inputTotalHarga.Name = "inputTotalHarga";
            this.inputTotalHarga.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputTotalHarga.PasswordChar = false;
            this.inputTotalHarga.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputTotalHarga.PlaceholderText = "";
            this.inputTotalHarga.ReadOnly = false;
            this.inputTotalHarga.Size = new System.Drawing.Size(400, 33);
            this.inputTotalHarga.TabIndex = 3;
            this.inputTotalHarga.Texts = "";
            this.inputTotalHarga.UnderlinedStyle = false;
            this.inputTotalHarga.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputTotalHarga_KeyPress);
            // 
            // labelIdPelanggan
            // 
            this.labelIdPelanggan.AutoSize = true;
            this.labelIdPelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelIdPelanggan.Depth = 0;
            this.labelIdPelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelIdPelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelIdPelanggan.Location = new System.Drawing.Point(124, 104);
            this.labelIdPelanggan.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelIdPelanggan.Name = "labelIdPelanggan";
            this.labelIdPelanggan.Size = new System.Drawing.Size(107, 19);
            this.labelIdPelanggan.TabIndex = 9;
            this.labelIdPelanggan.Text = "ID Pelanggan *";
            // 
            // labelIdSepatu
            // 
            this.labelIdSepatu.AutoSize = true;
            this.labelIdSepatu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelIdSepatu.Depth = 0;
            this.labelIdSepatu.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelIdSepatu.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelIdSepatu.Location = new System.Drawing.Point(124, 177);
            this.labelIdSepatu.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelIdSepatu.Name = "labelIdSepatu";
            this.labelIdSepatu.Size = new System.Drawing.Size(81, 19);
            this.labelIdSepatu.TabIndex = 10;
            this.labelIdSepatu.Text = "ID Sepatu *";
            // 
            // labelTotalHarga
            // 
            this.labelTotalHarga.AutoSize = true;
            this.labelTotalHarga.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelTotalHarga.Depth = 0;
            this.labelTotalHarga.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelTotalHarga.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelTotalHarga.Location = new System.Drawing.Point(124, 246);
            this.labelTotalHarga.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelTotalHarga.Name = "labelTotalHarga";
            this.labelTotalHarga.Size = new System.Drawing.Size(96, 19);
            this.labelTotalHarga.TabIndex = 11;
            this.labelTotalHarga.Text = "Total Harga *";
            // 
            // labelStatus
            // 
            this.labelStatus.AutoSize = true;
            this.labelStatus.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelStatus.Depth = 0;
            this.labelStatus.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelStatus.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelStatus.Location = new System.Drawing.Point(124, 307);
            this.labelStatus.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelStatus.Name = "labelStatus";
            this.labelStatus.Size = new System.Drawing.Size(58, 19);
            this.labelStatus.TabIndex = 12;
            this.labelStatus.Text = "Status *";
            // 
            // comboStatus
            // 
            this.comboStatus.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.comboStatus.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.comboStatus.BorderSize = 1;
            this.comboStatus.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDown;
            this.comboStatus.DroppedDown = false;
            this.comboStatus.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.comboStatus.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.comboStatus.IconColor = System.Drawing.Color.MediumSlateBlue;
            this.comboStatus.ListBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(230)))), ((int)(((byte)(228)))), ((int)(((byte)(245)))));
            this.comboStatus.ListTextColor = System.Drawing.Color.DimGray;
            this.comboStatus.Location = new System.Drawing.Point(283, 304);
            this.comboStatus.MinimumSize = new System.Drawing.Size(200, 30);
            this.comboStatus.Name = "comboStatus";
            this.comboStatus.Padding = new System.Windows.Forms.Padding(1);
            this.comboStatus.Size = new System.Drawing.Size(400, 30);
            this.comboStatus.TabIndex = 4;
            this.comboStatus.Texts = "";
            this.comboStatus.Enter += new System.EventHandler(this.comboStatus_Enter);
            this.comboStatus.KeyDown += new System.Windows.Forms.KeyEventHandler(this.comboStatus_KeyDown);
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
            this.inputIdPelanggan.Location = new System.Drawing.Point(283, 101);
            this.inputIdPelanggan.MinimumSize = new System.Drawing.Size(200, 30);
            this.inputIdPelanggan.Name = "inputIdPelanggan";
            this.inputIdPelanggan.Padding = new System.Windows.Forms.Padding(1);
            this.inputIdPelanggan.Size = new System.Drawing.Size(400, 30);
            this.inputIdPelanggan.TabIndex = 1;
            this.inputIdPelanggan.Texts = "";
            this.inputIdPelanggan.Enter += new System.EventHandler(this.inputIdPelanggan_Enter);
            this.inputIdPelanggan.KeyDown += new System.Windows.Forms.KeyEventHandler(this.inputIdPelanggan_KeyDown);
            // 
            // inputIdSepatu
            // 
            this.inputIdSepatu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputIdSepatu.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputIdSepatu.BorderSize = 1;
            this.inputIdSepatu.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDown;
            this.inputIdSepatu.DroppedDown = false;
            this.inputIdSepatu.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputIdSepatu.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputIdSepatu.IconColor = System.Drawing.Color.MediumSlateBlue;
            this.inputIdSepatu.ListBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(230)))), ((int)(((byte)(228)))), ((int)(((byte)(245)))));
            this.inputIdSepatu.ListTextColor = System.Drawing.Color.DimGray;
            this.inputIdSepatu.Location = new System.Drawing.Point(283, 174);
            this.inputIdSepatu.MinimumSize = new System.Drawing.Size(200, 30);
            this.inputIdSepatu.Name = "inputIdSepatu";
            this.inputIdSepatu.Padding = new System.Windows.Forms.Padding(1);
            this.inputIdSepatu.Size = new System.Drawing.Size(400, 30);
            this.inputIdSepatu.TabIndex = 2;
            this.inputIdSepatu.Texts = "";
            this.inputIdSepatu.Enter += new System.EventHandler(this.inputIdSepatu_Enter);
            this.inputIdSepatu.KeyDown += new System.Windows.Forms.KeyEventHandler(this.inputIdSepatu_KeyDown);
            // 
            // btnRefreshDataTransaksi
            // 
            this.btnRefreshDataTransaksi.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnRefreshDataTransaksi.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnRefreshDataTransaksi.BorderColor = System.Drawing.Color.Gray;
            this.btnRefreshDataTransaksi.BorderSize = 2;
            this.btnRefreshDataTransaksi.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnRefreshDataTransaksi.Depth = 0;
            this.btnRefreshDataTransaksi.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnRefreshDataTransaksi.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnRefreshDataTransaksi.HighEmphasis = true;
            this.btnRefreshDataTransaksi.Icon = null;
            this.btnRefreshDataTransaksi.IsDarkTheme = false;
            this.btnRefreshDataTransaksi.Location = new System.Drawing.Point(205, 405);
            this.btnRefreshDataTransaksi.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnRefreshDataTransaksi.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnRefreshDataTransaksi.Name = "btnRefreshDataTransaksi";
            this.btnRefreshDataTransaksi.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnRefreshDataTransaksi.Size = new System.Drawing.Size(84, 36);
            this.btnRefreshDataTransaksi.TabIndex = 6;
            this.btnRefreshDataTransaksi.Text = "Refresh";
            this.btnRefreshDataTransaksi.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnRefreshDataTransaksi.UseAccentColor = false;
            this.btnRefreshDataTransaksi.UseVisualStyleBackColor = false;
            this.btnRefreshDataTransaksi.Click += new System.EventHandler(this.btnRefreshDataTransaksi_Click);
            // 
            // btnShowCacheTransaksi
            // 
            this.btnShowCacheTransaksi.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnShowCacheTransaksi.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnShowCacheTransaksi.BorderColor = System.Drawing.Color.Gray;
            this.btnShowCacheTransaksi.BorderSize = 2;
            this.btnShowCacheTransaksi.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnShowCacheTransaksi.Depth = 0;
            this.btnShowCacheTransaksi.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnShowCacheTransaksi.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnShowCacheTransaksi.HighEmphasis = true;
            this.btnShowCacheTransaksi.Icon = null;
            this.btnShowCacheTransaksi.IsDarkTheme = false;
            this.btnShowCacheTransaksi.Location = new System.Drawing.Point(113, 405);
            this.btnShowCacheTransaksi.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnShowCacheTransaksi.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnShowCacheTransaksi.Name = "btnShowCacheTransaksi";
            this.btnShowCacheTransaksi.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnShowCacheTransaksi.Size = new System.Drawing.Size(69, 36);
            this.btnShowCacheTransaksi.TabIndex = 7;
            this.btnShowCacheTransaksi.Text = "Cache";
            this.btnShowCacheTransaksi.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnShowCacheTransaksi.UseAccentColor = false;
            this.btnShowCacheTransaksi.UseVisualStyleBackColor = false;
            this.btnShowCacheTransaksi.Click += new System.EventHandler(this.btnShowCacheTransaksi_Click);
            // 
            // FormTT
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnShowCacheTransaksi);
            this.Controls.Add(this.btnRefreshDataTransaksi);
            this.Controls.Add(this.inputIdSepatu);
            this.Controls.Add(this.inputIdPelanggan);
            this.Controls.Add(this.comboStatus);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTambahkanT);
            this.Controls.Add(this.inputTotalHarga);
            this.Controls.Add(this.labelIdPelanggan);
            this.Controls.Add(this.labelIdSepatu);
            this.Controls.Add(this.labelTotalHarga);
            this.Controls.Add(this.labelStatus);
            this.Name = "FormTT";
            this.Opacity = 1D;
            this.Text = "Tambah Transaksi";
            this.Load += new System.EventHandler(this.FormTT_Load);
            this.Shown += new System.EventHandler(this.FormTT_Shown);
            this.Controls.SetChildIndex(this.labelStatus, 0);
            this.Controls.SetChildIndex(this.labelTotalHarga, 0);
            this.Controls.SetChildIndex(this.labelIdSepatu, 0);
            this.Controls.SetChildIndex(this.labelIdPelanggan, 0);
            this.Controls.SetChildIndex(this.inputTotalHarga, 0);
            this.Controls.SetChildIndex(this.btnTambahkanT, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.comboStatus, 0);
            this.Controls.SetChildIndex(this.inputIdPelanggan, 0);
            this.Controls.SetChildIndex(this.inputIdSepatu, 0);
            this.Controls.SetChildIndex(this.btnRefreshDataTransaksi, 0);
            this.Controls.SetChildIndex(this.btnShowCacheTransaksi, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnTambahkanT;
        private ManajemenLaundrySepatu.MyTextBox inputTotalHarga;
        private MaterialSkin.Controls.MaterialLabel labelIdPelanggan;
        private MaterialSkin.Controls.MaterialLabel labelIdSepatu;
        private MaterialSkin.Controls.MaterialLabel labelTotalHarga;
        private MaterialSkin.Controls.MaterialLabel labelStatus;
        private ManajemenLaundrySepatu.MyComboBox comboStatus;
        private ManajemenLaundrySepatu.MyComboBox inputIdPelanggan;
        private ManajemenLaundrySepatu.MyComboBox inputIdSepatu;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnRefreshDataTransaksi;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnShowCacheTransaksi;
    }
}