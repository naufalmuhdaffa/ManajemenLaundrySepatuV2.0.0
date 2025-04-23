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
    public partial class FormKDS: Form
    {
        public FormKDS()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void btnTS_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormTS form = new FormTS();
            form.Show();
        }

        private void btnUS_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormUS form = new FormUS();
            form.Show();
        }

        private void btnHS_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormHS form = new FormHS();
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
