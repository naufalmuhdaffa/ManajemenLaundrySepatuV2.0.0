namespace ManajemenLaundrySepatu
{
    partial class FormKDS
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
            this.btnHS = new System.Windows.Forms.Button();
            this.btnLS = new System.Windows.Forms.Button();
            this.btnKembali = new System.Windows.Forms.Button();
            this.btnTS = new System.Windows.Forms.Button();
            this.labelKDS = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnHS
            // 
            this.btnHS.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHS.Location = new System.Drawing.Point(102, 233);
            this.btnHS.Name = "btnHS";
            this.btnHS.Size = new System.Drawing.Size(255, 43);
            this.btnHS.TabIndex = 16;
            this.btnHS.Text = "Lihat / Hapus Sepatu";
            this.btnHS.UseVisualStyleBackColor = true;
            this.btnHS.Click += new System.EventHandler(this.btnHS_Click);
            // 
            // btnLS
            // 
            this.btnLS.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLS.Location = new System.Drawing.Point(445, 128);
            this.btnLS.Name = "btnLS";
            this.btnLS.Size = new System.Drawing.Size(255, 43);
            this.btnLS.TabIndex = 15;
            this.btnLS.Text = "Lihat / Update Sepatu";
            this.btnLS.UseVisualStyleBackColor = true;
            this.btnLS.Click += new System.EventHandler(this.btnUS_Click);
            // 
            // btnKembali
            // 
            this.btnKembali.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKembali.Location = new System.Drawing.Point(445, 233);
            this.btnKembali.Name = "btnKembali";
            this.btnKembali.Size = new System.Drawing.Size(255, 43);
            this.btnKembali.TabIndex = 14;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.UseVisualStyleBackColor = true;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnTS
            // 
            this.btnTS.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTS.Location = new System.Drawing.Point(102, 128);
            this.btnTS.Name = "btnTS";
            this.btnTS.Size = new System.Drawing.Size(255, 43);
            this.btnTS.TabIndex = 13;
            this.btnTS.Text = "Tambah Sepatu";
            this.btnTS.UseVisualStyleBackColor = true;
            this.btnTS.Click += new System.EventHandler(this.btnTS_Click);
            // 
            // labelKDS
            // 
            this.labelKDS.AutoSize = true;
            this.labelKDS.Location = new System.Drawing.Point(296, 55);
            this.labelKDS.Name = "labelKDS";
            this.labelKDS.Size = new System.Drawing.Size(209, 20);
            this.labelKDS.TabIndex = 12;
            this.labelKDS.Text = "=== Kelola Data Sepatu ===";
            // 
            // FormKDS
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnHS);
            this.Controls.Add(this.btnLS);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTS);
            this.Controls.Add(this.labelKDS);
            this.Name = "FormKDS";
            this.Text = "Kelola Data Sepatu";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnHS;
        private System.Windows.Forms.Button btnLS;
        private System.Windows.Forms.Button btnKembali;
        private System.Windows.Forms.Button btnTS;
        private System.Windows.Forms.Label labelKDS;
    }
}