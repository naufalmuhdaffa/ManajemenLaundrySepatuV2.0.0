using System;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormKDA : BaseForm
    {
        public FormKDA()
        {
            InitializeComponent();
        }

        private void btnTA_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormTA form = new FormTA();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnUA_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormUA form = new FormUA();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnHA_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormHA form = new FormHA();
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