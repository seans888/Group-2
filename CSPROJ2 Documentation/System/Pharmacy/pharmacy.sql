-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2016 at 02:02 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` tinyint(5) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `date`) VALUES
(1, 'admin', 'admin', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE `cashier` (
  `cashier_id` tinyint(5) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `postal_address` varchar(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cashier`
--

INSERT INTO `cashier` (`cashier_id`, `first_name`, `last_name`, `staff_id`, `postal_address`, `phone`, `email`, `username`, `password`, `date`) VALUES
(1, 'Carl Dominique', 'Bueno', '950209', 'Taguig City', '09366993325', 'carl.dominiquebueno@', 'cpbueno', 'cpbueno', '2016-12-10 10:20:43'),
(2, 'Carmelita', 'Buenaflor', '910101', 'Makati City', '09366992140', 'melbuenaflor@gmail.c', 'melbuen', 'melbuen', '2016-12-10 10:21:22'),
(3, 'Cashier', 'CRPS', '20161216', 'Muntinlupa City', '09876543210', 'cashier@gmail.com', 'cashier', 'cashier', '2016-12-10 10:22:29'),
(4, 'Norrie', 'PeÃ±averde', '20161216', 'Taguig City', '09759802514', 'norriepenaverde18@gm', 'nbpenaverde', 'qwerty', '2016-12-12 08:13:26');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(5) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `served_by` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Unpaid',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `customer_name`, `served_by`, `status`, `date`) VALUES
(10, 'Jessa Rose Biag', 'cpbueno', 'Pending', '2016-12-10 05:51:13'),
(11, 'Carl', 'cpbueno', 'Pending', '2016-12-10 05:55:48'),
(12, 'Marvin Dematera', 'cpbueno', 'Pending', '2016-12-10 05:59:57'),
(13, 'Alvin Cruz', 'cpbueno', 'Pending', '2016-12-10 06:10:00'),
(14, 'Cheska', 'cpbueno', 'Pending', '2016-12-12 02:42:33'),
(15, 'Marvin Dematera', 'cpbueno', 'Pending', '2016-12-12 02:46:58'),
(16, 'Daniel Basalio', 'cpbueno', 'Pending', '2016-12-12 12:12:32');

--
-- Triggers `invoice`
--
DELIMITER $$
CREATE TRIGGER `tarehe` AFTER INSERT ON `invoice` FOR EACH ROW BEGIN
     SET @date=NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` tinyint(5) NOT NULL,
  `invoice` int(5) NOT NULL,
  `drug` tinyint(5) NOT NULL,
  `cost` int(5) DEFAULT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `invoice`, `drug`, `cost`, `quantity`) VALUES
(34, 13, 12, 2, 2),
(35, 14, 13, 9, 5),
(36, 16, 11, 4, 5),
(37, 16, 12, 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `manager_id` tinyint(5) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `postal_address` varchar(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`manager_id`, `first_name`, `last_name`, `staff_id`, `postal_address`, `phone`, `email`, `username`, `password`, `date`) VALUES
(1, 'Carl Dominique', 'Bueno', '950209', 'Taguig City', '09366993325', 'carl.dominiquebueno@', 'cpbueno', 'cpbueno', '2016-12-10 10:23:59'),
(2, 'Carmelita', 'Buenaflor', '910101', 'Makati City', '09366992140', 'melbuenaflor@gmail.c', 'melbuen', 'melbuen', '2016-12-10 10:24:34');

-- --------------------------------------------------------

--
-- Table structure for table `paymenttypes`
--

CREATE TABLE `paymenttypes` (
  `id` tinyint(5) NOT NULL,
  `Name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymenttypes`
--

INSERT INTO `paymenttypes` (`id`, `Name`) VALUES
(1, 'Patient'),
(2, 'HMO'),
(3, 'PhilHealth Card'),
(4, 'Cash'),
(5, 'Company');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacist`
--

