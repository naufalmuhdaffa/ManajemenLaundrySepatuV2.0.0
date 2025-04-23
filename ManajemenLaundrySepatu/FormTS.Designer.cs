namespace ManajemenLaundrySepatu
{
    partial class FormTS
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
            this.btnTambahkanS = new System.Windows.Forms.Button();
            this.labelTS = new System.Windows.Forms.Label();
            this.inputMerek = new System.Windows.Forms.TextBox();
            this.inputJenis = new System.Windows.Forms.TextBox();
            this.inputWarna = new System.Windows.Forms.TextBox();
            this.labelIdPelanggan = new System.Windows.Forms.Label();
            this.labelMerek = new System.Windows.Forms.Label();
            this.labelJenis = new System.Windows.Forms.Label();
            this.labelWarna = new System.Windows.Forms.Label();
            this.inputUkuran = new System.Windows.Forms.TextBox();
            this.labelUkuran = new System.Windows.Forms.Label();
            this.inputIdPelanggan = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // btnKembali
            // 
            this.btnKembali.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKembali.Location = new System.Drawing.Point(421, 340);
            this.btnKembali.Name = "btnKembali";
            this.btnKembali.Size = new System.Drawing.Size(255, 43);
            this.btnKembali.TabIndex = 24;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.UseVisualStyleBackColor = true;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnTambahkanS
            // 
            this.btnTambahkanS.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTambahkanS.Location = new System.Drawing.Point(127, 340);
            this.btnTambahkanS.Name = "btnTambahkanS";
            this.btnTambahkanS.Size = new System.Drawing.Size(255, 43);
            this.btnTambahkanS.TabIndex = 23;
            this.btnTambahkanS.Text = "Tambahkan";
            this.btnTambahkanS.UseVisualStyleBackColor = true;
            this.btnTambahkanS.Click += new System.EventHandler(this.btnTambahkanP_Click);
            // 
            // labelTS
            // 
            this.labelTS.AutoSize = true;
            this.labelTS.Location = new System.Drawing.Point(307, 64);
            this.labelTS.Name = "labelTS";
            this.labelTS.Size = new System.Drawing.Size(185, 20);
            this.labelTS.TabIndex = 22;
            this.labelTS.Text = "=== Tambah Sepatu ===";
            // 
            // inputMerek
            // 
            this.inputMerek.Location = new System.Drawing.Point(276, 163);
            this.inputMerek.Name = "inputMerek";
            this.inputMerek.Size = new System.Drawing.Size(400, 26);
            this.inputMerek.TabIndex = 20;
            // 
            // inputJenis
            // 
            this.inputJenis.Location = new System.Drawing.Point(276, 199);
            this.inputJenis.Name = "inputJenis";
            this.inputJenis.Size = new System.Drawing.Size(400, 26);
            this.inputJenis.TabIndex = 19;
            // 
            // inputWarna
            // 
            this.inputWarna.Location = new System.Drawing.Point(276, 238);
            this.inputWarna.Name = "inputWarna";
            this.inputWarna.Size = new System.Drawing.Size(400, 26);
            this.inputWarna.TabIndex = 18;
            // 
            // labelIdPelanggan
            // 
            this.labelIdPelanggan.AutoSize = true;
            this.labelIdPelanggan.Location = new System.Drawing.Point(123, 120);
            this.labelIdPelanggan.Name = "labelIdPelanggan";
            this.labelIdPelanggan.Size = new System.Drawing.Size(116, 20);
            this.labelIdPelanggan.TabIndex = 17;
            this.labelIdPelanggan.Text = "ID Pelanggan *";
            // 
            // labelMerek
            // 
            this.labelMerek.AutoSize = true;
            this.labelMerek.Location = new System.Drawing.Point(123, 163);
            this.labelMerek.Name = "labelMerek";
            this.labelMerek.Size = new System.Drawing.Size(53, 20);
            this.labelMerek.TabIndex = 16;
            this.labelMerek.Text = "Merek";
            // 
            // labelJenis
            // 
            this.labelJenis.AutoSize = true;
            this.labelJenis.Location = new System.Drawing.Point(123, 199);
            this.labelJenis.Name = "labelJenis";
            this.labelJenis.Size = new System.Drawing.Size(46, 20);
            this.labelJenis.TabIndex = 15;
            this.labelJenis.Text = "Jenis";
            // 
            // labelWarna
            // 
            this.labelWarna.AutoSize = true;
            this.labelWarna.Location = new System.Drawing.Point(123, 238);
            this.labelWarna.Name = "labelWarna";
            this.labelWarna.Size = new System.Drawing.Size(56, 20);
            this.labelWarna.TabIndex = 14;
            this.labelWarna.Text = "Warna";
            // 
            // inputUkuran
            // 
            this.inputUkuran.Location = new System.Drawing.Point(276, 282);
            this.inputUkuran.Name = "inputUkuran";
            this.inputUkuran.Size = new System.Drawing.Size(400, 26);
            this.inputUkuran.TabIndex = 26;
            // 
            // labelUkuran
            // 
            this.labelUkuran.AutoSize = true;
            this.labelUkuran.Location = new System.Drawing.Point(123, 282);
            this.labelUkuran.Name = "labelUkuran";
            this.labelUkuran.Size = new System.Drawing.Size(61, 20);
            this.labelUkuran.TabIndex = 25;
            this.labelUkuran.Text = "Ukuran";
            // 
            // inputIdPelanggan
            // 
            this.inputIdPelanggan.FormattingEnabled = true;
            this.inputIdPelanggan.Location = new System.Drawing.Point(276, 117);
            this.inputIdPelanggan.Name = "inputIdPelanggan";
            this.inputIdPelanggan.Size = new System.Drawing.Size(400, 28);
            this.inputIdPelanggan.TabIndex = 27;
            // 
            // FormTS
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.inputIdPelanggan);
            this.Controls.Add(this.inputUkuran);
            this.Controls.Add(this.labelUkuran);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTambahkanS);
            this.Controls.Add(this.labelTS);
            this.Controls.Add(this.inputMerek);
            this.Controls.Add(this.inputJenis);
            this.Controls.Add(this.inputWarna);
            this.Controls.Add(this.labelIdPelanggan);
            this.Controls.Add(this.labelMerek);
            this.Controls.Add(this.labelJenis);
            this.Controls.Add(this.labelWarna);
            this.Name = "FormTS";
            this.Text = "Tambah Sepatu";
            this.Load += new System.EventHandler(this.FormTS_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnKembali;
        private System.Windows.Forms.Button btnTambahkanS;
        private System.Windows.Forms.Label labelTS;
        private System.Windows.Forms.TextBox inputMerek;
        private System.Windows.Forms.TextBox inputJenis;
        private System.Windows.Forms.TextBox inputWarna;
        private System.Windows.Forms.Label labelIdPelanggan;
        private System.Windows.Forms.Label labelMerek;
        private System.Windows.Forms.Label labelJenis;
        private System.Windows.Forms.Label labelWarna;
        private System.Windows.Forms.TextBox inputUkuran;
        private System.Windows.Forms.Label labelUkuran;
        private System.Windows.Forms.ComboBox inputIdPelanggan;
    }
}