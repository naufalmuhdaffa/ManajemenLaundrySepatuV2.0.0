namespace ManajemenLaundrySepatu
{
    partial class FormUB
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
            this.inputIdBarang = new System.Windows.Forms.TextBox();
            this.inputNamaBarang = new System.Windows.Forms.TextBox();
            this.inputJumlah = new System.Windows.Forms.TextBox();
            this.inputSatuan = new System.Windows.Forms.TextBox();
            this.labelIdBarang = new System.Windows.Forms.Label();
            this.labelNamaBarang = new System.Windows.Forms.Label();
            this.labelJumlah = new System.Windows.Forms.Label();
            this.labelSatuan = new System.Windows.Forms.Label();
            this.labelUB = new System.Windows.Forms.Label();
            this.dgvBarang = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dgvBarang)).BeginInit();
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
            // inputIdBarang
            // 
            this.inputIdBarang.Location = new System.Drawing.Point(386, 110);
            this.inputIdBarang.Name = "inputIdBarang";
            this.inputIdBarang.Size = new System.Drawing.Size(400, 26);
            this.inputIdBarang.TabIndex = 42;
            // 
            // inputNamaBarang
            // 
            this.inputNamaBarang.Location = new System.Drawing.Point(386, 171);
            this.inputNamaBarang.Name = "inputNamaBarang";
            this.inputNamaBarang.Size = new System.Drawing.Size(400, 26);
            this.inputNamaBarang.TabIndex = 41;
            // 
            // inputJumlah
            // 
            this.inputJumlah.Location = new System.Drawing.Point(386, 238);
            this.inputJumlah.Name = "inputJumlah";
            this.inputJumlah.Size = new System.Drawing.Size(400, 26);
            this.inputJumlah.TabIndex = 40;
            // 
            // inputSatuan
            // 
            this.inputSatuan.Location = new System.Drawing.Point(386, 311);
            this.inputSatuan.Name = "inputSatuan";
            this.inputSatuan.Size = new System.Drawing.Size(400, 26);
            this.inputSatuan.TabIndex = 39;
            // 
            // labelIdBarang
            // 
            this.labelIdBarang.AutoSize = true;
            this.labelIdBarang.Location = new System.Drawing.Point(386, 87);
            this.labelIdBarang.Name = "labelIdBarang";
            this.labelIdBarang.Size = new System.Drawing.Size(165, 20);
            this.labelIdBarang.TabIndex = 38;
            this.labelIdBarang.Text = "ID Barang Konsumsi *";
            // 
            // labelNamaBarang
            // 
            this.labelNamaBarang.AutoSize = true;
            this.labelNamaBarang.Location = new System.Drawing.Point(386, 148);
            this.labelNamaBarang.Name = "labelNamaBarang";
            this.labelNamaBarang.Size = new System.Drawing.Size(61, 20);
            this.labelNamaBarang.TabIndex = 37;
            this.labelNamaBarang.Text = "Nama *";
            // 
            // labelJumlah
            // 
            this.labelJumlah.AutoSize = true;
            this.labelJumlah.Location = new System.Drawing.Point(386, 215);
            this.labelJumlah.Name = "labelJumlah";
            this.labelJumlah.Size = new System.Drawing.Size(70, 20);
            this.labelJumlah.TabIndex = 36;
            this.labelJumlah.Text = "Jumlah *";
            // 
            // labelSatuan
            // 
            this.labelSatuan.AutoSize = true;
            this.labelSatuan.Location = new System.Drawing.Point(386, 288);
            this.labelSatuan.Name = "labelSatuan";
            this.labelSatuan.Size = new System.Drawing.Size(61, 20);
            this.labelSatuan.TabIndex = 35;
            this.labelSatuan.Text = "Satuan";
            // 
            // labelUB
            // 
            this.labelUB.AutoSize = true;
            this.labelUB.Location = new System.Drawing.Point(304, 30);
            this.labelUB.Name = "labelUB";
            this.labelUB.Size = new System.Drawing.Size(253, 20);
            this.labelUB.TabIndex = 34;
            this.labelUB.Text = "=== Update Barang Konsumsi ===";
            // 
            // dgvBarang
            // 
            this.dgvBarang.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvBarang.Location = new System.Drawing.Point(15, 78);
            this.dgvBarang.Name = "dgvBarang";
            this.dgvBarang.RowHeadersWidth = 62;
            this.dgvBarang.RowTemplate.Height = 28;
            this.dgvBarang.Size = new System.Drawing.Size(365, 282);
            this.dgvBarang.TabIndex = 33;
            this.dgvBarang.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvBarang_CellClick);
            // 
            // FormUB
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnKembali);
            this.Controls.Add(this.btnUpdate);
            this.Controls.Add(this.inputIdBarang);
            this.Controls.Add(this.inputNamaBarang);
            this.Controls.Add(this.inputJumlah);
            this.Controls.Add(this.inputSatuan);
            this.Controls.Add(this.labelIdBarang);
            this.Controls.Add(this.labelNamaBarang);
            this.Controls.Add(this.labelJumlah);
            this.Controls.Add(this.labelSatuan);
            this.Controls.Add(this.labelUB);
            this.Controls.Add(this.dgvBarang);
            this.Name = "FormUB";
            this.Text = "Update Barang Konsumsi";
            this.Load += new System.EventHandler(this.FormUB_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvBarang)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnKembali;
        private System.Windows.Forms.Button btnUpdate;
        private System.Windows.Forms.TextBox inputIdBarang;
        private System.Windows.Forms.TextBox inputNamaBarang;
        private System.Windows.Forms.TextBox inputJumlah;
        private System.Windows.Forms.TextBox inputSatuan;
        private System.Windows.Forms.Label labelIdBarang;
        private System.Windows.Forms.Label labelNamaBarang;
        private System.Windows.Forms.Label labelJumlah;
        private System.Windows.Forms.Label labelSatuan;
        private System.Windows.Forms.Label labelUB;
        private System.Windows.Forms.DataGridView dgvBarang;
    }
}