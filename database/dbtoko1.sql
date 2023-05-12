-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2023 at 06:17 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbtoko1`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addJenis_produk` (`nama` VARCHAR(20), `ket` VARCHAR(50))   BEGIN
INSERT INTO jenis_produk(nama, ket) VALUES(nama, ket);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addPesanan` (`tanggal` DATE, `total` DOUBLE, `pelanggan_id` INT)   BEGIN
INSERT INTO pesanan(tanggal, total, pelanggan_id) VALUES (tanggal, total, pelanggan_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `allPesanan` ()   BEGIN
SELECT pelanggan.nama_pelanggan, pesanan.tanggal, pesanan.total FROM pelanggan
JOIN pesanan ON pelanggan.id = pesanan.pelanggan_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inputPelanggan` (`kode` VARCHAR(10), `nama_pelanggan` VARCHAR(50), `jk` CHAR(1), `tmp_lahir` VARCHAR(30), `tgl_lahir` DATE, `email` VARCHAR(30), `kartu_id` INT(11))   BEGIN
INSERT INTO pelanggan(kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, kartu_id)
VALUES(kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, kartu_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inputProduk` (`kode` VARCHAR(10), `nama` VARCHAR(45), `harga_beli` DOUBLE, `harga_jual` DOUBLE, `stok` INT(11), `min_stok` INT(11), `jenis_produk_id` INT(11))   BEGIN
INSERT INTO produk(kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id)
VALUES(kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `showPelanggan` ()   BEGIN
SELECT * FROM pelanggan;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `showProduk` ()   BEGIN
SELECT * FROM produk;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `showProduks` ()   BEGIN
SELECT nama, harga_beli, harga_jual FROM produk;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `totalPesanan` ()   BEGIN
SELECT pelanggan.nama_pelanggan, SUM(pesanan.total) AS total_pesanan FROM pelanggan
JOIN pesanan ON pelanggan.id = pesanan.pelanggan_id GROUP BY pelanggan.nama_pelanggan;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `detail_produk_vw`
-- (See below for the actual view)
--
CREATE TABLE `detail_produk_vw` (
`id` int(11)
,`kode` varchar(10)
,`nama` varchar(45)
,`harga_beli` double
,`harga_jual` double
,`stok` int(11)
,`min_stok` int(11)
,`jenis_produk_id` int(11)
,`jenis` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_produk`
--

CREATE TABLE `jenis_produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) DEFAULT NULL,
  `ket` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jenis_produk`
--

INSERT INTO `jenis_produk` (`id`, `nama`, `ket`) VALUES
(1, 'Elektronik', 'Tidak Tersedia'),
(2, 'Makanan', 'Tersedia'),
(3, 'Minuman', 'Tidak Tersedia'),
(4, 'Furniture', 'Tersedia'),
(5, 'Alat kebersihan', 'Tersedia'),
(6, 'Perabot', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `kartu`
--

CREATE TABLE `kartu` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(30) NOT NULL,
  `diskon` double DEFAULT 0,
  `iuran` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kartu`
--

INSERT INTO `kartu` (`id`, `kode`, `nama`, `diskon`, `iuran`) VALUES
(1, '10111', 'Gold', 20000, 2000),
(2, '10112', 'Silver', 15000, 1500),
(4, '10113', 'Perak', 10000, 1000),
(5, '10114', 'Platinum', 25000, 3000);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` enum('admin','manager','staff') NOT NULL,
  `foto` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `fullname`, `username`, `password`, `role`, `foto`) VALUES
(1, 'Admin', 'admin', '67771da7cef164702710b6803ea0b0', 'admin', 'admin.jpg'),
(2, 'Siti', 'siti', 'b48d66e55c41b0abb8c540b518f2e2', 'manager', 'manager.jpg'),
(3, 'Staff', 'staff', '6a91eb6ae9cc8e3a67d32b286c56c3', 'staff', 'staff.jpg'),
(4, 'Admin1', 'admin1', '967a9f8fa757dfb5fdda6e5e08579869fb9b2ae3', 'admin', NULL),
(5, 'Manager', 'manager', '54dd75eddaa72e610b060ae82548b2430a4dfbdc', 'manager', NULL),
(6, 'Staff1', 'staff1', 'ae186d20e1a1b46737a98ef69fc0896ba7cca385', 'staff', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `nama_pelanggan` varchar(50) DEFAULT NULL,
  `jk` char(1) DEFAULT NULL,
  `tmp_lahir` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `kartu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `kode`, `nama_pelanggan`, `jk`, `tmp_lahir`, `tgl_lahir`, `email`, `kartu_id`) VALUES
(1, '011101', 'Agung', 'L', 'Bandung', '1997-09-06', 'agung@gmail.com', 1),
(2, '011102', 'Pandan Wangi', 'P', 'Yogyakarta', '1998-08-07', 'pandan@gmail.com', 2),
(3, '011103', 'Sekar', 'P', 'Kediri', '2001-09-08', 'sekar@gmail.com', 1),
(4, '011104', 'Suandi', 'L', 'Jakarta', '1997-09-08', 'suandi@gmail.com', 1),
(5, '011105', 'Pradana', 'L', 'Jakarta', '2001-08-01', 'pradana@gmail.com', 2),
(6, '011106', 'Gayatri Putri', 'P', 'Jakarta', '2002-09-01', 'gayatri@gmail.com', 1),
(7, '011107', 'Cakra', 'L', 'Depok', '1999-05-08', 'cakra@gmail.com', 1),
(8, '011108', 'Ririn', 'P', 'Surabaya', '1998-08-28', 'ririn@gmail.com', 2),
(11, '011109', 'Ara', 'P', 'Surabaya', '2001-01-09', 'araa@gmail.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `no_kuitansi` varchar(10) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jumlah` double DEFAULT NULL,
  `ke` int(11) DEFAULT NULL,
  `status_pembayaran` varchar(50) DEFAULT NULL,
  `pesanan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `pembayaran`
--
DELIMITER $$
CREATE TRIGGER `status_pembayaran` BEFORE INSERT ON `pembayaran` FOR EACH ROW BEGIN
DECLARE total_pesanan int;
DECLARE jumlah_pembayaran int;
DECLARE sisa_pembayaran int;
SELECT total INTO total_pesanan FROM pesanan WHERE id = NEW.pesanan_id;
SELECT SUM(jumlah) INTO jumlah_pembayaran FROM pembayaran WHERE pesanan_id = NEW.pesanan_id;
SET sisa_pembayaran = total_pesanan - jumlah_pembayaran;
IF sisa_pembayaran <= 0 THEN
UPDATE pembayaran SET status_pembayaran = 'Lunas' WHERE id = NEW.id;
ELSE
UPDATE pembayaran SET status_pembayaran = 'Belum Lunas' WHERE id = NEW.id;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(11) NOT NULL,
  `tanggal` varchar(45) DEFAULT NULL,
  `nomor` varchar(10) DEFAULT NULL,
  `produk_id` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `vendor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `pelanggan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id`, `tanggal`, `total`, `pelanggan_id`) VALUES
(2, '2023-03-03', 200000, 1),
(3, '2022-02-02', 30000, 1),
(4, '2023-05-05', 3000000, 4),
(5, '2023-05-05', 2000000, 2),
(6, '2023-05-06', 4000000, 5),
(7, '2023-05-09', 2000000, 3),
(8, '2023-05-10', 3000000, 7);

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_items`
--

CREATE TABLE `pesanan_items` (
  `id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `pesanan_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `harga` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan_items`
--

INSERT INTO `pesanan_items` (`id`, `produk_id`, `pesanan_id`, `qty`, `harga`) VALUES
(1, 1, 2, 2, 30000),
(2, 1, 1, 2, 30000),
(3, 3, 2, 2, 5000000);

--
-- Triggers `pesanan_items`
--
DELIMITER $$
CREATE TRIGGER `keranjang_pesanan_items` BEFORE INSERT ON `pesanan_items` FOR EACH ROW BEGIN
SET @stok = (SELECT stok FROM produk WHERE id = NEW.produk_id);
SET @sisa = @stok - NEW.qty;
IF @sisa < 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak cukup';
END IF;
UPDATE produk SET stok = @sisa WHERE id = NEW.produk_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `transaksi_update_before` BEFORE UPDATE ON `pesanan_items` FOR EACH ROW BEGIN
IF OLD.id = NEW.produk_id THEN
SET @stok = (SELECT stok FROM produk WHERE id = OLD.produk_id);
SET @sisa = (@stok + OLD.qty) - NEW.qty;
IF @sisa < 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak cukup';
END IF;
UPDATE produk SET stok = @sisa WHERE id = OLD.produk_id;
ELSE
SET @stok_lama = (SELECT stok FROM produk WHERE id = OLD.produk_id);
SET @sisa_lama = (@stok_lama + OLD.qty);
UPDATE produk SET stok = @sisa_lama WHERE id = OLD.produk_id;
SET @stok_baru = (SELECT stok FROM produk WHERE id = NEW.produk_id);
SET @sisa_baru = @stok_baru - NEW.qty;
IF @sisa_baru < 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak tersedia';
END IF;
UPDATE produk SET stok = @sisa_baru WHERE id = NEW.produk_id;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `pesanan_produk_vw`
-- (See below for the actual view)
--
CREATE TABLE `pesanan_produk_vw` (
`id` int(11)
,`kode_pelanggan` varchar(10)
,`nama_pelanggan` varchar(50)
,`jk` char(1)
,`kartu_id` int(11)
,`kode_produk` varchar(10)
,`nama_produk` varchar(45)
,`tanggal` date
,`total` double
);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(45) NOT NULL,
  `harga_beli` double DEFAULT NULL,
  `harga_jual` double DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `min_stok` int(11) DEFAULT NULL,
  `jenis_produk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `kode`, `nama`, `harga_beli`, `harga_jual`, `stok`, `min_stok`, `jenis_produk_id`) VALUES
(1, 'TV01', 'TV', 3000000, 4000000, 3, 2, 1),
(2, 'TV02', 'TV 21 Inch', 2000000, 3000000, 10, 3, 1),
(3, 'K001', 'Kulkas', 4000000, 5000000, 8, 3, 1),
(4, 'M001', 'Meja Makan', 1000000, 2000000, 4, 2, 4),
(5, 'T001', 'Taro', 4000, 5000, 3, 2, 2),
(7, 'A001', 'AC', 2000000, 3000000, 7, 2, 1),
(8, 'TP01', 'Teh Pucuk', 5000, 6000, 10, 2, 3),
(9, 'R001', 'Radio', 1000000, 1500000, 11, 3, 1),
(12, 'TK', 'Teh Kotak', 4000, 5000, 7, 2, 3),
(13, 'KA001', 'Kipas Angin', 500000, 650000, 5, 1, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tampil_produk`
-- (See below for the actual view)
--
CREATE TABLE `tampil_produk` (
`nama` varchar(45)
);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL,
  `nomor` varchar(4) DEFAULT NULL,
  `nama` varchar(40) NOT NULL,
  `kota` varchar(30) DEFAULT NULL,
  `kontak` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure for view `detail_produk_vw`
--
DROP TABLE IF EXISTS `detail_produk_vw`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_produk_vw`  AS SELECT `p`.`id` AS `id`, `p`.`kode` AS `kode`, `p`.`nama` AS `nama`, `p`.`harga_beli` AS `harga_beli`, `p`.`harga_jual` AS `harga_jual`, `p`.`stok` AS `stok`, `p`.`min_stok` AS `min_stok`, `p`.`jenis_produk_id` AS `jenis_produk_id`, `j`.`nama` AS `jenis` FROM (`jenis_produk` `j` join `produk` `p` on(`p`.`jenis_produk_id` = `j`.`id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `pesanan_produk_vw`
--
DROP TABLE IF EXISTS `pesanan_produk_vw`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pesanan_produk_vw`  AS SELECT `pelanggan`.`id` AS `id`, `pelanggan`.`kode` AS `kode_pelanggan`, `pelanggan`.`nama_pelanggan` AS `nama_pelanggan`, `pelanggan`.`jk` AS `jk`, `pelanggan`.`kartu_id` AS `kartu_id`, `produk`.`kode` AS `kode_produk`, `produk`.`nama` AS `nama_produk`, `pesanan`.`tanggal` AS `tanggal`, `pesanan`.`total` AS `total` FROM ((`produk` join `pesanan` on(`produk`.`id` = `pesanan`.`pelanggan_id`)) join `pelanggan` on(`pelanggan`.`id` = `pesanan`.`pelanggan_id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `tampil_produk`
--
DROP TABLE IF EXISTS `tampil_produk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tampil_produk`  AS SELECT `produk`.`nama` AS `nama` FROM `produk``produk`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_produk`
--
ALTER TABLE `jenis_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kartu`
--
ALTER TABLE `kartu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_kuitansi` (`no_kuitansi`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor` (`nomor`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan_items`
--
ALTER TABLE `pesanan_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor` (`nomor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis_produk`
--
ALTER TABLE `jenis_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kartu`
--
ALTER TABLE `kartu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pesanan_items`
--
ALTER TABLE `pesanan_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
