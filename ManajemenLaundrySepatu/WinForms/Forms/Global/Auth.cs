using ManajemenLaundrySepatu.WinForms.Helpers;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static Org.BouncyCastle.Math.EC.ECCurve;

namespace ManajemenLaundrySepatu.WinForms.Forms.Global
{
    public partial class Auth : BaseForm
    {
        public Auth()
        {
            InitializeComponent();
            progressBarScan.Visible = false;
        }

        private async void btnScan_Click(object sender, EventArgs e)
        {
            progressBarScan.Visible = true;
            progressBarScan.Style = ProgressBarStyle.Marquee;

            await Task.Run(() => ScanSqlServers());

            progressBarScan.Visible = false;
        }

        private void ScanSqlServers()
        {
            var instance = SqlDataSourceEnumerator.Instance;
            var table = instance.GetDataSources();

            this.Invoke((MethodInvoker)delegate
            {
                cmbServer.Items.Clear();
            });

            foreach (DataRow row in table.Rows)
            {
                string serverName = row["ServerName"].ToString();
                string instanceName = row["InstanceName"].ToString();

                string fullServerName = string.IsNullOrEmpty(instanceName) ? serverName : $"{serverName}\\{instanceName}";

                this.Invoke((MethodInvoker)delegate
                {
                    cmbServer.Items.Add(fullServerName);
                });
            }

            this.Invoke((MethodInvoker)delegate
            {
                if (cmbServer.Items.Count > 0)
                    cmbServer.SelectedIndex = 0;
                else
                    MessageBox.Show("Tidak ditemukan SQL Server di jaringan. Pastikan SQL Server Browser telah di Running. Silakan periksa SQL Server Service di aplikasi SQL Server Configuration Manager Anda.", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
            });
        }

        private void cmbServer_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbDatabase.Items.Clear();
            string server = cmbServer.SelectedItem.ToString();

            string connStr = $"Server={server};Integrated Security=True;Connection Timeout=3";

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT name FROM sys.databases WHERE database_id > 4", conn);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            cmbDatabase.Items.Add(reader.GetString(0));
                        }
                    }
                }

                if (cmbDatabase.Items.Count > 0)
                    cmbDatabase.SelectedIndex = 0;
                else
                    MessageBox.Show("Tidak ada database yang ditemukan.", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Gagal konek ke server:\n" + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            string server = cmbServer.SelectedItem?.ToString();
            string database = cmbDatabase.SelectedItem?.ToString();

            if (string.IsNullOrEmpty(server))
                server = txtServerManual.Texts;

            if (string.IsNullOrEmpty(database))
                database = txtDatabaseManual.Texts;

            if (string.IsNullOrEmpty(server) || string.IsNullOrEmpty(database))
            {
                MessageBox.Show("Isi server dan database terlebih dahulu.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            string connStr = $"Server={server};Database={database};Integrated Security=True";

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    MessageBox.Show("Berhasil konek ke database!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    DbConfig.ConnectionString = connStr;

                    this.Hide();
                    mainForm form = new mainForm();
                    form.Show();
                    form.EnableAutoResize();
                    form.WindowState = FormWindowState.Normal;
                    if (this.WindowState == FormWindowState.Maximized)
                        form.WindowState = FormWindowState.Maximized;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Gagal konek:\n" + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
