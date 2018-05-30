-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2018 at 04:48 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bayi`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `akses` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `akses`) VALUES
('kasir', 'kasir', 'kasir'),
('admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Stand-in structure for view `query_transaksi`
-- (See below for the actual view)
--
CREATE TABLE `query_transaksi` (
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `qu_transaksi`
-- (See below for the actual view)
--
CREATE TABLE `qu_transaksi` (
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `q_tran`
-- (See below for the actual view)
--
CREATE TABLE `q_tran` (
`kd_transaksi` varchar(10)
,`tgl_pembelian` date
,`nama` varchar(100)
,`harga` int(6)
,`total` int(12)
);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `kd_barang` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(6) NOT NULL,
  `stok` int(2) NOT NULL,
  `kategori` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`kd_barang`, `nama`, `harga`, `stok`, `kategori`) VALUES
('F0001', 'Dress Langsung', 200000, 123, 'Dress'),
('F0002', 'Celana Denim', 2000000, 60, 'Celana'),
('F0003', 'Jeans Panjang', 430000, 99, 'Celana'),
('F0004', 'Piyama Langsungan', 230000, 51, 'Piyama'),
('F0005', 'Piyama Binatang', 175000, 75, 'Piyama'),
('F0006', 'T-Shirt Panjang', 200000, 50, 'Kaus'),
('F0007', 'T-Shirt Pendek', 250000, 86, 'Kaus');

-- --------------------------------------------------------

--
-- Table structure for table `tmp_transaksi`
--

CREATE TABLE `tmp_transaksi` (
  `no` int(11) NOT NULL,
  `kd_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `tmp_transaksi`
--
DELIMITER $$
CREATE TRIGGER `batal_beli` AFTER DELETE ON `tmp_transaksi` FOR EACH ROW BEGIN UPDATE tbl_barang SET tbl_barang.stok = tbl_barang.stok + old.jumlah WHERE tbl_barang.kd_barang = old.kd_barang; END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `beli` AFTER INSERT ON `tmp_transaksi` FOR EACH ROW BEGIN
UPDATE tbl_barang SET
tbl_barang.stok = tbl_barang.stok - NEW.jumlah
WHERE tbl_barang.kd_barang = new.kd_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `kd_transaksi` varchar(10) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `total` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `query_transaksi`
--
DROP TABLE IF EXISTS `query_transaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `query_transaksi`  AS  select `transaksi`.`kd_transaksi` AS `kd_transaksi`,`transaksi`.`tgl_pembelian` AS `tgl_pembelian`,`transaksi`.`total` AS `total`,`tbl_barang`.`nama` AS `nama`,`tbl_barang`.`merek` AS `merek`,`tbl_barang`.`harga` AS `harga`,`tbl_barang`.`stok` AS `stok` from (`tbl_barang` join `transaksi`) ;

-- --------------------------------------------------------

--
-- Structure for view `qu_transaksi`
--
DROP TABLE IF EXISTS `qu_transaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qu_transaksi`  AS  select `transaksi`.`kd_transaksi` AS `kd_transaksi`,`transaksi`.`kd_barang` AS `kd_barang`,`transaksi`.`tgl_pembelian` AS `tgl_pembelian`,`transaksi`.`total` AS `total`,`tbl_barang`.`nama` AS `nama`,`tbl_barang`.`merek` AS `merek`,`tbl_barang`.`harga` AS `harga` from (`transaksi` join `tbl_barang` on((`transaksi`.`kd_barang` = `tbl_barang`.`kd_barang`))) ;

-- --------------------------------------------------------

--
-- Structure for view `q_tran`
--
DROP TABLE IF EXISTS `q_tran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `q_tran`  AS  select `transaksi`.`kd_transaksi` AS `kd_transaksi`,`transaksi`.`tgl_pembelian` AS `tgl_pembelian`,`tbl_barang`.`nama` AS `nama`,`tbl_barang`.`harga` AS `harga`,`transaksi`.`total` AS `total` from (`tbl_barang` join `transaksi`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `tmp_transaksi`
--
ALTER TABLE `tmp_transaksi`
  ADD PRIMARY KEY (`no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tmp_transaksi`
--
ALTER TABLE `tmp_transaksi`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
