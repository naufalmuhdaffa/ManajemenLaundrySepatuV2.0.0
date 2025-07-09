					--=======================================--
					--== Database Manajemen Laundry Sepatu ==--
					--=======================================--

CREATE DATABASE manajemenLaundrySepatu;

USE manajemenLaundrySepatu;



					--===========--
					--== Tabel ==--
					--===========--

  -- Akun --
CREATE TABLE Akun (
	id int identity(1,1) primary key,
	username varchar(50) not null unique,
	password_hash varchar(255) not null,
);

  -- Tabel Pelanggan --
CREATE TABLE Pelanggan (
    id_pelanggan CHAR(4) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    no_hp VARCHAR(13) NOT NULL,
    alamat VARCHAR(100),
	CONSTRAINT check_no_hp 
	CHECK (
	no_hp LIKE '08%' AND LEN(no_hp) BETWEEN 10 AND 13
	)
);

  -- Tabel Sepatu --
CREATE TABLE Sepatu (
	id_sepatu INT IDENTITY(1,1) primary key,
	id_pelanggan CHAR(4) NOT NULL,
    merek VARCHAR(100),
    jenis VARCHAR(50),
    warna VARCHAR(50),
    ukuran VARCHAR(5),
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan)
);

  -- Tabel Transaksi --
CREATE TABLE Transaksi (
    id_transaksi INT IDENTITY(1,1) PRIMARY KEY,
    id_pelanggan CHAR(4) NOT NULL,
    id_sepatu INT NOT NULL,
    tanggal_transaksi DATETIME DEFAULT GETDATE() NOT NULL,
    total_harga DECIMAL(10,2) NOT NULL,
    status VARCHAR(10) CHECK (status IN ('Proses', 'Selesai', 'Dibatalkan')),
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan),
    FOREIGN KEY (id_sepatu) REFERENCES Sepatu(id_sepatu)
);

  -- Barang Konsumsi --
CREATE TABLE Barang_Konsumsi (
    id_barang INT IDENTITY(1,1) PRIMARY KEY,
    nama_barang VARCHAR(100) NOT NULL,
    jumlah INT NOT NULL,
    satuan VARCHAR(50)
);

  -- Maintenance Alat Laundry --
CREATE TABLE Maintenance_Alat_Laundry (
    id_maintenance INT IDENTITY(1,1) PRIMARY KEY,
    nama_alat VARCHAR(100) NOT NULL,
    tanggal_maintenance DATE NOT NULL,
    deskripsi VARCHAR(100)
);



					--===========--
					--== ALTER ==--
					--===========--

					--== Tabel Pelanggan ==--

  -- Periksa Constraint Sebelum Alter --
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Pelanggan';

  -- Tambah Constraint: "id_pelanggan" harus: 
  -- 1. Angka
  -- 2. Panjang karakter tepat 3 digit --
ALTER TABLE Pelanggan
ADD CONSTRAINT check_id_pelanggan 
CHECK (
    id_pelanggan NOT LIKE '%[^0-9]%' AND LEN(id_pelanggan) = 4
);

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

  -- Hapus Constraint: "no_hp" --
ALTER TABLE Pelanggan 
DROP CONSTRAINT check_no_hp;

  -- Tambah Constraint: "no_hp" harus: 
  -- 1. Unik --
ALTER TABLE Pelanggan
ADD CONSTRAINT uq_no_hp UNIQUE (no_hp);

  -- Tambah Constraint: "no_hp" harus: 
  -- 1. Dimulai dengan '08'
  -- 2. Karakter berjumlah antara 10 - 13
  -- 3. Berupa Angka --
ALTER TABLE Pelanggan
ADD CONSTRAINT check_no_hp 
CHECK (
    no_hp LIKE '08%' AND LEN(no_hp) BETWEEN 10 AND 13 AND no_hp NOT LIKE '%[^0-9]%'
);

  -- Tambah Foreign Key: "id_akun" --
ALTER TABLE Pelanggan
ADD id_akun INT NOT NULL
    FOREIGN KEY REFERENCES Akun(id);


					--== Tabel Sepatu ==--

  -- Periksa Constraint Sebelum Alter --
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Sepatu';

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

  -- Tambah Constraint: "warna" hanya bisa pakai: 
  -- 1. Huruf abjad (kapital/non-kapital)
  -- 2. Tanda hubung/setrip
  -- 3. Spasi
ALTER TABLE Sepatu
ADD CONSTRAINT CK_Sepatu_Warna
CHECK (
    warna NOT LIKE '%[^a-zA-Z- ]%'
);

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

  -- Tambah Foreign Key: "id_akun" --
ALTER TABLE Sepatu
ADD id_akun INT NOT NULL
    FOREIGN KEY REFERENCES Akun(id);


        -- Foreign Key Cascade --
ALTER TABLE Sepatu
DROP CONSTRAINT FK__Sepatu__id_pelan__18EBB532;

ALTER TABLE Sepatu
  ADD CONSTRAINT FK_Sepatu_Pelanggan
    FOREIGN KEY (id_pelanggan)
    REFERENCES Pelanggan(id_pelanggan)
    ON DELETE CASCADE;


					--== Tabel Transaksi ==--

  -- Periksa Constraint Sebelum Alter --
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Transaksi';

SELECT name 
FROM sys.check_constraints 
WHERE parent_object_id = OBJECT_ID('Transaksi');

ALTER TABLE Transaksi
DROP CONSTRAINT CK__Transaksi__statu__1CBC4616;


  -- Menjalankan system stored procedure 
  -- untuk mengubah nama kolom status menjadi status_transaksi
  -- pada tabel Transaksi --
EXEC sp_rename 
'Transaksi.status', 'status_transaksi', 'COLUMN';


  -- Tambah Constraint: "status_transaksi" hanya bisa pakai: 
  -- 1. Salah satu dari nilai yg sudah ditetapkan:
  -- 'Proses', 'Selesai', 'Dibatalkan' --
ALTER TABLE Transaksi
ADD CONSTRAINT check_Transaksi_status_transaksi
CHECK (
	status_transaksi IN ('Proses', 'Selesai', 'Dibatalkan')
);

  -- Mengubah "status_transaksi" menjadi NOT NULL --
ALTER TABLE Transaksi
ALTER COLUMN status_transaksi VARCHAR(10) NOT NULL;

  -- Tambah Constraint: "total_harga" harus: 
  -- 1. Lebih dari atau sama dengan 0 nilainya (tidak boleh negatif) --
ALTER TABLE Transaksi
ADD CONSTRAINT check_total_harga 
CHECK (
	total_harga >= 0
);

  -- Tambah Foreign Key: "id_akun" --
ALTER TABLE Transaksi
ADD id_akun INT NOT NULL
    FOREIGN KEY REFERENCES Akun(id);


    -- Foreign Key Cascade --
ALTER TABLE Transaksi
DROP CONSTRAINT FK__Transaksi__id_pe__1DB06A4F;

ALTER TABLE Transaksi
DROP CONSTRAINT FK__Transaksi__id_se__1EA48E88;

ALTER TABLE Transaksi
ADD CONSTRAINT FK_Transaksi_Sepatu
  FOREIGN KEY (id_sepatu)
  REFERENCES Sepatu(id_sepatu)
  ON DELETE CASCADE;



					--== Tabel Barang_Konsumsi ==--

  -- Periksa Constraint Sebelum Alter --
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Barang_Konsumsi';

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

  -- Tambah Constraint: "jumlah" harus: 
  -- 1. Lebih dari atau sama dengan 0 nilainya (tidak boleh negatif) --
ALTER TABLE Barang_Konsumsi
ADD CONSTRAINT check_jumlah_barang_konsumsi 
CHECK (
	jumlah >= 0
);

  -- Tambah Constraint: "satuan" hanya bisa pakai: 
  -- 1. Huruf abjad (kapital/non-kapital)
  -- 2. Spasi
ALTER TABLE Barang_Konsumsi
ADD CONSTRAINT check_satuan_barang_konsumsi
CHECK (
    satuan NOT LIKE '%[^A-Za-z ]%'
);

  -- Tambah Foreign Key: "id_akun" --
ALTER TABLE Barang_Konsumsi
ADD id_akun INT NOT NULL
    FOREIGN KEY REFERENCES Akun(id);

					--== Tabel Maintenance_Alat_Laundry ==--

  -- Periksa Constraint Sebelum Alter --
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Maintenance_Alat_Laundry';

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

  -- Tambah Kolom Baru: "tanggal_dibuat" --
ALTER TABLE Maintenance_Alat_Laundry
ADD tanggal_dibuat 
DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE);

ALTER TABLE Maintenance_Alat_Laundry
ADD CONSTRAINT df_deskripsi_default DEFAULT '' FOR deskripsi;

  -- Tambah Foreign Key: "id_akun" --
ALTER TABLE Maintenance_Alat_Laundry
ADD id_akun INT NOT NULL
	FOREIGN KEY REFERENCES Akun(id);

					--== Tabel Akun ==--

  -- Periksa Constraint Sebelum Alter --
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Akun';

  -- Tambah Kolom Baru: 
  -- 1. FailedLoginAttempts
  -- 2. LockoutEnd --
ALTER TABLE Akun
ADD FailedLoginAttempts INT NOT NULL DEFAULT 0,
    LockoutEnd DATETIME NULL;

  -- Hapus Constraint: "username" --
ALTER TABLE Akun
DROP CONSTRAINT UQ__Akun__F3DBC57281A2E157;

  -- Ubah "Username" jadi Case-Sensitive --
ALTER TABLE Akun
ALTER COLUMN username 
VARCHAR(50) COLLATE Latin1_General_CS_AS NOT NULL;

  -- Tambah Constraint: "username" harus: 
  -- 1. Unik --
ALTER TABLE Akun
ADD CONSTRAINT UQ_Akun_Username 
UNIQUE (
	username
);



					--=============--
					--== Trigger ==--
					--=============--

-- Trigger setelah delete di Pelanggan
CREATE TRIGGER trg_AfterDeletePelanggan
ON Pelanggan
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

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
    SET NOCOUNT ON;

    -- Hapus Transaksi yang berelasi
    DELETE t
    FROM Transaksi t
    WHERE t.id_sepatu IN (SELECT id_sepatu FROM deleted);
END;
GO


  -- Maintenance_Alat_Laundry --
CREATE TRIGGER trg_ValidasiUpdateMaintenance
ON Maintenance_Alat_Laundry
AFTER UPDATE
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

    UPDATE m
    SET
        m.nama_alat = i.nama_alat,
        m.tanggal_maintenance = i.tanggal_maintenance,
        m.deskripsi = i.deskripsi
    FROM Maintenance_Alat_Laundry m
    JOIN inserted i ON m.id_maintenance = i.id_maintenance
	WHERE m.id_akun = i.id_akun;
END;



					--==============================--
					--== DataBase Console Command ==--
					--==============================--

  -- Cek Nilai Identity Sekarang --
DBCC CHECKIDENT ('Sepatu');
DBCC CHECKIDENT ('Transaksi');
DBCC CHECKIDENT ('Barang_Konsumsi');
DBCC CHECKIDENT ('Maintenance_Alat_Laundry');
DBCC CHECKIDENT ('Akun');

  -- Atur Ulang Nilai Identity --
DBCC CHECKIDENT ('Sepatu', RESEED, 1);
DBCC CHECKIDENT ('Transaksi', RESEED, 1);
DBCC CHECKIDENT ('Barang_Konsumsi', RESEED, 1);
DBCC CHECKIDENT ('Maintenance_Alat_Laundry', RESEED, 1);
DBCC CHECKIDENT ('Akun', RESEED, 1);


					--===================--
					--== Periksa Tabel ==--
					--===================--

  -- Pelanggan
SELECT nama FROM Pelanggan;
DELETE FROM Pelanggan;

  -- Sepatu
SELECT * FROM Sepatu;
DELETE FROM Sepatu;

  -- Transaksi
SELECT * FROM Transaksi;
DELETE FROM Transaksi;

  -- Barang_Konsumsi
SELECT * FROM Barang_Konsumsi;
DELETE FROM Barang_Konsumsi;

  -- Maintenance_Alat_Laundry
SELECT * FROM Maintenance_Alat_Laundry;
DELETE FROM Maintenance_Alat_Laundry;

  -- Akun
SELECT * FROM Akun;
DELETE FROM Akun;

exec sp_helpindex 'Transaksi';

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

  -- Ambil
CREATE PROCEDURE sp_ReadMaintenanceAlatLaundry
    @id_akun INT
AS
BEGIN
    BEGIN TRY
        SELECT id_maintenance AS [ID Alat],
               nama_alat AS [Nama Alat],
               tanggal_maintenance AS [Tanggal],
               deskripsi AS [Deskripsi]
        FROM Maintenance_Alat_Laundry
        WHERE id_akun = @id_akun;
    END TRY
    BEGIN CATCH
        SELECT ERROR_NUMBER() AS ErrorNumber,
               ERROR_MESSAGE() AS ErrorMessage;
		THROW; 
    END CATCH
END


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



					--==============--
					--== Indexing ==--
					--==============--

  -- Cek Index
EXEC sp_helpindex 'Transaksi';

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


SELECT 
    OBJECT_NAME(ius.object_id) AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType,
    ius.user_seeks,
    ius.user_scans,
    ius.user_lookups,
    ius.user_updates,
    ius.last_user_seek,
    ius.last_user_scan
FROM sys.dm_db_index_usage_stats ius
JOIN sys.indexes i ON i.object_id = ius.object_id AND i.index_id = ius.index_id
WHERE ius.database_id = DB_ID('manajemenLaundrySepatu')
ORDER BY ius.user_seeks DESC;


SET SHOWPLAN_TEXT ON;
EXEC sp_ReadViewTransaksi @id_akun = 1;
SET SHOWPLAN_TEXT OFF;



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

  -- Restore (di database master)
CREATE PROCEDURE sp_RestoreDatabase
	@BackupPath NVARCHAR(260)
AS
BEGIN
	ALTER DATABASE manajemenLaundrySepatu SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	RESTORE DATABASE manajemenLaundrySepatu
	FROM DISK = @BackupPath
	WITH REPLACE;
	ALTER DATABASE manajemenLaundrySepatu SET MULTI_USER;
END;

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

SELECT * FROM vw_TransaksiDetail;




            --=======================--
            --== Insert Data Dummy ==--
            --=======================--

            --== 1-50 ==--

-- Insert Pelanggan
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0001', 'Citra Setiawan', '0880668264', 'Jl. Gatot Subroto No.178', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0002', 'Citra Saputra', '08198745781', 'Jl. Gatot Subroto No.157', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0003', 'Fajar Rahma', '0828880128', 'Jl. Thamrin No.190', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0004', 'Deni Halim', '08127808930', 'Jl. Gatot Subroto No.71', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0005', 'Citra Wijaya', '08978919536', 'Jl. Gatot Subroto No.176', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0006', 'Andi Saputra', '08729444331', 'Jl. Sudirman No.113', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0007', 'Intan Setiawan', '08669145371', 'Jl. Merdeka No.41', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0008', 'Gita Permana', '08512889976', 'Jl. Gatot Subroto No.140', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0009', 'Gita Setiawan', '08387378434', 'Jl. Thamrin No.144', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0010', 'Andi Santoso', '08994895116', 'Jl. Sudirman No.150', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('00011', 'Joko Permana', '08416070897', 'Jl. Sudirman No.67', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0012', 'Eka Permana', '08313042526', 'Jl. Sudirman No.36', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0013', 'Budi Nugroho', '08117359672', 'Jl. Diponegoro No.16', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0014', 'Deni Nugroho', '08243354951', 'Jl. Sudirman No.103', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0015', 'Andi Saputra', '08993665235', 'Jl. Merdeka No.191', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0016', 'Hendra Halim', '0879363444', 'Jl. Diponegoro No.41', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0017', 'Fajar Setiawan', '0817280825', 'Jl. Merdeka No.131', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0018', 'Budi Pratama', '0819755714', 'Jl. Sudirman No.137', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0019', 'Eka Setiawan', '08724512914', 'Jl. Diponegoro No.107', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0020', 'Citra Saputra', '08605462446', 'Jl. Diponegoro No.94', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0021', 'Andi Santoso', '0837276068', 'Jl. Sudirman No.60', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0022', 'Andi Wijaya', '08809012028', 'Jl. Gatot Subroto No.121', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0023', 'Citra Pratama', '0852653591', 'Jl. Diponegoro No.115', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0024', 'Joko Setiawan', '08198221148', 'Jl. Diponegoro No.99', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0025', 'Intan Kusuma', '0891095910', 'Jl. Gatot Subroto No.115', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0026', 'Gita Santoso', '08647952019', 'Jl. Sudirman No.156', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0027', 'Andi Santoso', '08728780189', 'Jl. Gatot Subroto No.131', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0028', 'Joko Halim', '08119453616', 'Jl. Merdeka No.128', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0029', 'Andi Halim', '08344470444', 'Jl. Gatot Subroto No.183', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0030', 'Budi Halim', '08168291531', 'Jl. Thamrin No.11', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0031', 'Gita Halim', '08945719406', 'Jl. Thamrin No.176', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0032', 'Gita Nugroho', '08921032444', 'Jl. Diponegoro No.92', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0033', 'Andi Halim', '08535552539', 'Jl. Thamrin No.11', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0034', 'Eka Permana', '08836900357', 'Jl. Diponegoro No.106', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0035', 'Deni Santoso', '08971705924', 'Jl. Diponegoro No.44', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0036', 'Deni Wijaya', '08195984826', 'Jl. Thamrin No.102', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0037', 'Andi Halim', '08619833597', 'Jl. Gatot Subroto No.33', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0038', 'Hendra Wijaya', '08837463274', 'Jl. Diponegoro No.45', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0039', 'Gita Santoso', '08573405431', 'Jl. Gatot Subroto No.127', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0040', 'Intan Wijaya', '0893773770', 'Jl. Gatot Subroto No.119', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0041', 'Andi Halim', '08467914259', 'Jl. Merdeka No.112', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0042', 'Gita Nugroho', '08631726033', 'Jl. Sudirman No.108', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0043', 'Budi Setiawan', '0819602138', 'Jl. Merdeka No.79', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0044', 'Joko Saputra', '08899218509', 'Jl. Sudirman No.96', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0045', 'Andi Nugroho', '08126109187', 'Jl. Diponegoro No.198', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0046', 'Deni Permana', '08806874385', 'Jl. Sudirman No.128', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0047', 'Budi Wijaya', '0831239330', 'Jl. Thamrin No.70', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0048', 'Hendra Wijaya', '08238077334', 'Jl. Merdeka No.160', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0049', 'Andi Saputra', '0862602186', 'Jl. Sudirman No.101', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0050', 'Fajar Permana', '0851851850', 'Jl. Thamrin No.19', 1);

-- Insert Sepatu
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0011', 'Reebok', 'Sandals', 'Hijau', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0003', 'Nike', 'Sandals', 'Hijau', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0005', 'Nike', 'Boots', 'Putih', 'L', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0021', 'Nike', 'Boots', 'Hijau', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0024', 'Adidas', 'Loafers', 'Biru', 'S', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0012', 'Adidas', 'Heels', 'Biru', '42', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0039', 'Vans', 'Heels', 'Putih', '38', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0006', 'Puma', 'Heels', 'Hijau', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0037', 'Nike', 'Sandals', 'Putih', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0022', 'Nike', 'Boots', 'Biru', '41', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0033', 'Adidas', 'Loafers', 'Putih', 'M', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0041', 'Vans', 'Heels', 'Hitam', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0039', 'Puma', 'Heels', 'Hitam', '38', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0042', 'Adidas', 'Heels', 'Merah', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0038', 'Nike', 'Sneakers', 'Hijau', 'S', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0050', 'Adidas', 'Boots', 'Biru', '41', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0025', 'Nike', 'Loafers', 'Hitam', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0038', 'Vans', 'Boots', 'Merah', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0001', 'Vans', 'Sandals', 'Merah', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0002', 'Reebok', 'Loafers', 'Putih', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0031', 'Nike', 'Sandals', 'Merah', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0029', 'Puma', 'Sandals', 'Hitam', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0002', 'Adidas', 'Heels', 'Merah', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0014', 'Vans', 'Loafers', 'Hijau', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0016', 'Nike', 'Heels', 'Putih', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0040', 'Nike', 'Heels', 'Biru', '40', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0042', 'Vans', 'Heels', 'Merah', '40', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0017', 'Puma', 'Sneakers', 'Hijau', '42', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0031', 'Nike', 'Heels', 'Putih', '40', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0017', 'Vans', 'Boots', 'Putih', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0038', 'Puma', 'Sandals', 'Putih', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0050', 'Puma', 'Sneakers', 'Hijau', '39', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0040', 'Reebok', 'Sneakers', 'Hijau', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0042', 'Nike', 'Heels', 'Hijau', 'L', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0038', 'Reebok', 'Boots', 'Hijau', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0007', 'Vans', 'Boots', 'Biru', '42', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0047', 'Vans', 'Sandals', 'Putih', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0050', 'Reebok', 'Loafers', 'Hijau', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0016', 'Puma', 'Sandals', 'Merah', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0044', 'Nike', 'Sandals', 'Hitam', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0015', 'Nike', 'Heels', 'Putih', 'M', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0006', 'Nike', 'Boots', 'Hitam', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0032', 'Adidas', 'Heels', 'Biru', '40', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0021', 'Nike', 'Boots', 'Merah', '38', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0013', 'Nike', 'Sneakers', 'Hijau', 'M', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0042', 'Vans', 'Heels', 'Hitam', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0012', 'Vans', 'Sandals', 'Putih', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0046', 'Vans', 'Sandals', 'Hitam', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0041', 'Puma', 'Boots', 'Biru', '41', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0011', 'Adidas', 'Sneakers', 'Hitam', '42', 1);

-- Insert Transaksi
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0013', 1, 371812.85, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0003', 2, 414182.18, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0036', 3, 393426.78, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0021', 4, 17027.86, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0049', 5, 193218.92, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0040', 6, 163963.78, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0003', 7, 137717.64, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0010', 8, 428962.36, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0027', 9, 334081.38, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0024', 10, 379415.65, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0050', 11, 26329.31, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0028', 12, 178478.34, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0015', 13, 158292.35, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0048', 14, 403538.45, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0021', 15, 498968.96, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0015', 16, 131504.4, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0032', 17, 438836.8, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0017', 18, 261001.0, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0002', 19, 15240.01, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0004', 20, 455238.56, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0045', 21, 191804.03, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0039', 22, 272054.93, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0033', 23, 343298.75, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0041', 24, 138351.0, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0008', 25, 206445.19, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0009', 26, 353024.44, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0044', 27, 115147.42, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0046', 28, 313033.71, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0005', 29, 28813.95, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0020', 30, 110801.49, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0009', 31, 69602.38, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0012', 32, 347962.25, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0027', 33, 333714.24, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0004', 34, 263112.9, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0034', 35, 126287.86, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0029', 36, 16872.41, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0021', 37, 11825.02, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0024', 38, 254952.11, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0036', 39, 198051.63, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0029', 40, 55923.99, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0021', 41, 84501.75, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0010', 42, 85907.51, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0047', 43, 182990.98, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0039', 44, 481858.21, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0011', 45, 481028.14, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0044', 46, 418258.9, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0017', 47, 459185.73, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0008', 48, 77399.78, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0015', 49, 248120.8, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0037', 50, 211482.56, 'Dibatalkan', 1);

-- Insert Barang_Konsumsi
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 87, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 89, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 29, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 8, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 34, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 60, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 84, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 88, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 23, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 1, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 0, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 57, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 2, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 78, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 43, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 29, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 83, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 45, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 12, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 18, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 97, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 24, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 100, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 93, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 61, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 53, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 7, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 71, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 95, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 92, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 29, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 25, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 75, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 18, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 25, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 92, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 13, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 80, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 88, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 88, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 50, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 97, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 94, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 94, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 78, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 90, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 17, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 47, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 86, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 26, 'kg', 1);

-- Insert Maintenance_Alat_Laundry
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-01-18', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-01-19', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-05-18', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-02-19', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-05-25', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-07-05', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-11-14', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-01-06', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-02-02', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-11-04', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-11-09', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-08-11', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-11-03', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-06-15', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-31', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-02-01', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-10-18', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-02-11', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-06-07', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-08-02', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-11-15', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-04-14', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-02-11', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-07-29', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-11-19', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-04-21', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-10-19', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-02-19', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-03-25', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-10-28', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-03-22', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-11-30', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-05-13', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-16', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-01-13', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-02-25', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-01-22', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-04-17', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-03-31', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-07-06', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-05-13', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-03-24', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-09-27', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-08-25', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-04-03', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-09-18', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-08-19', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-01-01', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-05-12', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-03-04', 'Pembersihan mendalam', 1);

            


                --== 51-100 ==--

-- Insert Pelanggan
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0051', 'Gita Santoso', '08836861977', 'Jl. Thamrin No.90', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0052', 'Andi Pratama', '08896299660', 'Jl. Sudirman No.49', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0053', 'Hendra Nugroho', '08716636276', 'Jl. Diponegoro No.85', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0054', 'Gita Kusuma', '08636969045', 'Jl. Gatot Subroto No.38', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0055', 'Gita Santoso', '08394779296', 'Jl. Merdeka No.8', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0056', 'Deni Kusuma', '08678586586', 'Jl. Diponegoro No.1', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0057', 'Hendra Wijaya', '08959199013', 'Jl. Sudirman No.187', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0058', 'Eka Pratama', '08848344324', 'Jl. Diponegoro No.106', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0059', 'Intan Pratama', '08998994191', 'Jl. Gatot Subroto No.136', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0060', 'Andi Halim', '08655998822', 'Jl. Sudirman No.53', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0061', 'Andi Saputra', '08332780892', 'Jl. Sudirman No.99', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0062', 'Fajar Rahma', '08643223266', 'Jl. Gatot Subroto No.163', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0063', 'Intan Setiawan', '0883494249', 'Jl. Merdeka No.54', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0064', 'Joko Santoso', '08176705676', 'Jl. Sudirman No.157', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0065', 'Andi Wijaya', '0853175762', 'Jl. Diponegoro No.93', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0066', 'Budi Nugroho', '08132625783', 'Jl. Thamrin No.26', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0067', 'Deni Permana', '08935310692', 'Jl. Diponegoro No.16', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0068', 'Gita Kusuma', '08191559377', 'Jl. Diponegoro No.111', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0069', 'Joko Nugroho', '08715993732', 'Jl. Thamrin No.56', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0070', 'Hendra Wijaya', '08294546253', 'Jl. Merdeka No.11', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0071', 'Deni Pratama', '08315311588', 'Jl. Gatot Subroto No.99', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0072', 'Deni Kusuma', '08441324090', 'Jl. Diponegoro No.125', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0073', 'Fajar Pratama', '08353205359', 'Jl. Gatot Subroto No.126', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0074', 'Gita Saputra', '08600371135', 'Jl. Thamrin No.98', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0075', 'Andi Pratama', '08987644456', 'Jl. Merdeka No.73', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0076', 'Deni Saputra', '0856542792', 'Jl. Merdeka No.145', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0077', 'Gita Santoso', '0824577736', 'Jl. Thamrin No.138', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0078', 'Gita Kusuma', '08411975520', 'Jl. Merdeka No.115', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0079', 'Fajar Santoso', '08883726338', 'Jl. Thamrin No.49', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0080', 'Fajar Pratama', '08131429218', 'Jl. Merdeka No.94', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0081', 'Deni Nugroho', '0833671315', 'Jl. Diponegoro No.168', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0082', 'Andi Nugroho', '0830066965', 'Jl. Merdeka No.164', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0083', 'Citra Permana', '0884113920', 'Jl. Sudirman No.31', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0084', 'Intan Wijaya', '0873882293', 'Jl. Gatot Subroto No.65', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0085', 'Intan Rahma', '08400927064', 'Jl. Merdeka No.37', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0086', 'Hendra Nugroho', '08678289393', 'Jl. Thamrin No.98', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0087', 'Joko Saputra', '08549470128', 'Jl. Thamrin No.189', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0088', 'Intan Rahma', '08482512408', 'Jl. Gatot Subroto No.17', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0089', 'Hendra Saputra', '08898585422', 'Jl. Merdeka No.179', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0090', 'Citra Rahma', '08545643777', 'Jl. Sudirman No.75', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0091', 'Fajar Santoso', '0826695294', 'Jl. Sudirman No.159', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0092', 'Intan Wijaya', '08369020834', 'Jl. Gatot Subroto No.142', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0093', 'Deni Halim', '08384325313', 'Jl. Diponegoro No.10', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0094', 'Hendra Santoso', '08798698658', 'Jl. Thamrin No.173', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0095', 'Hendra Nugroho', '08873034400', 'Jl. Merdeka No.8', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0096', 'Intan Nugroho', '08976673856', 'Jl. Sudirman No.187', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0097', 'Joko Setiawan', '08714529087', 'Jl. Sudirman No.116', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0098', 'Deni Rahma', '08705175400', 'Jl. Sudirman No.165', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0099', 'Budi Nugroho', '08130315016', 'Jl. Thamrin No.176', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0100', 'Gita Santoso', '08103462378', 'Jl. Merdeka No.177', 1);

