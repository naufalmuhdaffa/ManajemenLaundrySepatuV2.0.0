using ManajemenLaundrySepatu.WinForms.Helpers;
using System;
using System.IO;
using System.Text;

namespace ManajemenLaundrySepatu
{
    public static class ActivityLogger
    {
        public static void Log(string action, string message)
        {
            string username = Session.GetUsernameById(Session.LoggedInUserId);
            string log = $"[{username}] - [{DateTime.Now:G}] {action}: {message}{Environment.NewLine}";

            string logPath = PathHelper.GetLogFilePath();
            File.AppendAllText(logPath, log, Encoding.UTF8);
        }
    }
}
