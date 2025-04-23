namespace ManajemenLaundrySepatu
{
    partial class FormUS
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
            this.btnUpdate = new System.Windows.Forms.Button();
            this.inputIdPelanggan = new System.Windows.Forms.TextBox();
            this.inputMerek = new System.Windows.Forms.TextBox();
            this.inputJenis = new System.Windows.Forms.TextBox();
            this.inputWarna = new System.Windows.Forms.TextBox();
            this.labelIdPelanggan = new System.Windows.Forms.Label();
            this.labelMerek = new System.Windows.Forms.Label();
            this.labelJenis = new System.Windows.Forms.Label();
            this.labelWarna = new System.Windows.Forms.Label();
            this.labelUS = new System.Windows.Forms.Label();
            this.dgvSepatu = new System.Windows.Forms.DataGridView();
            this.inputIdSepatu = new System.Windows.Forms.TextBox();
            this.labelIdSepatu = new System.Windows.Forms.Label();
            this.inputUkuran = new System.Windows.Forms.TextBox();
            this.labelUkuran = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSepatu)).BeginInit();
            this.SuspendLayout();
            // 
            // btnKembali
            // 
            this.btnKembali.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKembali.Location = new System.Drawing.Point(417, 377);
            this.btnKembali.Name = "btnKembali";
            this.btnKembali.Size = new System.Drawing.Size(255, 43);
            this.btnKembali.TabIndex = 44;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.UseVisualStyleBackColor = true;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnUpdate
            // 
            this.btnUpdate.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnUpdate.Location = new System.Drawing.Point(76, 377);
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(255, 43);
            this.btnUpdate.TabIndex = 43;
            this.btnUpdate.Text = "Update";
            this.btnUpdate.UseVisualStyleBackColor = true;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // inputIdPelanggan
            // 
            this.inputIdPelanggan.Location = new System.Drawing.Point(386, 137);
            this.inputIdPelanggan.Name = "inputIdPelanggan";
            this.inputIdPelanggan.Size = new System.Drawing.Size(400, 26);
            this.inputIdPelanggan.TabIndex = 42;
            // 
            // inputMerek
            // 
            this.inputMerek.Location = new System.Drawing.Point(386, 189);
            this.inputMerek.Name = "inputMerek";
            this.inputMerek.Size = new System.Drawing.Size(400, 26);
            this.inputMerek.TabIndex = 41;
            // 
            // inputJenis
            // 
            this.inputJenis.Location = new System.Drawing.Point(386, 241);
            this.inputJenis.Name = "inputJenis";
            this.inputJenis.Size = new System.Drawing.Size(400, 26);
            this.inputJenis.TabIndex = 40;
            // 
            // inputWarna
            // 
            this.inputWarna.Location = new System.Drawing.Point(386, 293);
            this.inputWarna.Name = "inputWarna";
            this.inputWarna.Size = new System.Drawing.Size(400, 26);
            this.inputWarna.TabIndex = 39;
            // 
            // labelIdPelanggan
            // 
            this.labelIdPelanggan.AutoSize = true;
            this.labelIdPelanggan.Location = new System.Drawing.Point(386, 114);
            this.labelIdPelanggan.Name = "labelIdPelanggan";
            this.labelIdPelanggan.Size = new System.Drawing.Size(116, 20);
            this.labelIdPelanggan.TabIndex = 38;
            this.labelIdPelanggan.Text = "ID Pelanggan *";
            // 
            // labelMerek
            // 
            this.labelMerek.AutoSize = true;
            this.labelMerek.Location = new System.Drawing.Point(386, 166);
            this.labelMerek.Name = "labelMerek";
            this.labelMerek.Size = new System.Drawing.Size(53, 20);
            this.labelMerek.TabIndex = 37;
            this.labelMerek.Text = "Merek";
            // 
            // labelJenis
            // 
            this.labelJenis.AutoSize = true;
            this.labelJenis.Location = new System.Drawing.Point(386, 218);
            this.labelJenis.Name = "labelJenis";
            this.labelJenis.Size = new System.Drawing.Size(46, 20);
            this.labelJenis.TabIndex = 36;
            this.labelJenis.Text = "Jenis";
            // 
            // labelWarna
            // 
            this.labelWarna.AutoSize = true;
            this.labelWarna.Location = new System.Drawing.Point(386, 270);
            this.labelWarna.Name = "labelWarna";
            this.labelWarna.Size = new System.Drawing.Size(56, 20);
            this.labelWarna.TabIndex = 35;
            this.labelWarna.Text = "Warna";
            // 
            // labelUS
            // 
            this.labelUS.AutoSize = true;
            this.labelUS.Location = new System.Drawing.Point(304, 30);
            this.labelUS.Name = "labelUS";
            this.labelUS.Size = new System.Drawing.Size(180, 20);
            this.labelUS.TabIndex = 34;
            this.labelUS.Text = "=== Update Sepatu ===";
            // 
            // dgvSepatu
            // 
            this.dgvSepatu.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvSepatu.Location = new System.Drawing.Point(15, 78);
            this.dgvSepatu.Name = "dgvSepatu";
            this.dgvSepatu.RowHeadersWidth = 62;
            this.dgvSepatu.RowTemplate.Height = 28;
            this.dgvSepatu.Size = new System.Drawing.Size(365, 282);
            this.dgvSepatu.TabIndex = 33;
            this.dgvSepatu.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvSepatu_CellClick);
            // 
            // inputIdSepatu
            // 
            this.inputIdSepatu.Location = new System.Drawing.Point(386, 85);
            this.inputIdSepatu.Name = "inputIdSepatu";
            this.inputIdSepatu.Size = new System.Drawing.Size(400, 26);
            this.inputIdSepatu.TabIndex = 46;
            // 
            // labelIdSepatu
            // 
            this.labelIdSepatu.AutoSize = true;
            this.labelIdSepatu.Location = new System.Drawing.Point(386, 62);
            this.labelIdSepatu.Name = "labelIdSepatu";
            this.labelIdSepatu.Size = new System.Drawing.Size(92, 20);
            this.labelIdSepatu.TabIndex = 45;
            this.labelIdSepatu.Text = "ID Sepatu *";
            // 
            // inputUkuran
            // 
            this.inputUkuran.Location = new System.Drawing.Point(386, 345);
            this.inputUkuran.Name = "inputUkuran";
            this.inputUkuran.Size = new System.Drawing.Size(400, 26);
            this.inputUkuran.TabIndex = 48;
            // 
            // labelUkuran
            // 
            this.labelUkuran.AutoSize = true;
            this.labelUkuran.Location = new System.Drawing.Point(386, 322);
            this.labelUkuran.Name = "labelUkuran";
            this.labelUkuran.Size = new System.Drawing.Size(61, 20);
            this.labelUkuran.TabIndex = 47;
            this.labelUkuran.Text = "Ukuran";
            // 
            // FormUS
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.inputUkuran);
            this.Controls.Add(this.labelUkuran);
            this.Controls.Add(this.inputIdSepatu);
            this.Controls.Add(this.labelIdSepatu);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnUpdate);
            this.Controls.Add(this.inputIdPelanggan);
            this.Controls.Add(this.inputMerek);
            this.Controls.Add(this.inputJenis);
            this.Controls.Add(this.inputWarna);
            this.Controls.Add(this.labelIdPelanggan);
            this.Controls.Add(this.labelMerek);
            this.Controls.Add(this.labelJenis);
            this.Controls.Add(this.labelWarna);
            this.Controls.Add(this.labelUS);
            this.Controls.Add(this.dgvSepatu);
            this.Name = "FormUS";
            this.Text = "Update Sepatu";
            this.Load += new System.EventHandler(this.FormUS_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvSepatu)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnKembali;
        private System.Windows.Forms.Button btnUpdate;
        private System.Windows.Forms.TextBox inputIdPelanggan;
        private System.Windows.Forms.TextBox inputMerek;
        private System.Windows.Forms.TextBox inputJenis;
        private System.Windows.Forms.TextBox inputWarna;
        private System.Windows.Forms.Label labelIdPelanggan;
        private System.Windows.Forms.Label labelMerek;
        private System.Windows.Forms.Label labelJenis;
        private System.Windows.Forms.Label labelWarna;
        private System.Windows.Forms.Label labelUS;
        private System.Windows.Forms.DataGridView dgvSepatu;
        private System.Windows.Forms.TextBox inputIdSepatu;
        private System.Windows.Forms.Label labelIdSepatu;
        private System.Windows.Forms.TextBox inputUkuran;
        private System.Windows.Forms.Label labelUkuran;
    }
}