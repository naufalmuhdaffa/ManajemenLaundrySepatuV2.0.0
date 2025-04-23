namespace ManajemenLaundrySepatu
{
    partial class FormTP
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
            this.labelAlamat = new System.Windows.Forms.Label();
            this.labelNoHP = new System.Windows.Forms.Label();
            this.labelNamaPelanggan = new System.Windows.Forms.Label();
            this.labelIdPelanggan = new System.Windows.Forms.Label();
            this.inputAlamat = new System.Windows.Forms.TextBox();
            this.inputNoHP = new System.Windows.Forms.TextBox();
            this.inputNamaPelanggan = new System.Windows.Forms.TextBox();
            this.inputIdPelanggan = new System.Windows.Forms.TextBox();
            this.labelTP = new System.Windows.Forms.Label();
            this.btnTambahkanP = new System.Windows.Forms.Button();
            this.btnKembali = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // labelAlamat
            // 
            this.labelAlamat.AutoSize = true;
            this.labelAlamat.Location = new System.Drawing.Point(106, 263);
            this.labelAlamat.Name = "labelAlamat";
            this.labelAlamat.Size = new System.Drawing.Size(59, 20);
            this.labelAlamat.TabIndex = 3;
            this.labelAlamat.Text = "Alamat";
            // 
            // labelNoHP
            // 
            this.labelNoHP.AutoSize = true;
            this.labelNoHP.Location = new System.Drawing.Point(106, 221);
            this.labelNoHP.Name = "labelNoHP";
            this.labelNoHP.Size = new System.Drawing.Size(65, 20);
            this.labelNoHP.TabIndex = 4;
            this.labelNoHP.Text = "No HP *";
            // 
            // labelNamaPelanggan
            // 
            this.labelNamaPelanggan.AutoSize = true;
            this.labelNamaPelanggan.Location = new System.Drawing.Point(106, 182);
            this.labelNamaPelanggan.Name = "labelNamaPelanggan";
            this.labelNamaPelanggan.Size = new System.Drawing.Size(61, 20);
            this.labelNamaPelanggan.TabIndex = 5;
            this.labelNamaPelanggan.Text = "Nama *";
            // 
            // labelIdPelanggan
            // 
            this.labelIdPelanggan.AutoSize = true;
            this.labelIdPelanggan.Location = new System.Drawing.Point(106, 139);
            this.labelIdPelanggan.Name = "labelIdPelanggan";
            this.labelIdPelanggan.Size = new System.Drawing.Size(116, 20);
            this.labelIdPelanggan.TabIndex = 6;
            this.labelIdPelanggan.Text = "ID Pelanggan *";
            // 
            // inputAlamat
            // 
            this.inputAlamat.Location = new System.Drawing.Point(265, 263);
            this.inputAlamat.Name = "inputAlamat";
            this.inputAlamat.Size = new System.Drawing.Size(400, 26);
            this.inputAlamat.TabIndex = 7;
            // 
            // inputNoHP
            // 
            this.inputNoHP.Location = new System.Drawing.Point(265, 221);
            this.inputNoHP.Name = "inputNoHP";
            this.inputNoHP.Size = new System.Drawing.Size(400, 26);
            this.inputNoHP.TabIndex = 8;
            // 
            // inputNamaPelanggan
            // 
            this.inputNamaPelanggan.Location = new System.Drawing.Point(265, 182);
            this.inputNamaPelanggan.Name = "inputNamaPelanggan";
            this.inputNamaPelanggan.Size = new System.Drawing.Size(400, 26);
            this.inputNamaPelanggan.TabIndex = 9;
            // 
            // inputIdPelanggan
            // 
            this.inputIdPelanggan.Location = new System.Drawing.Point(265, 139);
            this.inputIdPelanggan.Name = "inputIdPelanggan";
            this.inputIdPelanggan.Size = new System.Drawing.Size(400, 26);
            this.inputIdPelanggan.TabIndex = 10;
            // 
            // labelTP
            // 
            this.labelTP.AutoSize = true;
            this.labelTP.Location = new System.Drawing.Point(294, 53);
            this.labelTP.Name = "labelTP";
            this.labelTP.Size = new System.Drawing.Size(209, 20);
            this.labelTP.TabIndex = 11;
            this.labelTP.Text = "=== Tambah Pelanggan ===";
            // 
            // btnTambahkanP
            // 
            this.btnTambahkanP.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTambahkanP.Location = new System.Drawing.Point(110, 333);
            this.btnTambahkanP.Name = "btnTambahkanP";
            this.btnTambahkanP.Size = new System.Drawing.Size(255, 43);
            this.btnTambahkanP.TabIndex = 12;
            this.btnTambahkanP.Text = "Tambahkan";
            this.btnTambahkanP.UseVisualStyleBackColor = true;
            this.btnTambahkanP.Click += new System.EventHandler(this.btnTambahkanP_Click);
            // 
            // btnKembali
            // 
            this.btnKembali.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKembali.Location = new System.Drawing.Point(410, 333);
            this.btnKembali.Name = "btnKembali";
            this.btnKembali.Size = new System.Drawing.Size(255, 43);
            this.btnKembali.TabIndex = 13;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.UseVisualStyleBackColor = true;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // FormTP
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTambahkanP);
            this.Controls.Add(this.labelTP);
            this.Controls.Add(this.inputIdPelanggan);
            this.Controls.Add(this.inputNamaPelanggan);
            this.Controls.Add(this.inputNoHP);
            this.Controls.Add(this.inputAlamat);
            this.Controls.Add(this.labelIdPelanggan);
            this.Controls.Add(this.labelNamaPelanggan);
            this.Controls.Add(this.labelNoHP);
            this.Controls.Add(this.labelAlamat);
            this.Name = "FormTP";
            this.Text = "Tambah Pelanggan";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label labelAlamat;
        private System.Windows.Forms.Label labelNoHP;
        private System.Windows.Forms.Label labelNamaPelanggan;
        private System.Windows.Forms.Label labelIdPelanggan;
        private System.Windows.Forms.TextBox inputAlamat;
        private System.Windows.Forms.TextBox inputNoHP;
        private System.Windows.Forms.TextBox inputNamaPelanggan;
        private System.Windows.Forms.TextBox inputIdPelanggan;
        private System.Windows.Forms.Label labelTP;
        private System.Windows.Forms.Button btnTambahkanP;
        private System.Windows.Forms.Button btnKembali;
    }
}