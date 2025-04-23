namespace ManajemenLaundrySepatu
{
    partial class FormKDT
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
            this.btnHP = new System.Windows.Forms.Button();
            this.btnUP = new System.Windows.Forms.Button();
            this.btnKembali = new System.Windows.Forms.Button();
            this.btnTT = new System.Windows.Forms.Button();
            this.labelKDT = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnHP
            // 
            this.btnHP.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHP.Location = new System.Drawing.Point(90, 254);
            this.btnHP.Name = "btnHP";
            this.btnHP.Size = new System.Drawing.Size(255, 43);
            this.btnHP.TabIndex = 16;
            this.btnHP.Text = "Lihat / Hapus Transaksi";
            this.btnHP.UseVisualStyleBackColor = true;
            this.btnHP.Click += new System.EventHandler(this.btnHT_Click);
            // 
            // btnUP
            // 
            this.btnUP.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnUP.Location = new System.Drawing.Point(433, 149);
            this.btnUP.Name = "btnUP";
            this.btnUP.Size = new System.Drawing.Size(255, 43);
            this.btnUP.TabIndex = 15;
            this.btnUP.Text = "Lihat / Update Transaksi";
            this.btnUP.UseVisualStyleBackColor = true;
            this.btnUP.Click += new System.EventHandler(this.btnUT_Click);
            // 
            // btnKembali
            // 
            this.btnKembali.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKembali.Location = new System.Drawing.Point(433, 254);
            this.btnKembali.Name = "btnKembali";
            this.btnKembali.Size = new System.Drawing.Size(255, 43);
            this.btnKembali.TabIndex = 14;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.UseVisualStyleBackColor = true;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnTT
            // 
            this.btnTT.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTT.Location = new System.Drawing.Point(90, 149);
            this.btnTT.Name = "btnTT";
            this.btnTT.Size = new System.Drawing.Size(255, 43);
            this.btnTT.TabIndex = 13;
            this.btnTT.Text = "Tambah Transaksi";
            this.btnTT.UseVisualStyleBackColor = true;
            this.btnTT.Click += new System.EventHandler(this.btnTT_Click);
            // 
            // labelKDT
            // 
            this.labelKDT.AutoSize = true;
            this.labelKDT.Location = new System.Drawing.Point(284, 76);
            this.labelKDT.Name = "labelKDT";
            this.labelKDT.Size = new System.Drawing.Size(225, 20);
            this.labelKDT.TabIndex = 12;
            this.labelKDT.Text = "=== Kelola Data Transaksi ===";
            // 
            // FormKDT
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnHP);
            this.Controls.Add(this.btnUP);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTT);
            this.Controls.Add(this.labelKDT);
            this.Name = "FormKDT";
            this.Text = "Kelola Data Transaksi";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnHP;
        private System.Windows.Forms.Button btnUP;
        private System.Windows.Forms.Button btnKembali;
        private System.Windows.Forms.Button btnTT;
        private System.Windows.Forms.Label labelKDT;
    }
}