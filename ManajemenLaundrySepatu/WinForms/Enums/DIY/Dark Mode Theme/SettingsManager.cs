namespace ManajemenLaundrySepatu.Helpers
{
    public static class SettingsManager
    {
        public static bool LoadDarkMode()
        {
            return Properties.Settings.Default.DarkMode;
        }

        public static void SaveDarkMode(bool isDark)
        {
            Properties.Settings.Default.DarkMode = isDark;
            Properties.Settings.Default.Save();
        }
    }
}