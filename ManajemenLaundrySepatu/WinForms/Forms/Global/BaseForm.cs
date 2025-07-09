using ManajemenLaundrySepatu.Helpers;
using ManajemenLaundrySepatu.WinForms.Helpers;
using MaterialSkin;
using MaterialSkin.Controls;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class BaseForm : MaterialForm
    {
        protected MaterialSwitch themeSwitch;
        protected MaterialSkinManager skinManager;

        private Dictionary<Button, Point> originalButtonLocations = new Dictionary<Button, Point>();

        public BaseForm()
        {
            InitializeComponent();
            CloseWindow.Confirmation(this);
            this.EnableAutoResize();

            InitializeMaterialSkin();
            InitializeThemeSwitch();

            InitializeDarkModeToggle();
        }

        protected override async void OnShown(EventArgs e)
        {
            base.OnShown(e);
            if (originalButtonLocations.Count == 0)
            {
                var semuaTombol = GetAllButtons(this);
                foreach (var btn in semuaTombol)
                {
                    originalButtonLocations[btn] = btn.Location;
                    btn.Location = new Point(btn.Location.X, -btn.Height);
                }
                await AnimateButtons(semuaTombol);
            }
        }

        private List<Button> GetAllButtons(Control parent)
        {
            var tombolList = new List<Button>();

            foreach (Control ctrl in parent.Controls)
            {
                if (ctrl is Button btn)
                {
                    tombolList.Add(btn);
                }
                if (ctrl.HasChildren)
                {
                    tombolList.AddRange(GetAllButtons(ctrl));
                }
            }

            return tombolList;
        }

        private async Task AnimateButtons(List<Button> tombolList)
        {
            var tombolTerurut = tombolList
                .OrderBy(b => b.TabIndex)
                .ThenBy(b => originalButtonLocations[b].Y)
                .ToList();

            foreach (var btn in tombolTerurut)
            {
                Point target = originalButtonLocations[btn];
                while (btn.Location.Y < target.Y)
                {
                    var current = btn.Location;
                    int deltaY = 20;
                    int nextY = current.Y + deltaY;
                    if (nextY >= target.Y)
                        nextY = target.Y;

                    btn.Location = new Point(current.X, nextY);
                    await Task.Delay(1);
                }
                await Task.Delay(50);
            }
        }

        public static class CloseWindow
        {
            public static void Confirmation(Form form)
            {
                form.FormClosing += (s, e) =>
                {
                    if (e.CloseReason == CloseReason.UserClosing)
                    {
                        var result = DarkModeMessageBox.Show(
                            "Apakah Anda yakin ingin keluar?",
                            "Konfirmasi",
                            MessageBoxButtons.YesNo,
                            MessageBoxIcon.Question);

                        if (result == DialogResult.No)
                        {
                            e.Cancel = true;
                        }
                        else
                        {
                            Session.Logout();
                            Application.Exit();
                        }
                    }
                };
            }
        }

        private void InitializeMaterialSkin()
        {
            skinManager = MaterialSkinManager.Instance;
            skinManager.AddFormToManage(this);
            bool isDarkMode = SettingsManager.LoadDarkMode();

            skinManager.Theme = isDarkMode ?
                MaterialSkinManager.Themes.DARK :
                MaterialSkinManager.Themes.LIGHT;

            skinManager.ColorScheme = isDarkMode
                ? new ColorScheme(Primary.Orange800, Primary.Orange900, Primary.Orange500, Accent.Orange200, TextShade.WHITE)
                : new ColorScheme(Primary.Blue800, Primary.Blue900, Primary.Blue500, Accent.Blue200, TextShade.WHITE);
        }

        private void InitializeThemeSwitch()
        {
            themeSwitch = new MaterialSwitch
            {
                Text = "Dark Mode",
                Location = new Point(10, 70),
                Checked = skinManager.Theme == MaterialSkinManager.Themes.DARK
            };
            themeSwitch.CheckedChanged += ThemeSwitch_CheckedChanged;
            this.Controls.Add(themeSwitch);
        }

        private void ThemeSwitch_CheckedChanged(object sender, EventArgs e)
        {
            bool isDark = themeSwitch.Checked;

            skinManager.Theme = isDark ? MaterialSkinManager.Themes.DARK : MaterialSkinManager.Themes.LIGHT;

            skinManager.ColorScheme = isDark
                ? new ColorScheme(Primary.Orange800, Primary.Orange900, Primary.Orange500, Accent.Orange200, TextShade.WHITE)
                : new ColorScheme(Primary.Blue800, Primary.Blue900, Primary.Blue500, Accent.Blue200, TextShade.WHITE);

            SettingsManager.SaveDarkMode(isDark);
        }

        private void ApplyDarkModeToControls(Control parent)
        {
            bool isDark = (skinManager.Theme == MaterialSkinManager.Themes.DARK);

            foreach (Control ctrl in parent.Controls)
            {
                if (ctrl is DataGridView dgv)
                {
                    if (isDark)
                    {
                        dgv.BackgroundColor = Color.FromArgb(48, 48, 48);
                        dgv.DefaultCellStyle.BackColor = Color.FromArgb(48, 48, 48);
                        dgv.DefaultCellStyle.ForeColor = Color.White;
                        dgv.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(33, 33, 33);
                        dgv.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
                        dgv.RowHeadersDefaultCellStyle.BackColor = Color.FromArgb(33, 33, 33);
                        dgv.RowHeadersDefaultCellStyle.ForeColor = Color.FromArgb(255, 90, 0);

                        dgv.DefaultCellStyle.SelectionBackColor = Color.FromArgb(255, 90, 0);
                        dgv.DefaultCellStyle.SelectionForeColor = Color.White;

                        dgv.RowHeadersDefaultCellStyle.SelectionBackColor = Color.FromArgb(255, 90, 0);
                        dgv.RowHeadersDefaultCellStyle.SelectionForeColor = Color.White;

                        dgv.EnableHeadersVisualStyles = false;
                    }
                    else if (!isDark)
                    {
                        dgv.BackgroundColor = Color.FromArgb(222, 222, 222);
                        dgv.DefaultCellStyle.BackColor = Color.FromArgb(222, 222, 222);
                        dgv.DefaultCellStyle.ForeColor = Color.Black;

                        dgv.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(190, 190, 190);
                        dgv.ColumnHeadersDefaultCellStyle.ForeColor = Color.Black;

                        dgv.RowHeadersDefaultCellStyle.BackColor = Color.FromArgb(190, 190, 190);
                        dgv.RowHeadersDefaultCellStyle.ForeColor = Color.FromArgb(13, 71, 161);

                        dgv.DefaultCellStyle.SelectionBackColor = Color.FromArgb(13, 71, 161);
                        dgv.DefaultCellStyle.SelectionForeColor = Color.White;

                        dgv.RowHeadersDefaultCellStyle.SelectionBackColor = Color.FromArgb(13, 71, 161);
                        dgv.RowHeadersDefaultCellStyle.SelectionForeColor = Color.White;

                        dgv.EnableHeadersVisualStyles = true;
                    }
                }
                if (ctrl is MyDateTimePicker mdtp)
                {
                    if (isDark)
                    {
                        mdtp.BorderColor = Color.FromArgb(255, 90, 0);
                        mdtp.BorderSize = 1;
                        mdtp.SkinColor = Color.Black;
                        mdtp.BackColor = Color.Black;
                        mdtp.TextColor = Color.FromArgb(255, 90, 0);

                        mdtp.CalendarMonthBackground = Color.FromArgb(48, 48, 48);
                        mdtp.CalendarForeColor = Color.White;
                        mdtp.CalendarTitleBackColor = Color.FromArgb(33, 33, 33);
                        mdtp.CalendarTitleForeColor = Color.White;
                        mdtp.CalendarTrailingForeColor = Color.FromArgb(130, 130, 130);
                    }
                    else
                    {
                        mdtp.BorderColor = Color.FromArgb(13, 71, 161);
                        mdtp.BorderSize = 1;
                        mdtp.SkinColor = Color.White;
                        mdtp.BackColor = Color.White;
                        mdtp.TextColor = Color.FromArgb(13, 71, 161);

                        mdtp.CalendarMonthBackground = SystemColors.Window;
                        mdtp.CalendarForeColor = SystemColors.ControlText;
                        mdtp.CalendarTitleBackColor = SystemColors.Control;
                        mdtp.CalendarTitleForeColor = SystemColors.ControlText;
                        mdtp.CalendarTrailingForeColor = SystemColors.GrayText;
                    }
                    mdtp.Invalidate();
                }
                if (ctrl is TabControl tabCtrl)
                {
                    SetupTabControlAppearance(tabCtrl);
                    if (isDark)
                    {
                        tabCtrl.BackColor = Color.FromArgb(255, 180, 130);
                        tabCtrl.ForeColor = Color.White;
                    }
                    else if (!isDark)
                    {
                        tabCtrl.BackColor = Color.FromArgb(161, 180, 255);
                        tabCtrl.ForeColor = Color.Black;
                    }
                    tabCtrl.Invalidate();
                    foreach (TabPage page in tabCtrl.TabPages)
                    {
                        if (isDark)
                        {
                            page.BackColor = Color.Black;
                        }
                        else if (!isDark)
                        {
                            page.BackColor = Color.White;
                        }
                        ApplyDarkModeToControls(page);
                    }
                }
                if (ctrl is MyTextBox txt)
                {
                    if (isDark)
                    {
                        txt.BackColor = Color.Black;
                        txt.ForeColor = Color.FromArgb(255, 90, 0);
                        txt.BorderColor = Color.FromArgb(255, 90, 0);
                        txt.BorderFocusColor = Color.White;
                        txt.BorderSize = 1;
                        txt.Font = new Font("Segoe UI", 9.5F, FontStyle.Regular, GraphicsUnit.Point);
                    }
                    else if (!isDark)
                    {
                        txt.BackColor = Color.White;
                        txt.ForeColor = Color.FromArgb(13, 71, 161);
                        txt.BorderColor = Color.FromArgb(13, 71, 161);
                        txt.BorderFocusColor = Color.Black;
                        txt.BorderSize = 1;
                        txt.Font = new Font("Segoe UI", 9.5F, FontStyle.Regular, GraphicsUnit.Point);
                    }
                }
                if (ctrl is MyComboBox mcb)
                {
                    if (isDark)
                    {
                        mcb.BorderColor = Color.FromArgb(255, 90, 0);
                        mcb.BackColor = Color.Black;
                        mcb.ForeColor = Color.FromArgb(255, 90, 0);

                        mcb.ListBackColor = Color.Black;
                        mcb.ListTextColor = Color.FromArgb(255, 90, 0);

                        mcb.BorderSize = 1;
                        mcb.BorderColor = Color.FromArgb(255, 90, 0);
                        mcb.DropDownHeight = 175;
                        mcb.MaxDropDownItems = 5;
                    }
                    else
                    {
                        mcb.BorderColor = Color.FromArgb(13, 71, 161);
                        mcb.BackColor = Color.White;
                        mcb.ForeColor = Color.FromArgb(13, 71, 161);

                        mcb.ListBackColor = Color.White;
                        mcb.ListTextColor = Color.FromArgb(13, 71, 161);

                        mcb.BorderSize = 1;
                        mcb.BorderColor = Color.FromArgb(13, 71, 161);
                        mcb.DropDownHeight = 175;
                        mcb.MaxDropDownItems = 5;
                    }
                    mcb.Invalidate();
                }
                if (ctrl is MyMaterialButton mb)
                {
                    mb.UpdateTheme(isDark);
                }

                if (ctrl.HasChildren)
                {
                    ApplyDarkModeToControls(ctrl);
                }
            }
        }

        private void InitializeDarkModeToggle()
        {
            this.Load += (s, e) =>
            {
                bool isDarkSaved = Properties.Settings.Default.DarkMode;
                themeSwitch.Checked = isDarkSaved;

                skinManager.Theme = isDarkSaved
                    ? MaterialSkinManager.Themes.DARK
                    : MaterialSkinManager.Themes.LIGHT;

                ApplyDarkModeToControls(this);
            };

            themeSwitch.CheckedChanged += (s, e) =>
            {
                bool isNowDark = themeSwitch.Checked;

                skinManager.Theme = isNowDark
                    ? MaterialSkinManager.Themes.DARK
                    : MaterialSkinManager.Themes.LIGHT;

                Properties.Settings.Default.DarkMode = isNowDark;
                Properties.Settings.Default.Save();

                ApplyDarkModeToControls(this);

                foreach (Control ctrl in this.Controls)
                {
                    if (ctrl is TabControl tabCtrl)
                    {
                        tabCtrl.Invalidate();
                    }
                }
            };
        }

        private void SetupTabControlAppearance(TabControl tabControl)
        {
            tabControl.DrawMode = TabDrawMode.OwnerDrawFixed;
            tabControl.SizeMode = TabSizeMode.Normal;
            tabControl.Padding = new Point(12, 6);

            bool isDark = skinManager.Theme == MaterialSkinManager.Themes.DARK;

            tabControl.BackColor = isDark ? Color.FromArgb(255, 90, 0) : Color.FromArgb(13, 71, 161);
            tabControl.ForeColor = isDark ? Color.White : Color.Black;

            tabControl.Appearance = TabAppearance.Normal;
            tabControl.Enabled = true;

            tabControl.Invalidate();

            tabControl.DrawItem += (s, e) =>
            {
                Rectangle tabBounds = tabControl.GetTabRect(e.Index);
                bool isSelected = (e.State & DrawItemState.Selected) == DrawItemState.Selected;

                string text = tabControl.TabPages[e.Index].Text;

                Color bgSelected = skinManager.ColorScheme.PrimaryColor;
                Color fgSelected = Color.White;

                Color bgUnselected = isDark ? Color.FromArgb(48, 48, 48) : Color.FromArgb(235, 235, 235);
                Color fgUnselected = isDark ? Color.White : Color.Black;

                Color fillColor = isSelected ? bgSelected : bgUnselected;
                Color textColor = isSelected ? fgSelected : fgUnselected;

                using (SolidBrush backBrush = new SolidBrush(fillColor))
                    e.Graphics.FillRectangle(backBrush, tabBounds);

                if (isSelected)
                {
                    Rectangle indicator = new Rectangle(
                        tabBounds.Left + 4,
                        tabBounds.Bottom - 2,
                        tabBounds.Width - 8,
                        2
                    );
                    using (SolidBrush indicatorBrush = new SolidBrush(skinManager.ColorScheme.AccentColor))
                        e.Graphics.FillRectangle(indicatorBrush, indicator);
                }

                using (Font font = new Font("Segoe UI", 10F, FontStyle.Regular))
                {
                    TextRenderer.DrawText(
                        e.Graphics,
                        text,
                        font,
                        tabBounds,
                        textColor,
                        TextFormatFlags.HorizontalCenter | TextFormatFlags.VerticalCenter
                    );
                }
            };

            foreach (TabPage page in tabControl.TabPages)
            {
                page.BackColor = isDark ? Color.FromArgb(33, 33, 33) : Color.White;
                page.ForeColor = isDark ? Color.White : Color.Black;

                page.UseVisualStyleBackColor = false;

                ApplyDarkModeToControls(page);
            }
        }
    }
}