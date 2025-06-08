using System;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormKDP : BaseForm
    {
        public FormKDP()
        {
            InitializeComponent();
        }

        private void btnTP_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormTP form = new FormTP();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnLP_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormUP form = new FormUP();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnHP_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormHP form = new FormHP();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormLMS form = new FormLMS();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }
    }
}