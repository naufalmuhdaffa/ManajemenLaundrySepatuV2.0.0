namespace ManajemenLaundrySepatu
{
    partial class FormHA
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
            this.btnHapus = new System.Windows.Forms.Button();
            this.labelHA = new System.Windows.Forms.Label();
            this.btnKembali = new System.Windows.Forms.Button();
            this.dgvAlat = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dgvAlat)).BeginInit();
            this.SuspendLayout();
            // 
            // btnHapus
            // 
            this.btnHapus.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHapus.Location = new System.Drawing.Point(122, 382);
            this.btnHapus.Name = "btnHapus";
            this.btnHapus.Size = new System.Drawing.Size(255, 43);
            this.btnHapus.TabIndex = 23;
            this.btnHapus.Text = "Hapus";
            this.btnHapus.UseVisualStyleBackColor = true;
            this.btnHapus.Click += new System.EventHandler(this.btnHapus_Click);
            // 
            // labelHA
            // 
            this.labelHA.AutoSize = true;
            this.labelHA.Location = new System.Drawing.Point(307, 22);
            this.labelHA.Name = "labelHA";
            this.labelHA.Size = new System.Drawing.Size(211, 20);
            this.labelHA.TabIndex = 22;
            this.labelHA.Text = "=== Hapus Alat Laundry ===";
            // 
            // btnKembali
            // 
            this.btnKembali.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKembali.Location = new System.Drawing.Point(423, 382);
            this.btnKembali.Name = "btnKembali";
            this.btnKembali.Size = new System.Drawing.Size(255, 43);
            this.btnKembali.TabIndex = 21;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.UseVisualStyleBackColor = true;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // dgvAlat
            // 
            this.dgvAlat.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvAlat.Location = new System.Drawing.Point(122, 76);
            this.dgvAlat.Name = "dgvAlat";
            this.dgvAlat.RowHeadersWidth = 62;
            this.dgvAlat.RowTemplate.Height = 28;
            this.dgvAlat.Size = new System.Drawing.Size(556, 282);
            this.dgvAlat.TabIndex = 20;
            // 
            // FormHA
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnHapus);
            this.Controls.Add(this.labelHA);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.dgvAlat);
            this.Name = "FormHA";
            this.Text = "Hapus Alat Laundry";
            this.Load += new System.EventHandler(this.FormHapusMaintenance_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvAlat)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnHapus;
        private System.Windows.Forms.Label labelHA;
        private System.Windows.Forms.Button btnKembali;
        private System.Windows.Forms.DataGridView dgvAlat;
    }
}