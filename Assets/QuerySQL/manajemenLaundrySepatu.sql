					--=======================================--
					--== Database Manajemen Laundry Sepatu ==--
					--=======================================--

IF DB_ID('manajemenLaundrySepatu') IS NOT NULL
BEGIN
    USE master;
    ALTER DATABASE manajemenLaundrySepatu SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE manajemenLaundrySepatu;
END
GO

CREATE DATABASE manajemenLaundrySepatu;
GO

USE manajemenLaundrySepatu;
GO


					--===========--
					--== Tabel ==--
					--===========--

  -- Akun --
CREATE TABLE Akun (
	id INT IDENTITY(1,1) CONSTRAINT PK_Akun_id PRIMARY KEY,
	username VARCHAR(50) NOT NULL CONSTRAINT UQ_Akun_username UNIQUE,
	password_hash CHAR(64) NOT NULL,
);
GO

  -- Tabel Pelanggan --
CREATE TABLE Pelanggan (
    id_pelanggan CHAR(4) CONSTRAINT PK_Pelanggan_id_pelanggan PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    no_hp VARCHAR(13) NOT NULL,
    alamat VARCHAR(100),
	CONSTRAINT check_no_hp CHECK (no_hp LIKE '08%' AND LEN(no_hp) BETWEEN 10 AND 13)
);
GO

  -- Tabel Sepatu --
CREATE TABLE Sepatu (
	id_sepatu INT IDENTITY(1,1) CONSTRAINT PK_Sepatu_id_sepatu PRIMARY KEY,
	id_pelanggan CHAR(4) NOT NULL,
    merek VARCHAR(100),
    jenis VARCHAR(50),
    warna VARCHAR(50),
    ukuran VARCHAR(5),
    CONSTRAINT FK_Sepatu_id_pelanggan FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan)
);
GO

  -- Tabel Transaksi --
CREATE TABLE Transaksi (
    id_transaksi INT IDENTITY(1,1) CONSTRAINT PK_Transaksi_id_transaksi PRIMARY KEY,
    id_pelanggan CHAR(4) NOT NULL,
    id_sepatu INT NOT NULL,
    tanggal_transaksi DATETIME DEFAULT GETDATE() NOT NULL,
    total_harga DECIMAL(10,2) NOT NULL,
    status VARCHAR(10) 
    CONSTRAINT CK_Transaksi_status CHECK (status IN ('Proses', 'Selesai', 'Dibatalkan')),
    CONSTRAINT FK_Transaksi_id_pelanggan FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan),
    CONSTRAINT FK_Transaksi_id_sepatu FOREIGN KEY (id_sepatu) REFERENCES Sepatu(id_sepatu)
);
GO

  -- Barang Konsumsi --
CREATE TABLE Barang_Konsumsi (
    id_barang INT IDENTITY(1,1) CONSTRAINT PK_Barang_id PRIMARY KEY,
    nama_barang VARCHAR(100) NOT NULL,
    jumlah INT NOT NULL,
    satuan VARCHAR(50)
);
GO

  -- Maintenance Alat Laundry --
CREATE TABLE Maintenance_Alat_Laundry (
    id_maintenance INT IDENTITY(1,1) CONSTRAINT PK_Maintenance_id PRIMARY KEY,
    nama_alat VARCHAR(100) NOT NULL,
    tanggal_maintenance DATE NOT NULL,
    deskripsi VARCHAR(100)
);
GO


					--===========--
					--== ALTER ==--
					--===========--

					--== Tabel Pelanggan ==--


  -- Tambah Constraint: "id_pelanggan" harus: 
  -- 1. Angka
  -- 2. Panjang karakter tepat 3 digit --
ALTER TABLE Pelanggan
ADD CONSTRAINT check_id_pelanggan 
CHECK (
    id_pelanggan NOT LIKE '%[^0-9]%' AND LEN(id_pelanggan) = 4
);
GO

  -- Tambah Constraint: "nama" hanya bisa pakai: 
  -- 1. Huruf abjad (kapital/non-kapital)
  -- 2. Spasi
  -- 3. Petik tunggal
  -- 4. Tanda hubung/setrip --
ALTER TABLE Pelanggan
ADD CONSTRAINT check_nama 
CHECK (
    nama NOT LIKE '%[^A-Za-z ''-]%'
);
GO

  -- Hapus Constraint: "no_hp" --
ALTER TABLE Pelanggan 
DROP CONSTRAINT check_no_hp;
GO

  -- Tambah Constraint: "no_hp" harus: 
  -- 1. Unik --
ALTER TABLE Pelanggan
ADD CONSTRAINT uq_no_hp UNIQUE (no_hp);
GO

  -- Tambah Constraint: "no_hp" harus: 
  -- 1. Dimulai dengan '08'
  -- 2. Karakter berjumlah antara 10 - 13
  -- 3. Berupa Angka --
ALTER TABLE Pelanggan
ADD CONSTRAINT check_no_hp 
CHECK (
    no_hp LIKE '08%' AND LEN(no_hp) BETWEEN 10 AND 13 AND no_hp NOT LIKE '%[^0-9]%'
);
GO

  -- Tambah Constraint 
  -- Tanpa cek data yang sudah ada di tabel: 
  -- "alamat" hanya bisa pakai: 
  -- 1. Huruf abjad (kapital/non-kapital)
  -- 2. Spasi
  -- 3. Tanda setrip
  -- 4. Koma
  -- 5. Titik
  -- 6. Angka
  -- 7. Slash/garis miring
