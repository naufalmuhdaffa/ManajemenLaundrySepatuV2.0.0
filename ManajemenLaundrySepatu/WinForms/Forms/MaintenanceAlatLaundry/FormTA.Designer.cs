namespace ManajemenLaundrySepatu
{
    partial class FormTA
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
            this.btnTambahkanA = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.inputNamaAlat = new ManajemenLaundrySepatu.MyTextBox();
            this.inputDeskripsi = new ManajemenLaundrySepatu.MyTextBox();
            this.labelNamaAlat = new MaterialSkin.Controls.MaterialLabel();
            this.labelTanggal = new MaterialSkin.Controls.MaterialLabel();
            this.labelDeskripsi = new MaterialSkin.Controls.MaterialLabel();
            this.inputTanggal = new ManajemenLaundrySepatu.MyDateTimePicker();
            this.SuspendLayout();
            this.themeSwitch.Location = new System.Drawing.Point(629, 24);
            this.themeSwitch.Size = new System.Drawing.Size(170, 39);
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
            this.btnKembali.TabIndex = 5;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnKembali.UseAccentColor = false;
            this.btnKembali.UseVisualStyleBackColor = false;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            this.btnTambahkanA.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnTambahkanA.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnTambahkanA.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTambahkanA.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnTambahkanA.Depth = 0;
            this.btnTambahkanA.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnTambahkanA.HighEmphasis = true;
            this.btnTambahkanA.Icon = null;
            this.btnTambahkanA.Location = new System.Drawing.Point(361, 405);
            this.btnTambahkanA.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnTambahkanA.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnTambahkanA.Name = "btnTambahkanA";
            this.btnTambahkanA.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnTambahkanA.Size = new System.Drawing.Size(112, 36);
            this.btnTambahkanA.TabIndex = 4;
            this.btnTambahkanA.Text = "Tambahkan";
            this.btnTambahkanA.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnTambahkanA.UseAccentColor = false;
            this.btnTambahkanA.UseVisualStyleBackColor = false;
            this.btnTambahkanA.Click += new System.EventHandler(this.btnTambahkanA_Click);
            this.inputNamaAlat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputNamaAlat.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputNamaAlat.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputNamaAlat.BorderRadius = 0;
            this.inputNamaAlat.BorderSize = 2;
            this.inputNamaAlat.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputNamaAlat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputNamaAlat.Location = new System.Drawing.Point(285, 93);
            this.inputNamaAlat.Margin = new System.Windows.Forms.Padding(4);
            this.inputNamaAlat.Multiline = false;
            this.inputNamaAlat.Name = "inputNamaAlat";
            this.inputNamaAlat.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputNamaAlat.PasswordChar = false;
            this.inputNamaAlat.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputNamaAlat.PlaceholderText = "";
            this.inputNamaAlat.ReadOnly = false;
            this.inputNamaAlat.Size = new System.Drawing.Size(400, 32);
            this.inputNamaAlat.TabIndex = 1;
            this.inputNamaAlat.Texts = "";
            this.inputNamaAlat.UnderlinedStyle = false;
            this.inputNamaAlat.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputNamaAlat_KeyPress);
            this.inputDeskripsi.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputDeskripsi.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputDeskripsi.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputDeskripsi.BorderRadius = 0;
            this.inputDeskripsi.BorderSize = 2;
            this.inputDeskripsi.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputDeskripsi.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputDeskripsi.Location = new System.Drawing.Point(286, 281);
            this.inputDeskripsi.Margin = new System.Windows.Forms.Padding(4);
            this.inputDeskripsi.Multiline = false;
            this.inputDeskripsi.Name = "inputDeskripsi";
            this.inputDeskripsi.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputDeskripsi.PasswordChar = false;
            this.inputDeskripsi.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputDeskripsi.PlaceholderText = "";
            this.inputDeskripsi.ReadOnly = false;
            this.inputDeskripsi.Size = new System.Drawing.Size(400, 32);
            this.inputDeskripsi.TabIndex = 3;
            this.inputDeskripsi.Texts = "";
            this.inputDeskripsi.UnderlinedStyle = false;
            this.inputDeskripsi.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputDeskripsi_KeyPress);
            this.labelNamaAlat.AutoSize = true;
            this.labelNamaAlat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelNamaAlat.Depth = 0;
            this.labelNamaAlat.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelNamaAlat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelNamaAlat.Location = new System.Drawing.Point(108, 96);
            this.labelNamaAlat.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelNamaAlat.Name = "labelNamaAlat";
            this.labelNamaAlat.Size = new System.Drawing.Size(55, 19);
            this.labelNamaAlat.TabIndex = 6;
            this.labelNamaAlat.Text = "Nama *";
            this.labelTanggal.AutoSize = true;
            this.labelTanggal.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelTanggal.Depth = 0;
            this.labelTanggal.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelTanggal.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelTanggal.Location = new System.Drawing.Point(108, 182);
            this.labelTanggal.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelTanggal.Name = "labelTanggal";
            this.labelTanggal.Size = new System.Drawing.Size(167, 19);
            this.labelTanggal.TabIndex = 7;
            this.labelTanggal.Text = "Tanggal Maintenance *";
            this.labelDeskripsi.AutoSize = true;
            this.labelDeskripsi.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelDeskripsi.Depth = 0;
            this.labelDeskripsi.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelDeskripsi.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelDeskripsi.Location = new System.Drawing.Point(109, 281);
            this.labelDeskripsi.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelDeskripsi.Name = "labelDeskripsi";
            this.labelDeskripsi.Size = new System.Drawing.Size(66, 19);
            this.labelDeskripsi.TabIndex = 8;
            this.labelDeskripsi.Text = "Deskripsi";
            this.inputTanggal.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputTanggal.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputTanggal.BorderSize = 1;
            this.inputTanggal.CalendarTitleBackColor = System.Drawing.SystemColors.Control;
            this.inputTanggal.CalendarTitleForeColor = System.Drawing.SystemColors.ControlText;
            this.inputTanggal.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputTanggal.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputTanggal.Location = new System.Drawing.Point(286, 182);
            this.inputTanggal.MinDate = new System.DateTime(2025, 1, 1, 0, 0, 0, 0);
            this.inputTanggal.MinimumSize = new System.Drawing.Size(120, 30);
            this.inputTanggal.Name = "inputTanggal";
            this.inputTanggal.Size = new System.Drawing.Size(399, 30);
            this.inputTanggal.SkinColor = System.Drawing.Color.MediumSlateBlue;
            this.inputTanggal.TabIndex = 2;
            this.inputTanggal.TextColor = System.Drawing.Color.Black;
            this.inputTanggal.Value = new System.DateTime(2025, 6, 1, 13, 2, 39, 572);
            this.inputTanggal.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.inputTanggal_KeyPress);
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.inputTanggal);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTambahkanA);
            this.Controls.Add(this.inputNamaAlat);
            this.Controls.Add(this.inputDeskripsi);
            this.Controls.Add(this.labelNamaAlat);
            this.Controls.Add(this.labelTanggal);
            this.Controls.Add(this.labelDeskripsi);
            this.Name = "FormTA";
            this.Opacity = 1D;
            this.Text = "Tambah Alat Laundry";
            this.Controls.SetChildIndex(this.labelDeskripsi, 0);
            this.Controls.SetChildIndex(this.labelTanggal, 0);
            this.Controls.SetChildIndex(this.labelNamaAlat, 0);
            this.Controls.SetChildIndex(this.inputDeskripsi, 0);
            this.Controls.SetChildIndex(this.inputNamaAlat, 0);
            this.Controls.SetChildIndex(this.btnTambahkanA, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.inputTanggal, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnTambahkanA;
        private ManajemenLaundrySepatu.MyTextBox inputNamaAlat;
        private ManajemenLaundrySepatu.MyTextBox inputDeskripsi;
        private MaterialSkin.Controls.MaterialLabel labelNamaAlat;
        private MaterialSkin.Controls.MaterialLabel labelTanggal;
        private MaterialSkin.Controls.MaterialLabel labelDeskripsi;
        private ManajemenLaundrySepatu.MyDateTimePicker inputTanggal;
    }
}