-- Insert Sepatu
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0070', 'Puma', 'Loafers', 'Merah', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0097', 'Puma', 'Loafers', 'Hijau', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0068', 'Puma', 'Boots', 'Merah', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0072', 'Reebok', 'Sneakers', 'Hitam', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0076', 'Vans', 'Loafers', 'Hijau', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0094', 'Adidas', 'Sneakers', 'Hijau', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0089', 'Nike', 'Heels', 'Putih', 'L', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0052', 'Adidas', 'Sandals', 'Hijau', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0094', 'Adidas', 'Loafers', 'Merah', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0071', 'Adidas', 'Sandals', 'Hijau', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0083', 'Adidas', 'Sandals', 'Putih', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0096', 'Nike', 'Boots', 'Biru', '42', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0052', 'Puma', 'Heels', 'Hitam', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0075', 'Vans', 'Boots', 'Biru', '41', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0078', 'Reebok', 'Sandals', 'Putih', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0084', 'Puma', 'Boots', 'Biru', '38', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0091', 'Puma', 'Boots', 'Putih', '38', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0090', 'Puma', 'Sandals', 'Biru', '40', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0097', 'Reebok', 'Sandals', 'Putih', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0063', 'Puma', 'Sandals', 'Putih', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0065', 'Adidas', 'Boots', 'Merah', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0088', 'Nike', 'Sneakers', 'Biru', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0090', 'Nike', 'Heels', 'Hijau', '38', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0062', 'Nike', 'Boots', 'Hijau', '40', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0074', 'Vans', 'Sandals', 'Hitam', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0098', 'Reebok', 'Sandals', 'Hitam', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0070', 'Puma', 'Loafers', 'Putih', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0055', 'Nike', 'Boots', 'Merah', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0096', 'Reebok', 'Sneakers', 'Biru', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0089', 'Reebok', 'Loafers', 'Merah', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0052', 'Nike', 'Boots', 'Hitam', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0063', 'Puma', 'Sandals', 'Hijau', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0094', 'Puma', 'Boots', 'Hijau', '38', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0094', 'Puma', 'Loafers', 'Hitam', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0056', 'Reebok', 'Loafers', 'Hijau', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0055', 'Nike', 'Sandals', 'Merah', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0068', 'Adidas', 'Sandals', 'Hijau', 'M', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0057', 'Puma', 'Sandals', 'Hijau', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0069', 'Nike', 'Loafers', 'Hitam', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0052', 'Vans', 'Loafers', 'Putih', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0090', 'Nike', 'Sneakers', 'Merah', '38', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0080', 'Nike', 'Heels', 'Merah', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0053', 'Vans', 'Boots', 'Putih', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0092', 'Puma', 'Sandals', 'Hijau', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0067', 'Vans', 'Loafers', 'Putih', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0064', 'Puma', 'Loafers', 'Biru', '40', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0066', 'Puma', 'Heels', 'Hitam', 'L', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0091', 'Vans', 'Boots', 'Merah', 'L', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0081', 'Puma', 'Heels', 'Putih', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0058', 'Puma', 'Boots', 'Merah', 'S', 1);     

-- Insert Transaksi
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0064', 51, 421663.11, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0072', 52, 156023.21, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0060', 53, 474400.63, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0060', 54, 264438.27, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0086', 55, 424521.48, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0093', 56, 455337.18, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0065', 57, 55461.8, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0089', 58, 473538.82, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0088', 59, 323617.19, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0055', 60, 17285.45, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0075', 61, 492309.72, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0076', 62, 362331.79, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0059', 63, 59246.73, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0096', 64, 237710.41, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0053', 65, 384258.82, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0084', 66, 153315.66, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0055', 67, 414590.32, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0063', 68, 232512.58, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0061', 69, 413552.11, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0052', 70, 372707.3, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0078', 71, 335985.43, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0099', 72, 263896.56, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0093', 73, 126077.34, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0100', 74, 285452.92, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0085', 75, 263159.97, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0076', 76, 198152.05, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0061', 77, 235207.26, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0051', 78, 208016.4, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0056', 79, 370760.51, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0055', 80, 350062.44, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0067', 81, 362592.92, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0057', 82, 472802.48, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0095', 83, 195232.53, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0084', 84, 187716.39, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0076', 85, 474578.16, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0073', 86, 356481.91, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0084', 87, 22457.02, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0090', 88, 254360.22, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0070', 89, 374187.33, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0052', 90, 140776.13, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0067', 91, 131633.89, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0097', 92, 251236.24, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0072', 93, 221369.53, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0081', 94, 89166.79, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0094', 95, 222521.26, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0054', 96, 412362.84, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0058', 97, 431854.76, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0094', 98, 357411.87, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0093', 99, 166716.98, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0063', 100, 244134.31, 'Dibatalkan', 1);

-- Insert Barang_Konsumsi
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 17, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 58, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 3, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 90, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 24, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 19, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 55, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 94, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 14, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 66, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 72, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 41, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 27, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 69, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 98, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 5, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 6, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 100, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 93, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 15, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 62, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 28, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 33, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 17, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 89, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 27, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 14, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 4, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 42, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 85, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 36, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 3, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 46, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 18, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 12, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 26, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 88, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 26, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 74, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 77, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 84, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 1, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 31, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 4, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 30, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 22, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 87, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 60, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 66, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 41, 'kg', 1);

-- Insert Maintenance_Alat_Laundry
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-03-07', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-07-20', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-10-31', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-12-31', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-02-20', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-06-08', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-03-25', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-06-09', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-05-25', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-04-17', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-12-14', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-09-28', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-12-07', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-08-22', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-06-19', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-02-10', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-09-17', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-09-28', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-05-25', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-12-16', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-03-07', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-07-15', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-01-26', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-02-21', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-01-03', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-06-16', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-07-23', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-03-26', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-04-15', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-12-23', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-01-08', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-03-31', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-08-13', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-04-03', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-11-13', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-06-15', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-07-01', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-04-15', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-02-13', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-05-15', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-03-26', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-01-15', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-04-19', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-05-17', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-06-26', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-02-08', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-07-05', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-03-08', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-07-11', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-03-09', 'Perawatan rutin', 1);


            --== 101-200 ==--

-- Insert Pelanggan
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0101', 'Budi Kusuma', '08249918271', 'Jl. Diponegoro No.155', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0102', 'Citra Halim', '08914704336', 'Jl. Sudirman No.168', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0103', 'Fajar Halim', '08448989263', 'Jl. Merdeka No.20', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0104', 'Intan Santoso', '08222334691', 'Jl. Diponegoro No.148', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0105', 'Intan Nugroho', '08759447477', 'Jl. Merdeka No.167', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0106', 'Gita Santoso', '08111959979', 'Jl. Gatot Subroto No.114', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0107', 'Deni Saputra', '08890009067', 'Jl. Sudirman No.50', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0108', 'Deni Rahma', '08367631933', 'Jl. Gatot Subroto No.182', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0109', 'Hendra Halim', '0851859970', 'Jl. Thamrin No.200', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0110', 'Andi Santoso', '08940324028', 'Jl. Sudirman No.1', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0111', 'Andi Santoso', '08664758520', 'Jl. Sudirman No.1', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0112', 'Gita Rahma', '08746456550', 'Jl. Thamrin No.175', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0113', 'Fajar Saputra', '0864739655', 'Jl. Sudirman No.77', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0114', 'Budi Santoso', '0819561416', 'Jl. Sudirman No.3', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0115', 'Citra Saputra', '08364462648', 'Jl. Merdeka No.72', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0116', 'Fajar Setiawan', '0824621809', 'Jl. Diponegoro No.183', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0117', 'Joko Saputra', '08586601702', 'Jl. Merdeka No.30', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0118', 'Gita Wijaya', '08533951745', 'Jl. Sudirman No.105', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0119', 'Eka Saputra', '08638960700', 'Jl. Merdeka No.120', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0120', 'Budi Rahma', '08802417910', 'Jl. Sudirman No.47', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0121', 'Deni Setiawan', '08599392498', 'Jl. Thamrin No.65', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0122', 'Andi Kusuma', '08805356453', 'Jl. Sudirman No.123', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0123', 'Andi Pratama', '08770916985', 'Jl. Gatot Subroto No.65', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0124', 'Deni Rahma', '08140707310', 'Jl. Merdeka No.123', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0125', 'Hendra Wijaya', '08370870524', 'Jl. Thamrin No.118', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0126', 'Intan Saputra', '08330923644', 'Jl. Thamrin No.78', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0127', 'Fajar Kusuma', '08613455749', 'Jl. Thamrin No.167', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0128', 'Intan Permana', '08278146957', 'Jl. Thamrin No.186', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0129', 'Gita Kusuma', '08210082696', 'Jl. Sudirman No.118', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0130', 'Eka Saputra', '08574926254', 'Jl. Gatot Subroto No.129', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0131', 'Citra Permana', '08696637634', 'Jl. Sudirman No.81', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0132', 'Citra Wijaya', '08359374156', 'Jl. Gatot Subroto No.88', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0133', 'Andi Pratama', '08277408870', 'Jl. Diponegoro No.119', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0134', 'Andi Wijaya', '0890139489', 'Jl. Sudirman No.135', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0135', 'Fajar Permana', '0831329126', 'Jl. Gatot Subroto No.182', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0136', 'Gita Saputra', '0820844861', 'Jl. Diponegoro No.53', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0137', 'Intan Nugroho', '08146845842', 'Jl. Merdeka No.66', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0138', 'Eka Setiawan', '08724301205', 'Jl. Thamrin No.23', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0139', 'Hendra Saputra', '08503302501', 'Jl. Merdeka No.80', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0140', 'Budi Permana', '0811109763', 'Jl. Merdeka No.60', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0141', 'Gita Kusuma', '08852828311', 'Jl. Sudirman No.3', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0142', 'Eka Rahma', '08320622236', 'Jl. Thamrin No.1', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0143', 'Citra Rahma', '0860355822', 'Jl. Diponegoro No.167', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0144', 'Citra Halim', '08665891644', 'Jl. Sudirman No.189', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0145', 'Hendra Santoso', '08815128867', 'Jl. Diponegoro No.180', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0146', 'Gita Kusuma', '08466985842', 'Jl. Thamrin No.166', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0147', 'Eka Halim', '08830917158', 'Jl. Merdeka No.108', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0148', 'Eka Permana', '08997115119', 'Jl. Merdeka No.96', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0149', 'Eka Setiawan', '08919096216', 'Jl. Thamrin No.10', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0150', 'Fajar Rahma', '08321502068', 'Jl. Merdeka No.1', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0151', 'Andi Halim', '08779485617', 'Jl. Diponegoro No.79', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0152', 'Andi Rahma', '0846456278', 'Jl. Diponegoro No.126', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0153', 'Budi Wijaya', '08289022717', 'Jl. Merdeka No.162', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0154', 'Joko Setiawan', '08504671662', 'Jl. Thamrin No.47', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0155', 'Fajar Saputra', '0867941950', 'Jl. Sudirman No.58', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0156', 'Budi Wijaya', '08734392472', 'Jl. Thamrin No.115', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0157', 'Fajar Halim', '08167591146', 'Jl. Diponegoro No.57', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0158', 'Hendra Santoso', '08951922928', 'Jl. Sudirman No.164', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0159', 'Hendra Saputra', '08690239104', 'Jl. Thamrin No.136', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0160', 'Andi Halim', '08904658624', 'Jl. Sudirman No.173', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0161', 'Citra Nugroho', '0859092566', 'Jl. Sudirman No.161', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0162', 'Citra Santoso', '08113975441', 'Jl. Sudirman No.129', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0163', 'Eka Permana', '08757500867', 'Jl. Thamrin No.195', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0164', 'Intan Halim', '08200088563', 'Jl. Diponegoro No.82', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0165', 'Budi Permana', '08851948594', 'Jl. Merdeka No.98', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0166', 'Andi Nugroho', '08543128507', 'Jl. Gatot Subroto No.147', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0167', 'Gita Saputra', '08437984822', 'Jl. Thamrin No.181', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0168', 'Intan Setiawan', '08256870425', 'Jl. Thamrin No.14', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0169', 'Joko Pratama', '0836217943', 'Jl. Gatot Subroto No.41', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0170', 'Budi Setiawan', '0851498076', 'Jl. Thamrin No.50', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0171', 'Citra Saputra', '08415826987', 'Jl. Gatot Subroto No.125', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0172', 'Joko Santoso', '0816569832', 'Jl. Gatot Subroto No.189', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0173', 'Hendra Setiawan', '08152008560', 'Jl. Thamrin No.63', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0174', 'Budi Kusuma', '08286667005', 'Jl. Merdeka No.40', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0175', 'Deni Halim', '0841883210', 'Jl. Gatot Subroto No.130', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0176', 'Intan Permana', '08380949346', 'Jl. Diponegoro No.113', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0177', 'Gita Nugroho', '0887687284', 'Jl. Gatot Subroto No.148', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0178', 'Hendra Wijaya', '08661390892', 'Jl. Merdeka No.124', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0179', 'Gita Wijaya', '08648576925', 'Jl. Gatot Subroto No.39', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0180', 'Hendra Permana', '0849575477', 'Jl. Thamrin No.157', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0181', 'Deni Nugroho', '08420362571', 'Jl. Diponegoro No.102', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0182', 'Eka Rahma', '08843648657', 'Jl. Diponegoro No.103', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0183', 'Budi Kusuma', '08229762716', 'Jl. Gatot Subroto No.101', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0184', 'Joko Nugroho', '0845804074', 'Jl. Diponegoro No.125', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0185', 'Gita Wijaya', '08813312590', 'Jl. Gatot Subroto No.156', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0186', 'Joko Santoso', '08230539320', 'Jl. Thamrin No.180', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0187', 'Fajar Permana', '08984716297', 'Jl. Thamrin No.40', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0188', 'Andi Santoso', '08763555599', 'Jl. Sudirman No.74', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0189', 'Fajar Kusuma', '08711222004', 'Jl. Merdeka No.41', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0190', 'Budi Nugroho', '08668848228', 'Jl. Diponegoro No.172', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0191', 'Gita Santoso', '08126892332', 'Jl. Diponegoro No.176', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0192', 'Intan Halim', '08181297026', 'Jl. Thamrin No.59', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0193', 'Joko Saputra', '08841251387', 'Jl. Gatot Subroto No.200', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0194', 'Intan Permana', '08651953357', 'Jl. Gatot Subroto No.175', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0195', 'Joko Saputra', '08353638851', 'Jl. Diponegoro No.174', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0196', 'Andi Saputra', '08144866673', 'Jl. Gatot Subroto No.198', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0197', 'Budi Halim', '08367974847', 'Jl. Merdeka No.32', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0198', 'Intan Saputra', '08535187254', 'Jl. Merdeka No.101', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0199', 'Citra Nugroho', '08270882547', 'Jl. Diponegoro No.181', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0200', 'Gita Pratama', '0848246212', 'Jl. Thamrin No.41', 1);

-- Insert Sepatu
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0158', 'Nike', 'Sneakers', 'Merah', 'XL', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0158', 'Puma', 'Loafers', 'Hitam', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0143', 'Vans', 'Loafers', 'Merah', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0182', 'Reebok', 'Sneakers', 'Hitam', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0146', 'Puma', 'Sandals', 'Hijau', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0163', 'Reebok', 'Sneakers', 'Putih', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0162', 'Reebok', 'Heels', 'Putih', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0120', 'Nike', 'Loafers', 'Biru', '42', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0189', 'Nike', 'Sandals', 'Hitam', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0124', 'Puma', 'Sneakers', 'Hitam', '41', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0129', 'Adidas', 'Sandals', 'Merah', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0137', 'Reebok', 'Sandals', 'Hijau', 'S', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0135', 'Adidas', 'Heels', 'Merah', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0172', 'Vans', 'Sandals', 'Putih', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0131', 'Reebok', 'Boots', 'Merah', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0172', 'Adidas', 'Sandals', 'Putih', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0112', 'Reebok', 'Boots', 'Putih', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0131', 'Adidas', 'Loafers', 'Putih', 'M', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0166', 'Vans', 'Boots', 'Hitam', '41', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0121', 'Adidas', 'Boots', 'Hijau', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0109', 'Nike', 'Boots', 'Biru', 'M', 1);      
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0146', 'Nike', 'Boots', 'Biru', 'XL', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0157', 'Reebok', 'Sandals', 'Hitam', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0180', 'Nike', 'Boots', 'Putih', '40', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0143', 'Puma', 'Boots', 'Biru', '42', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0199', 'Reebok', 'Sneakers', 'Putih', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0129', 'Puma', 'Boots', 'Putih', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0137', 'Nike', 'Loafers', 'Hijau', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0114', 'Puma', 'Loafers', 'Biru', '39', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0169', 'Reebok', 'Loafers', 'Hijau', 'M', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0132', 'Nike', 'Sandals', 'Hitam', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0118', 'Nike', 'Heels', 'Putih', '38', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0122', 'Vans', 'Loafers', 'Merah', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0189', 'Nike', 'Loafers', 'Biru', 'XL', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0114', 'Vans', 'Sneakers', 'Biru', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0107', 'Puma', 'Heels', 'Biru', 'M', 1);      
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0143', 'Puma', 'Heels', 'Biru', 'L', 1);      
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0120', 'Adidas', 'Loafers', 'Hijau', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0105', 'Nike', 'Sneakers', 'Hijau', '40', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0189', 'Adidas', 'Boots', 'Merah', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0140', 'Vans', 'Sandals', 'Hijau', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0158', 'Vans', 'Boots', 'Hijau', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0175', 'Vans', 'Boots', 'Merah', 'M', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0113', 'Vans', 'Heels', 'Merah', 'L', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0148', 'Reebok', 'Sneakers', 'Putih', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0123', 'Reebok', 'Sneakers', 'Hijau', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0103', 'Nike', 'Sandals', 'Biru', '40', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0111', 'Adidas', 'Sneakers', 'Putih', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0156', 'Reebok', 'Sandals', 'Biru', '38', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0119', 'Adidas', 'Loafers', 'Merah', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0121', 'Vans', 'Sneakers', 'Hijau', '41', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0163', 'Adidas', 'Sneakers', 'Putih', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0132', 'Puma', 'Loafers', 'Hitam', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0167', 'Reebok', 'Sneakers', 'Biru', 'L', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0169', 'Reebok', 'Sandals', 'Merah', 'L', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0191', 'Adidas', 'Boots', 'Hitam', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0155', 'Vans', 'Loafers', 'Putih', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0164', 'Puma', 'Heels', 'Merah', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0154', 'Vans', 'Heels', 'Putih', 'L', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0114', 'Adidas', 'Sandals', 'Hitam', 'L', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0194', 'Puma', 'Sneakers', 'Merah', '39', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0128', 'Puma', 'Sneakers', 'Merah', '40', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0179', 'Reebok', 'Sneakers', 'Merah', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0198', 'Adidas', 'Boots', 'Biru', '41', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0140', 'Reebok', 'Heels', 'Merah', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0147', 'Adidas', 'Loafers', 'Hijau', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0200', 'Puma', 'Sandals', 'Biru', 'S', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0128', 'Nike', 'Heels', 'Hijau', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0153', 'Nike', 'Heels', 'Biru', 'L', 1);      
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0176', 'Puma', 'Sandals', 'Hijau', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0183', 'Puma', 'Loafers', 'Merah', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0114', 'Puma', 'Loafers', 'Merah', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0174', 'Nike', 'Loafers', 'Hitam', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0139', 'Nike', 'Loafers', 'Putih', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0153', 'Vans', 'Sandals', 'Putih', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0176', 'Nike', 'Heels', 'Hitam', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0138', 'Adidas', 'Sneakers', 'Putih', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0171', 'Reebok', 'Boots', 'Merah', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0111', 'Nike', 'Boots', 'Merah', '41', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0111', 'Reebok', 'Boots', 'Hijau', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0184', 'Puma', 'Loafers', 'Hitam', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0133', 'Nike', 'Loafers', 'Hitam', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0114', 'Reebok', 'Sneakers', 'Merah', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0133', 'Puma', 'Heels', 'Hijau', '40', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0166', 'Nike', 'Sneakers', 'Hitam', 'XL', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0181', 'Puma', 'Sneakers', 'Merah', '41', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0175', 'Reebok', 'Boots', 'Putih', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0190', 'Puma', 'Sandals', 'Hitam', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0177', 'Adidas', 'Loafers', 'Putih', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0162', 'Adidas', 'Loafers', 'Putih', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0122', 'Puma', 'Sandals', 'Biru', '41', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0186', 'Adidas', 'Sneakers', 'Biru', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0105', 'Nike', 'Sneakers', 'Biru', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0163', 'Reebok', 'Boots', 'Putih', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0176', 'Adidas', 'Boots', 'Putih', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0183', 'Puma', 'Loafers', 'Putih', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0190', 'Puma', 'Heels', 'Merah', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0166', 'Reebok', 'Heels', 'Merah', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0107', 'Puma', 'Sneakers', 'Putih', 'S', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0157', 'Puma', 'Heels', 'Putih', '40', 1);    

-- Insert Transaksi
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0190', 101, 27016.29, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0188', 102, 422417.25, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0115', 103, 222469.77, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0137', 104, 475928.21, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0112', 105, 288070.64, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0104', 106, 321681.9, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0195', 107, 28101.99, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0199', 108, 358576.83, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0182', 109, 322872.75, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0187', 110, 66228.13, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0194', 111, 323439.32, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0165', 112, 231163.47, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0165', 113, 415983.78, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0146', 114, 416724.16, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0197', 115, 53022.58, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0144', 116, 146296.02, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0108', 117, 234942.93, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0114', 118, 475951.33, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0129', 119, 415295.55, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0187', 120, 294034.92, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0116', 121, 497365.77, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0199', 122, 288125.46, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0186', 123, 402249.99, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0131', 124, 117134.0, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0196', 125, 203774.62, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0152', 126, 253440.2, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0149', 127, 332621.93, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0164', 128, 493967.75, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0183', 129, 134103.41, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0153', 130, 411175.6, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0137', 131, 277315.51, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0121', 132, 450854.36, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0187', 133, 88597.45, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0187', 134, 133076.15, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0127', 135, 59056.8, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0157', 136, 74105.97, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0141', 137, 343317.3, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0102', 138, 311002.22, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0138', 139, 250100.38, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0132', 140, 294136.97, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0143', 141, 474613.72, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0164', 142, 443632.32, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0107', 143, 434083.19, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0126', 144, 86106.58, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0158', 145, 147675.44, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0127', 146, 362923.03, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0171', 147, 204762.99, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0101', 148, 374622.7, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0125', 149, 350131.78, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0119', 150, 469918.29, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0198', 151, 59524.31, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0111', 152, 374209.66, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0174', 153, 267798.51, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0157', 154, 116040.0, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0150', 155, 434234.31, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0185', 156, 54641.07, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0117', 157, 356636.44, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0182', 158, 113551.37, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0110', 159, 26658.47, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0103', 160, 423991.3, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0145', 161, 56786.6, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0191', 162, 266260.73, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0153', 163, 24550.76, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0183', 164, 77391.0, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0171', 165, 322994.4, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0101', 166, 140611.17, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0190', 167, 10864.82, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0179', 168, 76043.84, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0138', 169, 246998.07, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0145', 170, 135246.92, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0149', 171, 92432.05, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0174', 172, 188947.4, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0178', 173, 291964.19, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0126', 174, 238474.88, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0183', 175, 24592.07, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0121', 176, 358593.73, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0101', 177, 210099.04, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0174', 178, 194747.92, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0171', 179, 75641.42, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0109', 180, 126913.32, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0119', 181, 31167.73, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0185', 182, 22076.87, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0131', 183, 299983.01, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0179', 184, 413690.04, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0134', 185, 468831.22, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0158', 186, 266941.99, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0145', 187, 44251.37, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0112', 188, 188429.43, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0127', 189, 98358.48, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0187', 190, 343825.96, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0105', 191, 329298.46, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0167', 192, 51771.14, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0175', 193, 398411.76, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0129', 194, 396275.99, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0157', 195, 484459.83, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0138', 196, 220866.23, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0153', 197, 494647.98, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0167', 198, 193769.83, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0179', 199, 463768.39, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0114', 200, 52006.17, 'Selesai', 1);

-- Insert Barang_Konsumsi
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 83, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 100, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 77, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 29, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 96, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 91, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 86, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 25, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 76, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 27, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 37, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 94, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 48, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 14, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 43, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 18, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 78, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 30, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 54, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 53, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 14, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 24, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 60, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 86, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 32, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 34, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 7, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 58, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 71, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 9, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 58, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 91, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 16, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 85, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 63, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 11, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 97, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 81, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 37, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 16, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 22, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 37, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 22, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 32, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 97, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 88, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 34, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 35, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 24, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 95, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 95, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 5, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 39, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 16, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 68, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 92, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 2, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 18, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 23, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 61, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 42, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 50, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 0, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 43, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 0, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 40, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 45, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 23, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 49, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 68, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 86, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 0, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 46, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 41, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 48, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 5, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 48, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 85, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 13, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 52, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 4, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 70, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 48, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 70, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 71, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 37, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 85, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 72, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 7, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 23, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 56, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 4, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 95, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 92, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 34, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 53, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 4, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 2, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 31, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 36, 'pcs', 1);

-- Insert Maintenance_Alat_Laundry
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-14', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-05-19', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-10-14', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-01-09', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-05-08', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-08', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-04-20', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-01-31', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-06-25', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-12-05', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-10-08', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-04-29', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-02-13', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-01-18', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-03-15', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-05-08', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-03-20', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-02-14', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-06-26', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-01-09', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-03-07', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-05-04', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-02-26', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-11-13', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-12-03', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-03-15', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-10-25', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-07-15', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-02-09', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-01-04', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-09-20', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-02-06', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-18', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-08-04', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-10-08', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-11-14', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-08-04', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-03-10', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-05-03', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-01-29', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-07-07', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-03-18', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-09-14', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-05-21', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-07-12', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-02-10', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-06-14', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-09-05', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-01-30', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-10-05', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-12-31', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-03-16', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-04-18', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-01-03', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-11-24', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-01-15', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-06-20', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-09-18', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-04-07', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-12-01', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-03-27', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-05-08', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-11-16', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-03-03', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-03-20', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-06-19', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-05-04', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-04-07', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-03-25', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-01-30', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-02-16', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-01-29', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-09-03', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-08-14', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-08-18', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-03-15', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-10-04', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-02-04', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-12-17', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-06-18', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-02-11', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-03-17', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-02-13', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-12-13', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-05-17', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-03-06', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-12-13', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-11-26', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-10-20', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-02-12', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-02-14', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-07-18', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-09-26', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-04-22', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-07-31', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-04-04', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-08-17', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-05-09', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-01-13', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-01-30', 'Pembersihan mendalam', 1);


                --== 201-300 ==-

-- Insert Pelanggan
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0201', 'Joko Saputra', '08625599267', 'Jl. Diponegoro No.1', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0202', 'Fajar Setiawan', '08723117976', 'Jl. Merdeka No.79', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0203', 'Budi Kusuma', '08474256594', 'Jl. Sudirman No.104', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0204', 'Gita Wijaya', '08637797417', 'Jl. Diponegoro No.40', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0205', 'Intan Rahma', '08971214599', 'Jl. Sudirman No.17', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0206', 'Gita Kusuma', '08937237547', 'Jl. Diponegoro No.70', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0207', 'Intan Nugroho', '08383425704', 'Jl. Merdeka No.130', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0208', 'Budi Saputra', '08977055941', 'Jl. Thamrin No.97', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0209', 'Joko Santoso', '08429023467', 'Jl. Thamrin No.48', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0210', 'Hendra Pratama', '08101498194', 'Jl. Sudirman No.127', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0211', 'Citra Wijaya', '08877481191', 'Jl. Merdeka No.166', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0212', 'Citra Pratama', '08680525645', 'Jl. Sudirman No.134', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0213', 'Budi Pratama', '08862708400', 'Jl. Sudirman No.164', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0214', 'Citra Santoso', '0816091295', 'Jl. Gatot Subroto No.20', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0215', 'Citra Wijaya', '0855591126', 'Jl. Gatot Subroto No.48', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0216', 'Hendra Pratama', '08484119487', 'Jl. Diponegoro No.25', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0217', 'Intan Setiawan', '08776129087', 'Jl. Diponegoro No.194', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0218', 'Eka Wijaya', '08444606330', 'Jl. Thamrin No.177', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0219', 'Hendra Permana', '08704193569', 'Jl. Diponegoro No.53', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0220', 'Citra Santoso', '08288298073', 'Jl. Thamrin No.90', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0221', 'Fajar Nugroho', '08801809454', 'Jl. Diponegoro No.131', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0222', 'Intan Pratama', '08811531484', 'Jl. Thamrin No.129', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0223', 'Gita Permana', '08821421448', 'Jl. Merdeka No.82', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0224', 'Citra Nugroho', '08734640571', 'Jl. Sudirman No.38', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0225', 'Citra Saputra', '08790091453', 'Jl. Thamrin No.61', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0226', 'Andi Rahma', '0854453347', 'Jl. Merdeka No.59', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0227', 'Deni Pratama', '0838011040', 'Jl. Diponegoro No.185', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0228', 'Hendra Kusuma', '0821155704', 'Jl. Merdeka No.14', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0229', 'Eka Saputra', '08443372367', 'Jl. Merdeka No.120', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0230', 'Citra Wijaya', '08318994043', 'Jl. Thamrin No.178', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0231', 'Gita Wijaya', '08521150175', 'Jl. Gatot Subroto No.35', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0232', 'Deni Rahma', '08963495162', 'Jl. Thamrin No.57', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0233', 'Citra Nugroho', '08486721591', 'Jl. Sudirman No.74', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0234', 'Gita Nugroho', '08928717604', 'Jl. Thamrin No.114', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0235', 'Intan Wijaya', '0851716681', 'Jl. Sudirman No.165', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0236', 'Eka Santoso', '08767278899', 'Jl. Gatot Subroto No.158', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0237', 'Hendra Pratama', '08374184791', 'Jl. Gatot Subroto No.49', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0238', 'Joko Nugroho', '08564389753', 'Jl. Sudirman No.75', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0239', 'Eka Pratama', '0828664349', 'Jl. Sudirman No.138', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0240', 'Hendra Rahma', '08211211642', 'Jl. Merdeka No.159', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0241', 'Fajar Setiawan', '08731401937', 'Jl. Sudirman No.176', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0242', 'Citra Saputra', '08116046880', 'Jl. Gatot Subroto No.55', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0243', 'Fajar Santoso', '0891740108', 'Jl. Merdeka No.40', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0244', 'Eka Pratama', '0815576206', 'Jl. Diponegoro No.5', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0245', 'Intan Kusuma', '08303198660', 'Jl. Merdeka No.166', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0246', 'Fajar Kusuma', '08130328881', 'Jl. Thamrin No.41', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0247', 'Budi Permana', '08285247842', 'Jl. Gatot Subroto No.156', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0248', 'Gita Wijaya', '08464912129', 'Jl. Merdeka No.67', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0249', 'Gita Setiawan', '0839335919', 'Jl. Merdeka No.157', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0250', 'Fajar Kusuma', '08774324095', 'Jl. Sudirman No.102', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0251', 'Gita Saputra', '08714941427', 'Jl. Gatot Subroto No.35', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0252', 'Joko Nugroho', '08973014437', 'Jl. Merdeka No.26', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0253', 'Citra Pratama', '08822011074', 'Jl. Merdeka No.160', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0254', 'Deni Rahma', '0864836186', 'Jl. Merdeka No.180', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0255', 'Budi Santoso', '08532980487', 'Jl. Thamrin No.15', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0256', 'Joko Saputra', '0830516164', 'Jl. Gatot Subroto No.48', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0257', 'Citra Santoso', '08469123757', 'Jl. Merdeka No.121', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0258', 'Fajar Setiawan', '08518831727', 'Jl. Gatot Subroto No.162', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0259', 'Joko Permana', '08156828943', 'Jl. Sudirman No.36', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0260', 'Deni Pratama', '08505120511', 'Jl. Diponegoro No.161', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0261', 'Intan Saputra', '08457494663', 'Jl. Merdeka No.133', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0262', 'Fajar Halim', '08352614611', 'Jl. Gatot Subroto No.103', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0263', 'Eka Halim', '08284558312', 'Jl. Diponegoro No.91', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0264', 'Citra Kusuma', '08201460418', 'Jl. Merdeka No.189', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0265', 'Joko Wijaya', '08979667681', 'Jl. Sudirman No.142', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0266', 'Hendra Halim', '0824082807', 'Jl. Sudirman No.58', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0267', 'Andi Permana', '08400845343', 'Jl. Gatot Subroto No.23', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0268', 'Citra Permana', '08824070922', 'Jl. Merdeka No.126', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0269', 'Fajar Rahma', '08847961294', 'Jl. Sudirman No.12', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0270', 'Eka Pratama', '08513240489', 'Jl. Thamrin No.70', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0271', 'Intan Saputra', '08344046421', 'Jl. Diponegoro No.171', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0272', 'Intan Pratama', '08790987943', 'Jl. Merdeka No.67', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0273', 'Budi Kusuma', '08620711440', 'Jl. Merdeka No.36', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0274', 'Budi Halim', '08297388162', 'Jl. Merdeka No.120', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0275', 'Gita Santoso', '08590140074', 'Jl. Diponegoro No.93', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0276', 'Intan Saputra', '08665158606', 'Jl. Sudirman No.76', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0277', 'Deni Permana', '08165538228', 'Jl. Merdeka No.65', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0278', 'Citra Nugroho', '08615371476', 'Jl. Merdeka No.127', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0279', 'Eka Kusuma', '08530080888', 'Jl. Gatot Subroto No.44', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0280', 'Eka Halim', '0887941167', 'Jl. Diponegoro No.61', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0281', 'Intan Santoso', '08714608569', 'Jl. Sudirman No.9', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0282', 'Citra Saputra', '0875302944', 'Jl. Merdeka No.104', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0283', 'Gita Rahma', '08401376041', 'Jl. Diponegoro No.91', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0284', 'Fajar Saputra', '08151384792', 'Jl. Diponegoro No.109', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0285', 'Eka Wijaya', '08990395382', 'Jl. Sudirman No.113', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0286', 'Joko Kusuma', '08193000596', 'Jl. Merdeka No.54', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0287', 'Intan Permana', '08699579371', 'Jl. Thamrin No.194', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0288', 'Deni Halim', '08256164215', 'Jl. Merdeka No.160', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0289', 'Gita Kusuma', '08912136802', 'Jl. Diponegoro No.98', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0290', 'Intan Setiawan', '08707535640', 'Jl. Gatot Subroto No.197', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0291', 'Intan Nugroho', '08261661447', 'Jl. Sudirman No.7', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0292', 'Hendra Santoso', '08115915082', 'Jl. Diponegoro No.56', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0293', 'Joko Wijaya', '08134163931', 'Jl. Thamrin No.160', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0294', 'Hendra Permana', '0838141286', 'Jl. Merdeka No.167', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0295', 'Deni Saputra', '08276985056', 'Jl. Gatot Subroto No.19', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0296', 'Fajar Pratama', '08538235716', 'Jl. Merdeka No.76', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0297', 'Deni Wijaya', '08670213380', 'Jl. Sudirman No.50', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0298', 'Budi Santoso', '08673362249', 'Jl. Gatot Subroto No.88', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0299', 'Deni Permana', '08205183421', 'Jl. Sudirman No.105', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0300', 'Deni Halim', '08362082388', 'Jl. Thamrin No.174', 1);