ALTER TABLE Pelanggan
WITH NOCHECK ADD CONSTRAINT check_alamat 
CHECK (
    alamat NOT LIKE '%[^A-Za-z0-9 .,/-]%'
);
GO

  -- Tambah Foreign Key: "id_akun" --
ALTER TABLE Pelanggan
ADD id_akun INT NOT NULL
    CONSTRAINT FK_Pelanggan_id_akun FOREIGN KEY REFERENCES Akun(id);
GO


					--== Tabel Sepatu ==--


  -- Tambah Constraint: "merek" hanya bisa pakai: 
  -- 1. Huruf abjad (kapital/non-kapital)
  -- 2. Spasi
  -- 3. Petik tunggal
  -- 4. Tanda hubung/setrip --
ALTER TABLE Sepatu
ADD CONSTRAINT CK_Sepatu_Merek
CHECK (
    merek NOT LIKE '%[^a-zA-Z0-9 ''-]%'
);
GO

  -- Tambah Constraint: "jenis" hanya bisa pakai: 
  -- 1. Huruf abjad (kapital/non-kapital)
  -- 2. Angka
  -- 3. Spasi
  -- 4. Petik tunggal
  -- 5. Tanda hubung/setrip --
ALTER TABLE Sepatu
ADD CONSTRAINT CK_Sepatu_Jenis
CHECK (
    jenis NOT LIKE '%[^a-zA-Z0-9 ''-]%'
);
GO

  -- Tambah Constraint: "warna" hanya bisa pakai: 
  -- 1. Huruf abjad (kapital/non-kapital)
  -- 2. Tanda hubung/setrip
  -- 3. Spasi
ALTER TABLE Sepatu
ADD CONSTRAINT CK_Sepatu_Warna
CHECK (
    warna NOT LIKE '%[^a-zA-Z- ]%'
);
GO

  -- Tambah Constraint: "ukuran" hanya bisa pakai: 
  -- 1. Angka tanpa huruf
  -- 2. Huruf s, m, l, x (kapital/non-kapital) tanpa angka --
ALTER TABLE Sepatu
ADD CONSTRAINT CK_Sepatu_Ukuran
CHECK (
    (
		ukuran NOT LIKE '%[^0-9]%' 
        AND ukuran NOT LIKE '%[a-zA-Z]%'
    )
    OR
    (
        ukuran NOT LIKE '%[^sSmMlLxX]%'
        AND ukuran NOT LIKE '%[0-9]%'
    )
);
GO

  -- Tambah Foreign Key: "id_akun" --
ALTER TABLE Sepatu
ADD id_akun INT NOT NULL
    CONSTRAINT FK_Sepatu_id_akun FOREIGN KEY REFERENCES Akun(id);
GO


        -- Foreign Key Cascade --
ALTER TABLE Sepatu
DROP CONSTRAINT FK_Sepatu_id_pelanggan;
GO

ALTER TABLE Sepatu
  ADD CONSTRAINT FK_Sepatu_id_pelanggan
    FOREIGN KEY (id_pelanggan)
    REFERENCES Pelanggan(id_pelanggan)
    ON DELETE CASCADE;
GO


					--== Tabel Transaksi ==--


--SELECT name 
--FROM sys.check_constraints 
--WHERE parent_object_id = OBJECT_ID('Transaksi');

ALTER TABLE Transaksi
DROP CONSTRAINT CK_Transaksi_status;
GO


  -- Menjalankan system stored procedure 
  -- untuk mengubah nama kolom status menjadi status_transaksi
  -- pada tabel Transaksi --
EXEC sp_rename 
'Transaksi.status', 'status_transaksi', 'COLUMN';
GO


  -- Tambah Constraint: "status_transaksi" hanya bisa pakai: 
  -- 1. Salah satu dari nilai yg sudah ditetapkan:
  -- 'Proses', 'Selesai', 'Dibatalkan' --
ALTER TABLE Transaksi
ADD CONSTRAINT CK_Transaksi_status
CHECK (
	status_transaksi IN ('Proses', 'Selesai', 'Dibatalkan')
);
GO

  -- Mengubah "status_transaksi" menjadi NOT NULL --
ALTER TABLE Transaksi
ALTER COLUMN status_transaksi VARCHAR(10) NOT NULL;
GO

  -- Tambah Constraint: "total_harga" harus: 
  -- 1. Lebih dari atau sama dengan 0 nilainya (tidak boleh negatif) --
ALTER TABLE Transaksi
ADD CONSTRAINT check_total_harga 
CHECK (
	total_harga >= 0
);
GO

  -- Tambah Foreign Key: "id_akun" --
ALTER TABLE Transaksi
ADD id_akun INT NOT NULL
    CONSTRAINT FK_Transaksi_id_akun FOREIGN KEY REFERENCES Akun(id);
GO


    -- Foreign Key Cascade --
ALTER TABLE Transaksi
DROP CONSTRAINT FK_Transaksi_id_pelanggan;
GO

ALTER TABLE Transaksi
DROP CONSTRAINT FK_Transaksi_id_sepatu;
GO

ALTER TABLE Transaksi
ADD CONSTRAINT FK_Transaksi_id_sepatu
  FOREIGN KEY (id_sepatu)
  REFERENCES Sepatu(id_sepatu)
  ON DELETE CASCADE;
GO



					--== Tabel Barang_Konsumsi ==--


  -- Tambah Constraint: "nama_barang" hanya bisa pakai: 
  -- 1. Huruf abjad (kapital/non-kapital)
  -- 2. Spasi
  -- 3. Petik tunggal
  -- 4. Tanda hubung/setrip --
