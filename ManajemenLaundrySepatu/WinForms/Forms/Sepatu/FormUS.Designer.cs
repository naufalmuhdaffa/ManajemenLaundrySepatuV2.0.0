namespace ManajemenLaundrySepatu
{
    partial class FormUS
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
            this.btnUpdate = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.inputIdPelanggan = new ManajemenLaundrySepatu.MyTextBox();
            this.inputMerek = new ManajemenLaundrySepatu.MyTextBox();
            this.inputJenis = new ManajemenLaundrySepatu.MyTextBox();
            this.inputWarna = new ManajemenLaundrySepatu.MyTextBox();
            this.labelIdPelanggan = new MaterialSkin.Controls.MaterialLabel();
            this.labelMerek = new MaterialSkin.Controls.MaterialLabel();
            this.labelJenis = new MaterialSkin.Controls.MaterialLabel();
            this.labelWarna = new MaterialSkin.Controls.MaterialLabel();
            this.dgvSepatu = new System.Windows.Forms.DataGridView();
            this.inputIdSepatu = new ManajemenLaundrySepatu.MyTextBox();
            this.labelIdSepatu = new MaterialSkin.Controls.MaterialLabel();
            this.inputUkuran = new ManajemenLaundrySepatu.MyTextBox();
            this.labelUkuran = new MaterialSkin.Controls.MaterialLabel();
            this.btnRefreshDataSepatu = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnShowCacheSepatu = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.inputSearchSepatu = new ManajemenLaundrySepatu.MyTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSepatu)).BeginInit();
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
            this.btnKembali.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKembali.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnKembali.Depth = 0;
            this.btnKembali.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnKembali.HighEmphasis = true;
            this.btnKembali.Icon = null;
            this.btnKembali.Location = new System.Drawing.Point(6, 405);
            this.btnKembali.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnKembali.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnKembali.Name = "btnKembali";
            this.btnKembali.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnKembali.Size = new System.Drawing.Size(83, 36);
            this.btnKembali.TabIndex = 12;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnKembali.UseAccentColor = false;
            this.btnKembali.UseVisualStyleBackColor = false;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnUpdate
            // 
            this.btnUpdate.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnUpdate.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnUpdate.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnUpdate.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnUpdate.Depth = 0;
            this.btnUpdate.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnUpdate.HighEmphasis = true;
            this.btnUpdate.Icon = null;
            this.btnUpdate.Location = new System.Drawing.Point(301, 405);
            this.btnUpdate.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnUpdate.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnUpdate.Size = new System.Drawing.Size(77, 36);
            this.btnUpdate.TabIndex = 9;
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
            this.inputIdPelanggan.Location = new System.Drawing.Point(388, 152);
            this.inputIdPelanggan.Margin = new System.Windows.Forms.Padding(4);
            this.inputIdPelanggan.Multiline = false;
            this.inputIdPelanggan.Name = "inputIdPelanggan";
            this.inputIdPelanggan.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputIdPelanggan.PasswordChar = false;
            this.inputIdPelanggan.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputIdPelanggan.PlaceholderText = "Pilih ID Pelanggan dari tabel..";
            this.inputIdPelanggan.ReadOnly = false;
            this.inputIdPelanggan.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputIdPelanggan.Size = new System.Drawing.Size(405, 32);
            this.inputIdPelanggan.TabIndex = 4;
            this.inputIdPelanggan.TabStop = false;
            this.inputIdPelanggan.Texts = "";
            this.inputIdPelanggan.UnderlinedStyle = false;
            // 
            // inputMerek
            // 
            this.inputMerek.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputMerek.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputMerek.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputMerek.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputMerek.BorderRadius = 0;
            this.inputMerek.BorderSize = 2;
            this.inputMerek.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputMerek.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputMerek.Location = new System.Drawing.Point(386, 213);
            this.inputMerek.Margin = new System.Windows.Forms.Padding(4);
            this.inputMerek.Multiline = false;
            this.inputMerek.Name = "inputMerek";
            this.inputMerek.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputMerek.PasswordChar = false;
            this.inputMerek.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputMerek.PlaceholderText = "";
            this.inputMerek.ReadOnly = false;
            this.inputMerek.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputMerek.Size = new System.Drawing.Size(407, 32);
            this.inputMerek.TabIndex = 5;
            this.inputMerek.TabStop = false;
            this.inputMerek.Texts = "";
            this.inputMerek.UnderlinedStyle = false;
            // 
            // inputJenis
            // 
            this.inputJenis.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputJenis.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputJenis.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputJenis.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputJenis.BorderRadius = 0;
            this.inputJenis.BorderSize = 2;
            this.inputJenis.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputJenis.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputJenis.Location = new System.Drawing.Point(386, 277);
            this.inputJenis.Margin = new System.Windows.Forms.Padding(4);
            this.inputJenis.Multiline = false;
            this.inputJenis.Name = "inputJenis";
            this.inputJenis.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputJenis.PasswordChar = false;
            this.inputJenis.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputJenis.PlaceholderText = "";
            this.inputJenis.ReadOnly = false;
            this.inputJenis.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputJenis.Size = new System.Drawing.Size(407, 32);
            this.inputJenis.TabIndex = 6;
            this.inputJenis.TabStop = false;
            this.inputJenis.Texts = "";
            this.inputJenis.UnderlinedStyle = false;
            // 
            // inputWarna
            // 
            this.inputWarna.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputWarna.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputWarna.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputWarna.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputWarna.BorderRadius = 0;
            this.inputWarna.BorderSize = 2;
            this.inputWarna.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputWarna.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputWarna.Location = new System.Drawing.Point(386, 340);
            this.inputWarna.Margin = new System.Windows.Forms.Padding(4);
            this.inputWarna.Multiline = false;
            this.inputWarna.Name = "inputWarna";
            this.inputWarna.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputWarna.PasswordChar = false;
            this.inputWarna.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputWarna.PlaceholderText = "";
            this.inputWarna.ReadOnly = false;
            this.inputWarna.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputWarna.Size = new System.Drawing.Size(407, 32);
            this.inputWarna.TabIndex = 7;
            this.inputWarna.TabStop = false;
            this.inputWarna.Texts = "";
            this.inputWarna.UnderlinedStyle = false;
            // 
            // labelIdPelanggan
            // 
            this.labelIdPelanggan.AutoSize = true;
            this.labelIdPelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelIdPelanggan.Depth = 0;
            this.labelIdPelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelIdPelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelIdPelanggan.Location = new System.Drawing.Point(388, 129);
            this.labelIdPelanggan.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelIdPelanggan.Name = "labelIdPelanggan";
            this.labelIdPelanggan.Size = new System.Drawing.Size(107, 19);
            this.labelIdPelanggan.TabIndex = 14;
            this.labelIdPelanggan.Text = "ID Pelanggan *";
            // 
            // labelMerek
            // 
            this.labelMerek.AutoSize = true;
            this.labelMerek.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelMerek.Depth = 0;
            this.labelMerek.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelMerek.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelMerek.Location = new System.Drawing.Point(386, 190);
            this.labelMerek.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelMerek.Name = "labelMerek";
            this.labelMerek.Size = new System.Drawing.Size(44, 19);
            this.labelMerek.TabIndex = 15;
            this.labelMerek.Text = "Merek";
            // 
            // labelJenis
            // 
            this.labelJenis.AutoSize = true;
            this.labelJenis.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelJenis.Depth = 0;
            this.labelJenis.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelJenis.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelJenis.Location = new System.Drawing.Point(386, 254);
            this.labelJenis.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelJenis.Name = "labelJenis";
            this.labelJenis.Size = new System.Drawing.Size(39, 19);
            this.labelJenis.TabIndex = 16;
            this.labelJenis.Text = "Jenis";
            // 
            // labelWarna
            // 
            this.labelWarna.AutoSize = true;
            this.labelWarna.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelWarna.Depth = 0;
            this.labelWarna.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelWarna.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelWarna.Location = new System.Drawing.Point(386, 317);
            this.labelWarna.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelWarna.Name = "labelWarna";
            this.labelWarna.Size = new System.Drawing.Size(47, 19);
            this.labelWarna.TabIndex = 17;
            this.labelWarna.Text = "Warna";
            // 
            // dgvSepatu
            // 
            this.dgvSepatu.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvSepatu.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.dgvSepatu.Location = new System.Drawing.Point(6, 107);
            this.dgvSepatu.Name = "dgvSepatu";
            this.dgvSepatu.RowHeadersWidth = 62;
            this.dgvSepatu.RowTemplate.Height = 28;
            this.dgvSepatu.Size = new System.Drawing.Size(374, 289);
            this.dgvSepatu.TabIndex = 2;
            this.dgvSepatu.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvSepatu_CellClick);
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
            this.inputIdSepatu.Location = new System.Drawing.Point(388, 89);
            this.inputIdSepatu.Margin = new System.Windows.Forms.Padding(4);
            this.inputIdSepatu.Multiline = false;
            this.inputIdSepatu.Name = "inputIdSepatu";
            this.inputIdSepatu.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputIdSepatu.PasswordChar = false;
            this.inputIdSepatu.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputIdSepatu.PlaceholderText = "Pilih ID Sepatu dari tabel..";
            this.inputIdSepatu.ReadOnly = false;
            this.inputIdSepatu.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputIdSepatu.Size = new System.Drawing.Size(405, 32);
            this.inputIdSepatu.TabIndex = 3;
            this.inputIdSepatu.TabStop = false;
            this.inputIdSepatu.Texts = "";
            this.inputIdSepatu.UnderlinedStyle = false;
            // 
            // labelIdSepatu
            // 
            this.labelIdSepatu.AutoSize = true;
            this.labelIdSepatu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelIdSepatu.Depth = 0;
            this.labelIdSepatu.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelIdSepatu.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelIdSepatu.Location = new System.Drawing.Point(388, 66);
            this.labelIdSepatu.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelIdSepatu.Name = "labelIdSepatu";
            this.labelIdSepatu.Size = new System.Drawing.Size(81, 19);
            this.labelIdSepatu.TabIndex = 13;
            this.labelIdSepatu.Text = "ID Sepatu *";
            // 
            // inputUkuran
            // 
            this.inputUkuran.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputUkuran.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputUkuran.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputUkuran.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputUkuran.BorderRadius = 0;
            this.inputUkuran.BorderSize = 2;
            this.inputUkuran.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputUkuran.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputUkuran.Location = new System.Drawing.Point(386, 401);
            this.inputUkuran.Margin = new System.Windows.Forms.Padding(4);
            this.inputUkuran.Multiline = false;
            this.inputUkuran.Name = "inputUkuran";
            this.inputUkuran.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputUkuran.PasswordChar = false;
            this.inputUkuran.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputUkuran.PlaceholderText = "";
            this.inputUkuran.ReadOnly = false;
            this.inputUkuran.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputUkuran.Size = new System.Drawing.Size(407, 32);
            this.inputUkuran.TabIndex = 8;
            this.inputUkuran.TabStop = false;
            this.inputUkuran.Texts = "";
            this.inputUkuran.UnderlinedStyle = false;
            // 
            // labelUkuran
            // 
            this.labelUkuran.AutoSize = true;
            this.labelUkuran.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelUkuran.Depth = 0;
            this.labelUkuran.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelUkuran.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelUkuran.Location = new System.Drawing.Point(386, 382);
            this.labelUkuran.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelUkuran.Name = "labelUkuran";
            this.labelUkuran.Size = new System.Drawing.Size(51, 19);
            this.labelUkuran.TabIndex = 18;
            this.labelUkuran.Text = "Ukuran";
            // 
            // btnRefreshDataSepatu
            // 
            this.btnRefreshDataSepatu.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnRefreshDataSepatu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnRefreshDataSepatu.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnRefreshDataSepatu.Depth = 0;
            this.btnRefreshDataSepatu.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnRefreshDataSepatu.HighEmphasis = true;
            this.btnRefreshDataSepatu.Icon = null;
            this.btnRefreshDataSepatu.Location = new System.Drawing.Point(198, 405);
            this.btnRefreshDataSepatu.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnRefreshDataSepatu.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnRefreshDataSepatu.Name = "btnRefreshDataSepatu";
            this.btnRefreshDataSepatu.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnRefreshDataSepatu.Size = new System.Drawing.Size(84, 36);
            this.btnRefreshDataSepatu.TabIndex = 10;
            this.btnRefreshDataSepatu.Text = "Refresh";
            this.btnRefreshDataSepatu.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnRefreshDataSepatu.UseAccentColor = false;
            this.btnRefreshDataSepatu.UseVisualStyleBackColor = false;
            this.btnRefreshDataSepatu.Click += new System.EventHandler(this.btnRefreshDataSepatu_Click);
            // 
            // btnShowCacheSepatu
            // 
            this.btnShowCacheSepatu.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnShowCacheSepatu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnShowCacheSepatu.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnShowCacheSepatu.Depth = 0;
            this.btnShowCacheSepatu.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnShowCacheSepatu.HighEmphasis = true;
            this.btnShowCacheSepatu.Icon = null;
            this.btnShowCacheSepatu.Location = new System.Drawing.Point(108, 405);
            this.btnShowCacheSepatu.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnShowCacheSepatu.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnShowCacheSepatu.Name = "btnShowCacheSepatu";
            this.btnShowCacheSepatu.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnShowCacheSepatu.Size = new System.Drawing.Size(69, 36);
            this.btnShowCacheSepatu.TabIndex = 11;
            this.btnShowCacheSepatu.Text = "Cache";
            this.btnShowCacheSepatu.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnShowCacheSepatu.UseAccentColor = false;
            this.btnShowCacheSepatu.UseVisualStyleBackColor = false;
            this.btnShowCacheSepatu.Click += new System.EventHandler(this.btnShowCacheSepatu_Click);
            // 
            // inputSearchSepatu
            // 
            this.inputSearchSepatu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputSearchSepatu.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputSearchSepatu.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputSearchSepatu.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputSearchSepatu.BorderRadius = 0;
            this.inputSearchSepatu.BorderSize = 2;
            this.inputSearchSepatu.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputSearchSepatu.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputSearchSepatu.Location = new System.Drawing.Point(7, 68);
            this.inputSearchSepatu.Margin = new System.Windows.Forms.Padding(4);
            this.inputSearchSepatu.Multiline = false;
            this.inputSearchSepatu.Name = "inputSearchSepatu";
            this.inputSearchSepatu.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputSearchSepatu.PasswordChar = false;
            this.inputSearchSepatu.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputSearchSepatu.PlaceholderText = "Ketik untuk cari sepatu…";
            this.inputSearchSepatu.ReadOnly = false;
            this.inputSearchSepatu.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputSearchSepatu.Size = new System.Drawing.Size(374, 32);
            this.inputSearchSepatu.TabIndex = 1;
            this.inputSearchSepatu.TabStop = false;
            this.inputSearchSepatu.Texts = "";
            this.inputSearchSepatu.UnderlinedStyle = false;
            // 
            // FormUS
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.inputSearchSepatu);
            this.Controls.Add(this.btnShowCacheSepatu);
            this.Controls.Add(this.btnRefreshDataSepatu);
            this.Controls.Add(this.inputUkuran);
            this.Controls.Add(this.labelUkuran);
            this.Controls.Add(this.inputIdSepatu);
            this.Controls.Add(this.labelIdSepatu);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnUpdate);
            this.Controls.Add(this.inputIdPelanggan);
            this.Controls.Add(this.inputMerek);
            this.Controls.Add(this.inputJenis);
            this.Controls.Add(this.inputWarna);
            this.Controls.Add(this.labelIdPelanggan);
            this.Controls.Add(this.labelMerek);
            this.Controls.Add(this.labelJenis);
            this.Controls.Add(this.labelWarna);
            this.Controls.Add(this.dgvSepatu);
            this.Name = "FormUS";
            this.Opacity = 1D;
            this.Text = "Update Sepatu";
            this.Load += new System.EventHandler(this.FormUS_Load);
            this.Controls.SetChildIndex(this.dgvSepatu, 0);
            this.Controls.SetChildIndex(this.labelWarna, 0);
            this.Controls.SetChildIndex(this.labelJenis, 0);
            this.Controls.SetChildIndex(this.labelMerek, 0);
            this.Controls.SetChildIndex(this.labelIdPelanggan, 0);
            this.Controls.SetChildIndex(this.inputWarna, 0);
            this.Controls.SetChildIndex(this.inputJenis, 0);
            this.Controls.SetChildIndex(this.inputMerek, 0);
            this.Controls.SetChildIndex(this.inputIdPelanggan, 0);
            this.Controls.SetChildIndex(this.btnUpdate, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.labelIdSepatu, 0);
            this.Controls.SetChildIndex(this.inputIdSepatu, 0);
            this.Controls.SetChildIndex(this.labelUkuran, 0);
            this.Controls.SetChildIndex(this.inputUkuran, 0);
            this.Controls.SetChildIndex(this.btnRefreshDataSepatu, 0);
            this.Controls.SetChildIndex(this.btnShowCacheSepatu, 0);
            this.Controls.SetChildIndex(this.inputSearchSepatu, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            ((System.ComponentModel.ISupportInitialize)(this.dgvSepatu)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnUpdate;
        private ManajemenLaundrySepatu.MyTextBox inputIdPelanggan;
        private ManajemenLaundrySepatu.MyTextBox inputMerek;
        private ManajemenLaundrySepatu.MyTextBox inputJenis;
        private ManajemenLaundrySepatu.MyTextBox inputWarna;
        private MaterialSkin.Controls.MaterialLabel labelIdPelanggan;
        private MaterialSkin.Controls.MaterialLabel labelMerek;
        private MaterialSkin.Controls.MaterialLabel labelJenis;
        private MaterialSkin.Controls.MaterialLabel labelWarna;
        private System.Windows.Forms.DataGridView dgvSepatu;
        private ManajemenLaundrySepatu.MyTextBox inputIdSepatu;
        private MaterialSkin.Controls.MaterialLabel labelIdSepatu;
        private ManajemenLaundrySepatu.MyTextBox inputUkuran;
        private MaterialSkin.Controls.MaterialLabel labelUkuran;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnRefreshDataSepatu;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnShowCacheSepatu;
        private ManajemenLaundrySepatu.MyTextBox inputSearchSepatu;
    }
}