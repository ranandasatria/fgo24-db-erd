CREATE TABLE kategori (
  id_kategori VARCHAR(255) PRIMARY KEY,
  nama_kategori VARCHAR(255)
)

CREATE TABLE rak (
  id_rak VARCHAR(255) PRIMARY KEY,
  kode_rak VARCHAR(255),
  kapasitas INT
)

CREATE TABLE petugas (
  id_petugas VARCHAR(255) PRIMARY KEY,
  nama_petugas VARCHAR(255)
)

CREATE TABLE peminjam (
  id_peminjam VARCHAR(255) PRIMARY KEY,
  nama_peminjam VARCHAR(255),
  no_hp INTEGER,
  alamat VARCHAR(255)
)


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