-- Insert Sepatu
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0262', 'Nike', 'Loafers', 'Merah', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0283', 'Puma', 'Sandals', 'Hijau', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0228', 'Nike', 'Sandals', 'Biru', 'XL', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0214', 'Nike', 'Loafers', 'Biru', 'S', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0269', 'Nike', 'Sneakers', 'Biru', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0201', 'Reebok', 'Sneakers', 'Hijau', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0275', 'Vans', 'Boots', 'Putih', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0290', 'Vans', 'Heels', 'Putih', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0300', 'Vans', 'Sneakers', 'Putih', '39', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0212', 'Adidas', 'Heels', 'Hijau', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0281', 'Adidas', 'Heels', 'Biru', 'S', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0217', 'Adidas', 'Heels', 'Biru', 'S', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0224', 'Vans', 'Sandals', 'Biru', 'L', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0271', 'Nike', 'Boots', 'Hijau', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0259', 'Nike', 'Sneakers', 'Merah', '42', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0281', 'Reebok', 'Sneakers', 'Biru', 'S', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0207', 'Vans', 'Sneakers', 'Hijau', '40', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0247', 'Vans', 'Heels', 'Biru', 'L', 1);      
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0263', 'Reebok', 'Boots', 'Putih', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0249', 'Nike', 'Sneakers', 'Merah', '40', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0242', 'Nike', 'Heels', 'Hitam', 'L', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0253', 'Reebok', 'Boots', 'Putih', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0212', 'Nike', 'Boots', 'Merah', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0289', 'Puma', 'Sandals', 'Hijau', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0270', 'Vans', 'Loafers', 'Merah', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0271', 'Adidas', 'Heels', 'Biru', '42', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0220', 'Vans', 'Boots', 'Hijau', 'M', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0270', 'Nike', 'Loafers', 'Hitam', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0229', 'Puma', 'Sneakers', 'Hijau', 'L', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0207', 'Vans', 'Loafers', 'Hijau', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0226', 'Puma', 'Sneakers', 'Hijau', 'L', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0273', 'Puma', 'Boots', 'Biru', '40', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0283', 'Reebok', 'Sandals', 'Hitam', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0230', 'Puma', 'Sneakers', 'Biru', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0254', 'Adidas', 'Sandals', 'Hijau', 'S', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0243', 'Reebok', 'Sandals', 'Putih', 'L', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0255', 'Nike', 'Heels', 'Hijau', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0276', 'Vans', 'Sneakers', 'Putih', 'XL', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0287', 'Adidas', 'Sneakers', 'Hitam', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0233', 'Reebok', 'Sandals', 'Putih', 'S', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0226', 'Puma', 'Sneakers', 'Biru', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0293', 'Reebok', 'Heels', 'Merah', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0240', 'Puma', 'Boots', 'Hijau', '41', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0243', 'Adidas', 'Sneakers', 'Hijau', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0243', 'Puma', 'Boots', 'Merah', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0203', 'Nike', 'Sneakers', 'Merah', '40', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0271', 'Reebok', 'Boots', 'Merah', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0293', 'Adidas', 'Sneakers', 'Hijau', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0217', 'Puma', 'Boots', 'Putih', '41', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0251', 'Reebok', 'Sneakers', 'Merah', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0258', 'Reebok', 'Boots', 'Biru', '40', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0267', 'Nike', 'Boots', 'Biru', 'S', 1);      
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0251', 'Nike', 'Loafers', 'Merah', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0283', 'Reebok', 'Loafers', 'Hijau', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0230', 'Adidas', 'Sneakers', 'Biru', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0263', 'Adidas', 'Sandals', 'Hijau', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0296', 'Vans', 'Boots', 'Putih', '38', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0239', 'Reebok', 'Boots', 'Biru', 'M', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0282', 'Reebok', 'Sandals', 'Hitam', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0249', 'Adidas', 'Sandals', 'Merah', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0266', 'Adidas', 'Sneakers', 'Biru', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0227', 'Puma', 'Boots', 'Biru', 'L', 1);      
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0264', 'Puma', 'Boots', 'Biru', '42', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0229', 'Adidas', 'Sneakers', 'Hijau', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0234', 'Puma', 'Sneakers', 'Hijau', 'S', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0242', 'Puma', 'Loafers', 'Hitam', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0237', 'Puma', 'Boots', 'Putih', '40', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0232', 'Nike', 'Loafers', 'Hijau', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0235', 'Adidas', 'Boots', 'Biru', '38', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0217', 'Vans', 'Sandals', 'Biru', '42', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0281', 'Reebok', 'Sneakers', 'Hitam', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0219', 'Nike', 'Sandals', 'Merah', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0205', 'Nike', 'Loafers', 'Merah', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0240', 'Vans', 'Sneakers', 'Merah', '41', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0226', 'Puma', 'Loafers', 'Hijau', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0258', 'Adidas', 'Boots', 'Hijau', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0221', 'Puma', 'Sandals', 'Biru', '38', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0262', 'Adidas', 'Sandals', 'Biru', '39', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0283', 'Nike', 'Sneakers', 'Hijau', 'L', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0294', 'Adidas', 'Boots', 'Putih', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0243', 'Adidas', 'Heels', 'Merah', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0296', 'Reebok', 'Loafers', 'Merah', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0243', 'Nike', 'Sneakers', 'Hijau', '38', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0273', 'Nike', 'Sandals', 'Biru', 'XL', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0208', 'Adidas', 'Heels', 'Hijau', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0266', 'Nike', 'Loafers', 'Hijau', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0281', 'Nike', 'Sneakers', 'Hijau', '39', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0274', 'Nike', 'Sneakers', 'Putih', '39', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0204', 'Puma', 'Sneakers', 'Biru', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0285', 'Nike', 'Heels', 'Biru', 'L', 1);      
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0282', 'Vans', 'Sandals', 'Putih', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0233', 'Nike', 'Sandals', 'Putih', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0247', 'Vans', 'Sneakers', 'Biru', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0201', 'Reebok', 'Heels', 'Putih', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0232', 'Reebok', 'Boots', 'Biru', 'XL', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0202', 'Adidas', 'Loafers', 'Merah', 'M', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0289', 'Vans', 'Loafers', 'Merah', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0204', 'Adidas', 'Boots', 'Putih', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0259', 'Vans', 'Boots', 'Merah', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0221', 'Reebok', 'Loafers', 'Hitam', '41', 1);

-- Insert Transaksi
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0265', 201, 292235.05, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0213', 202, 411010.76, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0266', 203, 217667.54, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0262', 204, 30343.61, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0225', 205, 12009.79, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0270', 206, 65787.23, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0247', 207, 140409.46, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0260', 208, 221678.24, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0291', 209, 44792.2, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0236', 210, 319158.59, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0207', 211, 409088.27, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0237', 212, 244612.11, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0209', 213, 33051.08, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0276', 214, 305844.82, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0246', 215, 472641.5, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0208', 216, 93000.4, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0258', 217, 27321.29, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0288', 218, 387287.39, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0203', 219, 98371.31, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0231', 220, 152470.79, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0244', 221, 32753.63, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0272', 222, 34089.27, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0285', 223, 488421.46, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0272', 224, 475936.99, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0245', 225, 488813.46, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0288', 226, 39357.44, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0298', 227, 463323.84, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0207', 228, 431301.95, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0234', 229, 372192.21, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0236', 230, 266634.68, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0203', 231, 306810.48, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0267', 232, 439399.51, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0268', 233, 423650.96, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0290', 234, 315411.38, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0219', 235, 411989.16, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0272', 236, 425876.99, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0297', 237, 105010.71, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0214', 238, 381158.15, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0258', 239, 337838.26, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0258', 240, 228321.08, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0223', 241, 263332.33, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0252', 242, 434431.27, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0241', 243, 306410.54, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0257', 244, 366480.86, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0261', 245, 432404.33, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0242', 246, 446742.24, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0213', 247, 452479.02, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0268', 248, 234447.59, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0251', 249, 369381.47, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0281', 250, 440424.51, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0231', 251, 269334.3, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0297', 252, 248899.49, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0253', 253, 190880.08, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0256', 254, 277069.84, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0236', 255, 188193.64, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0232', 256, 201681.25, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0235', 257, 194159.51, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0290', 258, 206719.59, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0204', 259, 352575.36, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0226', 260, 333318.24, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0204', 261, 408281.42, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0224', 262, 425514.48, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0226', 263, 360696.67, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0254', 264, 109313.74, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0259', 265, 60194.38, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0292', 266, 437398.78, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0271', 267, 174282.95, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0261', 268, 378086.1, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0293', 269, 347574.4, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0239', 270, 295735.69, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0246', 271, 399758.83, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0299', 272, 218396.39, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0290', 273, 395830.01, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0205', 274, 338848.78, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0266', 275, 344203.52, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0294', 276, 11201.14, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0261', 277, 44500.4, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0201', 278, 242298.84, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0243', 279, 440870.6, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0219', 280, 466302.7, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0217', 281, 460441.91, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0270', 282, 32267.46, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0298', 283, 244192.15, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0271', 284, 90465.91, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0242', 285, 132408.68, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0246', 286, 123597.5, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0283', 287, 109097.05, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0247', 288, 352260.5, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0237', 289, 424600.11, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0283', 290, 15972.98, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0209', 291, 206465.98, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0294', 292, 196552.82, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0293', 293, 119227.33, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0295', 294, 227333.11, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0215', 295, 415588.4, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0226', 296, 319249.24, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0233', 297, 262722.21, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0202', 298, 193934.69, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0201', 299, 241579.48, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0252', 300, 410165.0, 'Dibatalkan', 1);

-- Insert Barang_Konsumsi
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 68, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 66, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 80, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 15, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 90, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 16, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 94, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 48, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 12, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 59, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 54, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 69, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 65, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 22, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 72, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 1, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 80, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 19, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 83, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 11, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 99, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 13, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 42, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 37, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 99, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 29, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 49, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 93, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 10, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 21, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 40, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 34, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 74, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 10, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 49, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 86, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 71, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 85, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 37, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 10, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 83, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 82, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 63, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 88, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 92, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 11, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 74, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 88, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 50, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 34, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 22, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 13, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 36, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 4, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 46, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 39, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 66, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 86, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 91, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 17, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 34, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 25, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 90, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 32, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 11, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 57, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 11, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 93, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 22, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 31, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 44, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 74, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 18, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 52, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 89, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 2, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 70, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 53, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 75, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 86, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 22, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 41, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 31, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 68, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 48, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 18, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 37, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 33, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 56, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 38, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 31, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 93, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 62, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 47, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 84, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 51, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 9, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 13, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 66, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 59, 'kg', 1);

-- Insert Maintenance_Alat_Laundry
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-09-21', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-06-19', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-01-06', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-11-09', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-09-11', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-10-23', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-10-29', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-07-05', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-04-29', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-04-22', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-01-25', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-05-24', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-03-31', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-06-14', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-06-03', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-10-27', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-03-08', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-11-08', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-03-27', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-03-08', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-02-24', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-10-21', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-07-14', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-06-13', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-02-06', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-07-01', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-01-11', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-10-30', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-01-26', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-02-10', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-09-10', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-12-24', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-08-07', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-01-22', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-04-10', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-07-20', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-04-07', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-06-30', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-07-03', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-11-01', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-02-04', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-01-02', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-09-04', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-06-03', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-02-22', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-04-11', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-03-27', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-06-01', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-03-13', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-05-21', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-25', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-07-20', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-10-31', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-01-28', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-04-08', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-02-04', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-07-20', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-03-27', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-05-27', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-05-29', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-06-06', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-04-12', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-07-10', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-01-11', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-06-04', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-12-20', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-04-05', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-04-09', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-05-04', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-04-30', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-07-23', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-01-01', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-12-03', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-11-26', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-07-07', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-07-07', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-03-04', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-04-25', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-09-16', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-11-25', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-08-16', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-10-17', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-05-08', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-10-22', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-03-17', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-10-27', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-12-05', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-07-20', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-08-04', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-04-03', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-01-24', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-12-17', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-04-27', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-10-22', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-10-14', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-05-23', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-12-03', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-07-21', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-12-30', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-05-12', 'Kalibrasi', 1);



            --== 301-400 ==--

-- Insert Pelanggan
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0301', 'Citra Rahma', '08181181874', 'Jl. Sudirman No.97', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0302', 'Gita Permana', '0846520014', 'Jl. Thamrin No.67', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0303', 'Andi Kusuma', '08481201037', 'Jl. Gatot Subroto No.19', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0304', 'Intan Saputra', '08852200923', 'Jl. Gatot Subroto No.200', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0305', 'Gita Halim', '0878592258', 'Jl. Thamrin No.130', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0306', 'Budi Nugroho', '08900082270', 'Jl. Gatot Subroto No.172', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0307', 'Intan Halim', '08373804657', 'Jl. Merdeka No.73', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0308', 'Budi Setiawan', '08683431214', 'Jl. Gatot Subroto No.5', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0309', 'Deni Saputra', '08398390161', 'Jl. Thamrin No.109', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0310', 'Eka Saputra', '08184645027', 'Jl. Thamrin No.153', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0311', 'Hendra Rahma', '08924417563', 'Jl. Sudirman No.199', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0312', 'Budi Wijaya', '08907489237', 'Jl. Diponegoro No.109', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0313', 'Deni Pratama', '08203658366', 'Jl. Gatot Subroto No.61', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0314', 'Joko Pratama', '0893369013', 'Jl. Gatot Subroto No.17', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0315', 'Fajar Kusuma', '0845140880', 'Jl. Thamrin No.126', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0316', 'Intan Rahma', '08861105996', 'Jl. Thamrin No.10', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0317', 'Gita Nugroho', '08184818865', 'Jl. Merdeka No.157', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0318', 'Intan Saputra', '0853255627', 'Jl. Diponegoro No.39', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0319', 'Eka Setiawan', '08437993411', 'Jl. Thamrin No.90', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0320', 'Citra Wijaya', '08851069539', 'Jl. Merdeka No.15', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0321', 'Deni Permana', '0830075033', 'Jl. Sudirman No.110', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0322', 'Hendra Pratama', '08318890768', 'Jl. Gatot Subroto No.161', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0323', 'Gita Saputra', '0831792974', 'Jl. Sudirman No.43', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0324', 'Citra Nugroho', '0850526475', 'Jl. Sudirman No.96', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0325', 'Citra Halim', '08729084599', 'Jl. Thamrin No.124', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0326', 'Hendra Santoso', '0848419548', 'Jl. Gatot Subroto No.56', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0327', 'Hendra Pratama', '0887623892', 'Jl. Gatot Subroto No.156', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0328', 'Eka Saputra', '0890419610', 'Jl. Merdeka No.98', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0329', 'Citra Rahma', '08362626177', 'Jl. Diponegoro No.81', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0330', 'Joko Permana', '08685513667', 'Jl. Sudirman No.61', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0331', 'Gita Wijaya', '08808868588', 'Jl. Merdeka No.41', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0332', 'Andi Permana', '08247031375', 'Jl. Thamrin No.38', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0333', 'Gita Santoso', '0836995314', 'Jl. Diponegoro No.156', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0334', 'Intan Rahma', '0854853989', 'Jl. Thamrin No.170', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0335', 'Eka Permana', '08664535037', 'Jl. Diponegoro No.190', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0336', 'Joko Santoso', '08428263488', 'Jl. Thamrin No.37', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0337', 'Hendra Halim', '08911227929', 'Jl. Thamrin No.89', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0338', 'Gita Nugroho', '08516425908', 'Jl. Gatot Subroto No.72', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0339', 'Fajar Setiawan', '0864192958', 'Jl. Merdeka No.41', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0340', 'Deni Santoso', '08167534780', 'Jl. Sudirman No.25', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0341', 'Deni Rahma', '0822374866', 'Jl. Gatot Subroto No.162', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0342', 'Andi Kusuma', '08573690112', 'Jl. Sudirman No.134', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0343', 'Andi Pratama', '0889148617', 'Jl. Diponegoro No.63', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0344', 'Eka Pratama', '08122810198', 'Jl. Sudirman No.171', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0345', 'Intan Rahma', '08781835529', 'Jl. Thamrin No.187', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0346', 'Budi Wijaya', '08129981057', 'Jl. Gatot Subroto No.20', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0347', 'Budi Saputra', '08527177077', 'Jl. Thamrin No.36', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0348', 'Andi Nugroho', '08782505540', 'Jl. Gatot Subroto No.200', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0349', 'Fajar Wijaya', '0811090783', 'Jl. Merdeka No.128', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0350', 'Citra Nugroho', '08900168530', 'Jl. Sudirman No.19', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0351', 'Hendra Halim', '08637943740', 'Jl. Gatot Subroto No.189', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0352', 'Andi Pratama', '0862851343', 'Jl. Diponegoro No.77', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0353', 'Eka Saputra', '08239986524', 'Jl. Sudirman No.14', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0354', 'Citra Rahma', '08865837772', 'Jl. Thamrin No.146', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0355', 'Budi Permana', '08932294923', 'Jl. Diponegoro No.19', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0356', 'Gita Halim', '08585158077', 'Jl. Gatot Subroto No.150', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0357', 'Gita Santoso', '0851212083', 'Jl. Sudirman No.87', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0358', 'Eka Permana', '08256764308', 'Jl. Merdeka No.28', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0359', 'Hendra Santoso', '08464618907', 'Jl. Merdeka No.2', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0360', 'Gita Pratama', '08461949083', 'Jl. Sudirman No.74', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0361', 'Fajar Setiawan', '08197573682', 'Jl. Thamrin No.64', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0362', 'Budi Wijaya', '08855718529', 'Jl. Thamrin No.187', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0363', 'Fajar Nugroho', '08335956411', 'Jl. Sudirman No.19', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0364', 'Eka Halim', '08841282202', 'Jl. Sudirman No.114', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0365', 'Joko Kusuma', '08795212163', 'Jl. Thamrin No.126', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0366', 'Andi Nugroho', '08299823665', 'Jl. Diponegoro No.37', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0367', 'Gita Santoso', '08847346685', 'Jl. Gatot Subroto No.13', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0368', 'Eka Saputra', '08520984185', 'Jl. Thamrin No.153', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0369', 'Intan Nugroho', '08192447130', 'Jl. Diponegoro No.27', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0370', 'Gita Setiawan', '08685085411', 'Jl. Thamrin No.2', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0371', 'Budi Nugroho', '08857347782', 'Jl. Merdeka No.180', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0372', 'Fajar Saputra', '0852097321', 'Jl. Diponegoro No.176', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0373', 'Deni Halim', '08854929213', 'Jl. Merdeka No.145', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0374', 'Eka Saputra', '08464676976', 'Jl. Merdeka No.62', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0375', 'Andi Permana', '08131056925', 'Jl. Diponegoro No.166', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0376', 'Gita Santoso', '08584464747', 'Jl. Gatot Subroto No.184', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0377', 'Intan Wijaya', '0866870800', 'Jl. Diponegoro No.65', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0378', 'Gita Permana', '08953078654', 'Jl. Thamrin No.54', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0379', 'Andi Saputra', '08185803366', 'Jl. Merdeka No.63', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0380', 'Joko Rahma', '08632853750', 'Jl. Diponegoro No.25', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0381', 'Hendra Kusuma', '0862690162', 'Jl. Thamrin No.28', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0382', 'Andi Setiawan', '08204134589', 'Jl. Sudirman No.47', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0383', 'Andi Halim', '08166236933', 'Jl. Gatot Subroto No.46', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0384', 'Fajar Kusuma', '08747241530', 'Jl. Gatot Subroto No.103', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0385', 'Intan Pratama', '08503829414', 'Jl. Thamrin No.79', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0386', 'Joko Wijaya', '0826083982', 'Jl. Thamrin No.126', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0387', 'Gita Kusuma', '08676651686', 'Jl. Thamrin No.124', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0388', 'Hendra Wijaya', '08671920805', 'Jl. Thamrin No.67', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0389', 'Gita Rahma', '08241734382', 'Jl. Diponegoro No.125', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0390', 'Budi Wijaya', '08930577779', 'Jl. Merdeka No.168', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0391', 'Hendra Santoso', '08450271930', 'Jl. Thamrin No.131', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0392', 'Gita Saputra', '08408142900', 'Jl. Gatot Subroto No.64', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0393', 'Fajar Kusuma', '0838719076', 'Jl. Merdeka No.56', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0394', 'Deni Kusuma', '08795494965', 'Jl. Sudirman No.8', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0395', 'Andi Permana', '0898344308', 'Jl. Merdeka No.151', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0396', 'Fajar Santoso', '08270202043', 'Jl. Gatot Subroto No.91', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0397', 'Deni Permana', '08958973661', 'Jl. Merdeka No.2', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0398', 'Budi Halim', '08824856505', 'Jl. Diponegoro No.161', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0399', 'Gita Nugroho', '08449077419', 'Jl. Sudirman No.122', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0400', 'Budi Saputra', '08545083539', 'Jl. Merdeka No.113', 1);

-- Insert Sepatu
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0301', 'Nike', 'Loafers', 'Putih', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0317', 'Nike', 'Loafers', 'Biru', '39', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0347', 'Reebok', 'Loafers', 'Biru', '39', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0332', 'Vans', 'Boots', 'Merah', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0364', 'Adidas', 'Sneakers', 'Merah', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0395', 'Reebok', 'Sneakers', 'Putih', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0396', 'Reebok', 'Heels', 'Putih', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0316', 'Vans', 'Sneakers', 'Biru', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0398', 'Adidas', 'Sandals', 'Merah', 'M', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0388', 'Nike', 'Sneakers', 'Hitam', '39', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0367', 'Puma', 'Heels', 'Putih', '41', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0380', 'Adidas', 'Heels', 'Hijau', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0324', 'Nike', 'Sneakers', 'Biru', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0379', 'Nike', 'Loafers', 'Hijau', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0317', 'Reebok', 'Loafers', 'Biru', '41', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0370', 'Puma', 'Heels', 'Hijau', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0358', 'Reebok', 'Heels', 'Biru', 'S', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0317', 'Nike', 'Loafers', 'Hijau', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0303', 'Puma', 'Sneakers', 'Hijau', 'M', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0323', 'Vans', 'Sandals', 'Hijau', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0369', 'Reebok', 'Heels', 'Biru', '38', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0317', 'Nike', 'Sneakers', 'Putih', '40', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0331', 'Adidas', 'Sandals', 'Hitam', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0331', 'Adidas', 'Boots', 'Merah', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0398', 'Vans', 'Sandals', 'Hijau', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0357', 'Vans', 'Sandals', 'Putih', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0344', 'Reebok', 'Heels', 'Hitam', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0317', 'Reebok', 'Loafers', 'Merah', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0358', 'Reebok', 'Boots', 'Merah', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0333', 'Reebok', 'Sneakers', 'Biru', 'S', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0386', 'Puma', 'Boots', 'Biru', 'L', 1);      
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0374', 'Puma', 'Sandals', 'Hijau', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0368', 'Vans', 'Heels', 'Merah', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0323', 'Nike', 'Sneakers', 'Putih', '41', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0309', 'Nike', 'Heels', 'Hijau', 'M', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0327', 'Reebok', 'Sandals', 'Putih', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0357', 'Reebok', 'Loafers', 'Biru', 'L', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0332', 'Reebok', 'Heels', 'Biru', '42', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0341', 'Reebok', 'Heels', 'Merah', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0390', 'Adidas', 'Heels', 'Hitam', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0370', 'Puma', 'Heels', 'Merah', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0321', 'Adidas', 'Boots', 'Hitam', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0334', 'Reebok', 'Sneakers', 'Hitam', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0377', 'Vans', 'Loafers', 'Merah', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0301', 'Puma', 'Boots', 'Hitam', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0319', 'Nike', 'Heels', 'Hitam', 'L', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0358', 'Reebok', 'Sneakers', 'Putih', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0390', 'Reebok', 'Sandals', 'Biru', '38', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0361', 'Adidas', 'Sneakers', 'Biru', 'L', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0366', 'Vans', 'Sandals', 'Hitam', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0347', 'Puma', 'Sneakers', 'Merah', 'L', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0396', 'Puma', 'Loafers', 'Hijau', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0330', 'Vans', 'Sneakers', 'Putih', 'S', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0386', 'Puma', 'Sneakers', 'Merah', '40', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0382', 'Vans', 'Boots', 'Putih', 'M', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0378', 'Puma', 'Sneakers', 'Merah', '39', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0327', 'Puma', 'Loafers', 'Hitam', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0377', 'Reebok', 'Loafers', 'Hijau', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0331', 'Adidas', 'Sneakers', 'Hijau', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0305', 'Adidas', 'Heels', 'Hijau', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0315', 'Adidas', 'Boots', 'Hijau', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0346', 'Adidas', 'Loafers', 'Hijau', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0332', 'Adidas', 'Loafers', 'Putih', 'S', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0314', 'Nike', 'Boots', 'Hijau', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0343', 'Vans', 'Sandals', 'Hijau', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0367', 'Nike', 'Heels', 'Putih', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0348', 'Adidas', 'Sneakers', 'Hijau', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0334', 'Nike', 'Sneakers', 'Hijau', 'S', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0310', 'Puma', 'Sneakers', 'Putih', 'L', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0390', 'Reebok', 'Loafers', 'Hitam', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0337', 'Reebok', 'Boots', 'Biru', '38', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0394', 'Reebok', 'Sandals', 'Merah', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0387', 'Puma', 'Sneakers', 'Hitam', '38', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0371', 'Puma', 'Boots', 'Putih', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0382', 'Reebok', 'Heels', 'Merah', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0348', 'Puma', 'Boots', 'Hitam', '38', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0337', 'Adidas', 'Loafers', 'Merah', 'M', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0400', 'Nike', 'Sandals', 'Putih', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0346', 'Vans', 'Sandals', 'Putih', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0340', 'Puma', 'Loafers', 'Biru', 'S', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0355', 'Puma', 'Boots', 'Biru', '39', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0392', 'Puma', 'Loafers', 'Hitam', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0326', 'Adidas', 'Sandals', 'Biru', 'M', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0341', 'Nike', 'Boots', 'Biru', '38', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0331', 'Reebok', 'Loafers', 'Putih', 'L', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0326', 'Puma', 'Sneakers', 'Hitam', '41', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0338', 'Reebok', 'Sneakers', 'Biru', 'S', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0308', 'Nike', 'Heels', 'Putih', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0378', 'Puma', 'Heels', 'Hijau', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0310', 'Reebok', 'Sneakers', 'Merah', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0377', 'Vans', 'Sandals', 'Hitam', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0336', 'Nike', 'Boots', 'Merah', 'M', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0387', 'Vans', 'Sandals', 'Merah', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0302', 'Puma', 'Heels', 'Merah', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0396', 'Puma', 'Loafers', 'Merah', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0321', 'Nike', 'Sandals', 'Merah', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0301', 'Reebok', 'Boots', 'Merah', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0319', 'Adidas', 'Sandals', 'Merah', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0311', 'Adidas', 'Heels', 'Putih', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0391', 'Nike', 'Heels', 'Putih', 'XL', 1);    

