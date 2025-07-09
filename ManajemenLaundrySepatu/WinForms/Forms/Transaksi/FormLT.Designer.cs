namespace ManajemenLaundrySepatu
{
    partial class FormLT
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
            this.dgvLaporanTransaksi = new System.Windows.Forms.DataGridView();
            this.btnKembali = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnCetakPDF = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnCetakCSV = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnRefreshDataLaporanTransaksi = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnShowCacheLaporanTransaksi = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            ((System.ComponentModel.ISupportInitialize)(this.dgvLaporanTransaksi)).BeginInit();
            this.SuspendLayout();
            // 
            // themeSwitch
            // 
            this.themeSwitch.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.776372F);
            this.themeSwitch.Location = new System.Drawing.Point(632, 25);
            this.themeSwitch.Size = new System.Drawing.Size(167, 38);
            // 
            // dgvLaporanTransaksi
            // 
            this.dgvLaporanTransaksi.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvLaporanTransaksi.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.dgvLaporanTransaksi.Location = new System.Drawing.Point(7, 67);
            this.dgvLaporanTransaksi.Name = "dgvLaporanTransaksi";
            this.dgvLaporanTransaksi.RowHeadersWidth = 62;
            this.dgvLaporanTransaksi.RowTemplate.Height = 28;
            this.dgvLaporanTransaksi.Size = new System.Drawing.Size(787, 329);
            this.dgvLaporanTransaksi.TabIndex = 1;
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
            // btnCetakPDF
            // 
            this.btnCetakPDF.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnCetakPDF.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnCetakPDF.BorderColor = System.Drawing.Color.Gray;
            this.btnCetakPDF.BorderSize = 2;
            this.btnCetakPDF.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnCetakPDF.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnCetakPDF.Depth = 0;
            this.btnCetakPDF.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCetakPDF.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnCetakPDF.HighEmphasis = true;
            this.btnCetakPDF.Icon = null;
            this.btnCetakPDF.IsDarkTheme = false;
            this.btnCetakPDF.Location = new System.Drawing.Point(516, 405);
            this.btnCetakPDF.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnCetakPDF.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnCetakPDF.Name = "btnCetakPDF";
            this.btnCetakPDF.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnCetakPDF.Size = new System.Drawing.Size(98, 36);
            this.btnCetakPDF.TabIndex = 2;
            this.btnCetakPDF.Text = "Cetak PDF";
            this.btnCetakPDF.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnCetakPDF.UseAccentColor = false;
            this.btnCetakPDF.UseVisualStyleBackColor = false;
            this.btnCetakPDF.Click += new System.EventHandler(this.btnCetakPDF_Click);
            // 
            // btnCetakCSV
            // 
            this.btnCetakCSV.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnCetakCSV.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnCetakCSV.BorderColor = System.Drawing.Color.Gray;
            this.btnCetakCSV.BorderSize = 2;
            this.btnCetakCSV.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnCetakCSV.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnCetakCSV.Depth = 0;
            this.btnCetakCSV.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCetakCSV.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnCetakCSV.HighEmphasis = true;
            this.btnCetakCSV.Icon = null;
            this.btnCetakCSV.IsDarkTheme = false;
            this.btnCetakCSV.Location = new System.Drawing.Point(375, 405);
            this.btnCetakCSV.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnCetakCSV.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnCetakCSV.Name = "btnCetakCSV";
            this.btnCetakCSV.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnCetakCSV.Size = new System.Drawing.Size(99, 36);
            this.btnCetakCSV.TabIndex = 3;
            this.btnCetakCSV.Text = "Cetak CSV";
            this.btnCetakCSV.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnCetakCSV.UseAccentColor = false;
            this.btnCetakCSV.UseVisualStyleBackColor = false;
            this.btnCetakCSV.Click += new System.EventHandler(this.btnCetakCSV_Click);
            // 
            // btnRefreshDataLaporanTransaksi
            // 
            this.btnRefreshDataLaporanTransaksi.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnRefreshDataLaporanTransaksi.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnRefreshDataLaporanTransaksi.BorderColor = System.Drawing.Color.Gray;
            this.btnRefreshDataLaporanTransaksi.BorderSize = 2;
            this.btnRefreshDataLaporanTransaksi.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnRefreshDataLaporanTransaksi.Depth = 0;
            this.btnRefreshDataLaporanTransaksi.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnRefreshDataLaporanTransaksi.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnRefreshDataLaporanTransaksi.HighEmphasis = true;
            this.btnRefreshDataLaporanTransaksi.Icon = null;
            this.btnRefreshDataLaporanTransaksi.IsDarkTheme = false;
            this.btnRefreshDataLaporanTransaksi.Location = new System.Drawing.Point(249, 405);
            this.btnRefreshDataLaporanTransaksi.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnRefreshDataLaporanTransaksi.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnRefreshDataLaporanTransaksi.Name = "btnRefreshDataLaporanTransaksi";
            this.btnRefreshDataLaporanTransaksi.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnRefreshDataLaporanTransaksi.Size = new System.Drawing.Size(84, 36);
            this.btnRefreshDataLaporanTransaksi.TabIndex = 4;
            this.btnRefreshDataLaporanTransaksi.Text = "Refresh";
            this.btnRefreshDataLaporanTransaksi.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnRefreshDataLaporanTransaksi.UseAccentColor = false;
            this.btnRefreshDataLaporanTransaksi.UseVisualStyleBackColor = false;
            this.btnRefreshDataLaporanTransaksi.Click += new System.EventHandler(this.btnRefreshDataTransaksi_Click);
            // 
            // btnShowCacheLaporanTransaksi
            // 
            this.btnShowCacheLaporanTransaksi.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnShowCacheLaporanTransaksi.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnShowCacheLaporanTransaksi.BorderColor = System.Drawing.Color.Gray;
            this.btnShowCacheLaporanTransaksi.BorderSize = 2;
            this.btnShowCacheLaporanTransaksi.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnShowCacheLaporanTransaksi.Depth = 0;
            this.btnShowCacheLaporanTransaksi.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnShowCacheLaporanTransaksi.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnShowCacheLaporanTransaksi.HighEmphasis = true;
            this.btnShowCacheLaporanTransaksi.Icon = null;
            this.btnShowCacheLaporanTransaksi.IsDarkTheme = false;
            this.btnShowCacheLaporanTransaksi.Location = new System.Drawing.Point(133, 405);
            this.btnShowCacheLaporanTransaksi.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnShowCacheLaporanTransaksi.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnShowCacheLaporanTransaksi.Name = "btnShowCacheLaporanTransaksi";
            this.btnShowCacheLaporanTransaksi.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnShowCacheLaporanTransaksi.Size = new System.Drawing.Size(69, 36);
            this.btnShowCacheLaporanTransaksi.TabIndex = 5;
            this.btnShowCacheLaporanTransaksi.Text = "Cache";
            this.btnShowCacheLaporanTransaksi.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnShowCacheLaporanTransaksi.UseAccentColor = false;
            this.btnShowCacheLaporanTransaksi.UseVisualStyleBackColor = false;
            this.btnShowCacheLaporanTransaksi.Click += new System.EventHandler(this.btnShowCacheTransaksi_Click);
            // 
            // FormLT
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnShowCacheLaporanTransaksi);
            this.Controls.Add(this.btnRefreshDataLaporanTransaksi);
            this.Controls.Add(this.btnCetakCSV);
            this.Controls.Add(this.btnCetakPDF);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.dgvLaporanTransaksi);
            this.Name = "FormLT";
            this.Opacity = 1D;
            this.Text = "Laporan Transaksi (Primitive)";
            this.Load += new System.EventHandler(this.FormLT_Load);
            this.Controls.SetChildIndex(this.dgvLaporanTransaksi, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.btnCetakPDF, 0);
            this.Controls.SetChildIndex(this.btnCetakCSV, 0);
            this.Controls.SetChildIndex(this.btnRefreshDataLaporanTransaksi, 0);
            this.Controls.SetChildIndex(this.btnShowCacheLaporanTransaksi, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            ((System.ComponentModel.ISupportInitialize)(this.dgvLaporanTransaksi)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvLaporanTransaksi;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnCetakPDF;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnCetakCSV;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnRefreshDataLaporanTransaksi;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnShowCacheLaporanTransaksi;
    }
}