ALTER TABLE Barang_Konsumsi
ADD CONSTRAINT check_nama_barang_konsumsi
CHECK (
    nama_barang NOT LIKE '%[^A-Za-z ''-]%'
);
GO

  -- Tambah Constraint: "jumlah" harus: 
  -- 1. Lebih dari atau sama dengan 0 nilainya (tidak boleh negatif) --
ALTER TABLE Barang_Konsumsi
ADD CONSTRAINT check_jumlah_barang_konsumsi 
CHECK (
	jumlah >= 0
);
GO

  -- Tambah Constraint: "satuan" hanya bisa pakai: 
  -- 1. Huruf abjad (kapital/non-kapital)
  -- 2. Spasi
ALTER TABLE Barang_Konsumsi
ADD CONSTRAINT check_satuan_barang_konsumsi
CHECK (
    satuan NOT LIKE '%[^A-Za-z ]%'
);
GO

  -- Tambah Foreign Key: "id_akun" --
ALTER TABLE Barang_Konsumsi
ADD id_akun INT NOT NULL
    CONSTRAINT FK_Barang_id_akun FOREIGN KEY REFERENCES Akun(id);
GO

					--== Tabel Maintenance_Alat_Laundry ==--


  -- Tambah Constraint: "nama_alat" hanya bisa pakai: 
  -- 1. Huruf abjad (kapital/non-kapital)
  -- 2. Angka
  -- 3. Spasi
  -- 4. Petik tunggal
  -- 5. Tanda hubung/setrip --
ALTER TABLE Maintenance_Alat_Laundry
ADD CONSTRAINT check_nama_alat_laundry 
CHECK (
    nama_alat NOT LIKE '%[^A-Za-z0-9 ''-]%'
);
GO

  -- Tambah Kolom Baru: "tanggal_dibuat" --
ALTER TABLE Maintenance_Alat_Laundry
ADD tanggal_dibuat 
DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE);
GO

ALTER TABLE Maintenance_Alat_Laundry
ADD CONSTRAINT df_deskripsi_default DEFAULT '' FOR deskripsi;
GO

  -- Tambah Foreign Key: "id_akun" --
ALTER TABLE Maintenance_Alat_Laundry
ADD id_akun INT NOT NULL
	CONSTRAINT FK_Maintenance_id_akun FOREIGN KEY REFERENCES Akun(id);
GO

					--== Tabel Akun ==--


  -- Tambah Kolom Baru: 
  -- 1. FailedLoginAttempts
  -- 2. LockoutEnd --
ALTER TABLE Akun
ADD FailedLoginAttempts INT NOT NULL DEFAULT 0,
    LockoutEnd DATETIME NULL;
GO

  -- Hapus Constraint: "username" --
ALTER TABLE Akun
DROP CONSTRAINT UQ_Akun_username;
GO

  -- Ubah "Username" jadi Case-Sensitive --
ALTER TABLE Akun
ALTER COLUMN username 
VARCHAR(50) COLLATE Latin1_General_CS_AS NOT NULL;
GO

  -- Tambah Constraint: "username" harus: 
  -- 1. Unik --
ALTER TABLE Akun
ADD CONSTRAINT UQ_Akun_username 
UNIQUE (
	username
);
GO



					--=============--
					--== Trigger ==--
					--=============--

-- Trigger setelah delete di Pelanggan
CREATE TRIGGER trg_AfterDeletePelanggan
ON Pelanggan
AFTER DELETE
AS
BEGIN
    -- 1) Hapus Transaksi via Sepatu milik pelanggan ini
    DELETE t
    FROM Transaksi t
    JOIN Sepatu s
      ON t.id_sepatu = s.id_sepatu
    WHERE s.id_pelanggan IN (SELECT id_pelanggan FROM deleted);

    -- 2) Hapus Sepatu milik pelanggan ini
    DELETE s
    FROM Sepatu s
    WHERE s.id_pelanggan IN (SELECT id_pelanggan FROM deleted);
END;
GO

-- Trigger setelah delete di Sepatu
CREATE TRIGGER trg_AfterDeleteSepatu
ON Sepatu
AFTER DELETE
AS
BEGIN
    -- Hapus Transaksi yang berelasi
    DELETE t
    FROM Transaksi t
    WHERE t.id_sepatu IN (SELECT id_sepatu FROM deleted);
END;
GO


  -- Maintenance_Alat_Laundry --
