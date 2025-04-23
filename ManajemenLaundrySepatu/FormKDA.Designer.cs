namespace ManajemenLaundrySepatu
{
    partial class FormKDA
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
            this.btnHA = new System.Windows.Forms.Button();
            this.btnUA = new System.Windows.Forms.Button();
            this.btnKembali = new System.Windows.Forms.Button();
            this.btnTA = new System.Windows.Forms.Button();
            this.labelKDP = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnHA
            // 
            this.btnHA.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHA.Location = new System.Drawing.Point(96, 250);
            this.btnHA.Name = "btnHA";
            this.btnHA.Size = new System.Drawing.Size(255, 43);
            this.btnHA.TabIndex = 16;
            this.btnHA.Text = "Lihat / Hapus Alat Laundry";
            this.btnHA.UseVisualStyleBackColor = true;
            this.btnHA.Click += new System.EventHandler(this.btnHA_Click);
            // 
            // btnUA
            // 
            this.btnUA.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnUA.Location = new System.Drawing.Point(439, 145);
            this.btnUA.Name = "btnUA";
            this.btnUA.Size = new System.Drawing.Size(255, 43);
            this.btnUA.TabIndex = 15;
            this.btnUA.Text = "Lihat / Update Alat Laundry";
            this.btnUA.UseVisualStyleBackColor = true;
            this.btnUA.Click += new System.EventHandler(this.btnUA_Click);
            // 
            // btnKembali
            // 
            this.btnKembali.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKembali.Location = new System.Drawing.Point(439, 250);
            this.btnKembali.Name = "btnKembali";
            this.btnKembali.Size = new System.Drawing.Size(255, 43);
            this.btnKembali.TabIndex = 14;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.UseVisualStyleBackColor = true;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnTA
            // 
            this.btnTA.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTA.Location = new System.Drawing.Point(96, 145);
            this.btnTA.Name = "btnTA";
            this.btnTA.Size = new System.Drawing.Size(255, 43);
            this.btnTA.TabIndex = 13;
            this.btnTA.Text = "Tambah Alat Laundry";
            this.btnTA.UseVisualStyleBackColor = true;
            this.btnTA.Click += new System.EventHandler(this.btnTA_Click);
            // 
            // labelKDP
            // 
            this.labelKDP.AutoSize = true;
            this.labelKDP.Location = new System.Drawing.Point(290, 72);
            this.labelKDP.Name = "labelKDP";
            this.labelKDP.Size = new System.Drawing.Size(246, 20);
            this.labelKDP.TabIndex = 12;
            this.labelKDP.Text = "=== Kelola Data Alat Laundry ===";
            // 
            // FormKDA
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnHA);
            this.Controls.Add(this.btnUA);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnTA);
            this.Controls.Add(this.labelKDP);
            this.Name = "FormKDA";
            this.Text = "Kelola Data Alat Laundry";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnHA;
        private System.Windows.Forms.Button btnUA;
        private System.Windows.Forms.Button btnKembali;
        private System.Windows.Forms.Button btnTA;
        private System.Windows.Forms.Label labelKDP;
    }
}