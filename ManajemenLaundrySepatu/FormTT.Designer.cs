namespace ManajemenLaundrySepatu
{
    partial class FormTT
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
            this.btnKembali = new System.Windows.Forms.Button();
            this.btnTambahkanP = new System.Windows.Forms.Button();
            this.labelTT = new System.Windows.Forms.Label();
            this.inputTotalHarga = new System.Windows.Forms.TextBox();
            this.labelIdPelanggan = new System.Windows.Forms.Label();
            this.labelIdSepatu = new System.Windows.Forms.Label();
            this.labelTotalHarga = new System.Windows.Forms.Label();
            this.labelStatus = new System.Windows.Forms.Label();
            this.comboStatus = new System.Windows.Forms.ComboBox();
            this.inputIdPelanggan = new System.Windows.Forms.ComboBox();
            this.inputIdSepatu = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // btnKembali
            // 
            this.btnKembali.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKembali.Location = new System.Drawing.Point(428, 333);
            this.btnKembali.Name = "btnKembali";
            this.btnKembali.Size = new System.Drawing.Size(255, 43);
            this.btnKembali.TabIndex = 24;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.UseVisualStyleBackColor = true;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnTambahkanP
            // 
            this.btnTambahkanP.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTambahkanP.Location = new System.Drawing.Point(128, 333);
            this.btnTambahkanP.Name = "btnTambahkanP";
            this.btnTambahkanP.Size = new System.Drawing.Size(255, 43);
            this.btnTambahkanP.TabIndex = 23;
            this.btnTambahkanP.Text = "Tambahkan";
            this.btnTambahkanP.UseVisualStyleBackColor = true;
            this.btnTambahkanP.Click += new System.EventHandler(this.btnTambahkanT_Click);
            // 
            // labelTT
            // 
            this.labelTT.AutoSize = true;
            this.labelTT.Location = new System.Drawing.Point(312, 53);
            this.labelTT.Name = "labelTT";
            this.labelTT.Size = new System.Drawing.Size(201, 20);
            this.labelTT.TabIndex = 22;
            this.labelTT.Text = "=== Tambah Transaksi ===";
            // 
            // inputTotalHarga
            // 
            this.inputTotalHarga.Location = new System.Drawing.Point(283, 221);
            this.inputTotalHarga.Name = "inputTotalHarga";
            this.inputTotalHarga.Size = new System.Drawing.Size(400, 26);
            this.inputTotalHarga.TabIndex = 19;
            // 
            // labelIdPelanggan
            // 
            this.labelIdPelanggan.AutoSize = true;
            this.labelIdPelanggan.Location = new System.Drawing.Point(124, 139);
            this.labelIdPelanggan.Name = "labelIdPelanggan";
            this.labelIdPelanggan.Size = new System.Drawing.Size(116, 20);
            this.labelIdPelanggan.TabIndex = 17;
            this.labelIdPelanggan.Text = "ID Pelanggan *";
            // 
            // labelIdSepatu
            // 
            this.labelIdSepatu.AutoSize = true;
            this.labelIdSepatu.Location = new System.Drawing.Point(124, 182);
            this.labelIdSepatu.Name = "labelIdSepatu";
            this.labelIdSepatu.Size = new System.Drawing.Size(92, 20);
            this.labelIdSepatu.TabIndex = 16;
            this.labelIdSepatu.Text = "ID Sepatu *";
            // 
            // labelTotalHarga
            // 
            this.labelTotalHarga.AutoSize = true;
            this.labelTotalHarga.Location = new System.Drawing.Point(124, 221);
            this.labelTotalHarga.Name = "labelTotalHarga";
            this.labelTotalHarga.Size = new System.Drawing.Size(102, 20);
            this.labelTotalHarga.TabIndex = 15;
            this.labelTotalHarga.Text = "Total Harga *";
            // 
            // labelStatus
            // 
            this.labelStatus.AutoSize = true;
            this.labelStatus.Location = new System.Drawing.Point(124, 263);
            this.labelStatus.Name = "labelStatus";
            this.labelStatus.Size = new System.Drawing.Size(56, 20);
            this.labelStatus.TabIndex = 14;
            this.labelStatus.Text = "Status";
            // 
            // comboStatus
            // 
            this.comboStatus.FormattingEnabled = true;
            this.comboStatus.Location = new System.Drawing.Point(283, 260);
            this.comboStatus.Name = "comboStatus";
            this.comboStatus.Size = new System.Drawing.Size(400, 28);
            this.comboStatus.TabIndex = 25;
            // 
            // inputIdPelanggan
            // 
            this.inputIdPelanggan.FormattingEnabled = true;
            this.inputIdPelanggan.Location = new System.Drawing.Point(283, 136);
            this.inputIdPelanggan.Name = "inputIdPelanggan";
            this.inputIdPelanggan.Size = new System.Drawing.Size(400, 28);
            this.inputIdPelanggan.TabIndex = 26;
            // 
            // inputIdSepatu
            // 
            this.inputIdSepatu.FormattingEnabled = true;
            this.inputIdSepatu.Location = new System.Drawing.Point(283, 179);
            this.inputIdSepatu.Name = "inputIdSepatu";
            this.inputIdSepatu.Size = new System.Drawing.Size(400, 28);
            this.inputIdSepatu.TabIndex = 27;
            // 
            // FormTT
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.inputIdSepatu);
            this.Controls.Add(this.inputIdPelanggan);
            this.Controls.Add(this.comboStatus);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTambahkanP);
            this.Controls.Add(this.labelTT);
            this.Controls.Add(this.inputTotalHarga);
            this.Controls.Add(this.labelIdPelanggan);
            this.Controls.Add(this.labelIdSepatu);
            this.Controls.Add(this.labelTotalHarga);
            this.Controls.Add(this.labelStatus);
            this.Name = "FormTT";
            this.Text = "Tambah Transaksi";
            this.Load += new System.EventHandler(this.FormTT_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnKembali;
        private System.Windows.Forms.Button btnTambahkanP;
        private System.Windows.Forms.Label labelTT;
        private System.Windows.Forms.TextBox inputTotalHarga;
        private System.Windows.Forms.Label labelIdPelanggan;
        private System.Windows.Forms.Label labelIdSepatu;
        private System.Windows.Forms.Label labelTotalHarga;
        private System.Windows.Forms.Label labelStatus;
        private System.Windows.Forms.ComboBox comboStatus;
        private System.Windows.Forms.ComboBox inputIdPelanggan;
        private System.Windows.Forms.ComboBox inputIdSepatu;
    }
}