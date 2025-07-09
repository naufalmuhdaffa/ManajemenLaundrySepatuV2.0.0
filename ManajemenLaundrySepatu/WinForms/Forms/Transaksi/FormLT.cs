using iTextSharp.text;
using iTextSharp.text.pdf;
using ManajemenLaundrySepatu.Helpers;
using ManajemenLaundrySepatu.WinForms.Helpers;
using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormLT : BaseForm
    {
        private string connectionString = DbConfig.ConnectionString;

        private DataTable currentData;

        public FormLT()
        {
            InitializeComponent();
        }

        private void FormLT_Load(object sender, EventArgs e)
        {
            LoadDataTransaksi();
        }

        private void LoadDataTransaksi()
        {
            if (!Session.CekSession()) return;

            string cacheKey = $"Cache:LaporanTransaksi_{Session.LoggedInUserId}";

            if (Cache.HasCache(cacheKey))
            {
                DataTable cached = Cache.GetCache(cacheKey) as DataTable;
                if (cached != null)
                {
                    dgvLaporanTransaksi.DataSource = cached;
                    dgvLaporanTransaksi.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

                    DateTime lastUpdate = Cache.GetLastUpdate(cacheKey);
                    FormToast toast = new FormToast($"Data di-load dari cache, \nterakhir update: {lastUpdate}");
                    toast.Show();

                    return;
                }
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("sp_ReadViewTransaksi", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id_akun", Session.LoggedInUserId);

                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        dgvLaporanTransaksi.DataSource = dt;
                        currentData = dt;
                        dgvLaporanTransaksi.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

                        Cache.SetCache(cacheKey, dt, 300);
                    }
                }
                catch (Exception ex)
                {
                    DarkModeMessageBox.Show("Gagal mengambil data transaksi: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void ExportToCSV(DataTable dt, string filePath)
        {
            try
            {
                Directory.CreateDirectory(Path.GetDirectoryName(filePath));

                using (StreamWriter sw = new StreamWriter(filePath, false, Encoding.UTF8))
                {
                    string header = string.Join(",", dt.Columns.Cast<DataColumn>().Select(col => col.ColumnName));
                    sw.WriteLine(header);

                    foreach (DataRow row in dt.Rows)
                    {
                        string line = string.Join(",", row.ItemArray.Select(val => EscapeCsv(val?.ToString() ?? "")));
                        sw.WriteLine(line);
                    }
                }

                if (DarkModeMessageBox.Show("CSV berhasil disimpan!\nBuka file sekarang?", "Sukses",
                    MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    System.Diagnostics.Process.Start(filePath);
                }
            }
            catch (Exception ex)
            {
                DarkModeMessageBox.Show($"Gagal ekspor: {ex.Message}", "Error",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private string EscapeCsv(string value)
        {
            if (value.Contains(",") || value.Contains("\"") || value.Contains("\n"))
            {
                value = value.Replace("\"", "\"\"");
                return $"\"{value}\"";
            }
            return value;
        }

        private void ExportToPDF(DataTable dt, string filePath)
        {
            try
            {
                Directory.CreateDirectory(Path.GetDirectoryName(filePath));

                Document document = new Document(PageSize.A4.Rotate(), 10f, 10f, 10f, 10f);
                PdfWriter.GetInstance(document, new FileStream(filePath, FileMode.Create));

                document.Open();

                Paragraph title = new Paragraph("Laporan Transaksi Laundry Sepatu",
                    FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 18));
                title.Alignment = Element.ALIGN_CENTER;
                document.Add(title);

                document.Add(new Paragraph($"Tanggal Cetak: {DateTime.Now.ToString("dd MMMM yyyy HH:mm")}"));
                document.Add(Chunk.NEWLINE);

                PdfPTable pdfTable = new PdfPTable(dt.Columns.Count);
                pdfTable.WidthPercentage = 100;

                float[] columnWidths = new float[dt.Columns.Count];
                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    columnWidths[i] = 2f;
                }
                pdfTable.SetWidths(columnWidths);

                foreach (DataColumn column in dt.Columns)
                {
                    PdfPCell cell = new PdfPCell(new Phrase(column.ColumnName));
                    cell.BackgroundColor = new BaseColor(240, 240, 240);
                    cell.HorizontalAlignment = Element.ALIGN_CENTER;
                    pdfTable.AddCell(cell);
                }

                foreach (DataRow row in dt.Rows)
                {
                    foreach (DataColumn column in dt.Columns)
                    {
                        PdfPCell cell = new PdfPCell(new Phrase(row[column].ToString()));
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        pdfTable.AddCell(cell);
                    }
                }

                document.Add(pdfTable);
                document.Close();

                if (DarkModeMessageBox.Show("PDF berhasil disimpan!\nBuka file sekarang?", "Sukses",
                    MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    System.Diagnostics.Process.Start(filePath);
                }
            }
            catch (Exception ex)
            {
                DarkModeMessageBox.Show($"Gagal ekspor PDF:\n{ex.Message}", "Error",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnCetakCSV_Click(object sender, EventArgs e)
        {
            if (currentData == null || currentData.Rows.Count == 0)
            {
                DarkModeMessageBox.Show("Tidak ada data yang bisa diekspor!", "Peringatan",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SaveFileDialog sfd = new SaveFileDialog())
            {
                sfd.Filter = "CSV Files (*.csv)|*.csv";
                sfd.Title = "Simpan Laporan CSV";
                sfd.FileName = $"Laporan_Transaksi_{DateTime.Now:yyyyMMdd_HHmmss}.csv";
                sfd.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);

                if (sfd.ShowDialog() == DialogResult.OK)
                {
                    ExportToCSV(currentData, sfd.FileName);
                }
            }
        }

        private void btnCetakPDF_Click(object sender, EventArgs e)
        {
            if (currentData == null || currentData.Rows.Count == 0)
            {
                DarkModeMessageBox.Show("Tidak ada data yang bisa diekspor!", "Peringatan",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SaveFileDialog sfd = new SaveFileDialog())
            {
                sfd.Filter = "PDF Files (*.pdf)|*.pdf";
                sfd.Title = "Simpan Laporan PDF";
                sfd.FileName = $"Laporan_Transaksi_{DateTime.Now:yyyyMMdd_HHmmss}.pdf";
                sfd.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);

                if (sfd.ShowDialog() == DialogResult.OK)
                {
                    ExportToPDF(currentData, sfd.FileName);
                }
            }
        }

        private void btnShowCacheTransaksi_Click(object sender, EventArgs e)
        {
            string info = Cache.GetCachePreview($"Cache:LaporanTransaksi_{Session.LoggedInUserId}");
            DarkModeMessageBox.Show(info, "Informasi Cache Transaksi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnRefreshDataTransaksi_Click(object sender, EventArgs e)
        {
            Cache.ClearCache($"Cache:LaporanTransaksi_{Session.LoggedInUserId}");
            LoadDataTransaksi();
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