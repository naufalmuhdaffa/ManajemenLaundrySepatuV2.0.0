namespace ManajemenLaundrySepatu
{
    partial class FormHS
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
            this.btnHapus = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnKembali = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.dgvSepatu = new System.Windows.Forms.DataGridView();
            this.btnRefreshDataSepatu = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnShowCacheSepatu = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.inputSearchSepatu = new ManajemenLaundrySepatu.MyTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSepatu)).BeginInit();
            this.SuspendLayout();
            this.themeSwitch.Location = new System.Drawing.Point(629, 24);
            this.themeSwitch.Size = new System.Drawing.Size(170, 39);
            this.btnHapus.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnHapus.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnHapus.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHapus.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnHapus.Depth = 0;
            this.btnHapus.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnHapus.HighEmphasis = true;
            this.btnHapus.Icon = null;
            this.btnHapus.Location = new System.Drawing.Point(399, 405);
            this.btnHapus.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnHapus.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnHapus.Name = "btnHapus";
            this.btnHapus.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnHapus.Size = new System.Drawing.Size(69, 36);
            this.btnHapus.TabIndex = 3;
            this.btnHapus.Text = "Hapus";
            this.btnHapus.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnHapus.UseAccentColor = false;
            this.btnHapus.UseVisualStyleBackColor = false;
            this.btnHapus.Click += new System.EventHandler(this.btnHapus_Click);
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
            this.btnKembali.TabIndex = 6;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnKembali.UseAccentColor = false;
            this.btnKembali.UseVisualStyleBackColor = false;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            this.dgvSepatu.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvSepatu.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.dgvSepatu.Location = new System.Drawing.Point(7, 107);
            this.dgvSepatu.Name = "dgvSepatu";
            this.dgvSepatu.RowHeadersWidth = 62;
            this.dgvSepatu.RowTemplate.Height = 28;
            this.dgvSepatu.Size = new System.Drawing.Size(787, 289);
            this.dgvSepatu.TabIndex = 2;
            this.btnRefreshDataSepatu.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnRefreshDataSepatu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnRefreshDataSepatu.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnRefreshDataSepatu.Depth = 0;
            this.btnRefreshDataSepatu.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnRefreshDataSepatu.HighEmphasis = true;
            this.btnRefreshDataSepatu.Icon = null;
            this.btnRefreshDataSepatu.Location = new System.Drawing.Point(256, 405);
            this.btnRefreshDataSepatu.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnRefreshDataSepatu.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnRefreshDataSepatu.Name = "btnRefreshDataSepatu";
            this.btnRefreshDataSepatu.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnRefreshDataSepatu.Size = new System.Drawing.Size(84, 36);
            this.btnRefreshDataSepatu.TabIndex = 4;
            this.btnRefreshDataSepatu.Text = "Refresh";
            this.btnRefreshDataSepatu.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnRefreshDataSepatu.UseAccentColor = false;
            this.btnRefreshDataSepatu.UseVisualStyleBackColor = false;
            this.btnRefreshDataSepatu.Click += new System.EventHandler(this.btnRefreshDataSepatu_Click);
            this.btnShowCacheSepatu.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnShowCacheSepatu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnShowCacheSepatu.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnShowCacheSepatu.Depth = 0;
            this.btnShowCacheSepatu.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnShowCacheSepatu.HighEmphasis = true;
            this.btnShowCacheSepatu.Icon = null;
            this.btnShowCacheSepatu.Location = new System.Drawing.Point(137, 405);
            this.btnShowCacheSepatu.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnShowCacheSepatu.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnShowCacheSepatu.Name = "btnShowCacheSepatu";
            this.btnShowCacheSepatu.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnShowCacheSepatu.Size = new System.Drawing.Size(69, 36);
            this.btnShowCacheSepatu.TabIndex = 5;
            this.btnShowCacheSepatu.Text = "Cache";
            this.btnShowCacheSepatu.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnShowCacheSepatu.UseAccentColor = false;
            this.btnShowCacheSepatu.UseVisualStyleBackColor = false;
            this.btnShowCacheSepatu.Click += new System.EventHandler(this.btnShowCacheSepatu_Click);
            this.inputSearchSepatu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
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
            this.inputSearchSepatu.Size = new System.Drawing.Size(787, 32);
            this.inputSearchSepatu.TabIndex = 1;
            this.inputSearchSepatu.Texts = "";
            this.inputSearchSepatu.UnderlinedStyle = false;
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.inputSearchSepatu);
            this.Controls.Add(this.btnShowCacheSepatu);
            this.Controls.Add(this.btnRefreshDataSepatu);
            this.Controls.Add(this.btnHapus);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.dgvSepatu);
            this.Name = "FormHS";
            this.Opacity = 1D;
            this.Text = "Hapus Sepatu";
            this.Load += new System.EventHandler(this.FormHS_Load);
            this.Controls.SetChildIndex(this.dgvSepatu, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.btnHapus, 0);
            this.Controls.SetChildIndex(this.btnRefreshDataSepatu, 0);
            this.Controls.SetChildIndex(this.btnShowCacheSepatu, 0);
            this.Controls.SetChildIndex(this.inputSearchSepatu, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            ((System.ComponentModel.ISupportInitialize)(this.dgvSepatu)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnHapus;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private System.Windows.Forms.DataGridView dgvSepatu;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnRefreshDataSepatu;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnShowCacheSepatu;
        private ManajemenLaundrySepatu.MyTextBox inputSearchSepatu;
    }
}