-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2022 at 11:36 AM
-- Server version: 10.7.3-MariaDB
-- PHP Version: 7.4.27

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
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `title`, `price`) VALUES
(1, 'umuyede', 2500),
(2, 'umufundi', 5500);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `att_id` int(5) NOT NULL,
  `logdate` date NOT NULL,
  `emp_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `Timein` varchar(100) NOT NULL,
  `Timeout` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0: without timeOut\r\n1: with timeOut\r\n2: payroll completed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`att_id`, `logdate`, `emp_id`, `name`, `Timein`, `Timeout`, `status`) VALUES
(36, '2022-11-08', 16, 'benito MUGISHA', '12:27:56', '20:25:39', 1),
(37, '2022-11-08', 17, 'benito MUGISHA', '14:44:10', '20:25:39', 1),
(38, '2022-11-08', 18, 'benito MUGISHA', '14:44:41', '20:25:39', 1),
(39, '2022-10-30', 19, 'benito MUGISHA', '15:23:48', '20:25:39', 1),
(40, '2022-10-30', 24, 'benito MUGISHA', '20:25:15', '20:25:39', 1);

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
(25, 'ciments', 200000),
(26, 'hummer', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(5) NOT NULL,
  `empl_ref` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `contact_number` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `empl_ref`, `name`, `age`, `address`, `contact_number`, `position`) VALUES
(16, 2022, 'UMUHIRE KInon', 12, 'kigali', '0788234567', '1'),
(17, 2023, 'KANAMA Burton', 34, 'Kigeme', '0788943423', '2'),
(18, 2024, 'MUTAVUNIKA Albert', 12, 'kinamba', '0788934567', '1'),
(19, 2025, 'KIGABO Emmanuel', 23, 'kigali', '0789543426', '2'),
(24, 2799, 'KUBWIMANA Hior', 12, 'kamembe', '777', '1'),
(25, 2034, 'HIHIRO Amma', 98, 'rusizi', '12', '2');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `uploaded_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(10) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `measure_id` int(11) NOT NULL,
  `quantity` int(20) NOT NULL,
  `cost` int(20) NOT NULL,
  `total` int(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(10) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `item_name`, `measure_id`, `quantity`, `cost`, `total`, `date`, `status`) VALUES
