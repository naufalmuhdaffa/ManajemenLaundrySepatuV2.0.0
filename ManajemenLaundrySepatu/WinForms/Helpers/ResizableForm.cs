using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;
using ManajemenLaundrySepatu.WinForms.Helpers;

namespace ManajemenLaundrySepatu
{
    public static class ResizeableForm
    {
        private static readonly Dictionary<Form, Size> origSizes =
            new Dictionary<Form, Size>();

        private static readonly Dictionary<Form, Dictionary<Control, Rectangle>> origBounds =
            new Dictionary<Form, Dictionary<Control, Rectangle>>();

        private static readonly Dictionary<Form, Dictionary<Control, float>> origFonts =
            new Dictionary<Form, Dictionary<Control, float>>();

        private static Form lastForm = null;

        public static void EnableAutoResize(this Form form)
        {
            form.Opacity = 0;
            Timer timer = new Timer();
            timer.Interval = 1;
            timer.Tick += (s, ev) =>
            {
                if (form.Opacity < 1)
                    form.Opacity += 0.1;
                else
                    timer.Stop();
            };
            timer.Start();
            form.AutoScaleMode = AutoScaleMode.None;
            form.Load += Form_Load;
            form.Resize += Form_Resize;
        }

        private static void Form_Load(object s, EventArgs e)
        {
            var form = (Form)s;
            origSizes[form] = form.Size;
            origBounds[form] = new Dictionary<Control, Rectangle>();
            origFonts[form] = new Dictionary<Control, float>();
            StoreData(form, form);
        }

        private static void StoreData(Form form, Control parent)
        {
            foreach (Control ctl in parent.Controls)
            {
                if (ctl is MyMaterialButton ||
                    ctl is MaterialSkin.Controls.MaterialLabel ||
                    ctl is MaterialSkin.Controls.MaterialSwitch ||
                    ctl is MaterialSkin.Controls.MaterialCheckbox ||
                    ctl is MaterialSkin.Controls.MaterialRadioButton ||
                    ctl is MaterialSkin.Controls.MaterialTextBox ||
                    ctl is MyComboBox ||
                    ctl is MyTextBox ||
                    ctl is MyDateTimePicker ||
                    ctl is MyMaterialButton ||
                    ctl is TabControl)
                {
                    ctl.AutoSize = false;
                }
                origBounds[form][ctl] = ctl.Bounds;
                origFonts[form][ctl] = ctl.Font.Size;
                if (ctl.HasChildren)
                    StoreData(form, ctl);
            }
        }

        private static void Form_Resize(object s, EventArgs e)
        {
            var form = (Form)s;

            if (!origSizes.ContainsKey(form))
                return;
            if (!origBounds.ContainsKey(form) || !origFonts.ContainsKey(form))
                return;
            if (form.WindowState == FormWindowState.Maximized)
            {
                if (lastForm != null)
                    lastForm.WindowState = FormWindowState.Maximized;
            }
            else if (form.WindowState == FormWindowState.Minimized)
            {
                if (lastForm != null)
                    lastForm.WindowState = FormWindowState.Minimized;
            }
            else
            {
                if (lastForm != null)
                    lastForm.WindowState = FormWindowState.Normal;
            }
            float scaleX = (float)form.Width / origSizes[form].Width;
            float scaleY = (float)form.Height / origSizes[form].Height;
            ScaleControls(form, form, scaleX, scaleY);
        }

        private static void ScaleControls(Form form, Control parent, float scaleX, float scaleY)
        {
            foreach (Control ctl in parent.Controls)
            {
                if (!origBounds.ContainsKey(form))
                    continue;
                if (!origBounds[form].ContainsKey(ctl) || !origFonts[form].ContainsKey(ctl))
                    continue;

                var ob = origBounds[form][ctl];
                var of = origFonts[form][ctl];
                ctl.SetBounds(
                    (int)(ob.X * scaleX),
                    (int)(ob.Y * scaleY),
                    (int)(ob.Width * scaleX),
                    (int)(ob.Height * scaleY)
                );
                float newFontSize = of * Math.Min(scaleX, scaleY);
                ctl.Font = new Font(ctl.Font.FontFamily, newFontSize, ctl.Font.Style);
                if (ctl.HasChildren)
                    ScaleControls(form, ctl, scaleX, scaleY);
            }
        }
    }
}