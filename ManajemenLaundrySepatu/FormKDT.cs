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
    public partial class FormKDT : System.Windows.Forms.Form
    {
        public FormKDT()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void btnTT_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormTT form = new FormTT();
            form.Show();
        }

        private void btnUT_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormUT form = new FormUT();
            form.Show();
        }

        private void btnHT_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormHT form = new FormHT();
            form.Show();
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormLMS form = new FormLMS();
            form.Show();
        }
    }
}
