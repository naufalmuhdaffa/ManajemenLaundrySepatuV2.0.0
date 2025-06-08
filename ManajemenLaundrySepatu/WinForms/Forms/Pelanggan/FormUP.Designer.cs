namespace ManajemenLaundrySepatu
{
    partial class FormUP
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
            this.dgvPelanggan = new System.Windows.Forms.DataGridView();
            this.btnKembali = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnUpdate = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.inputIdPelanggan = new ManajemenLaundrySepatu.MyTextBox();
            this.inputNamaPelanggan = new ManajemenLaundrySepatu.MyTextBox();
            this.inputNoHP = new ManajemenLaundrySepatu.MyTextBox();
            this.inputAlamat = new ManajemenLaundrySepatu.MyTextBox();
            this.labelIdPelanggan = new MaterialSkin.Controls.MaterialLabel();
            this.labelNamaPelanggan = new MaterialSkin.Controls.MaterialLabel();
            this.labelNoHP = new MaterialSkin.Controls.MaterialLabel();
            this.labelAlamat = new MaterialSkin.Controls.MaterialLabel();
            this.btnRefreshDataPelanggan = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnShowCachePelanggan = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.inputSearchPelanggan = new ManajemenLaundrySepatu.MyTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPelanggan)).BeginInit();
            this.SuspendLayout();
            // 
            // themeSwitch
            // 
            this.themeSwitch.Location = new System.Drawing.Point(629, 24);
            this.themeSwitch.Size = new System.Drawing.Size(170, 39);
            // 
            // dgvPelanggan
            // 
            this.dgvPelanggan.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvPelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.dgvPelanggan.Location = new System.Drawing.Point(6, 107);
            this.dgvPelanggan.Name = "dgvPelanggan";
            this.dgvPelanggan.RowHeadersWidth = 62;
            this.dgvPelanggan.RowTemplate.Height = 28;
            this.dgvPelanggan.Size = new System.Drawing.Size(374, 289);
            this.dgvPelanggan.TabIndex = 2;
            this.dgvPelanggan.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvPelanggan_CellClick);
            // 
            // btnKembali
            // 
            this.btnKembali.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnKembali.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnKembali.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKembali.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnKembali.Depth = 0;
            this.btnKembali.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.btnKembali.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnKembali.HighEmphasis = true;
            this.btnKembali.Icon = null;
            this.btnKembali.Location = new System.Drawing.Point(6, 405);
            this.btnKembali.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnKembali.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnKembali.Name = "btnKembali";
            this.btnKembali.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnKembali.Size = new System.Drawing.Size(83, 36);
            this.btnKembali.TabIndex = 10;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnKembali.UseAccentColor = false;
            this.btnKembali.UseVisualStyleBackColor = false;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnUpdate
            // 
            this.btnUpdate.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnUpdate.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnUpdate.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnUpdate.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnUpdate.Depth = 0;
            this.btnUpdate.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.btnUpdate.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnUpdate.HighEmphasis = true;
            this.btnUpdate.Icon = null;
            this.btnUpdate.Location = new System.Drawing.Point(303, 405);
            this.btnUpdate.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnUpdate.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnUpdate.Size = new System.Drawing.Size(77, 36);
            this.btnUpdate.TabIndex = 7;
            this.btnUpdate.Text = "Update";
            this.btnUpdate.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnUpdate.UseAccentColor = false;
            this.btnUpdate.UseVisualStyleBackColor = false;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // inputIdPelanggan
            // 
            this.inputIdPelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputIdPelanggan.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputIdPelanggan.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputIdPelanggan.BorderRadius = 0;
            this.inputIdPelanggan.BorderSize = 2;
            this.inputIdPelanggan.Enabled = false;
            this.inputIdPelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputIdPelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputIdPelanggan.Location = new System.Drawing.Point(386, 130);
            this.inputIdPelanggan.Margin = new System.Windows.Forms.Padding(4);
            this.inputIdPelanggan.Multiline = false;
            this.inputIdPelanggan.Name = "inputIdPelanggan";
            this.inputIdPelanggan.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputIdPelanggan.PasswordChar = false;
            this.inputIdPelanggan.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputIdPelanggan.PlaceholderText = "Pilih ID Pelanggan dari tabel..";
            this.inputIdPelanggan.ReadOnly = false;
            this.inputIdPelanggan.Size = new System.Drawing.Size(407, 32);
            this.inputIdPelanggan.TabIndex = 3;
            this.inputIdPelanggan.Texts = "";
            this.inputIdPelanggan.UnderlinedStyle = false;
            // 
            // inputNamaPelanggan
            // 
            this.inputNamaPelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputNamaPelanggan.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputNamaPelanggan.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputNamaPelanggan.BorderRadius = 0;
            this.inputNamaPelanggan.BorderSize = 2;
            this.inputNamaPelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputNamaPelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputNamaPelanggan.Location = new System.Drawing.Point(386, 213);
            this.inputNamaPelanggan.Margin = new System.Windows.Forms.Padding(4);
            this.inputNamaPelanggan.Multiline = false;
            this.inputNamaPelanggan.Name = "inputNamaPelanggan";
            this.inputNamaPelanggan.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputNamaPelanggan.PasswordChar = false;
            this.inputNamaPelanggan.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputNamaPelanggan.PlaceholderText = "";
            this.inputNamaPelanggan.ReadOnly = false;
            this.inputNamaPelanggan.Size = new System.Drawing.Size(407, 32);
            this.inputNamaPelanggan.TabIndex = 4;
            this.inputNamaPelanggan.Texts = "";
            this.inputNamaPelanggan.UnderlinedStyle = false;
            // 
            // inputNoHP
            // 
            this.inputNoHP.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputNoHP.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputNoHP.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputNoHP.BorderRadius = 0;
            this.inputNoHP.BorderSize = 2;
            this.inputNoHP.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputNoHP.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputNoHP.Location = new System.Drawing.Point(386, 289);
            this.inputNoHP.Margin = new System.Windows.Forms.Padding(4);
            this.inputNoHP.Multiline = false;
            this.inputNoHP.Name = "inputNoHP";
            this.inputNoHP.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputNoHP.PasswordChar = false;
            this.inputNoHP.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputNoHP.PlaceholderText = "";
            this.inputNoHP.ReadOnly = false;
            this.inputNoHP.Size = new System.Drawing.Size(407, 32);
            this.inputNoHP.TabIndex = 5;
            this.inputNoHP.Texts = "";
            this.inputNoHP.UnderlinedStyle = false;
            // 
            // inputAlamat
            // 
            this.inputAlamat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.inputAlamat.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.inputAlamat.BorderFocusColor = System.Drawing.Color.HotPink;
            this.inputAlamat.BorderRadius = 0;
            this.inputAlamat.BorderSize = 2;
            this.inputAlamat.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.inputAlamat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.inputAlamat.Location = new System.Drawing.Point(386, 364);
            this.inputAlamat.Margin = new System.Windows.Forms.Padding(4);
            this.inputAlamat.Multiline = false;
            this.inputAlamat.Name = "inputAlamat";
            this.inputAlamat.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.inputAlamat.PasswordChar = false;
            this.inputAlamat.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.inputAlamat.PlaceholderText = "";
            this.inputAlamat.ReadOnly = false;
            this.inputAlamat.Size = new System.Drawing.Size(407, 32);
            this.inputAlamat.TabIndex = 6;
            this.inputAlamat.Texts = "";
            this.inputAlamat.UnderlinedStyle = false;
            // 
            // labelIdPelanggan
            // 
            this.labelIdPelanggan.AutoSize = true;
            this.labelIdPelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelIdPelanggan.Depth = 0;
            this.labelIdPelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelIdPelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelIdPelanggan.Location = new System.Drawing.Point(386, 107);
            this.labelIdPelanggan.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelIdPelanggan.Name = "labelIdPelanggan";
            this.labelIdPelanggan.Size = new System.Drawing.Size(107, 19);
            this.labelIdPelanggan.TabIndex = 11;
            this.labelIdPelanggan.Text = "ID Pelanggan *";
            // 
            // labelNamaPelanggan
            // 
            this.labelNamaPelanggan.AutoSize = true;
            this.labelNamaPelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelNamaPelanggan.Depth = 0;
            this.labelNamaPelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelNamaPelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelNamaPelanggan.Location = new System.Drawing.Point(386, 190);
            this.labelNamaPelanggan.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelNamaPelanggan.Name = "labelNamaPelanggan";
            this.labelNamaPelanggan.Size = new System.Drawing.Size(55, 19);
            this.labelNamaPelanggan.TabIndex = 12;
            this.labelNamaPelanggan.Text = "Nama *";
            // 
            // labelNoHP
            // 
            this.labelNoHP.AutoSize = true;
            this.labelNoHP.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelNoHP.Depth = 0;
            this.labelNoHP.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelNoHP.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelNoHP.Location = new System.Drawing.Point(386, 266);
            this.labelNoHP.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelNoHP.Name = "labelNoHP";
            this.labelNoHP.Size = new System.Drawing.Size(57, 19);
            this.labelNoHP.TabIndex = 13;
            this.labelNoHP.Text = "No HP *";
            // 
            // labelAlamat
            // 
            this.labelAlamat.AutoSize = true;
            this.labelAlamat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelAlamat.Depth = 0;
            this.labelAlamat.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelAlamat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelAlamat.Location = new System.Drawing.Point(386, 341);
            this.labelAlamat.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelAlamat.Name = "labelAlamat";
            this.labelAlamat.Size = new System.Drawing.Size(52, 19);
            this.labelAlamat.TabIndex = 14;
            this.labelAlamat.Text = "Alamat";
            // 
            // btnRefreshDataPelanggan
            // 
            this.btnRefreshDataPelanggan.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnRefreshDataPelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnRefreshDataPelanggan.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnRefreshDataPelanggan.Depth = 0;
            this.btnRefreshDataPelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.btnRefreshDataPelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnRefreshDataPelanggan.HighEmphasis = true;
            this.btnRefreshDataPelanggan.Icon = null;
            this.btnRefreshDataPelanggan.Location = new System.Drawing.Point(202, 405);
            this.btnRefreshDataPelanggan.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnRefreshDataPelanggan.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnRefreshDataPelanggan.Name = "btnRefreshDataPelanggan";
            this.btnRefreshDataPelanggan.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnRefreshDataPelanggan.Size = new System.Drawing.Size(84, 36);
            this.btnRefreshDataPelanggan.TabIndex = 8;
            this.btnRefreshDataPelanggan.Text = "Refresh";
            this.btnRefreshDataPelanggan.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
            this.btnRefreshDataPelanggan.UseAccentColor = false;
            this.btnRefreshDataPelanggan.UseVisualStyleBackColor = false;
            this.btnRefreshDataPelanggan.Click += new System.EventHandler(this.btnRefreshDataPelanggan_Click);
            // 
            // btnShowCachePelanggan
            // 
            this.btnShowCachePelanggan.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnShowCachePelanggan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnShowCachePelanggan.Density = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonDensity.Default;
            this.btnShowCachePelanggan.Depth = 0;
            this.btnShowCachePelanggan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.btnShowCachePelanggan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnShowCachePelanggan.HighEmphasis = true;
            this.btnShowCachePelanggan.Icon = null;
            this.btnShowCachePelanggan.Location = new System.Drawing.Point(108, 405);
            this.btnShowCachePelanggan.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnShowCachePelanggan.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnShowCachePelanggan.Name = "btnShowCachePelanggan";
            this.btnShowCachePelanggan.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnShowCachePelanggan.Size = new System.Drawing.Size(69, 36);
            this.btnShowCachePelanggan.TabIndex = 9;
            this.btnShowCachePelanggan.Text = "Cache";
            this.btnShowCachePelanggan.Type = ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton.MaterialButtonType.Contained;
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
            this.inputSearchPelanggan.Size = new System.Drawing.Size(374, 32);
            this.inputSearchPelanggan.TabIndex = 1;
            this.inputSearchPelanggan.Texts = "";
            this.inputSearchPelanggan.UnderlinedStyle = false;
            // 
            // FormUP
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.inputSearchPelanggan);
            this.Controls.Add(this.btnShowCachePelanggan);
            this.Controls.Add(this.btnRefreshDataPelanggan);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnUpdate);
            this.Controls.Add(this.inputIdPelanggan);
            this.Controls.Add(this.inputNamaPelanggan);
            this.Controls.Add(this.inputNoHP);
            this.Controls.Add(this.inputAlamat);
            this.Controls.Add(this.labelIdPelanggan);
            this.Controls.Add(this.labelNamaPelanggan);
            this.Controls.Add(this.labelNoHP);
            this.Controls.Add(this.labelAlamat);
            this.Controls.Add(this.dgvPelanggan);
            this.Name = "FormUP";
            this.Opacity = 1D;
            this.Text = "Update Pelanggan";
            this.Load += new System.EventHandler(this.FormUP_Load);
            this.Controls.SetChildIndex(this.dgvPelanggan, 0);
            this.Controls.SetChildIndex(this.labelAlamat, 0);
            this.Controls.SetChildIndex(this.labelNoHP, 0);
            this.Controls.SetChildIndex(this.labelNamaPelanggan, 0);
            this.Controls.SetChildIndex(this.labelIdPelanggan, 0);
            this.Controls.SetChildIndex(this.inputAlamat, 0);
            this.Controls.SetChildIndex(this.inputNoHP, 0);
            this.Controls.SetChildIndex(this.inputNamaPelanggan, 0);
            this.Controls.SetChildIndex(this.inputIdPelanggan, 0);
            this.Controls.SetChildIndex(this.btnUpdate, 0);
            this.Controls.SetChildIndex(this.btnKembali, 0);
            this.Controls.SetChildIndex(this.btnRefreshDataPelanggan, 0);
            this.Controls.SetChildIndex(this.btnShowCachePelanggan, 0);
            this.Controls.SetChildIndex(this.inputSearchPelanggan, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            ((System.ComponentModel.ISupportInitialize)(this.dgvPelanggan)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.DataGridView dgvPelanggan;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnKembali;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnUpdate;
        private ManajemenLaundrySepatu.MyTextBox inputIdPelanggan;
        private ManajemenLaundrySepatu.MyTextBox inputNamaPelanggan;
        private ManajemenLaundrySepatu.MyTextBox inputNoHP;
        private ManajemenLaundrySepatu.MyTextBox inputAlamat;
        private MaterialSkin.Controls.MaterialLabel labelIdPelanggan;
        private MaterialSkin.Controls.MaterialLabel labelNamaPelanggan;
        private MaterialSkin.Controls.MaterialLabel labelNoHP;
        private MaterialSkin.Controls.MaterialLabel labelAlamat;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnRefreshDataPelanggan;
        private ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton btnShowCachePelanggan;
        private ManajemenLaundrySepatu.MyTextBox inputSearchPelanggan;
    }
}