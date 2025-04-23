namespace ManajemenLaundrySepatu
{
    partial class FormUA
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
            this.inputNamaAlat = new System.Windows.Forms.TextBox();
            this.inputDeskripsi = new System.Windows.Forms.TextBox();
            this.labelNamaAlat = new System.Windows.Forms.Label();
            this.labelTanggal = new System.Windows.Forms.Label();
            this.labelAlamat = new System.Windows.Forms.Label();
            this.labelUA = new System.Windows.Forms.Label();
            this.dgvAlat = new System.Windows.Forms.DataGridView();
            this.inputTanggal = new System.Windows.Forms.DateTimePicker();
            ((System.ComponentModel.ISupportInitialize)(this.dgvAlat)).BeginInit();
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
            // inputNamaAlat
            // 
            this.inputNamaAlat.Location = new System.Drawing.Point(388, 139);
            this.inputNamaAlat.Name = "inputNamaAlat";
            this.inputNamaAlat.Size = new System.Drawing.Size(400, 26);
            this.inputNamaAlat.TabIndex = 41;
            // 
            // inputDeskripsi
            // 
            this.inputDeskripsi.Location = new System.Drawing.Point(388, 279);
            this.inputDeskripsi.Name = "inputDeskripsi";
            this.inputDeskripsi.Size = new System.Drawing.Size(400, 26);
            this.inputDeskripsi.TabIndex = 39;
            // 
            // labelNamaAlat
            // 
            this.labelNamaAlat.AutoSize = true;
            this.labelNamaAlat.Location = new System.Drawing.Point(388, 116);
            this.labelNamaAlat.Name = "labelNamaAlat";
            this.labelNamaAlat.Size = new System.Drawing.Size(61, 20);
            this.labelNamaAlat.TabIndex = 37;
            this.labelNamaAlat.Text = "Nama *";
            // 
            // labelTanggal
            // 
            this.labelTanggal.AutoSize = true;
            this.labelTanggal.Location = new System.Drawing.Point(388, 183);
            this.labelTanggal.Name = "labelTanggal";
            this.labelTanggal.Size = new System.Drawing.Size(172, 20);
            this.labelTanggal.TabIndex = 36;
            this.labelTanggal.Text = "Tanggal Maintenance *";
            // 
            // labelAlamat
            // 
            this.labelAlamat.AutoSize = true;
            this.labelAlamat.Location = new System.Drawing.Point(388, 256);
            this.labelAlamat.Name = "labelAlamat";
            this.labelAlamat.Size = new System.Drawing.Size(74, 20);
            this.labelAlamat.TabIndex = 35;
            this.labelAlamat.Text = "Deskripsi";
            // 
            // labelUA
            // 
            this.labelUA.AutoSize = true;
            this.labelUA.Location = new System.Drawing.Point(304, 30);
            this.labelUA.Name = "labelUA";
            this.labelUA.Size = new System.Drawing.Size(217, 20);
            this.labelUA.TabIndex = 34;
            this.labelUA.Text = "=== Update Alat Laundry ===";
            // 
            // dgvAlat
            // 
            this.dgvAlat.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvAlat.Location = new System.Drawing.Point(15, 78);
            this.dgvAlat.Name = "dgvAlat";
            this.dgvAlat.RowHeadersWidth = 62;
            this.dgvAlat.RowTemplate.Height = 28;
            this.dgvAlat.Size = new System.Drawing.Size(365, 282);
            this.dgvAlat.TabIndex = 33;
            this.dgvAlat.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvAlat_CellClick);
            // 
            // inputTanggal
            // 
            this.inputTanggal.Location = new System.Drawing.Point(390, 206);
            this.inputTanggal.Name = "inputTanggal";
            this.inputTanggal.Size = new System.Drawing.Size(400, 26);
            this.inputTanggal.TabIndex = 45;
            // 
            // FormUA
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.inputTanggal);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnUpdate);
            this.Controls.Add(this.inputNamaAlat);
            this.Controls.Add(this.inputDeskripsi);
            this.Controls.Add(this.labelNamaAlat);
            this.Controls.Add(this.labelTanggal);
            this.Controls.Add(this.labelAlamat);
            this.Controls.Add(this.labelUA);
            this.Controls.Add(this.dgvAlat);
            this.Name = "FormUA";
            this.Text = "Update Alat Laundry";
            this.Load += new System.EventHandler(this.FormUA_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvAlat)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnKembali;
        private System.Windows.Forms.Button btnUpdate;
        private System.Windows.Forms.TextBox inputNamaAlat;
        private System.Windows.Forms.TextBox inputDeskripsi;
        private System.Windows.Forms.Label labelNamaAlat;
        private System.Windows.Forms.Label labelTanggal;
        private System.Windows.Forms.Label labelAlamat;
        private System.Windows.Forms.Label labelUA;
        private System.Windows.Forms.DataGridView dgvAlat;
        private System.Windows.Forms.DateTimePicker inputTanggal;
    }
}