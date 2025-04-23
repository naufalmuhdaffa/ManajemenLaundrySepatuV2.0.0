namespace ManajemenLaundrySepatu
{
    partial class FormKDP
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
            this.labelKDP = new System.Windows.Forms.Label();
            this.btnTP = new System.Windows.Forms.Button();
            this.btnKembali = new System.Windows.Forms.Button();
            this.btnUP = new System.Windows.Forms.Button();
            this.btnHP = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // labelKDP
            // 
            this.labelKDP.AutoSize = true;
            this.labelKDP.Location = new System.Drawing.Point(288, 69);
            this.labelKDP.Name = "labelKDP";
            this.labelKDP.Size = new System.Drawing.Size(233, 20);
            this.labelKDP.TabIndex = 0;
            this.labelKDP.Text = "=== Kelola Data Pelanggan ===";
            // 
            // btnTP
            // 
            this.btnTP.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTP.Location = new System.Drawing.Point(94, 142);
            this.btnTP.Name = "btnTP";
            this.btnTP.Size = new System.Drawing.Size(255, 43);
            this.btnTP.TabIndex = 8;
            this.btnTP.Text = "Tambah Pelanggan";
            this.btnTP.UseVisualStyleBackColor = true;
            this.btnTP.Click += new System.EventHandler(this.btnTP_Click);
            // 
            // btnKembali
            // 
            this.btnKembali.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKembali.Location = new System.Drawing.Point(437, 247);
            this.btnKembali.Name = "btnKembali";
            this.btnKembali.Size = new System.Drawing.Size(255, 43);
            this.btnKembali.TabIndex = 9;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.UseVisualStyleBackColor = true;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnUP
            // 
            this.btnUP.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnUP.Location = new System.Drawing.Point(437, 142);
            this.btnUP.Name = "btnUP";
            this.btnUP.Size = new System.Drawing.Size(255, 43);
            this.btnUP.TabIndex = 10;
            this.btnUP.Text = "Lihat / Update Pelanggan";
            this.btnUP.UseVisualStyleBackColor = true;
            this.btnUP.Click += new System.EventHandler(this.btnLP_Click);
            // 
            // btnHP
            // 
            this.btnHP.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHP.Location = new System.Drawing.Point(94, 247);
            this.btnHP.Name = "btnHP";
            this.btnHP.Size = new System.Drawing.Size(255, 43);
            this.btnHP.TabIndex = 11;
            this.btnHP.Text = "Lihat / Hapus Pelanggan";
            this.btnHP.UseVisualStyleBackColor = true;
            this.btnHP.Click += new System.EventHandler(this.btnHP_Click);
            // 
            // FormKDP
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnHP);
            this.Controls.Add(this.btnUP);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTP);
            this.Controls.Add(this.labelKDP);
            this.Name = "FormKDP";
            this.Text = "Kelola Data Pelanggan";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label labelKDP;
        private System.Windows.Forms.Button btnTP;
        private System.Windows.Forms.Button btnKembali;
        private System.Windows.Forms.Button btnUP;
        private System.Windows.Forms.Button btnHP;
    }
}