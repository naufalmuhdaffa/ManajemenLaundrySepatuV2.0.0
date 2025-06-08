using System;
using System.Drawing;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public class WelcomeTextControl : Control
    {
        private Timer typingTimer;
        private string firstLine = "Selamat Datang";
        private string secondLine = "Manajer Laundry Sepatu";
        private int currentCharIndex1 = 0;
        private int currentCharIndex2 = 0;
        private int typingSpeed = 10;
        private Color textColor = Color.Black;
        private Brush textBrush;
        private Brush backgroundBrush;
        private Color backgroundColor = Color.Transparent;

        public WelcomeTextControl()
        {
            this.SetStyle(
                ControlStyles.SupportsTransparentBackColor |
                ControlStyles.AllPaintingInWmPaint |
                ControlStyles.UserPaint |
                ControlStyles.OptimizedDoubleBuffer,
                true);
            this.BackColor = Color.Transparent;
            typingTimer = new Timer();
            typingTimer.Interval = typingSpeed;
            typingTimer.Tick += TypingTimer_Tick;
            textBrush = new SolidBrush(textColor);
            backgroundBrush = new SolidBrush(backgroundColor);
        }

        private void TypingTimer_Tick(object sender, EventArgs e)
        {
            if (currentCharIndex1 < firstLine.Length)
            {
                currentCharIndex1++;
            }
            else if (currentCharIndex2 < secondLine.Length)
            {
                currentCharIndex2++;
            }
            else
            {
                typingTimer.Stop();
            }

            this.Invalidate();
        }

        protected override void OnPaint(PaintEventArgs e)
        {
            base.OnPaint(e);
            if (currentCharIndex1 == 0 && currentCharIndex2 == 0)
                return;

            int padding = 20;
            using (Font textFont = new Font("Arial", 24, FontStyle.Bold))
            {
                string displayText1 = firstLine.Substring(0, currentCharIndex1);
                string displayText2 = secondLine.Substring(0, currentCharIndex2);

                SizeF textSize1 = e.Graphics.MeasureString(displayText1, textFont);
                SizeF textSize2 = e.Graphics.MeasureString(displayText2, textFont);

                int textX1 = (this.Width - (int)textSize1.Width) / 2;
                int textX2 = (this.Width - (int)textSize2.Width) / 2;
                int textY1 = this.Height / 3 - textFont.Height / 2;
                int textY2 = this.Height * 2 / 3 - textFont.Height / 2;
                e.Graphics.FillRectangle(
                    backgroundBrush,
                    textX1 - padding,
                    textY1 - padding,
                    textSize1.Width + padding * 2,
                    textFont.Height + padding * 2
                );
                e.Graphics.FillRectangle(
                    backgroundBrush,
                    textX2 - padding,
                    textY2 - padding,
                    textSize2.Width + padding * 2,
                    textFont.Height + padding * 2
                );
                e.Graphics.DrawString(displayText1, textFont, textBrush, textX1, textY1);
                e.Graphics.DrawString(displayText2, textFont, textBrush, textX2, textY2);
            }
        }

        public void StartTyping()
        {
            currentCharIndex1 = 0;
            currentCharIndex2 = 0;
            if (textBrush == null)
                textBrush = new SolidBrush(textColor);
            typingTimer.Start();
        }

        public void SetTextColor(Color newColor)
        {
            textColor = newColor;
            textBrush?.Dispose();
            textBrush = new SolidBrush(textColor);
            this.Invalidate();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                typingTimer?.Dispose();
                textBrush?.Dispose();
                backgroundBrush?.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}