CREATE TRIGGER trg_ValidasiUpdateMaintenance
ON Maintenance_Alat_Laundry
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN deleted d ON i.id_maintenance = d.id_maintenance
        WHERE i.tanggal_dibuat <> d.tanggal_dibuat
    )
    BEGIN
        RAISERROR('Tanggal dibuat tidak boleh diubah!', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN deleted d ON i.id_maintenance = d.id_maintenance
        WHERE 
            i.tanggal_maintenance < DATEADD(DAY, -1, d.tanggal_dibuat)
            OR
            i.tanggal_maintenance > d.tanggal_dibuat
    )
    BEGIN
        RAISERROR('Tanggal Maintenance hanya boleh berisi tanggal yang sama ketika data dibuat atau sehari sebelumnya!', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO


					--======================--
					--== Stored Procedure ==--
					--== Transaction      ==--
					--== Error Handling   ==--
					--======================--

					
					--== Akun ==--
					
  -- Register Akun
CREATE PROCEDURE sp_CreateAkun
    @Username     VARCHAR(50),
    @PasswordHash VARCHAR(255)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Akun (username, password_hash)
        VALUES (@Username, @PasswordHash);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO

  -- Ambil data Akun (untuk Register)
CREATE PROCEDURE sp_ReadAkun
    @Username VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        SELECT COUNT(*) AS Jumlah
        FROM Akun
        WHERE username = @Username;
    END TRY
    BEGIN CATCH
        SELECT 
            ERROR_NUMBER()  AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage;
		THROW;
    END CATCH
END
GO

  -- 
CREATE PROCEDURE sp_GetAkun
    @id INT
AS
BEGIN
    BEGIN TRY
        SELECT username
        FROM Akun
        WHERE id = @id;
    END TRY
    BEGIN CATCH
        SELECT 
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage;
		THROW;
    END CATCH
END
GO

  -- Ambil Data Akun (untuk Login)
CREATE PROCEDURE sp_LoginAkun
    @username NVARCHAR(50)
AS
BEGIN
    BEGIN TRY
        SELECT 
            id,
            password_hash,
            FailedLoginAttempts,
            LockoutEnd
        FROM Akun
        WHERE username = @username;
    END TRY
    BEGIN CATCH
        SELECT 
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO


  -- Jika Login Gagal
CREATE PROCEDURE sp_UpdateLoginAttempts
    @username NVARCHAR(50),
    @failedAttempts INT,
    @lockoutEnd DATETIME = NULL
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Akun
        SET 
            FailedLoginAttempts = @failedAttempts,
            LockoutEnd = @lockoutEnd
        WHERE username = @username;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT 
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO


  -- Jika Login Berhasil
CREATE PROCEDURE sp_ResetLoginAttempts
    @username NVARCHAR(50)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Akun
        SET 
            FailedLoginAttempts = 0,
            LockoutEnd = NULL
        WHERE username = @username;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT 
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO


					--== Pelanggan ==--

-- 1. CREATE: Tambah Pelanggan Baru
CREATE PROCEDURE sp_CreatePelanggan
    @id_pelanggan CHAR(4),
    @nama VARCHAR(100),
    @no_hp VARCHAR(13),
    @alamat VARCHAR(100),
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun)
        VALUES (@id_pelanggan, @nama, @no_hp, @alamat, @id_akun);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT 
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO

-- 2. READ: Ambil Semua Pelanggan
CREATE PROCEDURE sp_ReadPelanggan
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        SELECT id_pelanggan AS [ID Pelanggan],
               nama AS [Nama],
               no_hp AS [No HP],
               alamat AS [Alamat]
        FROM Pelanggan
        WHERE id_akun = @id_akun;
    END TRY
    BEGIN CATCH
        SELECT 
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO


-- 3. UPDATE: Ubah Data Pelanggan
CREATE PROCEDURE sp_UpdatePelanggan
    @id_pelanggan CHAR(4),
    @nama VARCHAR(100),
    @no_hp VARCHAR(13),
    @alamat VARCHAR(100),
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Pelanggan
        SET nama   = @nama,
            no_hp  = @no_hp,
            alamat = @alamat
        WHERE id_pelanggan = @id_pelanggan 
          AND id_akun = @id_akun;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT 
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO

-- 4. DELETE: Hapus Pelanggan
CREATE PROCEDURE sp_DeletePelanggan
    @id_pelanggan CHAR(4),
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM Pelanggan
        WHERE id_pelanggan = @id_pelanggan
          AND id_akun = @id_akun;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT 
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO


					--== Sepatu ==--
 
  -- Tambah
CREATE PROCEDURE sp_CreateSepatu
    @id_pelanggan CHAR(4),
    @merek VARCHAR(100),
    @jenis VARCHAR(50),
    @warna VARCHAR(50),
    @ukuran VARCHAR(5),
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun)
        VALUES (@id_pelanggan, @merek, @jenis, @warna, @ukuran, @id_akun);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO


  -- Ambil
CREATE PROCEDURE sp_ReadSepatu
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        SELECT s.id_sepatu AS [ID Sepatu], 
               s.id_pelanggan AS [ID Pelanggan], 
               s.merek AS [Merek], 
               s.jenis AS [Jenis], 
               s.warna AS [Warna], 
               s.ukuran AS [Ukuran]
        FROM Sepatu s
        WHERE s.id_akun = @id_akun;
    END TRY
    BEGIN CATCH
        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO

  -- Update
CREATE PROCEDURE sp_UpdateSepatu
    @id_sepatu INT,
    @id_pelanggan CHAR(4),
    @merek VARCHAR(100),
    @jenis VARCHAR(50),
    @warna VARCHAR(50),
    @ukuran VARCHAR(5),
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Sepatu
        SET id_pelanggan = @id_pelanggan,
            merek = @merek,
            jenis = @jenis,
            warna = @warna,
            ukuran = @ukuran
        WHERE id_sepatu = @id_sepatu 
			AND id_akun = @id_akun;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO


  -- Delete
CREATE PROCEDURE sp_DeleteSepatu
    @id_sepatu INT,
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM Sepatu
        WHERE id_sepatu = @id_sepatu 
			AND id_akun = @id_akun;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO


					--== Transaksi ==--

  -- Tambah
CREATE PROCEDURE sp_CreateTransaksi
    @id_pelanggan CHAR(4),
    @id_sepatu INT,
    @total_harga DECIMAL(10,2),
    @status_transaksi VARCHAR(10),
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun)
        VALUES (@id_pelanggan, @id_sepatu, @total_harga, @status_transaksi, @id_akun);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO

 -- Ambil