-- Insert Transaksi
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0387', 301, 178825.87, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0382', 302, 287987.75, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0359', 303, 117590.98, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0353', 304, 449753.74, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0320', 305, 33586.33, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0328', 306, 421374.79, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0334', 307, 178009.83, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0311', 308, 384414.28, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0374', 309, 248055.37, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0302', 310, 22463.9, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0365', 311, 24619.92, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0397', 312, 222133.02, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0369', 313, 225853.33, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0378', 314, 484814.31, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0305', 315, 271447.61, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0362', 316, 340910.33, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0346', 317, 375619.31, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0375', 318, 332018.38, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0306', 319, 255167.54, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0385', 320, 53961.61, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0375', 321, 54059.31, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0361', 322, 147669.37, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0329', 323, 385675.42, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0349', 324, 396757.4, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0369', 325, 280678.18, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0342', 326, 394865.32, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0317', 327, 302433.15, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0326', 328, 315221.42, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0396', 329, 370253.36, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0363', 330, 241152.57, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0305', 331, 161979.7, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0356', 332, 168339.54, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0373', 333, 308885.66, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0330', 334, 446023.94, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0304', 335, 83835.3, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0380', 336, 327686.92, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0335', 337, 211822.09, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0392', 338, 240104.4, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0322', 339, 333137.99, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0390', 340, 323848.58, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0348', 341, 170113.66, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0344', 342, 402373.57, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0379', 343, 244237.22, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0313', 344, 438772.1, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0344', 345, 487666.11, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0302', 346, 466485.84, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0351', 347, 318843.69, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0350', 348, 361433.3, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0353', 349, 486483.17, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0331', 350, 276972.16, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0326', 351, 28251.3, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0397', 352, 79851.58, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0307', 353, 178276.93, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0376', 354, 236912.77, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0373', 355, 474628.43, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0307', 356, 384430.48, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0311', 357, 240022.66, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0370', 358, 107115.82, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0309', 359, 431307.13, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0399', 360, 352303.31, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0342', 361, 37182.41, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0392', 362, 59096.14, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0304', 363, 272529.45, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0382', 364, 178422.36, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0309', 365, 340227.97, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0344', 366, 428527.7, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0319', 367, 158073.76, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0352', 368, 451310.55, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0384', 369, 180756.18, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0366', 370, 60728.12, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0358', 371, 145779.22, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0315', 372, 205485.26, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0327', 373, 358269.76, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0345', 374, 480585.28, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0305', 375, 227582.23, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0359', 376, 205771.73, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0378', 377, 36139.54, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0362', 378, 445793.93, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0347', 379, 11292.74, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0372', 380, 185524.37, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0348', 381, 253615.66, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0379', 382, 303015.53, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0375', 383, 462681.55, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0304', 384, 30082.89, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0390', 385, 129815.63, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0394', 386, 360520.43, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0321', 387, 237243.44, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0312', 388, 47047.49, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0336', 389, 63879.18, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0400', 390, 148034.34, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0301', 391, 212766.46, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0303', 392, 266245.71, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0375', 393, 280843.62, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0397', 394, 253610.97, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0370', 395, 191048.67, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0328', 396, 248601.78, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0359', 397, 318683.07, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0335', 398, 169332.73, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0384', 399, 320040.66, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0359', 400, 73660.04, 'Proses', 1);

-- Insert Barang_Konsumsi
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 12, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 48, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 60, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 25, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 18, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 16, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 2, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 94, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 87, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 97, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 64, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 85, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 58, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 14, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 1, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 88, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 59, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 10, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 86, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 99, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 0, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 94, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 76, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 33, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 76, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 30, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 93, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 47, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 76, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 29, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 85, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 37, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 72, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 40, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 47, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 24, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 90, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 60, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 62, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 40, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 68, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 34, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 61, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 40, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 13, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 36, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 99, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 84, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 56, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 12, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 33, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 55, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 29, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 23, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 78, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 63, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 83, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 23, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 54, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 39, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 18, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 57, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 46, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 47, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 57, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 79, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 15, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 40, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 68, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 36, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 39, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 48, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 71, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 8, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 39, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 26, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 89, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 66, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 66, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 100, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 42, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 24, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 95, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 81, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 74, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 84, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 84, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 14, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 28, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 92, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 69, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 5, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 77, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 72, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 35, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 79, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 41, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 87, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 30, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 24, 'pcs', 1);

-- Insert Maintenance_Alat_Laundry
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-09-29', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-01-11', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-25', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-02-04', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-02-06', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-12-28', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-02-15', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-03-27', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-02-01', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-11-29', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-08-08', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-10-16', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-03-23', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-08-14', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-11-17', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-04-29', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-07-04', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-07-25', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-07-31', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-05-14', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-04-10', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-06-06', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-05-17', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-06-05', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-02-21', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-01-07', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-11-02', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-01-21', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-07-10', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-11-27', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-03-21', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-10-02', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-04-21', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-08-05', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-08-19', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-11-23', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-06-18', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-03-08', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-09-12', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-11-28', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-04-27', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-05-03', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-03-15', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-01-13', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-01-01', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-09-07', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-01-09', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-11-02', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-07-09', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-01-24', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-03-03', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-09-02', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-12-03', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-12-14', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-05-25', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-05-15', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-02-14', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-02-05', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-03-14', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-10-15', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-02-07', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-01-30', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-12-04', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-04-13', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-08-20', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-03-01', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-09', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-05-24', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-05-28', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-03-29', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-03-12', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-02-28', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-06-24', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-08-13', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-01-26', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-01-03', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-06-29', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-08-28', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-03-16', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-09-16', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-23', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-12-11', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-02-10', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-07-08', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-01-09', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-11-30', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-05-19', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-07-09', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-11-12', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-06-23', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-10-18', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-06-24', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-04-26', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-08-18', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-06-19', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-03-27', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-08-14', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-08-06', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-09-21', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-11-30', 'Perawatan rutin', 1);


            --== 301-400 ==--

-- Insert Pelanggan
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0301', 'Citra Rahma', '08181181874', 'Jl. Sudirman No.97', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0302', 'Gita Permana', '0846520014', 'Jl. Thamrin No.67', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0303', 'Andi Kusuma', '08481201037', 'Jl. Gatot Subroto No.19', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0304', 'Intan Saputra', '08852200923', 'Jl. Gatot Subroto No.200', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0305', 'Gita Halim', '0878592258', 'Jl. Thamrin No.130', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0306', 'Budi Nugroho', '08900082270', 'Jl. Gatot Subroto No.172', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0307', 'Intan Halim', '08373804657', 'Jl. Merdeka No.73', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0308', 'Budi Setiawan', '08683431214', 'Jl. Gatot Subroto No.5', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0309', 'Deni Saputra', '08398390161', 'Jl. Thamrin No.109', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0310', 'Eka Saputra', '08184645027', 'Jl. Thamrin No.153', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0311', 'Hendra Rahma', '08924417563', 'Jl. Sudirman No.199', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0312', 'Budi Wijaya', '08907489237', 'Jl. Diponegoro No.109', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0313', 'Deni Pratama', '08203658366', 'Jl. Gatot Subroto No.61', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0314', 'Joko Pratama', '0893369013', 'Jl. Gatot Subroto No.17', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0315', 'Fajar Kusuma', '0845140880', 'Jl. Thamrin No.126', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0316', 'Intan Rahma', '08861105996', 'Jl. Thamrin No.10', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0317', 'Gita Nugroho', '08184818865', 'Jl. Merdeka No.157', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0318', 'Intan Saputra', '0853255627', 'Jl. Diponegoro No.39', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0319', 'Eka Setiawan', '08437993411', 'Jl. Thamrin No.90', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0320', 'Citra Wijaya', '08851069539', 'Jl. Merdeka No.15', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0321', 'Deni Permana', '0830075033', 'Jl. Sudirman No.110', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0322', 'Hendra Pratama', '08318890768', 'Jl. Gatot Subroto No.161', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0323', 'Gita Saputra', '0831792974', 'Jl. Sudirman No.43', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0324', 'Citra Nugroho', '0850526475', 'Jl. Sudirman No.96', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0325', 'Citra Halim', '08729084599', 'Jl. Thamrin No.124', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0326', 'Hendra Santoso', '0848419548', 'Jl. Gatot Subroto No.56', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0327', 'Hendra Pratama', '0887623892', 'Jl. Gatot Subroto No.156', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0328', 'Eka Saputra', '0890419610', 'Jl. Merdeka No.98', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0329', 'Citra Rahma', '08362626177', 'Jl. Diponegoro No.81', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0330', 'Joko Permana', '08685513667', 'Jl. Sudirman No.61', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0331', 'Gita Wijaya', '08808868588', 'Jl. Merdeka No.41', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0332', 'Andi Permana', '08247031375', 'Jl. Thamrin No.38', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0333', 'Gita Santoso', '0836995314', 'Jl. Diponegoro No.156', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0334', 'Intan Rahma', '0854853989', 'Jl. Thamrin No.170', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0335', 'Eka Permana', '08664535037', 'Jl. Diponegoro No.190', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0336', 'Joko Santoso', '08428263488', 'Jl. Thamrin No.37', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0337', 'Hendra Halim', '08911227929', 'Jl. Thamrin No.89', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0338', 'Gita Nugroho', '08516425908', 'Jl. Gatot Subroto No.72', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0339', 'Fajar Setiawan', '0864192958', 'Jl. Merdeka No.41', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0340', 'Deni Santoso', '08167534780', 'Jl. Sudirman No.25', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0341', 'Deni Rahma', '0822374866', 'Jl. Gatot Subroto No.162', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0342', 'Andi Kusuma', '08573690112', 'Jl. Sudirman No.134', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0343', 'Andi Pratama', '0889148617', 'Jl. Diponegoro No.63', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0344', 'Eka Pratama', '08122810198', 'Jl. Sudirman No.171', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0345', 'Intan Rahma', '08781835529', 'Jl. Thamrin No.187', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0346', 'Budi Wijaya', '08129981057', 'Jl. Gatot Subroto No.20', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0347', 'Budi Saputra', '08527177077', 'Jl. Thamrin No.36', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0348', 'Andi Nugroho', '08782505540', 'Jl. Gatot Subroto No.200', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0349', 'Fajar Wijaya', '0811090783', 'Jl. Merdeka No.128', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0350', 'Citra Nugroho', '08900168530', 'Jl. Sudirman No.19', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0351', 'Hendra Halim', '08637943740', 'Jl. Gatot Subroto No.189', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0352', 'Andi Pratama', '0862851343', 'Jl. Diponegoro No.77', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0353', 'Eka Saputra', '08239986524', 'Jl. Sudirman No.14', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0354', 'Citra Rahma', '08865837772', 'Jl. Thamrin No.146', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0355', 'Budi Permana', '08932294923', 'Jl. Diponegoro No.19', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0356', 'Gita Halim', '08585158077', 'Jl. Gatot Subroto No.150', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0357', 'Gita Santoso', '0851212083', 'Jl. Sudirman No.87', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0358', 'Eka Permana', '08256764308', 'Jl. Merdeka No.28', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0359', 'Hendra Santoso', '08464618907', 'Jl. Merdeka No.2', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0360', 'Gita Pratama', '08461949083', 'Jl. Sudirman No.74', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0361', 'Fajar Setiawan', '08197573682', 'Jl. Thamrin No.64', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0362', 'Budi Wijaya', '08855718529', 'Jl. Thamrin No.187', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0363', 'Fajar Nugroho', '08335956411', 'Jl. Sudirman No.19', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0364', 'Eka Halim', '08841282202', 'Jl. Sudirman No.114', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0365', 'Joko Kusuma', '08795212163', 'Jl. Thamrin No.126', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0366', 'Andi Nugroho', '08299823665', 'Jl. Diponegoro No.37', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0367', 'Gita Santoso', '08847346685', 'Jl. Gatot Subroto No.13', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0368', 'Eka Saputra', '08520984185', 'Jl. Thamrin No.153', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0369', 'Intan Nugroho', '08192447130', 'Jl. Diponegoro No.27', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0370', 'Gita Setiawan', '08685085411', 'Jl. Thamrin No.2', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0371', 'Budi Nugroho', '08857347782', 'Jl. Merdeka No.180', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0372', 'Fajar Saputra', '0852097321', 'Jl. Diponegoro No.176', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0373', 'Deni Halim', '08854929213', 'Jl. Merdeka No.145', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0374', 'Eka Saputra', '08464676976', 'Jl. Merdeka No.62', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0375', 'Andi Permana', '08131056925', 'Jl. Diponegoro No.166', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0376', 'Gita Santoso', '08584464747', 'Jl. Gatot Subroto No.184', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0377', 'Intan Wijaya', '0866870800', 'Jl. Diponegoro No.65', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0378', 'Gita Permana', '08953078654', 'Jl. Thamrin No.54', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0379', 'Andi Saputra', '08185803366', 'Jl. Merdeka No.63', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0380', 'Joko Rahma', '08632853750', 'Jl. Diponegoro No.25', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0381', 'Hendra Kusuma', '0862690162', 'Jl. Thamrin No.28', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0382', 'Andi Setiawan', '08204134589', 'Jl. Sudirman No.47', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0383', 'Andi Halim', '08166236933', 'Jl. Gatot Subroto No.46', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0384', 'Fajar Kusuma', '08747241530', 'Jl. Gatot Subroto No.103', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0385', 'Intan Pratama', '08503829414', 'Jl. Thamrin No.79', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0386', 'Joko Wijaya', '0826083982', 'Jl. Thamrin No.126', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0387', 'Gita Kusuma', '08676651686', 'Jl. Thamrin No.124', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0388', 'Hendra Wijaya', '08671920805', 'Jl. Thamrin No.67', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0389', 'Gita Rahma', '08241734382', 'Jl. Diponegoro No.125', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0390', 'Budi Wijaya', '08930577779', 'Jl. Merdeka No.168', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0391', 'Hendra Santoso', '08450271930', 'Jl. Thamrin No.131', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0392', 'Gita Saputra', '08408142900', 'Jl. Gatot Subroto No.64', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0393', 'Fajar Kusuma', '0838719076', 'Jl. Merdeka No.56', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0394', 'Deni Kusuma', '08795494965', 'Jl. Sudirman No.8', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0395', 'Andi Permana', '0898344308', 'Jl. Merdeka No.151', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0396', 'Fajar Santoso', '08270202043', 'Jl. Gatot Subroto No.91', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0397', 'Deni Permana', '08958973661', 'Jl. Merdeka No.2', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0398', 'Budi Halim', '08824856505', 'Jl. Diponegoro No.161', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0399', 'Gita Nugroho', '08449077419', 'Jl. Sudirman No.122', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0400', 'Budi Saputra', '08545083539', 'Jl. Merdeka No.113', 1);

-- Insert Sepatu
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0301', 'Nike', 'Loafers', 'Putih', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0317', 'Nike', 'Loafers', 'Biru', '39', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0347', 'Reebok', 'Loafers', 'Biru', '39', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0332', 'Vans', 'Boots', 'Merah', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0364', 'Adidas', 'Sneakers', 'Merah', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0395', 'Reebok', 'Sneakers', 'Putih', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0396', 'Reebok', 'Heels', 'Putih', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0316', 'Vans', 'Sneakers', 'Biru', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0398', 'Adidas', 'Sandals', 'Merah', 'M', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0388', 'Nike', 'Sneakers', 'Hitam', '39', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0367', 'Puma', 'Heels', 'Putih', '41', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0380', 'Adidas', 'Heels', 'Hijau', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0324', 'Nike', 'Sneakers', 'Biru', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0379', 'Nike', 'Loafers', 'Hijau', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0317', 'Reebok', 'Loafers', 'Biru', '41', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0370', 'Puma', 'Heels', 'Hijau', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0358', 'Reebok', 'Heels', 'Biru', 'S', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0317', 'Nike', 'Loafers', 'Hijau', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0303', 'Puma', 'Sneakers', 'Hijau', 'M', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0323', 'Vans', 'Sandals', 'Hijau', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0369', 'Reebok', 'Heels', 'Biru', '38', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0317', 'Nike', 'Sneakers', 'Putih', '40', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0331', 'Adidas', 'Sandals', 'Hitam', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0331', 'Adidas', 'Boots', 'Merah', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0398', 'Vans', 'Sandals', 'Hijau', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0357', 'Vans', 'Sandals', 'Putih', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0344', 'Reebok', 'Heels', 'Hitam', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0317', 'Reebok', 'Loafers', 'Merah', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0358', 'Reebok', 'Boots', 'Merah', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0333', 'Reebok', 'Sneakers', 'Biru', 'S', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0386', 'Puma', 'Boots', 'Biru', 'L', 1);      
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0374', 'Puma', 'Sandals', 'Hijau', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0368', 'Vans', 'Heels', 'Merah', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0323', 'Nike', 'Sneakers', 'Putih', '41', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0309', 'Nike', 'Heels', 'Hijau', 'M', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0327', 'Reebok', 'Sandals', 'Putih', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0357', 'Reebok', 'Loafers', 'Biru', 'L', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0332', 'Reebok', 'Heels', 'Biru', '42', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0341', 'Reebok', 'Heels', 'Merah', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0390', 'Adidas', 'Heels', 'Hitam', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0370', 'Puma', 'Heels', 'Merah', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0321', 'Adidas', 'Boots', 'Hitam', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0334', 'Reebok', 'Sneakers', 'Hitam', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0377', 'Vans', 'Loafers', 'Merah', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0301', 'Puma', 'Boots', 'Hitam', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0319', 'Nike', 'Heels', 'Hitam', 'L', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0358', 'Reebok', 'Sneakers', 'Putih', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0390', 'Reebok', 'Sandals', 'Biru', '38', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0361', 'Adidas', 'Sneakers', 'Biru', 'L', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0366', 'Vans', 'Sandals', 'Hitam', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0347', 'Puma', 'Sneakers', 'Merah', 'L', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0396', 'Puma', 'Loafers', 'Hijau', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0330', 'Vans', 'Sneakers', 'Putih', 'S', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0386', 'Puma', 'Sneakers', 'Merah', '40', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0382', 'Vans', 'Boots', 'Putih', 'M', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0378', 'Puma', 'Sneakers', 'Merah', '39', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0327', 'Puma', 'Loafers', 'Hitam', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0377', 'Reebok', 'Loafers', 'Hijau', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0331', 'Adidas', 'Sneakers', 'Hijau', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0305', 'Adidas', 'Heels', 'Hijau', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0315', 'Adidas', 'Boots', 'Hijau', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0346', 'Adidas', 'Loafers', 'Hijau', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0332', 'Adidas', 'Loafers', 'Putih', 'S', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0314', 'Nike', 'Boots', 'Hijau', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0343', 'Vans', 'Sandals', 'Hijau', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0367', 'Nike', 'Heels', 'Putih', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0348', 'Adidas', 'Sneakers', 'Hijau', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0334', 'Nike', 'Sneakers', 'Hijau', 'S', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0310', 'Puma', 'Sneakers', 'Putih', 'L', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0390', 'Reebok', 'Loafers', 'Hitam', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0337', 'Reebok', 'Boots', 'Biru', '38', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0394', 'Reebok', 'Sandals', 'Merah', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0387', 'Puma', 'Sneakers', 'Hitam', '38', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0371', 'Puma', 'Boots', 'Putih', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0382', 'Reebok', 'Heels', 'Merah', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0348', 'Puma', 'Boots', 'Hitam', '38', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0337', 'Adidas', 'Loafers', 'Merah', 'M', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0400', 'Nike', 'Sandals', 'Putih', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0346', 'Vans', 'Sandals', 'Putih', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0340', 'Puma', 'Loafers', 'Biru', 'S', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0355', 'Puma', 'Boots', 'Biru', '39', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0392', 'Puma', 'Loafers', 'Hitam', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0326', 'Adidas', 'Sandals', 'Biru', 'M', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0341', 'Nike', 'Boots', 'Biru', '38', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0331', 'Reebok', 'Loafers', 'Putih', 'L', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0326', 'Puma', 'Sneakers', 'Hitam', '41', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0338', 'Reebok', 'Sneakers', 'Biru', 'S', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0308', 'Nike', 'Heels', 'Putih', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0378', 'Puma', 'Heels', 'Hijau', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0310', 'Reebok', 'Sneakers', 'Merah', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0377', 'Vans', 'Sandals', 'Hitam', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0336', 'Nike', 'Boots', 'Merah', 'M', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0387', 'Vans', 'Sandals', 'Merah', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0302', 'Puma', 'Heels', 'Merah', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0396', 'Puma', 'Loafers', 'Merah', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0321', 'Nike', 'Sandals', 'Merah', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0301', 'Reebok', 'Boots', 'Merah', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0319', 'Adidas', 'Sandals', 'Merah', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0311', 'Adidas', 'Heels', 'Putih', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0391', 'Nike', 'Heels', 'Putih', 'XL', 1);    

-- Insert Transaksi
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0387', 301, 178825.87, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0382', 302, 287987.75, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0359', 303, 117590.98, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0353', 304, 449753.74, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0320', 305, 33586.33, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0328', 306, 421374.79, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0334', 307, 178009.83, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0311', 308, 384414.28, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0374', 309, 248055.37, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0302', 310, 22463.9, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0365', 311, 24619.92, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0397', 312, 222133.02, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0369', 313, 225853.33, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0378', 314, 484814.31, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0305', 315, 271447.61, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0362', 316, 340910.33, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0346', 317, 375619.31, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0375', 318, 332018.38, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0306', 319, 255167.54, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0385', 320, 53961.61, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0375', 321, 54059.31, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0361', 322, 147669.37, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0329', 323, 385675.42, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0349', 324, 396757.4, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0369', 325, 280678.18, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0342', 326, 394865.32, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0317', 327, 302433.15, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0326', 328, 315221.42, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0396', 329, 370253.36, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0363', 330, 241152.57, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0305', 331, 161979.7, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0356', 332, 168339.54, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0373', 333, 308885.66, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0330', 334, 446023.94, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0304', 335, 83835.3, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0380', 336, 327686.92, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0335', 337, 211822.09, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0392', 338, 240104.4, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0322', 339, 333137.99, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0390', 340, 323848.58, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0348', 341, 170113.66, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0344', 342, 402373.57, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0379', 343, 244237.22, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0313', 344, 438772.1, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0344', 345, 487666.11, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0302', 346, 466485.84, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0351', 347, 318843.69, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0350', 348, 361433.3, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0353', 349, 486483.17, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0331', 350, 276972.16, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0326', 351, 28251.3, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0397', 352, 79851.58, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0307', 353, 178276.93, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0376', 354, 236912.77, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0373', 355, 474628.43, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0307', 356, 384430.48, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0311', 357, 240022.66, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0370', 358, 107115.82, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0309', 359, 431307.13, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0399', 360, 352303.31, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0342', 361, 37182.41, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0392', 362, 59096.14, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0304', 363, 272529.45, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0382', 364, 178422.36, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0309', 365, 340227.97, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0344', 366, 428527.7, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0319', 367, 158073.76, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0352', 368, 451310.55, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0384', 369, 180756.18, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0366', 370, 60728.12, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0358', 371, 145779.22, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0315', 372, 205485.26, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0327', 373, 358269.76, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0345', 374, 480585.28, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0305', 375, 227582.23, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0359', 376, 205771.73, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0378', 377, 36139.54, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0362', 378, 445793.93, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0347', 379, 11292.74, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0372', 380, 185524.37, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0348', 381, 253615.66, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0379', 382, 303015.53, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0375', 383, 462681.55, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0304', 384, 30082.89, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0390', 385, 129815.63, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0394', 386, 360520.43, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0321', 387, 237243.44, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0312', 388, 47047.49, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0336', 389, 63879.18, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0400', 390, 148034.34, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0301', 391, 212766.46, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0303', 392, 266245.71, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0375', 393, 280843.62, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0397', 394, 253610.97, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0370', 395, 191048.67, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0328', 396, 248601.78, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0359', 397, 318683.07, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0335', 398, 169332.73, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0384', 399, 320040.66, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0359', 400, 73660.04, 'Proses', 1);

-- Insert Barang_Konsumsi
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 12, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 48, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 60, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 25, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 18, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 16, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 2, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 94, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 87, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 97, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 64, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 85, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 58, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 14, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 1, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 88, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 59, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 10, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 86, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 99, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 0, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 94, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 76, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 33, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 76, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 30, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 93, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 47, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 76, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 29, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 85, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 37, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 72, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 40, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 47, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 24, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 90, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 60, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 62, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 40, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 68, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 34, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 61, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 40, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 13, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 36, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 99, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 84, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 56, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 12, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 33, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 55, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 29, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 23, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 78, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 63, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 83, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 23, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 54, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 39, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 18, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 57, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 46, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 47, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 57, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 79, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 15, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 40, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 68, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 36, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 39, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 48, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 71, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 8, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 39, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 26, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 89, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 66, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 66, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 100, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 42, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 24, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 95, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 81, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 74, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 84, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 84, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 14, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 28, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 92, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 69, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 5, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 77, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 72, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 35, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 79, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 41, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 87, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 30, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 24, 'pcs', 1);

-- Insert Maintenance_Alat_Laundry
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-09-29', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-01-11', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-25', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-02-04', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-02-06', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-12-28', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-02-15', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-03-27', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-02-01', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-11-29', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-08-08', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-10-16', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-03-23', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-08-14', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-11-17', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-04-29', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-07-04', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-07-25', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-07-31', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-05-14', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-04-10', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-06-06', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-05-17', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-06-05', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-02-21', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-01-07', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-11-02', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-01-21', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-07-10', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-11-27', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-03-21', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-10-02', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-04-21', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-08-05', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-08-19', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-11-23', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-06-18', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-03-08', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-09-12', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-11-28', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-04-27', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-05-03', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-03-15', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-01-13', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-01-01', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-09-07', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-01-09', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-11-02', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-07-09', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-01-24', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-03-03', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-09-02', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-12-03', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-12-14', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-05-25', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-05-15', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-02-14', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-02-05', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-03-14', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-10-15', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-02-07', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-01-30', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-12-04', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-04-13', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-08-20', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-03-01', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-09', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-05-24', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-05-28', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-03-29', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-03-12', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-02-28', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-06-24', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-08-13', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-01-26', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-01-03', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-06-29', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-08-28', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-03-16', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-09-16', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-23', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-12-11', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-02-10', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-07-08', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-01-09', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-11-30', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-05-19', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-07-09', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-11-12', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-06-23', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-10-18', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-06-24', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-04-26', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-08-18', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-06-19', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-03-27', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-08-14', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-08-06', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-09-21', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-11-30', 'Perawatan rutin', 1);


            --== 501-600 ==--

