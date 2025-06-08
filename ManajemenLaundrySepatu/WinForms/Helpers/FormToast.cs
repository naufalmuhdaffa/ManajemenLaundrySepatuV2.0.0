using System.Drawing;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public class FormToast : Form
    {
        public FormToast(string message, int interval = 4000)
        {
            this.FormBorderStyle = FormBorderStyle.None;
            this.StartPosition = FormStartPosition.CenterScreen;
            this.BackColor = Color.FromArgb(40, 40, 40);
            this.Opacity = 0.9;
            this.Width = 400;
            this.Height = 100;
            this.ShowInTaskbar = false;
            this.TopMost = true;

            Label lblMessage = new Label();
            lblMessage.Text = message;
            lblMessage.ForeColor = Color.White;
            lblMessage.Font = new Font("Segoe UI", 15, FontStyle.Regular);
            lblMessage.TextAlign = ContentAlignment.MiddleCenter;
            lblMessage.Dock = DockStyle.Fill;

            this.Controls.Add(lblMessage);

            Timer timer = new Timer();
            timer.Interval = interval;
            timer.Tick += (s, e) =>
            {
                timer.Stop();
                this.Close();
            };
            timer.Start();
        }
    }
}