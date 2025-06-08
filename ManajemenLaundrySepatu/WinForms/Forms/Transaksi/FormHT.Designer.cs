namespace ManajemenLaundrySepatu
{
    partial class FormHT
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
            this.dgvTransaksi = new System.Windows.Forms.DataGridView();
            this.btnRefreshDataTransaksi = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnShowCacheTransaksi = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.inputSearchTransaksi = new ManajemenLaundrySepatu.MyTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTransaksi)).BeginInit();
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
            this.btnHapus.Location = new System.Drawing.Point(373, 405);
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
            this.dgvTransaksi.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvTransaksi.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.dgvTransaksi.Location = new System.Drawing.Point(7, 110);
            this.dgvTransaksi.Name = "dgvTransaksi";
            this.dgvTransaksi.RowHeadersWidth = 62;
            this.dgvTransaksi.RowTemplate.Height = 28;
            this.dgvTransaksi.Size = new System.Drawing.Size(787, 286);
            this.dgvTransaksi.TabIndex = 2;
            this.btnRefreshDataTransaksi.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnRefreshDataTransaksi.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnRefreshDataTransaksi.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnRefreshDataTransaksi.Depth = 0;
            this.btnRefreshDataTransaksi.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnRefreshDataTransaksi.HighEmphasis = true;
            this.btnRefreshDataTransaksi.Icon = null;
            this.btnRefreshDataTransaksi.Location = new System.Drawing.Point(241, 405);
            this.btnRefreshDataTransaksi.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnRefreshDataTransaksi.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnRefreshDataTransaksi.Name = "btnRefreshDataTransaksi";
            this.btnRefreshDataTransaksi.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnRefreshDataTransaksi.Size = new System.Drawing.Size(84, 36);
            this.btnRefreshDataTransaksi.TabIndex = 4;
            this.btnRefreshDataTransaksi.Text = "Refresh";
            this.btnRefreshDataTransaksi.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnRefreshDataTransaksi.UseAccentColor = false;
            this.btnRefreshDataTransaksi.UseVisualStyleBackColor = false;
            this.btnRefreshDataTransaksi.Click += new System.EventHandler(this.btnRefreshDataTransaksi_Click);
            this.btnShowCacheTransaksi.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnShowCacheTransaksi.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnShowCacheTransaksi.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnShowCacheTransaksi.Depth = 0;
            this.btnShowCacheTransaksi.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnShowCacheTransaksi.HighEmphasis = true;
            this.btnShowCacheTransaksi.Icon = null;
            this.btnShowCacheTransaksi.Location = new System.Drawing.Point(134, 405);
            this.btnShowCacheTransaksi.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnShowCacheTransaksi.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnShowCacheTransaksi.Name = "btnShowCacheTransaksi";
            this.btnShowCacheTransaksi.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnShowCacheTransaksi.Size = new System.Drawing.Size(69, 36);
            this.btnShowCacheTransaksi.TabIndex = 5;
            this.btnShowCacheTransaksi.Text = "Cache";
            this.btnShowCacheTransaksi.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnShowCacheTransaksi.UseAccentColor = false;
            this.btnShowCacheTransaksi.UseVisualStyleBackColor = false;
            this.btnShowCacheTransaksi.Click += new System.EventHandler(this.btnShowCacheTransaksi_Click);
            this.inputSearchTransaksi.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputSearchTransaksi.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputSearchTransaksi.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputSearchTransaksi.BorderRadius = 0;
            this.inputSearchTransaksi.BorderSize = 2;
            this.inputSearchTransaksi.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputSearchTransaksi.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputSearchTransaksi.Location = new System.Drawing.Point(7, 71);
            this.inputSearchTransaksi.Margin = new System.Windows.Forms.Padding(4);
            this.inputSearchTransaksi.Multiline = false;
            this.inputSearchTransaksi.Name = "inputSearchTransaksi";
            this.inputSearchTransaksi.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputSearchTransaksi.PasswordChar = false;
            this.inputSearchTransaksi.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputSearchTransaksi.PlaceholderText = "Ketik untuk cari transaksi…";
            this.inputSearchTransaksi.ReadOnly = false;
            this.inputSearchTransaksi.Size = new System.Drawing.Size(786, 32);
            this.inputSearchTransaksi.TabIndex = 1;
            this.inputSearchTransaksi.Texts = "";
            this.inputSearchTransaksi.UnderlinedStyle = false;
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.inputSearchTransaksi);
            this.Controls.Add(this.btnShowCacheTransaksi);
            this.Controls.Add(this.btnRefreshDataTransaksi);
            this.Controls.Add(this.btnHapus);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.dgvTransaksi);
            this.Name = "FormHT";
            this.Opacity = 1D;
            this.Text = "Hapus Transaksi";
            this.Load += new System.EventHandler(this.FormHT_Load);
            this.Controls.SetChildIndex(this.dgvTransaksi, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.btnHapus, 0);
            this.Controls.SetChildIndex(this.btnRefreshDataTransaksi, 0);
            this.Controls.SetChildIndex(this.btnShowCacheTransaksi, 0);
            this.Controls.SetChildIndex(this.inputSearchTransaksi, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            ((System.ComponentModel.ISupportInitialize)(this.dgvTransaksi)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnHapus;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private System.Windows.Forms.DataGridView dgvTransaksi;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnRefreshDataTransaksi;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnShowCacheTransaksi;
        private ManajemenLaundrySepatu.MyTextBox inputSearchTransaksi;
    }
}