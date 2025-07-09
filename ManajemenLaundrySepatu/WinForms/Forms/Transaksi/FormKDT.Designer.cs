namespace ManajemenLaundrySepatu
{
    partial class FormKDT
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
            this.btnHP = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnUP = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnKembali = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnTT = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.button1 = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.SuspendLayout();
            // 
            // themeSwitch
            // 
            this.themeSwitch.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.776372F);
            this.themeSwitch.Location = new System.Drawing.Point(632, 25);
            this.themeSwitch.Size = new System.Drawing.Size(167, 38);
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
            this.btnHP.Location = new System.Drawing.Point(7, 223);
            this.btnHP.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnHP.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnHP.Name = "btnHP";
            this.btnHP.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnHP.Size = new System.Drawing.Size(207, 36);
            this.btnHP.TabIndex = 3;
            this.btnHP.Text = "Lihat / Hapus Transaksi";
            this.btnHP.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnHP.UseAccentColor = false;
            this.btnHP.UseVisualStyleBackColor = false;
            this.btnHP.Click += new System.EventHandler(this.btnHT_Click);
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
            this.btnUP.Location = new System.Drawing.Point(7, 143);
            this.btnUP.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnUP.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnUP.Name = "btnUP";
            this.btnUP.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnUP.Size = new System.Drawing.Size(215, 36);
            this.btnUP.TabIndex = 2;
            this.btnUP.Text = "Lihat / Update Transaksi";
            this.btnUP.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnUP.UseAccentColor = false;
            this.btnUP.UseVisualStyleBackColor = false;
            this.btnUP.Click += new System.EventHandler(this.btnUT_Click);
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
            this.btnKembali.TabIndex = 5;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnKembali.UseAccentColor = false;
            this.btnKembali.UseVisualStyleBackColor = false;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnTT
            // 
            this.btnTT.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnTT.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnTT.BorderColor = System.Drawing.Color.Gray;
            this.btnTT.BorderSize = 2;
            this.btnTT.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTT.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnTT.Depth = 0;
            this.btnTT.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnTT.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnTT.HighEmphasis = true;
            this.btnTT.Icon = null;
            this.btnTT.IsDarkTheme = false;
            this.btnTT.Location = new System.Drawing.Point(7, 70);
            this.btnTT.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnTT.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnTT.Name = "btnTT";
            this.btnTT.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnTT.Size = new System.Drawing.Size(165, 36);
            this.btnTT.TabIndex = 1;
            this.btnTT.Text = "Tambah Transaksi";
            this.btnTT.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnTT.UseAccentColor = false;
            this.btnTT.UseVisualStyleBackColor = false;
            this.btnTT.Click += new System.EventHandler(this.btnTT_Click);
            // 
            // button1
            // 
            this.button1.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.button1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.button1.BorderColor = System.Drawing.Color.Gray;
            this.button1.BorderSize = 2;
            this.button1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.button1.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.button1.Depth = 0;
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.button1.HighEmphasis = true;
            this.button1.Icon = null;
            this.button1.IsDarkTheme = false;
            this.button1.Location = new System.Drawing.Point(622, 70);
            this.button1.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.button1.MouseState = MaterialSkin.MouseState.HOVER;
            this.button1.Name = "button1";
            this.button1.NoAccentTextColor = System.Drawing.Color.Empty;
            this.button1.Size = new System.Drawing.Size(171, 36);
            this.button1.TabIndex = 4;
            this.button1.Text = "Laporan Transaksi";
            this.button1.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.button1.UseAccentColor = false;
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.btnLT_Click);
            // 
            // FormKDT
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.btnHP);
            this.Controls.Add(this.btnUP);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTT);
            this.Name = "FormKDT";
            this.Opacity = 1D;
            this.Text = "Kelola Data Transaksi";
            this.Controls.SetChildIndex(this.btnTT, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.btnUP, 0);
            this.Controls.SetChildIndex(this.btnHP, 0);
            this.Controls.SetChildIndex(this.button1, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnHP;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnUP;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnTT;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton button1;
    }
}