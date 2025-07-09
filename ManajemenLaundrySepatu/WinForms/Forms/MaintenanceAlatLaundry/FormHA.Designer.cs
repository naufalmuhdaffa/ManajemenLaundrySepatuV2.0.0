namespace ManajemenLaundrySepatu
{
    partial class FormHA
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
            this.dgvAlat = new System.Windows.Forms.DataGridView();
            this.btnRefreshDataAlat = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnShowCacheAlat = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.inputSearchAlat = new ManajemenLaundrySepatu.MyTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvAlat)).BeginInit();
            this.SuspendLayout();
            // 
            // themeSwitch
            // 
            this.themeSwitch.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.776372F);
            this.themeSwitch.Location = new System.Drawing.Point(632, 25);
            this.themeSwitch.Size = new System.Drawing.Size(167, 38);
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
            this.btnHapus.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.btnHapus.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnHapus.HighEmphasis = true;
            this.btnHapus.Icon = null;
            this.btnHapus.IsDarkTheme = false;
            this.btnHapus.Location = new System.Drawing.Point(400, 405);
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
            this.btnKembali.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
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
            // dgvAlat
            // 
            this.dgvAlat.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvAlat.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.dgvAlat.Location = new System.Drawing.Point(7, 107);
            this.dgvAlat.Name = "dgvAlat";
            this.dgvAlat.RowHeadersWidth = 62;
            this.dgvAlat.RowTemplate.Height = 28;
            this.dgvAlat.Size = new System.Drawing.Size(787, 289);
            this.dgvAlat.TabIndex = 2;
            // 
            // btnRefreshDataAlat
            // 
            this.btnRefreshDataAlat.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnRefreshDataAlat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnRefreshDataAlat.BorderColor = System.Drawing.Color.Gray;
            this.btnRefreshDataAlat.BorderSize = 2;
            this.btnRefreshDataAlat.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnRefreshDataAlat.Depth = 0;
            this.btnRefreshDataAlat.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnRefreshDataAlat.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.btnRefreshDataAlat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnRefreshDataAlat.HighEmphasis = true;
            this.btnRefreshDataAlat.Icon = null;
            this.btnRefreshDataAlat.IsDarkTheme = false;
            this.btnRefreshDataAlat.Location = new System.Drawing.Point(258, 405);
            this.btnRefreshDataAlat.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnRefreshDataAlat.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnRefreshDataAlat.Name = "btnRefreshDataAlat";
            this.btnRefreshDataAlat.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnRefreshDataAlat.Size = new System.Drawing.Size(84, 36);
            this.btnRefreshDataAlat.TabIndex = 4;
            this.btnRefreshDataAlat.Text = "Refresh";
            this.btnRefreshDataAlat.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnRefreshDataAlat.UseAccentColor = false;
            this.btnRefreshDataAlat.UseVisualStyleBackColor = false;
            this.btnRefreshDataAlat.Click += new System.EventHandler(this.btnRefreshDataMaintenance_Click);
            // 
            // btnShowCacheAlat
            // 
            this.btnShowCacheAlat.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnShowCacheAlat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnShowCacheAlat.BorderColor = System.Drawing.Color.Gray;
            this.btnShowCacheAlat.BorderSize = 2;
            this.btnShowCacheAlat.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnShowCacheAlat.Depth = 0;
            this.btnShowCacheAlat.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnShowCacheAlat.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.btnShowCacheAlat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnShowCacheAlat.HighEmphasis = true;
            this.btnShowCacheAlat.Icon = null;
            this.btnShowCacheAlat.IsDarkTheme = false;
            this.btnShowCacheAlat.Location = new System.Drawing.Point(137, 405);
            this.btnShowCacheAlat.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnShowCacheAlat.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnShowCacheAlat.Name = "btnShowCacheAlat";
            this.btnShowCacheAlat.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnShowCacheAlat.Size = new System.Drawing.Size(69, 36);
            this.btnShowCacheAlat.TabIndex = 5;
            this.btnShowCacheAlat.Text = "Cache";
            this.btnShowCacheAlat.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnShowCacheAlat.UseAccentColor = false;
            this.btnShowCacheAlat.UseVisualStyleBackColor = false;
            this.btnShowCacheAlat.Click += new System.EventHandler(this.btnShowCacheMaintenance_Click);
            // 
            // inputSearchAlat
            // 
            this.inputSearchAlat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputSearchAlat.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputSearchAlat.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputSearchAlat.BorderRadius = 0;
            this.inputSearchAlat.BorderSize = 2;
            this.inputSearchAlat.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputSearchAlat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputSearchAlat.Location = new System.Drawing.Point(7, 68);
            this.inputSearchAlat.Margin = new System.Windows.Forms.Padding(4);
            this.inputSearchAlat.Multiline = false;
            this.inputSearchAlat.Name = "inputSearchAlat";
            this.inputSearchAlat.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputSearchAlat.PasswordChar = false;
            this.inputSearchAlat.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputSearchAlat.PlaceholderText = "Ketik untuk cari alat…";
            this.inputSearchAlat.ReadOnly = false;
            this.inputSearchAlat.Size = new System.Drawing.Size(786, 33);
            this.inputSearchAlat.TabIndex = 1;
            this.inputSearchAlat.Texts = "";
            this.inputSearchAlat.UnderlinedStyle = false;
            // 
            // FormHA
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.inputSearchAlat);
            this.Controls.Add(this.btnShowCacheAlat);
            this.Controls.Add(this.btnRefreshDataAlat);
            this.Controls.Add(this.btnHapus);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.dgvAlat);
            this.Name = "FormHA";
            this.Opacity = 1D;
            this.Text = "Hapus Alat Laundry";
            this.Load += new System.EventHandler(this.FormHapusMaintenance_Load);
            this.Controls.SetChildIndex(this.dgvAlat, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.btnHapus, 0);
            this.Controls.SetChildIndex(this.btnRefreshDataAlat, 0);
            this.Controls.SetChildIndex(this.btnShowCacheAlat, 0);
            this.Controls.SetChildIndex(this.inputSearchAlat, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            ((System.ComponentModel.ISupportInitialize)(this.dgvAlat)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnHapus;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private System.Windows.Forms.DataGridView dgvAlat;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnRefreshDataAlat;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnShowCacheAlat;
        private ManajemenLaundrySepatu.MyTextBox inputSearchAlat;
    }
}