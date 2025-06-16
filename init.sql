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

ALTER TABLE buku
RENAME COLUMN tanggal_terbit TO tahun_terbit;
ALTER TABLE buku
ALTER COLUMN tahun_terbit TYPE VARCHAR(255);

ALTER TABLE buku
ALTER COLUMN sinopsis TYPE TEXT;


INSERT INTO buku(id_buku, isbn, judul, penulis, sinopsis, penerbit, cetakan_ke, tahun_terbit, jumlah_halaman, id_kategori, id_rak, id_petugas)
VALUES
('BUKU-1', '9789791757904', 'Dalih Pembunuhan Massal', 'John Rossa', 'sinopsis', 'Institut Sejarah Sosial Indonesia', 1, '2008', 392 'K1', 'R1', 'PTG-1')
('BUKU-2', '9789791757904', 'Dalih Pembunuhan Massal', 'John Rossa', 'sinopsis', 'Institut Sejarah Sosial Indonesia', 1, '2008', 392 'K2', 'R2', 'PTG-2')


UPDATE buku
SET sinopsis = 'Buku ini merupakan catatan paling detil dan dengan penelitian terbaik tentang kejadian-kejadian 1965 yang pernah ditulis. Siapa pun yang berniat memahami kejadian-kejadian yang masih menebar mendung di atas bumi Indonesia dan sedikit dipahami oleh sebagian besar masyarakat Indonesia akan memperoleh manfaat sangat besar dengan membaca buku ini.'
WHERE id_buku = 'BUKU-1'

INSERT INTO buku (id_buku, isbn, judul, penulis, sinopsis, penerbit, cetakan_ke, tahun_terbit, jumlah_halaman, id_kategori, id_rak, id_petugas) VALUES

('BUKU-2', '9780226458120', 'The Structure of Scientific Revolutions', 'Thomas S. Kuhn', 'Buku ini menjelaskan bahwa perkembangan ilmu tidak berjalan secara linier, melainkan melalui revolusi paradigma. Ia mengubah secara radikal cara kita melihat sejarah dan kemajuan sains.', 'University of Chicago Press',  1, '1962', 264, 'K2', 'R2', 'PTG-2'),

('BUKU-3', '9780811213783', 'The Rings of Saturn', 'W.G. Sebald', 'Perjalanan melintasi Suffolk, Inggris, yang berubah menjadi meditatif tentang sejarah, kehilangan, dan memori.', 'New Directions', 1, '1995', 304, 'K3', 'R3', 'PTG-3'),

('BUKU-4', '9786020322038', 'Al-Muqaddimah', 'Ibn Khaldun', 'Pendekatan filsafat sejarah dan agama Islam, membahas masyarakat, kekuasaan, dan kebudayaan secara revolusioner.', 'Pustaka Al-Kautsar', 1, '1377', 544, 'K4', 'R4', 'PTG-4'),

('BUKU-5', '9780140449150', 'The Prince', 'Niccolò Machiavelli', 'Panduan realis tentang kekuasaan, strategi, dan kelicikan dalam politik.', 'Penguin Classics', 1, '1532', 140, 'K5', 'R5', 'PTG-5'),

('BUKU-6', '9780812979688', 'Antifragile: Things That Gain from Disorder', 'Nassim Nicholas Taleb', 'Sebuah eksplorasi tentang bagaimana menghadapi ketidakpastian dengan menjadi antifragile, bukan hanya tangguh.', 'Random House', 1, '2012', 519, 'K6', 'R6', 'PTG-6'),

('BUKU-7', '9780521657297', 'Critique of Pure Reason', 'Immanuel Kant', 'Karya fundamental dalam epistemologi dan metafisika modern, mendefinisikan batas-batas akal manusia.', 'Cambridge University Press', 1, '1781', 856, 'K7', 'R7', 'PTG-7'),

('BUKU-8', '9783112316009', 'Syntactic Structures', 'Noam Chomsky', 'Salah satu karya paling berpengaruh dalam linguistik modern yang memperkenalkan grammar transformasional.', 'Mouton', 1, '1957', 117, 'K8', 'R8', 'PTG-8'),

('BUKU-9', '9791098182', 'Asal Usul Kekayaan', 'Martin Suryajaya', 'Membedah bagaimana kekayaan tercipta, dibentuk oleh relasi sosial dan sejarah ekonomi.', 'Resist Book', 1, '2013', 368, 'K9', 'R9', 'PTG-9'),

('BUKU-10', '9780201112979', 'Understanding Computers and Cognition', 'Terry Winograd & Fernando Flores', 'Analisis penting mengenai hubungan antara komputer, bahasa, dan pemahaman manusia dalam dunia digital.', 'Addison-Wesley', 1, '1986', 302, 'K10', 'R10', 'PTG-10');


SELECT * FROM buku

CREATE TABLE transaksi (
  id_transaksi VARCHAR(255) PRIMARY KEY,
  id_buku VARCHAR(255) REFERENCES buku(id_buku),
  id_peminjam VARCHAR(255) REFERENCES peminjam(id_peminjam),
  id_petugas VARCHAR(255) REFERENCES petugas(id_petugas),
  tanggal_peminjaman DATE,
  batas_pengembalian DATE
)

INSERT INTO transaksi (
  id_transaksi, id_buku, id_peminjam, id_petugas, tanggal_peminjaman, batas_pengembalian
) VALUES
('TRX-001', 'BUKU-1', 'PMJ-1', 'PTG-1', '2025-06-01', '2025-06-15'),
('TRX-002', 'BUKU-2', 'PMJ-2', 'PTG-2', '2025-06-02', '2025-06-16'),
('TRX-003', 'BUKU-3', 'PMJ-3', 'PTG-3', '2025-06-03', '2025-06-17'),
('TRX-004', 'BUKU-4', 'PMJ-4', 'PTG-4', '2025-06-04', '2025-06-18'),
('TRX-005', 'BUKU-5', 'PMJ-5', 'PTG-5', '2025-06-05', '2025-06-19'),
('TRX-006', 'BUKU-6', 'PMJ-6', 'PTG-6', '2025-06-06', '2025-06-20'),
('TRX-007', 'BUKU-7', 'PMJ-7', 'PTG-7', '2025-06-07', '2025-06-21'),
('TRX-008', 'BUKU-8', 'PMJ-8', 'PTG-8', '2025-06-08', '2025-06-22'),
('TRX-009', 'BUKU-9', 'PMJ-9', 'PTG-9', '2025-06-09', '2025-06-23'),
('TRX-010', 'BUKU-10', 'PMJ-10', 'PTG-10', '2025-06-10', '2025-06-24');

SELECT * FROM transaksi 