(4, 'Tube', 1, 1015, 4500, 4567500, '2022-10-28 18:10:36', 1),
(7, 'Window', 7, 1000, 30000, 30000000, '2022-10-31 08:51:44', 1),
(8, 'Sima', 6, 0, 2000, 0, '2022-11-03 19:29:48', 1);

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
(90, 'user MUGISHA Benito  was logout', '2022-10-05'),
(91, 'user MACUMI Vincent was logout', '2022-10-06'),
(92, 'user MACUMI Vincent was logout', '2022-10-15'),
(93, 'user MACUMI Vincent was logout', '2022-10-15'),
(94, 'user MACUMI Vincent was logout', '2022-10-15'),
(95, 'user MUGISHA Benito  was logout', '2022-10-17'),
(96, 'employee UWUMTIMA Beloved Heuresse was updated', '2022-10-20'),
(97, 'employee UWUMTIMA Beloved Heuresse was updated', '2022-10-20'),
(98, 'employee UWUMTIMA Beloved Heuresse was updated', '2022-10-20'),
(99, 'employee UWUMTIMA Beloved Heuresse was updated', '2022-10-20'),
(100, 'employee UWUMTIMA Beloved Heuresse was updated', '2022-10-20'),
(101, 'employee UWUMTIMA Beloved Heuresse was updated', '2022-10-20'),
(102, 'employee UWUMTIMA Beloved Heuresse was updated', '2022-10-20'),
(103, 'employee UWUMTIMA Beloved Heuresse was updated', '2022-10-20'),
(104, 'employee UWUMTIMA Beloved Heuresse was updated', '2022-10-20'),
(105, 'employee UWUMTIMA Beloved Heuresse was updated', '2022-10-20'),
(106, 'employee UWUMTIMA Beloved Heuresse was updated', '2022-10-20'),
(107, 'employee UWUMTIMA Beloved Heuresse was updated', '2022-10-20'),
(108, 'employee UWUMTIMA Beloved Heuresse was updated', '2022-10-20'),
(109, 'user MUGISHA Benito  was logout', '2022-10-20'),
(110, 'user MACUMI Vincent was logout', '2022-10-20'),
(111, 'user HIGIRO Prosper was logout', '2022-10-20'),
(112, 'user HIGIRO Prosper was logout', '2022-10-21'),
(113, 'user HIGIRO Prosper was logout', '2022-10-21'),
(114, 'user MUGISHA Benito  was logout', '2022-10-21'),
(115, 'user MACUMI Vincent was logout', '2022-10-21'),
(116, 'user MUGISHA Benito  was logout', '2022-10-21'),
(117, 'employee mugisha benito was Added', '2022-10-21'),
(118, 'user MACUMI Vincent was logout', '2022-10-21'),
(119, 'user HIGIRO Prosper was logout', '2022-10-21'),
(120, 'user MUGISHA Benito  was logout', '2022-10-21'),
(121, 'user Admin was logout', '2022-10-21'),
(122, 'employee sima was updated', '2022-10-21'),
(123, 'employee sima was updated', '2022-10-21'),
(124, 'employee  was updated', '2022-10-21'),
(125, 'employee  was updated', '2022-10-21'),
(126, 'employee Sima was updated', '2022-10-21'),
(127, 'employee Sima was updated', '2022-10-21'),
(128, 'user MACUMI Vincent was logout', '2022-10-21'),
(129, 'Item Ameki color was Added', '2022-10-21'),
(130, 'user benito was logout', '2022-10-21'),
(131, 'Item Sima withdrown from stock', '2022-10-21'),
(132, 'Item imisumari withdrown from stock', '2022-10-21'),
(133, 'Item imisumari withdrown from stock', '2022-10-21'),
(134, 'employee UWIHIRWE Giselle was updated', '2022-10-25'),
(135, 'employee UWIHIRWE Giselle was updated', '2022-10-25'),
(136, 'employee UWIHIRWE Giselle was updated', '2022-10-25'),
(137, 'employee UWIHIRWE Giselle was updated', '2022-10-25'),
(138, 'employee UWIHIRWE Giselle was updated', '2022-10-25'),
(139, 'employee UWIHIRWE Giselle was updated', '2022-10-25'),
(140, 'employee UWIHIRWE Giselle was updated', '2022-10-25'),
(141, 'employee UWIHIRWE Giselle was updated', '2022-10-25'),
(142, 'employee UWIHIRWE Giselle was updated', '2022-10-25'),
(143, 'employee UWIHIRWE Giselle was updated', '2022-10-25'),
(144, 'employee UWIHIRWE Giselle was updated', '2022-10-25'),
(145, 'employee UWIHIRWE Giselle was updated', '2022-10-25'),
(146, 'employee UWIHIRWE Giselle was updated', '2022-10-25'),
(147, 'employee UWIHIRWE Giselle was updated', '2022-10-25'),
(148, 'employee UMUMARARUNGU Diane was Added', '2022-10-25'),
(149, 'user MACUMI Vincent was logout', '2022-10-25'),
(150, 'user MACUMI Vincent was logout', '2022-10-26'),
(151, 'user MUGISHA Benito  was logout', '2022-10-26'),
(152, 'user MACUMI Vincent was logout', '2022-10-26'),
(153, 'user MACUMI Vincent was logout', '2022-10-26'),
(154, 'user MACUMI Vincent was logout', '2022-10-26'),
(155, 'user HIGIRO Prosper was logout', '2022-10-27'),
(156, 'Item Sima was updated', '2022-10-28'),
(157, 'Item Sima was updated', '2022-10-28'),
(158, 'Item Sima was updated', '2022-10-28'),
(159, 'user MACUMI Vincent was logout', '2022-10-28'),
(160, 'user  was logout', '2022-10-28'),
(161, 'user MACUMI Vincent was logout', '2022-10-28'),
(162, 'employee KInon was Added', '2022-10-28'),
(163, 'employee kana was Added', '2022-10-28'),
(164, 'employee hio was Added', '2022-10-28'),
(165, 'employee ki was Added', '2022-10-28'),
(166, 'employee ben was Added', '2022-10-28'),
(167, 'employee b was Added', '2022-10-28'),
(168, 'employee hh was Added', '2022-10-28'),
(169, 'employee b was Added', '2022-10-28'),
(170, 'employee Hior was Added', '2022-10-28'),
(171, 'employee h was Added', '2022-10-28'),
(172, 'employee mugisha benito was updated', '2022-10-28'),
(173, 'employee mugisha benito was updated', '2022-10-28'),
(174, 'employee mugisha benito was updated', '2022-10-28'),
(175, 'employee mugisha benito was updated', '2022-10-28'),
(176, 'employee mugisha benito was updated', '2022-10-28'),
(177, 'employee mugisha benito was updated', '2022-10-28'),
(178, 'employee mugisha benito was updated', '2022-10-28'),
(179, 'employee mugisha benito was updated', '2022-10-28'),
(180, 'employee mugisha benito was updated', '2022-10-28'),
(181, 'employee mugisha benito was updated', '2022-10-28'),
(182, 'employee mugisha benito was updated', '2022-10-28'),
(183, 'employee mugisha benito was updated', '2022-10-28'),
(184, 'employee mugisha benito was updated', '2022-10-28'),
(185, 'employee mugisha benito was updated', '2022-10-28'),
(186, 'employee mugisha benito was updated', '2022-10-28'),
(187, 'employee mugisha benito was updated', '2022-10-28'),
(188, 'employee mugisha benito was updated', '2022-10-28'),
(189, 'employee mugisha benito was updated', '2022-10-28'),
(190, 'employee mugisha benito was updated', '2022-10-28'),
(191, 'employee mugisha benito was updated', '2022-10-28'),
(192, 'employee mugisha benito was updated', '2022-10-28'),
(193, 'employee mugisha benito was updated', '2022-10-28'),
(194, 'employee mugisha benito was updated', '2022-10-28'),
(195, 'employee mugisha benito was updated', '2022-10-28'),
(196, 'employee mugisha benito was updated', '2022-10-28'),
(197, 'user MUGISHA Benito  was logout', '2022-10-28'),
(198, 'employee HIMBAZWE Fabrice was updated', '2022-10-28'),
(199, 'employee HIMBAZWE Fabrice was updated', '2022-10-28'),
(200, 'employee HIMBAZWE Fabrice was updated', '2022-10-28'),
(201, 'employee HIMBAZWE Fabrice was updated', '2022-10-28'),
(202, 'employee HIMBAZWE Fabrice was updated', '2022-10-28'),
(203, 'employee HIMBAZWE Fabrice was updated', '2022-10-28'),
(204, 'employee HIMBAZWE Fabrice was updated', '2022-10-28'),
(205, 'employee HIMBAZWE Fabrice was updated', '2022-10-28'),
(206, 'employee HIMBAZWE Fabrice was updated', '2022-10-28'),
(207, 'employee HIMBAZWE Fabrice was updated', '2022-10-28'),
(208, 'Item kana withdrown from stock', '2022-10-28'),
(209, 'Attendence HIMBAZWE Fabrice was updated', '2022-10-28'),
(210, 'Attendence HIMBAZWE Fabrice was updated', '2022-10-28'),
(211, 'Attendence HIMBAZWE Fabrice was updated', '2022-10-28'),
(212, 'Attendence HIMBAZWE Fabrice was updated', '2022-10-28'),
(213, 'Attendence ben was updated', '2022-10-28'),
(214, 'Attendence ben was updated', '2022-10-28'),
(215, 'Attendence HIMBAZWE Fabrice was updated', '2022-10-28'),
(216, 'Attendence HIMBAZWE Fabrice was updated', '2022-10-28'),
(217, 'Attendence HIMBAZWE Fabrice was updated', '2022-10-28'),
(218, 'Attendence HIMBAZWE Fabrice was updated', '2022-10-28'),
(219, 'Attendence ben was updated', '2022-10-28'),
(220, 'Item ki withdrown from stock', '2022-10-28'),
(221, 'Attendence ben was updated', '2022-10-28'),
(222, 'user MACUMI Vincent was logout', '2022-10-28'),
(223, 'Item Sima withdrown from stock', '2022-10-29'),
(224, 'Item Tube was Added', '2022-10-29'),
(225, 'Item Tube withdrown from stock', '2022-10-29'),
(226, 'Item item withdrown from stock', '2022-10-29'),
(227, 'Item imisumari withdrown from stock', '2022-10-29'),
(228, 'user MACUMI Vincent was logout', '2022-10-29'),
(229, 'user MACUMI Vincent was logout', '2022-10-29'),
(230, 'user MACUMI Vincent was logout', '2022-10-29'),
(231, 'user MACUMI Vincent was logout', '2022-10-29'),
(232, 'user MACUMI Vincent was logout', '2022-10-29'),
(233, 'user MACUMI Vincent was logout', '2022-10-29'),
(234, 'user MACUMI Vincent was logout', '2022-10-30'),
(235, 'user MACUMI Vincent was logout', '2022-10-30'),
(236, 'user MACUMI Vincent was logout', '2022-10-30'),
(237, 'employee KANAMA Burton was updated', '2022-10-30'),
(238, 'employee KANAMA Burton was updated', '2022-10-30'),
(239, 'employee KANAMA Burton was updated', '2022-10-30'),
(240, 'employee KANAMA Burton was updated', '2022-10-30'),
(241, 'employee KANAMA Burton was updated', '2022-10-30'),
(242, 'employee KANAMA Burton was updated', '2022-10-30'),
(243, 'employee KANAMA Burton was updated', '2022-10-30'),
(244, 'employee KANAMA Burton was updated', '2022-10-30'),
(245, 'employee KANAMA Burton was updated', '2022-10-30'),
(246, 'employee KANAMA Burton was updated', '2022-10-30'),
(247, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(248, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(249, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(250, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(251, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(252, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(253, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(254, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(255, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(256, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(257, 'employee h was updated', '2022-10-30'),
(258, 'employee h was updated', '2022-10-30'),
(259, 'employee h was updated', '2022-10-30'),
(260, 'employee h was updated', '2022-10-30'),
(261, 'employee h was updated', '2022-10-30'),
(262, 'employee h was updated', '2022-10-30'),
(263, 'employee h was updated', '2022-10-30'),
(264, 'employee h was updated', '2022-10-30'),
(265, 'employee h was updated', '2022-10-30'),
(266, 'employee h was updated', '2022-10-30'),
(267, 'employee CYIZA Peter was updated', '2022-10-30'),
(268, 'employee CYIZA Peter was updated', '2022-10-30'),
(269, 'employee CYIZA Peter was updated', '2022-10-30'),
(270, 'employee CYIZA Peter was updated', '2022-10-30'),
(271, 'employee CYIZA Peter was updated', '2022-10-30'),
(272, 'employee CYIZA Peter was updated', '2022-10-30'),
(273, 'employee CYIZA Peter was updated', '2022-10-30'),
(274, 'employee CYIZA Peter was updated', '2022-10-30'),
(275, 'employee CYIZA Peter was updated', '2022-10-30'),
(276, 'employee CYIZA Peter was updated', '2022-10-30'),
(277, 'employee KIGABO Emmanuel was updated', '2022-10-30'),
(278, 'employee KIGABO Emmanuel was updated', '2022-10-30'),
(279, 'employee KIGABO Emmanuel was updated', '2022-10-30'),
(280, 'employee KIGABO Emmanuel was updated', '2022-10-30'),
(281, 'employee KIGABO Emmanuel was updated', '2022-10-30'),
(282, 'employee KIGABO Emmanuel was updated', '2022-10-30'),
(283, 'employee KIGABO Emmanuel was updated', '2022-10-30'),
(284, 'employee KIGABO Emmanuel was updated', '2022-10-30'),
(285, 'employee KIGABO Emmanuel was updated', '2022-10-30'),
(286, 'employee KIGABO Emmanuel was updated', '2022-10-30'),
(287, 'employee MUTAVUNIKA Albert was updated', '2022-10-30'),
(288, 'employee MUTAVUNIKA Albert was updated', '2022-10-30'),
(289, 'employee MUTAVUNIKA Albert was updated', '2022-10-30'),
(290, 'employee MUTAVUNIKA Albert was updated', '2022-10-30'),
(291, 'employee MUTAVUNIKA Albert was updated', '2022-10-30'),
(292, 'employee MUTAVUNIKA Albert was updated', '2022-10-30'),
(293, 'employee MUTAVUNIKA Albert was updated', '2022-10-30'),
(294, 'employee MUTAVUNIKA Albert was updated', '2022-10-30'),
(295, 'employee MUTAVUNIKA Albert was updated', '2022-10-30'),
(296, 'employee MUTAVUNIKA Albert was updated', '2022-10-30'),
(297, 'employee Benito MUGISHA was updated', '2022-10-30'),
(298, 'employee Benito MUGISHA was updated', '2022-10-30'),
(299, 'employee Benito MUGISHA was updated', '2022-10-30'),
(300, 'employee Benito MUGISHA was updated', '2022-10-30'),
(301, 'employee Benito MUGISHA was updated', '2022-10-30'),
(302, 'employee Benito MUGISHA was updated', '2022-10-30'),
(303, 'employee Benito MUGISHA was updated', '2022-10-30'),
(304, 'employee Benito MUGISHA was updated', '2022-10-30'),
(305, 'employee Benito MUGISHA was updated', '2022-10-30'),
(306, 'employee Benito MUGISHA was updated', '2022-10-30'),
(307, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(308, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(309, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(310, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(311, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(312, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(313, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(314, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(315, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(316, 'employee UMUHIRE KInon was updated', '2022-10-30'),
(317, 'employee HIHIRO Amma was updated', '2022-10-30'),
(318, 'employee HIHIRO Amma was updated', '2022-10-30'),
(319, 'employee HIHIRO Amma was updated', '2022-10-30'),
(320, 'employee HIHIRO Amma was updated', '2022-10-30'),
(321, 'employee HIHIRO Amma was updated', '2022-10-30'),
(322, 'employee HIHIRO Amma was updated', '2022-10-30'),
(323, 'employee HIHIRO Amma was updated', '2022-10-30'),
(324, 'employee HIHIRO Amma was updated', '2022-10-30'),
(325, 'employee HIHIRO Amma was updated', '2022-10-30'),
(326, 'employee HIHIRO Amma was updated', '2022-10-30'),
(327, 'employee CYEREKEZO Paul was updated', '2022-10-30'),
(328, 'employee CYEREKEZO Paul was updated', '2022-10-30'),
(329, 'employee CYEREKEZO Paul was updated', '2022-10-30'),
(330, 'employee CYEREKEZO Paul was updated', '2022-10-30'),
(331, 'employee CYEREKEZO Paul was updated', '2022-10-30'),
(332, 'employee CYEREKEZO Paul was updated', '2022-10-30'),
(333, 'employee CYEREKEZO Paul was updated', '2022-10-30'),
(334, 'employee CYEREKEZO Paul was updated', '2022-10-30'),
(335, 'employee CYEREKEZO Paul was updated', '2022-10-30'),
(336, 'employee CYEREKEZO Paul was updated', '2022-10-30'),
(337, 'employee KUBWIMANA Hior was updated', '2022-10-30'),
(338, 'employee KUBWIMANA Hior was updated', '2022-10-30'),
(339, 'employee KUBWIMANA Hior was updated', '2022-10-30'),
(340, 'employee KUBWIMANA Hior was updated', '2022-10-30'),
(341, 'employee KUBWIMANA Hior was updated', '2022-10-30'),
(342, 'employee KUBWIMANA Hior was updated', '2022-10-30'),
(343, 'employee KUBWIMANA Hior was updated', '2022-10-30'),
(344, 'employee KUBWIMANA Hior was updated', '2022-10-30'),
(345, 'employee KUBWIMANA Hior was updated', '2022-10-30'),
(346, 'employee KUBWIMANA Hior was updated', '2022-10-30'),
(347, 'user MACUMI Vincent was logout', '2022-10-30'),
(348, 'user MUGISHA Benito  was logout', '2022-10-30'),
(349, 'user MACUMI Vincent was logout', '2022-10-30'),
(350, 'user MACUMI Vincent was logout', '2022-10-30'),
(351, 'Item Ameki color withdrown from stock', '2022-10-30'),
(352, 'Item Ameki color was Added', '2022-10-31'),
(353, 'Item Ameki color was updated', '2022-10-31'),
(354, 'Item Ameki color was updated', '2022-10-31'),
(355, 'Item Ameki color was updated', '2022-10-31'),
(356, 'Item Ameki color was updated', '2022-10-31'),
(357, 'Item Ameki color was updated', '2022-10-31'),
(358, 'Item Ameki color was updated', '2022-10-31'),
(359, 'Item cable Alpha was updated', '2022-10-31'),
(360, 'Item cable Alpha was updated', '2022-10-31'),
(361, 'Item cable Alpha was updated', '2022-10-31'),
(362, 'Item Ameki color was updated', '2022-10-31'),
(363, 'Item Ameki color was updated', '2022-10-31'),
(364, 'Item Ameki color was updated', '2022-10-31'),
(365, 'Item Ameki color was updated', '2022-10-31'),
(366, 'Item Ameki color was updated', '2022-10-31'),
(367, 'Item Ameki color was updated', '2022-10-31'),
(368, 'Item Ameki color was updated', '2022-10-31'),
(369, 'Item Ameki color was updated', '2022-10-31'),
(370, 'Item Ameki color was updated', '2022-10-31'),
(371, 'user MACUMI Vincent was logout', '2022-10-31'),
(372, 'Item Door was Added', '2022-10-31'),
(373, 'Item Window was Added', '2022-10-31'),
(374, 'Item 4 added in stock_movement', '2022-11-03'),
(375, 'user MACUMI Vincent was logout', '2022-11-03'),
(376, 'user MUGISHA Benito  was logout', '2022-11-03'),
(377, 'user HIGIRO Prosper was logout', '2022-11-03'),
(378, 'Item 4 added in stock_movement', '2022-11-03'),
(379, 'Item 7 added in stock_movement', '2022-11-03'),
(380, 'Item 4 added in stock_movement', '2022-11-03'),
(381, 'Item 7 added in stock_movement', '2022-11-03'),
(382, 'Item 7 added in stock_movement', '2022-11-03'),
(383, 'Item Window withdrown from stock_movement', '2022-11-03'),
(384, 'Item Sima was Added', '2022-11-04'),
(385, 'Item Tube added in stock_movement', '2022-11-04'),
(386, 'Item Window was updated', '2022-11-04'),
(387, 'Item Window was updated', '2022-11-04'),
(388, 'Item Window was updated', '2022-11-04');

-- --------------------------------------------------------

--
-- Table structure for table `measure`
--

CREATE TABLE `measure` (
  `m_id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `measure`
--

INSERT INTO `measure` (`m_id`, `name`) VALUES
(1, 'kg'),
(2, 'littles'),
(3, 'm'),
(4, 'cm'),
(5, 'g'),
(6, 'sack'),
(7, 'item');

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `id` int(11) NOT NULL,
  `ref_no` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`id`, `ref_no`, `date`, `amount`, `type`, `status`, `date_created`) VALUES
(1, NULL, NULL, 2500, NULL, 0, '2022-11-08 09:00:35'),
(2, NULL, NULL, 10500, NULL, 0, '2022-11-08 09:24:37');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_item`
--

CREATE TABLE `payroll_item` (
  `id` int(11) NOT NULL,
  `payroll_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `att_id` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0: unPaid\r\n1: paid',
  `Date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payroll_item`
--

INSERT INTO `payroll_item` (`id`, `payroll_id`, `emp_id`, `att_id`, `salary`, `status`, `Date_created`) VALUES
(1, 1, 16, 36, 2500, 0, '2022-11-08 07:00:35'),
(2, 2, 16, 36, 2500, 1, '2022-11-08 07:24:37'),
(3, 2, 18, 38, 2500, 0, '2022-11-08 07:24:37'),
(4, 2, 17, 37, 5500, 1, '2022-11-08 07:24:37');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `pos_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `req_id` int(11) NOT NULL,
  `request_name` varchar(20) NOT NULL,
  `item_id` int(11) NOT NULL,
  `stc_id` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stock_movement`
--

CREATE TABLE `stock_movement` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(10) NOT NULL,
  `action` varchar(50) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `oparetor` int(11) NOT NULL DEFAULT 3,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_movement`
--

INSERT INTO `stock_movement` (`id`, `item_id`, `quantity`, `action`, `employee_id`, `oparetor`, `created_at`) VALUES
(7, 1, 12, 'in', 3, 3, '2022-10-21 16:04:50'),
(10, 1, 50, 'out', 3, 3, '2022-10-28 18:05:29'),
(13, 2, 3, 'out', 3, 3, '2022-10-28 18:19:26'),
(15, 4, 12, 'in', 3, 3, '2022-11-02 22:49:35'),
(16, 7, 1, 'in', NULL, 3, '2022-11-02 22:58:58'),
(17, 4, 2, 'in', NULL, 3, '2022-11-02 23:00:40'),
(18, 7, 2, 'in', NULL, 3, '2022-11-02 23:02:37'),
(19, 7, 2, 'in', NULL, 3, '2022-11-02 23:03:07'),
(20, 7, 17, 'out', 17, 3, '2022-11-02 23:21:38'),
(21, 4, 1, 'in', NULL, 3, '2022-11-03 19:32:44');

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
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`att_id`);

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
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `measure`
--
ALTER TABLE `measure`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_item`
--
ALTER TABLE `payroll_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`req_id`),
  ADD KEY `itekey` (`item_id`),
  ADD KEY `stckey` (`stc_id`);

--
-- Indexes for table `stock_movement`
--
ALTER TABLE `stock_movement`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `att_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `budget`
--
ALTER TABLE `budget`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=389;

--
-- AUTO_INCREMENT for table `measure`
--
ALTER TABLE `measure`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payroll_item`
--
ALTER TABLE `payroll_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `pos_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `req_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_movement`
--
ALTER TABLE `stock_movement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `itekey` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `stckey` FOREIGN KEY (`stc_id`) REFERENCES `stock_movement` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
