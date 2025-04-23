namespace ManajemenLaundrySepatu
{
    partial class FormTA
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
            this.labelTA = new System.Windows.Forms.Label();
            this.inputNamaAlat = new System.Windows.Forms.TextBox();
            this.inputDeskripsi = new System.Windows.Forms.TextBox();
            this.labelNamaAlat = new System.Windows.Forms.Label();
            this.labelTanggal = new System.Windows.Forms.Label();
            this.labelDeskripsi = new System.Windows.Forms.Label();
            this.inputTanggal = new System.Windows.Forms.DateTimePicker();
            this.SuspendLayout();
            // 
            // btnKembali
            // 
            this.btnKembali.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKembali.Location = new System.Drawing.Point(443, 344);
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
            this.btnTambahkanP.Location = new System.Drawing.Point(125, 344);
            this.btnTambahkanP.Name = "btnTambahkanP";
            this.btnTambahkanP.Size = new System.Drawing.Size(255, 43);
            this.btnTambahkanP.TabIndex = 23;
            this.btnTambahkanP.Text = "Tambahkan";
            this.btnTambahkanP.UseVisualStyleBackColor = true;
            this.btnTambahkanP.Click += new System.EventHandler(this.btnTambahkanA_Click);
            // 
            // labelTA
            // 
            this.labelTA.AutoSize = true;
            this.labelTA.Location = new System.Drawing.Point(309, 64);
            this.labelTA.Name = "labelTA";
            this.labelTA.Size = new System.Drawing.Size(222, 20);
            this.labelTA.TabIndex = 22;
            this.labelTA.Text = "=== Tambah Alat Laundry ===";
            // 
            // inputNamaAlat
            // 
            this.inputNamaAlat.Location = new System.Drawing.Point(298, 147);
            this.inputNamaAlat.Name = "inputNamaAlat";
            this.inputNamaAlat.Size = new System.Drawing.Size(400, 26);
            this.inputNamaAlat.TabIndex = 20;
            // 
            // inputDeskripsi
            // 
            this.inputDeskripsi.Location = new System.Drawing.Point(298, 231);
            this.inputDeskripsi.Name = "inputDeskripsi";
            this.inputDeskripsi.Size = new System.Drawing.Size(400, 26);
            this.inputDeskripsi.TabIndex = 18;
            // 
            // labelNamaAlat
            // 
            this.labelNamaAlat.AutoSize = true;
            this.labelNamaAlat.Location = new System.Drawing.Point(121, 150);
            this.labelNamaAlat.Name = "labelNamaAlat";
            this.labelNamaAlat.Size = new System.Drawing.Size(61, 20);
            this.labelNamaAlat.TabIndex = 16;
            this.labelNamaAlat.Text = "Nama *";
            // 
            // labelTanggal
            // 
            this.labelTanggal.AutoSize = true;
            this.labelTanggal.Location = new System.Drawing.Point(121, 189);
            this.labelTanggal.Name = "labelTanggal";
            this.labelTanggal.Size = new System.Drawing.Size(172, 20);
            this.labelTanggal.TabIndex = 15;
            this.labelTanggal.Text = "Tanggal Maintenance *";
            // 
            // labelDeskripsi
            // 
            this.labelDeskripsi.AutoSize = true;
            this.labelDeskripsi.Location = new System.Drawing.Point(121, 231);
            this.labelDeskripsi.Name = "labelDeskripsi";
            this.labelDeskripsi.Size = new System.Drawing.Size(74, 20);
            this.labelDeskripsi.TabIndex = 14;
            this.labelDeskripsi.Text = "Deskripsi";
            // 
            // inputTanggal
            // 
            this.inputTanggal.Location = new System.Drawing.Point(299, 189);
            this.inputTanggal.Name = "inputTanggal";
            this.inputTanggal.Size = new System.Drawing.Size(399, 26);
            this.inputTanggal.TabIndex = 25;
            // 
            // FormTA
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.inputTanggal);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTambahkanP);
            this.Controls.Add(this.labelTA);
            this.Controls.Add(this.inputNamaAlat);
            this.Controls.Add(this.inputDeskripsi);
            this.Controls.Add(this.labelNamaAlat);
            this.Controls.Add(this.labelTanggal);
            this.Controls.Add(this.labelDeskripsi);
            this.Name = "FormTA";
            this.Text = "Tambah Alat Laundry";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnKembali;
        private System.Windows.Forms.Button btnTambahkanP;
        private System.Windows.Forms.Label labelTA;
        private System.Windows.Forms.TextBox inputNamaAlat;
        private System.Windows.Forms.TextBox inputDeskripsi;
        private System.Windows.Forms.Label labelNamaAlat;
        private System.Windows.Forms.Label labelTanggal;
        private System.Windows.Forms.Label labelDeskripsi;
        private System.Windows.Forms.DateTimePicker inputTanggal;
    }
}