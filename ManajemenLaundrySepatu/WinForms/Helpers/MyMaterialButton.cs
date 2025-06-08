using MaterialSkin.Controls;
using System;
using System.Drawing;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu.WinForms.Helpers
{
    public class MyMaterialButton : MaterialButton
    {
        private bool isHovering = false;
        private Color borderColor = Color.Gray;
        private int borderSize = 2;
        private Timer hoverTimer;
        private float glowAlpha = 0f;
        private bool increasing = false;
        private bool isDarkTheme = false;
        private Color hoverBackColor;
        private Color normalBackColor;

        public bool IsDarkTheme
        {
            get => isDarkTheme;
            set
            {
                if (isDarkTheme != value)
                {
                    isDarkTheme = value;
                    UpdateColorsByTheme();
                    Invalidate();
                }
            }
        }

        public void UpdateTheme(bool isDark)
        {
            isDarkTheme = isDark;
            UpdateColorsByTheme();
            Invalidate();
        }

        public Color BorderColor
        {
            get => borderColor;
            set { borderColor = value; Invalidate(); }
        }

        public int BorderSize
        {
            get => borderSize;
            set { borderSize = value; Invalidate(); }
        }

        public MyMaterialButton()
        {
            this.FlatStyle = FlatStyle.Flat;
            this.FlatAppearance.BorderSize = 0;

            IsDarkTheme = false;

            this.MouseEnter += (s, e) =>
            {
                isHovering = true;
                increasing = true;
                if (hoverTimer == null)
                {
                    hoverTimer = new Timer();
                    hoverTimer.Interval = 30;
                    hoverTimer.Tick += HoverTimer_Tick;
                    hoverTimer.Start();
                }
            };
            this.MouseLeave += (s, e) =>
            {
                isHovering = false;
                increasing = false;
            };
        }

        private void UpdateColorsByTheme()
        {
            if (isDarkTheme)
            {
                normalBackColor = Color.FromArgb(0, 0, 0);
                hoverBackColor = Color.FromArgb(255, 90, 0); 
                this.ForeColor = Color.FromArgb(255, 90, 0);
                borderColor = Color.FromArgb(255, 90, 0);
            }
            else
            {
                normalBackColor = Color.White;
                hoverBackColor = Color.FromArgb(13, 71, 161); 
                this.ForeColor = Color.FromArgb(13, 71, 161);
                borderColor = Color.FromArgb(13, 71, 161);
            }
            this.BackColor = normalBackColor;
        }


        private void HoverTimer_Tick(object sender, EventArgs e)
        {
            if (increasing)
            {
                glowAlpha += 0.1f;
                if (glowAlpha >= 1f)
                {
                    glowAlpha = 1f;
                    hoverTimer.Stop();
                }
            }
            else
            {
                glowAlpha -= 0.1f;
                if (glowAlpha <= 0f)
                {
                    glowAlpha = 0f;
                    hoverTimer.Stop();
                }
            }
            Invalidate(); // redraw
        }

        protected override void OnPaint(PaintEventArgs pevent)
        {
            base.OnPaint(pevent);

            Color backColor = isHovering ? hoverBackColor : this.BackColor;
            Color foreColor = isHovering ? (isDarkTheme ? Color.White : Color.Black) : this.ForeColor;

            using (SolidBrush brush = new SolidBrush(backColor))
            {
                pevent.Graphics.FillRectangle(brush, this.ClientRectangle);
            }

            TextRenderer.DrawText(
                pevent.Graphics,
                this.Text,
                this.Font,
                this.ClientRectangle,
                foreColor,
                TextFormatFlags.HorizontalCenter | TextFormatFlags.VerticalCenter
            );

            Graphics g = pevent.Graphics;
            Rectangle rect = new Rectangle(0, 0, this.Width - 1, this.Height - 1);

            if (glowAlpha > 0)
            {
                Color glowColor = Color.FromArgb((int)(glowAlpha * 120), 255, 165, 0);
                using (Pen glowPen = new Pen(glowColor, borderSize + 2))
                {
                    g.DrawRectangle(glowPen, rect);
                }
            }

            using (Pen pen = new Pen(isHovering ? borderColor : Color.Gray, borderSize))
            {
                g.DrawRectangle(pen, rect);
            }
        }

        protected override void OnMouseEnter(EventArgs e)
        {
            base.OnMouseEnter(e);
            this.BackColor = hoverBackColor;
        }

        protected override void OnMouseLeave(EventArgs e)
        {
            base.OnMouseLeave(e);
            this.BackColor = normalBackColor;
        }

        protected override void OnGotFocus(EventArgs e)
        {
            base.OnGotFocus(e);
            isHovering = true;
            this.BackColor = hoverBackColor;
            this.ForeColor = Color.White;
            Invalidate();
        }

        protected override void OnLostFocus(EventArgs e)
        {
            base.OnLostFocus(e);
            isHovering = false;
            this.BackColor = normalBackColor;
            this.ForeColor = isDarkTheme ? Color.FromArgb(255, 90, 0) : Color.FromArgb(13, 71, 161);
            Invalidate();
        }

    }
}
