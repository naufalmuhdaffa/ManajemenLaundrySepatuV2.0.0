using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace ManajemenLaundrySepatu.WinForms.Helpers
{
    public static class PathHelper
    {
        public static string GetLogFilePath()
        {
            string folder = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "ManajemenLaundrySepatu");
            Directory.CreateDirectory(folder);
            return Path.Combine(folder, "activity_log.txt");
        }
    }
}
