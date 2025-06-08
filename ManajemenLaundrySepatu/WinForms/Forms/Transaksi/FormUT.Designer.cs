namespace ManajemenLaundrySepatu
{
    partial class FormUT
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
            this.inputIdTransaksi = new ManajemenLaundrySepatu.MyTextBox();
            this.labelIdTransaksi = new MaterialSkin.Controls.MaterialLabel();
            this.btnKembali = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnUpdate = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.inputIdPelanggan = new ManajemenLaundrySepatu.MyTextBox();
            this.inputIdSepatu = new ManajemenLaundrySepatu.MyTextBox();
            this.inputTotalHarga = new ManajemenLaundrySepatu.MyTextBox();
            this.labelIdPelanggan = new MaterialSkin.Controls.MaterialLabel();
            this.labelIdSepatu = new MaterialSkin.Controls.MaterialLabel();
            this.labelTotalHarga = new MaterialSkin.Controls.MaterialLabel();
            this.labelStatus = new MaterialSkin.Controls.MaterialLabel();
            this.dgvTransaksi = new System.Windows.Forms.DataGridView();
            this.comboStatus = new ManajemenLaundrySepatu.MyComboBox();
            this.btnRefreshDataTransaksi = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnShowCacheTransaksi = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.inputSearchTransaksi = new ManajemenLaundrySepatu.MyTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTransaksi)).BeginInit();
            this.SuspendLayout();
            // 
            // themeSwitch
            // 
            this.themeSwitch.Location = new System.Drawing.Point(629, 24);
            this.themeSwitch.Size = new System.Drawing.Size(170, 39);
            // 
            // inputIdTransaksi
            // 
            this.inputIdTransaksi.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputIdTransaksi.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputIdTransaksi.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputIdTransaksi.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputIdTransaksi.BorderRadius = 0;
            this.inputIdTransaksi.BorderSize = 2;
            this.inputIdTransaksi.Enabled = false;
            this.inputIdTransaksi.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputIdTransaksi.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputIdTransaksi.Location = new System.Drawing.Point(387, 112);
            this.inputIdTransaksi.Margin = new System.Windows.Forms.Padding(4);
            this.inputIdTransaksi.Multiline = false;
            this.inputIdTransaksi.Name = "inputIdTransaksi";
            this.inputIdTransaksi.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputIdTransaksi.PasswordChar = false;
            this.inputIdTransaksi.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputIdTransaksi.PlaceholderText = "Pilih ID Transaksi dari tabel..";
            this.inputIdTransaksi.ReadOnly = false;
            this.inputIdTransaksi.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputIdTransaksi.Size = new System.Drawing.Size(407, 32);
            this.inputIdTransaksi.TabIndex = 3;
            this.inputIdTransaksi.TabStop = false;
            this.inputIdTransaksi.Texts = "";
            this.inputIdTransaksi.UnderlinedStyle = false;
            // 
            // labelIdTransaksi
            // 
            this.labelIdTransaksi.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelIdTransaksi.Depth = 0;
            this.labelIdTransaksi.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelIdTransaksi.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelIdTransaksi.Location = new System.Drawing.Point(387, 89);
            this.labelIdTransaksi.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelIdTransaksi.Name = "labelIdTransaksi";
            this.labelIdTransaksi.Size = new System.Drawing.Size(101, 19);
            this.labelIdTransaksi.TabIndex = 12;
            this.labelIdTransaksi.Text = "ID Transaksi *";
            // 
            // btnKembali
            // 
            this.btnKembali.AutoSize = false;
            this.btnKembali.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnKembali.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnKembali.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKembali.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnKembali.Depth = 0;
            this.btnKembali.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnKembali.HighEmphasis = true;
            this.btnKembali.Icon = null;
            this.btnKembali.Location = new System.Drawing.Point(7, 405);
            this.btnKembali.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnKembali.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnKembali.Name = "btnKembali";
            this.btnKembali.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnKembali.Size = new System.Drawing.Size(83, 36);
            this.btnKembali.TabIndex = 11;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnKembali.UseAccentColor = false;
            this.btnKembali.UseVisualStyleBackColor = false;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnUpdate
            // 
            this.btnUpdate.AutoSize = false;
            this.btnUpdate.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnUpdate.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnUpdate.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnUpdate.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnUpdate.Depth = 0;
            this.btnUpdate.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnUpdate.HighEmphasis = true;
            this.btnUpdate.Icon = null;
            this.btnUpdate.Location = new System.Drawing.Point(304, 405);
            this.btnUpdate.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnUpdate.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnUpdate.Size = new System.Drawing.Size(77, 36);
            this.btnUpdate.TabIndex = 8;
            this.btnUpdate.Text = "Update";
            this.btnUpdate.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnUpdate.UseAccentColor = false;
            this.btnUpdate.UseVisualStyleBackColor = false;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // inputIdPelanggan
            // 
            this.inputIdPelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputIdPelanggan.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputIdPelanggan.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputIdPelanggan.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputIdPelanggan.BorderRadius = 0;
            this.inputIdPelanggan.BorderSize = 2;
            this.inputIdPelanggan.Enabled = false;
            this.inputIdPelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputIdPelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputIdPelanggan.Location = new System.Drawing.Point(387, 187);
            this.inputIdPelanggan.Margin = new System.Windows.Forms.Padding(4);
            this.inputIdPelanggan.Multiline = false;
            this.inputIdPelanggan.Name = "inputIdPelanggan";
            this.inputIdPelanggan.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputIdPelanggan.PasswordChar = false;
            this.inputIdPelanggan.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputIdPelanggan.PlaceholderText = "Pilih ID Pelanggan dari tabel..";
            this.inputIdPelanggan.ReadOnly = false;
            this.inputIdPelanggan.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputIdPelanggan.Size = new System.Drawing.Size(407, 32);
            this.inputIdPelanggan.TabIndex = 4;
            this.inputIdPelanggan.TabStop = false;
            this.inputIdPelanggan.Texts = "";
            this.inputIdPelanggan.UnderlinedStyle = false;
            // 
            // inputIdSepatu
            // 
            this.inputIdSepatu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputIdSepatu.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputIdSepatu.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputIdSepatu.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputIdSepatu.BorderRadius = 0;
            this.inputIdSepatu.BorderSize = 2;
            this.inputIdSepatu.Enabled = false;
            this.inputIdSepatu.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputIdSepatu.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputIdSepatu.Location = new System.Drawing.Point(387, 264);
            this.inputIdSepatu.Margin = new System.Windows.Forms.Padding(4);
            this.inputIdSepatu.Multiline = false;
            this.inputIdSepatu.Name = "inputIdSepatu";
            this.inputIdSepatu.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputIdSepatu.PasswordChar = false;
            this.inputIdSepatu.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputIdSepatu.PlaceholderText = "Pilih ID Sepatu dari tabel..";
            this.inputIdSepatu.ReadOnly = false;
            this.inputIdSepatu.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputIdSepatu.Size = new System.Drawing.Size(407, 32);
            this.inputIdSepatu.TabIndex = 5;
            this.inputIdSepatu.TabStop = false;
            this.inputIdSepatu.Texts = "";
            this.inputIdSepatu.UnderlinedStyle = false;
            // 
            // inputTotalHarga
            // 
            this.inputTotalHarga.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputTotalHarga.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputTotalHarga.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputTotalHarga.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputTotalHarga.BorderRadius = 0;
            this.inputTotalHarga.BorderSize = 2;
            this.inputTotalHarga.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputTotalHarga.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputTotalHarga.Location = new System.Drawing.Point(387, 336);
            this.inputTotalHarga.Margin = new System.Windows.Forms.Padding(4);
            this.inputTotalHarga.Multiline = false;
            this.inputTotalHarga.Name = "inputTotalHarga";
            this.inputTotalHarga.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputTotalHarga.PasswordChar = false;
            this.inputTotalHarga.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputTotalHarga.PlaceholderText = "";
            this.inputTotalHarga.ReadOnly = false;
            this.inputTotalHarga.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputTotalHarga.Size = new System.Drawing.Size(407, 32);
            this.inputTotalHarga.TabIndex = 6;
            this.inputTotalHarga.TabStop = false;
            this.inputTotalHarga.Texts = "";
            this.inputTotalHarga.UnderlinedStyle = false;
            // 
            // labelIdPelanggan
            // 
            this.labelIdPelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelIdPelanggan.Depth = 0;
            this.labelIdPelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelIdPelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelIdPelanggan.Location = new System.Drawing.Point(387, 164);
            this.labelIdPelanggan.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelIdPelanggan.Name = "labelIdPelanggan";
            this.labelIdPelanggan.Size = new System.Drawing.Size(107, 19);
            this.labelIdPelanggan.TabIndex = 13;
            this.labelIdPelanggan.Text = "ID Pelanggan *";
            // 
            // labelIdSepatu
            // 
            this.labelIdSepatu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelIdSepatu.Depth = 0;
            this.labelIdSepatu.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelIdSepatu.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelIdSepatu.Location = new System.Drawing.Point(387, 241);
            this.labelIdSepatu.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelIdSepatu.Name = "labelIdSepatu";
            this.labelIdSepatu.Size = new System.Drawing.Size(81, 19);
            this.labelIdSepatu.TabIndex = 14;
            this.labelIdSepatu.Text = "ID Sepatu *";
            // 
            // labelTotalHarga
            // 
            this.labelTotalHarga.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelTotalHarga.Depth = 0;
            this.labelTotalHarga.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelTotalHarga.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelTotalHarga.Location = new System.Drawing.Point(387, 313);
            this.labelTotalHarga.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelTotalHarga.Name = "labelTotalHarga";
            this.labelTotalHarga.Size = new System.Drawing.Size(96, 19);
            this.labelTotalHarga.TabIndex = 15;
            this.labelTotalHarga.Text = "Total Harga *";
            // 
            // labelStatus
            // 
            this.labelStatus.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelStatus.Depth = 0;
            this.labelStatus.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelStatus.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelStatus.Location = new System.Drawing.Point(387, 389);
            this.labelStatus.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelStatus.Name = "labelStatus";
            this.labelStatus.Size = new System.Drawing.Size(47, 19);
            this.labelStatus.TabIndex = 16;
            this.labelStatus.Text = "Status";
            // 
            // dgvTransaksi
            // 
            this.dgvTransaksi.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvTransaksi.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.dgvTransaksi.Location = new System.Drawing.Point(7, 112);
            this.dgvTransaksi.Name = "dgvTransaksi";
            this.dgvTransaksi.RowHeadersWidth = 62;
            this.dgvTransaksi.RowTemplate.Height = 28;
            this.dgvTransaksi.Size = new System.Drawing.Size(374, 284);
            this.dgvTransaksi.TabIndex = 2;
            this.dgvTransaksi.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvTransaksi_CellClick);
            // 
            // comboStatus
            // 
            this.comboStatus.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.comboStatus.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.comboStatus.BorderSize = 1;
            this.comboStatus.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboStatus.DroppedDown = false;
            this.comboStatus.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.comboStatus.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.comboStatus.IconColor = System.Drawing.Color.MediumSlateBlue;
            this.comboStatus.ListBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(230)))), ((int)(((byte)(228)))), ((int)(((byte)(245)))));
            this.comboStatus.ListTextColor = System.Drawing.Color.DimGray;
            this.comboStatus.Location = new System.Drawing.Point(387, 411);
            this.comboStatus.MinimumSize = new System.Drawing.Size(200, 30);
            this.comboStatus.Name = "comboStatus";
            this.comboStatus.Padding = new System.Windows.Forms.Padding(1);
            this.comboStatus.Size = new System.Drawing.Size(407, 30);
            this.comboStatus.TabIndex = 7;
            this.comboStatus.Texts = "";
            // 
            // btnRefreshDataTransaksi
            // 
            this.btnRefreshDataTransaksi.AutoSize = false;
            this.btnRefreshDataTransaksi.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnRefreshDataTransaksi.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnRefreshDataTransaksi.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnRefreshDataTransaksi.Depth = 0;
            this.btnRefreshDataTransaksi.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnRefreshDataTransaksi.HighEmphasis = true;
            this.btnRefreshDataTransaksi.Icon = null;
            this.btnRefreshDataTransaksi.Location = new System.Drawing.Point(199, 405);
            this.btnRefreshDataTransaksi.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnRefreshDataTransaksi.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnRefreshDataTransaksi.Name = "btnRefreshDataTransaksi";
            this.btnRefreshDataTransaksi.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnRefreshDataTransaksi.Size = new System.Drawing.Size(84, 36);
            this.btnRefreshDataTransaksi.TabIndex = 9;
            this.btnRefreshDataTransaksi.Text = "Refresh";
            this.btnRefreshDataTransaksi.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnRefreshDataTransaksi.UseAccentColor = false;
            this.btnRefreshDataTransaksi.UseVisualStyleBackColor = false;
            this.btnRefreshDataTransaksi.Click += new System.EventHandler(this.btnRefreshDataTransaksi_Click);
            // 
            // btnShowCacheTransaksi
            // 
            this.btnShowCacheTransaksi.AutoSize = false;
            this.btnShowCacheTransaksi.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnShowCacheTransaksi.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnShowCacheTransaksi.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnShowCacheTransaksi.Depth = 0;
            this.btnShowCacheTransaksi.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnShowCacheTransaksi.HighEmphasis = true;
            this.btnShowCacheTransaksi.Icon = null;
            this.btnShowCacheTransaksi.Location = new System.Drawing.Point(108, 405);
            this.btnShowCacheTransaksi.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnShowCacheTransaksi.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnShowCacheTransaksi.Name = "btnShowCacheTransaksi";
            this.btnShowCacheTransaksi.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnShowCacheTransaksi.Size = new System.Drawing.Size(69, 36);
            this.btnShowCacheTransaksi.TabIndex = 10;
            this.btnShowCacheTransaksi.Text = "Cache";
            this.btnShowCacheTransaksi.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnShowCacheTransaksi.UseAccentColor = false;
            this.btnShowCacheTransaksi.UseVisualStyleBackColor = false;
            this.btnShowCacheTransaksi.Click += new System.EventHandler(this.btnShowCacheTransaksi_Click);
            // 
            // inputSearchTransaksi
            // 
            this.inputSearchTransaksi.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputSearchTransaksi.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputSearchTransaksi.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputSearchTransaksi.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputSearchTransaksi.BorderRadius = 0;
            this.inputSearchTransaksi.BorderSize = 2;
            this.inputSearchTransaksi.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputSearchTransaksi.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputSearchTransaksi.Location = new System.Drawing.Point(7, 73);
            this.inputSearchTransaksi.Margin = new System.Windows.Forms.Padding(4);
            this.inputSearchTransaksi.Multiline = false;
            this.inputSearchTransaksi.Name = "inputSearchTransaksi";
            this.inputSearchTransaksi.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputSearchTransaksi.PasswordChar = false;
            this.inputSearchTransaksi.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputSearchTransaksi.PlaceholderText = "Ketik untuk cari transaksi…";
            this.inputSearchTransaksi.ReadOnly = false;
            this.inputSearchTransaksi.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputSearchTransaksi.Size = new System.Drawing.Size(374, 32);
            this.inputSearchTransaksi.TabIndex = 1;
            this.inputSearchTransaksi.TabStop = false;
            this.inputSearchTransaksi.Texts = "";
            this.inputSearchTransaksi.UnderlinedStyle = false;
            // 
            // FormUT
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.inputSearchTransaksi);
            this.Controls.Add(this.btnShowCacheTransaksi);
            this.Controls.Add(this.btnRefreshDataTransaksi);
            this.Controls.Add(this.comboStatus);
            this.Controls.Add(this.inputIdTransaksi);
            this.Controls.Add(this.labelIdTransaksi);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnUpdate);
            this.Controls.Add(this.inputIdPelanggan);
            this.Controls.Add(this.inputIdSepatu);
            this.Controls.Add(this.inputTotalHarga);
            this.Controls.Add(this.labelIdPelanggan);
            this.Controls.Add(this.labelIdSepatu);
            this.Controls.Add(this.labelTotalHarga);
            this.Controls.Add(this.labelStatus);
            this.Controls.Add(this.dgvTransaksi);
            this.Name = "FormUT";
            this.Opacity = 1D;
            this.Text = "Update Transaksi";
            this.Load += new System.EventHandler(this.FormUT_Load);
            this.Controls.SetChildIndex(this.dgvTransaksi, 0);
            this.Controls.SetChildIndex(this.labelStatus, 0);
            this.Controls.SetChildIndex(this.labelTotalHarga, 0);
            this.Controls.SetChildIndex(this.labelIdSepatu, 0);
            this.Controls.SetChildIndex(this.labelIdPelanggan, 0);
            this.Controls.SetChildIndex(this.inputTotalHarga, 0);
            this.Controls.SetChildIndex(this.inputIdSepatu, 0);
            this.Controls.SetChildIndex(this.inputIdPelanggan, 0);
            this.Controls.SetChildIndex(this.btnUpdate, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.labelIdTransaksi, 0);
            this.Controls.SetChildIndex(this.inputIdTransaksi, 0);
            this.Controls.SetChildIndex(this.comboStatus, 0);
            this.Controls.SetChildIndex(this.btnRefreshDataTransaksi, 0);
            this.Controls.SetChildIndex(this.btnShowCacheTransaksi, 0);
            this.Controls.SetChildIndex(this.inputSearchTransaksi, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            ((System.ComponentModel.ISupportInitialize)(this.dgvTransaksi)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private ManajemenLaundrySepatu.MyTextBox inputIdTransaksi;
        private MaterialSkin.Controls.MaterialLabel labelIdTransaksi;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnUpdate;
        private ManajemenLaundrySepatu.MyTextBox inputIdPelanggan;
        private ManajemenLaundrySepatu.MyTextBox inputIdSepatu;
        private ManajemenLaundrySepatu.MyTextBox inputTotalHarga;
        private MaterialSkin.Controls.MaterialLabel labelIdPelanggan;
        private MaterialSkin.Controls.MaterialLabel labelIdSepatu;
        private MaterialSkin.Controls.MaterialLabel labelTotalHarga;
        private MaterialSkin.Controls.MaterialLabel labelStatus;
        private System.Windows.Forms.DataGridView dgvTransaksi;
        private ManajemenLaundrySepatu.MyComboBox comboStatus;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnRefreshDataTransaksi;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnShowCacheTransaksi;
        private ManajemenLaundrySepatu.MyTextBox inputSearchTransaksi;
    }
}