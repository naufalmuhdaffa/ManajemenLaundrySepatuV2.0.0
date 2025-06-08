using System;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormKDS : BaseForm
    {
        public FormKDS()
        {
            InitializeComponent();
        }

        private void btnTS_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormTS form = new FormTS();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnUS_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormUS form = new FormUS();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnHS_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormHS form = new FormHS();
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