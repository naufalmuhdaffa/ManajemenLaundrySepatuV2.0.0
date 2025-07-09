using ManajemenLaundrySepatu.Helpers;
using ManajemenLaundrySepatu.WinForms.Helpers;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormOLT : BaseForm
    {
        private readonly string connectionString = DbConfig.ConnectionString;

        public FormOLT()
        {
            InitializeComponent();
        }

        private void FormOLT_Load(object sender, EventArgs e)
        {
            EnsureIndexes();
        }

        private void EnsureIndexes()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (var cmd = new SqlCommand("dbo.sp_EnsureRUDIndexes", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.ExecuteNonQuery();
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show($"Gagal memastikan indeks: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void AnalyzeQuery(string storedProcName, params SqlParameter[] parameters)
        {
            using (var conn = new SqlConnection(connectionString))
            {
                conn.InfoMessage += (s, e) =>
                    DarkModeMessageBox.Show(e.Message, "STATISTICS INFO");

                conn.Open();
                using (var cmd = new SqlCommand(storedProcName, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void BtnAnalyze_Click(object sender, EventArgs e)
        {
            if (!Session.CekSession()) return;

            var userId = Session.LoggedInUserId;

            AnalyzeQuery(
                "dbo.sp_Analyze_ReadViewTransaksi",
                new SqlParameter("@id_akun", SqlDbType.Int) { Value = userId }
            );
        }

        private void btnModern_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormLT2 form = new FormLT2();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnPrimitive_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormLT form = new FormLT();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDT form = new FormKDT();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }
    }
}