using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormLMS: System.Windows.Forms.Form
    {
        public FormLMS()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void btnKDP_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDP form = new FormKDP();
            form.Show();
        }

        private void btnKDS_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDS form = new FormKDS();
            form.Show();
        }

        private void btnKDA_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDA form = new FormKDA();
            form.Show();
        }

        private void btnKDB_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDB form = new FormKDB();
            form.Show();
        }

        private void btnKDT_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDT form = new FormKDT();
            form.Show();
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            mainForm form = new mainForm();
            form.Show();
        }
    }
}