-- Insert Pelanggan
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0401', 'Hendra Halim', '08317065105', 'Jl. Thamrin No.165', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0402', 'Joko Setiawan', '08839930480', 'Jl. Gatot Subroto No.173', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0403', 'Joko Rahma', '08218280151', 'Jl. Thamrin No.166', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0404', 'Andi Rahma', '08863312314', 'Jl. Merdeka No.164', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0405', 'Intan Saputra', '0819049732', 'Jl. Diponegoro No.28', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0406', 'Intan Santoso', '08540565874', 'Jl. Merdeka No.127', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0407', 'Budi Pratama', '08752425192', 'Jl. Thamrin No.58', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0408', 'Hendra Kusuma', '08479862495', 'Jl. Thamrin No.60', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0409', 'Eka Wijaya', '08247240038', 'Jl. Diponegoro No.49', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0410', 'Andi Permana', '08844908163', 'Jl. Gatot Subroto No.19', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0411', 'Intan Rahma', '08522487367', 'Jl. Gatot Subroto No.158', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0412', 'Gita Setiawan', '08651487354', 'Jl. Diponegoro No.116', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0413', 'Deni Wijaya', '08395051128', 'Jl. Sudirman No.54', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0414', 'Deni Halim', '08331364999', 'Jl. Sudirman No.18', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0415', 'Citra Santoso', '08542266928', 'Jl. Diponegoro No.165', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0416', 'Deni Pratama', '08528426822', 'Jl. Diponegoro No.12', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0417', 'Fajar Santoso', '0833560408', 'Jl. Diponegoro No.63', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0418', 'Eka Rahma', '0869369128', 'Jl. Sudirman No.82', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0419', 'Eka Pratama', '08478588363', 'Jl. Gatot Subroto No.48', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0420', 'Citra Saputra', '08147232248', 'Jl. Gatot Subroto No.22', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0421', 'Fajar Wijaya', '08110027637', 'Jl. Diponegoro No.173', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0422', 'Intan Rahma', '08893805299', 'Jl. Gatot Subroto No.185', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0423', 'Andi Permana', '08309799752', 'Jl. Merdeka No.150', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0424', 'Joko Kusuma', '08304332375', 'Jl. Merdeka No.52', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0425', 'Citra Kusuma', '08168748105', 'Jl. Thamrin No.153', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0426', 'Citra Pratama', '0890577683', 'Jl. Diponegoro No.1', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0427', 'Citra Setiawan', '08731481553', 'Jl. Merdeka No.86', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0428', 'Andi Rahma', '08102294149', 'Jl. Sudirman No.182', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0429', 'Intan Halim', '08907636585', 'Jl. Merdeka No.1', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0430', 'Gita Permana', '08226341545', 'Jl. Sudirman No.139', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0431', 'Budi Halim', '08666878239', 'Jl. Diponegoro No.16', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0432', 'Joko Setiawan', '08418088374', 'Jl. Merdeka No.77', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0433', 'Citra Pratama', '08630908494', 'Jl. Merdeka No.192', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0434', 'Joko Wijaya', '08364951646', 'Jl. Merdeka No.21', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0435', 'Fajar Permana', '08780719954', 'Jl. Merdeka No.111', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0436', 'Andi Wijaya', '08852401537', 'Jl. Sudirman No.155', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0437', 'Hendra Saputra', '08250977270', 'Jl. Thamrin No.33', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0438', 'Gita Halim', '08871485806', 'Jl. Diponegoro No.120', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0439', 'Gita Saputra', '0818612184', 'Jl. Thamrin No.92', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0440', 'Andi Pratama', '08159649179', 'Jl. Gatot Subroto No.103', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0441', 'Budi Nugroho', '08415822400', 'Jl. Merdeka No.19', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0442', 'Joko Nugroho', '0819303039', 'Jl. Diponegoro No.54', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0443', 'Gita Pratama', '08341857962', 'Jl. Thamrin No.17', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0444', 'Budi Permana', '0889572222', 'Jl. Diponegoro No.200', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0445', 'Andi Wijaya', '08160088137', 'Jl. Sudirman No.71', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0446', 'Eka Kusuma', '08993750591', 'Jl. Sudirman No.134', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0447', 'Budi Pratama', '0821693891', 'Jl. Thamrin No.129', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0448', 'Joko Permana', '08178471291', 'Jl. Gatot Subroto No.149', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0449', 'Eka Saputra', '08975120343', 'Jl. Thamrin No.122', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0450', 'Eka Saputra', '08537637680', 'Jl. Diponegoro No.84', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0451', 'Intan Rahma', '08478087448', 'Jl. Diponegoro No.142', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0452', 'Fajar Wijaya', '08220958805', 'Jl. Merdeka No.45', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0453', 'Gita Nugroho', '08193259161', 'Jl. Thamrin No.64', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0454', 'Deni Kusuma', '08278452701', 'Jl. Gatot Subroto No.21', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0455', 'Fajar Permana', '08459441172', 'Jl. Merdeka No.134', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0456', 'Andi Wijaya', '08465003428', 'Jl. Merdeka No.4', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0457', 'Andi Nugroho', '0860066374', 'Jl. Gatot Subroto No.99', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0458', 'Fajar Rahma', '08311254738', 'Jl. Diponegoro No.181', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0459', 'Deni Setiawan', '0878750954', 'Jl. Gatot Subroto No.25', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0460', 'Budi Nugroho', '0874723019', 'Jl. Thamrin No.50', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0461', 'Gita Permana', '0862776162', 'Jl. Diponegoro No.85', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0462', 'Budi Wijaya', '08566082553', 'Jl. Merdeka No.189', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0463', 'Eka Kusuma', '0891958366', 'Jl. Diponegoro No.104', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0464', 'Joko Saputra', '08855737940', 'Jl. Merdeka No.124', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0465', 'Budi Setiawan', '08726659198', 'Jl. Thamrin No.74', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0466', 'Deni Nugroho', '08487806599', 'Jl. Diponegoro No.75', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0467', 'Intan Saputra', '08773001562', 'Jl. Sudirman No.42', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0468', 'Joko Nugroho', '08555114351', 'Jl. Thamrin No.168', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0469', 'Deni Saputra', '08659206725', 'Jl. Merdeka No.80', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0470', 'Joko Permana', '0819285644', 'Jl. Sudirman No.170', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0471', 'Intan Halim', '0862070419', 'Jl. Merdeka No.16', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0472', 'Intan Halim', '08248825328', 'Jl. Thamrin No.117', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0473', 'Gita Nugroho', '08269751262', 'Jl. Diponegoro No.3', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0474', 'Intan Wijaya', '08298387905', 'Jl. Sudirman No.151', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0475', 'Deni Permana', '0810998315', 'Jl. Merdeka No.125', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0476', 'Deni Pratama', '08705418708', 'Jl. Thamrin No.15', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0477', 'Joko Setiawan', '0859531761', 'Jl. Thamrin No.83', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0478', 'Hendra Pratama', '0823145117', 'Jl. Gatot Subroto No.37', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0479', 'Budi Santoso', '08537901276', 'Jl. Sudirman No.49', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0480', 'Deni Pratama', '08609497907', 'Jl. Diponegoro No.181', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0481', 'Hendra Kusuma', '08792749636', 'Jl. Thamrin No.102', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0482', 'Citra Rahma', '0814342273', 'Jl. Diponegoro No.99', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0483', 'Budi Permana', '08653617300', 'Jl. Diponegoro No.84', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0484', 'Fajar Permana', '08610849394', 'Jl. Sudirman No.29', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0485', 'Citra Wijaya', '08813043661', 'Jl. Gatot Subroto No.28', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0486', 'Joko Permana', '0872835151', 'Jl. Merdeka No.75', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0487', 'Hendra Setiawan', '0882185527', 'Jl. Merdeka No.152', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0488', 'Fajar Nugroho', '0862579309', 'Jl. Sudirman No.101', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0489', 'Citra Setiawan', '08511404416', 'Jl. Diponegoro No.102', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0490', 'Joko Nugroho', '08761152305', 'Jl. Thamrin No.132', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0491', 'Eka Santoso', '0845087303', 'Jl. Diponegoro No.87', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0492', 'Intan Santoso', '0836144559', 'Jl. Thamrin No.115', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0493', 'Gita Saputra', '0882193200', 'Jl. Merdeka No.192', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0494', 'Deni Wijaya', '08566621560', 'Jl. Thamrin No.48', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0495', 'Joko Rahma', '08965762538', 'Jl. Thamrin No.37', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0496', 'Deni Wijaya', '08948590521', 'Jl. Merdeka No.154', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0497', 'Citra Permana', '08740192093', 'Jl. Sudirman No.195', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0498', 'Fajar Pratama', '0857630298', 'Jl. Sudirman No.197', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0499', 'Budi Saputra', '08143468407', 'Jl. Gatot Subroto No.150', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0500', 'Joko Nugroho', '0845543948', 'Jl. Merdeka No.155', 1);

-- Insert Sepatu
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0419', 'Puma', 'Heels', 'Merah', 'M', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0418', 'Puma', 'Loafers', 'Hijau', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0427', 'Vans', 'Loafers', 'Biru', 'M', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0480', 'Puma', 'Heels', 'Hitam', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0500', 'Reebok', 'Loafers', 'Hitam', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0405', 'Vans', 'Boots', 'Hitam', '38', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0410', 'Adidas', 'Heels', 'Hitam', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0494', 'Puma', 'Boots', 'Putih', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0473', 'Vans', 'Loafers', 'Hitam', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0423', 'Reebok', 'Heels', 'Merah', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0414', 'Puma', 'Loafers', 'Hijau', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0466', 'Vans', 'Loafers', 'Merah', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0419', 'Adidas', 'Sneakers', 'Biru', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0497', 'Nike', 'Sneakers', 'Biru', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0431', 'Puma', 'Loafers', 'Hijau', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0497', 'Reebok', 'Loafers', 'Hijau', 'L', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0486', 'Reebok', 'Loafers', 'Hitam', 'S', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0459', 'Nike', 'Heels', 'Hijau', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0409', 'Puma', 'Sandals', 'Hijau', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0418', 'Adidas', 'Sneakers', 'Hijau', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0493', 'Nike', 'Heels', 'Putih', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0402', 'Adidas', 'Boots', 'Merah', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0418', 'Reebok', 'Boots', 'Hitam', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0489', 'Puma', 'Sneakers', 'Putih', 'XL', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0425', 'Vans', 'Sandals', 'Merah', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0402', 'Puma', 'Sandals', 'Putih', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0434', 'Vans', 'Loafers', 'Hitam', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0486', 'Vans', 'Loafers', 'Hijau', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0403', 'Nike', 'Sandals', 'Merah', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0476', 'Adidas', 'Sandals', 'Hijau', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0452', 'Reebok', 'Sneakers', 'Hijau', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0467', 'Adidas', 'Sneakers', 'Putih', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0448', 'Adidas', 'Sandals', 'Biru', 'L', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0440', 'Vans', 'Sandals', 'Hijau', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0495', 'Vans', 'Heels', 'Putih', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0494', 'Vans', 'Sneakers', 'Biru', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0461', 'Puma', 'Loafers', 'Biru', '42', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0493', 'Adidas', 'Boots', 'Hijau', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0475', 'Adidas', 'Heels', 'Putih', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0414', 'Nike', 'Sandals', 'Biru', 'M', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0446', 'Vans', 'Heels', 'Hitam', '41', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0447', 'Reebok', 'Loafers', 'Hijau', 'L', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0467', 'Puma', 'Boots', 'Merah', 'L', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0414', 'Vans', 'Sneakers', 'Hitam', 'L', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0465', 'Reebok', 'Sandals', 'Biru', '42', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0462', 'Adidas', 'Sandals', 'Hitam', 'M', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0452', 'Nike', 'Sneakers', 'Biru', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0448', 'Reebok', 'Sneakers', 'Hitam', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0477', 'Nike', 'Sandals', 'Biru', '39', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0446', 'Nike', 'Sandals', 'Biru', 'L', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0444', 'Vans', 'Sneakers', 'Hitam', 'XL', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0446', 'Adidas', 'Boots', 'Putih', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0458', 'Reebok', 'Sandals', 'Biru', '39', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0401', 'Reebok', 'Loafers', 'Biru', '41', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0463', 'Adidas', 'Boots', 'Hitam', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0409', 'Nike', 'Heels', 'Biru', 'S', 1);      
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0500', 'Nike', 'Loafers', 'Hitam', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0454', 'Nike', 'Sandals', 'Biru', '41', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0414', 'Adidas', 'Sneakers', 'Putih', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0436', 'Puma', 'Heels', 'Putih', 'L', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0488', 'Reebok', 'Sneakers', 'Putih', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0467', 'Puma', 'Sneakers', 'Biru', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0486', 'Puma', 'Heels', 'Merah', '41', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0466', 'Adidas', 'Heels', 'Putih', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0489', 'Puma', 'Sneakers', 'Merah', '42', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0457', 'Nike', 'Sandals', 'Hitam', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0422', 'Reebok', 'Boots', 'Putih', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0417', 'Vans', 'Loafers', 'Putih', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0405', 'Adidas', 'Boots', 'Hijau', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0496', 'Nike', 'Sneakers', 'Merah', '39', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0492', 'Vans', 'Boots', 'Hitam', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0428', 'Adidas', 'Heels', 'Merah', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0421', 'Vans', 'Sandals', 'Putih', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0418', 'Nike', 'Heels', 'Hitam', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0453', 'Adidas', 'Sneakers', 'Putih', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0454', 'Vans', 'Boots', 'Hitam', '40', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0421', 'Puma', 'Sneakers', 'Hijau', '41', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0471', 'Adidas', 'Loafers', 'Biru', '40', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0409', 'Puma', 'Loafers', 'Hijau', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0407', 'Vans', 'Sandals', 'Merah', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0422', 'Nike', 'Sandals', 'Hijau', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0480', 'Adidas', 'Sneakers', 'Putih', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0485', 'Reebok', 'Loafers', 'Biru', '40', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0412', 'Nike', 'Boots', 'Putih', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0484', 'Puma', 'Heels', 'Hijau', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0488', 'Vans', 'Sneakers', 'Hijau', '40', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0481', 'Vans', 'Sneakers', 'Hitam', '42', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0403', 'Adidas', 'Boots', 'Hijau', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0489', 'Vans', 'Heels', 'Putih', '41', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0472', 'Adidas', 'Loafers', 'Putih', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0417', 'Puma', 'Sneakers', 'Putih', '39', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0490', 'Reebok', 'Sandals', 'Hijau', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0451', 'Puma', 'Sneakers', 'Biru', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0477', 'Adidas', 'Loafers', 'Biru', 'S', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0405', 'Adidas', 'Loafers', 'Hitam', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0478', 'Adidas', 'Loafers', 'Putih', 'S', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0454', 'Nike', 'Sandals', 'Hitam', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0451', 'Adidas', 'Heels', 'Putih', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0433', 'Reebok', 'Sneakers', 'Hijau', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0491', 'Adidas', 'Sandals', 'Putih', '38', 1);

-- Insert Transaksi
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0422', 401, 400720.09, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0461', 402, 293868.16, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0435', 403, 443254.55, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0469', 404, 248215.88, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0418', 405, 63694.04, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0430', 406, 290076.74, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0469', 407, 391194.88, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0499', 408, 224545.49, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0475', 409, 152159.84, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0486', 410, 446512.33, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0457', 411, 47459.66, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0438', 412, 306860.13, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0482', 413, 308400.25, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0403', 414, 29639.72, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0423', 415, 61934.9, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0428', 416, 403906.93, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0478', 417, 461253.01, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0430', 418, 168023.35, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0462', 419, 434967.69, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0445', 420, 260281.3, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0420', 421, 28311.4, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0469', 422, 495460.69, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0403', 423, 140530.8, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0472', 424, 445909.03, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0493', 425, 436080.6, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0498', 426, 243423.22, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0408', 427, 256009.52, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0493', 428, 396776.44, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0500', 429, 83636.95, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0482', 430, 350137.74, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0447', 431, 228962.69, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0447', 432, 234886.84, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0474', 433, 134136.88, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0436', 434, 305656.29, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0421', 435, 401595.99, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0446', 436, 485452.12, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0466', 437, 66842.95, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0452', 438, 167551.47, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0465', 439, 296621.4, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0459', 440, 328835.8, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0475', 441, 379007.82, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0454', 442, 184900.96, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0451', 443, 293422.91, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0446', 444, 150199.56, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0414', 445, 399555.21, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0418', 446, 378437.8, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0434', 447, 461014.15, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0404', 448, 440056.75, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0436', 449, 280193.67, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0444', 450, 406439.07, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0490', 451, 384772.3, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0463', 452, 216649.53, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0481', 453, 359704.62, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0479', 454, 352928.37, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0479', 455, 36593.17, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0408', 456, 99259.17, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0492', 457, 25070.97, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0408', 458, 225305.47, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0499', 459, 267183.06, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0495', 460, 292236.91, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0452', 461, 192281.21, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0450', 462, 15384.87, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0437', 463, 30650.85, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0420', 464, 329825.66, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0444', 465, 450308.83, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0436', 466, 415806.85, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0412', 467, 449453.18, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0447', 468, 179800.65, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0445', 469, 269015.68, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0494', 470, 198293.46, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0456', 471, 432242.91, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0430', 472, 345156.85, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0401', 473, 283871.37, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0438', 474, 372894.5, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0454', 475, 47525.7, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0451', 476, 472006.69, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0416', 477, 448765.43, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0462', 478, 71112.35, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0475', 479, 182226.85, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0496', 480, 162924.27, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0498', 481, 403707.25, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0429', 482, 259623.36, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0476', 483, 311269.35, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0435', 484, 379221.18, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0404', 485, 348199.8, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0444', 486, 214113.72, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0403', 487, 200961.76, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0429', 488, 429087.62, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0438', 489, 475665.81, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0425', 490, 32650.84, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0452', 491, 224219.19, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0444', 492, 116697.62, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0411', 493, 395205.15, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0479', 494, 136828.04, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0468', 495, 64852.94, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0406', 496, 96983.32, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0411', 497, 285888.72, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0463', 498, 129656.54, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0412', 499, 361504.28, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0402', 500, 11288.74, 'Selesai', 1);

-- Insert Barang_Konsumsi
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 24, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 54, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 65, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 53, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 39, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 0, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 76, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 41, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 77, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 28, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 37, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 92, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 76, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 29, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 22, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 24, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 65, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 24, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 16, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 86, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 91, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 63, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 39, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 21, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 35, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 7, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 19, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 43, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 1, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 67, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 37, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 95, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 0, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 40, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 2, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 35, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 81, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 29, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 19, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 85, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 42, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 1, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 53, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 15, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 1, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 64, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 66, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 63, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 96, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 100, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 15, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 42, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 14, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 79, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 24, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 14, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 7, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 36, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 87, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 99, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 12, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 40, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 43, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 35, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 90, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 95, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 83, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 30, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 67, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 39, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 98, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 44, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 74, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 88, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 99, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 57, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 54, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 12, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 54, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 69, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 37, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 16, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 100, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 92, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 96, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 5, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 81, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 19, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 3, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 76, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 99, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 59, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 15, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 83, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 59, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 8, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 68, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 45, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 84, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 74, 'kg', 1);

-- Insert Maintenance_Alat_Laundry
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-07-15', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-06-22', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-01-13', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-01-26', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-05-14', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-05-31', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-05-08', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-09-02', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-01-06', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-03-13', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-11-07', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-03-11', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-05-29', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-05-15', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-06-03', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-02-24', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-03-21', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-01-09', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-07-24', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-01-12', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-05-30', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-07-24', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-09-12', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-06-13', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-02-16', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-01-11', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-19', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-11-30', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-06-07', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-06-24', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-08-18', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-01-28', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-08-24', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-11-19', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-01-22', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-02-19', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-06-23', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-03-05', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-07-06', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-01-13', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-01-13', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-03-04', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-03-22', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-02-20', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-04-03', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-12-02', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-04-20', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-04-16', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-01-20', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-05-23', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-07-22', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-08-06', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-02-24', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-04-12', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-04-20', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-10-15', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-06-14', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-09-09', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-05-09', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-04-08', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-02-03', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-03-12', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-11-27', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-01-18', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-02-14', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-05-08', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-01-13', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-11-04', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-08-19', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-08-04', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-07-28', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-02-12', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-10-18', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-05-22', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-05-19', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-04-11', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-11-05', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-01-06', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-02-05', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-01-25', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-10-01', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-04-02', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-03-15', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-01-21', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-05-03', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-02-09', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-07-26', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-04-08', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-10-12', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-04-04', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-09-27', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-05-29', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-02-25', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-09-26', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-02-08', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-06-14', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-06-29', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-04-10', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-07-13', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-10-06', 'Pembersihan mendalam', 1);


                --== 501-600 ==--

-- Insert Pelanggan
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0501', 'Budi Rahma', '08191051360', 'Jl. Sudirman No.17', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0502', 'Intan Setiawan', '0898809239', 'Jl. Thamrin No.95', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0503', 'Budi Nugroho', '08320711333', 'Jl. Thamrin No.192', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0504', 'Intan Setiawan', '0879826748', 'Jl. Thamrin No.55', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0505', 'Citra Rahma', '08565826479', 'Jl. Sudirman No.156', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0506', 'Intan Halim', '08925438869', 'Jl. Thamrin No.132', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0507', 'Andi Permana', '08808533778', 'Jl. Diponegoro No.198', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0508', 'Fajar Setiawan', '08702311119', 'Jl. Merdeka No.118', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0509', 'Fajar Kusuma', '08904761674', 'Jl. Sudirman No.151', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0510', 'Joko Rahma', '0832261545', 'Jl. Thamrin No.134', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0511', 'Deni Pratama', '08255241231', 'Jl. Sudirman No.89', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0512', 'Fajar Pratama', '0886240591', 'Jl. Gatot Subroto No.44', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0513', 'Deni Permana', '08808290124', 'Jl. Sudirman No.176', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0514', 'Budi Permana', '08380636590', 'Jl. Gatot Subroto No.76', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0515', 'Hendra Setiawan', '0893203684', 'Jl. Merdeka No.60', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0516', 'Joko Nugroho', '08164764337', 'Jl. Gatot Subroto No.160', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0517', 'Eka Santoso', '08752301453', 'Jl. Sudirman No.18', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0518', 'Budi Pratama', '08598135317', 'Jl. Sudirman No.191', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0519', 'Gita Wijaya', '0827764308', 'Jl. Thamrin No.105', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0520', 'Andi Pratama', '08413795369', 'Jl. Thamrin No.51', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0521', 'Joko Kusuma', '08905607851', 'Jl. Sudirman No.13', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0522', 'Gita Rahma', '0835729243', 'Jl. Thamrin No.199', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0523', 'Budi Wijaya', '0865803606', 'Jl. Thamrin No.122', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0524', 'Intan Rahma', '08873158215', 'Jl. Thamrin No.38', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0525', 'Citra Wijaya', '08379707753', 'Jl. Thamrin No.174', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0526', 'Fajar Rahma', '08296433761', 'Jl. Merdeka No.69', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0527', 'Intan Wijaya', '08648178706', 'Jl. Sudirman No.44', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0528', 'Intan Wijaya', '0814682130', 'Jl. Sudirman No.101', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0529', 'Eka Nugroho', '0835701501', 'Jl. Diponegoro No.42', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0530', 'Joko Saputra', '08647742697', 'Jl. Thamrin No.112', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0531', 'Eka Pratama', '08663802429', 'Jl. Sudirman No.103', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0532', 'Intan Kusuma', '0887267959', 'Jl. Thamrin No.145', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0533', 'Citra Wijaya', '0827352448', 'Jl. Sudirman No.54', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0534', 'Gita Permana', '08926688135', 'Jl. Merdeka No.76', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0535', 'Fajar Halim', '08972234193', 'Jl. Merdeka No.50', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0536', 'Deni Kusuma', '08131836030', 'Jl. Diponegoro No.156', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0537', 'Gita Pratama', '0878128413', 'Jl. Gatot Subroto No.192', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0538', 'Andi Nugroho', '08927083867', 'Jl. Sudirman No.115', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0539', 'Fajar Halim', '08604639456', 'Jl. Merdeka No.22', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0540', 'Budi Saputra', '08543325977', 'Jl. Thamrin No.82', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0541', 'Intan Santoso', '08382405284', 'Jl. Merdeka No.90', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0542', 'Fajar Kusuma', '08633350076', 'Jl. Merdeka No.97', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0543', 'Joko Saputra', '0846712151', 'Jl. Sudirman No.76', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0544', 'Eka Wijaya', '08998792577', 'Jl. Merdeka No.30', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0545', 'Gita Kusuma', '08973293168', 'Jl. Thamrin No.57', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0546', 'Eka Halim', '08822059634', 'Jl. Diponegoro No.78', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0547', 'Fajar Halim', '08215962927', 'Jl. Diponegoro No.173', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0548', 'Budi Santoso', '08264108820', 'Jl. Sudirman No.145', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0549', 'Citra Wijaya', '0819551767', 'Jl. Merdeka No.95', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0550', 'Gita Setiawan', '0869714478', 'Jl. Gatot Subroto No.12', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0551', 'Deni Nugroho', '08817208437', 'Jl. Thamrin No.185', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0552', 'Eka Wijaya', '08995491497', 'Jl. Sudirman No.35', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0553', 'Fajar Saputra', '08831312390', 'Jl. Gatot Subroto No.86', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0554', 'Joko Rahma', '08444440040', 'Jl. Gatot Subroto No.107', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0555', 'Citra Saputra', '08878233850', 'Jl. Sudirman No.107', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0556', 'Budi Rahma', '0815607507', 'Jl. Thamrin No.46', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0557', 'Budi Nugroho', '08491143671', 'Jl. Sudirman No.99', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0558', 'Citra Setiawan', '0845940421', 'Jl. Diponegoro No.41', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0559', 'Andi Saputra', '08610138475', 'Jl. Thamrin No.108', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0560', 'Fajar Pratama', '08234904152', 'Jl. Diponegoro No.163', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0561', 'Intan Kusuma', '08113863749', 'Jl. Thamrin No.56', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0562', 'Fajar Saputra', '08213084743', 'Jl. Gatot Subroto No.97', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0563', 'Eka Saputra', '0827724073', 'Jl. Merdeka No.189', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0564', 'Hendra Santoso', '0826126746', 'Jl. Gatot Subroto No.147', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0565', 'Andi Wijaya', '08166773912', 'Jl. Merdeka No.26', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0566', 'Deni Nugroho', '08537330214', 'Jl. Diponegoro No.196', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0567', 'Fajar Pratama', '08141970236', 'Jl. Gatot Subroto No.151', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0568', 'Intan Rahma', '08598967458', 'Jl. Sudirman No.98', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0569', 'Citra Setiawan', '08144743775', 'Jl. Merdeka No.197', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0570', 'Gita Pratama', '08601220151', 'Jl. Merdeka No.131', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0571', 'Hendra Halim', '08526493121', 'Jl. Sudirman No.199', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0572', 'Joko Rahma', '0863516538', 'Jl. Gatot Subroto No.89', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0573', 'Gita Pratama', '08182683978', 'Jl. Gatot Subroto No.166', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0574', 'Hendra Permana', '08863697099', 'Jl. Merdeka No.30', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0575', 'Hendra Halim', '08593072160', 'Jl. Gatot Subroto No.12', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0576', 'Eka Setiawan', '0834006750', 'Jl. Diponegoro No.106', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0577', 'Citra Permana', '08215128996', 'Jl. Thamrin No.130', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0578', 'Joko Rahma', '0836166830', 'Jl. Diponegoro No.93', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0579', 'Eka Pratama', '08585619892', 'Jl. Thamrin No.47', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0580', 'Citra Permana', '08869685529', 'Jl. Gatot Subroto No.9', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0581', 'Andi Halim', '08629597550', 'Jl. Thamrin No.93', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0582', 'Citra Halim', '08284628327', 'Jl. Gatot Subroto No.67', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0583', 'Hendra Rahma', '08298829319', 'Jl. Diponegoro No.110', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0584', 'Joko Halim', '08351286848', 'Jl. Diponegoro No.70', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0585', 'Intan Kusuma', '08970158460', 'Jl. Thamrin No.124', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0586', 'Citra Saputra', '08827103541', 'Jl. Gatot Subroto No.147', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0587', 'Gita Nugroho', '08867838235', 'Jl. Gatot Subroto No.185', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0588', 'Eka Kusuma', '08461268678', 'Jl. Gatot Subroto No.1', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0589', 'Andi Saputra', '08418854085', 'Jl. Thamrin No.68', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0590', 'Andi Setiawan', '08862068894', 'Jl. Thamrin No.2', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0591', 'Deni Permana', '08741101701', 'Jl. Merdeka No.98', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0592', 'Fajar Halim', '0867783453', 'Jl. Sudirman No.46', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0593', 'Joko Rahma', '08395146715', 'Jl. Sudirman No.70', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0594', 'Intan Rahma', '08529212385', 'Jl. Gatot Subroto No.160', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0595', 'Fajar Setiawan', '08421673598', 'Jl. Merdeka No.45', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0596', 'Gita Wijaya', '08781416671', 'Jl. Diponegoro No.61', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0597', 'Fajar Nugroho', '0890552696', 'Jl. Diponegoro No.160', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0598', 'Intan Saputra', '08890629345', 'Jl. Thamrin No.131', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0599', 'Fajar Setiawan', '08173389694', 'Jl. Merdeka No.133', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0600', 'Joko Setiawan', '0878954969', 'Jl. Sudirman No.3', 1);

-- Insert Sepatu
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0572', 'Vans', 'Sneakers', 'Biru', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0559', 'Reebok', 'Heels', 'Hitam', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0543', 'Reebok', 'Heels', 'Hitam', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0586', 'Nike', 'Sandals', 'Biru', '39', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0567', 'Vans', 'Loafers', 'Biru', '38', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0518', 'Nike', 'Heels', 'Biru', 'L', 1);      
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0578', 'Nike', 'Sneakers', 'Hijau', '38', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0518', 'Puma', 'Sneakers', 'Merah', '40', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0530', 'Nike', 'Loafers', 'Hitam', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0513', 'Adidas', 'Sneakers', 'Hijau', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0562', 'Adidas', 'Sandals', 'Putih', 'M', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0576', 'Adidas', 'Sandals', 'Hitam', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0540', 'Puma', 'Heels', 'Biru', '41', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0548', 'Adidas', 'Boots', 'Putih', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0584', 'Puma', 'Loafers', 'Biru', 'XL', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0516', 'Adidas', 'Boots', 'Hijau', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0553', 'Adidas', 'Boots', 'Putih', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0505', 'Reebok', 'Loafers', 'Biru', '38', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0524', 'Adidas', 'Sandals', 'Hijau', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0552', 'Nike', 'Sneakers', 'Hijau', 'S', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0549', 'Puma', 'Loafers', 'Merah', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0580', 'Adidas', 'Heels', 'Merah', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0557', 'Vans', 'Boots', 'Putih', '41', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0516', 'Nike', 'Boots', 'Hijau', '41', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0559', 'Vans', 'Sneakers', 'Merah', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0519', 'Adidas', 'Sandals', 'Hijau', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0514', 'Puma', 'Heels', 'Hitam', 'L', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0545', 'Reebok', 'Sandals', 'Hijau', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0586', 'Adidas', 'Heels', 'Biru', 'XL', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0533', 'Adidas', 'Sneakers', 'Merah', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0580', 'Adidas', 'Sneakers', 'Putih', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0522', 'Nike', 'Sneakers', 'Hitam', 'L', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0590', 'Puma', 'Heels', 'Hitam', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0587', 'Nike', 'Sneakers', 'Hijau', '42', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0567', 'Adidas', 'Sandals', 'Hitam', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0584', 'Puma', 'Heels', 'Merah', '38', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0535', 'Adidas', 'Loafers', 'Hijau', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0567', 'Nike', 'Heels', 'Biru', 'M', 1);      
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0539', 'Puma', 'Sandals', 'Merah', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0505', 'Vans', 'Boots', 'Hitam', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0595', 'Puma', 'Boots', 'Biru', 'L', 1);      
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0513', 'Reebok', 'Boots', 'Putih', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0576', 'Vans', 'Loafers', 'Merah', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0570', 'Vans', 'Heels', 'Putih', '38', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0591', 'Nike', 'Boots', 'Putih', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0569', 'Vans', 'Loafers', 'Hijau', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0591', 'Nike', 'Sneakers', 'Putih', 'S', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0570', 'Puma', 'Loafers', 'Hijau', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0591', 'Reebok', 'Boots', 'Hijau', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0547', 'Nike', 'Heels', 'Hitam', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0559', 'Adidas', 'Loafers', 'Merah', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0520', 'Adidas', 'Boots', 'Putih', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0574', 'Puma', 'Boots', 'Putih', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0539', 'Adidas', 'Boots', 'Biru', '39', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0536', 'Puma', 'Sneakers', 'Hitam', 'M', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0537', 'Reebok', 'Heels', 'Hijau', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0555', 'Vans', 'Sandals', 'Biru', '42', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0540', 'Reebok', 'Heels', 'Putih', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0593', 'Puma', 'Sneakers', 'Hitam', '42', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0595', 'Vans', 'Heels', 'Biru', '42', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0503', 'Adidas', 'Boots', 'Biru', '42', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0600', 'Puma', 'Boots', 'Putih', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0565', 'Adidas', 'Loafers', 'Putih', 'L', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0510', 'Nike', 'Sandals', 'Hijau', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0541', 'Adidas', 'Boots', 'Merah', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0555', 'Reebok', 'Loafers', 'Hijau', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0572', 'Reebok', 'Heels', 'Putih', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0543', 'Reebok', 'Loafers', 'Hitam', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0537', 'Nike', 'Boots', 'Biru', '38', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0524', 'Adidas', 'Sneakers', 'Hijau', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0559', 'Adidas', 'Heels', 'Hitam', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0547', 'Adidas', 'Sandals', 'Hitam', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0555', 'Puma', 'Sandals', 'Hijau', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0547', 'Vans', 'Sneakers', 'Merah', 'M', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0534', 'Puma', 'Loafers', 'Merah', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0592', 'Vans', 'Loafers', 'Biru', '40', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0525', 'Puma', 'Sneakers', 'Biru', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0565', 'Puma', 'Heels', 'Putih', 'M', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0560', 'Vans', 'Heels', 'Hijau', 'M', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0529', 'Vans', 'Heels', 'Biru', '41', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0526', 'Adidas', 'Sneakers', 'Hitam', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0583', 'Nike', 'Sneakers', 'Merah', '40', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0513', 'Reebok', 'Boots', 'Putih', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0590', 'Nike', 'Boots', 'Putih', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0519', 'Puma', 'Loafers', 'Hijau', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0544', 'Puma', 'Boots', 'Hitam', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0532', 'Vans', 'Heels', 'Putih', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0537', 'Nike', 'Heels', 'Hitam', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0547', 'Nike', 'Sandals', 'Putih', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0542', 'Adidas', 'Sneakers', 'Hitam', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0568', 'Adidas', 'Heels', 'Biru', 'XL', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0538', 'Nike', 'Loafers', 'Putih', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0581', 'Vans', 'Heels', 'Biru', '38', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0596', 'Puma', 'Sandals', 'Hijau', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0508', 'Nike', 'Sneakers', 'Putih', '40', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0512', 'Vans', 'Heels', 'Merah', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0504', 'Adidas', 'Boots', 'Hijau', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0508', 'Vans', 'Sneakers', 'Merah', 'M', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0509', 'Vans', 'Heels', 'Hitam', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0547', 'Nike', 'Heels', 'Hitam', '42', 1);    

