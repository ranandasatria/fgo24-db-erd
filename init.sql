CREATE TABLE kategori (
  id_kategori VARCHAR(255) PRIMARY KEY,
  nama_kategori VARCHAR(255)
)

INSERT INTO kategori(id_kategori, nama_kategori)
VALUES ('K1', 'Sejarah'), ('K2', 'Sains'), ('K3', 'Sastra'), ('K4', 'Religi'), ('K5', 'Politik'), ('K6', 'Self-Improvement'), ('K7', 'Filsafat'), ('K8', 'Bahasa'), ('K9', 'Ekonomi'), ('K10', 'Teknologi');

SELECT * FROM kategori

CREATE TABLE rak (
  id_rak VARCHAR(255) PRIMARY KEY,
  kode_rak VARCHAR(255),
  kapasitas INT
)

INSERT INTO rak(id_rak, kode_rak, kapasitas)
VALUES ('R1', 'SJR', 100), ('R2', 'SNS', 100), ('R3', 'SAS', 100), ('R4', 'RLG', 100), ('R5', 'PLT', 100), ('R6', 'SLI', 100), ('R7', 'FLS', 100), ('R8', 'BHS', 100), ('R9', 'EKN', 100), ('R10', 'TKN', 100);

SELECT * FROM rak

CREATE TABLE petugas (
  id_petugas VARCHAR(255) PRIMARY KEY,
  nama_petugas VARCHAR(255)
)

INSERT INTO petugas(id_petugas, nama_petugas)
VALUES 
('PTG-1', 'Denis'), 
('PTG-2', 'Naldy'), 
('PTG-3', 'Dwi'), 
('PTG-4', 'Hosea'), 
('PTG-5', 'Yusuf'), 
('PTG-6', 'Faisal'), 
('PTG-7', 'Yassir'), 
('PTG-8', 'Nanda'), 
('PTG-9', 'Irul'), 
('PTG-10', 'Asep')

SELECT * FROM petugas

CREATE TABLE peminjam (
  id_peminjam VARCHAR(255) PRIMARY KEY,
  nama_peminjam VARCHAR(255),
  no_hp VARCHAR(255),
  alamat VARCHAR(255)
)

ALTER TABLE peminjam
ALTER COLUMN no_hp TYPE VARCHAR(255)

INSERT INTO peminjam(id_peminjam, nama_peminjam, no_hp, alamat)
VALUES 
('PMJ-1', 'Joyko', '081233757081', 'Jl. Purba 1'),
('PMJ-2', 'Soni Boy', '081233757082', 'Jl. Purba 2'),
('PMJ-3', 'Deli', '081233757083', 'Jl. Purba 3'),
('PMJ-4', 'Aser', '081233757084', 'Jl. Purba 4'),
('PMJ-5', 'Reksus', '081233757085', 'Jl. Purba 5'),
('PMJ-6', 'Somi', '081233757086', 'Jl. Purba 6'),
('PMJ-7', 'H. Pakard', '081233757087', 'Jl. Purba 7'),
('PMJ-8', 'McBun', '081233757088', 'Jl. Purba 8'),
('PMJ-9', 'Samson', '081233757089', 'Jl. Purba 9'),
('PMJ-10', 'Sansta', '081233757080', 'Jl. Purba 10');

SELECT * FROM peminjam

CREATE TABLE buku (
  id_buku VARCHAR(255) PRIMARY KEY,
  isbn VARCHAR(255),
  judul VARCHAR(255),
  penulis VARCHAR(255),
  sinopsis VARCHAR(255),
  penerbit VARCHAR(255),
  cetakan_ke INTEGER,
  tanggal_terbit DATE,
  jumlah_halaman INTEGER,
  id_kategori VARCHAR(255) REFERENCES kategori(id_kategori),
  id_rak VARCHAR(255) REFERENCES rak(id_rak),
  id_petugas VARCHAR(255) REFERENCES petugas(id_petugas)
);

CREATE TABLE transaksi (
  id_transaksi VARCHAR(255) PRIMARY KEY,
  id_buku VARCHAR(255) REFERENCES buku(id_buku),
  id_peminjam VARCHAR(255) REFERENCES peminjam(id_peminjam),
  id_petugas VARCHAR(255) REFERENCES petugas(id_petugas),
  tanggal_peminjaman DATE,
  batas_pengembalian DATE
)

SELECT * FROM buku
