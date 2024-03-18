-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2024 at 04:36 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbrestaurantpos`
--

-- --------------------------------------------------------

--
-- Table structure for table `foodcart`
--

CREATE TABLE `foodcart` (
  `id` int(11) NOT NULL,
  `foodcode` varchar(255) NOT NULL,
  `foodname` varchar(255) NOT NULL,
  `foodprice` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `pay_amount` int(11) DEFAULT NULL,
  `change_amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `pay_amount`, `change_amount`) VALUES
(1, 300, 28),
(2, 500, 160),
(3, 200, 50),
(4, 200, 50);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `foodcode` varchar(255) NOT NULL,
  `foodname` varchar(255) NOT NULL,
  `foodprice` varchar(255) NOT NULL,
  `foodimage` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `foodcode`, `foodname`, `foodprice`, `foodimage`) VALUES
(1, '20001', 'Burger', '122', 'burger.png'),
(2, '20003', 'Pizza', '150', 'pizza.png'),
(3, '20002', 'Donut', '190', 'donut.jpg'),
(4, '20004', 'Fried Chicken', '230', 'friedchicken.png'),
(5, '20005', 'Fries', '190', 'fries.png');

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `id` int(11) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `foodcode` varchar(255) DEFAULT NULL,
  `foodname` varchar(255) DEFAULT NULL,
  `foodprice` int(11) DEFAULT NULL,
  `date_buy` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`id`, `payment_id`, `foodcode`, `foodname`, `foodprice`, `date_buy`) VALUES
(19, 1, '20001', 'Burger', 122, '2024-03-18'),
(20, 1, '20003', 'Pizza', 150, '2024-03-18'),
(23, 2, '20002', 'Donut', 190, '2024-03-18'),
(25, 2, '20003', 'Pizza', 150, '2024-03-18'),
(31, 3, '20003', 'Pizza', 150, '2024-03-18'),
(35, 4, '20003', 'Pizza', 150, '2024-03-18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `foodcart`
--
ALTER TABLE `foodcart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foodcart`
--
ALTER TABLE `foodcart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `records`
--
ALTER TABLE `records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `records`
--
ALTER TABLE `records`
  ADD CONSTRAINT `records_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
