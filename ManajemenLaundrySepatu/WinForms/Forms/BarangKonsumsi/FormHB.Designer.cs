namespace ManajemenLaundrySepatu
{
    partial class FormHB
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
            this.dgvBarang = new System.Windows.Forms.DataGridView();
            this.btnRefreshDataBarang = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnShowCacheBarang = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.inputSearchBarang = new ManajemenLaundrySepatu.MyTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvBarang)).BeginInit();
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
            this.btnHapus.Location = new System.Drawing.Point(389, 405);
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
            this.dgvBarang.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvBarang.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.dgvBarang.Location = new System.Drawing.Point(7, 107);
            this.dgvBarang.Name = "dgvBarang";
            this.dgvBarang.RowHeadersWidth = 62;
            this.dgvBarang.RowTemplate.Height = 28;
            this.dgvBarang.Size = new System.Drawing.Size(786, 289);
            this.dgvBarang.TabIndex = 2;
            this.btnRefreshDataBarang.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnRefreshDataBarang.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnRefreshDataBarang.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnRefreshDataBarang.Depth = 0;
            this.btnRefreshDataBarang.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnRefreshDataBarang.HighEmphasis = true;
            this.btnRefreshDataBarang.Icon = null;
            this.btnRefreshDataBarang.Location = new System.Drawing.Point(255, 405);
            this.btnRefreshDataBarang.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnRefreshDataBarang.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnRefreshDataBarang.Name = "btnRefreshDataBarang";
            this.btnRefreshDataBarang.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnRefreshDataBarang.Size = new System.Drawing.Size(84, 36);
            this.btnRefreshDataBarang.TabIndex = 4;
            this.btnRefreshDataBarang.Text = "Refresh";
            this.btnRefreshDataBarang.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnRefreshDataBarang.UseAccentColor = false;
            this.btnRefreshDataBarang.UseVisualStyleBackColor = false;
            this.btnRefreshDataBarang.Click += new System.EventHandler(this.btnRefreshDataBarang_Click);
            this.btnShowCacheBarang.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnShowCacheBarang.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnShowCacheBarang.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnShowCacheBarang.Depth = 0;
            this.btnShowCacheBarang.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnShowCacheBarang.HighEmphasis = true;
            this.btnShowCacheBarang.Icon = null;
            this.btnShowCacheBarang.Location = new System.Drawing.Point(137, 405);
            this.btnShowCacheBarang.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnShowCacheBarang.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnShowCacheBarang.Name = "btnShowCacheBarang";
            this.btnShowCacheBarang.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnShowCacheBarang.Size = new System.Drawing.Size(69, 36);
            this.btnShowCacheBarang.TabIndex = 5;
            this.btnShowCacheBarang.Text = "Cache";
            this.btnShowCacheBarang.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnShowCacheBarang.UseAccentColor = false;
            this.btnShowCacheBarang.UseVisualStyleBackColor = false;
            this.btnShowCacheBarang.Click += new System.EventHandler(this.btnShowCacheBarang_Click);
            this.inputSearchBarang.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputSearchBarang.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputSearchBarang.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputSearchBarang.BorderRadius = 0;
            this.inputSearchBarang.BorderSize = 2;
            this.inputSearchBarang.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputSearchBarang.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputSearchBarang.Location = new System.Drawing.Point(7, 68);
            this.inputSearchBarang.Margin = new System.Windows.Forms.Padding(4);
            this.inputSearchBarang.Multiline = false;
            this.inputSearchBarang.Name = "inputSearchBarang";
            this.inputSearchBarang.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputSearchBarang.PasswordChar = false;
            this.inputSearchBarang.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputSearchBarang.PlaceholderText = "Ketik untuk cari barang konsumsi…";
            this.inputSearchBarang.ReadOnly = false;
            this.inputSearchBarang.Size = new System.Drawing.Size(786, 32);
            this.inputSearchBarang.TabIndex = 1;
            this.inputSearchBarang.Texts = "";
            this.inputSearchBarang.UnderlinedStyle = false;
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.inputSearchBarang);
            this.Controls.Add(this.btnShowCacheBarang);
            this.Controls.Add(this.btnRefreshDataBarang);
            this.Controls.Add(this.btnHapus);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.dgvBarang);
            this.Name = "FormHB";
            this.Opacity = 1D;
            this.Text = "Hapus Barang Konsumsi";
            this.Load += new System.EventHandler(this.FormHB_Load);
            this.Controls.SetChildIndex(this.dgvBarang, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.btnHapus, 0);
            this.Controls.SetChildIndex(this.btnRefreshDataBarang, 0);
            this.Controls.SetChildIndex(this.btnShowCacheBarang, 0);
            this.Controls.SetChildIndex(this.inputSearchBarang, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            ((System.ComponentModel.ISupportInitialize)(this.dgvBarang)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnHapus;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private System.Windows.Forms.DataGridView dgvBarang;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnRefreshDataBarang;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnShowCacheBarang;
        private ManajemenLaundrySepatu.MyTextBox inputSearchBarang;
    }
}