-- Insert Transaksi
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0526', 501, 420643.79, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0554', 502, 109469.93, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0516', 503, 134923.89, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0505', 504, 269406.86, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0580', 505, 325434.3, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0576', 506, 384008.14, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0586', 507, 311132.22, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0597', 508, 24082.15, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0514', 509, 447303.43, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0519', 510, 497723.21, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0576', 511, 492387.24, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0502', 512, 415277.17, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0565', 513, 277592.42, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0578', 514, 411727.23, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0598', 515, 111705.39, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0535', 516, 258861.11, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0546', 517, 339945.65, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0580', 518, 422932.46, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0501', 519, 382452.33, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0526', 520, 223869.07, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0584', 521, 498204.68, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0568', 522, 408430.74, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0573', 523, 125747.73, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0539', 524, 77466.74, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0555', 525, 280850.29, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0542', 526, 173796.96, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0566', 527, 120645.93, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0562', 528, 28008.23, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0552', 529, 378591.57, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0545', 530, 92043.78, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0548', 531, 311709.77, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0547', 532, 96575.13, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0600', 533, 183452.15, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0555', 534, 178795.95, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0548', 535, 453119.75, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0536', 536, 425828.8, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0580', 537, 323768.69, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0589', 538, 324205.37, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0571', 539, 487188.96, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0575', 540, 25702.24, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0597', 541, 361104.33, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0551', 542, 405845.46, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0507', 543, 105830.84, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0532', 544, 473580.54, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0541', 545, 243581.98, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0584', 546, 117324.63, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0529', 547, 367331.76, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0580', 548, 55417.54, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0529', 549, 354031.73, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0521', 550, 375947.57, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0567', 551, 165961.9, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0501', 552, 497437.81, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0563', 553, 255105.53, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0543', 554, 29887.72, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0552', 555, 347902.23, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0536', 556, 93582.7, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0583', 557, 58590.94, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0565', 558, 192494.35, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0544', 559, 197002.61, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0574', 560, 140516.57, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0554', 561, 194730.81, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0524', 562, 97532.35, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0512', 563, 77500.98, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0539', 564, 212882.71, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0593', 565, 459071.72, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0560', 566, 191167.21, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0545', 567, 389144.06, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0506', 568, 232784.93, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0534', 569, 151880.3, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0553', 570, 186075.59, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0593', 571, 48994.7, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0574', 572, 430190.35, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0562', 573, 72256.26, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0567', 574, 264557.21, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0565', 575, 407067.31, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0600', 576, 160000.79, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0522', 577, 450258.86, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0528', 578, 395947.84, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0513', 579, 453049.43, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0576', 580, 164394.74, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0527', 581, 144704.99, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0583', 582, 30939.39, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0594', 583, 418728.1, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0570', 584, 338454.36, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0600', 585, 157183.18, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0529', 586, 239772.78, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0543', 587, 409052.41, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0586', 588, 331809.08, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0581', 589, 36796.8, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0502', 590, 286449.83, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0524', 591, 167929.28, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0522', 592, 278700.62, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0575', 593, 218144.28, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0540', 594, 179124.39, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0534', 595, 48779.15, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0539', 596, 493389.12, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0545', 597, 78505.52, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0551', 598, 227652.45, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0517', 599, 33321.55, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0576', 600, 228223.77, 'Proses', 1);

-- Insert Barang_Konsumsi
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 11, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 35, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 100, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 48, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 62, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 98, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 85, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 56, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 42, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 30, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 73, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 24, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 37, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 31, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 52, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 71, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 7, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 5, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 75, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 63, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 76, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 23, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 27, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 89, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 59, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 54, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 68, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 61, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 68, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 90, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 7, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 23, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 83, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 98, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 42, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 82, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 6, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 87, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 100, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 4, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 25, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 51, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 69, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 35, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 79, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 92, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 29, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 89, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 42, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 38, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 99, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 43, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 28, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 52, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 74, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 74, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 95, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 90, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 15, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 99, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 51, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 74, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 69, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 42, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 93, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 18, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 49, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 26, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 11, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 70, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 82, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 19, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 64, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 30, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 68, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 38, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 15, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 73, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 70, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 83, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 99, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 62, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 98, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 22, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 29, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 43, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 69, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 95, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 30, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 52, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 44, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 2, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 44, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 75, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 72, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 61, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 26, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 91, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 77, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 95, 'ltr', 1);

-- Insert Maintenance_Alat_Laundry
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-09-16', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-11-29', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-09-02', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-12-02', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-10-16', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-08-21', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-09-23', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-11-19', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-01-07', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-09-30', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-08-30', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-02-03', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-04-27', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-04-26', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-10-31', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-01-31', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-01-19', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-06-08', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-11-01', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-07-21', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-09-22', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-09-03', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-09-05', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-12-27', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-06-28', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-04-23', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-07-28', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-05-22', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-04-23', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-03-13', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-05-16', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-04-09', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-11-16', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-09-08', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-08-09', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-05-27', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-06-03', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-08-09', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-01-23', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-08-17', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-03-21', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-07-11', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-11-12', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-08-02', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-04-18', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-10-07', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-08-17', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-01-01', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-04-11', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-05-05', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-11-01', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-07-26', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-12-27', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-12-18', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-06-13', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-01-27', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-02-16', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-08-25', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-08-27', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-02-18', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-06-17', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-07-09', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-01-30', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-03-26', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-04-23', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-04-10', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-12-23', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-04-25', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-01-31', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-09-06', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-08-15', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-11-11', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-01-31', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-28', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-04-14', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-09-05', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-02-28', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-01-18', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-07-03', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-03-08', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-10-01', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-12-25', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-07-13', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-02-06', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-07-13', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-10-13', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-05-05', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-03-02', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-08-03', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-11-22', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-08-16', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-01-07', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-05-25', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-06-13', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-08-25', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-01-25', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-06-25', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-09-14', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-06-24', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-11-07', 'Penggantian suku cadang', 1);


                --== 601-700 ==--

-- Insert Pelanggan
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0601', 'Intan Kusuma', '08882273167', 'Jl. Diponegoro No.36', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0602', 'Eka Rahma', '08457089206', 'Jl. Diponegoro No.62', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0603', 'Fajar Wijaya', '08119260853', 'Jl. Sudirman No.69', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0604', 'Intan Santoso', '08883831841', 'Jl. Gatot Subroto No.178', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0605', 'Joko Saputra', '0851293047', 'Jl. Thamrin No.89', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0606', 'Budi Halim', '08266623363', 'Jl. Merdeka No.153', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0607', 'Joko Nugroho', '08318927217', 'Jl. Merdeka No.123', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0608', 'Intan Kusuma', '08807184462', 'Jl. Merdeka No.65', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0609', 'Hendra Kusuma', '0892733474', 'Jl. Diponegoro No.66', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0610', 'Fajar Permana', '08679837757', 'Jl. Gatot Subroto No.193', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0611', 'Fajar Permana', '08556984967', 'Jl. Sudirman No.190', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0612', 'Gita Pratama', '08325446183', 'Jl. Merdeka No.108', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0613', 'Gita Kusuma', '08683432121', 'Jl. Thamrin No.100', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0614', 'Deni Pratama', '08323917205', 'Jl. Gatot Subroto No.155', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0615', 'Deni Saputra', '08816675183', 'Jl. Gatot Subroto No.67', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0616', 'Fajar Santoso', '08365374135', 'Jl. Diponegoro No.29', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0617', 'Budi Permana', '08241716736', 'Jl. Gatot Subroto No.77', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0618', 'Joko Santoso', '0851171144', 'Jl. Thamrin No.13', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0619', 'Eka Permana', '08987405671', 'Jl. Sudirman No.110', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0620', 'Budi Saputra', '08869881359', 'Jl. Diponegoro No.8', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0621', 'Intan Wijaya', '08794015734', 'Jl. Merdeka No.82', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0622', 'Eka Wijaya', '0813782066', 'Jl. Sudirman No.140', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0623', 'Eka Rahma', '0864276986', 'Jl. Thamrin No.74', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0624', 'Intan Saputra', '08436926385', 'Jl. Thamrin No.134', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0625', 'Joko Wijaya', '08792897552', 'Jl. Gatot Subroto No.65', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0626', 'Joko Permana', '0833996962', 'Jl. Thamrin No.118', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0627', 'Budi Pratama', '08773654518', 'Jl. Thamrin No.12', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0628', 'Eka Wijaya', '0869313502', 'Jl. Thamrin No.153', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0629', 'Hendra Permana', '08725596469', 'Jl. Sudirman No.49', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0630', 'Budi Permana', '08610044740', 'Jl. Sudirman No.109', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0631', 'Eka Wijaya', '0894421927', 'Jl. Diponegoro No.42', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0632', 'Hendra Halim', '08745156269', 'Jl. Sudirman No.157', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0633', 'Andi Halim', '08504119594', 'Jl. Thamrin No.154', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0634', 'Budi Saputra', '0873429270', 'Jl. Sudirman No.88', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0635', 'Budi Setiawan', '08520142032', 'Jl. Merdeka No.93', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0636', 'Budi Santoso', '08397095106', 'Jl. Merdeka No.27', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0637', 'Andi Nugroho', '08127028767', 'Jl. Merdeka No.90', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0638', 'Deni Halim', '0829356106', 'Jl. Merdeka No.16', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0639', 'Intan Santoso', '0872134875', 'Jl. Diponegoro No.99', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0640', 'Gita Saputra', '0880898380', 'Jl. Gatot Subroto No.161', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0641', 'Andi Pratama', '0864253948', 'Jl. Merdeka No.9', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0642', 'Joko Saputra', '08763200710', 'Jl. Merdeka No.197', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0643', 'Gita Permana', '08649110880', 'Jl. Gatot Subroto No.187', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0644', 'Deni Setiawan', '08289773476', 'Jl. Diponegoro No.131', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0645', 'Andi Permana', '08606353215', 'Jl. Diponegoro No.166', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0646', 'Deni Pratama', '08132810682', 'Jl. Sudirman No.175', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0647', 'Intan Santoso', '08967180298', 'Jl. Gatot Subroto No.191', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0648', 'Andi Pratama', '08479736145', 'Jl. Thamrin No.5', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0649', 'Joko Rahma', '0817689707', 'Jl. Diponegoro No.20', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0650', 'Hendra Kusuma', '0881345589', 'Jl. Sudirman No.25', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0651', 'Joko Setiawan', '08927756478', 'Jl. Sudirman No.182', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0652', 'Citra Wijaya', '0817985252', 'Jl. Thamrin No.53', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0653', 'Andi Nugroho', '08307631021', 'Jl. Sudirman No.79', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0654', 'Hendra Rahma', '0873343130', 'Jl. Merdeka No.136', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0655', 'Citra Nugroho', '08992554536', 'Jl. Thamrin No.38', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0656', 'Fajar Rahma', '08833455088', 'Jl. Diponegoro No.134', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0657', 'Budi Halim', '08342572402', 'Jl. Thamrin No.35', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0658', 'Eka Saputra', '08120123005', 'Jl. Thamrin No.130', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0659', 'Intan Rahma', '0838296939', 'Jl. Gatot Subroto No.119', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0660', 'Citra Kusuma', '0873668128', 'Jl. Thamrin No.21', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0661', 'Hendra Rahma', '0843566603', 'Jl. Gatot Subroto No.178', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0662', 'Fajar Setiawan', '08928157155', 'Jl. Thamrin No.46', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0663', 'Budi Kusuma', '08976657309', 'Jl. Sudirman No.78', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0664', 'Gita Saputra', '0830162563', 'Jl. Thamrin No.104', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0665', 'Joko Santoso', '08352426908', 'Jl. Sudirman No.60', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0666', 'Deni Saputra', '08473835411', 'Jl. Gatot Subroto No.20', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0667', 'Gita Halim', '0865607611', 'Jl. Gatot Subroto No.79', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0668', 'Andi Saputra', '08435391163', 'Jl. Sudirman No.79', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0669', 'Joko Pratama', '08635354425', 'Jl. Thamrin No.53', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0670', 'Gita Permana', '08565941596', 'Jl. Merdeka No.53', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0671', 'Andi Saputra', '08690255444', 'Jl. Thamrin No.143', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0672', 'Hendra Santoso', '08974843345', 'Jl. Gatot Subroto No.190', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0673', 'Citra Saputra', '08730740216', 'Jl. Diponegoro No.142', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0674', 'Joko Setiawan', '08728214587', 'Jl. Sudirman No.5', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0675', 'Hendra Wijaya', '08852960448', 'Jl. Merdeka No.128', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0676', 'Hendra Kusuma', '08944089182', 'Jl. Diponegoro No.144', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0677', 'Gita Kusuma', '08473166146', 'Jl. Diponegoro No.185', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0678', 'Fajar Pratama', '08135781490', 'Jl. Diponegoro No.155', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0679', 'Citra Nugroho', '0810554375', 'Jl. Sudirman No.194', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0680', 'Budi Pratama', '08770704738', 'Jl. Sudirman No.72', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0681', 'Eka Kusuma', '08126418668', 'Jl. Diponegoro No.85', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0682', 'Intan Santoso', '0837901351', 'Jl. Thamrin No.35', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0683', 'Joko Nugroho', '08775979954', 'Jl. Sudirman No.144', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0684', 'Deni Pratama', '08608155038', 'Jl. Merdeka No.111', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0685', 'Budi Pratama', '08856633213', 'Jl. Diponegoro No.102', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0686', 'Andi Pratama', '0829673171', 'Jl. Sudirman No.48', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0687', 'Budi Santoso', '08470595169', 'Jl. Sudirman No.158', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0688', 'Andi Santoso', '0816619397', 'Jl. Thamrin No.168', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0689', 'Deni Santoso', '08187469506', 'Jl. Thamrin No.88', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0690', 'Fajar Nugroho', '08316305485', 'Jl. Merdeka No.69', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0691', 'Andi Permana', '08925686757', 'Jl. Diponegoro No.118', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0692', 'Joko Wijaya', '0857924553', 'Jl. Gatot Subroto No.75', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0693', 'Hendra Rahma', '08102608599', 'Jl. Diponegoro No.117', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0694', 'Citra Pratama', '08390066168', 'Jl. Merdeka No.95', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0695', 'Deni Halim', '08757851415', 'Jl. Diponegoro No.12', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0696', 'Gita Rahma', '0830519688', 'Jl. Thamrin No.33', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0697', 'Citra Nugroho', '08453162218', 'Jl. Gatot Subroto No.172', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0698', 'Intan Rahma', '08260547525', 'Jl. Diponegoro No.189', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0699', 'Deni Kusuma', '0832426903', 'Jl. Diponegoro No.28', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0700', 'Gita Rahma', '0891740585', 'Jl. Merdeka No.74', 1);

-- Insert Sepatu
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0694', 'Reebok', 'Loafers', 'Hijau', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0674', 'Vans', 'Sandals', 'Hitam', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0642', 'Nike', 'Sandals', 'Merah', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0699', 'Adidas', 'Sandals', 'Merah', 'M', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0646', 'Reebok', 'Boots', 'Merah', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0647', 'Puma', 'Sandals', 'Hijau', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0614', 'Nike', 'Sneakers', 'Putih', '38', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0679', 'Reebok', 'Sandals', 'Hijau', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0652', 'Puma', 'Sandals', 'Putih', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0656', 'Adidas', 'Sneakers', 'Merah', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0651', 'Reebok', 'Sandals', 'Merah', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0616', 'Nike', 'Sandals', 'Putih', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0631', 'Reebok', 'Boots', 'Biru', 'L', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0697', 'Nike', 'Sandals', 'Hijau', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0606', 'Nike', 'Sandals', 'Putih', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0646', 'Puma', 'Loafers', 'Putih', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0655', 'Puma', 'Sandals', 'Hijau', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0647', 'Puma', 'Loafers', 'Biru', '39', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0677', 'Adidas', 'Boots', 'Merah', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0660', 'Nike', 'Loafers', 'Hijau', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0657', 'Adidas', 'Loafers', 'Biru', '38', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0665', 'Puma', 'Loafers', 'Putih', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0683', 'Nike', 'Loafers', 'Putih', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0611', 'Reebok', 'Sneakers', 'Merah', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0647', 'Reebok', 'Sneakers', 'Putih', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0621', 'Vans', 'Heels', 'Hijau', '41', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0603', 'Vans', 'Heels', 'Hitam', '41', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0631', 'Nike', 'Loafers', 'Hijau', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0665', 'Adidas', 'Sandals', 'Biru', '41', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0605', 'Vans', 'Sandals', 'Hijau', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0652', 'Vans', 'Sandals', 'Hitam', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0601', 'Reebok', 'Heels', 'Putih', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0630', 'Vans', 'Loafers', 'Hitam', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0666', 'Puma', 'Loafers', 'Putih', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0627', 'Adidas', 'Sneakers', 'Hitam', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0651', 'Vans', 'Sneakers', 'Biru', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0603', 'Puma', 'Boots', 'Merah', 'L', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0658', 'Puma', 'Boots', 'Merah', '38', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0692', 'Adidas', 'Sneakers', 'Merah', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0698', 'Vans', 'Boots', 'Putih', '41', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0622', 'Adidas', 'Heels', 'Merah', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0647', 'Vans', 'Heels', 'Biru', 'L', 1);      
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0607', 'Reebok', 'Loafers', 'Merah', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0651', 'Reebok', 'Sneakers', 'Merah', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0646', 'Puma', 'Sandals', 'Hijau', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0689', 'Vans', 'Boots', 'Hijau', 'M', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0616', 'Reebok', 'Sneakers', 'Merah', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0622', 'Reebok', 'Loafers', 'Biru', '42', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0615', 'Reebok', 'Sandals', 'Biru', '40', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0623', 'Adidas', 'Loafers', 'Biru', '41', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0652', 'Adidas', 'Heels', 'Putih', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0648', 'Puma', 'Boots', 'Hijau', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0680', 'Nike', 'Sneakers', 'Merah', '41', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0645', 'Puma', 'Sneakers', 'Hitam', '40', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0618', 'Adidas', 'Sandals', 'Hijau', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0677', 'Vans', 'Heels', 'Putih', '40', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0637', 'Adidas', 'Loafers', 'Biru', '38', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0629', 'Vans', 'Sneakers', 'Hijau', 'L', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0630', 'Nike', 'Heels', 'Merah', '38', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0635', 'Vans', 'Heels', 'Hitam', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0697', 'Puma', 'Boots', 'Merah', '40', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0652', 'Reebok', 'Heels', 'Hijau', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0630', 'Puma', 'Sandals', 'Biru', 'M', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0607', 'Adidas', 'Loafers', 'Hijau', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0636', 'Adidas', 'Loafers', 'Biru', 'S', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0651', 'Adidas', 'Sneakers', 'Biru', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0681', 'Reebok', 'Boots', 'Merah', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0665', 'Adidas', 'Sandals', 'Biru', 'S', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0634', 'Puma', 'Sneakers', 'Merah', 'L', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0655', 'Puma', 'Heels', 'Hitam', 'L', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0636', 'Adidas', 'Sneakers', 'Biru', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0681', 'Vans', 'Sandals', 'Biru', 'XL', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0667', 'Nike', 'Heels', 'Merah', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0634', 'Vans', 'Loafers', 'Hitam', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0684', 'Puma', 'Loafers', 'Hijau', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0653', 'Reebok', 'Loafers', 'Hijau', 'S', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0698', 'Reebok', 'Heels', 'Hitam', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0644', 'Nike', 'Sandals', 'Biru', 'L', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0616', 'Puma', 'Loafers', 'Hijau', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0667', 'Vans', 'Sandals', 'Hitam', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0623', 'Reebok', 'Heels', 'Merah', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0673', 'Puma', 'Heels', 'Hijau', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0645', 'Puma', 'Boots', 'Biru', 'XL', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0619', 'Nike', 'Loafers', 'Merah', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0698', 'Vans', 'Heels', 'Merah', '41', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0686', 'Nike', 'Boots', 'Hitam', 'L', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0601', 'Puma', 'Loafers', 'Putih', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0653', 'Puma', 'Sneakers', 'Merah', 'L', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0627', 'Vans', 'Loafers', 'Hitam', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0658', 'Reebok', 'Sandals', 'Putih', 'S', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0674', 'Vans', 'Sandals', 'Hitam', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0694', 'Reebok', 'Sneakers', 'Merah', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0684', 'Nike', 'Heels', 'Hitam', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0689', 'Adidas', 'Sneakers', 'Hijau', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0692', 'Vans', 'Heels', 'Merah', '38', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0654', 'Reebok', 'Sandals', 'Merah', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0625', 'Adidas', 'Heels', 'Hitam', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0679', 'Nike', 'Heels', 'Biru', 'S', 1);      
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0636', 'Puma', 'Sandals', 'Biru', 'XL', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0606', 'Puma', 'Boots', 'Biru', 'XL', 1);     

-- Insert Transaksi
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0661', 601, 13100.25, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0669', 602, 188841.15, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0631', 603, 264574.41, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0621', 604, 93585.27, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0679', 605, 455640.88, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0629', 606, 258090.83, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0636', 607, 466754.21, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0615', 608, 436790.3, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0680', 609, 295248.77, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0667', 610, 16001.74, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0626', 611, 274582.79, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0622', 612, 248100.12, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0620', 613, 461850.48, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0608', 614, 37207.2, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0603', 615, 77113.88, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0620', 616, 497609.04, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0629', 617, 464952.4, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0662', 618, 401736.25, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0604', 619, 243100.74, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0607', 620, 12426.65, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0658', 621, 266804.16, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0685', 622, 197674.74, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0662', 623, 261761.13, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0676', 624, 355280.26, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0683', 625, 96769.77, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0690', 626, 18792.37, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0663', 627, 225077.47, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0681', 628, 454253.69, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0640', 629, 205401.03, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0655', 630, 410285.36, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0612', 631, 62046.53, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0662', 632, 289786.77, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0686', 633, 374372.81, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0684', 634, 33773.74, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0692', 635, 396466.09, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0661', 636, 168388.39, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0644', 637, 300488.0, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0604', 638, 30164.67, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0608', 639, 107856.64, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0681', 640, 228806.36, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0670', 641, 177006.58, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0636', 642, 458230.98, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0640', 643, 332891.82, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0652', 644, 168569.62, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0675', 645, 368175.26, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0660', 646, 312992.47, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0693', 647, 205204.02, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0685', 648, 266130.55, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0675', 649, 475011.19, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0604', 650, 326832.64, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0671', 651, 190917.17, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0691', 652, 411436.73, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0619', 653, 285260.9, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0637', 654, 177190.73, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0673', 655, 57961.53, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0658', 656, 378523.12, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0654', 657, 78900.18, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0691', 658, 344228.94, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0656', 659, 83209.95, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0629', 660, 387211.65, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0641', 661, 485365.87, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0639', 662, 69323.28, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0659', 663, 216534.36, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0683', 664, 451024.77, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0636', 665, 337084.43, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0628', 666, 74476.8, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0678', 667, 483155.61, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0693', 668, 316830.8, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0618', 669, 368820.61, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0638', 670, 466992.2, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0618', 671, 244293.74, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0634', 672, 16189.84, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0632', 673, 269046.48, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0609', 674, 79003.06, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0631', 675, 314520.63, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0685', 676, 249043.99, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0699', 677, 470776.65, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0677', 678, 220251.76, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0657', 679, 120633.18, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0647', 680, 340889.67, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0605', 681, 21757.42, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0666', 682, 251889.02, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0601', 683, 288705.9, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0611', 684, 260476.06, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0605', 685, 478789.67, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0700', 686, 250525.38, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0647', 687, 319688.5, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0606', 688, 192002.63, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0638', 689, 280142.58, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0635', 690, 53537.73, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0681', 691, 199400.94, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0696', 692, 327413.41, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0679', 693, 142150.48, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0644', 694, 284776.2, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0632', 695, 48893.02, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0630', 696, 342495.61, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0623', 697, 190462.13, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0670', 698, 157798.31, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0693', 699, 115171.19, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0632', 700, 52692.42, 'Dibatalkan', 1);

-- Insert Barang_Konsumsi
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 74, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 8, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 67, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 58, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 10, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 70, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 26, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 43, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 78, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 25, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 27, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 78, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 62, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 27, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 51, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 56, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 74, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 58, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 33, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 14, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 90, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 97, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 2, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 28, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 87, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 92, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 34, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 66, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 97, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 91, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 95, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 14, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 85, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 44, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 76, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 76, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 5, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 18, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 66, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 5, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 67, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 93, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 10, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 85, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 78, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 77, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 20, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 14, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 83, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 41, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 12, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 65, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 2, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 51, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 15, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 42, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 46, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 62, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 33, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 25, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 19, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 26, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 89, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 87, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 79, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 68, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 96, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 89, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 72, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 6, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 93, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 29, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 72, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 87, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 68, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 51, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 94, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 95, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 96, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 64, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 25, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 19, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 19, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 55, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 8, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 38, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 30, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 43, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 90, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 46, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 16, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 37, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 82, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 37, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 73, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 59, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 82, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 19, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 45, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 15, 'pcs', 1);

-- Insert Maintenance_Alat_Laundry
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-06-18', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-08-24', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-03-13', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-02-04', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-11-02', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-07-08', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-05-21', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-07-01', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-05-29', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-04-01', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-04-04', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-08-27', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-08-06', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-08-21', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-02-17', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-11-23', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-01-13', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-05-25', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-01-26', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-10-19', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-01-06', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-01-19', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-01-27', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-05-25', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-04-16', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-07-05', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-04-07', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-07-02', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-02-08', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-01-08', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-02-01', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-01-18', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-06-18', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-01-15', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-04-23', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-01-10', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-07-17', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-05-11', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-09-02', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-12-08', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-05-07', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-24', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-04-10', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-02-08', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-01-30', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-03-13', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-12-31', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-08-06', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-01-23', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-08-06', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-04', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-09-27', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-11-24', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-05-15', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-07-26', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-08-03', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-12-23', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-12-16', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-03-15', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-04-22', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-09-11', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-06-12', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-10-08', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-01-29', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-11-12', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-05-29', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-03-30', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-04-29', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-07-10', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-11-15', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-04-09', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-09-06', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-04-30', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-04-20', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-06-21', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-04-16', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-04-19', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-05-11', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-12-06', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-06-30', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-07-23', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-26', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-01-05', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-08-20', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-10-12', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-06-25', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-04-12', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-11-27', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-01-25', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-07-16', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-01-20', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-04-30', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-07-20', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-03-31', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-06-04', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-04-02', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-01-24', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-07-17', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-09-23', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-03-16', 'Penggantian suku cadang', 1);

                --== 701-800 ==--

