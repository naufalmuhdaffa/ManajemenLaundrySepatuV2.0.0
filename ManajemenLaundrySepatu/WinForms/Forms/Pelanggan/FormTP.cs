﻿using ManajemenLaundrySepatu.Helpers;
using ManajemenLaundrySepatu.WinForms.Helpers;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ManajemenLaundrySepatu
{
    public partial class FormTP : BaseForm
    {
        private string connectionString = DbConfig.ConnectionString;

        public FormTP()
        {
            InitializeComponent();
        }

        private void FormTP_Shown(object sender, EventArgs e)
        {
            inputIdPelanggan.Focus();
        }

        private void btnTambahkanP_Click(object sender, EventArgs e)
        {
            if (!Session.CekSession()) return;

            string id = inputIdPelanggan.Texts.Trim();
            string nama = inputNamaPelanggan.Texts.Trim();
            string noHp = inputNoHP.Texts.Trim();
            string alamat = inputAlamat.Texts.Trim();
            int idAkun = Session.LoggedInUserId;

            if (id == "" || nama == "" || noHp == "")
            {
                DarkModeMessageBox.Show("ID Pelanggan, Nama, dan No HP wajib diisi!", "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlTransaction transaction = conn.BeginTransaction())
                    {
                        try
                        {
                            using (SqlCommand cmd = new SqlCommand("sp_CreatePelanggan", conn, transaction))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;

                                cmd.Parameters.AddWithValue("@id_pelanggan", id);
                                cmd.Parameters.AddWithValue("@nama", nama);
                                cmd.Parameters.AddWithValue("@no_hp", noHp);
                                cmd.Parameters.AddWithValue("@alamat", alamat);
                                cmd.Parameters.AddWithValue("@id_akun", idAkun);

                                int rowsAffected = cmd.ExecuteNonQuery();

                                if (rowsAffected > 0)
                                {
                                    transaction.Commit();
                                    DarkModeMessageBox.Show("Data pelanggan berhasil ditambahkan!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                    ClearForm();
                                    Cache.ClearCache($"Cache:Pelanggan_{Session.LoggedInUserId}");
                                }
                                else
                                {
                                    transaction.Rollback();
                                    DarkModeMessageBox.Show("Gagal menambahkan data pelanggan.", "Gagal", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                }
                            }
                        }
                        catch (SqlException sqlEx)
                        {
                            transaction.Rollback();
                            string friendly = SqlErrorHandler.GetFriendlyErrorMessage(sqlEx);
                            DarkModeMessageBox.Show(friendly, "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                        catch (Exception)
                        {
                            transaction.Rollback();
                            DarkModeMessageBox.Show("Terjadi kesalahan tidak terduga saat menambahkan pelanggan. Silakan coba lagi atau hubungi admin.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
                catch (SqlException sqlEx)
                {
                    string friendly = SqlErrorHandler.GetFriendlyErrorMessage(sqlEx);
                    DarkModeMessageBox.Show(friendly, "Peringatan", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                catch (Exception)
                {
                    DarkModeMessageBox.Show("Tidak dapat terhubung ke database. Silakan periksa koneksi atau hubungi admin.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void ClearForm()
        {
            inputIdPelanggan.Clear();
            inputNamaPelanggan.Clear();
            inputNoHP.Clear();
            inputAlamat.Clear();
            inputIdPelanggan.Focus();
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormKDP form = new FormKDP();
            form.Show();
            form.EnableAutoResize();
            form.WindowState = FormWindowState.Normal;
            if (this.WindowState == FormWindowState.Maximized)
                form.WindowState = FormWindowState.Maximized;
        }

        private void inputIdPelanggan_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                inputNamaPelanggan.Focus();
                e.Handled = true;
            }
        }

        private void inputNamaPelanggan_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                inputNoHP.Focus();
                e.Handled = true;
            }
        }

        private void inputNoHP_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                inputAlamat.Focus();
                e.Handled = true;
            }
        }

        private void inputAlamat_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                btnTambahkanP.PerformClick();
                e.Handled = true;
            }
        }
    }
}