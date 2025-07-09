using ManajemenLaundrySepatu.Helpers;
using ManajemenLaundrySepatu.WinForms.Helpers;
using Microsoft.Reporting.WinForms;
using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormLT2 : BaseForm
    {
        private readonly string connectionString = DbConfig.ConnectionString;

        private DataTable currentData;
        private string cacheKey;

        public FormLT2()
        {
            InitializeComponent();
        }

        private void FormLT2_Load(object sender, EventArgs e)
        {
            SetupReportViewer();
            this.reportViewer1.RefreshReport();
        }

        private void SetupReportViewer()
        {
            if (!Session.CekSession()) return;

            cacheKey = $"Cache:LaporanTransaksi2_{Session.LoggedInUserId}";

            if (Cache.HasCache(cacheKey))
            {
                currentData = Cache.GetCache(cacheKey) as DataTable;
                if (currentData != null)
                {
                    DateTime lastUpdate = Cache.GetLastUpdate(cacheKey);
                    FormToast toast = new FormToast($"Data di-load dari cache, \nterakhir update: {lastUpdate}");
                    toast.Show();

                    return;
                }
            }

            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_ReadViewTransaksi", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                currentData = dt;
                Cache.SetCache(cacheKey, dt, 300);
            }

            reportViewer1.ProcessingMode = ProcessingMode.Local;

            string reportPath = Path.Combine(Application.StartupPath, "WinForms", "Views", "ReportLT.rdlc");
            reportViewer1.LocalReport.ReportPath = reportPath;

            reportViewer1.LocalReport.DataSources.Clear();
            reportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt));

            this.reportViewer1.RefreshReport();
        }

        private void btnShowCacheTransaksi_Click(object sender, EventArgs e)
        {
            string info = Cache.GetCachePreview($"Cache:LaporanTransaksi2_{Session.LoggedInUserId}");
            DarkModeMessageBox.Show(info, "Informasi Cache Transaksi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnRefreshDataTransaksi_Click(object sender, EventArgs e)
        {
            Cache.ClearCache($"Cache:LaporanTransaksi2_{Session.LoggedInUserId}");
            SetupReportViewer();
            FormToast toast = new FormToast("Refresh Berhasil", 1500);
            toast.Show();
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormOLT form = new FormOLT();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }
    }
}