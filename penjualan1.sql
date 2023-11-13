-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2023 at 12:42 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan1`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kode_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` varchar(50) NOT NULL,
  `nama_customer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan_barang`
--

CREATE TABLE `detail_penjualan_barang` (
  `no_jual` varchar(50) NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `qty_penjualan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `id_customer`
--

CREATE TABLE `id_customer` (
  `id_customer` varchar(50) NOT NULL,
  `nama_customer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kode_barang`
--

CREATE TABLE `kode_barang` (
  `kode_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `no_jual` varchar(50) NOT NULL,
  `tanggal_jual` date NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `id_customer` varchar(50) NOT NULL,
  `nama_customer` varchar(50) NOT NULL,
  `qty_penjualan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_barang`
--

CREATE TABLE `penjualan_barang` (
  `no_jual` varchar(50) NOT NULL,
  `tanggal_jual` date NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `id_customer` varchar(50) NOT NULL,
  `qty_penjualan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_brg`
--

CREATE TABLE `penjualan_brg` (
  `no_jual` varchar(50) NOT NULL,
  `tanggal_jual` date NOT NULL,
  `id_customer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `detail_penjualan_barang`
--
ALTER TABLE `detail_penjualan_barang`
  ADD PRIMARY KEY (`no_jual`,`kode_barang`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `id_customer`
--
ALTER TABLE `id_customer`
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `kode_barang`
--
ALTER TABLE `kode_barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `penjualan_barang`
--
ALTER TABLE `penjualan_barang`
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `penjualan_brg`
--
ALTER TABLE `penjualan_brg`
  ADD PRIMARY KEY (`no_jual`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_penjualan_barang`
--
ALTER TABLE `detail_penjualan_barang`
  ADD CONSTRAINT `detail_penjualan_barang_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_penjualan_barang_ibfk_2` FOREIGN KEY (`no_jual`) REFERENCES `penjualan_brg` (`no_jual`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan_barang`
--
ALTER TABLE `penjualan_barang`
  ADD CONSTRAINT `penjualan_barang_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `kode_barang` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_barang_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan_brg`
--
ALTER TABLE `penjualan_brg`
  ADD CONSTRAINT `penjualan_brg_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `id_customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
