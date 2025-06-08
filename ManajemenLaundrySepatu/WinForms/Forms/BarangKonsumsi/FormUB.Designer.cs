namespace ManajemenLaundrySepatu
{
    partial class FormUB
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
            this.inputIdBarang = new ManajemenLaundrySepatu.MyTextBox();
            this.inputNamaBarang = new ManajemenLaundrySepatu.MyTextBox();
            this.inputJumlah = new ManajemenLaundrySepatu.MyTextBox();
            this.inputSatuan = new ManajemenLaundrySepatu.MyTextBox();
            this.labelIdBarang = new MaterialSkin.Controls.MaterialLabel();
            this.labelNamaBarang = new MaterialSkin.Controls.MaterialLabel();
            this.labelJumlah = new MaterialSkin.Controls.MaterialLabel();
            this.labelSatuan = new MaterialSkin.Controls.MaterialLabel();
            this.dgvBarang = new System.Windows.Forms.DataGridView();
            this.btnRefreshDataBarang = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnShowCacheBarang = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.inputSearchBarang = new ManajemenLaundrySepatu.MyTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvBarang)).BeginInit();
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
            this.btnKembali.TabIndex = 10;
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
            this.btnUpdate.TabIndex = 7;
            this.btnUpdate.Text = "Update";
            this.btnUpdate.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnUpdate.UseAccentColor = false;
            this.btnUpdate.UseVisualStyleBackColor = false;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // inputIdBarang
            // 
            this.inputIdBarang.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputIdBarang.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputIdBarang.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputIdBarang.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputIdBarang.BorderRadius = 0;
            this.inputIdBarang.BorderSize = 2;
            this.inputIdBarang.Enabled = false;
            this.inputIdBarang.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputIdBarang.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputIdBarang.Location = new System.Drawing.Point(386, 130);
            this.inputIdBarang.Margin = new System.Windows.Forms.Padding(4);
            this.inputIdBarang.Multiline = false;
            this.inputIdBarang.Name = "inputIdBarang";
            this.inputIdBarang.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputIdBarang.PasswordChar = false;
            this.inputIdBarang.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputIdBarang.PlaceholderText = "Pilih ID Barang Konsumsi dari tabel..";
            this.inputIdBarang.ReadOnly = false;
            this.inputIdBarang.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputIdBarang.Size = new System.Drawing.Size(407, 32);
            this.inputIdBarang.TabIndex = 3;
            this.inputIdBarang.TabStop = false;
            this.inputIdBarang.Texts = "";
            this.inputIdBarang.UnderlinedStyle = false;
            // 
            // inputNamaBarang
            // 
            this.inputNamaBarang.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputNamaBarang.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputNamaBarang.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputNamaBarang.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputNamaBarang.BorderRadius = 0;
            this.inputNamaBarang.BorderSize = 2;
            this.inputNamaBarang.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputNamaBarang.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputNamaBarang.Location = new System.Drawing.Point(386, 206);
            this.inputNamaBarang.Margin = new System.Windows.Forms.Padding(4);
            this.inputNamaBarang.Multiline = false;
            this.inputNamaBarang.Name = "inputNamaBarang";
            this.inputNamaBarang.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputNamaBarang.PasswordChar = false;
            this.inputNamaBarang.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputNamaBarang.PlaceholderText = "";
            this.inputNamaBarang.ReadOnly = false;
            this.inputNamaBarang.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputNamaBarang.Size = new System.Drawing.Size(407, 32);
            this.inputNamaBarang.TabIndex = 4;
            this.inputNamaBarang.TabStop = false;
            this.inputNamaBarang.Texts = "";
            this.inputNamaBarang.UnderlinedStyle = false;
            // 
            // inputJumlah
            // 
            this.inputJumlah.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputJumlah.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputJumlah.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputJumlah.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputJumlah.BorderRadius = 0;
            this.inputJumlah.BorderSize = 2;
            this.inputJumlah.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputJumlah.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputJumlah.Location = new System.Drawing.Point(386, 286);
            this.inputJumlah.Margin = new System.Windows.Forms.Padding(4);
            this.inputJumlah.Multiline = false;
            this.inputJumlah.Name = "inputJumlah";
            this.inputJumlah.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputJumlah.PasswordChar = false;
            this.inputJumlah.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputJumlah.PlaceholderText = "";
            this.inputJumlah.ReadOnly = false;
            this.inputJumlah.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputJumlah.Size = new System.Drawing.Size(407, 32);
            this.inputJumlah.TabIndex = 5;
            this.inputJumlah.TabStop = false;
            this.inputJumlah.Texts = "";
            this.inputJumlah.UnderlinedStyle = false;
            // 
            // inputSatuan
            // 
            this.inputSatuan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputSatuan.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputSatuan.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputSatuan.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputSatuan.BorderRadius = 0;
            this.inputSatuan.BorderSize = 2;
            this.inputSatuan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputSatuan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputSatuan.Location = new System.Drawing.Point(386, 366);
            this.inputSatuan.Margin = new System.Windows.Forms.Padding(4);
            this.inputSatuan.Multiline = false;
            this.inputSatuan.Name = "inputSatuan";
            this.inputSatuan.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputSatuan.PasswordChar = false;
            this.inputSatuan.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputSatuan.PlaceholderText = "";
            this.inputSatuan.ReadOnly = false;
            this.inputSatuan.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputSatuan.Size = new System.Drawing.Size(407, 32);
            this.inputSatuan.TabIndex = 6;
            this.inputSatuan.TabStop = false;
            this.inputSatuan.Texts = "";
            this.inputSatuan.UnderlinedStyle = false;
            // 
            // labelIdBarang
            // 
            this.labelIdBarang.AutoSize = true;
            this.labelIdBarang.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelIdBarang.Depth = 0;
            this.labelIdBarang.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelIdBarang.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelIdBarang.Location = new System.Drawing.Point(386, 107);
            this.labelIdBarang.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelIdBarang.Name = "labelIdBarang";
            this.labelIdBarang.Size = new System.Drawing.Size(157, 19);
            this.labelIdBarang.TabIndex = 11;
            this.labelIdBarang.Text = "ID Barang Konsumsi *";
            // 
            // labelNamaBarang
            // 
            this.labelNamaBarang.AutoSize = true;
            this.labelNamaBarang.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelNamaBarang.Depth = 0;
            this.labelNamaBarang.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelNamaBarang.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelNamaBarang.Location = new System.Drawing.Point(386, 183);
            this.labelNamaBarang.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelNamaBarang.Name = "labelNamaBarang";
            this.labelNamaBarang.Size = new System.Drawing.Size(55, 19);
            this.labelNamaBarang.TabIndex = 12;
            this.labelNamaBarang.Text = "Nama *";
            // 
            // labelJumlah
            // 
            this.labelJumlah.AutoSize = true;
            this.labelJumlah.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelJumlah.Depth = 0;
            this.labelJumlah.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelJumlah.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelJumlah.Location = new System.Drawing.Point(386, 263);
            this.labelJumlah.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelJumlah.Name = "labelJumlah";
            this.labelJumlah.Size = new System.Drawing.Size(66, 19);
            this.labelJumlah.TabIndex = 13;
            this.labelJumlah.Text = "Jumlah *";
            // 
            // labelSatuan
            // 
            this.labelSatuan.AutoSize = true;
            this.labelSatuan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelSatuan.Depth = 0;
            this.labelSatuan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelSatuan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelSatuan.Location = new System.Drawing.Point(386, 343);
            this.labelSatuan.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelSatuan.Name = "labelSatuan";
            this.labelSatuan.Size = new System.Drawing.Size(52, 19);
            this.labelSatuan.TabIndex = 14;
            this.labelSatuan.Text = "Satuan";
            // 
            // dgvBarang
            // 
            this.dgvBarang.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvBarang.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.dgvBarang.Location = new System.Drawing.Point(6, 107);
            this.dgvBarang.Name = "dgvBarang";
            this.dgvBarang.RowHeadersWidth = 62;
            this.dgvBarang.RowTemplate.Height = 28;
            this.dgvBarang.Size = new System.Drawing.Size(374, 291);
            this.dgvBarang.TabIndex = 2;
            this.dgvBarang.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvBarang_CellClick);
            // 
            // btnRefreshDataBarang
            // 
            this.btnRefreshDataBarang.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnRefreshDataBarang.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnRefreshDataBarang.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnRefreshDataBarang.Depth = 0;
            this.btnRefreshDataBarang.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnRefreshDataBarang.HighEmphasis = true;
            this.btnRefreshDataBarang.Icon = null;
            this.btnRefreshDataBarang.Location = new System.Drawing.Point(202, 405);
            this.btnRefreshDataBarang.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnRefreshDataBarang.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnRefreshDataBarang.Name = "btnRefreshDataBarang";
            this.btnRefreshDataBarang.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnRefreshDataBarang.Size = new System.Drawing.Size(84, 36);
            this.btnRefreshDataBarang.TabIndex = 8;
            this.btnRefreshDataBarang.Text = "Refresh";
            this.btnRefreshDataBarang.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnRefreshDataBarang.UseAccentColor = false;
            this.btnRefreshDataBarang.UseVisualStyleBackColor = false;
            this.btnRefreshDataBarang.Click += new System.EventHandler(this.btnRefreshDataBarang_Click);
            // 
            // btnShowCacheBarang
            // 
            this.btnShowCacheBarang.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnShowCacheBarang.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnShowCacheBarang.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnShowCacheBarang.Depth = 0;
            this.btnShowCacheBarang.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnShowCacheBarang.HighEmphasis = true;
            this.btnShowCacheBarang.Icon = null;
            this.btnShowCacheBarang.Location = new System.Drawing.Point(113, 405);
            this.btnShowCacheBarang.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnShowCacheBarang.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnShowCacheBarang.Name = "btnShowCacheBarang";
            this.btnShowCacheBarang.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnShowCacheBarang.Size = new System.Drawing.Size(69, 36);
            this.btnShowCacheBarang.TabIndex = 9;
            this.btnShowCacheBarang.Text = "Cache";
            this.btnShowCacheBarang.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnShowCacheBarang.UseAccentColor = false;
            this.btnShowCacheBarang.UseVisualStyleBackColor = false;
            this.btnShowCacheBarang.Click += new System.EventHandler(this.btnShowCacheBarang_Click);
            // 
            // inputSearchBarang
            // 
            this.inputSearchBarang.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputSearchBarang.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.inputSearchBarang.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputSearchBarang.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputSearchBarang.BorderRadius = 0;
            this.inputSearchBarang.BorderSize = 2;
            this.inputSearchBarang.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputSearchBarang.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputSearchBarang.Location = new System.Drawing.Point(6, 68);
            this.inputSearchBarang.Margin = new System.Windows.Forms.Padding(4);
            this.inputSearchBarang.Multiline = false;
            this.inputSearchBarang.Name = "inputSearchBarang";
            this.inputSearchBarang.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputSearchBarang.PasswordChar = false;
            this.inputSearchBarang.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputSearchBarang.PlaceholderText = "Ketik untuk cari barang konsumsi…";
            this.inputSearchBarang.ReadOnly = false;
            this.inputSearchBarang.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.inputSearchBarang.Size = new System.Drawing.Size(374, 32);
            this.inputSearchBarang.TabIndex = 1;
            this.inputSearchBarang.TabStop = false;
            this.inputSearchBarang.Texts = "";
            this.inputSearchBarang.UnderlinedStyle = false;
            // 
            // FormUB
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.inputSearchBarang);
            this.Controls.Add(this.btnShowCacheBarang);
            this.Controls.Add(this.btnRefreshDataBarang);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnUpdate);
            this.Controls.Add(this.inputIdBarang);
            this.Controls.Add(this.inputNamaBarang);
            this.Controls.Add(this.inputJumlah);
            this.Controls.Add(this.inputSatuan);
            this.Controls.Add(this.labelIdBarang);
            this.Controls.Add(this.labelNamaBarang);
            this.Controls.Add(this.labelJumlah);
            this.Controls.Add(this.labelSatuan);
            this.Controls.Add(this.dgvBarang);
            this.Name = "FormUB";
            this.Opacity = 1D;
            this.Text = "Update Barang Konsumsi";
            this.Load += new System.EventHandler(this.FormUB_Load);
            this.Controls.SetChildIndex(this.dgvBarang, 0);
            this.Controls.SetChildIndex(this.labelSatuan, 0);
            this.Controls.SetChildIndex(this.labelJumlah, 0);
            this.Controls.SetChildIndex(this.labelNamaBarang, 0);
            this.Controls.SetChildIndex(this.labelIdBarang, 0);
            this.Controls.SetChildIndex(this.inputSatuan, 0);
            this.Controls.SetChildIndex(this.inputJumlah, 0);
            this.Controls.SetChildIndex(this.inputNamaBarang, 0);
            this.Controls.SetChildIndex(this.inputIdBarang, 0);
            this.Controls.SetChildIndex(this.btnUpdate, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.btnRefreshDataBarang, 0);
            this.Controls.SetChildIndex(this.btnShowCacheBarang, 0);
            this.Controls.SetChildIndex(this.inputSearchBarang, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            ((System.ComponentModel.ISupportInitialize)(this.dgvBarang)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnUpdate;
        private ManajemenLaundrySepatu.MyTextBox inputIdBarang;
        private ManajemenLaundrySepatu.MyTextBox inputNamaBarang;
        private ManajemenLaundrySepatu.MyTextBox inputJumlah;
        private ManajemenLaundrySepatu.MyTextBox inputSatuan;
        private MaterialSkin.Controls.MaterialLabel labelIdBarang;
        private MaterialSkin.Controls.MaterialLabel labelNamaBarang;
        private MaterialSkin.Controls.MaterialLabel labelJumlah;
        private MaterialSkin.Controls.MaterialLabel labelSatuan;
        private System.Windows.Forms.DataGridView dgvBarang;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnRefreshDataBarang;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnShowCacheBarang;
        private ManajemenLaundrySepatu.MyTextBox inputSearchBarang;
    }
}