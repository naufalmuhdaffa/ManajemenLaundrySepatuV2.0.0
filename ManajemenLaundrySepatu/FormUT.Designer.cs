namespace ManajemenLaundrySepatu
{
    partial class FormUT
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
            this.inputIdTransaksi = new System.Windows.Forms.TextBox();
            this.labelIdTransaksi = new System.Windows.Forms.Label();
            this.btnKembali = new System.Windows.Forms.Button();
            this.btnUpdate = new System.Windows.Forms.Button();
            this.inputIdPelanggan = new System.Windows.Forms.TextBox();
            this.inputIdSepatu = new System.Windows.Forms.TextBox();
            this.inputTotalHarga = new System.Windows.Forms.TextBox();
            this.labelIdPelanggan = new System.Windows.Forms.Label();
            this.labelIdSepatu = new System.Windows.Forms.Label();
            this.labelTotalHarga = new System.Windows.Forms.Label();
            this.labelStatus = new System.Windows.Forms.Label();
            this.labelUT = new System.Windows.Forms.Label();
            this.dgvTransaksi = new System.Windows.Forms.DataGridView();
            this.comboStatus = new System.Windows.Forms.ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTransaksi)).BeginInit();
            this.SuspendLayout();
            // 
            // inputIdTransaksi
            // 
            this.inputIdTransaksi.Location = new System.Drawing.Point(386, 112);
            this.inputIdTransaksi.Name = "inputIdTransaksi";
            this.inputIdTransaksi.Size = new System.Drawing.Size(400, 26);
            this.inputIdTransaksi.TabIndex = 62;
            // 
            // labelIdTransaksi
            // 
            this.labelIdTransaksi.AutoSize = true;
            this.labelIdTransaksi.Location = new System.Drawing.Point(386, 89);
            this.labelIdTransaksi.Name = "labelIdTransaksi";
            this.labelIdTransaksi.Size = new System.Drawing.Size(108, 20);
            this.labelIdTransaksi.TabIndex = 61;
            this.labelIdTransaksi.Text = "ID Transaksi *";
            // 
            // btnKembali
            // 
            this.btnKembali.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKembali.Location = new System.Drawing.Point(417, 377);
            this.btnKembali.Name = "btnKembali";
            this.btnKembali.Size = new System.Drawing.Size(255, 43);
            this.btnKembali.TabIndex = 60;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.UseVisualStyleBackColor = true;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnUpdate
            // 
            this.btnUpdate.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnUpdate.Location = new System.Drawing.Point(76, 377);
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(255, 43);
            this.btnUpdate.TabIndex = 59;
            this.btnUpdate.Text = "Update";
            this.btnUpdate.UseVisualStyleBackColor = true;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // inputIdPelanggan
            // 
            this.inputIdPelanggan.Location = new System.Drawing.Point(386, 164);
            this.inputIdPelanggan.Name = "inputIdPelanggan";
            this.inputIdPelanggan.Size = new System.Drawing.Size(400, 26);
            this.inputIdPelanggan.TabIndex = 58;
            // 
            // inputIdSepatu
            // 
            this.inputIdSepatu.Location = new System.Drawing.Point(386, 216);
            this.inputIdSepatu.Name = "inputIdSepatu";
            this.inputIdSepatu.Size = new System.Drawing.Size(400, 26);
            this.inputIdSepatu.TabIndex = 57;
            // 
            // inputTotalHarga
            // 
            this.inputTotalHarga.Location = new System.Drawing.Point(386, 268);
            this.inputTotalHarga.Name = "inputTotalHarga";
            this.inputTotalHarga.Size = new System.Drawing.Size(400, 26);
            this.inputTotalHarga.TabIndex = 56;
            // 
            // labelIdPelanggan
            // 
            this.labelIdPelanggan.AutoSize = true;
            this.labelIdPelanggan.Location = new System.Drawing.Point(386, 141);
            this.labelIdPelanggan.Name = "labelIdPelanggan";
            this.labelIdPelanggan.Size = new System.Drawing.Size(116, 20);
            this.labelIdPelanggan.TabIndex = 54;
            this.labelIdPelanggan.Text = "ID Pelanggan *";
            // 
            // labelIdSepatu
            // 
            this.labelIdSepatu.AutoSize = true;
            this.labelIdSepatu.Location = new System.Drawing.Point(386, 193);
            this.labelIdSepatu.Name = "labelIdSepatu";
            this.labelIdSepatu.Size = new System.Drawing.Size(92, 20);
            this.labelIdSepatu.TabIndex = 53;
            this.labelIdSepatu.Text = "ID Sepatu *";
            // 
            // labelTotalHarga
            // 
            this.labelTotalHarga.AutoSize = true;
            this.labelTotalHarga.Location = new System.Drawing.Point(386, 245);
            this.labelTotalHarga.Name = "labelTotalHarga";
            this.labelTotalHarga.Size = new System.Drawing.Size(102, 20);
            this.labelTotalHarga.TabIndex = 52;
            this.labelTotalHarga.Text = "Total Harga *";
            // 
            // labelStatus
            // 
            this.labelStatus.AutoSize = true;
            this.labelStatus.Location = new System.Drawing.Point(386, 297);
            this.labelStatus.Name = "labelStatus";
            this.labelStatus.Size = new System.Drawing.Size(56, 20);
            this.labelStatus.TabIndex = 51;
            this.labelStatus.Text = "Status";
            // 
            // labelUT
            // 
            this.labelUT.AutoSize = true;
            this.labelUT.Location = new System.Drawing.Point(304, 30);
            this.labelUT.Name = "labelUT";
            this.labelUT.Size = new System.Drawing.Size(196, 20);
            this.labelUT.TabIndex = 50;
            this.labelUT.Text = "=== Update Transaksi ===";
            // 
            // dgvTransaksi
            // 
            this.dgvTransaksi.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvTransaksi.Location = new System.Drawing.Point(15, 78);
            this.dgvTransaksi.Name = "dgvTransaksi";
            this.dgvTransaksi.RowHeadersWidth = 62;
            this.dgvTransaksi.RowTemplate.Height = 28;
            this.dgvTransaksi.Size = new System.Drawing.Size(365, 282);
            this.dgvTransaksi.TabIndex = 49;
            this.dgvTransaksi.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvTransaksi_CellClick);
            // 
            // comboStatus
            // 
            this.comboStatus.FormattingEnabled = true;
            this.comboStatus.Location = new System.Drawing.Point(386, 320);
            this.comboStatus.Name = "comboStatus";
            this.comboStatus.Size = new System.Drawing.Size(400, 28);
            this.comboStatus.TabIndex = 63;
            // 
            // FormUT
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.comboStatus);
            this.Controls.Add(this.inputIdTransaksi);
            this.Controls.Add(this.labelIdTransaksi);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnUpdate);
            this.Controls.Add(this.inputIdPelanggan);
            this.Controls.Add(this.inputIdSepatu);
            this.Controls.Add(this.inputTotalHarga);
            this.Controls.Add(this.labelIdPelanggan);
            this.Controls.Add(this.labelIdSepatu);
            this.Controls.Add(this.labelTotalHarga);
            this.Controls.Add(this.labelStatus);
            this.Controls.Add(this.labelUT);
            this.Controls.Add(this.dgvTransaksi);
            this.Name = "FormUT";
            this.Text = "Update Transaksi";
            this.Load += new System.EventHandler(this.FormUT_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvTransaksi)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.TextBox inputIdTransaksi;
        private System.Windows.Forms.Label labelIdTransaksi;
        private System.Windows.Forms.Button btnKembali;
        private System.Windows.Forms.Button btnUpdate;
        private System.Windows.Forms.TextBox inputIdPelanggan;
        private System.Windows.Forms.TextBox inputIdSepatu;
        private System.Windows.Forms.TextBox inputTotalHarga;
        private System.Windows.Forms.Label labelIdPelanggan;
        private System.Windows.Forms.Label labelIdSepatu;
        private System.Windows.Forms.Label labelTotalHarga;
        private System.Windows.Forms.Label labelStatus;
        private System.Windows.Forms.Label labelUT;
        private System.Windows.Forms.DataGridView dgvTransaksi;
        private System.Windows.Forms.ComboBox comboStatus;
    }
}