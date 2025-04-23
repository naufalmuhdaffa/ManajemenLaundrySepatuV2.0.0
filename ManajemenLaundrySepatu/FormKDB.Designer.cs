namespace ManajemenLaundrySepatu
{
    partial class FormKDB
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
            this.btnHB = new System.Windows.Forms.Button();
            this.btnUB = new System.Windows.Forms.Button();
            this.btnKembali = new System.Windows.Forms.Button();
            this.btnTB = new System.Windows.Forms.Button();
            this.labelKDB = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnHB
            // 
            this.btnHB.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHB.Location = new System.Drawing.Point(99, 251);
            this.btnHB.Name = "btnHB";
            this.btnHB.Size = new System.Drawing.Size(255, 43);
            this.btnHB.TabIndex = 16;
            this.btnHB.Text = "Lihat / Hapus Barang Konsumsi";
            this.btnHB.UseVisualStyleBackColor = true;
            this.btnHB.Click += new System.EventHandler(this.btnHB_Click);
            // 
            // btnUB
            // 
            this.btnUB.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnUB.Location = new System.Drawing.Point(442, 146);
            this.btnUB.Name = "btnUB";
            this.btnUB.Size = new System.Drawing.Size(255, 43);
            this.btnUB.TabIndex = 15;
            this.btnUB.Text = "Lihat / Update Barang Konsumsi";
            this.btnUB.UseVisualStyleBackColor = true;
            this.btnUB.Click += new System.EventHandler(this.btnUB_Click);
            // 
            // btnKembali
            // 
            this.btnKembali.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKembali.Location = new System.Drawing.Point(442, 251);
            this.btnKembali.Name = "btnKembali";
            this.btnKembali.Size = new System.Drawing.Size(255, 43);
            this.btnKembali.TabIndex = 14;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.UseVisualStyleBackColor = true;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnTB
            // 
            this.btnTB.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTB.Location = new System.Drawing.Point(99, 146);
            this.btnTB.Name = "btnTB";
            this.btnTB.Size = new System.Drawing.Size(255, 43);
            this.btnTB.TabIndex = 13;
            this.btnTB.Text = "Tambah Barang Konsumsi";
            this.btnTB.UseVisualStyleBackColor = true;
            this.btnTB.Click += new System.EventHandler(this.btnTB_Click);
            // 
            // labelKDB
            // 
            this.labelKDB.AutoSize = true;
            this.labelKDB.Location = new System.Drawing.Point(263, 69);
            this.labelKDB.Name = "labelKDB";
            this.labelKDB.Size = new System.Drawing.Size(282, 20);
            this.labelKDB.TabIndex = 12;
            this.labelKDB.Text = "=== Kelola Data Barang Konsumsi ===";
            // 
            // FormKDB
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnHB);
            this.Controls.Add(this.btnUB);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTB);
            this.Controls.Add(this.labelKDB);
            this.Name = "FormKDB";
            this.Text = "Kelola Data Barang Konsumsi";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnHB;
        private System.Windows.Forms.Button btnUB;
        private System.Windows.Forms.Button btnKembali;
        private System.Windows.Forms.Button btnTB;
        private System.Windows.Forms.Label labelKDB;
    }
}