CREATE TABLE mahasiswa (
    nim VARCHAR(6) PRIMARY KEY,
    nama VARCHAR(50),
    alamat VARCHAR(100),
    jurusan VARCHAR(50),
    umur INTEGER
);

CREATE TABLE mata_kuliah (
    id INTEGER PRIMARY KEY,
    mata_kuliah VARCHAR(50),
    nim VARCHAR(6),
    nilai INTEGER,
    dosen_pengajar VARCHAR(50),
    FOREIGN KEY (nim) REFERENCES mahasiswa(nim)
);

INSERT INTO mahasiswa (nim, nama, alamat, jurusan, umur) VALUES
('123456', 'John', 'Jl. Merdeka No. 1', 'Teknik Informatika', 21),
('234567', 'Alice', 'Jl. Gatot Subroto', 'Sistem Informasi', 23),
('345678', 'Bob', 'Jl. Sudirman No. 5', 'Teknik Informatika', 20),
('456780', 'Cindy', 'Jl. Pahlawan No. 2', 'Manajemen', 22),
('567890', 'David', 'Jl. Diponegoro No. 3', 'Teknik Elektro', 25),
('678901', 'Emily', 'Jl. Cendrawasih No. 4', 'Manajemen', 24),
('789012', 'Frank', 'Jl. Ahmad Yani No. 6', 'Teknik Informatika', 19);

INSERT INTO mata_kuliah (id, mata_kuliah, nim, nilai, dosen_pengajar) VALUES
(1, 'Pemrograman Web', '123456', 80, 'Pak Budi'),
(2, 'Basis Data', '234567', 70, 'Ibu Ani'),
(3, 'Jaringan Komputer', '345678', 75, 'Pak Dodi'),
(4, 'Sistem Operasi', '123456', 90, 'Pak Budi'),
(5, 'Manajemen Proyek', '456780', 60, 'Ibu Desi'),
(6, 'Bahasa Inggris', '567890', 55, 'Ibu Eka'),
(7, 'Statistika', '678901', 75, 'Pak Farhan'),
(8, 'Algoritma', '789012', 65, 'Pak Galih'),
(9, 'Pemrograman Java', '123456', 95, 'Pak Budi');

UPDATE mahasiswa 
SET alamat = 'Jl. Raya No.5'
WHERE nim = '123456';

SELECT m.nim, m.nama, m.jurusan, mk.dosen_pengajar
FROM mahasiswa m
JOIN mata_kuliah mk ON m.nim = mk.nim
WHERE m.jurusan = 'Teknik Informatika'
GROUP BY m.nim, m.nama, m.jurusan, mk.dosen_pengajar;

SELECT nama, umur
FROM mahasiswa
ORDER BY umur DESC
LIMIT 5;

SELECT m.nama, mk.mata_kuliah, mk.nilai
FROM mahasiswa m
JOIN mata_kuliah mk ON m.nim = mk.nim
WHERE mk.nilai > 70
ORDER BY m.nama, mk.mata_kuliah;