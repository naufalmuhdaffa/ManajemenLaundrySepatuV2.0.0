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
    public partial class FormKDA: Form
    {
        public FormKDA()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void btnTA_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormTA form = new FormTA();
            form.Show();
        }

        private void btnUA_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormUA form = new FormUA();
            form.Show();
        }

        private void btnHA_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormHA form = new FormHA();
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
