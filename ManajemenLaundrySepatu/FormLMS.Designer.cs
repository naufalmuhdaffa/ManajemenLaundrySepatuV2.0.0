namespace ManajemenLaundrySepatu
{
    partial class FormLMS
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
            this.btnKDS = new System.Windows.Forms.Button();
            this.btnKDA = new System.Windows.Forms.Button();
            this.btnKDT = new System.Windows.Forms.Button();
            this.btnKDP = new System.Windows.Forms.Button();
            this.labelLMS = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnKDS
            // 
            this.btnKDS.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKDS.Location = new System.Drawing.Point(431, 111);
            this.btnKDS.Name = "btnKDS";
            this.btnKDS.Size = new System.Drawing.Size(255, 43);
            this.btnKDS.TabIndex = 10;
            this.btnKDS.Text = "Kelola Data Sepatu";
            this.btnKDS.UseVisualStyleBackColor = true;
            this.btnKDS.Click += new System.EventHandler(this.btnKDS_Click);
            // 
            // btnKDA
            // 
            this.btnKDA.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKDA.Location = new System.Drawing.Point(431, 227);
            this.btnKDA.Name = "btnKDA";
            this.btnKDA.Size = new System.Drawing.Size(255, 43);
            this.btnKDA.TabIndex = 9;
            this.btnKDA.Text = "Kelola Data Alat Laundry";
            this.btnKDA.UseCompatibleTextRendering = true;
            this.btnKDA.UseVisualStyleBackColor = true;
            this.btnKDA.Click += new System.EventHandler(this.btnKDA_Click);
            // 
            // btnKDT
            // 
            this.btnKDT.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKDT.Location = new System.Drawing.Point(69, 342);
            this.btnKDT.Name = "btnKDT";
            this.btnKDT.Size = new System.Drawing.Size(255, 43);
            this.btnKDT.TabIndex = 8;
            this.btnKDT.Text = "Kelola Data Transaksi";
            this.btnKDT.UseVisualStyleBackColor = true;
            this.btnKDT.Click += new System.EventHandler(this.btnKDT_Click);
            // 
            // btnKDP
            // 
            this.btnKDP.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKDP.Location = new System.Drawing.Point(69, 111);
            this.btnKDP.Name = "btnKDP";
            this.btnKDP.Size = new System.Drawing.Size(255, 43);
            this.btnKDP.TabIndex = 7;
            this.btnKDP.Text = "Kelola Data Pelanggan";
            this.btnKDP.UseVisualStyleBackColor = true;
            this.btnKDP.Click += new System.EventHandler(this.btnKDP_Click);
            // 
            // labelLMS
            // 
            this.labelLMS.AutoSize = true;
            this.labelLMS.Location = new System.Drawing.Point(238, 39);
            this.labelLMS.Name = "labelLMS";
            this.labelLMS.Size = new System.Drawing.Size(283, 20);
            this.labelLMS.TabIndex = 6;
            this.labelLMS.Text = "=== Laundry Management System ===";
            // 
            // button1
            // 
            this.button1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.button1.Location = new System.Drawing.Point(69, 227);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(255, 43);
            this.button1.TabIndex = 11;
            this.button1.Text = "Kelola Data Barang Konsumsi";
            this.button1.UseCompatibleTextRendering = true;
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.btnKDB_Click);
            // 
            // button2
            // 
            this.button2.Cursor = System.Windows.Forms.Cursors.Hand;
            this.button2.Location = new System.Drawing.Point(431, 342);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(255, 43);
            this.button2.TabIndex = 12;
            this.button2.Text = "Logout";
            this.button2.UseCompatibleTextRendering = true;
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // FormLMS
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.btnKDS);
            this.Controls.Add(this.btnKDA);
            this.Controls.Add(this.btnKDT);
            this.Controls.Add(this.btnKDP);
            this.Controls.Add(this.labelLMS);
            this.Name = "FormLMS";
            this.Text = "Menu Utama";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnKDS;
        private System.Windows.Forms.Button btnKDA;
        private System.Windows.Forms.Button btnKDT;
        private System.Windows.Forms.Button btnKDP;
        private System.Windows.Forms.Label labelLMS;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
    }
}