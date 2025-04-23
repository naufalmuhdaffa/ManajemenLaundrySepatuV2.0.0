namespace ManajemenLaundrySepatu
{
    partial class FormUP
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
            this.labelUP = new System.Windows.Forms.Label();
            this.dgvPelanggan = new System.Windows.Forms.DataGridView();
            this.btnKembali = new System.Windows.Forms.Button();
            this.btnUpdate = new System.Windows.Forms.Button();
            this.inputIdPelanggan = new System.Windows.Forms.TextBox();
            this.inputNamaPelanggan = new System.Windows.Forms.TextBox();
            this.inputNoHP = new System.Windows.Forms.TextBox();
            this.inputAlamat = new System.Windows.Forms.TextBox();
            this.labelIdPelanggan = new System.Windows.Forms.Label();
            this.labelNamaPelanggan = new System.Windows.Forms.Label();
            this.labelNoHP = new System.Windows.Forms.Label();
            this.labelAlamat = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPelanggan)).BeginInit();
            this.SuspendLayout();
            // 
            // labelUP
            // 
            this.labelUP.AutoSize = true;
            this.labelUP.Location = new System.Drawing.Point(313, 27);
            this.labelUP.Name = "labelUP";
            this.labelUP.Size = new System.Drawing.Size(204, 20);
            this.labelUP.TabIndex = 21;
            this.labelUP.Text = "=== Update Pelanggan ===";
            // 
            // dgvPelanggan
            // 
            this.dgvPelanggan.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvPelanggan.Location = new System.Drawing.Point(24, 75);
            this.dgvPelanggan.Name = "dgvPelanggan";
            this.dgvPelanggan.RowHeadersWidth = 62;
            this.dgvPelanggan.RowTemplate.Height = 28;
            this.dgvPelanggan.Size = new System.Drawing.Size(365, 282);
            this.dgvPelanggan.TabIndex = 19;
            this.dgvPelanggan.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvPelanggan_CellClick);
            // 
            // btnKembali
            // 
            this.btnKembali.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKembali.Location = new System.Drawing.Point(426, 374);
            this.btnKembali.Name = "btnKembali";
            this.btnKembali.Size = new System.Drawing.Size(255, 43);
            this.btnKembali.TabIndex = 32;
            this.btnKembali.Text = "Kembali";
            this.btnKembali.UseVisualStyleBackColor = true;
            this.btnKembali.Click += new System.EventHandler(this.btnKembali_Click);
            // 
            // btnUpdate
            // 
            this.btnUpdate.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnUpdate.Location = new System.Drawing.Point(85, 374);
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(255, 43);
            this.btnUpdate.TabIndex = 31;
            this.btnUpdate.Text = "Update";
            this.btnUpdate.UseVisualStyleBackColor = true;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // inputIdPelanggan
            // 
            this.inputIdPelanggan.Location = new System.Drawing.Point(395, 107);
            this.inputIdPelanggan.Name = "inputIdPelanggan";
            this.inputIdPelanggan.Size = new System.Drawing.Size(400, 26);
            this.inputIdPelanggan.TabIndex = 29;
            // 
            // inputNamaPelanggan
            // 
            this.inputNamaPelanggan.Location = new System.Drawing.Point(395, 168);
            this.inputNamaPelanggan.Name = "inputNamaPelanggan";
            this.inputNamaPelanggan.Size = new System.Drawing.Size(400, 26);
            this.inputNamaPelanggan.TabIndex = 28;
            // 
            // inputNoHP
            // 
            this.inputNoHP.Location = new System.Drawing.Point(395, 235);
            this.inputNoHP.Name = "inputNoHP";
            this.inputNoHP.Size = new System.Drawing.Size(400, 26);
            this.inputNoHP.TabIndex = 27;
            // 
            // inputAlamat
            // 
            this.inputAlamat.Location = new System.Drawing.Point(395, 308);
            this.inputAlamat.Name = "inputAlamat";
            this.inputAlamat.Size = new System.Drawing.Size(400, 26);
            this.inputAlamat.TabIndex = 26;
            // 
            // labelIdPelanggan
            // 
            this.labelIdPelanggan.AutoSize = true;
            this.labelIdPelanggan.Location = new System.Drawing.Point(395, 84);
            this.labelIdPelanggan.Name = "labelIdPelanggan";
            this.labelIdPelanggan.Size = new System.Drawing.Size(116, 20);
            this.labelIdPelanggan.TabIndex = 25;
            this.labelIdPelanggan.Text = "ID Pelanggan *";
            // 
            // labelNamaPelanggan
            // 
            this.labelNamaPelanggan.AutoSize = true;
            this.labelNamaPelanggan.Location = new System.Drawing.Point(395, 145);
            this.labelNamaPelanggan.Name = "labelNamaPelanggan";
            this.labelNamaPelanggan.Size = new System.Drawing.Size(61, 20);
            this.labelNamaPelanggan.TabIndex = 24;
            this.labelNamaPelanggan.Text = "Nama *";
            // 
            // labelNoHP
            // 
            this.labelNoHP.AutoSize = true;
            this.labelNoHP.Location = new System.Drawing.Point(395, 212);
            this.labelNoHP.Name = "labelNoHP";
            this.labelNoHP.Size = new System.Drawing.Size(65, 20);
            this.labelNoHP.TabIndex = 23;
            this.labelNoHP.Text = "No HP *";
            // 
            // labelAlamat
            // 
            this.labelAlamat.AutoSize = true;
            this.labelAlamat.Location = new System.Drawing.Point(395, 285);
            this.labelAlamat.Name = "labelAlamat";
            this.labelAlamat.Size = new System.Drawing.Size(59, 20);
            this.labelAlamat.TabIndex = 22;
            this.labelAlamat.Text = "Alamat";
            // 
            // FormUP
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnUpdate);
            this.Controls.Add(this.inputIdPelanggan);
            this.Controls.Add(this.inputNamaPelanggan);
            this.Controls.Add(this.inputNoHP);
            this.Controls.Add(this.inputAlamat);
            this.Controls.Add(this.labelIdPelanggan);
            this.Controls.Add(this.labelNamaPelanggan);
            this.Controls.Add(this.labelNoHP);
            this.Controls.Add(this.labelAlamat);
            this.Controls.Add(this.labelUP);
            this.Controls.Add(this.dgvPelanggan);
            this.Name = "FormUP";
            this.Text = "Update Pelanggan";
            this.Load += new System.EventHandler(this.FormUP_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvPelanggan)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label labelUP;
        private System.Windows.Forms.DataGridView dgvPelanggan;
        private System.Windows.Forms.Button btnKembali;
        private System.Windows.Forms.Button btnUpdate;
        private System.Windows.Forms.TextBox inputIdPelanggan;
        private System.Windows.Forms.TextBox inputNamaPelanggan;
        private System.Windows.Forms.TextBox inputNoHP;
        private System.Windows.Forms.TextBox inputAlamat;
        private System.Windows.Forms.Label labelIdPelanggan;
        private System.Windows.Forms.Label labelNamaPelanggan;
        private System.Windows.Forms.Label labelNoHP;
        private System.Windows.Forms.Label labelAlamat;
    }
}