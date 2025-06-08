using DarkModeForms;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu.Helpers
{
    public static class DarkModeMessageBox
    {
        private static MsgIcon ToMsgIcon(MessageBoxIcon icon)
        {
            switch (icon)
            {
                case MessageBoxIcon.Information:
                    return MsgIcon.Info;

                case MessageBoxIcon.Exclamation:
                    return MsgIcon.Warning;

                case MessageBoxIcon.Question:
                    return MsgIcon.Question;

                case MessageBoxIcon.Error:
                    return MsgIcon.Error;

                case MessageBoxIcon.None:
                default:
                    return MsgIcon.None;
            }
        }

        public static DialogResult Show(
            string text,
            string caption = "",
            MessageBoxButtons buttons = MessageBoxButtons.OK,
            MessageBoxIcon icon = MessageBoxIcon.None)
        {
            bool isDark = Properties.Settings.Default.DarkMode;
            if (isDark)
            {
                return Messenger.MessageBox(text, caption, buttons, icon, true);
            }
            else
            {
                return System.Windows.Forms.MessageBox.Show(text, caption, buttons, icon);
            }
        }

        public static DialogResult Show(string text)
            => Show(text, "", MessageBoxButtons.OK, MessageBoxIcon.None);

        public static DialogResult Show(string text, string caption, MessageBoxButtons buttons)
            => Show(text, caption, buttons, MessageBoxIcon.None);

        public static DialogResult Show(
            string text,
            string caption,
            MessageBoxButtons buttons,
            MessageBoxIcon icon,
            MessageBoxDefaultButton defaultButton)
        {
            bool isDark = Properties.Settings.Default.DarkMode;
            if (isDark)
            {
                return Messenger.MessageBox(text, caption, buttons, icon, defaultButton, true);
            }
            else
            {
                return System.Windows.Forms.MessageBox.Show(text, caption, buttons, icon, defaultButton);
            }
        }

        public static DialogResult Show(
            Form owner,
            string text,
            string caption = "",
            MessageBoxButtons buttons = MessageBoxButtons.OK,
            MessageBoxIcon icon = MessageBoxIcon.None)
        {
            bool isDark = Properties.Settings.Default.DarkMode;
            if (isDark)
            {
                MsgIcon mi = ToMsgIcon(icon);
                return Messenger.MessageBox(owner, text, caption, buttons, mi, true);
            }
            else
            {
                return System.Windows.Forms.MessageBox.Show(owner, text, caption, buttons, icon);
            }
        }

        public static DialogResult Show(Form owner, string text)
            => Show(owner, text, "", MessageBoxButtons.OK, MessageBoxIcon.None);

        public static DialogResult Show(Form owner, string text, string caption, MessageBoxButtons buttons)
            => Show(owner, text, caption, buttons, MessageBoxIcon.None);

        public static DialogResult Show(
            Form owner,
            string text,
            string caption,
            MessageBoxButtons buttons,
            MessageBoxIcon icon,
            MessageBoxDefaultButton defaultButton)
        {
            bool isDark = Properties.Settings.Default.DarkMode;
            if (isDark)
            {
                MsgIcon mi = ToMsgIcon(icon);
                return Messenger.MessageBox(text, caption, mi, buttons, true, defaultButton, owner);
            }
            else
            {
                return System.Windows.Forms.MessageBox.Show(
                    owner, text, caption, buttons, icon, defaultButton);
            }
        }

        public static DialogResult Show(
            string text,
            string caption,
            MessageBoxButtons buttons,
            MessageBoxIcon icon,
            MessageBoxDefaultButton defaultButton,
            MessageBoxOptions options)
        {
            bool isDark = Properties.Settings.Default.DarkMode;
            if (isDark)
            {
                return System.Windows.Forms.MessageBox.Show(text, caption, buttons, icon, defaultButton, options);
            }
            else
            {
                return System.Windows.Forms.MessageBox.Show(text, caption, buttons, icon, defaultButton, options);
            }
        }

        public static DialogResult Show(
            Form owner,
            string text,
            string caption,
            MessageBoxButtons buttons,
            MessageBoxIcon icon,
            MessageBoxDefaultButton defaultButton,
            MessageBoxOptions options)
        {
            bool isDark = Properties.Settings.Default.DarkMode;
            if (isDark)
            {
                return System.Windows.Forms.MessageBox.Show(owner, text, caption, buttons, icon, defaultButton, options);
            }
            else
            {
                return System.Windows.Forms.MessageBox.Show(owner, text, caption, buttons, icon, defaultButton, options);
            }
        }
    }
}