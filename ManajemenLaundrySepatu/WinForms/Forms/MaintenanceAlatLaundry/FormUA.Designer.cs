namespace ManajemenLaundrySepatu
{
    partial class FormUA
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
            this.inputNamaAlat = new ManajemenLaundrySepatu.MyTextBox();
            this.inputDeskripsi = new ManajemenLaundrySepatu.MyTextBox();
            this.labelNamaAlat = new MaterialSkin.Controls.MaterialLabel();
            this.labelTanggal = new MaterialSkin.Controls.MaterialLabel();
            this.labelAlamat = new MaterialSkin.Controls.MaterialLabel();
            this.dgvAlat = new System.Windows.Forms.DataGridView();
            this.inputTanggal = new ManajemenLaundrySepatu.MyDateTimePicker();
            this.btnRefreshDataAlat = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnShowCacheAlat = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.inputSearchAlat = new ManajemenLaundrySepatu.MyTextBox();
            this.inputIdAlat = new ManajemenLaundrySepatu.MyTextBox();
            this.labelIdAlat = new MaterialSkin.Controls.MaterialLabel();
            ((System.ComponentModel.ISupportInitialize)(this.dgvAlat)).BeginInit();
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
            this.btnKembali.TabIndex = 9;
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
            this.btnUpdate.Location = new System.Drawing.Point(303, 405);
            this.btnUpdate.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnUpdate.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnUpdate.Size = new System.Drawing.Size(77, 36);
            this.btnUpdate.TabIndex = 6;
            this.btnUpdate.Text = "Update";
            this.btnUpdate.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnUpdate.UseAccentColor = false;
            this.btnUpdate.UseVisualStyleBackColor = false;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // inputNamaAlat
            // 
            this.inputNamaAlat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputNamaAlat.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputNamaAlat.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputNamaAlat.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputNamaAlat.BorderRadius = 0;
            this.inputNamaAlat.BorderSize = 2;
            this.inputNamaAlat.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputNamaAlat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputNamaAlat.Location = new System.Drawing.Point(387, 209);
            this.inputNamaAlat.Margin = new System.Windows.Forms.Padding(4);
            this.inputNamaAlat.Multiline = false;
            this.inputNamaAlat.Name = "inputNamaAlat";
            this.inputNamaAlat.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputNamaAlat.PasswordChar = false;
            this.inputNamaAlat.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputNamaAlat.PlaceholderText = "";
            this.inputNamaAlat.ReadOnly = false;
            this.inputNamaAlat.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputNamaAlat.Size = new System.Drawing.Size(406, 32);
            this.inputNamaAlat.TabIndex = 3;
            this.inputNamaAlat.TabStop = false;
            this.inputNamaAlat.Texts = "";
            this.inputNamaAlat.UnderlinedStyle = false;
            // 
            // inputDeskripsi
            // 
            this.inputDeskripsi.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputDeskripsi.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputDeskripsi.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputDeskripsi.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputDeskripsi.BorderRadius = 0;
            this.inputDeskripsi.BorderSize = 2;
            this.inputDeskripsi.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputDeskripsi.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputDeskripsi.Location = new System.Drawing.Point(387, 364);
            this.inputDeskripsi.Margin = new System.Windows.Forms.Padding(4);
            this.inputDeskripsi.Multiline = false;
            this.inputDeskripsi.Name = "inputDeskripsi";
            this.inputDeskripsi.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputDeskripsi.PasswordChar = false;
            this.inputDeskripsi.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputDeskripsi.PlaceholderText = "";
            this.inputDeskripsi.ReadOnly = false;
            this.inputDeskripsi.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputDeskripsi.Size = new System.Drawing.Size(404, 32);
            this.inputDeskripsi.TabIndex = 5;
            this.inputDeskripsi.TabStop = false;
            this.inputDeskripsi.Texts = "";
            this.inputDeskripsi.UnderlinedStyle = false;
            // 
            // labelNamaAlat
            // 
            this.labelNamaAlat.AutoSize = true;
            this.labelNamaAlat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelNamaAlat.Depth = 0;
            this.labelNamaAlat.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelNamaAlat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelNamaAlat.Location = new System.Drawing.Point(387, 186);
            this.labelNamaAlat.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelNamaAlat.Name = "labelNamaAlat";
            this.labelNamaAlat.Size = new System.Drawing.Size(55, 19);
            this.labelNamaAlat.TabIndex = 10;
            this.labelNamaAlat.Text = "Nama *";
            // 
            // labelTanggal
            // 
            this.labelTanggal.AutoSize = true;
            this.labelTanggal.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelTanggal.Depth = 0;
            this.labelTanggal.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelTanggal.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelTanggal.Location = new System.Drawing.Point(384, 264);
            this.labelTanggal.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelTanggal.Name = "labelTanggal";
            this.labelTanggal.Size = new System.Drawing.Size(167, 19);
            this.labelTanggal.TabIndex = 11;
            this.labelTanggal.Text = "Tanggal Maintenance *";
            // 
            // labelAlamat
            // 
            this.labelAlamat.AutoSize = true;
            this.labelAlamat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelAlamat.Depth = 0;
            this.labelAlamat.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelAlamat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelAlamat.Location = new System.Drawing.Point(387, 341);
            this.labelAlamat.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelAlamat.Name = "labelAlamat";
            this.labelAlamat.Size = new System.Drawing.Size(66, 19);
            this.labelAlamat.TabIndex = 12;
            this.labelAlamat.Text = "Deskripsi";
            // 
            // dgvAlat
            // 
            this.dgvAlat.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvAlat.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.dgvAlat.Location = new System.Drawing.Point(6, 107);
            this.dgvAlat.Name = "dgvAlat";
            this.dgvAlat.RowHeadersWidth = 62;
            this.dgvAlat.RowTemplate.Height = 28;
            this.dgvAlat.Size = new System.Drawing.Size(374, 289);
            this.dgvAlat.TabIndex = 2;
            this.dgvAlat.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvAlat_CellClick);
            // 
            // inputTanggal
            // 
            this.inputTanggal.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputTanggal.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputTanggal.BorderSize = 1;
            this.inputTanggal.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputTanggal.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputTanggal.Location = new System.Drawing.Point(386, 286);
            this.inputTanggal.MinDate = new System.DateTime(2025, 1, 1, 0, 0, 0, 0);
            this.inputTanggal.MinimumSize = new System.Drawing.Size(120, 30);
            this.inputTanggal.Name = "inputTanggal";
            this.inputTanggal.Size = new System.Drawing.Size(404, 30);
            this.inputTanggal.SkinColor = System.Drawing.Color.MediumSlateBlue;
            this.inputTanggal.TabIndex = 4;
            this.inputTanggal.TextColor = System.Drawing.Color.Black;
            this.inputTanggal.Value = new System.DateTime(2025, 6, 1, 12, 38, 41, 420);
            // 
            // btnRefreshDataAlat
            // 
            this.btnRefreshDataAlat.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnRefreshDataAlat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnRefreshDataAlat.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnRefreshDataAlat.Depth = 0;
            this.btnRefreshDataAlat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnRefreshDataAlat.HighEmphasis = true;
            this.btnRefreshDataAlat.Icon = null;
            this.btnRefreshDataAlat.Location = new System.Drawing.Point(197, 405);
            this.btnRefreshDataAlat.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnRefreshDataAlat.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnRefreshDataAlat.Name = "btnRefreshDataAlat";
            this.btnRefreshDataAlat.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnRefreshDataAlat.Size = new System.Drawing.Size(84, 36);
            this.btnRefreshDataAlat.TabIndex = 7;
            this.btnRefreshDataAlat.Text = "Refresh";
            this.btnRefreshDataAlat.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnRefreshDataAlat.UseAccentColor = false;
            this.btnRefreshDataAlat.UseVisualStyleBackColor = false;
            this.btnRefreshDataAlat.Click += new System.EventHandler(this.btnRefreshDataMaintenance_Click);
            // 
            // btnShowCacheAlat
            // 
            this.btnShowCacheAlat.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnShowCacheAlat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnShowCacheAlat.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnShowCacheAlat.Depth = 0;
            this.btnShowCacheAlat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnShowCacheAlat.HighEmphasis = true;
            this.btnShowCacheAlat.Icon = null;
            this.btnShowCacheAlat.Location = new System.Drawing.Point(108, 405);
            this.btnShowCacheAlat.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnShowCacheAlat.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnShowCacheAlat.Name = "btnShowCacheAlat";
            this.btnShowCacheAlat.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnShowCacheAlat.Size = new System.Drawing.Size(69, 36);
            this.btnShowCacheAlat.TabIndex = 8;
            this.btnShowCacheAlat.Text = "Cache";
            this.btnShowCacheAlat.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnShowCacheAlat.UseAccentColor = false;
            this.btnShowCacheAlat.UseVisualStyleBackColor = false;
            this.btnShowCacheAlat.Click += new System.EventHandler(this.btnShowCacheMaintenance_Click);
            // 
            // inputSearchAlat
            // 
            this.inputSearchAlat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputSearchAlat.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputSearchAlat.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputSearchAlat.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputSearchAlat.BorderRadius = 0;
            this.inputSearchAlat.BorderSize = 2;
            this.inputSearchAlat.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputSearchAlat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputSearchAlat.Location = new System.Drawing.Point(6, 68);
            this.inputSearchAlat.Margin = new System.Windows.Forms.Padding(4);
            this.inputSearchAlat.Multiline = false;
            this.inputSearchAlat.Name = "inputSearchAlat";
            this.inputSearchAlat.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputSearchAlat.PasswordChar = false;
            this.inputSearchAlat.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputSearchAlat.PlaceholderText = "Ketik untuk cari alat…";
            this.inputSearchAlat.ReadOnly = false;
            this.inputSearchAlat.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputSearchAlat.Size = new System.Drawing.Size(374, 32);
            this.inputSearchAlat.TabIndex = 1;
            this.inputSearchAlat.TabStop = false;
            this.inputSearchAlat.Texts = "";
            this.inputSearchAlat.UnderlinedStyle = false;
            // 
            // inputIdAlat
            // 
            this.inputIdAlat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputIdAlat.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputIdAlat.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputIdAlat.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputIdAlat.BorderRadius = 0;
            this.inputIdAlat.BorderSize = 2;
            this.inputIdAlat.Enabled = false;
            this.inputIdAlat.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputIdAlat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputIdAlat.Location = new System.Drawing.Point(387, 130);
            this.inputIdAlat.Margin = new System.Windows.Forms.Padding(4);
            this.inputIdAlat.Multiline = false;
            this.inputIdAlat.Name = "inputIdAlat";
            this.inputIdAlat.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputIdAlat.PasswordChar = false;
            this.inputIdAlat.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputIdAlat.PlaceholderText = "Pilih ID Alat dari tabel..";
            this.inputIdAlat.ReadOnly = false;
            this.inputIdAlat.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputIdAlat.Size = new System.Drawing.Size(406, 32);
            this.inputIdAlat.TabIndex = 13;
            this.inputIdAlat.TabStop = false;
            this.inputIdAlat.Texts = "";
            this.inputIdAlat.UnderlinedStyle = false;
            // 
            // labelIdAlat
            // 
            this.labelIdAlat.AutoSize = true;
            this.labelIdAlat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelIdAlat.Depth = 0;
            this.labelIdAlat.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelIdAlat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelIdAlat.Location = new System.Drawing.Point(387, 107);
            this.labelIdAlat.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelIdAlat.Name = "labelIdAlat";
            this.labelIdAlat.Size = new System.Drawing.Size(59, 19);
            this.labelIdAlat.TabIndex = 14;
            this.labelIdAlat.Text = "ID Alat *";
            // 
            // FormUA
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.inputIdAlat);
            this.Controls.Add(this.labelIdAlat);
            this.Controls.Add(this.inputSearchAlat);
            this.Controls.Add(this.btnShowCacheAlat);
            this.Controls.Add(this.btnRefreshDataAlat);
            this.Controls.Add(this.inputTanggal);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnUpdate);
            this.Controls.Add(this.inputNamaAlat);
            this.Controls.Add(this.inputDeskripsi);
            this.Controls.Add(this.labelNamaAlat);
            this.Controls.Add(this.labelTanggal);
            this.Controls.Add(this.labelAlamat);
            this.Controls.Add(this.dgvAlat);
            this.Name = "FormUA";
            this.Opacity = 1D;
            this.Text = "Update Alat Laundry";
            this.Load += new System.EventHandler(this.FormUA_Load);
            this.Controls.SetChildIndex(this.dgvAlat, 0);
            this.Controls.SetChildIndex(this.labelAlamat, 0);
            this.Controls.SetChildIndex(this.labelTanggal, 0);
            this.Controls.SetChildIndex(this.labelNamaAlat, 0);
            this.Controls.SetChildIndex(this.inputDeskripsi, 0);
            this.Controls.SetChildIndex(this.inputNamaAlat, 0);
            this.Controls.SetChildIndex(this.btnUpdate, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.inputTanggal, 0);
            this.Controls.SetChildIndex(this.btnRefreshDataAlat, 0);
            this.Controls.SetChildIndex(this.btnShowCacheAlat, 0);
            this.Controls.SetChildIndex(this.inputSearchAlat, 0);
            this.Controls.SetChildIndex(this.labelIdAlat, 0);
            this.Controls.SetChildIndex(this.inputIdAlat, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            ((System.ComponentModel.ISupportInitialize)(this.dgvAlat)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnUpdate;
        private ManajemenLaundrySepatu.MyTextBox inputNamaAlat;
        private ManajemenLaundrySepatu.MyTextBox inputDeskripsi;
        private MaterialSkin.Controls.MaterialLabel labelNamaAlat;
        private MaterialSkin.Controls.MaterialLabel labelTanggal;
        private MaterialSkin.Controls.MaterialLabel labelAlamat;
        private System.Windows.Forms.DataGridView dgvAlat;
        private ManajemenLaundrySepatu.MyDateTimePicker inputTanggal;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnRefreshDataAlat;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnShowCacheAlat;
        private ManajemenLaundrySepatu.MyTextBox inputSearchAlat;
        private MyTextBox inputIdAlat;
        private MaterialSkin.Controls.MaterialLabel labelIdAlat;
    }
}