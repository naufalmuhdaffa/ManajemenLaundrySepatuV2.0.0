using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace ManajemenLaundrySepatu.WinForms.Helpers
{
    public static class SqlErrorHandler
    {
        // Peta nama constraint/database error number ke pesan user-friendly
        private static readonly Dictionary<string, string> ConstraintMessages = new Dictionary<
            string,
            string
        >(StringComparer.OrdinalIgnoreCase)
        {
            // Pelanggan
            { 
                "PK_Pelanggan_id_pelanggan",
                "ID Pelanggan sudah ada. Gunakan ID lain." 
            },
            {
                "check_id_pelanggan",
                "ID Pelanggan harus berupa angka dengan panjang tepat 4 digit."
            },
            {
                "check_nama",
                "Nama hanya boleh berisi huruf alfabet, spasi, tanda petik tunggal (') dan tanda hubung (-)."
            },
            { 
                "uq_no_hp",
                "No HP sudah terdaftar. Silakan gunakan nomor lain." 
            },
            {
                "check_no_hp",
                "Format No HP tidak valid. Harus diawali '08' dan panjang 10–13 digit."
            },
            {
                "check_alamat",
                "Alamat hanya boleh berisi huruf alfabet, angka, spasi, titik (.), koma (,), gariis miring (/) dan tanda hubung (-)."
            },
            {
                "FK_Pelanggan_id_akun",
                "Session pengguna tidak valid. Silakan login ulang."
            },

            // Sepatu
            {
                "PK_Sepatu_id_sepatu",
                "ID Sepatu sudah ada, ganti ID lain"
            },
            {
                "CK_Sepatu_Merek",
                "Merek hanya boleh pakai Huruf alfabet(besar/kecil), spasi, petik tunggal('), atau tanda hubung(-)."
            },
            {
                "CK_Sepatu_Jenis",
                "Jenis hanya boleh pakai Huruf alfabet(besar/kecil), angka, spasi, petik tunggal('), atau tanda hubung(-)."
            },
            {
                "CK_Sepatu_Warna",
                "Warna hanya boleh pakai Huruf alfabet(besar/kecil), spasi, atau tanda hubung(-)."
            },
            {
                "CK_Sepatu_Ukuran",
                "Ukuran hanya boleh pakai Angka, dan memakai huruf s, m, l, x (kapital/non-kapital)."
            },
            {
                "FK_Sepatu_id_akun",
                "Session pengguna tidak valid. Silakan login ulang)."
            },
            {
                "FK_Sepatu_id_pelanggan",
                "Data pelanggan yang dipilih tidak ditemukan atau sudah dihapus. Silakan pilih pelanggan yang valid."
            },

            // Transaksi
            {
                "PK_Transaksi_id_transaksi",
                "ID Transaksi sudah ada, ganti ID lain"
            },
            {
                "check_total_harga",
                "Check total harga harus lebih dari atau sama dengan 0 nilainya"
            },
            {
                "CK_Transaksi_status",
                "Check Transaksi Status Transaksi harus mengubah 'status_transaksi' menjadi NOT NULL"
            },
            {
                "FK_Transaksi_id_akun",
                "Session pengguna tidak valid. Silakan login ulang)."
            },
            {
                "FK_Transaksi_id_sepatu",
                "Data pelanggan yang dipilih tidak ditemukan atau sudah dihapus. Silakan pilih Transaksi yang valid."
            },

            // Barang_Konsumsi
            {
                "PK_Barang_id",
                "ID Barang Konsumsi sudah ada. Gunakan ID lain."
            },
            {
                "check_nama_barang_konsumsi",
                "Nama Barang Konsumsi tidak boleh kosong dan hanya boleh berisi huruf, angka, spasi, dan karakter dasar."
            },
            {
                "check_jumlah_barang_konsumsi",
                "Jumlah Barang Konsumsi harus berupa angka dan tidak boleh negatif atau nol."
            },
            {
                "check_satuan_barang_konsumsi",
                "Satuan Barang Konsumsi harus diisi, misalnya 'pcs', 'liter', atau 'kg'."
            },
            {
                "FK_Barang_id_akun",
                "ID Akun tidak valid. Silakan periksa kembali akun yang digunakan."
            },

            // Maintenance_Alat_Laundry
            {
                "PK_Maintenance_id",
                "ID Alat Maintenance sudah ada. Gunakan ID lain."
            },
            {
                "check_nama_alat_laundry",
                "Nama alat laundry tidak valid. Hanya boleh berisi huruf, angka, spasi, tanda petik tunggal (') dan tanda hubung (-)."
            },
            {
                "FK_Maintenance_id_akun",
                "ID Akun tidak valid. Silakan login ulang atau hubungi administrator."
            }
        };

        public static string GetFriendlyErrorMessage(SqlException ex)
        {
            // Periksa error number umum
            switch (ex.Number)
            {
                case 50000: // RAISERROR
                    return ex.Message;
                case 2627: // Violation of primary key atau unique index
                case 2601: // Duplicate key
                    // Coba ekstrak nama constraint dari pesan
                    string constraintName = ExtractConstraintName(ex.Message);
                    if (
                        !string.IsNullOrEmpty(constraintName)
                        && ConstraintMessages.TryGetValue(constraintName, out var msg)
                    )
                    {
                        return msg;
                    }
                    return "Terjadi duplikasi data. Silakan periksa kembali input Anda.";

                case 547: // Foreign key atau check constraint violation
                    // Ekstrak nama constraint
                    constraintName = ExtractConstraintName(ex.Message);
                    if (
                        !string.IsNullOrEmpty(constraintName)
                        && ConstraintMessages.TryGetValue(constraintName, out msg)
                    )
                    {
                        return msg;
                    }
                    return "Data terkait tidak ditemukan atau melanggar aturan integritas. Silakan periksa kembali.";

                default:
                    // Untuk error number lain
                    break;
            }
            // Jika tidak terdeteksi, fallback generic
            return "Kesalahan database. Silakan hubungi administrator.";
        }

        private static string ExtractConstraintName(string sqlMessage)
        {
            // Contoh pesan: "Violation of UNIQUE KEY constraint 'UQ_Pelanggan_NoHp'. Cannot insert duplicate key..."
            // atau: "The INSERT statement conflicted with the CHECK constraint "CK_Pelanggan_NoHp_Format"."
            // Regex mencari teks di antara 'constraint '...'' atau CHECK constraint "..."
            var match = Regex.Match(
                sqlMessage,
                @"constraint ['""]?(?<name>[\w\d_]+)['""]?",
                RegexOptions.IgnoreCase
            );
            if (match.Success)
            {
                return match.Groups["name"].Value;
            }
            return null;
        }
    }
}
