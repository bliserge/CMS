-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2022 at 04:31 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs_monitoring`
--

-- --------------------------------------------------------

--
-- Table structure for table `budget`
--

CREATE TABLE `budget` (
  `id` int(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `amount` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `budget`
--

INSERT INTO `budget` (`id`, `name`, `amount`) VALUES
(1, 'sima', 1200000),
(2, 'Ameki Color', 25000),
(3, 'Hummers', 10),
(4, 'Nails', 20000),
(5, 'Wires', 23000),
(6, 'thunder', 3049),
(7, 'snm v', 1000),
(8, 'fasdf', 500),
(9, 'jff', 2333),
(10, 'hio', 1200000),
(11, 'xxx', 10000),
(12, 'vvv', 800),
(13, 'jio', 7000),
(14, 'koi', 999);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `contact_number` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `name`, `age`, `address`, `contact_number`, `position`) VALUES
(1, 'KAMANA Peter', 23, 'Ngoma,Kibungo', '0788345678', 'Umufundi\r\n'),
(2, 'HIMBAZWE Fabrice', 24, 'Kayonza, Rukore', '079654321', 'Technician'),
(3, 'SHEMA Christian', 30, 'Kigali, Nyamirambo', '078934567', 'Carpenter'),
(4, 'CYUSA Amaible', 45, 'Remera, Kigali', '0789645334', 'Umuyede'),
(5, 'MIGISHA Paul', 40, 'MARIBA, Kamembe', '0789345673', 'Painter'),
(6, 'IGABE Paul', 40, 'MARIBA, Kamembe', '0789345673', 'Painter'),
(7, 'IMANIZABAYO Chris', 26, 'KABARE, Ngoma', '0789345673', 'Technician'),
(8, 'UWUMTIMA Beloved', 34, 'kibungo', '078895432', 'Carpenter'),
(9, 'KWIHANGANA William', 45, 'Rusizi', '078832145', 'Painter'),
(10, 'Frederick', 34, 'Kigali, Nyamirambo', '078823456', 'Gardener'),
(11, 'IZABAYO Honorine', 34, 'Kayonza, Nyamirama', '078234567', 'Painter'),
(12, 'HUMURE Christian', 20, 'Kayonza, Muhira', '0788543212', 'Technician'),
(13, 'IGIHOZO Felecite', 13, 'Jigali', '0781325679', 'Technician');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `date_time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`log_id`, `action`, `date_time`) VALUES
(1, 'employee MIGISHA Paul was Added', '2022-09-26'),
(2, 'employee IMANIZABAYO Chris was Added', '2022-09-26'),
(3, 'user MUGISHA Benito  was login', '2022-09-28'),
(4, 'user MUGISHA Benito  was logout', '2022-09-28'),
(5, 'user MUGISHA Benito  was login', '2022-09-28'),
(6, 'user MUGISHA Benito  was logout', '2022-09-28'),
(7, 'user MUGISHA Benito  was login', '2022-09-28'),
(8, 'user  was logout', '2022-09-28'),
(9, 'user MACUMI Vincent was login', '2022-09-28'),
(10, 'user MACUMI Vincent was logout', '2022-09-28'),
(11, 'user MUGISHA Benito  was login', '2022-09-28'),
(12, 'user MUGISHA Benito  was logout', '2022-09-28'),
(13, 'user HIGIRO Prosper was login', '2022-09-28'),
(14, 'user Admin was logout', '2022-09-28'),
(15, 'user MUGISHA Benito  was login', '2022-09-28'),
(16, 'user MUGISHA Benito  was logout', '2022-09-28'),
(17, 'user HIGIRO Prosper was login', '2022-09-28'),
(18, 'user HIGIRO Prosper was logout', '2022-09-28'),
(19, 'user HIGIRO Prosper was login', '2022-09-28'),
(20, 'user HIGIRO Prosper was logout', '2022-09-28'),
(21, 'user MUGISHA Benito  was login', '2022-09-28'),
(22, 'user MUGISHA Benito  was logout', '2022-09-28'),
(23, 'user HIGIRO Prosper was login', '2022-09-28'),
(24, 'user HIGIRO Prosper was logout', '2022-09-28'),
(25, 'user MACUMI Vincent was login', '2022-09-28'),
(26, 'user MACUMI Vincent was login', '2022-09-28'),
(27, 'user MACUMI Vincent was logout', '2022-09-28'),
(28, 'user MUGISHA Benito  was login', '2022-09-28'),
(29, 'user MUGISHA Benito  was logout', '2022-09-28'),
(30, 'user MACUMI Vincent was login', '2022-09-28'),
(31, 'user MACUMI Vincent was logout', '2022-09-28'),
(32, 'user MUGISHA Benito  was login', '2022-09-28'),
(33, 'employee MIGISHA Paul was updated', '2022-09-28'),
(34, 'employee MIGISHA Paul was updated', '2022-09-28'),
(35, 'employee MIGISHA Paul was updated', '2022-09-28'),
(36, 'employee MIGISHA Paul was updated', '2022-09-28'),
(37, 'employee MIGISHA Paul was updated', '2022-09-28'),
(38, 'employee MIGISHA Paul was updated', '2022-09-28'),
(39, 'employee MIGISHA Paul was updated', '2022-09-28'),
(40, 'employee IGABE Paul was updated', '2022-09-28'),
(41, 'employee IGABE Paul was updated', '2022-09-28'),
(42, 'employee IGABE Paul was updated', '2022-09-28'),
(43, 'employee IGABE Paul was updated', '2022-09-28'),
(44, 'employee IGABE Paul was updated', '2022-09-28'),
(45, 'employee IGABE Paul was updated', '2022-09-28'),
(46, 'employee IGABE Paul was updated', '2022-09-28'),
(47, 'employee UWUMTIMA Beloved was Added', '2022-09-28'),
(48, 'employee KWIHANGANA William was Added', '2022-09-28'),
(49, 'employee Frederick was Added', '2022-09-28'),
(50, 'user Admin was logout', '2022-09-28'),
(51, 'user HIGIRO Prosper was login', '2022-09-28'),
(52, 'user HIGIRO Prosper was logout', '2022-09-28'),
(53, 'user HIGIRO Prosper was login', '2022-09-28'),
(54, 'user HIGIRO Prosper was logout', '2022-09-28'),
(55, 'user HIGIRO Prosper was login', '2022-09-28'),
(56, 'user HIGIRO Prosper was logout', '2022-09-28'),
(57, 'user HIGIRO Prosper was login', '2022-09-28'),
(58, 'user MUGISHA Benito  was login', '2022-09-29'),
(59, 'user MUGISHA Benito  was logout', '2022-09-29'),
(60, 'user HIGIRO Prosper was login', '2022-09-29'),
(61, 'user HIGIRO Prosper was logout', '2022-09-29'),
(62, 'user HIGIRO Prosper was login', '2022-09-29'),
(63, 'user HIGIRO Prosper was logout', '2022-09-29'),
(64, 'user HIGIRO Prosper was login', '2022-09-29'),
(65, 'user HIGIRO Prosper was logout', '2022-09-29'),
(66, 'user HIGIRO Prosper was login', '2022-09-29'),
(67, 'user HIGIRO Prosper was logout', '2022-09-29'),
(68, 'user HIGIRO Prosper was login', '2022-09-29'),
(69, 'user HIGIRO Prosper was logout', '2022-09-29'),
(70, 'user HIGIRO Prosper was login', '2022-09-29'),
(71, 'user HIGIRO Prosper was logout', '2022-09-29'),
(72, 'user MACUMI Vincent was login', '2022-09-29'),
(73, 'employee IZABAYO Honorine was Added', '2022-09-29'),
(74, 'employee HUMURE Christian was Added', '2022-09-29'),
(75, 'employee IGIHOZO Felecite was Added', '2022-09-29'),
(76, 'user MUGISHA Benito  was login', '2022-09-30'),
(77, 'user MUGISHA Benito  was logout', '2022-09-30'),
(78, 'user HIGIRO Prosper was login', '2022-09-30'),
(79, 'user HIGIRO Prosper was logout', '2022-09-30'),
(80, 'user MACUMI Vincent was login', '2022-09-30'),
(81, 'user MACUMI Vincent was logout', '2022-09-30'),
(82, 'user MACUMI Vincent was login', '2022-09-30'),
(83, 'user MUGISHA Benito  was login', '2022-10-02'),
(84, 'user MUGISHA Benito  was login', '2022-10-02'),
(85, 'user MUGISHA Benito  was login', '2022-10-03'),
(86, 'user MUGISHA Benito  was logout', '2022-10-03'),
(87, 'user HIGIRO Prosper was logout', '2022-10-03'),
(88, 'user MUGISHA Benito  was logout', '2022-10-03'),
(89, 'user HIGIRO Prosper was logout', '2022-10-03'),
(90, 'user MUGISHA Benito  was logout', '2022-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `username`, `password`, `user_type`) VALUES
(1, 'MUGISHA Benito ', 'benny@gmail.com', 'benny@123', 'customer'),
(2, 'HIGIRO Prosper', 'prosper@gmail.com', 'pro@123', 'engineer'),
(3, 'MACUMI Vincent', 'vince@gmail.com', 'vince@123', 'site manager');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `budget`
--
ALTER TABLE `budget`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `budget`
--
ALTER TABLE `budget`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