-- Insert Pelanggan
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0701', 'Andi Nugroho', '08948534149', 'Jl. Merdeka No.148', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0702', 'Joko Nugroho', '08685775080', 'Jl. Diponegoro No.140', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0703', 'Deni Halim', '08682963801', 'Jl. Sudirman No.128', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0704', 'Deni Permana', '08394812663', 'Jl. Sudirman No.145', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0705', 'Eka Pratama', '08982650460', 'Jl. Thamrin No.62', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0706', 'Andi Wijaya', '08719743626', 'Jl. Gatot Subroto No.24', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0707', 'Citra Saputra', '08470469244', 'Jl. Merdeka No.84', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0708', 'Hendra Kusuma', '08513502002', 'Jl. Merdeka No.155', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0709', 'Budi Pratama', '08116543413', 'Jl. Merdeka No.8', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0710', 'Eka Permana', '08488080549', 'Jl. Merdeka No.166', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0711', 'Joko Kusuma', '0851136146', 'Jl. Thamrin No.135', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0712', 'Gita Setiawan', '08944764566', 'Jl. Diponegoro No.120', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0713', 'Deni Nugroho', '08408038094', 'Jl. Gatot Subroto No.4', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0714', 'Citra Rahma', '08456580980', 'Jl. Merdeka No.66', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0715', 'Hendra Santoso', '08307686746', 'Jl. Diponegoro No.174', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0716', 'Deni Wijaya', '08108966356', 'Jl. Diponegoro No.13', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0717', 'Fajar Pratama', '08943273698', 'Jl. Thamrin No.196', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0718', 'Intan Permana', '08287396122', 'Jl. Sudirman No.46', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0719', 'Andi Nugroho', '08726629789', 'Jl. Merdeka No.107', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0720', 'Joko Permana', '08723462014', 'Jl. Sudirman No.6', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0721', 'Deni Pratama', '08710828206', 'Jl. Thamrin No.61', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0722', 'Gita Nugroho', '08128695621', 'Jl. Gatot Subroto No.119', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0723', 'Eka Wijaya', '0810849988', 'Jl. Thamrin No.151', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0724', 'Deni Pratama', '0870298797', 'Jl. Thamrin No.121', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0725', 'Eka Rahma', '08386461653', 'Jl. Thamrin No.121', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0726', 'Fajar Rahma', '08440843295', 'Jl. Diponegoro No.103', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0727', 'Citra Santoso', '0877618419', 'Jl. Thamrin No.45', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0728', 'Andi Kusuma', '0821235446', 'Jl. Thamrin No.119', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0729', 'Joko Santoso', '0842294104', 'Jl. Gatot Subroto No.154', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0730', 'Andi Halim', '08961215807', 'Jl. Sudirman No.68', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0731', 'Eka Permana', '08336279474', 'Jl. Sudirman No.161', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0732', 'Eka Santoso', '08957303691', 'Jl. Gatot Subroto No.178', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0733', 'Deni Setiawan', '0891064034', 'Jl. Diponegoro No.131', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0734', 'Gita Setiawan', '08990298813', 'Jl. Diponegoro No.143', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0735', 'Hendra Santoso', '08806736090', 'Jl. Sudirman No.180', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0736', 'Eka Pratama', '08248869118', 'Jl. Diponegoro No.137', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0737', 'Eka Wijaya', '08225261014', 'Jl. Merdeka No.199', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0738', 'Eka Kusuma', '08458665820', 'Jl. Sudirman No.183', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0739', 'Citra Setiawan', '0844555862', 'Jl. Diponegoro No.17', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0740', 'Gita Permana', '0846246847', 'Jl. Sudirman No.58', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0741', 'Eka Santoso', '08951940942', 'Jl. Gatot Subroto No.13', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0742', 'Joko Pratama', '0869512070', 'Jl. Diponegoro No.30', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0743', 'Budi Halim', '08545368741', 'Jl. Thamrin No.38', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0744', 'Budi Pratama', '08400589193', 'Jl. Gatot Subroto No.181', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0745', 'Gita Santoso', '0844031324', 'Jl. Thamrin No.159', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0746', 'Hendra Kusuma', '08513588897', 'Jl. Gatot Subroto No.177', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0747', 'Citra Saputra', '08523968039', 'Jl. Gatot Subroto No.60', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0748', 'Andi Nugroho', '0883736305', 'Jl. Gatot Subroto No.17', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0749', 'Fajar Wijaya', '0896127425', 'Jl. Merdeka No.74', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0750', 'Citra Nugroho', '0865252297', 'Jl. Sudirman No.30', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0751', 'Andi Rahma', '08450838751', 'Jl. Merdeka No.82', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0752', 'Hendra Permana', '08478967818', 'Jl. Diponegoro No.167', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0753', 'Deni Permana', '08825138180', 'Jl. Gatot Subroto No.161', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0754', 'Joko Permana', '08109665743', 'Jl. Merdeka No.124', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0755', 'Gita Nugroho', '08845017603', 'Jl. Gatot Subroto No.71', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0756', 'Gita Nugroho', '08380349754', 'Jl. Merdeka No.165', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0757', 'Fajar Nugroho', '08488718542', 'Jl. Thamrin No.179', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0758', 'Citra Santoso', '08409095154', 'Jl. Thamrin No.72', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0759', 'Hendra Kusuma', '08865958589', 'Jl. Diponegoro No.117', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0760', 'Gita Saputra', '08226195439', 'Jl. Sudirman No.143', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0761', 'Joko Rahma', '08619549455', 'Jl. Thamrin No.49', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0762', 'Citra Pratama', '08461126333', 'Jl. Merdeka No.46', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0763', 'Joko Permana', '08955165018', 'Jl. Thamrin No.142', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0764', 'Citra Kusuma', '08699560502', 'Jl. Gatot Subroto No.151', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0765', 'Gita Wijaya', '08397841598', 'Jl. Gatot Subroto No.89', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0766', 'Intan Kusuma', '08964693534', 'Jl. Gatot Subroto No.134', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0767', 'Eka Pratama', '08566306410', 'Jl. Thamrin No.154', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0768', 'Hendra Halim', '08631978701', 'Jl. Diponegoro No.78', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0769', 'Intan Setiawan', '08213293429', 'Jl. Thamrin No.126', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0770', 'Hendra Saputra', '08697022011', 'Jl. Sudirman No.73', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0771', 'Gita Pratama', '08432153313', 'Jl. Diponegoro No.137', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0772', 'Andi Santoso', '08944065084', 'Jl. Merdeka No.3', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0773', 'Joko Pratama', '0816844852', 'Jl. Gatot Subroto No.117', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0774', 'Hendra Wijaya', '08623230695', 'Jl. Diponegoro No.57', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0775', 'Eka Halim', '08234046978', 'Jl. Sudirman No.200', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0776', 'Deni Nugroho', '0824418412', 'Jl. Sudirman No.38', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0777', 'Eka Halim', '08456466231', 'Jl. Merdeka No.45', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0778', 'Gita Pratama', '08683240607', 'Jl. Sudirman No.161', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0779', 'Joko Kusuma', '08601758454', 'Jl. Merdeka No.37', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0780', 'Citra Wijaya', '0835044280', 'Jl. Gatot Subroto No.88', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0781', 'Andi Pratama', '08470363071', 'Jl. Sudirman No.107', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0782', 'Budi Permana', '08770432743', 'Jl. Sudirman No.181', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0783', 'Budi Setiawan', '0837658468', 'Jl. Gatot Subroto No.182', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0784', 'Eka Kusuma', '08464248908', 'Jl. Sudirman No.71', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0785', 'Fajar Pratama', '08842033886', 'Jl. Diponegoro No.33', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0786', 'Intan Setiawan', '0811644476', 'Jl. Sudirman No.27', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0787', 'Joko Saputra', '08726259824', 'Jl. Merdeka No.7', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0788', 'Deni Setiawan', '08366151218', 'Jl. Sudirman No.59', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0789', 'Joko Permana', '0864388190', 'Jl. Sudirman No.152', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0790', 'Hendra Wijaya', '0827693423', 'Jl. Gatot Subroto No.55', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0791', 'Fajar Kusuma', '08820551959', 'Jl. Sudirman No.156', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0792', 'Budi Santoso', '0864845795', 'Jl. Gatot Subroto No.160', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0793', 'Andi Saputra', '0867433350', 'Jl. Thamrin No.187', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0794', 'Eka Wijaya', '08659696099', 'Jl. Sudirman No.186', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0795', 'Budi Kusuma', '08242957968', 'Jl. Thamrin No.169', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0796', 'Hendra Pratama', '0874560638', 'Jl. Diponegoro No.165', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0797', 'Gita Wijaya', '0829427565', 'Jl. Thamrin No.129', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0798', 'Deni Setiawan', '08144376364', 'Jl. Merdeka No.11', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0799', 'Budi Nugroho', '0856109781', 'Jl. Diponegoro No.112', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0800', 'Budi Rahma', '08567656836', 'Jl. Sudirman No.121', 1);

-- Insert Sepatu
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0755', 'Reebok', 'Heels', 'Hijau', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0759', 'Vans', 'Heels', 'Hitam', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0702', 'Puma', 'Loafers', 'Merah', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0764', 'Puma', 'Sandals', 'Hitam', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0780', 'Nike', 'Heels', 'Merah', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0730', 'Nike', 'Sandals', 'Biru', '39', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0725', 'Reebok', 'Sneakers', 'Merah', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0709', 'Reebok', 'Heels', 'Merah', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0773', 'Puma', 'Sandals', 'Hijau', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0741', 'Adidas', 'Sneakers', 'Hijau', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0746', 'Nike', 'Heels', 'Merah', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0785', 'Adidas', 'Sneakers', 'Merah', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0725', 'Vans', 'Loafers', 'Putih', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0723', 'Adidas', 'Sneakers', 'Merah', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0793', 'Adidas', 'Sneakers', 'Hitam', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0772', 'Vans', 'Sandals', 'Biru', '39', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0742', 'Vans', 'Boots', 'Putih', 'XL', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0787', 'Nike', 'Heels', 'Hijau', 'M', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0749', 'Reebok', 'Sneakers', 'Biru', 'L', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0764', 'Nike', 'Sandals', 'Hijau', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0737', 'Reebok', 'Loafers', 'Merah', 'M', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0786', 'Reebok', 'Loafers', 'Hitam', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0735', 'Nike', 'Sandals', 'Biru', 'L', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0718', 'Nike', 'Boots', 'Merah', '41', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0779', 'Puma', 'Sneakers', 'Hijau', '41', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0730', 'Puma', 'Heels', 'Hijau', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0721', 'Vans', 'Heels', 'Putih', '40', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0768', 'Puma', 'Sandals', 'Biru', '41', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0732', 'Nike', 'Sandals', 'Hijau', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0790', 'Puma', 'Sandals', 'Putih', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0706', 'Reebok', 'Boots', 'Merah', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0730', 'Nike', 'Sneakers', 'Putih', 'M', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0796', 'Nike', 'Heels', 'Hitam', '39', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0703', 'Puma', 'Loafers', 'Hijau', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0780', 'Reebok', 'Sneakers', 'Biru', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0701', 'Puma', 'Boots', 'Hijau', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0749', 'Nike', 'Heels', 'Merah', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0772', 'Vans', 'Sandals', 'Merah', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0781', 'Reebok', 'Sneakers', 'Merah', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0763', 'Reebok', 'Boots', 'Merah', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0790', 'Adidas', 'Heels', 'Hitam', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0731', 'Nike', 'Sneakers', 'Biru', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0794', 'Nike', 'Boots', 'Merah', 'M', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0776', 'Nike', 'Sneakers', 'Merah', '42', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0780', 'Vans', 'Sneakers', 'Putih', 'M', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0773', 'Adidas', 'Sandals', 'Biru', 'XL', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0756', 'Nike', 'Heels', 'Hijau', '40', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0742', 'Nike', 'Loafers', 'Hitam', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0770', 'Adidas', 'Heels', 'Biru', '41', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0799', 'Vans', 'Loafers', 'Putih', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0767', 'Reebok', 'Loafers', 'Hitam', 'S', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0722', 'Adidas', 'Loafers', 'Biru', 'L', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0752', 'Adidas', 'Loafers', 'Biru', '41', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0800', 'Puma', 'Sandals', 'Biru', '40', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0788', 'Vans', 'Loafers', 'Putih', '41', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0721', 'Puma', 'Loafers', 'Hijau', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0760', 'Nike', 'Heels', 'Hitam', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0746', 'Adidas', 'Sandals', 'Hijau', 'L', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0702', 'Puma', 'Loafers', 'Biru', '39', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0721', 'Vans', 'Loafers', 'Biru', '41', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0709', 'Adidas', 'Heels', 'Hijau', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0799', 'Reebok', 'Loafers', 'Biru', '39', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0752', 'Adidas', 'Loafers', 'Biru', '41', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0737', 'Reebok', 'Sneakers', 'Hitam', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0734', 'Puma', 'Loafers', 'Putih', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0705', 'Reebok', 'Boots', 'Hijau', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0770', 'Nike', 'Loafers', 'Hitam', 'L', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0790', 'Reebok', 'Boots', 'Hijau', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0770', 'Reebok', 'Boots', 'Merah', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0719', 'Adidas', 'Loafers', 'Merah', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0778', 'Nike', 'Sneakers', 'Hitam', '40', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0707', 'Vans', 'Sneakers', 'Hitam', 'L', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0778', 'Adidas', 'Sneakers', 'Biru', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0794', 'Puma', 'Sneakers', 'Hitam', '38', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0724', 'Puma', 'Sneakers', 'Biru', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0787', 'Puma', 'Sandals', 'Merah', '39', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0726', 'Adidas', 'Loafers', 'Biru', 'XL', 1); 
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0770', 'Nike', 'Loafers', 'Hijau', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0710', 'Adidas', 'Loafers', 'Hijau', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0758', 'Puma', 'Sandals', 'Hitam', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0731', 'Adidas', 'Sandals', 'Hijau', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0779', 'Vans', 'Heels', 'Putih', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0723', 'Vans', 'Heels', 'Hitam', '41', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0744', 'Reebok', 'Heels', 'Hijau', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0742', 'Puma', 'Heels', 'Merah', '38', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0778', 'Reebok', 'Sneakers', 'Biru', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0704', 'Puma', 'Heels', 'Hitam', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0754', 'Puma', 'Heels', 'Putih', '40', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0748', 'Vans', 'Sneakers', 'Putih', 'S', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0776', 'Puma', 'Boots', 'Biru', 'S', 1);      
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0763', 'Nike', 'Heels', 'Merah', '42', 1);    
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0758', 'Vans', 'Sneakers', 'Merah', 'L', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0733', 'Puma', 'Loafers', 'Putih', '38', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0753', 'Reebok', 'Heels', 'Hijau', '40', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0744', 'Reebok', 'Boots', 'Merah', 'S', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0760', 'Reebok', 'Heels', 'Hijau', '42', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0737', 'Reebok', 'Heels', 'Hijau', 'M', 1);   
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0779', 'Puma', 'Heels', 'Hijau', 'S', 1);     
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0776', 'Nike', 'Sandals', 'Hijau', 'XL', 1);  
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0721', 'Vans', 'Heels', 'Biru', 'S', 1);      

-- Insert Transaksi
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0748', 701, 50948.48, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0745', 702, 195672.29, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0799', 703, 27162.3, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0760', 704, 133911.49, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0790', 705, 377073.96, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0703', 706, 302177.71, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0771', 707, 492004.68, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0737', 708, 380486.04, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0782', 709, 17023.35, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0786', 710, 167568.29, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0730', 711, 409157.72, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0701', 712, 156738.84, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0792', 713, 483025.52, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0776', 714, 428557.91, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0774', 715, 454919.04, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0707', 716, 289473.33, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0732', 717, 195976.55, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0728', 718, 447392.36, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0702', 719, 20517.32, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0729', 720, 189635.88, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0718', 721, 14266.24, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0717', 722, 486029.58, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0751', 723, 341471.23, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0741', 724, 93825.88, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0701', 725, 314436.83, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0744', 726, 388621.47, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0780', 727, 105558.87, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0759', 728, 406076.38, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0758', 729, 476932.12, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0757', 730, 62468.84, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0716', 731, 49607.67, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0774', 732, 29514.46, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0780', 733, 403381.82, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0773', 734, 119201.07, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0768', 735, 394469.6, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0714', 736, 349679.15, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0720', 737, 436402.24, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0777', 738, 454679.06, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0731', 739, 120802.7, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0711', 740, 87350.28, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0714', 741, 269258.09, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0790', 742, 476366.89, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0798', 743, 410516.98, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0758', 744, 265044.59, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0745', 745, 191010.15, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0778', 746, 219654.96, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0739', 747, 16935.5, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0788', 748, 274663.79, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0759', 749, 451393.98, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0784', 750, 427235.85, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0773', 751, 213914.87, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0715', 752, 473770.65, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0784', 753, 309955.86, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0775', 754, 153355.84, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0783', 755, 464870.88, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0711', 756, 246290.66, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0717', 757, 205468.14, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0774', 758, 207334.74, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0754', 759, 201254.28, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0730', 760, 278439.29, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0796', 761, 74872.37, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0774', 762, 50721.91, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0796', 763, 139155.16, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0746', 764, 56248.83, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0767', 765, 138809.53, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0720', 766, 479842.78, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0703', 767, 336830.76, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0730', 768, 264843.72, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0753', 769, 370865.67, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0750', 770, 14871.36, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0724', 771, 436198.65, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0736', 772, 236688.06, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0794', 773, 331677.65, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0726', 774, 245659.26, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0752', 775, 432945.23, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0746', 776, 484469.55, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0754', 777, 202368.21, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0793', 778, 210391.47, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0711', 779, 139317.89, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0770', 780, 56940.51, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0704', 781, 144930.45, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0784', 782, 282918.26, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0779', 783, 289120.27, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0790', 784, 194980.05, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0764', 785, 428221.59, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0799', 786, 210389.71, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0715', 787, 298649.03, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0764', 788, 392002.96, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0783', 789, 318767.54, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0709', 790, 237319.45, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0752', 791, 245424.78, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0730', 792, 194719.6, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0770', 793, 403373.38, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0798', 794, 492133.06, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0760', 795, 214728.89, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0744', 796, 386349.78, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0800', 797, 470685.86, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0711', 798, 129130.04, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0728', 799, 351332.21, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0778', 800, 65598.44, 'Selesai', 1);

-- Insert Barang_Konsumsi
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 47, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 36, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 55, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 47, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 82, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 100, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 87, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 46, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 86, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 0, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 45, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 43, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 41, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 11, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 10, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 11, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 10, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 10, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 96, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 60, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 80, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 37, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 92, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 90, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 96, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 100, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 64, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 89, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 10, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 5, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 68, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 8, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 14, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 91, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 44, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 48, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 12, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 12, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 18, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 68, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 80, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 28, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 61, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 23, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 63, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 48, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 99, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 69, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 33, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 80, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 57, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 24, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 71, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 58, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 100, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 71, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 3, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 9, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 34, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 9, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 19, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 97, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 26, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 2, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 31, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 95, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 61, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 76, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 89, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 12, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 27, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 47, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 4, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 24, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 5, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 13, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 8, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 3, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 23, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 13, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 99, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 59, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 65, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 8, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 81, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 60, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 31, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 27, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 58, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 57, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 90, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 35, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 13, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 66, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 88, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 69, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 18, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 44, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 36, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 58, 'kg', 1);

-- Insert Maintenance_Alat_Laundry
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-11-17', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-07-04', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-02-05', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-02-10', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-03-29', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-10-02', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-01-27', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-02-02', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-04-20', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-03-30', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-06-24', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-10-28', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-02-01', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-05-07', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-08-20', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-05-29', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-05-26', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-02-05', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-05-02', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-09-24', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-08-31', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-27', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-07-17', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-09-28', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-04-03', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-03-17', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-03-17', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-09-17', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-04-18', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-08-03', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-02-21', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-02-05', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-10-27', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-02-19', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-04-27', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-09-24', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-05-06', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-06-14', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-01-04', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-05-11', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-06-20', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-12-12', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-01-14', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-12-06', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-03-15', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-11-12', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-06-13', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-04-25', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-07-02', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-02-04', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-10-10', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-11-19', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-04-29', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-11-15', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-12-28', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-12-06', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-06-21', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-11-29', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-03-30', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-01-24', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-02-03', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-05-12', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-12-05', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-12-03', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-10-13', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-03-16', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-09-15', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-02-06', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-03-11', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-02-23', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-06-18', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-02-13', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-06-06', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-05-21', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-01-17', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-06-04', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-12-01', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-01-30', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-06-12', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-06-10', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-05-23', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-01-22', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-06-25', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-01-16', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-12-04', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-08-05', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-05-14', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-11-24', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-10-25', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-07-19', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-04-24', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-01-11', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-09-10', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-03-06', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-10-26', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-01-05', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-01-12', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-01-15', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-01-28', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-06-12', 'Perawatan rutin', 1);


                --== 801-900 ==--

-- Insert Pelanggan
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0801', 'Gita Halim', '08564385506', 'Jl. Thamrin No.32', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0802', 'Intan Wijaya', '08525567830', 'Jl. Merdeka No.153', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0803', 'Joko Saputra', '0812981138', 'Jl. Gatot Subroto No.18', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0804', 'Andi Wijaya', '08307223697', 'Jl. Merdeka No.86', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0805', 'Eka Halim', '0832598825', 'Jl. Merdeka No.132', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0806', 'Budi Saputra', '0884968765', 'Jl. Gatot Subroto No.3', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0807', 'Hendra Wijaya', '08425104305', 'Jl. Gatot Subroto No.40', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0808', 'Eka Halim', '08416498808', 'Jl. Merdeka No.184', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0809', 'Hendra Kusuma', '0896264175', 'Jl. Gatot Subroto No.61', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0810', 'Andi Pratama', '08219022287', 'Jl. Thamrin No.111', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0811', 'Citra Rahma', '0817176690', 'Jl. Gatot Subroto No.25', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0812', 'Deni Permana', '08191260063', 'Jl. Sudirman No.119', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0813', 'Citra Nugroho', '08120178877', 'Jl. Merdeka No.78', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0814', 'Intan Saputra', '08689920724', 'Jl. Gatot Subroto No.147', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0815', 'Gita Rahma', '0816182404', 'Jl. Sudirman No.195', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0816', 'Joko Wijaya', '0866157757', 'Jl. Merdeka No.9', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0817', 'Hendra Halim', '0856491972', 'Jl. Sudirman No.13', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0818', 'Intan Santoso', '08421184590', 'Jl. Thamrin No.114', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0819', 'Deni Permana', '08129377055', 'Jl. Thamrin No.125', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0820', 'Fajar Pratama', '08914844269', 'Jl. Thamrin No.40', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0821', 'Fajar Nugroho', '08456267945', 'Jl. Sudirman No.188', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0822', 'Citra Saputra', '08865681198', 'Jl. Thamrin No.43', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0823', 'Intan Halim', '0848877855', 'Jl. Gatot Subroto No.166', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0824', 'Eka Setiawan', '08222591370', 'Jl. Diponegoro No.55', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0825', 'Andi Santoso', '08365790399', 'Jl. Gatot Subroto No.71', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0826', 'Hendra Kusuma', '0871973108', 'Jl. Merdeka No.132', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0827', 'Deni Permana', '0851484748', 'Jl. Sudirman No.24', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0828', 'Joko Permana', '08671299270', 'Jl. Gatot Subroto No.121', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0829', 'Andi Wijaya', '08276683225', 'Jl. Sudirman No.95', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0830', 'Fajar Kusuma', '08431672548', 'Jl. Sudirman No.113', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0831', 'Budi Kusuma', '08497851601', 'Jl. Gatot Subroto No.149', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0832', 'Joko Santoso', '0842465461', 'Jl. Gatot Subroto No.94', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0833', 'Andi Wijaya', '08891271477', 'Jl. Thamrin No.77', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0834', 'Citra Pratama', '0837188666', 'Jl. Merdeka No.26', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0835', 'Intan Pratama', '08878444695', 'Jl. Diponegoro No.58', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0836', 'Citra Setiawan', '08712493868', 'Jl. Sudirman No.129', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0837', 'Budi Halim', '0822969477', 'Jl. Diponegoro No.131', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0838', 'Fajar Wijaya', '08229015673', 'Jl. Sudirman No.66', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0839', 'Citra Rahma', '08764944774', 'Jl. Gatot Subroto No.180', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0840', 'Intan Nugroho', '08517317105', 'Jl. Sudirman No.85', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0841', 'Gita Nugroho', '0827601399', 'Jl. Merdeka No.81', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0842', 'Fajar Nugroho', '08866630273', 'Jl. Diponegoro No.30', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0843', 'Eka Nugroho', '08334800645', 'Jl. Thamrin No.17', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0844', 'Fajar Wijaya', '08408838503', 'Jl. Gatot Subroto No.5', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0845', 'Joko Rahma', '0848358724', 'Jl. Thamrin No.16', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0846', 'Andi Kusuma', '0864772962', 'Jl. Diponegoro No.98', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0847', 'Hendra Wijaya', '08405003530', 'Jl. Thamrin No.138', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0848', 'Joko Pratama', '08246258153', 'Jl. Sudirman No.141', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0849', 'Deni Pratama', '08349182258', 'Jl. Diponegoro No.126', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0850', 'Eka Setiawan', '08519587951', 'Jl. Thamrin No.140', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0851', 'Intan Saputra', '08553578637', 'Jl. Merdeka No.99', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0852', 'Hendra Halim', '08959608723', 'Jl. Diponegoro No.191', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0853', 'Joko Setiawan', '08724059007', 'Jl. Diponegoro No.39', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0854', 'Gita Santoso', '0849961917', 'Jl. Diponegoro No.77', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0855', 'Gita Halim', '08966283821', 'Jl. Sudirman No.44', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0856', 'Citra Santoso', '08828786415', 'Jl. Diponegoro No.139', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0857', 'Fajar Halim', '08123412559', 'Jl. Gatot Subroto No.27', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0858', 'Citra Kusuma', '0825999588', 'Jl. Thamrin No.195', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0859', 'Eka Santoso', '08323265976', 'Jl. Thamrin No.92', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0860', 'Citra Setiawan', '0810624436', 'Jl. Diponegoro No.8', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0861', 'Fajar Santoso', '08206693743', 'Jl. Gatot Subroto No.111', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0862', 'Deni Permana', '08371571329', 'Jl. Sudirman No.134', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0863', 'Hendra Nugroho', '08706166570', 'Jl. Gatot Subroto No.183', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0864', 'Gita Pratama', '08348760873', 'Jl. Sudirman No.13', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0865', 'Citra Nugroho', '08417554098', 'Jl. Gatot Subroto No.191', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0866', 'Intan Saputra', '08207238402', 'Jl. Gatot Subroto No.38', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0867', 'Budi Halim', '08421302551', 'Jl. Merdeka No.103', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0868', 'Eka Santoso', '08411989737', 'Jl. Sudirman No.120', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0869', 'Intan Saputra', '08703075614', 'Jl. Diponegoro No.12', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0870', 'Intan Kusuma', '08393713914', 'Jl. Gatot Subroto No.58', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0871', 'Joko Pratama', '08589788514', 'Jl. Diponegoro No.32', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0872', 'Gita Pratama', '08588608036', 'Jl. Diponegoro No.55', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0873', 'Andi Halim', '08295990939', 'Jl. Diponegoro No.121', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0874', 'Eka Pratama', '0881388116', 'Jl. Merdeka No.147', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0875', 'Intan Kusuma', '0877692587', 'Jl. Diponegoro No.65', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0876', 'Fajar Setiawan', '08439291331', 'Jl. Merdeka No.171', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0877', 'Deni Santoso', '08806280476', 'Jl. Diponegoro No.149', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0878', 'Fajar Saputra', '08765663318', 'Jl. Merdeka No.14', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0879', 'Citra Saputra', '08505626117', 'Jl. Thamrin No.178', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0880', 'Eka Pratama', '08417241063', 'Jl. Sudirman No.6', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0881', 'Andi Kusuma', '08530048094', 'Jl. Gatot Subroto No.20', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0882', 'Hendra Kusuma', '08713987377', 'Jl. Thamrin No.153', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0883', 'Budi Permana', '08756563691', 'Jl. Thamrin No.87', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0884', 'Citra Halim', '08826944013', 'Jl. Thamrin No.200', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0885', 'Eka Halim', '0824073778', 'Jl. Thamrin No.43', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0886', 'Fajar Setiawan', '0868562121', 'Jl. Diponegoro No.8', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0887', 'Citra Saputra', '0842388813', 'Jl. Thamrin No.106', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0888', 'Eka Rahma', '08678968318', 'Jl. Thamrin No.95', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0889', 'Fajar Pratama', '08509650512', 'Jl. Thamrin No.141', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0890', 'Deni Santoso', '0825264359', 'Jl. Merdeka No.65', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0891', 'Gita Setiawan', '08908861501', 'Jl. Thamrin No.118', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0892', 'Budi Kusuma', '08572282166', 'Jl. Gatot Subroto No.73', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0893', 'Gita Nugroho', '08655135836', 'Jl. Thamrin No.45', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0894', 'Intan Pratama', '08477753108', 'Jl. Merdeka No.34', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0895', 'Citra Saputra', '08187686876', 'Jl. Merdeka No.17', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0896', 'Hendra Kusuma', '0876875112', 'Jl. Diponegoro No.77', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0897', 'Deni Pratama', '08215642672', 'Jl. Diponegoro No.192', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0898', 'Eka Pratama', '0863605447', 'Jl. Sudirman No.57', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0899', 'Andi Setiawan', '08937617155', 'Jl. Merdeka No.29', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0900', 'Budi Permana', '08921911907', 'Jl. Diponegoro No.55', 1);

-- Insert Sepatu
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0895', 'Vans', 'Sandals', 'Hitam', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0807', 'Vans', 'Loafers', 'Hitam', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0887', 'Puma', 'Heels', 'Merah', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0860', 'Nike', 'Sandals', 'Hijau', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0864', 'Reebok', 'Sandals', 'Merah', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0810', 'Reebok', 'Loafers', 'Biru', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0811', 'Vans', 'Sandals', 'Biru', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0892', 'Reebok', 'Loafers', 'Hitam', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0887', 'Nike', 'Sneakers', 'Putih', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0803', 'Adidas', 'Sandals', 'Hitam', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0867', 'Nike', 'Sneakers', 'Biru', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0844', 'Puma', 'Loafers', 'Hijau', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0821', 'Adidas', 'Sandals', 'Merah', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0823', 'Reebok', 'Loafers', 'Putih', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0852', 'Reebok', 'Boots', 'Biru', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0845', 'Reebok', 'Heels', 'Hitam', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0881', 'Reebok', 'Boots', 'Hitam', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0871', 'Puma', 'Loafers', 'Putih', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0809', 'Puma', 'Sandals', 'Hijau', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0900', 'Adidas', 'Loafers', 'Hitam', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0868', 'Reebok', 'Sneakers', 'Putih', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0839', 'Puma', 'Loafers', 'Hijau', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0813', 'Vans', 'Boots', 'Putih', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0805', 'Adidas', 'Loafers', 'Hijau', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0807', 'Adidas', 'Sandals', 'Merah', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0890', 'Puma', 'Sneakers', 'Biru', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0822', 'Vans', 'Boots', 'Putih', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0861', 'Vans', 'Heels', 'Putih', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0869', 'Adidas', 'Sandals', 'Putih', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0803', 'Vans', 'Sneakers', 'Putih', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0892', 'Adidas', 'Sneakers', 'Merah', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0855', 'Vans', 'Heels', 'Biru', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0849', 'Puma', 'Sneakers', 'Biru', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0815', 'Nike', 'Heels', 'Hijau', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0851', 'Nike', 'Loafers', 'Putih', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0891', 'Nike', 'Sandals', 'Biru', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0861', 'Puma', 'Loafers', 'Hijau', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0882', 'Nike', 'Sneakers', 'Putih', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0864', 'Puma', 'Loafers', 'Putih', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0850', 'Nike', 'Loafers', 'Hitam', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0856', 'Puma', 'Boots', 'Merah', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0876', 'Vans', 'Heels', 'Hijau', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0900', 'Nike', 'Heels', 'Putih', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0848', 'Reebok', 'Loafers', 'Hijau', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0832', 'Vans', 'Sneakers', 'Hitam', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0814', 'Vans', 'Heels', 'Hitam', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0880', 'Nike', 'Heels', 'Merah', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0848', 'Adidas', 'Sandals', 'Biru', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0808', 'Puma', 'Sandals', 'Hijau', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0897', 'Nike', 'Loafers', 'Hijau', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0841', 'Puma', 'Heels', 'Hitam', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0802', 'Adidas', 'Sneakers', 'Hijau', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0821', 'Vans', 'Sneakers', 'Biru', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0833', 'Adidas', 'Loafers', 'Putih', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0818', 'Adidas', 'Loafers', 'Hijau', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0804', 'Adidas', 'Boots', 'Putih', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0855', 'Vans', 'Sandals', 'Hitam', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0829', 'Puma', 'Sneakers', 'Putih', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0847', 'Vans', 'Heels', 'Putih', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0899', 'Puma', 'Sandals', 'Biru', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0847', 'Nike', 'Sneakers', 'Putih', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0857', 'Vans', 'Loafers', 'Biru', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0851', 'Nike', 'Loafers', 'Biru', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0850', 'Puma', 'Sandals', 'Merah', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0897', 'Reebok', 'Sandals', 'Hijau', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0868', 'Vans', 'Sneakers', 'Hitam', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0826', 'Reebok', 'Loafers', 'Merah', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0890', 'Puma', 'Sneakers', 'Hitam', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0871', 'Adidas', 'Sneakers', 'Hitam', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0855', 'Nike', 'Boots', 'Hitam', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0823', 'Puma', 'Heels', 'Hijau', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0809', 'Adidas', 'Sandals', 'Hitam', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0850', 'Reebok', 'Sneakers', 'Hijau', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0823', 'Adidas', 'Heels', 'Merah', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0867', 'Adidas', 'Sneakers', 'Hijau', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0849', 'Adidas', 'Heels', 'Putih', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0878', 'Reebok', 'Heels', 'Putih', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0893', 'Puma', 'Heels', 'Putih', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0892', 'Reebok', 'Sandals', 'Biru', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0822', 'Vans', 'Boots', 'Hitam', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0900', 'Puma', 'Boots', 'Putih', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0857', 'Vans', 'Heels', 'Merah', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0899', 'Adidas', 'Loafers', 'Hitam', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0806', 'Puma', 'Boots', 'Putih', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0813', 'Vans', 'Heels', 'Merah', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0862', 'Adidas', 'Sneakers', 'Merah', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0867', 'Reebok', 'Loafers', 'Putih', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0810', 'Adidas', 'Loafers', 'Hijau', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0843', 'Puma', 'Loafers', 'Putih', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0900', 'Adidas', 'Heels', 'Biru', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0854', 'Puma', 'Sneakers', 'Putih', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0837', 'Adidas', 'Heels', 'Putih', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0825', 'Vans', 'Sandals', 'Merah', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0874', 'Adidas', 'Loafers', 'Putih', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0848', 'Vans', 'Loafers', 'Biru', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0845', 'Reebok', 'Heels', 'Hijau', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0862', 'Puma', 'Heels', 'Hijau', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0834', 'Puma', 'Loafers', 'Hitam', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0885', 'Reebok', 'Heels', 'Merah', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0803', 'Vans', 'Sneakers', 'Biru', 'XL', 1);

