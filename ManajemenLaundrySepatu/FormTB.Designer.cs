namespace ManajemenLaundrySepatu
{
    partial class FormTB
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
            this.btnTambahkanB = new System.Windows.Forms.Button();
            this.labelTB = new System.Windows.Forms.Label();
            this.inputNamaBarang = new System.Windows.Forms.TextBox();
            this.inputJumlah = new System.Windows.Forms.TextBox();
            this.inputSatuan = new System.Windows.Forms.TextBox();
            this.labelNamaBarang = new System.Windows.Forms.Label();
            this.labelJumlah = new System.Windows.Forms.Label();
            this.labelSatuan = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnKembali
            // 
            this.btnKembali.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKembali.Location = new System.Drawing.Point(421, 334);
            this.btnKembali.Name = "btnKembali";
            this.btnKembali.Size = new System.Drawing.Size(255, 43);
            this.btnKembali.TabIndex = 24;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.UseVisualStyleBackColor = true;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnTambahkanB
            // 
            this.btnTambahkanB.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTambahkanB.Location = new System.Drawing.Point(121, 334);
            this.btnTambahkanB.Name = "btnTambahkanB";
            this.btnTambahkanB.Size = new System.Drawing.Size(255, 43);
            this.btnTambahkanB.TabIndex = 23;
            this.btnTambahkanB.Text = "Tambahkan";
            this.btnTambahkanB.UseVisualStyleBackColor = true;
            this.btnTambahkanB.Click += new System.EventHandler(this.btnTambahkanB_Click);
            // 
            // labelTB
            // 
            this.labelTB.AutoSize = true;
            this.labelTB.Location = new System.Drawing.Point(305, 54);
            this.labelTB.Name = "labelTB";
            this.labelTB.Size = new System.Drawing.Size(258, 20);
            this.labelTB.TabIndex = 22;
            this.labelTB.Text = "=== Tambah Barang Konsumsi ===";
            // 
            // inputNamaBarang
            // 
            this.inputNamaBarang.Location = new System.Drawing.Point(276, 141);
            this.inputNamaBarang.Name = "inputNamaBarang";
            this.inputNamaBarang.Size = new System.Drawing.Size(400, 26);
            this.inputNamaBarang.TabIndex = 20;
            // 
            // inputJumlah
            // 
            this.inputJumlah.Location = new System.Drawing.Point(276, 180);
            this.inputJumlah.Name = "inputJumlah";
            this.inputJumlah.Size = new System.Drawing.Size(400, 26);
            this.inputJumlah.TabIndex = 19;
            // 
            // inputSatuan
            // 
            this.inputSatuan.Location = new System.Drawing.Point(276, 222);
            this.inputSatuan.Name = "inputSatuan";
            this.inputSatuan.Size = new System.Drawing.Size(400, 26);
            this.inputSatuan.TabIndex = 18;
            // 
            // labelNamaBarang
            // 
            this.labelNamaBarang.AutoSize = true;
            this.labelNamaBarang.Location = new System.Drawing.Point(117, 141);
            this.labelNamaBarang.Name = "labelNamaBarang";
            this.labelNamaBarang.Size = new System.Drawing.Size(61, 20);
            this.labelNamaBarang.TabIndex = 16;
            this.labelNamaBarang.Text = "Nama *";
            // 
            // labelJumlah
            // 
            this.labelJumlah.AutoSize = true;
            this.labelJumlah.Location = new System.Drawing.Point(117, 180);
            this.labelJumlah.Name = "labelJumlah";
            this.labelJumlah.Size = new System.Drawing.Size(70, 20);
            this.labelJumlah.TabIndex = 15;
            this.labelJumlah.Text = "Jumlah *";
            // 
            // labelSatuan
            // 
            this.labelSatuan.AutoSize = true;
            this.labelSatuan.Location = new System.Drawing.Point(117, 222);
            this.labelSatuan.Name = "labelSatuan";
            this.labelSatuan.Size = new System.Drawing.Size(61, 20);
            this.labelSatuan.TabIndex = 14;
            this.labelSatuan.Text = "Satuan";
            // 
            // FormTB
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTambahkanB);
            this.Controls.Add(this.labelTB);
            this.Controls.Add(this.inputNamaBarang);
            this.Controls.Add(this.inputJumlah);
            this.Controls.Add(this.inputSatuan);
            this.Controls.Add(this.labelNamaBarang);
            this.Controls.Add(this.labelJumlah);
            this.Controls.Add(this.labelSatuan);
            this.Name = "FormTB";
            this.Text = "Tambah Barang Konsumsi";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnKembali;
        private System.Windows.Forms.Button btnTambahkanB;
        private System.Windows.Forms.Label labelTB;
        private System.Windows.Forms.TextBox inputNamaBarang;
        private System.Windows.Forms.TextBox inputJumlah;
        private System.Windows.Forms.TextBox inputSatuan;
        private System.Windows.Forms.Label labelNamaBarang;
        private System.Windows.Forms.Label labelJumlah;
        private System.Windows.Forms.Label labelSatuan;
    }
}