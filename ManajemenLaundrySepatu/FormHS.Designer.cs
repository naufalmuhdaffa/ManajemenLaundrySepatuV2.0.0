namespace ManajemenLaundrySepatu
{
    partial class FormHS
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
            this.labelHS = new System.Windows.Forms.Label();
            this.btnKembali = new System.Windows.Forms.Button();
            this.dgvSepatu = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSepatu)).BeginInit();
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
            // labelHS
            // 
            this.labelHS.AutoSize = true;
            this.labelHS.Location = new System.Drawing.Point(313, 25);
            this.labelHS.Name = "labelHS";
            this.labelHS.Size = new System.Drawing.Size(174, 20);
            this.labelHS.TabIndex = 22;
            this.labelHS.Text = "=== Hapus Sepatu ===";
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
            // dgvSepatu
            // 
            this.dgvSepatu.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvSepatu.Location = new System.Drawing.Point(122, 76);
            this.dgvSepatu.Name = "dgvSepatu";
            this.dgvSepatu.RowHeadersWidth = 62;
            this.dgvSepatu.RowTemplate.Height = 28;
            this.dgvSepatu.Size = new System.Drawing.Size(556, 282);
            this.dgvSepatu.TabIndex = 20;
            // 
            // FormHS
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnHapus);
            this.Controls.Add(this.labelHS);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.dgvSepatu);
            this.Name = "FormHS";
            this.Text = "Hapus Sepatu";
            this.Load += new System.EventHandler(this.FormHS_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvSepatu)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnHapus;
        private System.Windows.Forms.Label labelHS;
        private System.Windows.Forms.Button btnKembali;
        private System.Windows.Forms.DataGridView dgvSepatu;
    }
}