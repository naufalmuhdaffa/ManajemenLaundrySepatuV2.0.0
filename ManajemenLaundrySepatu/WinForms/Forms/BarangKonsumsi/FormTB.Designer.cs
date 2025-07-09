namespace ManajemenLaundrySepatu
{
    partial class FormTB
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
            this.btnTambahkanB = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.inputNamaBarang = new ManajemenLaundrySepatu.MyTextBox();
            this.inputJumlah = new ManajemenLaundrySepatu.MyTextBox();
            this.inputSatuan = new ManajemenLaundrySepatu.MyTextBox();
            this.labelNamaBarang = new MaterialSkin.Controls.MaterialLabel();
            this.labelJumlah = new MaterialSkin.Controls.MaterialLabel();
            this.labelSatuan = new MaterialSkin.Controls.MaterialLabel();
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
            this.btnKembali.TabIndex = 5;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnKembali.UseAccentColor = false;
            this.btnKembali.UseVisualStyleBackColor = false;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnTambahkanB
            // 
            this.btnTambahkanB.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnTambahkanB.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnTambahkanB.BorderColor = System.Drawing.Color.Gray;
            this.btnTambahkanB.BorderSize = 2;
            this.btnTambahkanB.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTambahkanB.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnTambahkanB.Depth = 0;
            this.btnTambahkanB.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnTambahkanB.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnTambahkanB.HighEmphasis = true;
            this.btnTambahkanB.Icon = null;
            this.btnTambahkanB.IsDarkTheme = false;
            this.btnTambahkanB.Location = new System.Drawing.Point(364, 405);
            this.btnTambahkanB.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnTambahkanB.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnTambahkanB.Name = "btnTambahkanB";
            this.btnTambahkanB.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnTambahkanB.Size = new System.Drawing.Size(112, 36);
            this.btnTambahkanB.TabIndex = 4;
            this.btnTambahkanB.Text = "Tambahkan";
            this.btnTambahkanB.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnTambahkanB.UseAccentColor = false;
            this.btnTambahkanB.UseVisualStyleBackColor = false;
            this.btnTambahkanB.Click += new System.EventHandler(this.btnTambahkanB_Click);
            // 
            // inputNamaBarang
            // 
            this.inputNamaBarang.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputNamaBarang.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputNamaBarang.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputNamaBarang.BorderRadius = 0;
            this.inputNamaBarang.BorderSize = 2;
            this.inputNamaBarang.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputNamaBarang.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputNamaBarang.Location = new System.Drawing.Point(279, 92);
            this.inputNamaBarang.Margin = new System.Windows.Forms.Padding(4);
            this.inputNamaBarang.Multiline = false;
            this.inputNamaBarang.Name = "inputNamaBarang";
            this.inputNamaBarang.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputNamaBarang.PasswordChar = false;
            this.inputNamaBarang.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputNamaBarang.PlaceholderText = "";
            this.inputNamaBarang.ReadOnly = false;
            this.inputNamaBarang.Size = new System.Drawing.Size(400, 33);
            this.inputNamaBarang.TabIndex = 1;
            this.inputNamaBarang.Texts = "";
            this.inputNamaBarang.UnderlinedStyle = false;
            this.inputNamaBarang.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputNamaBarang_KeyPress);
            // 
            // inputJumlah
            // 
            this.inputJumlah.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputJumlah.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputJumlah.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputJumlah.BorderRadius = 0;
            this.inputJumlah.BorderSize = 2;
            this.inputJumlah.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputJumlah.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputJumlah.Location = new System.Drawing.Point(279, 183);
            this.inputJumlah.Margin = new System.Windows.Forms.Padding(4);
            this.inputJumlah.Multiline = false;
            this.inputJumlah.Name = "inputJumlah";
            this.inputJumlah.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputJumlah.PasswordChar = false;
            this.inputJumlah.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputJumlah.PlaceholderText = "";
            this.inputJumlah.ReadOnly = false;
            this.inputJumlah.Size = new System.Drawing.Size(400, 33);
            this.inputJumlah.TabIndex = 2;
            this.inputJumlah.Texts = "";
            this.inputJumlah.UnderlinedStyle = false;
            this.inputJumlah.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputJumlah_KeyPress);
            // 
            // inputSatuan
            // 
            this.inputSatuan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputSatuan.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputSatuan.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputSatuan.BorderRadius = 0;
            this.inputSatuan.BorderSize = 2;
            this.inputSatuan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputSatuan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputSatuan.Location = new System.Drawing.Point(279, 270);
            this.inputSatuan.Margin = new System.Windows.Forms.Padding(4);
            this.inputSatuan.Multiline = false;
            this.inputSatuan.Name = "inputSatuan";
            this.inputSatuan.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputSatuan.PasswordChar = false;
            this.inputSatuan.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputSatuan.PlaceholderText = "";
            this.inputSatuan.ReadOnly = false;
            this.inputSatuan.Size = new System.Drawing.Size(400, 33);
            this.inputSatuan.TabIndex = 3;
            this.inputSatuan.Texts = "";
            this.inputSatuan.UnderlinedStyle = false;
            this.inputSatuan.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputSatuan_KeyPress);
            // 
            // labelNamaBarang
            // 
            this.labelNamaBarang.AutoSize = true;
            this.labelNamaBarang.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelNamaBarang.Depth = 0;
            this.labelNamaBarang.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelNamaBarang.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelNamaBarang.Location = new System.Drawing.Point(120, 92);
            this.labelNamaBarang.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelNamaBarang.Name = "labelNamaBarang";
            this.labelNamaBarang.Size = new System.Drawing.Size(55, 19);
            this.labelNamaBarang.TabIndex = 6;
            this.labelNamaBarang.Text = "Nama *";
            // 
            // labelJumlah
            // 
            this.labelJumlah.AutoSize = true;
            this.labelJumlah.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelJumlah.Depth = 0;
            this.labelJumlah.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelJumlah.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelJumlah.Location = new System.Drawing.Point(120, 183);
            this.labelJumlah.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelJumlah.Name = "labelJumlah";
            this.labelJumlah.Size = new System.Drawing.Size(66, 19);
            this.labelJumlah.TabIndex = 7;
            this.labelJumlah.Text = "Jumlah *";
            // 
            // labelSatuan
            // 
            this.labelSatuan.AutoSize = true;
            this.labelSatuan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelSatuan.Depth = 0;
            this.labelSatuan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelSatuan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelSatuan.Location = new System.Drawing.Point(120, 270);
            this.labelSatuan.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelSatuan.Name = "labelSatuan";
            this.labelSatuan.Size = new System.Drawing.Size(52, 19);
            this.labelSatuan.TabIndex = 8;
            this.labelSatuan.Text = "Satuan";
            // 
            // FormTB
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTambahkanB);
            this.Controls.Add(this.inputNamaBarang);
            this.Controls.Add(this.inputJumlah);
            this.Controls.Add(this.inputSatuan);
            this.Controls.Add(this.labelNamaBarang);
            this.Controls.Add(this.labelJumlah);
            this.Controls.Add(this.labelSatuan);
            this.Name = "FormTB";
            this.Opacity = 1D;
            this.Text = "Tambah Barang Konsumsi";
            this.Shown += new System.EventHandler(this.FormTB_Shown);
            this.Controls.SetChildIndex(this.labelSatuan, 0);
            this.Controls.SetChildIndex(this.labelJumlah, 0);
            this.Controls.SetChildIndex(this.labelNamaBarang, 0);
            this.Controls.SetChildIndex(this.inputSatuan, 0);
            this.Controls.SetChildIndex(this.inputJumlah, 0);
            this.Controls.SetChildIndex(this.inputNamaBarang, 0);
            this.Controls.SetChildIndex(this.btnTambahkanB, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnTambahkanB;
        private ManajemenLaundrySepatu.MyTextBox inputNamaBarang;
        private ManajemenLaundrySepatu.MyTextBox inputJumlah;
        private ManajemenLaundrySepatu.MyTextBox inputSatuan;
        private MaterialSkin.Controls.MaterialLabel labelNamaBarang;
        private MaterialSkin.Controls.MaterialLabel labelJumlah;
        private MaterialSkin.Controls.MaterialLabel labelSatuan;
    }
}