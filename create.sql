
CREATE DATABASE IF NOT EXISTS PendaftaranSiswa;
USE PendaftaranSiswa;


CREATE TABLE IF NOT EXISTS siswa (
    id_siswa INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    ktp VARCHAR(50) UNIQUE NOT NULL,
    tanggal_lahir DATE NOT NULL,
    nomor_pendaftaran VARCHAR(20) UNIQUE NOT NULL,
    alamat VARCHAR(255),
    telepon VARCHAR(15),
    tanggal_pendaftaran DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS hasil_test (
    id_test INT PRIMARY KEY AUTO_INCREMENT,
    id_siswa INT NOT NULL,
    tanggal_test DATE,
    nilai INT,
    FOREIGN KEY (id_siswa) REFERENCES siswa(id_siswa) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS pembayaran (
    id_pembayaran INT PRIMARY KEY AUTO_INCREMENT,
    id_siswa INT NOT NULL,
    jumlah DECIMAL(10, 2),
    tanggal_pembayaran DATE,
    FOREIGN KEY (id_siswa) REFERENCES siswa(id_siswa) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS pendaftaran (
    id_pendaftaran INT PRIMARY KEY AUTO_INCREMENT,
    id_siswa INT,
    tanggal_pendaftaran DATE,
    FOREIGN KEY (id_siswa) REFERENCES siswa(id_siswa) ON DELETE CASCADE
);

DELIMITER //


CREATE PROCEDURE DaftarSiswa(
    IN p_nama VARCHAR(100),
    IN p_tanggal_lahir DATE,
    IN p_nomor_pendaftaran VARCHAR(20)
)
BEGIN
    INSERT INTO siswa (nama, tanggal_lahir, nomor_pendaftaran, alamat, telepon)
    VALUES (p_nama, p_tanggal_lahir, p_nomor_pendaftaran, NULL, NULL);
    
    INSERT INTO pendaftaran (id_siswa, tanggal_pendaftaran)
    VALUES (LAST_INSERT_ID(), CURDATE());
END //


CREATE PROCEDURE PerbaruiStatusPembayaran(
    IN p_id_siswa INT,
    IN p_status_pembayaran VARCHAR(20)
)
BEGIN
    UPDATE siswa
    SET status_pembayaran = p_status_pembayaran
    WHERE id_siswa = p_id_siswa;
END //


CREATE PROCEDURE CatatHasilTest(
    IN p_id_siswa INT,
    IN p_nilai INT
)
BEGIN
    INSERT INTO hasil_test (id_siswa, tanggal_test, nilai)
    VALUES (p_id_siswa, CURDATE(), p_nilai);
END //

DELIMITER ;

