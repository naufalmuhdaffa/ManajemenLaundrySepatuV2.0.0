namespace ManajemenLaundrySepatu
{
    partial class FormKDB
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
            this.btnHB = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnUB = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnKembali = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnTB = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.SuspendLayout();
            // 
            // themeSwitch
            // 
            this.themeSwitch.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.776372F);
            this.themeSwitch.Location = new System.Drawing.Point(632, 25);
            this.themeSwitch.Size = new System.Drawing.Size(167, 38);
            // 
            // btnHB
            // 
            this.btnHB.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnHB.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnHB.BorderColor = System.Drawing.Color.Gray;
            this.btnHB.BorderSize = 2;
            this.btnHB.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHB.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnHB.Depth = 0;
            this.btnHB.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnHB.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnHB.HighEmphasis = true;
            this.btnHB.Icon = null;
            this.btnHB.IsDarkTheme = false;
            this.btnHB.Location = new System.Drawing.Point(7, 259);
            this.btnHB.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnHB.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnHB.Name = "btnHB";
            this.btnHB.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnHB.Size = new System.Drawing.Size(264, 36);
            this.btnHB.TabIndex = 3;
            this.btnHB.Text = "Lihat / Hapus Barang Konsumsi";
            this.btnHB.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnHB.UseAccentColor = false;
            this.btnHB.UseVisualStyleBackColor = false;
            this.btnHB.Click += new System.EventHandler(this.btnHB_Click);
            // 
            // btnUB
            // 
            this.btnUB.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnUB.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnUB.BorderColor = System.Drawing.Color.Gray;
            this.btnUB.BorderSize = 2;
            this.btnUB.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnUB.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnUB.Depth = 0;
            this.btnUB.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnUB.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnUB.HighEmphasis = true;
            this.btnUB.Icon = null;
            this.btnUB.IsDarkTheme = false;
            this.btnUB.Location = new System.Drawing.Point(7, 157);
            this.btnUB.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnUB.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnUB.Name = "btnUB";
            this.btnUB.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnUB.Size = new System.Drawing.Size(272, 36);
            this.btnUB.TabIndex = 2;
            this.btnUB.Text = "Lihat / Update Barang Konsumsi";
            this.btnUB.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnUB.UseAccentColor = false;
            this.btnUB.UseVisualStyleBackColor = false;
            this.btnUB.Click += new System.EventHandler(this.btnUB_Click);
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
            this.btnKembali.TabIndex = 4;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnKembali.UseAccentColor = false;
            this.btnKembali.UseVisualStyleBackColor = false;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnTB
            // 
            this.btnTB.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnTB.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnTB.BorderColor = System.Drawing.Color.Gray;
            this.btnTB.BorderSize = 2;
            this.btnTB.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTB.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnTB.Depth = 0;
            this.btnTB.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnTB.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnTB.HighEmphasis = true;
            this.btnTB.Icon = null;
            this.btnTB.IsDarkTheme = false;
            this.btnTB.Location = new System.Drawing.Point(7, 70);
            this.btnTB.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnTB.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnTB.Name = "btnTB";
            this.btnTB.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnTB.Size = new System.Drawing.Size(222, 36);
            this.btnTB.TabIndex = 1;
            this.btnTB.Text = "Tambah Barang Konsumsi";
            this.btnTB.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnTB.UseAccentColor = false;
            this.btnTB.UseVisualStyleBackColor = false;
            this.btnTB.Click += new System.EventHandler(this.btnTB_Click);
            // 
            // FormKDB
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnHB);
            this.Controls.Add(this.btnUB);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTB);
            this.Name = "FormKDB";
            this.Opacity = 1D;
            this.Text = "Kelola Data Barang Konsumsi";
            this.Controls.SetChildIndex(this.btnTB, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.btnUB, 0);
            this.Controls.SetChildIndex(this.btnHB, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnHB;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnUB;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnTB;
    }
}