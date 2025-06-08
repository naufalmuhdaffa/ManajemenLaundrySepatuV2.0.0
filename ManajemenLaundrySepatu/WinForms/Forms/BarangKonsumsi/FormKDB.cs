using System;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormKDB : BaseForm
    {
        public FormKDB()
        {
            InitializeComponent();
        }

        private void btnTB_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormTB form = new FormTB();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnUB_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormUB form = new FormUB();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnHB_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormHB form = new FormHB();
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