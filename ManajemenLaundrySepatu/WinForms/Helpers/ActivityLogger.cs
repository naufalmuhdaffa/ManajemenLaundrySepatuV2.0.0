using System;
using System.IO;
using System.Text;

namespace ManajemenLaundrySepatu
{
    public static class ActivityLogger
    {
        private static readonly string logPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "activity_log.txt");

        public static void Log(string action, string message)
        {
            string username = Session.GetUsernameById(Session.LoggedInUserId);
            string log = $"[{username}] - [{DateTime.Now:G}] {action}: {message}{Environment.NewLine}";
            File.AppendAllText(logPath, log, Encoding.UTF8);
        }
    }
}