CREATE TABLE `pharmacist` (
  `pharmacist_id` tinyint(5) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `postal_address` varchar(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacist`
--

INSERT INTO `pharmacist` (`pharmacist_id`, `first_name`, `last_name`, `staff_id`, `postal_address`, `phone`, `email`, `username`, `password`, `date`) VALUES
(1, 'Carl Dominique', 'Bueno', '950209', 'Taguig City', '09366993325', 'carl.dominiquebueno@', 'cpbueno', 'cpbueno', '2016-12-10 10:16:03'),
(3, 'Carmelita', 'Buenaflor', '20161212', 'Taguig City', '09366993325', 'melbuenaflor@gmail.c', 'melbuen', 'qwerty', '2016-12-12 10:33:34');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `id` tinyint(5) NOT NULL,
  `prescription_id` int(5) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(6) NOT NULL,
  `postal_address` varchar(20) NOT NULL,
  `invoice_id` tinyint(5) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`id`, `prescription_id`, `customer_id`, `customer_name`, `age`, `sex`, `postal_address`, `invoice_id`, `phone`, `date`) VALUES
(19, 999, 121216, 'Daniel Basalio', 34, 'Male', 'Pasig City', 16, '0922331232', '2016-12-12 12:12:32');

--
-- Triggers `prescription`
--
DELIMITER $$
CREATE TRIGGER `taree` AFTER INSERT ON `prescription` FOR EACH ROW BEGIN
SET@date=NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `prescription_details`
--

CREATE TABLE `prescription_details` (
  `id` tinyint(5) NOT NULL,
  `pres_id` int(5) NOT NULL,
  `drug_name` tinyint(5) NOT NULL,
  `strength` varchar(15) NOT NULL,
  `dose` varchar(15) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription_details`
--

INSERT INTO `prescription_details` (`id`, `pres_id`, `drug_name`, `strength`, `dose`, `quantity`) VALUES
(34, 1000, 12, '500mg', '2/day', 2),
(35, 1001, 13, '5mg', '2/day', 5),
(36, 999, 11, '500mg', '3x/day', 5),
(37, 999, 12, '5mg', '1/day', 7);

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `reciptNo` int(10) NOT NULL,
  `customer_id` varchar(10) NOT NULL,
  `total` int(10) NOT NULL,
  `payType` varchar(10) NOT NULL,
  `serialno` varchar(10) DEFAULT NULL,
  `served_by` varchar(15) NOT NULL,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receipts`
--

INSERT INTO `receipts` (`reciptNo`, `customer_id`, `total`, `payType`, `serialno`, `served_by`, `date`) VALUES
(0, '', 1500, '', '', 'sam', '0000-00-00 00:00:00'),
(999, '', 1350, '', '', 'sam', '0000-00-00 00:00:00');

--
-- Triggers `receipts`
--
DELIMITER $$
CREATE TRIGGER `siku` AFTER INSERT ON `receipts` FOR EACH ROW BEGIN
     SET @date=NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `stock_id` tinyint(5) NOT NULL,
  `drug_name` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `company` varchar(20) NOT NULL,
  `supplier` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `status` enum('Available','Inavailable') NOT NULL,
  `date_supplied` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_id`, `drug_name`, `category`, `description`, `company`, `supplier`, `quantity`, `cost`, `status`, `date_supplied`) VALUES
(11, 'Maxicap', 'Capsule', 'Multivitamins + Lysine', 'TGP', 'TGP', 100, 4, 'Available', '2016-12-10'),
(12, 'Biogesic', 'Tablet', 'Analgesic 500mg', 'Nelpa', 'Nelpa', 100, 2, 'Available', '2016-12-10'),
(13, 'Extra', 'Tablet', 'Paracetamol', 'Panadol', 'Panadol', 50, 9, 'Available', '2016-12-10'),
(14, 'Multivitamins + Iron', 'Capsule', 'Multivitamins + Iron', 'Scheele', 'Scheele', 200, 5, 'Available', '2016-12-10'),
(15, 'Mefenamic Acid', 'Capsule', 'Analgesic Non-Steroidal', 'PhilRX', 'PhilRX', 300, 6, 'Available', '2016-12-10'),
(16, 'MultiVita', 'Capsule', 'Food Supplement', 'St. Barachiel', 'St. Barachiel', 100, 9, 'Available', '2016-12-10'),
(17, 'Panadol', 'Capsule', 'sample', 'sample', 'sample', 10, 5, 'Available', '2016-12-12');

-- --------------------------------------------------------

--
-- Table structure for table `tempprescri`
--

CREATE TABLE `tempprescri` (
  `id` tinyint(5) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `postal_address` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `drug_name` varchar(30) NOT NULL,
  `strength` varchar(30) NOT NULL,
  `dose` varchar(30) NOT NULL,
  `quantity` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cashier`
--
ALTER TABLE `cashier`
  ADD PRIMARY KEY (`cashier_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stocks` (`drug`),
  ADD KEY `invoices` (`invoice`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`manager_id`);

--
-- Indexes for table `paymenttypes`
--
ALTER TABLE `paymenttypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pharmacist`
--
ALTER TABLE `pharmacist`
  ADD PRIMARY KEY (`pharmacist_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`id`,`prescription_id`);

--
-- Indexes for table `prescription_details`
--
ALTER TABLE `prescription_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dsfd` (`drug_name`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`reciptNo`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `tempprescri`
--
ALTER TABLE `tempprescri`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cashier`
--
ALTER TABLE `cashier`
  MODIFY `cashier_id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `manager_id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `paymenttypes`
--
ALTER TABLE `paymenttypes`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pharmacist`
--
ALTER TABLE `pharmacist`
  MODIFY `pharmacist_id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `prescription_details`
--
ALTER TABLE `prescription_details`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `stock_id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `tempprescri`
--
ALTER TABLE `tempprescri`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD CONSTRAINT `invoices` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stocks` FOREIGN KEY (`drug`) REFERENCES `stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescription_details`
--
ALTER TABLE `prescription_details`
  ADD CONSTRAINT `dsfd` FOREIGN KEY (`drug_name`) REFERENCES `stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