CREATE PROCEDURE sp_ReadTransaksi
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        SELECT id_transaksi AS [ID Transaksi],
               id_pelanggan AS [ID Pelanggan],
               id_sepatu AS [ID Sepatu],
               total_harga AS [Total Harga],
               status_transaksi AS [Status]
        FROM Transaksi
        WHERE id_akun = @id_akun;
    END TRY
    BEGIN CATCH
        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO


  -- Update
CREATE PROCEDURE sp_UpdateTransaksi
    @id_transaksi INT,
    @id_pelanggan CHAR(4),
    @id_sepatu INT,
    @total_harga DECIMAL(10,2),
    @status_transaksi VARCHAR(10),
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Transaksi
        SET id_pelanggan = @id_pelanggan,
            id_sepatu = @id_sepatu,
            total_harga = @total_harga,
            status_transaksi = @status_transaksi
        WHERE id_transaksi = @id_transaksi
          AND id_akun = @id_akun;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO

  -- Delete
CREATE PROCEDURE sp_DeleteTransaksi
    @id_transaksi INT,
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM Transaksi
        WHERE id_transaksi = @id_transaksi
          AND id_akun = @id_akun;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO



					--== Barang_Konsumsi ==--

  -- Tambah
CREATE PROCEDURE sp_CreateBarangKonsumsi
    @nama_barang VARCHAR(100),
    @jumlah INT,
    @satuan VARCHAR(50),
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun)
        VALUES (@nama_barang, @jumlah, @satuan, @id_akun);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO

  -- Ambil
CREATE PROCEDURE sp_ReadBarangKonsumsi
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        SELECT id_barang   AS [ID Barang],
               nama_barang AS [Nama Barang],
               jumlah      AS [Jumlah],
               satuan      AS [Satuan]
        FROM Barang_Konsumsi
        WHERE id_akun = @id_akun;
    END TRY
    BEGIN CATCH
        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO

 -- Update
CREATE PROCEDURE sp_UpdateBarangKonsumsi
    @id_barang INT,
    @nama_barang VARCHAR(100),
    @jumlah INT,
    @satuan VARCHAR(50),
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Barang_Konsumsi
        SET nama_barang = @nama_barang,
            jumlah      = @jumlah,
            satuan      = @satuan
        WHERE id_barang = @id_barang
          AND id_akun   = @id_akun;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO

 -- Delete
CREATE PROCEDURE sp_DeleteBarangKonsumsi
    @id_barang INT,
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM Barang_Konsumsi
        WHERE id_barang = @id_barang
          AND id_akun   = @id_akun;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO


					--== Maintenance_Alat_Laundry ==--

  -- Tambah
CREATE PROCEDURE sp_CreateMaintenanceAlatLaundry
    @nama_alat           VARCHAR(100),
    @tanggal_maintenance DATE,
    @deskripsi           VARCHAR(100),
    @id_akun             INT
AS
BEGIN
    BEGIN TRY
        DECLARE @tanggal_dibuat DATE = CAST(GETDATE() AS DATE);

        -- Validasi tanggal maintenance
        IF @tanggal_maintenance < DATEADD(DAY, -1, @tanggal_dibuat) OR @tanggal_maintenance > @tanggal_dibuat
        BEGIN
            RAISERROR('Tanggal Maintenance hanya boleh hari ini atau sehari sebelumnya!', 16, 1);
            RETURN;
        END;

        BEGIN TRANSACTION;

        INSERT INTO Maintenance_Alat_Laundry
            (nama_alat, tanggal_maintenance, deskripsi, id_akun, tanggal_dibuat)
        VALUES
            (@nama_alat, @tanggal_maintenance, @deskripsi, @id_akun, @tanggal_dibuat);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_MESSAGE() AS ErrorMessage;
        THROW;
    END CATCH
END
GO

  -- Ambil
CREATE PROCEDURE sp_ReadMaintenanceAlatLaundry
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        SELECT id_maintenance AS [ID Alat],
               nama_alat AS [Nama Alat],
               tanggal_maintenance AS [Tanggal],
               deskripsi AS [Deskripsi],
               tanggal_dibuat AS [Dibuat Pada]
        FROM Maintenance_Alat_Laundry
        WHERE id_akun = @id_akun;
    END TRY
    BEGIN CATCH
        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO


  -- Update
CREATE PROCEDURE sp_UpdateMaintenanceAlatLaundry
    @id_maintenance      INT,
    @nama_alat           VARCHAR(100),
    @tanggal_maintenance DATE,
    @deskripsi           VARCHAR(100),
    @id_akun             INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Maintenance_Alat_Laundry
        SET
            nama_alat           = @nama_alat,
            tanggal_maintenance = @tanggal_maintenance,
            deskripsi           = @deskripsi
        WHERE
            id_maintenance = @id_maintenance
            AND id_akun    = @id_akun;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO


  -- Delete
CREATE PROCEDURE sp_DeleteMaintenanceAlatLaundry
    @id_maintenance INT,
    @id_akun        INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM Maintenance_Alat_Laundry
        WHERE
            id_maintenance = @id_maintenance
            AND id_akun    = @id_akun;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END
GO

					--== View ==--

