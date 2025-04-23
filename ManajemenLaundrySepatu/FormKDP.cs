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
    public partial class FormKDP: System.Windows.Forms.Form
    {
        public FormKDP()
        {
            InitializeComponent();
            mainForm.CloseWindow.Confirmation(this);
        }

        private void btnTP_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormTP form = new FormTP();
            form.Show();
        }

        private void btnLP_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormUP form = new FormUP();
            form.Show();
        }

        private void btnHP_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormHP form = new FormHP();
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
