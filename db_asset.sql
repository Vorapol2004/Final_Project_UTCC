-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2025 at 05:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_asset`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `borrow_date` date NOT NULL,
  `reference_doc` varchar(255) DEFAULT NULL,
  `borrow_status_id` int(11) NOT NULL,
  `approver_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`id`, `employee_id`, `borrow_date`, `reference_doc`, `borrow_status_id`, `approver_name`) VALUES
(48, 64, '2024-01-01', NULL, 1, 'พี่เหน่ง'),
(49, 65, '2025-01-01', NULL, 1, 'พี่เหน่ง'),
(50, 66, '2024-01-01', NULL, 1, 'พี่เหน่ง'),
(51, 67, '2024-01-01', NULL, 1, 'พี่เหน่ง'),
(52, 68, '2024-01-01', NULL, 1, 'พี่เหน่ง'),
(53, 70, '2024-01-01', NULL, 1, 'พี่เหน่ง');

-- --------------------------------------------------------

--
-- Table structure for table `borrow_equipment`
--

CREATE TABLE `borrow_equipment` (
  `id` int(11) NOT NULL,
  `return_date` date DEFAULT NULL,
  `equipment_id` int(11) NOT NULL,
  `borrow_id` int(11) NOT NULL,
  `due_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrow_equipment`
--

INSERT INTO `borrow_equipment` (`id`, `return_date`, `equipment_id`, `borrow_id`, `due_date`) VALUES
(69, NULL, 78, 48, '2024-05-30'),
(70, NULL, 85, 49, '2025-03-18'),
(71, NULL, 86, 49, '2025-03-18'),
(72, NULL, 87, 49, '2025-03-18'),
(73, NULL, 217, 50, '2030-01-01'),
(74, NULL, 218, 51, '2030-01-01'),
(75, NULL, 219, 52, '2030-01-01'),
(76, NULL, 231, 53, '2030-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `borrow_status`
--

CREATE TABLE `borrow_status` (
  `id` int(11) NOT NULL,
  `borrow_status_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrow_status`
--

INSERT INTO `borrow_status` (`id`, `borrow_status_name`) VALUES
(1, 'ยืม'),
(2, 'คืน'),
(3, 'การส่งคืนบางส่วน'),
(4, 'เกินกำหนด');

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `id` int(11) NOT NULL,
  `building_name` varchar(50) NOT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`id`, `building_name`, `department_id`) VALUES
(1, '1', 1),
(2, '3', 1),
(3, '5', 1),
(4, '7', 1),
(5, '8', 1),
(6, '9', 1),
(7, '10', 1),
(8, '14', 45),
(9, '15', 1),
(10, '16', 1),
(11, '17', 58),
(12, '19', 1),
(13, '20', 1),
(14, '21', 26),
(15, '22', 9),
(16, '23', 9),
(17, '24', 1),
(18, '24', 10),
(19, '24', 6),
(20, '10', 43);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `department_name`) VALUES
(1, 'HarBour space'),
(2, 'International School of Management'),
(3, 'คณะมนุษยศาสตร์'),
(4, 'คณะนิเทศศาสตร์'),
(5, 'คณะเศรษฐศาสตร์'),
(6, 'คณะวิทยาศาสตร์และเทคโนโลยี'),
(7, 'สำนักบริการคอมพิวเตอร์'),
(8, 'คณะบัญชี'),
(9, 'คณะการท่องเที่ยวและอุตสาหกรรมบริการ'),
(10, 'สำนักอำนวยการ'),
(11, 'กองวิชาการ'),
(12, 'สำนักยุทธศาสตร์และ Data Analytic'),
(13, 'ศูนย์บริการวิชาการ'),
(14, 'คณะบริหารธุรกิจ'),
(15, 'กองอาคารและสิ่งแวดล้อม'),
(16, 'คณะนิติศาสตร์'),
(17, 'สำนักทะเบียนและประมวลผล'),
(18, 'ฝ่ายเทคโนโลยีสารสนเทศ'),
(19, 'คณะศิลปะและการออกแบบดิจิทัล'),
(20, 'สำนักหอสมุดกลาง'),
(21, 'คณะวิศวกรรมศาสตร์'),
(22, 'สำนักงานตรวจสอบภายใน'),
(23, 'กองประชาสัมพันธ์'),
(24, 'สำนักนวัตกรรมการศึกษา'),
(25, 'กองนิติการ'),
(26, 'สถาบันยุทธศาสตร์การค้า'),
(27, 'คณะวิทยพัฒน์'),
(28, 'สถาบันวิทยาการเศรษฐกิจหมุนเวียน'),
(29, 'กองการตลาด'),
(30, 'สำนักสวัสดิการนักศึกษา'),
(31, 'สำนักพัฒนานักศึกษา'),
(32, 'วิทยาลัยการศึกษาต่อเนื่อง'),
(33, 'กองบัญชีและงบประมาณ'),
(34, 'วิทยาลัยผู้ประกอบการ'),
(35, 'บัณฑิตวิทยาลัย'),
(36, 'ศูนย์พยากรณ์เศรษฐกิจและธุรกิจ'),
(37, 'กองวิเทศสัมพันธ์'),
(38, 'กองส่งเสริมการรับนักศึกษา'),
(39, 'วิทยาลัยนานาชาติไทย-จีนเพื่อการจัดการ'),
(40, 'ฝ่ายยุทธศาสตร์และกิจการพิเศษ'),
(41, 'ศูนย์เอสเอ็มอี'),
(42, 'คณะการศึกษาปฐมวัย'),
(43, 'สำนักบริหารทรัพยากรมนุษย์'),
(44, 'ฝ่ายบริหาร'),
(45, 'สถาบันวิจัยเพื่อการประเมินและออกแบบนโยบาย'),
(46, 'กองส่งเสริมศิลปวัฒนธรรมไทย'),
(47, 'ฝ่ายวิจัยและบริการธุรกิจ'),
(48, 'กองพัสดุและจัดการทรัพย์สิน'),
(49, 'กองการเงิน'),
(50, 'โรงเรียนสาธิตปฐมวัยมหาวิทยาลัยหอการค้าไทย'),
(51, 'ที่ปรีกษาอธิการบดี ด้านวิเทศสัมพันธ์'),
(52, 'คณะพยาบาลศาสตร์'),
(53, 'กองแนะแนวและศิษย์เก่าสัมพันธ์'),
(54, 'ศูนย์ศึกษาการพัฒนาขีดความสามารถเพื่อความยั่งยืน'),
(55, 'สำนักวิชาการ'),
(56, 'ศูนย์การพัฒนาขีดความสามารถเพื่อความ'),
(57, 'คณะดิจิทัลอาร์ตและดีไซน์'),
(58, 'ฝ่ายสื่อสารองค์กร'),
(59, 'สถาบันยุทธศาตร์การค้า');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `room_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `first_name`, `email`, `description`, `role_id`, `department_id`, `last_name`, `phone`, `room_id`) VALUES
(64, 'อรวรรณ', 'orawan_wan@utcc.ac.th', NULL, 1, 10, '-', '-', 281),
(65, 'สิริธร', 'sirithorn_jal@utcc.ac.th', NULL, 2, 6, '-', '-', 282),
(66, 'กีรติญา', 'keeratiya_tai@utcc.ac.th', NULL, 1, 10, '-', '-', 283),
(67, 'สุวรรณี', 'suwannee_jir@utcc.ac.th', NULL, 1, 10, '-', '-', 281),
(68, 'จตุพร', 'jatuporn_boo@utcc.ac.th', NULL, 1, 10, '-', '-', 281),
(69, 'เบญญา', 'benyatip_sri@utcc.ac.th', NULL, 2, 43, '-', '-', 284),
(70, 'ภาวิณี', 'pawinee_sil@utcc.ac.th', NULL, 1, 43, '-', '-', 284);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `equipment_name` varchar(100) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `equipment_status_id` int(11) NOT NULL,
  `equipment_type_id` int(11) DEFAULT NULL,
  `lot_id` int(11) NOT NULL,
  `license_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id`, `equipment_name`, `brand`, `model`, `serial_number`, `equipment_status_id`, `equipment_type_id`, `lot_id`, `license_key`) VALUES
(78, 'Desktop', 'HP', '400 G2', 'SGH553PQDR', 2, 2, 16, NULL),
(79, 'Desktop', 'HP', '400 G2', 'SGH553PQH2', 1, 2, 16, NULL),
(80, 'Desktop', 'HP', '400 G2', 'SGH553PQG7', 1, 2, 16, NULL),
(81, 'Desktop', 'HP', '400 G2', 'SGH553PQDH', 1, 2, 16, NULL),
(82, 'Desktop', 'HP', '400 G2', 'SGH553PQFW', 1, 2, 16, NULL),
(83, 'Desktop', 'HP', '400 G2', 'SGH553PQBV', 1, 2, 16, NULL),
(84, 'Desktop', 'HP', '400 G2', 'SGH553PQCB', 1, 2, 16, NULL),
(85, 'Desktop', 'HP', '400 G2', 'SGH553PQFV', 2, 2, 16, NULL),
(86, 'Desktop', 'HP', '400 G2', 'SGH553PQCC', 2, 2, 16, NULL),
(87, 'Desktop', 'HP', '400 G2', 'SGH553PQG2', 2, 2, 16, NULL),
(88, 'Desktop', 'HP', '400 G2', 'SGH553PQFT', 1, 2, 16, NULL),
(89, 'Desktop', 'HP', '400 G2', 'SGH553PQG6', 1, 2, 16, NULL),
(90, 'Desktop', 'HP', '400 G2', 'SGH553PQFX', 1, 2, 16, NULL),
(91, 'Desktop', 'HP', '400 G2', 'SGH553PQC9', 1, 2, 16, NULL),
(92, 'Desktop', 'HP', '400 G2', 'SGH553PQCP', 1, 2, 16, NULL),
(93, 'Desktop', 'HP', '400 G2', 'SGH553PQDL', 1, 2, 16, NULL),
(94, 'Desktop', 'HP', '400 G2', 'SGH553PQFZ', 1, 2, 16, NULL),
(95, 'Desktop', 'HP', '400 G2', 'SGH553PQH3', 1, 2, 16, NULL),
(96, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QT', 1, 2, 17, NULL),
(97, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RG', 1, 2, 17, NULL),
(98, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RK', 1, 2, 17, NULL),
(99, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QH', 1, 2, 17, NULL),
(100, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QM', 1, 2, 17, NULL),
(101, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RT', 1, 2, 17, NULL),
(102, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33S4', 1, 2, 17, NULL),
(103, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33S0', 1, 2, 17, NULL),
(104, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RQ', 1, 2, 17, NULL),
(105, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RZ', 1, 2, 17, NULL),
(106, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31Q8', 1, 2, 17, NULL),
(107, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31R9', 1, 2, 17, NULL),
(108, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QS', 1, 2, 17, NULL),
(109, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31Q1', 1, 2, 17, NULL),
(110, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31PX', 1, 2, 17, NULL),
(111, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31PW', 1, 2, 17, NULL),
(112, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33SF', 1, 2, 17, NULL),
(113, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RX', 1, 2, 17, NULL),
(114, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31R3', 1, 2, 17, NULL),
(115, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31PP', 1, 2, 17, NULL),
(116, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33S9', 1, 2, 17, NULL),
(117, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33R6', 1, 2, 17, NULL),
(118, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RA', 1, 2, 17, NULL),
(119, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RM', 1, 2, 17, NULL),
(120, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33SJ', 1, 2, 17, NULL),
(121, 'Notebook', 'LENOVO', 'ThinkBook 14 G6', 'PWO8RHGW', 1, 2, 17, NULL),
(122, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QQ', 1, 2, 17, NULL),
(123, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QN', 1, 2, 17, NULL),
(124, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QN', 1, 2, 17, NULL),
(125, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31RC', 1, 2, 17, NULL),
(126, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31Q3', 1, 2, 17, NULL),
(127, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33R4', 1, 2, 17, NULL),
(128, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QB', 1, 2, 17, NULL),
(129, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RN', 1, 2, 17, NULL),
(130, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33SG', 1, 2, 17, NULL),
(131, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31Q0', 1, 2, 17, NULL),
(132, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QR', 1, 2, 17, NULL),
(133, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QF', 1, 2, 17, NULL),
(134, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QL', 1, 2, 17, NULL),
(135, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31R7', 1, 2, 17, NULL),
(136, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QC', 1, 2, 17, NULL),
(137, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33SQ', 1, 2, 17, NULL),
(138, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31PY', 1, 2, 17, NULL),
(139, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31Q2', 1, 2, 17, NULL),
(140, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31PR', 1, 2, 17, NULL),
(141, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33SR', 1, 2, 17, NULL),
(142, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31R5', 1, 2, 17, NULL),
(143, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RB', 1, 2, 17, NULL),
(144, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31Q6', 1, 2, 17, NULL),
(145, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RD', 1, 2, 17, NULL),
(146, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31RD', 1, 2, 17, NULL),
(147, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QX', 1, 2, 17, NULL),
(148, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QZ', 1, 2, 17, NULL),
(149, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31R6', 1, 2, 17, NULL),
(150, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31PT', 1, 2, 17, NULL),
(151, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33S2', 1, 2, 17, NULL),
(152, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RL', 1, 2, 17, NULL),
(153, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31RE', 1, 2, 17, NULL),
(154, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QP', 1, 2, 17, NULL),
(155, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QZ', 1, 2, 17, NULL),
(156, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33R8', 1, 2, 17, NULL),
(157, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31Q7', 1, 2, 17, NULL),
(158, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33SH', 1, 2, 17, NULL),
(159, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QH', 1, 2, 17, NULL),
(160, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31PV', 1, 2, 17, NULL),
(161, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QY', 1, 2, 17, NULL),
(162, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QL', 1, 2, 17, NULL),
(163, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33SC', 1, 2, 17, NULL),
(164, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33SL', 1, 2, 17, NULL),
(165, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QG', 1, 2, 17, NULL),
(166, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33S3', 1, 2, 17, NULL),
(167, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RW', 1, 2, 17, NULL),
(168, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33SM', 1, 2, 17, NULL),
(169, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RV', 1, 2, 17, NULL),
(170, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33SP', 1, 2, 17, NULL),
(171, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RP', 1, 2, 17, NULL),
(172, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33R3', 1, 2, 17, NULL),
(173, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33S8', 1, 2, 17, NULL),
(174, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33SD', 1, 2, 17, NULL),
(175, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33R9', 1, 2, 17, NULL),
(176, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33S6', 1, 2, 17, NULL),
(177, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31Q9', 1, 2, 17, NULL),
(178, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QY', 1, 2, 17, NULL),
(179, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33SB', 1, 2, 17, NULL),
(180, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33SA', 1, 2, 17, NULL),
(181, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QP', 1, 2, 17, NULL),
(182, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33SN', 1, 2, 17, NULL),
(183, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RY', 1, 2, 17, NULL),
(184, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33S7', 1, 2, 17, NULL),
(185, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33S1', 1, 2, 17, NULL),
(186, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QW', 1, 2, 17, NULL),
(187, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RR', 1, 2, 17, NULL),
(188, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QS', 1, 2, 17, NULL),
(189, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QX', 1, 2, 17, NULL),
(190, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31R4', 1, 2, 17, NULL),
(191, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31PS', 1, 2, 17, NULL),
(192, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RF', 1, 2, 17, NULL),
(193, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QJ', 1, 2, 17, NULL),
(194, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31R2', 1, 2, 17, NULL),
(195, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QD', 1, 2, 17, NULL),
(196, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33R0', 1, 2, 17, NULL),
(197, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QE', 1, 2, 17, NULL),
(198, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33Q9', 1, 2, 17, NULL),
(199, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QG', 1, 2, 17, NULL),
(200, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QQ', 1, 2, 17, NULL),
(201, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QC', 1, 2, 17, NULL),
(202, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31R1', 1, 2, 17, NULL),
(203, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RE', 1, 2, 17, NULL),
(204, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33R2', 1, 2, 17, NULL),
(205, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31R8', 1, 2, 17, NULL),
(206, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QW', 1, 2, 17, NULL),
(207, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QF', 1, 2, 17, NULL),
(208, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31Q5', 1, 2, 17, NULL),
(209, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31R0', 1, 2, 17, NULL),
(210, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QK', 1, 2, 17, NULL),
(211, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QV', 1, 2, 17, NULL),
(212, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QT', 1, 2, 17, NULL),
(213, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RC', 1, 2, 17, NULL),
(214, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QB', 1, 2, 17, NULL),
(215, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QJ', 1, 2, 17, NULL),
(216, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RH', 1, 2, 17, NULL),
(217, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QM', 2, 2, 17, NULL),
(218, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31Q4', 2, 2, 17, NULL),
(219, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33R5', 2, 2, 17, NULL),
(220, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RJ', 1, 2, 17, NULL),
(221, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33R1', 1, 2, 17, NULL),
(222, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QK', 1, 2, 17, NULL),
(223, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31PZ', 1, 2, 17, NULL),
(224, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31RA', 1, 2, 17, NULL),
(225, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QV', 1, 2, 17, NULL),
(226, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33RS', 1, 2, 17, NULL),
(227, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33SE', 1, 2, 17, NULL),
(228, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QA', 1, 2, 17, NULL),
(229, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33QR', 1, 2, 17, NULL),
(230, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33SS', 1, 2, 17, NULL),
(231, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QD', 2, 2, 17, NULL),
(232, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L31QE', 1, 2, 17, NULL),
(233, 'Notebook', 'LENOVO', 'ThinkBook 14 G5', 'MP2L33S5', 1, 2, 17, NULL),
(234, 'desktop', 'HP', '400 G1', 'SGH403QSQF', 1, 2, 18, NULL),
(235, 'desktop', 'HP', '400 G1', 'SGH506QSQC', 1, 2, 18, NULL),
(236, 'desktop', 'HP', '400 G1', 'SGH506QSP7', 1, 2, 18, NULL),
(237, 'desktop', 'HP', '400 G1', 'SGH506QSRR', 1, 2, 18, NULL),
(238, 'desktop', 'HP', '400 G1', 'SGH506QSN8', 1, 2, 18, NULL),
(239, 'desktop', 'HP', '400 G1', 'SGH506QSM3', 1, 2, 18, NULL),
(240, 'desktop', 'HP', '400 G1', 'SGH506QSQZ', 1, 2, 18, NULL),
(241, 'desktop', 'HP', '400 G1', 'SGH506QSP5', 1, 2, 18, NULL),
(242, 'desktop', 'HP', '400 G1', 'SGH506QSRF', 1, 2, 18, NULL),
(243, 'desktop', 'HP', '400 G1', 'SGH506QSLZ', 1, 2, 18, NULL),
(244, 'desktop', 'HP', '400 G1', 'SGH506QSP0', 1, 2, 18, NULL),
(245, 'desktop', 'HP', '400 G1', 'SGH506QSN7', 1, 2, 18, NULL),
(246, 'desktop', 'HP', '400 G1', 'SGH506QSNZ', 1, 2, 18, NULL),
(247, 'desktop', 'HP', '400 G1', 'SGH506QSKT', 1, 2, 18, NULL),
(248, 'desktop', 'HP', '400 G1', 'SGH506QSRG', 1, 2, 18, NULL),
(249, 'desktop', 'HP', '400 G1', 'SGH403QSQF', 1, 2, 19, NULL),
(250, 'desktop', 'HP', '400 G1', 'SGH506QSQC', 1, 2, 19, NULL),
(251, 'desktop', 'HP', '400 G1', 'SGH506QSP7', 1, 2, 19, NULL),
(252, 'desktop', 'HP', '400 G1', 'SGH506QSRR', 1, 2, 19, NULL),
(253, 'desktop', 'HP', '400 G1', 'SGH506QSN8', 1, 2, 19, NULL),
(254, 'desktop', 'HP', '400 G1', 'SGH506QSM3', 1, 2, 19, NULL),
(255, 'desktop', 'HP', '400 G1', 'SGH506QSQZ', 1, 2, 19, NULL),
(256, 'desktop', 'HP', '400 G1', 'SGH506QSP5', 1, 2, 19, NULL),
(257, 'desktop', 'HP', '400 G1', 'SGH506QSRF', 1, 2, 19, NULL),
(258, 'desktop', 'HP', '400 G1', 'SGH506QSLZ', 1, 2, 19, NULL),
(259, 'desktop', 'HP', '400 G1', 'SGH506QSP0', 1, 2, 19, NULL),
(260, 'desktop', 'HP', '400 G1', 'SGH506QSN7', 1, 2, 19, NULL),
(261, 'desktop', 'HP', '400 G1', 'SGH506QSNZ', 1, 2, 19, NULL),
(262, 'desktop', 'HP', '400 G1', 'SGH506QSKT', 1, 2, 19, NULL),
(263, 'desktop', 'HP', '400 G1', 'SGH506QSRG', 1, 2, 19, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `equipment_status`
--

CREATE TABLE `equipment_status` (
  `id` int(11) NOT NULL,
  `equipment_status_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment_status`
--

INSERT INTO `equipment_status` (`id`, `equipment_status_name`) VALUES
(1, 'พร้อมใช้งาน'),
(2, 'กำลังยืม'),
(3, 'เสียหาย'),
(4, 'สูญหาย');

-- --------------------------------------------------------

--
-- Table structure for table `equipment_type`
--

CREATE TABLE `equipment_type` (
  `id` int(11) NOT NULL,
  `equipment_type_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment_type`
--

INSERT INTO `equipment_type` (`id`, `equipment_type_name`) VALUES
(1, 'software'),
(2, 'hardware'),
(3, 'other');

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

CREATE TABLE `floor` (
  `id` int(11) NOT NULL,
  `floor_name` varchar(100) NOT NULL,
  `building_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `floor`
--

INSERT INTO `floor` (`id`, `floor_name`, `building_id`) VALUES
(6, '1', 1),
(7, '2', 1),
(8, '3', 1),
(9, '4', 1),
(10, '1', 3),
(11, '2', 3),
(12, '3', 3),
(13, '4', 3),
(14, '5', 3),
(15, '6', 3),
(16, '7', 3),
(17, '8', 3),
(18, '9', 3),
(19, '1', 4),
(20, '2', 4),
(21, '3', 4),
(22, '4', 4),
(23, '5', 4),
(24, '6', 4),
(25, '7', 4),
(26, '8', 4),
(27, '9', 4),
(28, '10', 4),
(29, '11', 4),
(30, '12', 4),
(31, '0', 6),
(32, '1', 6),
(33, '2', 6),
(34, '3', 6),
(35, '4', 6),
(36, '5', 6),
(37, '6', 6),
(38, '7', 6),
(39, '1', 7),
(40, '2', 7),
(41, '3', 7),
(42, '4', 7),
(43, '1', 12),
(44, '2', 12),
(45, '1', 14),
(46, '2', 14),
(47, '3', 14),
(48, '4', 14),
(49, '5', 14),
(50, '6', 14),
(51, '1', 15),
(52, '2', 15),
(53, '3', 15),
(54, '4', 15),
(55, '5', 15),
(56, '6', 15),
(57, '7', 15),
(58, '1', 16),
(59, '2', 16),
(60, '3', 16),
(61, '4', 16),
(62, '5', 16),
(63, '6', 16),
(64, '7', 16),
(65, '1', 17),
(66, '2', 17),
(67, '3', 17),
(68, '4', 17),
(69, '5', 17),
(70, '6', 17),
(71, '7', 17),
(72, '8', 17),
(73, '16', 18),
(74, '12A', 19),
(75, '17', 18),
(76, '5', 20);

-- --------------------------------------------------------

--
-- Table structure for table `lot`
--

CREATE TABLE `lot` (
  `id` int(11) NOT NULL,
  `lot_name` varchar(100) NOT NULL,
  `academic_year` varchar(20) DEFAULT NULL,
  `reference_doc` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `lot_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lot`
--

INSERT INTO `lot` (`id`, `lot_name`, `academic_year`, `reference_doc`, `description`, `purchase_date`, `expire_date`, `lot_type_id`) VALUES
(16, 'ทรัพย์สินมหาลัย-2558-1', '2558', NULL, 'ทรัพย์สินมหาลัย-2558-1', '2015-01-01', NULL, 1),
(17, 'เครื่องเช่าLot1-1', '2020', NULL, 'เครื่องเช่าLot1-1', '2020-01-01', '2030-01-01', 2),
(18, 'ทรัพย์สินมหาลัย-2557-1', '2557', NULL, 'ทรัพย์สินมหาลัย-2557-1', '2014-01-01', NULL, 1),
(19, 'ทรัพย์สินมหาลัย-2557-1', '2557', NULL, 'ทรัพย์สินมหาลัย-2557-1', '2014-01-01', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lot_type`
--

CREATE TABLE `lot_type` (
  `id` int(11) NOT NULL,
  `lot_type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lot_type`
--

INSERT INTO `lot_type` (`id`, `lot_type_name`) VALUES
(1, 'ซื้อ'),
(2, 'เช่า'),
(3, 'ยืม'),
(4, 'การทดลอง');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role_name`) VALUES
(1, 'พนักงาน'),
(2, 'อาจารย์'),
(3, 'ส่วนกลาง');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `floor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `room_name`, `floor_id`) VALUES
(18, '1205A', 7),
(19, '1205B', 7),
(20, '1301', 8),
(21, '1302', 8),
(22, '1303', 8),
(23, '1304', 8),
(24, '1301', 8),
(25, '1302', 8),
(26, '1303', 8),
(27, '1304', 8),
(28, '1305A', 8),
(29, '1305B', 8),
(30, '1401', 9),
(31, '1402', 9),
(32, '1403', 9),
(33, '1404', 9),
(34, '1405', 9),
(35, '1406', 9),
(36, '5201', 11),
(37, '5202', 11),
(38, '5301', 12),
(39, '5302', 12),
(40, '5303', 12),
(41, '5304', 12),
(42, '5401', 13),
(43, '5402', 13),
(44, '5403', 13),
(45, '5404', 13),
(46, '5501', 14),
(47, '5502', 14),
(48, '5503', 14),
(49, '5504', 14),
(55, '5601', 15),
(56, '5602', 15),
(57, '5603', 15),
(58, '5604', 15),
(59, '5701', 16),
(60, '5702', 16),
(61, '5703', 16),
(62, '5704', 16),
(63, '5801', 17),
(64, '5802', 17),
(65, '5803', 17),
(66, '5804', 17),
(67, '5805', 17),
(68, '5806', 17),
(69, '5807', 17),
(70, '5808', 17),
(71, '5901', 18),
(72, '5902', 18),
(73, '5903', 18),
(74, '5904', 18),
(75, '5905', 18),
(76, '7201', 20),
(77, '7202', 20),
(78, '7203', 20),
(79, '7204', 20),
(80, '7205', 20),
(81, '7206', 20),
(82, '7207', 20),
(83, '7208', 20),
(84, '7209', 20),
(85, '7210', 20),
(86, '7211', 20),
(87, '7301', 21),
(88, '7302', 21),
(89, '7303', 21),
(90, '7304', 21),
(91, '7307', 21),
(92, '7401', 22),
(93, '7402', 22),
(94, '7403', 22),
(95, '7404', 22),
(96, '7405', 22),
(97, '7406', 22),
(98, '7407', 22),
(99, '7501', 23),
(100, '7502', 23),
(101, '7503', 23),
(102, '7504', 23),
(103, '7505', 23),
(104, '7506', 23),
(105, '7507', 23),
(106, '7601', 24),
(107, '7602', 24),
(108, '7603', 24),
(109, '7604', 24),
(110, '7605', 24),
(111, '7606', 24),
(112, '7607', 24),
(113, '7607', 24),
(114, '7701', 25),
(115, '7702', 25),
(116, '7703', 25),
(117, '7704', 25),
(118, '7801', 26),
(119, '7802', 26),
(120, '7803', 26),
(121, '7804', 26),
(122, '7901', 27),
(123, '7902', 27),
(124, '7903', 27),
(125, '7904', 27),
(126, '71001', 28),
(127, '71002', 28),
(128, '71003', 28),
(129, '71004', 28),
(130, '71005', 28),
(131, '71006', 28),
(132, '71007', 28),
(133, '71008', 28),
(134, '71009', 28),
(135, '71010', 28),
(136, '71101', 29),
(137, '71102', 29),
(138, '71103', 29),
(139, '71105', 29),
(140, '71106', 29),
(141, '71201', 30),
(142, '71202', 30),
(143, '71203', 30),
(144, '9001', 31),
(145, '9002', 31),
(146, '9003', 31),
(147, '9004', 31),
(148, '9005', 31),
(149, '9006', 31),
(150, '9501', 36),
(151, '9603', 37),
(152, '9604', 37),
(153, '9605', 37),
(154, '9606', 37),
(155, '9701', 38),
(156, '10201', 40),
(157, '10301', 41),
(158, '10302', 41),
(159, '10303', 41),
(160, '10401', 42),
(161, '10402', 42),
(162, '10403', 42),
(163, '10404', 42),
(164, '10405', 42),
(165, '10406', 42),
(166, '10407', 42),
(167, '19202', 44),
(168, '19205', 44),
(169, '21101', 45),
(170, '21102', 45),
(171, '21103', 45),
(172, '21201', 46),
(173, '21202', 46),
(174, '21203', 46),
(175, '21204', 46),
(176, '21205', 46),
(177, '21206', 46),
(178, '21207', 46),
(179, '21208', 46),
(180, '21209', 46),
(181, '21301', 47),
(182, '21302', 47),
(183, '21303', 47),
(184, '21304', 47),
(185, '21305', 47),
(186, '21306', 47),
(187, '21307', 47),
(188, '21308', 47),
(189, '21309', 47),
(190, '21401', 48),
(191, '21402', 48),
(192, '21403', 48),
(193, '21404', 48),
(194, '21405', 48),
(195, '21406', 48),
(196, '21407', 48),
(197, '21408', 48),
(198, '21409', 48),
(199, '21501', 49),
(200, '21502', 49),
(201, '21503', 49),
(202, '21504', 49),
(203, '21505', 49),
(204, '21506', 49),
(205, '21507', 49),
(206, '21508', 49),
(207, '21509', 49),
(208, '21601', 50),
(209, '21602', 50),
(210, '21603', 50),
(211, '21604', 50),
(212, '21605', 50),
(213, '22201', 52),
(214, '22202', 52),
(215, '22203', 52),
(216, '22301', 53),
(217, '22302', 53),
(218, '22303', 53),
(219, '22304', 53),
(220, '22401', 54),
(221, '22402', 54),
(222, '22403', 54),
(223, '22404', 54),
(224, '22501', 55),
(225, '22502', 55),
(226, '22503', 55),
(227, '22504', 55),
(228, '22601', 56),
(229, '22602', 56),
(230, '22603', 56),
(231, '22701', 57),
(232, '22702', 57),
(233, '23201', 59),
(234, '23202', 59),
(235, '23203', 59),
(236, '23204', 59),
(237, '23301', 60),
(238, '23302', 60),
(239, '23303', 60),
(240, '23304', 60),
(241, '23305', 60),
(242, '23306', 60),
(243, '23307', 60),
(244, '23308', 60),
(245, '23309', 60),
(246, '23310', 60),
(247, '23311', 60),
(248, '23312', 60),
(249, '23313', 60),
(250, '23314', 60),
(251, '23315', 60),
(252, '23316', 60),
(253, '23317', 60),
(254, '23318', 60),
(255, '23319', 60),
(256, '23320', 60),
(257, '23321', 60),
(258, '23322', 60),
(259, '23323', 60),
(260, '23324', 60),
(261, '23401', 61),
(262, '23402', 61),
(263, '23403', 61),
(264, '23404', 61),
(265, '23405', 61),
(266, '23406', 61),
(267, '23501', 62),
(268, '23502', 62),
(269, '23503', 62),
(270, '23504', 62),
(271, '23701', 64),
(272, '24801', 72),
(273, '24802', 72),
(274, '24803', 72),
(275, '24804', 72),
(276, '24805', 72),
(277, '24806', 72),
(278, '24807', 72),
(279, '24808', 72),
(280, '24809', 72),
(281, 'เลขานุการผู้บริหาร', 73),
(282, '7', 74),
(283, 'เลขานุการผู้บริหาร', 75),
(284, 'สำนักบริหารทรัพยากรมนุษย์', 76);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`) VALUES
(3, 'admin@example.com', '$2a$10$fYuM/LD30H98WuyO4esxF.Z7O.BA0CeUHgbPMd2OKAh/gyI0bLNj2', 'ROLE_ADMIN');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `borrow_status_id` (`borrow_status_id`);

--
-- Indexes for table `borrow_equipment`
--
ALTER TABLE `borrow_equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment_id` (`equipment_id`),
  ADD KEY `borrow_id` (`borrow_id`);

--
-- Indexes for table `borrow_status`
--
ALTER TABLE `borrow_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_department_id` (`department_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `fk_room_id` (`room_id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment_type_id` (`equipment_type_id`),
  ADD KEY `equipment_status_id` (`equipment_status_id`),
  ADD KEY `lot_id` (`lot_id`);

--
-- Indexes for table `equipment_status`
--
ALTER TABLE `equipment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipment_type`
--
ALTER TABLE `equipment_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `floor`
--
ALTER TABLE `floor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_building_id` (`building_id`);

--
-- Indexes for table `lot`
--
ALTER TABLE `lot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_lot_lot_type` (`lot_type_id`);

--
-- Indexes for table `lot_type`
--
ALTER TABLE `lot_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_floor_id` (`floor_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `borrow_equipment`
--
ALTER TABLE `borrow_equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `borrow_status`
--
ALTER TABLE `borrow_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `building`
--
ALTER TABLE `building`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT for table `equipment_status`
--
ALTER TABLE `equipment_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `equipment_type`
--
ALTER TABLE `equipment_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `floor`
--
ALTER TABLE `floor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `lot`
--
ALTER TABLE `lot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `lot_type`
--
ALTER TABLE `lot_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`borrow_status_id`) REFERENCES `borrow_status` (`id`);

--
-- Constraints for table `borrow_equipment`
--
ALTER TABLE `borrow_equipment`
  ADD CONSTRAINT `borrow_equipment_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`),
  ADD CONSTRAINT `borrow_equipment_ibfk_3` FOREIGN KEY (`borrow_id`) REFERENCES `borrow` (`id`);

--
-- Constraints for table `building`
--
ALTER TABLE `building`
  ADD CONSTRAINT `fk_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`equipment_type_id`) REFERENCES `equipment_type` (`id`),
  ADD CONSTRAINT `equipment_ibfk_2` FOREIGN KEY (`equipment_status_id`) REFERENCES `equipment_status` (`id`),
  ADD CONSTRAINT `equipment_ibfk_3` FOREIGN KEY (`lot_id`) REFERENCES `lot` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `floor`
--
ALTER TABLE `floor`
  ADD CONSTRAINT `fk_building_id` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`);

--
-- Constraints for table `lot`
--
ALTER TABLE `lot`
  ADD CONSTRAINT `fk_lot_lot_type` FOREIGN KEY (`lot_type_id`) REFERENCES `lot_type` (`id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `fk_floor_id` FOREIGN KEY (`floor_id`) REFERENCES `floor` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
