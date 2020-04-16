-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2020 at 03:04 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_lelang_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `history_lelang`
--

CREATE TABLE `history_lelang` (
  `id_history` int(11) NOT NULL,
  `id_lelang` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `penawaran_harga` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_lelang`
--

INSERT INTO `history_lelang` (`id_history`, `id_lelang`, `id_barang`, `id_user`, `penawaran_harga`) VALUES
(1, 1, 1, 2, 2500000),
(2, 2, 2, 1, 600000),
(3, 3, 3, 4, 6000000);

-- --------------------------------------------------------

--
-- Table structure for table `masyarakat_baru`
--

CREATE TABLE `masyarakat_baru` (
  `id_masyarakat_baru` int(11) NOT NULL,
  `nama` varchar(25) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `telp` varchar(25) DEFAULT NULL,
  `waktu_perubahan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `masyarakat_baru`
--

INSERT INTO `masyarakat_baru` (`id_masyarakat_baru`, `nama`, `username`, `password`, `telp`, `waktu_perubahan`) VALUES
(7, 'Alfath', 'alfathNafidz', 'alfath123', '081658954785', '2020-02-13');

-- --------------------------------------------------------

--
-- Table structure for table `masyarakat_hapus`
--

CREATE TABLE `masyarakat_hapus` (
  `id_masyarakat` int(11) NOT NULL,
  `nama` varchar(25) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `telp` varchar(25) DEFAULT NULL,
  `waktu_perubahan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `masyarakat_hapus`
--

INSERT INTO `masyarakat_hapus` (`id_masyarakat`, `nama`, `username`, `telp`, `waktu_perubahan`) VALUES
(5, 'Farhan', 'farhandwi', '081559874125', '2020-02-13');

-- --------------------------------------------------------

--
-- Table structure for table `masyarakat_ubah`
--

CREATE TABLE `masyarakat_ubah` (
  `id_masyarakat_ubah` int(11) NOT NULL,
  `nama` varchar(25) DEFAULT NULL,
  `username_lama` varchar(25) DEFAULT NULL,
  `username_baru` varchar(25) DEFAULT NULL,
  `waktu_perubahan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `masyarakat_ubah`
--

INSERT INTO `masyarakat_ubah` (`id_masyarakat_ubah`, `nama`, `username_lama`, `username_baru`, `waktu_perubahan`) VALUES
(4, NULL, 'ricoenrico', 'enricoenrico', '2020-02-13');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(25) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `harga_awal` int(20) DEFAULT NULL,
  `deskripsi_barang` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `tgl`, `harga_awal`, `deskripsi_barang`) VALUES
(1, 'laptop', '2020-01-08', 2000000, 'Laptop Lenovo'),
(2, 'handphone', '2020-01-13', 500000, 'Handphone Oppo'),
(3, 'motor', '2019-12-21', 8000000, 'Motor GL-PRO'),
(4, 'mobil', '2018-12-18', 20000000, 'Mobil PickUp'),
(5, 'handphone', '2020-02-12', 1000000, 'Handphone IPhone');

-- --------------------------------------------------------

--
-- Table structure for table `tb_lelang`
--

CREATE TABLE `tb_lelang` (
  `id_lelang` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `tgl_lelang` date DEFAULT NULL,
  `harga_akhir` int(20) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_petugas` int(11) DEFAULT NULL,
  `status` enum('dibuka','ditutup') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_lelang`
--

INSERT INTO `tb_lelang` (`id_lelang`, `id_barang`, `tgl_lelang`, `harga_akhir`, `id_user`, `id_petugas`, `status`) VALUES
(1, 1, '2020-01-09', 2500000, 2, 2, 'dibuka'),
(2, 2, '2020-01-20', 600000, 1, 3, 'ditutup'),
(3, 3, '2020-02-13', 5000000, 4, 1, 'dibuka');

-- --------------------------------------------------------

--
-- Table structure for table `tb_level`
--

CREATE TABLE `tb_level` (
  `id_level` int(11) NOT NULL,
  `level` enum('administrator','petugas') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_level`
--

INSERT INTO `tb_level` (`id_level`, `level`) VALUES
(1, 'petugas'),
(2, 'administrator');

-- --------------------------------------------------------

--
-- Table structure for table `tb_masyarakat`
--

CREATE TABLE `tb_masyarakat` (
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(25) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `telp` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_masyarakat`
--

INSERT INTO `tb_masyarakat` (`id_user`, `nama_lengkap`, `username`, `password`, `telp`) VALUES
(1, 'Hilmantaris', 'HilmanTM', 'hilman123', '081548965421'),
(2, 'AfifMaulana', 'AfifM', 'afif123', '081654789652'),
(3, 'MAfrizal', 'Afrizal', 'afrizal123', '082269485236'),
(4, 'Enrico', 'enricoenrico', 'enrico123', '081221648859'),
(7, 'Alfath', 'alfathNafidz', 'alfath123', '081658954785');

--
-- Triggers `tb_masyarakat`
--
DELIMITER $$
CREATE TRIGGER `masyarakat_baru` AFTER INSERT ON `tb_masyarakat` FOR EACH ROW BEGIN
    INSERT INTO masyarakat_baru (id_masyarakat_baru, nama, username, password, telp, waktu_perubahan)
    VALUES (new.id_user, new.nama_lengkap, new.username, new.password, new.telp, SYSDATE());
  END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `masyarakat_hapus` AFTER DELETE ON `tb_masyarakat` FOR EACH ROW BEGIN
    INSERT INTO masyarakat_hapus (id_masyarakat, nama, username, telp, waktu_perubahan)
    VALUES (old.id_user, old.nama_lengkap, old.username, old.telp, SYSDATE());
  END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `masyarakat_ubah` BEFORE UPDATE ON `tb_masyarakat` FOR EACH ROW BEGIN
    INSERT INTO masyarakat_ubah
    SET id_masyarakat_ubah = old.id_user,
    username_lama = old.username,
    username_baru = new.username,
    waktu_perubahan = NOW();
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(25) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `id_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_petugas`
--

INSERT INTO `tb_petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `id_level`) VALUES
(1, 'Farhan', 'farhandwi', 'farhan123', 1),
(2, 'Rafli', 'raflipratama', 'rafli123', 1),
(3, 'Ilham', 'ilhamMukti', 'ilham123', 2),
(4, 'Dzikri', 'dzikriA', 'dzikri123', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `history_lelang`
--
ALTER TABLE `history_lelang`
  ADD PRIMARY KEY (`id_history`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_lelang` (`id_lelang`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `masyarakat_baru`
--
ALTER TABLE `masyarakat_baru`
  ADD PRIMARY KEY (`id_masyarakat_baru`);

--
-- Indexes for table `masyarakat_hapus`
--
ALTER TABLE `masyarakat_hapus`
  ADD PRIMARY KEY (`id_masyarakat`);

--
-- Indexes for table `masyarakat_ubah`
--
ALTER TABLE `masyarakat_ubah`
  ADD PRIMARY KEY (`id_masyarakat_ubah`);

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tb_lelang`
--
ALTER TABLE `tb_lelang`
  ADD PRIMARY KEY (`id_lelang`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indexes for table `tb_level`
--
ALTER TABLE `tb_level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `tb_masyarakat`
--
ALTER TABLE `tb_masyarakat`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`id_petugas`),
  ADD KEY `id_level` (`id_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `history_lelang`
--
ALTER TABLE `history_lelang`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `masyarakat_baru`
--
ALTER TABLE `masyarakat_baru`
  MODIFY `id_masyarakat_baru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `masyarakat_hapus`
--
ALTER TABLE `masyarakat_hapus`
  MODIFY `id_masyarakat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `masyarakat_ubah`
--
ALTER TABLE `masyarakat_ubah`
  MODIFY `id_masyarakat_ubah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_lelang`
--
ALTER TABLE `tb_lelang`
  MODIFY `id_lelang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_level`
--
ALTER TABLE `tb_level`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_masyarakat`
--
ALTER TABLE `tb_masyarakat`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history_lelang`
--
ALTER TABLE `history_lelang`
  ADD CONSTRAINT `history_lelang_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_masyarakat` (`id_user`),
  ADD CONSTRAINT `history_lelang_ibfk_2` FOREIGN KEY (`id_lelang`) REFERENCES `tb_lelang` (`id_lelang`),
  ADD CONSTRAINT `history_lelang_ibfk_3` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`);

--
-- Constraints for table `tb_lelang`
--
ALTER TABLE `tb_lelang`
  ADD CONSTRAINT `tb_lelang_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_masyarakat` (`id_user`),
  ADD CONSTRAINT `tb_lelang_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`),
  ADD CONSTRAINT `tb_lelang_ibfk_3` FOREIGN KEY (`id_petugas`) REFERENCES `tb_petugas` (`id_petugas`);

--
-- Constraints for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD CONSTRAINT `tb_petugas_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `tb_level` (`id_level`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