CREATE PROCEDURE sp_ReadViewTransaksi
@id_akun INT
AS
BEGIN
    BEGIN TRY
        SELECT 
        id_transaksi,
        username,
        nama_pelanggan,
        merek_sepatu,
        tanggal_transaksi,
        total_harga,
        status_transaksi
    FROM vw_TransaksiDetail
    WHERE id_akun = @id_akun;
    END TRY
    BEGIN CATCH
        SELECT
            ERROR_NUMBER()    AS ErrorNumber,
            ERROR_SEVERITY()  AS Severity,
            ERROR_STATE()     AS State,
            ERROR_PROCEDURE() AS ProcedureName,
            ERROR_LINE()      AS LineNumber,
            ERROR_MESSAGE()   AS ErrorMessage;
		THROW; 
    END CATCH
END
GO

					--== Database Owner Stored Procedure ==--

  -- Ensure Read Update Delete Index
CREATE PROCEDURE dbo.sp_EnsureRUDIndexes
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        --------------------------------------------------------
        -- Pelanggan
        --------------------------------------------------------
        IF NOT EXISTS (
            SELECT 1 
            FROM sys.indexes 
            WHERE name = 'idx_Pelanggan_RUD'
              AND object_id = OBJECT_ID('dbo.Pelanggan')
        )
        BEGIN
            CREATE NONCLUSTERED INDEX idx_Pelanggan_RUD
            ON dbo.Pelanggan(id_akun, id_pelanggan)
            INCLUDE(nama, no_hp, alamat);
            PRINT 'Created idx_Pelanggan_RUD';
        END
        ELSE
            PRINT 'idx_Pelanggan_RUD sudah ada.';

        --------------------------------------------------------
        -- Sepatu
        --------------------------------------------------------
        IF NOT EXISTS (
            SELECT 1 
            FROM sys.indexes 
            WHERE name = 'idx_Sepatu_RUD'
              AND object_id = OBJECT_ID('dbo.Sepatu')
        )
        BEGIN
            CREATE NONCLUSTERED INDEX idx_Sepatu_RUD
            ON dbo.Sepatu(id_akun, id_pelanggan)
            INCLUDE(id_sepatu, merek, jenis, warna, ukuran);
            PRINT 'Created idx_Sepatu_RUD';
        END
        ELSE
            PRINT 'idx_Sepatu_RUD sudah ada.';

        --------------------------------------------------------
        -- Transaksi
        --------------------------------------------------------
        IF NOT EXISTS (
            SELECT 1
            FROM sys.indexes
            WHERE name = 'idx_Transaksi_RUD'
              AND object_id = OBJECT_ID('dbo.Transaksi')
        )
        BEGIN
            CREATE NONCLUSTERED INDEX idx_Transaksi_RUD
            ON dbo.Transaksi(id_akun, id_pelanggan, id_sepatu)
            INCLUDE(tanggal_transaksi, total_harga, status_transaksi);
            PRINT 'Created idx_Transaksi_RUD';
        END
        ELSE
            PRINT 'idx_Transaksi_RUD sudah ada.';

        --------------------------------------------------------
        -- Barang_Konsumsi
        --------------------------------------------------------
        IF NOT EXISTS (
            SELECT 1
            FROM sys.indexes
            WHERE name = 'idx_BarangKonsumsi_RUD'
              AND object_id = OBJECT_ID('dbo.Barang_Konsumsi')
        )
        BEGIN
            CREATE NONCLUSTERED INDEX idx_BarangKonsumsi_RUD
            ON dbo.Barang_Konsumsi(id_akun)
            INCLUDE(id_barang, nama_barang, jumlah, satuan);
            PRINT 'Created idx_BarangKonsumsi_RUD';
        END
        ELSE
            PRINT 'idx_BarangKonsumsi_RUD sudah ada.';

        --------------------------------------------------------
        -- Maintenance_Alat_Laundry
        --------------------------------------------------------
        IF NOT EXISTS (
            SELECT 1
            FROM sys.indexes
            WHERE name = 'idx_MaintenanceAlatLaundry_RUD'
              AND object_id = OBJECT_ID('dbo.Maintenance_Alat_Laundry')
        )
        BEGIN
            CREATE NONCLUSTERED INDEX idx_MaintenanceAlatLaundry_RUD
            ON dbo.Maintenance_Alat_Laundry(id_akun, id_maintenance)
            INCLUDE(nama_alat, tanggal_maintenance, deskripsi);
            PRINT 'Created idx_MaintenanceAlatLaundry_RUD';
        END
        ELSE
            PRINT 'idx_MaintenanceAlatLaundry_RUD sudah ada.';

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT
            ERROR_NUMBER()    AS ErrorNumber,
            ERROR_SEVERITY()  AS Severity,
            ERROR_STATE()     AS State,
            ERROR_PROCEDURE() AS ProcedureName,
            ERROR_LINE()      AS LineNumber,
            ERROR_MESSAGE()   AS ErrorMessage;
		THROW;
    END CATCH
END;
GO

CREATE PROCEDURE dbo.sp_Analyze_ReadViewTransaksi
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        SET STATISTICS IO ON;
        SET STATISTICS TIME ON;

        EXEC dbo.sp_ReadViewTransaksi @id_akun = @id_akun;

        SET STATISTICS IO OFF;
        SET STATISTICS TIME OFF;
    END TRY
    BEGIN CATCH
        SET STATISTICS IO OFF;
        SET STATISTICS TIME OFF;
        THROW;
    END CATCH
END;
GO

                    --== Search ==--

  -- Pelanggan
CREATE PROCEDURE sp_SearchPelanggan
    @id_akun   INT,
    @keyword   NVARCHAR(100) = NULL