-- Insert Transaksi
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0826', 801, 46385.3, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0805', 802, 56289.17, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0865', 803, 22306.46, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0828', 804, 104036.47, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0861', 805, 298803.97, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0807', 806, 297220.81, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0819', 807, 131137.77, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0862', 808, 456704.21, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0897', 809, 43598.23, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0829', 810, 385245.98, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0859', 811, 308453.26, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0867', 812, 468225.29, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0872', 813, 156484.08, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0875', 814, 211748.86, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0822', 815, 195667.53, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0876', 816, 266039.01, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0806', 817, 327806.95, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0877', 818, 72355.92, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0893', 819, 54104.41, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0858', 820, 486537.14, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0821', 821, 198928.13, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0813', 822, 360960.78, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0826', 823, 398816.55, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0813', 824, 189655.99, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0900', 825, 389597.64, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0807', 826, 210636.61, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0822', 827, 460194.94, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0869', 828, 279223.7, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0884', 829, 439542.03, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0891', 830, 296537.6, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0883', 831, 459545.41, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0842', 832, 261863.88, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0861', 833, 295064.73, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0836', 834, 494665.04, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0834', 835, 118960.14, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0875', 836, 378641.6, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0818', 837, 365628.96, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0832', 838, 234560.51, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0831', 839, 194140.22, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0884', 840, 178737.55, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0813', 841, 208967.34, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0864', 842, 115105.96, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0867', 843, 301684.22, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0810', 844, 479746.45, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0894', 845, 471428.1, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0821', 846, 32984.94, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0887', 847, 13964.03, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0876', 848, 222270.2, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0850', 849, 60815.86, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0838', 850, 337235.07, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0885', 851, 21531.59, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0898', 852, 147789.62, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0877', 853, 101055.84, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0875', 854, 379793.99, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0820', 855, 113901.19, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0895', 856, 82665.86, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0852', 857, 266853.07, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0813', 858, 93255.73, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0870', 859, 416012.86, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0878', 860, 336007.12, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0884', 861, 314968.49, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0898', 862, 91749.06, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0842', 863, 256314.98, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0873', 864, 134130.9, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0899', 865, 386936.74, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0805', 866, 478186.08, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0857', 867, 245639.84, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0870', 868, 92263.2, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0829', 869, 328467.37, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0809', 870, 108118.85, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0874', 871, 296602.13, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0892', 872, 262586.7, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0886', 873, 396389.23, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0869', 874, 463410.79, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0861', 875, 257529.81, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0857', 876, 46762.2, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0889', 877, 12331.87, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0855', 878, 79548.26, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0815', 879, 347406.78, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0895', 880, 357350.06, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0818', 881, 348337.48, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0806', 882, 405613.45, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0870', 883, 373162.12, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0834', 884, 306362.58, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0864', 885, 109802.18, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0883', 886, 79487.17, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0840', 887, 418264.14, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0887', 888, 141680.18, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0883', 889, 461658.56, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0893', 890, 161033.73, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0836', 891, 261680.5, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0811', 892, 98498.97, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0831', 893, 324732.69, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0839', 894, 485120.99, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0806', 895, 122152.48, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0884', 896, 257896.85, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0854', 897, 232211.18, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0880', 898, 262845.14, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0851', 899, 463326.72, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0896', 900, 93844.09, 'Proses', 1);

-- Insert Barang_Konsumsi
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 4, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 58, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 23, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 36, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 33, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 33, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 62, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 13, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 87, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 93, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 10, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 8, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 100, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 19, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 93, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 3, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 90, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 94, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 1, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 57, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 47, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 53, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 63, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 96, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 64, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 7, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 98, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 26, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 40, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 21, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 13, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 38, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 12, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 93, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 98, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 59, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 5, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 57, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 57, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 18, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 29, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 80, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 71, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 21, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 59, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 2, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 26, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 63, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 26, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 23, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 91, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 95, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 33, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 72, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 16, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 39, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 53, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 22, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 87, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 5, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 35, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 16, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 50, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 48, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 4, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 98, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 30, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 72, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 90, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 47, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 1, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 72, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 55, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 93, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 9, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 78, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 89, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 9, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 34, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 86, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 54, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 57, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 33, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 37, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 100, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 37, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 83, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 96, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 74, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 45, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 80, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 4, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 95, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 6, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 27, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 59, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 76, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 63, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 63, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 17, 'ltr', 1);

-- Insert Maintenance_Alat_Laundry
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-09-23', 'Penggantian suku cadang', 1);   
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-10', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-01-13', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-05-21', 'Perawatan rutin', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-08-27', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-03-21', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-11-24', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-09-12', 'Pembersihan mendalam', 1);  
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-11-24', 'Penggantian suku cadang', 1);   
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-02-21', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-08-30', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-04-14', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-07-02', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-06-26', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-09-03', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-02-28', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-03-01', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-10-16', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-17', 'Pembersihan mendalam', 1);      
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-04-29', 'Penggantian suku cadang', 1);   
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-03-10', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-10-13', 'Perawatan rutin', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-20', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-06-09', 'Pembersihan mendalam', 1);  
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-01-28', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-10-23', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-06-14', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-10-25', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-02-19', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-02-25', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-06-19', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-04-27', 'Pembersihan mendalam', 1);  
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-03-11', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-04-26', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-05-10', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-07-31', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-05-24', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-06-05', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-08-20', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-03-04', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-06-04', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-06-08', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-07-02', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-01-12', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-04-30', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-12-26', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-11-12', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-08-02', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-01-18', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-03-10', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-05-07', 'Pembersihan mendalam', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-09-03', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-12-28', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-02-26', 'Penggantian suku cadang', 1);   
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-05-07', 'Pembersihan mendalam', 1);      
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-12-01', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-04-12', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-11-15', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-11-07', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-09-26', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-07-21', 'Perawatan rutin', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-05-19', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-08-07', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-04-04', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-01-07', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-03-16', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-06-17', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-04-29', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-10-28', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-04-12', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-11-04', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-01-06', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-07-31', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-04-04', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-12-16', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-04-21', 'Pembersihan mendalam', 1);      
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-04-28', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-09-19', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-04-22', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-11-16', 'Pembersihan mendalam', 1);  
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-01-24', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-09-28', 'Penggantian suku cadang', 1);   
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-05-21', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-02-07', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-04-27', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-06-08', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-03-12', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-05-01', 'Perawatan rutin', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-01-17', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-10-23', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-08-27', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-11-01', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-04-23', 'Perawatan rutin', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-10-25', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-05-01', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-08-03', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-02-28', 'Perawatan rutin', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-02-13', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-01-18', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-11-14', 'Perawatan rutin', 1);


                --== 901-1000 ==--

-- Insert Pelanggan
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0901', 'Gita Nugroho', '0880609795', 'Jl. Diponegoro No.156', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0902', 'Citra Permana', '0848440909', 'Jl. Merdeka No.72', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0903', 'Eka Kusuma', '08627089360', 'Jl. Gatot Subroto No.144', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0904', 'Deni Halim', '08297355862', 'Jl. Merdeka No.160', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0905', 'Gita Pratama', '08152408928', 'Jl. Sudirman No.70', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0906', 'Gita Santoso', '08514500248', 'Jl. Merdeka No.1', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0907', 'Budi Saputra', '08803304504', 'Jl. Gatot Subroto No.62', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0908', 'Joko Wijaya', '0894201718', 'Jl. Diponegoro No.38', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0909', 'Citra Wijaya', '08396091501', 'Jl. Gatot Subroto No.176', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0910', 'Gita Setiawan', '08690561604', 'Jl. Sudirman No.152', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0911', 'Andi Nugroho', '08433308947', 'Jl. Gatot Subroto No.129', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0912', 'Deni Rahma', '0858868656', 'Jl. Merdeka No.38', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0913', 'Hendra Wijaya', '08247563271', 'Jl. Merdeka No.45', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0914', 'Andi Halim', '08846447238', 'Jl. Sudirman No.30', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0915', 'Citra Rahma', '08425816108', 'Jl. Merdeka No.57', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0916', 'Fajar Kusuma', '08879135832', 'Jl. Diponegoro No.172', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0917', 'Budi Rahma', '0870575990', 'Jl. Merdeka No.41', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0918', 'Andi Setiawan', '08787461143', 'Jl. Diponegoro No.82', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0919', 'Intan Kusuma', '08730795807', 'Jl. Diponegoro No.103', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0920', 'Deni Rahma', '08766043754', 'Jl. Merdeka No.163', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0921', 'Budi Wijaya', '0855732878', 'Jl. Gatot Subroto No.175', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0922', 'Fajar Santoso', '0842554952', 'Jl. Sudirman No.104', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0923', 'Citra Santoso', '08642761286', 'Jl. Sudirman No.175', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0924', 'Andi Santoso', '08209308477', 'Jl. Diponegoro No.59', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0925', 'Fajar Halim', '08435897472', 'Jl. Thamrin No.70', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0926', 'Intan Permana', '08554829198', 'Jl. Merdeka No.177', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0927', 'Andi Santoso', '08993326993', 'Jl. Thamrin No.196', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0928', 'Intan Nugroho', '08663913704', 'Jl. Sudirman No.97', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0929', 'Fajar Setiawan', '08559267856', 'Jl. Merdeka No.177', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0930', 'Hendra Kusuma', '08565738638', 'Jl. Thamrin No.111', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0931', 'Intan Santoso', '08359605856', 'Jl. Merdeka No.47', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0932', 'Andi Halim', '08430012325', 'Jl. Thamrin No.191', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0933', 'Deni Halim', '0862254711', 'Jl. Gatot Subroto No.127', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0934', 'Deni Permana', '08745292282', 'Jl. Gatot Subroto No.102', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0935', 'Citra Permana', '08900826742', 'Jl. Sudirman No.195', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0936', 'Eka Permana', '08343400087', 'Jl. Sudirman No.12', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0937', 'Fajar Permana', '08178927546', 'Jl. Diponegoro No.190', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0938', 'Budi Kusuma', '08623783827', 'Jl. Thamrin No.165', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0939', 'Intan Rahma', '08487964105', 'Jl. Diponegoro No.198', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0940', 'Fajar Rahma', '08963712740', 'Jl. Sudirman No.111', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0941', 'Eka Halim', '0878545572', 'Jl. Sudirman No.146', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0942', 'Andi Wijaya', '0841774764', 'Jl. Sudirman No.78', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0943', 'Deni Pratama', '0810571712', 'Jl. Merdeka No.26', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0944', 'Deni Saputra', '08414923288', 'Jl. Diponegoro No.121', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0945', 'Eka Nugroho', '08620569383', 'Jl. Gatot Subroto No.95', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0946', 'Joko Pratama', '0825108892', 'Jl. Sudirman No.32', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0947', 'Deni Permana', '08392986838', 'Jl. Sudirman No.66', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0948', 'Citra Permana', '0898852121', 'Jl. Thamrin No.63', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0949', 'Deni Halim', '0842312038', 'Jl. Thamrin No.53', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0950', 'Citra Kusuma', '0836368370', 'Jl. Thamrin No.93', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0951', 'Budi Pratama', '08571479224', 'Jl. Diponegoro No.86', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0952', 'Gita Pratama', '08527723687', 'Jl. Diponegoro No.158', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0953', 'Hendra Saputra', '08920344645', 'Jl. Diponegoro No.82', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0954', 'Andi Kusuma', '08378047955', 'Jl. Gatot Subroto No.123', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0955', 'Hendra Rahma', '08270637106', 'Jl. Thamrin No.189', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0956', 'Hendra Pratama', '08211275071', 'Jl. Sudirman No.174', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0957', 'Eka Halim', '0887836991', 'Jl. Diponegoro No.107', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0958', 'Andi Santoso', '08170271361', 'Jl. Gatot Subroto No.164', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0959', 'Fajar Permana', '08793661160', 'Jl. Thamrin No.148', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0960', 'Eka Setiawan', '0892422700', 'Jl. Thamrin No.50', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0961', 'Budi Pratama', '0865000948', 'Jl. Sudirman No.56', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0962', 'Deni Pratama', '08487971938', 'Jl. Gatot Subroto No.145', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0963', 'Budi Rahma', '08180402424', 'Jl. Thamrin No.99', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0964', 'Joko Santoso', '08483556711', 'Jl. Thamrin No.70', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0965', 'Intan Nugroho', '08798138905', 'Jl. Gatot Subroto No.148', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0966', 'Gita Nugroho', '08760286409', 'Jl. Thamrin No.132', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0967', 'Hendra Kusuma', '08691391213', 'Jl. Thamrin No.124', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0968', 'Fajar Permana', '0854586844', 'Jl. Sudirman No.73', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0969', 'Fajar Setiawan', '0883917135', 'Jl. Thamrin No.86', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0970', 'Deni Wijaya', '08650778949', 'Jl. Merdeka No.161', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0971', 'Budi Pratama', '08536195385', 'Jl. Diponegoro No.102', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0972', 'Hendra Rahma', '08558000365', 'Jl. Gatot Subroto No.151', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0973', 'Intan Santoso', '08124495323', 'Jl. Merdeka No.200', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0974', 'Citra Rahma', '08419552433', 'Jl. Gatot Subroto No.131', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0975', 'Andi Halim', '0846518185', 'Jl. Sudirman No.13', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0976', 'Fajar Kusuma', '0880085290', 'Jl. Diponegoro No.185', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0977', 'Deni Santoso', '08162924795', 'Jl. Gatot Subroto No.97', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0978', 'Fajar Kusuma', '0876259791', 'Jl. Sudirman No.189', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0979', 'Citra Pratama', '08719490575', 'Jl. Gatot Subroto No.165', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0980', 'Gita Kusuma', '08549362666', 'Jl. Diponegoro No.28', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0981', 'Citra Halim', '08464134424', 'Jl. Gatot Subroto No.21', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0982', 'Andi Halim', '08353932491', 'Jl. Diponegoro No.29', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0983', 'Intan Saputra', '08389031118', 'Jl. Merdeka No.110', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0984', 'Budi Halim', '08971845457', 'Jl. Merdeka No.35', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0985', 'Joko Setiawan', '08518213422', 'Jl. Diponegoro No.112', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0986', 'Deni Halim', '08599076576', 'Jl. Merdeka No.66', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0987', 'Fajar Halim', '08967560130', 'Jl. Merdeka No.126', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0988', 'Eka Permana', '0877569759', 'Jl. Merdeka No.122', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0989', 'Joko Wijaya', '08483491523', 'Jl. Thamrin No.161', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0990', 'Joko Kusuma', '0817762063', 'Jl. Gatot Subroto No.86', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0991', 'Gita Pratama', '08580137519', 'Jl. Thamrin No.18', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0992', 'Eka Permana', '0830206116', 'Jl. Merdeka No.79', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0993', 'Joko Wijaya', '08449289432', 'Jl. Merdeka No.98', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0994', 'Hendra Setiawan', '08519384700', 'Jl. Merdeka No.145', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0995', 'Deni Nugroho', '08865316841', 'Jl. Sudirman No.3', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0996', 'Deni Wijaya', '08489809559', 'Jl. Sudirman No.84', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0997', 'Fajar Saputra', '08262658826', 'Jl. Gatot Subroto No.153', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0998', 'Hendra Pratama', '08512042844', 'Jl. Diponegoro No.17', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('0999', 'Joko Setiawan', '0833392647', 'Jl. Gatot Subroto No.112', 1);
INSERT INTO Pelanggan (id_pelanggan, nama, no_hp, alamat, id_akun) VALUES ('1000', 'Budi Wijaya', '08896696181', 'Jl. Diponegoro No.42', 1);

-- Insert Sepatu
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0930', 'Puma', 'Loafers', 'Biru', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0973', 'Nike', 'Heels', 'Hijau', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0923', 'Puma', 'Sneakers', 'Putih', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0986', 'Vans', 'Sneakers', 'Hijau', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0930', 'Reebok', 'Loafers', 'Biru', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0968', 'Puma', 'Loafers', 'Hitam', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0996', 'Nike', 'Sneakers', 'Merah', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0907', 'Vans', 'Sandals', 'Merah', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0995', 'Puma', 'Boots', 'Putih', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0919', 'Reebok', 'Sandals', 'Hitam', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0999', 'Vans', 'Heels', 'Hitam', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0996', 'Puma', 'Boots', 'Merah', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0923', 'Puma', 'Boots', 'Hitam', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0903', 'Reebok', 'Sandals', 'Biru', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0959', 'Vans', 'Boots', 'Hitam', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0974', 'Vans', 'Sandals', 'Biru', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0924', 'Reebok', 'Boots', 'Putih', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0940', 'Vans', 'Loafers', 'Putih', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0903', 'Vans', 'Sandals', 'Putih', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0972', 'Adidas', 'Boots', 'Hitam', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0979', 'Vans', 'Sandals', 'Merah', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0987', 'Reebok', 'Heels', 'Putih', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0997', 'Puma', 'Sandals', 'Merah', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0931', 'Adidas', 'Sandals', 'Hitam', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0989', 'Nike', 'Sneakers', 'Hijau', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0936', 'Puma', 'Boots', 'Hijau', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0979', 'Nike', 'Loafers', 'Putih', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0978', 'Reebok', 'Sandals', 'Hijau', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0975', 'Reebok', 'Sandals', 'Hijau', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0943', 'Puma', 'Sneakers', 'Biru', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0983', 'Puma', 'Sneakers', 'Merah', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0975', 'Reebok', 'Loafers', 'Biru', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0984', 'Adidas', 'Boots', 'Hijau', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('01000', 'Nike', 'Heels', 'Putih', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0956', 'Nike', 'Sneakers', 'Hijau', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0932', 'Reebok', 'Heels', 'Biru', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0980', 'Puma', 'Heels', 'Merah', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0992', 'Reebok', 'Heels', 'Merah', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0915', 'Reebok', 'Sandals', 'Hitam', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0906', 'Puma', 'Boots', 'Hijau', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0914', 'Adidas', 'Sandals', 'Hijau', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0968', 'Nike', 'Heels', 'Biru', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0952', 'Puma', 'Sandals', 'Hitam', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0938', 'Vans', 'Loafers', 'Hitam', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0967', 'Adidas', 'Loafers', 'Hitam', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0957', 'Vans', 'Sandals', 'Biru', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0920', 'Vans', 'Sandals', 'Hitam', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0934', 'Reebok', 'Heels', 'Hitam', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0936', 'Nike', 'Sandals', 'Putih', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0923', 'Puma', 'Boots', 'Putih', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0932', 'Reebok', 'Sandals', 'Hijau', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0923', 'Vans', 'Boots', 'Hijau', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0928', 'Vans', 'Heels', 'Merah', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0940', 'Vans', 'Boots', 'Hijau', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0969', 'Reebok', 'Sandals', 'Merah', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0942', 'Reebok', 'Sneakers', 'Merah', '40', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0952', 'Puma', 'Sandals', 'Merah', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0984', 'Puma', 'Sneakers', 'Merah', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0927', 'Nike', 'Heels', 'Hitam', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0984', 'Nike', 'Heels', 'Putih', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0994', 'Vans', 'Heels', 'Hitam', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0959', 'Reebok', 'Heels', 'Merah', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0997', 'Reebok', 'Sneakers', 'Putih', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0968', 'Adidas', 'Boots', 'Biru', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0985', 'Puma', 'Sandals', 'Biru', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0977', 'Reebok', 'Sandals', 'Biru', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0912', 'Vans', 'Sandals', 'Biru', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0994', 'Vans', 'Sandals', 'Hitam', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0991', 'Puma', 'Heels', 'Hijau', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0947', 'Nike', 'Sneakers', 'Biru', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0960', 'Nike', 'Sneakers', 'Hitam', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0972', 'Nike', 'Loafers', 'Hijau', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0932', 'Nike', 'Boots', 'Hitam', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0974', 'Nike', 'Loafers', 'Hitam', 'M', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0934', 'Reebok', 'Heels', 'Biru', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0992', 'Puma', 'Sandals', 'Merah', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0903', 'Nike', 'Sneakers', 'Hitam', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0912', 'Puma', 'Sneakers', 'Merah', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0939', 'Vans', 'Heels', 'Hitam', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0931', 'Puma', 'Heels', 'Merah', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0935', 'Reebok', 'Boots', 'Putih', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0906', 'Reebok', 'Loafers', 'Putih', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0962', 'Adidas', 'Boots', 'Hijau', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0926', 'Vans', 'Boots', 'Hijau', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0972', 'Puma', 'Sandals', 'Putih', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0922', 'Puma', 'Heels', 'Putih', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0961', 'Vans', 'Heels', 'Putih', '41', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0982', 'Puma', 'Loafers', 'Hijau', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0989', 'Adidas', 'Loafers', 'Hijau', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0998', 'Vans', 'Loafers', 'Hitam', '38', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0964', 'Puma', 'Boots', 'Hijau', 'L', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0922', 'Vans', 'Loafers', 'Merah', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0935', 'Vans', 'Sandals', 'Merah', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0949', 'Reebok', 'Boots', 'Hitam', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0955', 'Nike', 'Loafers', 'Merah', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0907', 'Nike', 'Sneakers', 'Hitam', 'XL', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0905', 'Puma', 'Heels', 'Biru', '39', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0971', 'Reebok', 'Heels', 'Hitam', '42', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0930', 'Reebok', 'Boots', 'Putih', 'S', 1);
INSERT INTO Sepatu (id_pelanggan, merek, jenis, warna, ukuran, id_akun) VALUES ('0972', 'Puma', 'Heels', 'Hijau', '39', 1);

-- Insert Transaksi
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0953', 901, 170469.6, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0924', 902, 61035.45, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0948', 903, 23567.0, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0943', 904, 192536.1, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0917', 905, 337195.48, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0959', 906, 195847.46, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0990', 907, 298855.5, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0902', 908, 245482.62, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0902', 909, 373550.61, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0936', 910, 324628.6, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0957', 911, 65881.93, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0965', 912, 121071.49, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0914', 913, 312930.16, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0988', 914, 315684.78, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0923', 915, 84106.87, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('01000', 916, 237355.06, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0987', 917, 224137.5, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0955', 918, 142062.39, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0906', 919, 350357.01, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0910', 920, 380308.34, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0986', 921, 378942.19, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0952', 922, 498679.33, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0937', 923, 66215.06, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0926', 924, 295431.2, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0965', 925, 246363.39, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0940', 926, 485812.2, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0945', 927, 47831.33, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0916', 928, 242549.54, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0931', 929, 376292.78, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0967', 930, 319238.39, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0915', 931, 140377.11, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0917', 932, 46028.63, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0928', 933, 460861.28, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0909', 934, 165379.34, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0932', 935, 177896.81, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0916', 936, 142158.05, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0938', 937, 440585.74, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0958', 938, 54004.52, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0942', 939, 99092.4, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0933', 940, 91849.35, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0985', 941, 16993.49, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0939', 942, 332998.37, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0934', 943, 188285.12, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0947', 944, 408224.68, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0906', 945, 64998.39, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0918', 946, 216096.7, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0935', 947, 466193.8, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0982', 948, 455645.39, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0910', 949, 86678.92, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0969', 950, 145296.61, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0973', 951, 479477.92, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0946', 952, 443265.08, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0975', 953, 214749.03, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0947', 954, 451831.4, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0965', 955, 424735.29, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0901', 956, 439320.91, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0909', 957, 85264.2, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0966', 958, 285528.88, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0927', 959, 419973.06, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0995', 960, 139244.29, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0937', 961, 184808.03, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0957', 962, 167229.33, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0963', 963, 121443.54, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0903', 964, 130741.73, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0944', 965, 218862.93, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0927', 966, 234906.27, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0908', 967, 189354.15, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0921', 968, 424709.58, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0914', 969, 153529.85, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0995', 970, 187571.81, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0946', 971, 54489.55, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0917', 972, 254905.95, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0948', 973, 333214.69, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0971', 974, 79856.91, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0969', 975, 49118.27, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0998', 976, 124974.56, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0917', 977, 180166.51, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0971', 978, 269993.21, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0909', 979, 244380.77, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0932', 980, 318883.42, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0940', 981, 348594.93, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0987', 982, 482336.94, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0907', 983, 329210.71, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0992', 984, 197789.93, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0984', 985, 162273.48, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0915', 986, 152852.59, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0923', 987, 22273.42, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0999', 988, 166609.09, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0995', 989, 160912.08, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0931', 990, 499840.44, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0953', 991, 406079.24, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0927', 992, 31510.49, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0952', 993, 124251.32, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0958', 994, 55482.63, 'Selesai', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0940', 995, 451624.35, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0954', 996, 183133.22, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0994', 997, 196170.1, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0985', 998, 409674.08, 'Dibatalkan', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0982', 999, 173305.84, 'Proses', 1);
INSERT INTO Transaksi (id_pelanggan, id_sepatu, total_harga, status_transaksi, id_akun) VALUES ('0938', 1000, 53792.15, 'Dibatalkan', 1);

-- Insert Barang_Konsumsi
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 57, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 33, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 22, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 63, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 45, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 43, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 53, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 81, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 12, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 100, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 6, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 1, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 90, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 25, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 19, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 55, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 40, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 26, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 81, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 6, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 27, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 93, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 23, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 15, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 32, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 48, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 30, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 70, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 14, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 82, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 27, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 32, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 53, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 93, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 1, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 67, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 40, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 35, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 92, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 59, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 38, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 48, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 54, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 10, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 28, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 26, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 76, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 74, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 53, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 31, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 81, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 84, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 82, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 86, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 50, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 17, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 67, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 79, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 90, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 58, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 15, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 27, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 56, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 53, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 5, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 18, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 26, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 58, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 17, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 13, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 74, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 36, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 60, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 80, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 44, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 51, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 94, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 50, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 6, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 23, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 18, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 40, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 44, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 12, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 38, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 72, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 6, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Detergen', 95, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 46, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 47, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 61, 'pcs', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 57, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 30, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Sabun', 46, 'ltr', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 0, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 41, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 86, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pewangi', 2, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Pemutih', 74, 'kg', 1);
INSERT INTO Barang_Konsumsi (nama_barang, jumlah, satuan, id_akun) VALUES ('Disinfektan', 50, 'pcs', 1);

-- Insert Maintenance_Alat_Laundry
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-01-27', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-03-25', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-06-25', 'Pembersihan mendalam', 1);  
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-04-25', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-06-29', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-08-10', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-01-01', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-05-21', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-08-13', 'Pembersihan mendalam', 1);  
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-01-21', 'Pembersihan mendalam', 1);  
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-05-08', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-08-14', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-11-18', 'Pembersihan mendalam', 1);  
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-08-16', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-07-16', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-12-14', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-08-12', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-01-16', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-05-17', 'Penggantian suku cadang', 1);   
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-12-21', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-11-16', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-02-22', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-03-21', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-06-20', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-05-09', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-12-03', 'Perawatan rutin', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-07-29', 'Pembersihan mendalam', 1);  
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-04-04', 'Perawatan rutin', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-01-21', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-06-26', 'Pembersihan mendalam', 1);  
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-06-25', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-11-24', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-12-27', 'Penggantian suku cadang', 1);   
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-08-02', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-11-22', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-03-18', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-04-18', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-09-05', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-09-21', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-01-09', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-03-18', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-06-04', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-06-11', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-06-15', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-03-16', 'Pembersihan mendalam', 1);  
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-01-30', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-07-03', 'Pembersihan mendalam', 1);      
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-03-26', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-01-29', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-05-30', 'Pembersihan mendalam', 1);  
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-01-16', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-07-02', 'Pembersihan mendalam', 1);  
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-05-09', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-12-11', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-01-29', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-01-12', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-03-05', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-01-05', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-02-19', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-03-11', 'Pembersihan mendalam', 1);  
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-12-23', 'Penggantian suku cadang', 1);   
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-10-04', 'Pembersihan mendalam', 1);      
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-01-01', 'Penggantian suku cadang', 1);   
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-01-09', 'Perawatan rutin', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-08-15', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-06-18', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-10-16', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-03-06', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-04-11', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-07-12', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-02-25', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-09-18', 'Penggantian suku cadang', 1);   
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-12-06', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-02-26', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-07-31', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-08-22', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-06-10', 'Penggantian suku cadang', 1);   
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-02-21', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2023-03-30', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-12-23', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-08-31', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-12-12', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-03-06', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-04-29', 'Pembersihan mendalam', 1);  
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-05-16', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-03-13', 'Perawatan rutin', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2023-06-03', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-07-19', 'Perawatan rutin', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2025-03-20', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2025-01-11', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-10-05', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2024-10-06', 'Perawatan rutin', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2025-04-13', 'Penggantian suku cadang', 1);    
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2025-04-22', 'Perawatan rutin', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Press', '2024-11-16', 'Perawatan rutin', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-05-14', 'Pembersihan mendalam', 1);  
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Mesin Cuci', '2023-04-25', 'Penggantian suku cadang', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2023-03-04', 'Kalibrasi', 1);
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Dryer', '2024-09-25', 'Pembersihan mendalam', 1);       
INSERT INTO Maintenance_Alat_Laundry (nama_alat, tanggal_maintenance, deskripsi, id_akun) VALUES ('Vacuum', '2024-06-06', 'Perawatan rutin', 1);
