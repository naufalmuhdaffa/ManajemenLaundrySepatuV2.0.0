namespace ManajemenLaundrySepatu
{
    partial class FormHP
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
            this.dgvPelanggan = new System.Windows.Forms.DataGridView();
            this.btnHapus = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnRefreshDataPelanggan = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnShowCachePelanggan = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.inputSearchPelanggan = new ManajemenLaundrySepatu.MyTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPelanggan)).BeginInit();
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
            this.btnKembali.TabIndex = 6;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnKembali.UseAccentColor = false;
            this.btnKembali.UseVisualStyleBackColor = false;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // dgvPelanggan
            // 
            this.dgvPelanggan.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvPelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.dgvPelanggan.Location = new System.Drawing.Point(7, 107);
            this.dgvPelanggan.Name = "dgvPelanggan";
            this.dgvPelanggan.RowHeadersWidth = 62;
            this.dgvPelanggan.RowTemplate.Height = 28;
            this.dgvPelanggan.Size = new System.Drawing.Size(787, 289);
            this.dgvPelanggan.TabIndex = 2;
            // 
            // btnHapus
            // 
            this.btnHapus.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnHapus.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnHapus.BorderColor = System.Drawing.Color.Gray;
            this.btnHapus.BorderSize = 2;
            this.btnHapus.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHapus.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnHapus.Depth = 0;
            this.btnHapus.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnHapus.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnHapus.HighEmphasis = true;
            this.btnHapus.Icon = null;
            this.btnHapus.IsDarkTheme = false;
            this.btnHapus.Location = new System.Drawing.Point(385, 405);
            this.btnHapus.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnHapus.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnHapus.Name = "btnHapus";
            this.btnHapus.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnHapus.Size = new System.Drawing.Size(69, 36);
            this.btnHapus.TabIndex = 3;
            this.btnHapus.Text = "Hapus";
            this.btnHapus.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnHapus.UseAccentColor = false;
            this.btnHapus.UseVisualStyleBackColor = false;
            this.btnHapus.Click += new System.EventHandler(this.btnHapus_Click);
            // 
            // btnRefreshDataPelanggan
            // 
            this.btnRefreshDataPelanggan.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnRefreshDataPelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnRefreshDataPelanggan.BorderColor = System.Drawing.Color.Gray;
            this.btnRefreshDataPelanggan.BorderSize = 2;
            this.btnRefreshDataPelanggan.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnRefreshDataPelanggan.Depth = 0;
            this.btnRefreshDataPelanggan.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnRefreshDataPelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnRefreshDataPelanggan.HighEmphasis = true;
            this.btnRefreshDataPelanggan.Icon = null;
            this.btnRefreshDataPelanggan.IsDarkTheme = false;
            this.btnRefreshDataPelanggan.Location = new System.Drawing.Point(247, 405);
            this.btnRefreshDataPelanggan.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnRefreshDataPelanggan.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnRefreshDataPelanggan.Name = "btnRefreshDataPelanggan";
            this.btnRefreshDataPelanggan.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnRefreshDataPelanggan.Size = new System.Drawing.Size(84, 36);
            this.btnRefreshDataPelanggan.TabIndex = 4;
            this.btnRefreshDataPelanggan.Text = "Refresh";
            this.btnRefreshDataPelanggan.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnRefreshDataPelanggan.UseAccentColor = false;
            this.btnRefreshDataPelanggan.UseVisualStyleBackColor = false;
            this.btnRefreshDataPelanggan.Click += new System.EventHandler(this.btnRefreshDataPelanggan_Click);
            // 
            // btnShowCachePelanggan
            // 
            this.btnShowCachePelanggan.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnShowCachePelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnShowCachePelanggan.BorderColor = System.Drawing.Color.Gray;
            this.btnShowCachePelanggan.BorderSize = 2;
            this.btnShowCachePelanggan.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnShowCachePelanggan.Depth = 0;
            this.btnShowCachePelanggan.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnShowCachePelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnShowCachePelanggan.HighEmphasis = true;
            this.btnShowCachePelanggan.Icon = null;
            this.btnShowCachePelanggan.IsDarkTheme = false;
            this.btnShowCachePelanggan.Location = new System.Drawing.Point(133, 405);
            this.btnShowCachePelanggan.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnShowCachePelanggan.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnShowCachePelanggan.Name = "btnShowCachePelanggan";
            this.btnShowCachePelanggan.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnShowCachePelanggan.Size = new System.Drawing.Size(69, 36);
            this.btnShowCachePelanggan.TabIndex = 5;
            this.btnShowCachePelanggan.Text = "Cache";
            this.btnShowCachePelanggan.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnShowCachePelanggan.UseAccentColor = false;
            this.btnShowCachePelanggan.UseVisualStyleBackColor = false;
            this.btnShowCachePelanggan.Click += new System.EventHandler(this.btnShowCachePelanggan_Click);
            // 
            // inputSearchPelanggan
            // 
            this.inputSearchPelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputSearchPelanggan.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputSearchPelanggan.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputSearchPelanggan.BorderRadius = 0;
            this.inputSearchPelanggan.BorderSize = 2;
            this.inputSearchPelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputSearchPelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputSearchPelanggan.Location = new System.Drawing.Point(7, 68);
            this.inputSearchPelanggan.Margin = new System.Windows.Forms.Padding(4);
            this.inputSearchPelanggan.Multiline = false;
            this.inputSearchPelanggan.Name = "inputSearchPelanggan";
            this.inputSearchPelanggan.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputSearchPelanggan.PasswordChar = false;
            this.inputSearchPelanggan.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputSearchPelanggan.PlaceholderText = "Ketik untuk cari pelanggan…";
            this.inputSearchPelanggan.ReadOnly = false;
            this.inputSearchPelanggan.Size = new System.Drawing.Size(786, 33);
            this.inputSearchPelanggan.TabIndex = 1;
            this.inputSearchPelanggan.Texts = "";
            this.inputSearchPelanggan.UnderlinedStyle = false;
            // 
            // FormHP
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.inputSearchPelanggan);
            this.Controls.Add(this.btnShowCachePelanggan);
            this.Controls.Add(this.btnRefreshDataPelanggan);
            this.Controls.Add(this.btnHapus);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.dgvPelanggan);
            this.Name = "FormHP";
            this.Opacity = 1D;
            this.Text = "Hapus Pelanggan";
            this.Load += new System.EventHandler(this.FormHP_Load);
            this.Controls.SetChildIndex(this.dgvPelanggan, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.btnHapus, 0);
            this.Controls.SetChildIndex(this.btnRefreshDataPelanggan, 0);
            this.Controls.SetChildIndex(this.btnShowCachePelanggan, 0);
            this.Controls.SetChildIndex(this.inputSearchPelanggan, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            ((System.ComponentModel.ISupportInitialize)(this.dgvPelanggan)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private System.Windows.Forms.DataGridView dgvPelanggan;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnHapus;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnRefreshDataPelanggan;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnShowCachePelanggan;
        private ManajemenLaundrySepatu.MyTextBox inputSearchPelanggan;
    }
}