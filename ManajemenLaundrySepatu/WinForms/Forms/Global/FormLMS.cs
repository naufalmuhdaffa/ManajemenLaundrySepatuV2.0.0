using System;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormLMS : BaseForm
    {
        public FormLMS()
        {
            InitializeComponent();
        }

        private void btnKDP_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDP form = new FormKDP();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnKDS_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDS form = new FormKDS();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnKDA_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDA form = new FormKDA();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnKDB_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDB form = new FormKDB();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnKDT_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDT form = new FormKDT();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Logout();
            this.Hide();
            mainForm form = new mainForm();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnBT_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormBAK form = new FormBAK();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }
    }
}