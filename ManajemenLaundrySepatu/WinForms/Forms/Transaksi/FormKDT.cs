using System;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormKDT : BaseForm
    {
        public FormKDT()
        {
            InitializeComponent();
        }

        private void btnTT_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormTT form = new FormTT();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnUT_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormUT form = new FormUT();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnHT_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormHT form = new FormHT();
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

        private void btnLT_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormOLT form = new FormOLT();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }
    }
}