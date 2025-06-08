using System;
using System.Data.SqlClient;

namespace ManajemenLaundrySepatu
{
    public static class Session
    {
        private static readonly string connectionString = "Data Source=LAPTOP-GIV3RJG5\\NADA;Initial Catalog=manajemenLaundrySepatu;Integrated Security=True";
        public static int LoggedInUserId { get; set; } = 0;
        public static string LoggedInUsername { get; set; } = null;
        public static bool IsGuest { get; set; } = false;

        public static void Login(int userId)
        {
            LoggedInUserId = userId;
            IsGuest = false;
        }

        public static void LoginAsGuest()
        {
            LoggedInUserId = -1;
            IsGuest = true;
        }

        public static bool CekSession(bool allowGuest = false)
        {
            if (LoggedInUserId == 0 || (!allowGuest && IsGuest))
            {
                FormToast toast = new FormToast("Tamu tidak berhak menggunakan fitur ini, \nsilakan login dulu jika ingin menggunakan!");
                toast.Show();

                return false;
            }
            return true;
        }

        public static void Logout()
        {
            LoggedInUserId = 0;
            IsGuest = false;
        }

        public static string GetUsernameById(int userId)
        {
            string username = "UnknownUser";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("sp_GetAkun", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id", userId);

                        object result = cmd.ExecuteScalar();
                        if (result != null && result != DBNull.Value)
                        {
                            username = result.ToString();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Unexpected Error: {ex.Message}");
            }

            return username;
        }
    }
}