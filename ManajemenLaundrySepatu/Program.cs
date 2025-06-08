using System;
using System.ComponentModel;
using System.Windows.Forms;
using System.Windows.Forms.VisualStyles;

namespace ManajemenLaundrySepatu
{
    internal static class Program
    {
        [STAThread]
        private static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            if (LicenseManager.UsageMode != LicenseUsageMode.Designtime)
                Application.VisualStyleState = VisualStyleState.NoneEnabled;

            Application.Run(new mainForm());
        }
    }
}