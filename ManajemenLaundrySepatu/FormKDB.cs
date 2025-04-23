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
    public partial class FormKDB : Form
    {
        public FormKDB()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void btnTB_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormTB form = new FormTB();
            form.Show();
        }

        private void btnUB_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormUB form = new FormUB();
            form.Show();
        }

        private void btnHB_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormHB form = new FormHB();
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
