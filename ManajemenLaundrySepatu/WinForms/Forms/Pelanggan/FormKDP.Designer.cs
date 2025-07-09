namespace ManajemenLaundrySepatu
{
    partial class FormKDP
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
            this.btnTP = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnKembali = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnUP = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnHP = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.SuspendLayout();
            // 
            // themeSwitch
            // 
            this.themeSwitch.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.776372F);
            this.themeSwitch.Location = new System.Drawing.Point(632, 25);
            this.themeSwitch.Size = new System.Drawing.Size(167, 38);
            // 
            // btnTP
            // 
            this.btnTP.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnTP.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnTP.BorderColor = System.Drawing.Color.Gray;
            this.btnTP.BorderSize = 2;
            this.btnTP.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTP.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnTP.Depth = 0;
            this.btnTP.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnTP.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnTP.HighEmphasis = true;
            this.btnTP.Icon = null;
            this.btnTP.IsDarkTheme = false;
            this.btnTP.Location = new System.Drawing.Point(7, 70);
            this.btnTP.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnTP.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnTP.Name = "btnTP";
            this.btnTP.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnTP.Size = new System.Drawing.Size(172, 36);
            this.btnTP.TabIndex = 1;
            this.btnTP.Text = "Tambah Pelanggan";
            this.btnTP.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnTP.UseAccentColor = false;
            this.btnTP.UseVisualStyleBackColor = false;
            this.btnTP.Click += new System.EventHandler(this.btnTP_Click);
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
            // btnUP
            // 
            this.btnUP.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnUP.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnUP.BorderColor = System.Drawing.Color.Gray;
            this.btnUP.BorderSize = 2;
            this.btnUP.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnUP.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnUP.Depth = 0;
            this.btnUP.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnUP.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnUP.HighEmphasis = true;
            this.btnUP.Icon = null;
            this.btnUP.IsDarkTheme = false;
            this.btnUP.Location = new System.Drawing.Point(7, 152);
            this.btnUP.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnUP.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnUP.Name = "btnUP";
            this.btnUP.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnUP.Size = new System.Drawing.Size(222, 36);
            this.btnUP.TabIndex = 2;
            this.btnUP.Text = "Lihat / Update Pelanggan";
            this.btnUP.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnUP.UseAccentColor = false;
            this.btnUP.UseVisualStyleBackColor = false;
            this.btnUP.Click += new System.EventHandler(this.btnLP_Click);
            // 
            // btnHP
            // 
            this.btnHP.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnHP.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnHP.BorderColor = System.Drawing.Color.Gray;
            this.btnHP.BorderSize = 2;
            this.btnHP.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHP.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnHP.Depth = 0;
            this.btnHP.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnHP.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnHP.HighEmphasis = true;
            this.btnHP.Icon = null;
            this.btnHP.IsDarkTheme = false;
            this.btnHP.Location = new System.Drawing.Point(7, 241);
            this.btnHP.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnHP.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnHP.Name = "btnHP";
            this.btnHP.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnHP.Size = new System.Drawing.Size(214, 36);
            this.btnHP.TabIndex = 3;
            this.btnHP.Text = "Lihat / Hapus Pelanggan";
            this.btnHP.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnHP.UseAccentColor = false;
            this.btnHP.UseVisualStyleBackColor = false;
            this.btnHP.Click += new System.EventHandler(this.btnHP_Click);
            // 
            // FormKDP
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnHP);
            this.Controls.Add(this.btnUP);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTP);
            this.Name = "FormKDP";
            this.Opacity = 1D;
            this.Text = "Kelola Data Pelanggan";
            this.Controls.SetChildIndex(this.btnTP, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.btnUP, 0);
            this.Controls.SetChildIndex(this.btnHP, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnTP;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnUP;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnHP;
    }
}