AS
BEGIN
    BEGIN TRY
        DECLARE @kw NVARCHAR(110) = 
            CASE 
                WHEN @keyword IS NULL OR LTRIM(RTRIM(@keyword)) = '' 
                    THEN '%'
                ELSE '%' + REPLACE(@keyword, '''', '''''') + '%'
            END;

        SELECT 
            id_pelanggan AS [ID Pelanggan],
            nama          AS [Nama],
            no_hp         AS [No HP],
            alamat        AS [Alamat]
        FROM Pelanggan
        WHERE 
            id_akun = @id_akun
            AND (
                id_pelanggan LIKE @kw
                OR nama         LIKE @kw
                OR no_hp        LIKE @kw
                OR ISNULL(alamat, '') LIKE @kw
            );
    END TRY
    BEGIN CATCH
        SELECT 
            ERROR_NUMBER()    AS ErrorNumber,
            ERROR_MESSAGE()   AS ErrorMessage;
        THROW;
    END CATCH
END
GO

  -- Sepatu
CREATE PROCEDURE sp_SearchSepatu
    @id_akun   INT,
    @keyword   NVARCHAR(100) = NULL
AS
BEGIN
    BEGIN TRY
        DECLARE @kw NVARCHAR(110) =
            CASE
                WHEN @keyword IS NULL OR LTRIM(RTRIM(@keyword)) = ''
                    THEN '%'
                ELSE '%' + REPLACE(@keyword, '''', '''''') + '%'
            END;

        SELECT
            s.id_sepatu    AS [ID Sepatu],
            s.id_pelanggan AS [ID Pelanggan],
            s.merek        AS [Merek],
            s.jenis        AS [Jenis],
            s.warna        AS [Warna],
            s.ukuran       AS [Ukuran]
        FROM Sepatu s
        WHERE
            s.id_akun = @id_akun
            AND (
                CAST(s.id_sepatu AS NVARCHAR(10)) LIKE @kw
                OR s.id_pelanggan LIKE @kw
                OR s.merek       LIKE @kw
                OR s.jenis       LIKE @kw
                OR s.warna       LIKE @kw
                OR s.ukuran      LIKE @kw
            );
    END TRY
    BEGIN CATCH
        SELECT 
            ERROR_NUMBER()  AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage;
        THROW;
    END CATCH
END
GO

  -- Transaksi
CREATE PROCEDURE sp_SearchTransaksi
    @id_akun   INT,
    @keyword   NVARCHAR(100) = NULL
AS
BEGIN
    BEGIN TRY
        DECLARE @kw NVARCHAR(110) =
            CASE 
                WHEN @keyword IS NULL OR LTRIM(RTRIM(@keyword)) = ''
                    THEN '%'
                ELSE '%' + REPLACE(@keyword, '''', '''''') + '%'
            END;

        SELECT
            t.id_transaksi      AS [ID Transaksi],
            t.id_pelanggan      AS [ID Pelanggan],
            t.id_sepatu         AS [ID Sepatu],
            CONVERT(VARCHAR(19), t.tanggal_transaksi, 120) AS [Tanggal],
            t.total_harga       AS [Total Harga],
            t.status_transaksi  AS [Status]
        FROM Transaksi t
        WHERE
            t.id_akun = @id_akun
            AND (
                CAST(t.id_transaksi AS NVARCHAR(10)) LIKE @kw
                OR t.id_pelanggan   LIKE @kw
                OR CAST(t.id_sepatu AS NVARCHAR(10)) LIKE @kw
                OR CONVERT(VARCHAR(19), t.tanggal_transaksi, 120) LIKE @kw
                OR CAST(t.total_harga AS NVARCHAR(20)) LIKE @kw
                OR t.status_transaksi  LIKE @kw
            );
    END TRY
    BEGIN CATCH
        SELECT 
            ERROR_NUMBER()  AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage;
        THROW;
    END CATCH
END
GO

  -- Barang Konsumsi
CREATE PROCEDURE sp_SearchBarangKonsumsi
    @id_akun   INT,
    @keyword   NVARCHAR(100) = NULL
AS
BEGIN
    BEGIN TRY
        DECLARE @kw NVARCHAR(110) =
            CASE 
                WHEN @keyword IS NULL OR LTRIM(RTRIM(@keyword)) = ''
                    THEN '%'
                ELSE '%' + REPLACE(@keyword, '''', '''''') + '%'
            END;

        SELECT
            b.id_barang   AS [ID Barang],
            b.nama_barang AS [Nama Barang],
            b.jumlah      AS [Jumlah],
            b.satuan      AS [Satuan]
        FROM Barang_Konsumsi b
        WHERE
            b.id_akun = @id_akun
            AND (
                CAST(b.id_barang   AS NVARCHAR(10)) LIKE @kw
                OR b.nama_barang LIKE @kw
                OR CAST(b.jumlah      AS NVARCHAR(10)) LIKE @kw
                OR ISNULL(b.satuan, '') LIKE @kw
            );
    END TRY
    BEGIN CATCH
        SELECT 
            ERROR_NUMBER()  AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage;
        THROW;
    END CATCH
END
GO

  -- Maintenance Alat Laundry
CREATE PROCEDURE sp_SearchMaintenanceAlatLaundry
    @id_akun   INT,
    @keyword   NVARCHAR(100) = NULL
AS
BEGIN
    BEGIN TRY
        DECLARE @kw NVARCHAR(110) =
            CASE
                WHEN @keyword IS NULL OR LTRIM(RTRIM(@keyword)) = ''
                    THEN '%'
                ELSE '%' + @keyword + '%'
            END;

        SELECT
            m.id_maintenance      AS [ID Alat],
            m.nama_alat           AS [Nama Alat],
            m.tanggal_maintenance AS [Tanggal],
            ISNULL(m.deskripsi, '') AS [Deskripsi]
        FROM Maintenance_Alat_Laundry m
        WHERE
            m.id_akun = @id_akun
            AND (
                CAST(m.id_maintenance     AS NVARCHAR(10)) LIKE @kw
                OR m.nama_alat            LIKE @kw
                OR FORMAT(m.tanggal_maintenance, 'dd/MM/yyyy') LIKE @kw
                OR ISNULL(m.deskripsi, '') LIKE @kw
            );
    END TRY
    BEGIN CATCH
        SELECT
            ERROR_NUMBER()  AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage;
        THROW;
    END CATCH
END
GO



					--==============--
					--== Indexing ==--
					--==============--


  -- (sudah include read, update, delete karena pakai composite index)
  -- Pelanggan 
IF NOT EXISTS (
    SELECT 1 
    FROM sys.indexes 
    WHERE name = 'idx_Pelanggan_RUD'
      AND object_id = OBJECT_ID('dbo.Pelanggan')
)
BEGIN
    CREATE NONCLUSTERED INDEX idx_Pelanggan_RUD
    ON dbo.Pelanggan(id_akun, id_pelanggan)
    INCLUDE(nama, no_hp, alamat);
    PRINT 'Created idx_Pelanggan_RUD';
END
ELSE
    PRINT 'idx_Pelanggan_RUD sudah ada.';
GO

  -- Sepatu
IF NOT EXISTS (
    SELECT 1 
    FROM sys.indexes 
    WHERE name = 'idx_Sepatu_RUD'
      AND object_id = OBJECT_ID('dbo.Sepatu')
)
BEGIN
    CREATE NONCLUSTERED INDEX idx_Sepatu_RUD
    ON dbo.Sepatu(id_akun, id_pelanggan)
    INCLUDE(id_sepatu, merek, jenis, warna, ukuran);
    PRINT 'Created idx_Sepatu_RUD';
END
ELSE
    PRINT 'idx_Sepatu_RUD sudah ada.';
GO

  -- Transaksi
IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = 'idx_Transaksi_RUD'
      AND object_id = OBJECT_ID('dbo.Transaksi')
)
BEGIN
    CREATE NONCLUSTERED INDEX idx_Transaksi_RUD
    ON dbo.Transaksi(id_akun, id_pelanggan, id_sepatu)
    INCLUDE(tanggal_transaksi, total_harga, status_transaksi);
    PRINT 'Created idx_Transaksi_RUD';
END
ELSE
    PRINT 'idx_Transaksi_RUD sudah ada.';
GO

  -- Barang_Konsumsi
IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = 'idx_BarangKonsumsi_RUD'
      AND object_id = OBJECT_ID('dbo.Barang_Konsumsi')
)
BEGIN
    CREATE NONCLUSTERED INDEX idx_BarangKonsumsi_RUD
    ON dbo.Barang_Konsumsi(id_akun)
    INCLUDE(id_barang, nama_barang, jumlah, satuan);
    PRINT 'Created idx_BarangKonsumsi_RUD';
END
ELSE
    PRINT 'idx_BarangKonsumsi_RUD sudah ada.';
GO

  -- Maintenance_Alat_Laundry
IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = 'idx_MaintenanceAlatLaundry_RUD'
      AND object_id = OBJECT_ID('dbo.Maintenance_Alat_Laundry')
)
BEGIN
    CREATE NONCLUSTERED INDEX idx_MaintenanceAlatLaundry_RUD
    ON dbo.Maintenance_Alat_Laundry(id_akun, id_maintenance)
    INCLUDE(nama_alat, tanggal_maintenance, deskripsi);
    PRINT 'Created idx_MaintenanceAlatLaundry_RUD';
END
ELSE
    PRINT 'idx_MaintenanceAlatLaundry_RUD sudah ada.';
GO


					--======================--
					--== Backup & Restore ==--
					--======================--

					--== Stored Procedure ==--

  -- Backup
CREATE PROCEDURE sp_BackupDatabase
	@BackupPath NVARCHAR(260)
AS
BEGIN
	BACKUP DATABASE manajemenLaundrySepatu
	TO DISK = @BackupPath
	WITH INIT, NAME = 'Full Backup';
END;
GO

  -- Restore (di database master)
USE master;
GO
CREATE OR ALTER PROCEDURE sp_RestoreDatabase
	@BackupPath NVARCHAR(260)
AS
BEGIN
	ALTER DATABASE manajemenLaundrySepatu SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	RESTORE DATABASE manajemenLaundrySepatu
	FROM DISK = @BackupPath
	WITH REPLACE;
	ALTER DATABASE manajemenLaundrySepatu SET MULTI_USER;
END;
GO
USE manajemenLaundrySepatu;
GO

					--==========--
					--== View ==--
					--==========--

CREATE VIEW vw_TransaksiDetail
AS
SELECT 
    t.id_transaksi,
    a.username,
    t.id_akun,
    p.nama AS nama_pelanggan,
    s.merek AS merek_sepatu,
    t.tanggal_transaksi,
    t.total_harga,
    t.status_transaksi
FROM Transaksi t
JOIN Pelanggan p ON t.id_pelanggan = p.id_pelanggan
JOIN Sepatu s ON t.id_sepatu = s.id_sepatu
JOIN Akun a ON t.id_akun = a.id;
GO
