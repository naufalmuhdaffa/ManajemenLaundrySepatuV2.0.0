namespace ManajemenLaundrySepatu.WinForms.Forms.Global
{
    partial class Auth
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.cmbServer = new ManajemenLaundrySepatu.MyComboBox();
            this.cmbDatabase = new ManajemenLaundrySepatu.MyComboBox();
            this.btnScan = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.btnConnect = new ManajemenLaundrySepatu.WinForms.Helpers.MyMaterialButton();
            this.labelServer = new MaterialSkin.Controls.MaterialLabel();
            this.labelDatabase = new MaterialSkin.Controls.MaterialLabel();
            this.progressBarScan = new System.Windows.Forms.ProgressBar();
            this.txtServerManual = new ManajemenLaundrySepatu.MyTextBox();
            this.materialLabel1 = new MaterialSkin.Controls.MaterialLabel();
            this.labelServerManual = new MaterialSkin.Controls.MaterialLabel();
            this.labelDatabaseManual = new MaterialSkin.Controls.MaterialLabel();
            this.txtDatabaseManual = new ManajemenLaundrySepatu.MyTextBox();
            this.materialLabel2 = new MaterialSkin.Controls.MaterialLabel();
            this.SuspendLayout();
            // 
            // themeSwitch
            // 
            this.themeSwitch.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.776372F);
            this.themeSwitch.Location = new System.Drawing.Point(632, 25);
            this.themeSwitch.Size = new System.Drawing.Size(167, 38);
            // 
            // cmbServer
            // 
            this.cmbServer.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.cmbServer.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.cmbServer.BorderSize = 1;
            this.cmbServer.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDown;
            this.cmbServer.DroppedDown = false;
            this.cmbServer.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.cmbServer.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.cmbServer.IconColor = System.Drawing.Color.MediumSlateBlue;
            this.cmbServer.ListBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(230)))), ((int)(((byte)(228)))), ((int)(((byte)(245)))));
            this.cmbServer.ListTextColor = System.Drawing.Color.DimGray;
            this.cmbServer.Location = new System.Drawing.Point(267, 113);
            this.cmbServer.MinimumSize = new System.Drawing.Size(200, 30);
            this.cmbServer.Name = "cmbServer";
            this.cmbServer.Padding = new System.Windows.Forms.Padding(1);
            this.cmbServer.Size = new System.Drawing.Size(476, 35);
            this.cmbServer.TabIndex = 0;
            this.cmbServer.Texts = "";
            this.cmbServer.OnSelectedIndexChanged += new System.EventHandler(this.cmbServer_SelectedIndexChanged);
            // 
            // cmbDatabase
            // 
            this.cmbDatabase.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.cmbDatabase.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.cmbDatabase.BorderSize = 1;
            this.cmbDatabase.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDown;
            this.cmbDatabase.DroppedDown = false;
            this.cmbDatabase.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.cmbDatabase.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.cmbDatabase.IconColor = System.Drawing.Color.MediumSlateBlue;
            this.cmbDatabase.ListBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(230)))), ((int)(((byte)(228)))), ((int)(((byte)(245)))));
            this.cmbDatabase.ListTextColor = System.Drawing.Color.DimGray;
            this.cmbDatabase.Location = new System.Drawing.Point(267, 174);
            this.cmbDatabase.MinimumSize = new System.Drawing.Size(200, 30);
            this.cmbDatabase.Name = "cmbDatabase";
            this.cmbDatabase.Padding = new System.Windows.Forms.Padding(1);
            this.cmbDatabase.Size = new System.Drawing.Size(476, 35);
            this.cmbDatabase.TabIndex = 1;
            this.cmbDatabase.Texts = "";
            // 
            // btnScan
            // 
            this.btnScan.AutoSize = false;
            this.btnScan.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnScan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnScan.BorderColor = System.Drawing.Color.Gray;
            this.btnScan.BorderSize = 2;
            this.btnScan.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnScan.Depth = 0;
            this.btnScan.FlatAppearance.BorderSize = 0;
            this.btnScan.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnScan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnScan.HighEmphasis = true;
            this.btnScan.Icon = null;
            this.btnScan.IsDarkTheme = false;
            this.btnScan.Location = new System.Drawing.Point(379, 228);
            this.btnScan.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnScan.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnScan.Name = "btnScan";
            this.btnScan.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnScan.Size = new System.Drawing.Size(116, 36);
            this.btnScan.TabIndex = 2;
            this.btnScan.Text = "Scan SQL Auth";
            this.btnScan.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnScan.UseAccentColor = false;
            this.btnScan.UseVisualStyleBackColor = false;
            this.btnScan.Click += new System.EventHandler(this.btnScan_Click);
            // 
            // btnConnect
            // 
            this.btnConnect.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnConnect.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.btnConnect.BorderColor = System.Drawing.Color.Gray;
            this.btnConnect.BorderSize = 2;
            this.btnConnect.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.btnConnect.Depth = 0;
            this.btnConnect.FlatAppearance.BorderSize = 0;
            this.btnConnect.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnConnect.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnConnect.HighEmphasis = true;
            this.btnConnect.Icon = null;
            this.btnConnect.IsDarkTheme = false;
            this.btnConnect.Location = new System.Drawing.Point(267, 228);
            this.btnConnect.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnConnect.MouseState = MaterialSkin.MouseState.HOVER;
            this.btnConnect.Name = "btnConnect";
            this.btnConnect.NoAccentTextColor = System.Drawing.Color.Empty;
            this.btnConnect.Size = new System.Drawing.Size(89, 36);
            this.btnConnect.TabIndex = 3;
            this.btnConnect.Text = "Connect";
            this.btnConnect.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.btnConnect.UseAccentColor = false;
            this.btnConnect.UseVisualStyleBackColor = false;
            this.btnConnect.Click += new System.EventHandler(this.btnConnect_Click);
            // 
            // labelServer
            // 
            this.labelServer.AutoSize = true;
            this.labelServer.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelServer.Depth = 0;
            this.labelServer.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelServer.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelServer.Location = new System.Drawing.Point(107, 113);
            this.labelServer.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelServer.Name = "labelServer";
            this.labelServer.Size = new System.Drawing.Size(45, 19);
            this.labelServer.TabIndex = 11;
            this.labelServer.Text = "Server";
            // 
            // labelDatabase
            // 
            this.labelDatabase.AutoSize = true;
            this.labelDatabase.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelDatabase.Depth = 0;
            this.labelDatabase.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelDatabase.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelDatabase.Location = new System.Drawing.Point(107, 174);
            this.labelDatabase.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelDatabase.Name = "labelDatabase";
            this.labelDatabase.Size = new System.Drawing.Size(69, 19);
            this.labelDatabase.TabIndex = 12;
            this.labelDatabase.Text = "Database";
            // 
            // progressBarScan
            // 
            this.progressBarScan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.progressBarScan.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.progressBarScan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.progressBarScan.Location = new System.Drawing.Point(517, 228);
            this.progressBarScan.Name = "progressBarScan";
            this.progressBarScan.Size = new System.Drawing.Size(226, 36);
            this.progressBarScan.TabIndex = 13;
            // 
            // txtServerManual
            // 
            this.txtServerManual.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.txtServerManual.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.txtServerManual.BorderFocusColor = System.Drawing.Color.HotPink;
            this.txtServerManual.BorderRadius = 0;
            this.txtServerManual.BorderSize = 2;
            this.txtServerManual.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.txtServerManual.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.txtServerManual.Location = new System.Drawing.Point(267, 318);
            this.txtServerManual.Margin = new System.Windows.Forms.Padding(4);
            this.txtServerManual.Multiline = false;
            this.txtServerManual.Name = "txtServerManual";
            this.txtServerManual.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.txtServerManual.PasswordChar = false;
            this.txtServerManual.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.txtServerManual.PlaceholderText = "contoh: localhost\\\\SQLEXPRESS";
            this.txtServerManual.ReadOnly = false;
            this.txtServerManual.Size = new System.Drawing.Size(476, 33);
            this.txtServerManual.TabIndex = 14;
            this.txtServerManual.Texts = "";
            this.txtServerManual.UnderlinedStyle = false;
            // 
            // materialLabel1
            // 
            this.materialLabel1.AutoSize = true;
            this.materialLabel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.materialLabel1.Depth = 0;
            this.materialLabel1.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.materialLabel1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.materialLabel1.Location = new System.Drawing.Point(264, 281);
            this.materialLabel1.MouseState = MaterialSkin.MouseState.HOVER;
            this.materialLabel1.Name = "materialLabel1";
            this.materialLabel1.Size = new System.Drawing.Size(273, 19);
            this.materialLabel1.TabIndex = 15;
            this.materialLabel1.Text = "Scan Bermasalah? Ketik manual disini";
            // 
            // labelServerManual
            // 
            this.labelServerManual.AutoSize = true;
            this.labelServerManual.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelServerManual.Depth = 0;
            this.labelServerManual.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelServerManual.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelServerManual.Location = new System.Drawing.Point(107, 332);
            this.labelServerManual.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelServerManual.Name = "labelServerManual";
            this.labelServerManual.Size = new System.Drawing.Size(45, 19);
            this.labelServerManual.TabIndex = 16;
            this.labelServerManual.Text = "Server";
            // 
            // labelDatabaseManual
            // 
            this.labelDatabaseManual.AutoSize = true;
            this.labelDatabaseManual.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.labelDatabaseManual.Depth = 0;
            this.labelDatabaseManual.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.labelDatabaseManual.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelDatabaseManual.Location = new System.Drawing.Point(107, 390);
            this.labelDatabaseManual.MouseState = MaterialSkin.MouseState.HOVER;
            this.labelDatabaseManual.Name = "labelDatabaseManual";
            this.labelDatabaseManual.Size = new System.Drawing.Size(69, 19);
            this.labelDatabaseManual.TabIndex = 17;
            this.labelDatabaseManual.Text = "Database";
            // 
            // txtDatabaseManual
            // 
            this.txtDatabaseManual.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.txtDatabaseManual.BorderColor = System.Drawing.Color.MediumSlateBlue;
            this.txtDatabaseManual.BorderFocusColor = System.Drawing.Color.HotPink;
            this.txtDatabaseManual.BorderRadius = 0;
            this.txtDatabaseManual.BorderSize = 2;
            this.txtDatabaseManual.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.txtDatabaseManual.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.txtDatabaseManual.Location = new System.Drawing.Point(267, 390);
            this.txtDatabaseManual.Margin = new System.Windows.Forms.Padding(4);
            this.txtDatabaseManual.Multiline = false;
            this.txtDatabaseManual.Name = "txtDatabaseManual";
            this.txtDatabaseManual.Padding = new System.Windows.Forms.Padding(10, 7, 10, 7);
            this.txtDatabaseManual.PasswordChar = false;
            this.txtDatabaseManual.PlaceholderColor = System.Drawing.Color.DarkGray;
            this.txtDatabaseManual.PlaceholderText = "contoh: manajemenLaundrySepatu";
            this.txtDatabaseManual.ReadOnly = false;
            this.txtDatabaseManual.Size = new System.Drawing.Size(476, 33);
            this.txtDatabaseManual.TabIndex = 18;
            this.txtDatabaseManual.Texts = "";
            this.txtDatabaseManual.UnderlinedStyle = false;
            // 
            // materialLabel2
            // 
            this.materialLabel2.AutoSize = true;
            this.materialLabel2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(242)))), ((int)(((byte)(242)))));
            this.materialLabel2.Depth = 0;
            this.materialLabel2.Font = new System.Drawing.Font("Roboto", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.materialLabel2.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.materialLabel2.Location = new System.Drawing.Point(200, 75);
            this.materialLabel2.MouseState = MaterialSkin.MouseState.HOVER;
            this.materialLabel2.Name = "materialLabel2";
            this.materialLabel2.Size = new System.Drawing.Size(543, 19);
            this.materialLabel2.TabIndex = 19;
            this.materialLabel2.Text = "Silakan lakukan Scan terlebih dahulu pada tombol \"Scan SQL Auth\" dibawah";
            // 
            // Auth
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.materialLabel2);
            this.Controls.Add(this.txtDatabaseManual);
            this.Controls.Add(this.labelDatabaseManual);
            this.Controls.Add(this.labelServerManual);
            this.Controls.Add(this.materialLabel1);
            this.Controls.Add(this.txtServerManual);
            this.Controls.Add(this.progressBarScan);
            this.Controls.Add(this.labelDatabase);
            this.Controls.Add(this.labelServer);
            this.Controls.Add(this.btnConnect);
            this.Controls.Add(this.btnScan);
            this.Controls.Add(this.cmbDatabase);
            this.Controls.Add(this.cmbServer);
            this.Name = "Auth";
            this.Opacity = 1D;
            this.Text = "Authentication Windows SQL Server";
            this.Controls.SetChildIndex(this.cmbServer, 0);
            this.Controls.SetChildIndex(this.cmbDatabase, 0);
            this.Controls.SetChildIndex(this.btnScan, 0);
            this.Controls.SetChildIndex(this.btnConnect, 0);
            this.Controls.SetChildIndex(this.labelServer, 0);
            this.Controls.SetChildIndex(this.labelDatabase, 0);
            this.Controls.SetChildIndex(this.progressBarScan, 0);
            this.Controls.SetChildIndex(this.txtServerManual, 0);
            this.Controls.SetChildIndex(this.themeSwitch, 0);
            this.Controls.SetChildIndex(this.materialLabel1, 0);
            this.Controls.SetChildIndex(this.labelServerManual, 0);
            this.Controls.SetChildIndex(this.labelDatabaseManual, 0);
            this.Controls.SetChildIndex(this.txtDatabaseManual, 0);
            this.Controls.SetChildIndex(this.materialLabel2, 0);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private MyComboBox cmbServer;
        private MyComboBox cmbDatabase;
        private Helpers.MyMaterialButton btnScan;
        private Helpers.MyMaterialButton btnConnect;
        private MaterialSkin.Controls.MaterialLabel labelServer;
        private MaterialSkin.Controls.MaterialLabel labelDatabase;
        private System.Windows.Forms.ProgressBar progressBarScan;
        private MyTextBox txtServerManual;
        private MaterialSkin.Controls.MaterialLabel materialLabel1;
        private MaterialSkin.Controls.MaterialLabel labelServerManual;
        private MaterialSkin.Controls.MaterialLabel labelDatabaseManual;
        private MyTextBox txtDatabaseManual;
        private MaterialSkin.Controls.MaterialLabel materialLabel2;
    }
}