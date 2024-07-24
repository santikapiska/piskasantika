-- Tabel users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'customer') NOT NULL
);

-- Tabel gudang
CREATE TABLE gudang (
    idGudang INT AUTO_INCREMENT PRIMARY KEY,
    lokasi VARCHAR(100) NOT NULL,
    kapasitas INT NOT NULL
);

-- Tabel produk
CREATE TABLE produk (
    idProduk INT AUTO_INCREMENT PRIMARY KEY,
    namaProduk VARCHAR(100) NOT NULL,
    deskripsi TEXT,
    stock INT NOT NULL,
    harga DECIMAL(10, 2) NOT NULL
);

-- Tabel pesanan
CREATE TABLE pesanan (
    idPesanan INT AUTO_INCREMENT PRIMARY KEY,
    tanggalPesanan DATE NOT NULL,
    idProduk INT NOT NULL,
    jumlahPesanan INT NOT NULL,
    statusPesanan ENUM('Belum Diproses', 'Sedang Diproses', 'Selesai') NOT NULL,
    idUser INT NOT NULL,
    FOREIGN KEY (idProduk) REFERENCES produk(idProduk),
    FOREIGN KEY (idUser) REFERENCES users(id)
);
