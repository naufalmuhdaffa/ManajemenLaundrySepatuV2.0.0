namespace ManajemenLaundrySepatu
{
    partial class FormKDA
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
            this.btnHA = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnUA = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnKembali = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnTA = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.SuspendLayout();
            // 
            // themeSwitch
            // 
            this.themeSwitch.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.776372F);
            this.themeSwitch.Location = new System.Drawing.Point(632, 25);
            this.themeSwitch.Size = new System.Drawing.Size(167, 38);
            // 
            // btnHA
            // 
            this.btnHA.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnHA.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnHA.BorderColor = System.Drawing.Color.Gray;
            this.btnHA.BorderSize = 2;
            this.btnHA.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHA.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnHA.Depth = 0;
            this.btnHA.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnHA.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnHA.HighEmphasis = true;
            this.btnHA.Icon = null;
            this.btnHA.IsDarkTheme = false;
            this.btnHA.Location = new System.Drawing.Point(7, 268);
            this.btnHA.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnHA.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnHA.Name = "btnHA";
            this.btnHA.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnHA.Size = new System.Drawing.Size(233, 36);
            this.btnHA.TabIndex = 3;
            this.btnHA.Text = "Lihat / Hapus Alat Laundry";
            this.btnHA.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnHA.UseAccentColor = false;
            this.btnHA.UseVisualStyleBackColor = false;
            this.btnHA.Click += new System.EventHandler(this.btnHA_Click);
            // 
            // btnUA
            // 
            this.btnUA.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnUA.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnUA.BorderColor = System.Drawing.Color.Gray;
            this.btnUA.BorderSize = 2;
            this.btnUA.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnUA.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnUA.Depth = 0;
            this.btnUA.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnUA.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnUA.HighEmphasis = true;
            this.btnUA.Icon = null;
            this.btnUA.IsDarkTheme = false;
            this.btnUA.Location = new System.Drawing.Point(7, 163);
            this.btnUA.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnUA.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnUA.Name = "btnUA";
            this.btnUA.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnUA.Size = new System.Drawing.Size(241, 36);
            this.btnUA.TabIndex = 2;
            this.btnUA.Text = "Lihat / Update Alat Laundry";
            this.btnUA.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnUA.UseAccentColor = false;
            this.btnUA.UseVisualStyleBackColor = false;
            this.btnUA.Click += new System.EventHandler(this.btnUA_Click);
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
            // btnTA
            // 
            this.btnTA.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnTA.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnTA.BorderColor = System.Drawing.Color.Gray;
            this.btnTA.BorderSize = 2;
            this.btnTA.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTA.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnTA.Depth = 0;
            this.btnTA.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnTA.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnTA.HighEmphasis = true;
            this.btnTA.Icon = null;
            this.btnTA.IsDarkTheme = false;
            this.btnTA.Location = new System.Drawing.Point(7, 70);
            this.btnTA.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnTA.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnTA.Name = "btnTA";
            this.btnTA.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnTA.Size = new System.Drawing.Size(191, 36);
            this.btnTA.TabIndex = 1;
            this.btnTA.Text = "Tambah Alat Laundry";
            this.btnTA.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnTA.UseAccentColor = false;
            this.btnTA.UseVisualStyleBackColor = false;
            this.btnTA.Click += new System.EventHandler(this.btnTA_Click);
            // 
            // FormKDA
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnHA);
            this.Controls.Add(this.btnUA);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTA);
            this.Name = "FormKDA";
            this.Opacity = 1D;
            this.Text = "Kelola Data Alat Laundry";
            this.Controls.SetChildIndex(this.btnTA, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.btnUA, 0);
            this.Controls.SetChildIndex(this.btnHA, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnHA;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnUA;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnTA;
    }
}