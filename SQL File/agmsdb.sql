-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2025 at 06:12 PM
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
-- Database: `agmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `payment_status` enum('Success','Failed') NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` varchar(45) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Admin', 'admin', 987654331, 'tester1@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2022-12-29 06:21:53');

-- --------------------------------------------------------

--
-- Table structure for table `tblartist`
--

CREATE TABLE `tblartist` (
  `ID` int(10) NOT NULL,
  `Name` varchar(250) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(250) DEFAULT NULL,
  `Education` mediumtext DEFAULT NULL,
  `Award` mediumtext DEFAULT NULL,
  `Profilepic` varchar(250) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblartist`
--

INSERT INTO `tblartist` (`ID`, `Name`, `MobileNumber`, `Email`, `Education`, `Award`, `Profilepic`, `CreationDate`) VALUES
(1, 'Mohan Das', 7987987987, 'mohan@gmail.com', 'Completed his fine arts from kg fine arts college.\r\nSpecialized in drawing and ceramic.', 'Winner of Hugo Boss Prize in 2019, MacArthur Fellowship\r\n', 'ecebbecf28c2692aeb021597fbddb174.jpg', '2022-12-21 13:31:25'),
(2, 'Dev', 3287987987, 'dev@gmail.com', 'Completed his fine arts from kg fine arts college.\r\nSpecialized in painting and ceramic.', 'Winner of Hugo Boss Prize in 2019, MacArthur Fellowship\r\n', 'ad04ad2d96ae326a9ca9de47d9e2fc74.jpg', '2022-12-21 13:31:25'),
(3, 'Kanha', 9687987987, 'kanha@gmail.com', 'Completed his fine arts from kg fine arts college.\r\nSpecialized in painting and ceramic.', 'Winner of Hugo Boss Prize in 2019, MacArthur Fellowship\r\n', 'ad04ad2d96ae326a9ca9de47d9e2fc74.jpg', '2022-12-21 13:31:25'),
(4, 'Abir Rajwansh', 5687987987, 'abir@gmail.com', 'Completed his fine arts from klijfine arts college.\r\nSpecialized in painting and ceramic.', 'Winner of Hugo Boss Prize in 2019, MacArthur Fellowship\r\n', 'ad04ad2d96ae326a9ca9de47d9e2fc74.jpg', '2022-12-21 13:31:25'),
(5, 'Krisna Dutt', 9187987987, 'krish@gmail.com', 'Completed his fine arts from kg fine arts college.\r\nSpecialized in painting and ceramic.', 'Winner of Hugo Boss Prize in 2019, MacArthur Fellowship\r\n', 'ad04ad2d96ae326a9ca9de47d9e2fc74.jpg', '2022-12-21 13:31:25'),
(6, 'Kajol Mannati', 8187987987, 'kajol@gmail.com', 'Completed his fine arts from kg fine arts college.\r\nSpecialized in painting and ceramic.', 'Winner of Hugo Boss Prize in 2019, MacArthur Fellowship\r\n', 'ad04ad2d96ae326a9ca9de47d9e2fc74.jpg', '2022-12-21 13:31:25'),
(7, 'Meera Singh', 2987987987, 'meera@gmail.com', 'Fine Arts in Painting from College of Art, New Delhi in 2012,\r\nSpecialized in printmaking and ceramic.', 'award-winning artist, and has received a scholarship from the Ministry of Culture, Government of India in 2014 as well as the Jean-Claude Reynal Scholarship (France) in 2019.\r\n', 'ad04ad2d96ae326a9ca9de47d9e2fc74.jpg', '2022-12-21 13:31:25'),
(8, 'Narayan Das', 9987987987, 'narayan@gmail.com', 'Completed his fine arts from hjai fine arts college.\r\nSpecialized in painting and ceramic.', 'Winner of Young Artist Award in 2009, MacArthur Fellowship\r\n', 'ad04ad2d96ae326a9ca9de47d9e2fc74.jpg', '2022-12-21 13:31:25'),
(11, 'Ceema Shah', 9876543334, 'ceemashah4@gmail.com', 'bachelor', 'colz event 1 runner up', 'b8c3508d54228e5dac60786dd4fa7da4.jpg', '2025-03-26 11:38:00'),
(12, 'Nalu devi', 9876512975, 'naludevi9@gmail.com', '+2', 'runner up i n school level', '150566ba91a67959b0fc2b2a8eedc6a2.jpg', '2025-03-26 11:39:23'),
(13, 'Neha Gautam', 976513829, 'nehag5@gmail.com', 'master', 'not one ', 'ac7362253a70640c363dc4470f1726b2.jpg', '2025-03-26 12:38:14'),
(14, 'Hari Nirma', 9851333366, 'harin89@gmail.com', 'bachelor', '2nd position in ', '5b52d7163bbcf60961e00b8452977a30.jpg', '2025-03-26 12:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `tblartmedium`
--

CREATE TABLE `tblartmedium` (
  `ID` int(5) NOT NULL,
  `ArtMedium` varchar(250) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblartmedium`
--

INSERT INTO `tblartmedium` (`ID`, `ArtMedium`, `CreationDate`) VALUES
(1, 'Wood and Bronze', '2022-12-22 04:57:04'),
(2, 'Acrylic on canvas', '2022-12-22 04:57:34'),
(3, 'Resin', '2022-12-22 04:58:00'),
(4, 'Mixed Media', '2022-12-22 06:09:12'),
(5, 'Bronze', '2022-12-22 06:09:35'),
(6, 'Fibre', '2022-12-22 06:09:53'),
(7, 'Steel', '2022-12-22 06:10:16'),
(8, 'Metal', '2022-12-22 06:10:35'),
(9, 'Oil on Canvas', '2022-12-22 06:11:31'),
(10, 'Oil on Linen', '2022-12-22 06:12:12'),
(11, 'Acrylics on paper', '2022-12-22 06:13:11'),
(12, 'Hand-painted on particle wood/MDF', '2022-12-22 06:14:03');

-- --------------------------------------------------------

--
-- Table structure for table `tblartproduct`
--

CREATE TABLE `tblartproduct` (
  `ID` int(5) NOT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `Dimension` varchar(250) DEFAULT NULL,
  `Orientation` varchar(100) DEFAULT NULL,
  `Size` varchar(100) DEFAULT NULL,
  `Artist` int(5) DEFAULT NULL,
  `ArtType` int(5) DEFAULT NULL,
  `ArtMedium` int(5) DEFAULT NULL,
  `SellingPricing` decimal(10,0) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `Image` varchar(250) DEFAULT NULL,
  `Image1` varchar(250) DEFAULT NULL,
  `Image2` varchar(250) DEFAULT NULL,
  `Image3` varchar(250) DEFAULT NULL,
  `Image4` varchar(250) DEFAULT NULL,
  `RefNum` int(10) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblartproduct`
--

INSERT INTO `tblartproduct` (`ID`, `Title`, `Dimension`, `Orientation`, `Size`, `Artist`, `ArtType`, `ArtMedium`, `SellingPricing`, `Description`, `Image`, `Image1`, `Image2`, `Image3`, `Image4`, `RefNum`, `CreationDate`) VALUES
(2, 'Radhe Krishna Painting', '56x56', 'Landscape', 'Medium', 1, 4, 9, 200, 'It is a painting of Radha Krishna.\r\nIt is a painting of Radha Krishna.\r\nIt is a painting of Radha Krishna.It is a painting of Radha Krishna.\r\nIt is a painting of Radha Krishna.It is a painting of Radha Krishna.It is a painting of Radha Krishna.', 'c565ad988a4c6fc0a9f429af43c47cce1671771454.jpg', '48424793dc9ea732f6118d4ba4326509.jpg', '', '', '', 586429003, '2022-12-23 04:57:34'),
(3, 'Shiv Tandav Painting', '100X50 inches', 'Potrait', 'Large', 6, 4, 10, 350, 'It is a painting of shiv tandav.\r\nIt is a painting of shiv tandav.\r\nIt is a painting of shiv tandav.It is a painting of shiv tandav.It is a painting of shiv tandav.It is a painting of shiv tandav.It is a painting of shiv tandav.\r\nIt is a painting of shiv tandav.It is a painting of shiv tandav.', 'cd235e034297cda7b6f935dbd4881a2f1671771582.jpg', 'cd235e034297cda7b6f935dbd4881a2f1671771582.jpg', '', '', '', 686429002, '2022-12-23 04:59:42'),
(4, 'Stutue of Afel Tower', '45 inches tall', 'Landscape', 'Medium', 7, 1, 8, 500, 'It is a stute of afel tower which is made up of metal,It is a stute of afel tower which is made up of metal,It is a stute of afel tower which is made up of metal,It is a stute of afel tower which is made up of metal,It is a stute of afel tower which is made up of metal,It is a stute of afel tower which is made up of metal,It is a stute of afel tower which is made up of metal,', '508652faabdd333b34a0ce4a1dd443411671771753.jpg', '', '', '', '', 686429003, '2022-12-23 05:02:33'),
(5, 'HKjhkj', '100x200', 'Landscape', 'Large', 7, 3, 9, 200, 'gjhgj', '7d108db512f6a6a929cd0d0ad3b593e81671772410.jpg', '', '', '', '', 586429004, '2022-12-23 05:13:30'),
(6, 'flaw', '1200X803', 'Potrait', 'Medium', 6, 5, 6, 8000, 'you see', '17c2f0bf5c9323a2f3518df6efc86d181742971789.jpg', '', '', '', '', 515512947, '2025-03-26 06:49:49'),
(7, 'may', '2017X909', 'Potrait', 'Medium', 4, 4, 6, 6000, 'make it', '0b87068d726f51f158f0232794e1c3841742971849.jpg', '', '', '', '', 918333166, '2025-03-26 06:50:49'),
(8, 'contemporary art', '1200X803', 'Potrait', 'Medium', 3, 14, 3, 7000, 'believe', '150566ba91a67959b0fc2b2a8eedc6a21742973519.jpg', '', '', '', '', 896699721, '2025-03-26 07:18:39'),
(9, 'pencil art', '2017X909', 'Potrait', 'Medium', 7, 5, 10, 9000, 'feelings', 'b8c3508d54228e5dac60786dd4fa7da41742988913.jpg', '', '', '', '', 300173313, '2025-03-26 11:35:13'),
(10, 'dev devi', '2017X909', 'Potrait', 'Medium', 12, 14, 11, 9000, 'shows the emotion our divine', '767b91ddc50291522aecd33d115517a61742989290.jpg', '', '', '', '', 324945666, '2025-03-26 11:41:30'),
(11, 'silent', '2017X909', 'Potrait', 'Medium', 11, 13, 11, 7000, 'make me too feel the art the showcase', '15bc0406af17a8aba52441e3ccf2e1551742989608jpeg', '', '', '', '', 652875255, '2025-03-26 11:46:48'),
(12, 'patience', '2017X909', 'Potrait', 'Medium', 6, 12, 10, 7000, 'peace for home', '78810519edd0cb4b90a0749a35656eb51742989944.jpg', '', '', '', '', 819227024, '2025-03-26 11:52:24'),
(13, 'kingdom', '2017X909', 'Potrait', 'Medium', 12, 12, 6, 9000, 'Its the  ancient period time where this type of things were served in one form', '01430befa869fb5f55491faa909230391742990063.jpg', '', '', '', '', 669207135, '2025-03-26 11:54:23'),
(14, 'show', '2017X909', 'Potrait', 'Medium', 5, 2, 8, 9000, 'see that', 'da89c0466aa7f37ade343eff43a78f961742990417.jpg', '', '', '', '', 929770633, '2025-03-26 12:00:17'),
(15, 'feelings', '2017X909', 'Potrait', 'Medium', 11, 11, 11, 9000, 'fixed it', 'da89c0466aa7f37ade343eff43a78f961742990523.jpg', '', '', '', '', 639071627, '2025-03-26 12:02:03'),
(16, 'home', '2017X909', 'Potrait', 'Medium', 1, 6, 2, 4000, 'home is home', 'a30e8da9187438d03ae9e168369b0d131742990689.jpg', '', '', '', '', 973968578, '2025-03-26 12:04:49'),
(17, 'gee', '2017X909', 'Potrait', 'Medium', 4, 11, 12, 4000, 'low on the top', '53fb680dfcd992eff0d7cf27c980c48f1742991229.jpg', '', '', '', '', 325582270, '2025-03-26 12:13:49'),
(18, 'high on the phase', '2017X909', 'Potrait', 'Medium', 5, 10, 10, 5000, 'hihi', '236d8148a1cbd0cd36ea0d0f337a51351742991302.jpg', '', '', '', '', 885948662, '2025-03-26 12:15:02'),
(19, 'teep', '2017X909', 'Potrait', 'Medium', 7, 10, 8, 9000, 'get it together', '5773a7ab51b00169a91123b6f7e6edb11742991350.jpg', '', '', '', '', 996621941, '2025-03-26 12:15:50'),
(20, 'flow', '2017X909', 'Potrait', 'Medium', 3, 10, 6, 10000, 'topup', '91c0150db740259c235d8d8af9577bd31742991430.jpg', '', '', '', '', 357181423, '2025-03-26 12:17:10'),
(21, 'potraye', '1200X803', 'Potrait', 'Medium', 2, 10, 1, 8900, 'kapa', '7160e38f929f1c7462ec7149a55975871742991498.jpg', '', '', '', '', 903547382, '2025-03-26 12:18:18'),
(22, 'yoso', '474X328', 'Potrait', 'Medium', 2, 10, 3, 9900, 'lite on the phase', '8fff598e4a0d329e1aae57b65aa9c8391742991562.jpg', '', '', '', '', 460739600, '2025-03-26 12:19:22'),
(23, 'people phase', '474X328', 'Potrait', 'Medium', 1, 10, 1, 7900, 'people  fading', 'a605ba66704413cd6e735981d1cd828a1742991702.jpg', '', '', '', '', 263911393, '2025-03-26 12:21:42'),
(24, 'ligt show the way', '474X328', 'Potrait', 'Medium', 5, 10, 11, 5000, 'you know that', 'c969fd9151c94d330e744627ab8265831742991884.jpg', '', '', '', '', 466851618, '2025-03-26 12:24:44'),
(25, 'noe', '474X328', 'Potrait', 'Medium', 5, 10, 4, 5000, 'uuhhhh', 'f268c6cb1cede78f330e265de63306b51742992099.jpg', '', '', '', '', 437893573, '2025-03-26 12:28:19'),
(26, 'tight', '474X328', 'Potrait', 'Medium', 3, 10, 12, 9010, 'hdgheugyed', '2876641348e23b8c6677ff715f69ac101742992366.png', '', '', '', '', 813828689, '2025-03-26 12:32:46'),
(27, 'i feel', '474X328', 'Potrait', 'Medium', 14, 16, 12, 9010, 'i feel it', '653e93fd69dcbc419955447cac440c841742992959.jpg', '', '', '', '', 139152244, '2025-03-26 12:42:39'),
(28, 'lalala', '474X328', 'Potrait', 'Medium', 14, 16, 4, 9000, 'proud motherland', 'cde976869fdf93ada4b26b528146b5e21742993286.jpg', '', '', '', '', 123478967, '2025-03-26 12:48:06'),
(29, 'as a women', '474X328', 'Potrait', 'Medium', 13, 16, 2, 9000, 'women nation ', '7ec6096db9a2b49d0eb98f15d048d9001742993333.jpg', '', '', '', '', 913143876, '2025-03-26 12:48:53'),
(30, 'friendship', '474X328', 'Potrait', 'Medium', 11, 12, 10, 9000, 'making it', '081d48ae824a998587b799315aaffb261742994480.png', '', '', '', '', 117786283, '2025-03-26 13:08:00'),
(31, 'deep', '2017X909', 'Potrait', 'Medium', 7, 12, 6, 10000, 'i know', 'a40308f165f5525d70d2e122859f9ab61742994536.jpg', '', '', '', '', 458313574, '2025-03-26 13:08:56'),
(32, 'logv', '2000X1336', 'Potrait', 'Medium', 2, 12, 2, 9010, 'keep it', 'a78444d41be4225b7353750b3f5e22851742994608.jpg', '', '', '', '', 515580778, '2025-03-26 13:10:08'),
(33, 'light color ', '1200X803', 'Potrait', 'Medium', 0, 15, 2, 13900, 'geet up', 'ac7362253a70640c363dc4470f1726b21742994744.jpg', '', '', '', '', 567303958, '2025-03-26 13:12:24'),
(34, 'asdAf', '1200X803', 'Potrait', 'Small', 13, 15, 9, 9800, 'kiki', 'b234baed21817d689650251d80d392931742994792.jpg', '', '', '', '', 549169435, '2025-03-26 13:13:12'),
(35, 'lord', '2017X909', 'Landscape', 'Medium', 14, 1, 2, 6000, 'gives blessing', '0bb55eab9d88bc895c6b3afe6fb168921742994950.jpg', '', '', '', '', 156592512, '2025-03-26 13:15:50'),
(36, 'race', '2017X909', 'Potrait', 'Medium', 4, 2, 4, 4000, 'race is part of game', '7f5b05747e2acfa9eb1d81a9db94d08b1742995160.jpg', '', '', '', '', 638935523, '2025-03-26 13:19:20'),
(37, 'nature feel', '474X328', 'Potrait', 'Medium', 13, 2, 3, 6000, 'deepdown ', '95b8dbedcb5c03ecdbec4f9ada5998171742995234.jpg', '', '', '', '', 760318683, '2025-03-26 13:20:34'),
(38, 'talking', '1200X803', 'Potrait', 'Medium', 12, 2, 4, 5000, 'talking ladies', 'a8f5ec083fb7807b72164b99985d3ffc1742995312.jpg', '', '', '', '', 834520692, '2025-03-26 13:21:52'),
(39, 'power', '474X328', 'Potrait', 'Medium', 8, 16, 7, 5500, 'power takes back up', '473e92da7d3e30256710c82708d4b8c01742995454.jpg', '', '', '', '', 180263915, '2025-03-26 13:24:14'),
(40, 'tip', '474X328', 'Potrait', 'Medium', 2, 2, 8, 6600, 'tipee', '48675b08293506234652c05d23cf89e71742995497.jpg', '', '', '', '', 514127229, '2025-03-26 13:24:57'),
(41, 'yope', '1200X803', 'Potrait', 'Medium', 12, 15, 0, 7000, 'yhite', 'b7d3375cbbe8c1617b937af3ad312b091742995672.jpg', '', '', '', '', 833642302, '2025-03-26 13:27:52'),
(42, 'belief', '1200X803', 'Potrait', 'Medium', 13, 12, 5, 7000, 'user', '4748791d95e313c4830b8b90af72c91f1742995732.jpg', '', '', '', '', 819249184, '2025-03-26 13:28:52'),
(43, 'ganga', '1200X803', 'Potrait', 'Medium', 11, 12, 0, 9990, 'ganga part', 'f31ce4a3c0dfe7c92f1a59f6bb1d17c21742995824.jpg', '', '', '', '', 120701503, '2025-03-26 13:30:24'),
(44, 'energy', '2017X909', 'Potrait', 'Small', 5, 2, 9, 6000, 'energy', 'd712095853d858402e81f050559cc6321742995889.jpg', '', '', '', '', 380258117, '2025-03-26 13:31:29'),
(45, 'lost and found', '2017X909', 'Potrait', 'Medium', 13, 4, 6, 6000, 'half apart ', 'c865f607fa5882dcb1e2ef176cdb54e41742996035.jpg', '', '', '', '', 155432099, '2025-03-26 13:33:55'),
(46, 'yoyoso', '2017X909', 'Potrait', 'Medium', 2, 2, 2, 5500, 'logoond', '17c2f0bf5c9323a2f3518df6efc86d181742996294.jpg', '', '', '', '', 525449388, '2025-03-26 13:38:14'),
(47, 'nonoaaa', '474X328', 'Potrait', 'Medium', 7, 2, 9, 7800, 'hiihihiryo', '0b87068d726f51f158f0232794e1c3841742996353.jpg', '', '', '', '', 283937516, '2025-03-26 13:39:13'),
(48, 'friendship', '474X328', 'Potrait', 'Medium', 12, 5, 4, 8000, 'bonding', 'ebc1ef1196e7645a775f2885686d3a5d1742996455.jpg', '', '', '', '', 588180747, '2025-03-26 13:40:55'),
(49, 'both', '2017X909', 'Potrait', 'Medium', 7, 12, 0, 7000, 'culture', 'f7ce37e6bb4f634733dda385c6f0d7871742996645.jpg', '', '', '', '', 136659948, '2025-03-26 13:44:05'),
(50, 'bloom', '2017X909', 'Potrait', 'Medium', 13, 16, 9, 7000, 'blooming as its own', 'e95d2b7cab5df1723a456c801d0205ea1742996829.jpg', '', '', '', '', 634926355, '2025-03-26 13:47:09'),
(51, 'soth', '1200X803', 'Potrait', 'Medium', 8, 16, 11, 8000, 'ppp[opoi', '8bc22b97e6002072a246cdc0141ec1161742997298.jpg', '', '', '', '', 892421762, '2025-03-26 13:54:58'),
(52, 'poes', '1200X803', 'Potrait', 'Medium', 12, 16, 10, 8000, 'oiliye', 'f3f482fb174981e4b9de3f7a1b99ba9e1742997337.jpg', '', '', '', '', 744651586, '2025-03-26 13:55:37'),
(53, 'canu', '1200X803', 'Potrait', 'Medium', 1, 16, 12, 8000, 'youp', 'd481c6a9aabac3338a3783a05aa272861742997379.jpg', '', '', '', '', 642744959, '2025-03-26 13:56:19'),
(54, 'pufh', '1200X803', 'Potrait', 'Medium', 7, 16, 6, 7000, 'uknoe', 'bc19ddf2ddd6b1b2a5956da53a342f7a1742997425.jpg', '', '', '', '', 920774009, '2025-03-26 13:57:05'),
(55, 'yoesf', '1200X803', 'Potrait', 'Medium', 14, 16, 4, 6800, 'utgr', '416030f171fad81a9f1fae804836c4c41742997466.jpg', '', '', '', '', 595144188, '2025-03-26 13:57:46'),
(56, 'art', '2017X909', 'Potrait', 'Medium', 5, 6, 6, 9000, 'uknweing', '284b5ae15960b93772917a463ac5f3221742997662.jpg', '', '', '', '', 228657355, '2025-03-26 14:01:02'),
(57, 'tes', '2017X909', 'Potrait', 'Medium', 0, 6, 7, 9000, 'ohh', '658f96ee7db855cfe77aa9b4a3707df21742997692.jpg', '', '', '', '', 712165635, '2025-03-26 14:01:32'),
(58, 'tight', '2017X909', 'Potrait', 'Medium', 2, 6, 9, 9010, 'nonojoj', '57e52f960d52c95aeaff414a2df267c01742997741.jpg', '', '', '', '', 339231534, '2025-03-26 14:02:21'),
(59, 'iknow', '2017X909', 'Landscape', 'Medium', 3, 6, 3, 9010, 'usxhfs', '3a194ef500d31f73b6ae86aadb278bca1742997773.jpg', '', '', '', '', 140700061, '2025-03-26 14:02:53'),
(60, 'theso', '2017X909', 'Potrait', 'Medium', 4, 6, 11, 9010, 'ukkk', '5c00c622e2daed9c39346220f58cab491742997804.jpg', '', '', '', '', 697648196, '2025-03-26 14:03:24'),
(61, 'gugsj', '2017X909', 'Potrait', 'Small', 5, 4, 1, 9010, 'uyuixuhsx', 'c0bbc8add9430e082b53ef94130d298c1742998226.jpg', '', '', '', '', 370866988, '2025-03-26 14:10:26'),
(62, 'nature', '2017X909', 'Potrait', 'Medium', 7, 4, 10, 8000, 'ersw', '561a0569e0f30671936c713dfda5c6301742998275.jpg', '', '', '', '', 738077402, '2025-03-26 14:11:15'),
(63, 'nature', '2017X909', 'Potrait', 'Medium', 2, 4, 0, 8000, 'fcudtc', '2696f806ff7945ed2b8560fb9c41fb231742998344.jpg', '', '', '', '', 476663647, '2025-03-26 14:12:24'),
(64, 'inkoe', '2017X909', 'Potrait', 'Medium', 6, 4, 12, 8900, 'huwe', '300fd8a4467ef8fb572d0d7f35332c071742998388.jpg', '', '', '', '', 951062284, '2025-03-26 14:13:08'),
(65, 'box', '2017X909', 'Potrait', 'Medium', 2, 7, 3, 8900, 'under box', 'a26dd3baa5551c77dc99808ec2914adb1742998595.jpg', '', '', '', '', 257818301, '2025-03-26 14:16:35'),
(66, 'wide', '2017X909', 'Potrait', 'Medium', 3, 7, 0, 9010, 'hfgfdde', 'e92994941663de166fcd7dbebf3edab01742998723.jpg', '', '', '', '', 849387485, '2025-03-26 14:18:43'),
(67, 'tig', '2017X909', 'Potrait', 'Medium', 8, 11, 5, 9010, 'ytrrete', '4fbaa9ec0db984a921eb710d072215ac1742998981.jpg', '', '', '', '', 229003909, '2025-03-26 14:23:01'),
(68, 'asdAf', '2017X909', 'Potrait', 'Medium', 6, 11, 11, 6666, 'asty', '4fbaa9ec0db984a921eb710d072215ac1742999028.jpg', '', '', '', '', 450090920, '2025-03-26 14:23:48'),
(69, 'tytyu', '2017X909', 'Potrait', 'Small', 3, 13, 11, 8000, 'uiuyutu', '84f85699607a5c91169a27c735a808f81742999341.jpg', '', '', '', '', 580362604, '2025-03-26 14:29:01'),
(70, 'tight', '1200X803', 'Potrait', 'Small', 2, 13, 12, 9000, 'iytrwe', '77378b8d1b7b212b644f849518feb6651742999377.jpg', '', '', '', '', 561180805, '2025-03-26 14:29:37'),
(72, 'trew', '1200X803', 'Potrait', 'Medium', 11, 13, 10, 9010, 'restt', '3cb5c9c4bd2969d03d5bd43ea4b9ed581742999445.jpg', '', '', '', '', 379382214, '2025-03-26 14:30:45'),
(73, 'drew', '1200X803', 'Potrait', 'Medium', 14, 13, 1, 6700, 'rest', '2b91f881d05f06dfeecb8504c4da1af31742999483.jpg', '', '', '', '', 422472406, '2025-03-26 14:31:23'),
(77, 'nice', '1200X803', 'Potrait', 'Medium', 8, 13, 12, 6800, 'yok', '91900673700b4e1aea1dea1037c788e71742999769.jpg', '', '', '', '', 654590637, '2025-03-26 14:36:09'),
(78, 'ese', '1200X803', 'Potrait', 'Medium', 7, 13, 9, 8800, 'wde', 'ff553c14d1a2f7f453736b11c2eed2301742999811.jpg', '', '', '', '', 293396111, '2025-03-26 14:36:51'),
(79, 'home', '2017X909', 'Potrait', 'Medium', 1, 13, 5, 4500, 'not', 'a533ea8302a910f38e52e08ddd77b9dd1742999858.jpg', '', '', '', '', 771189186, '2025-03-26 14:37:38'),
(81, 'oky', '1200X803', 'Potrait', 'Medium', 3, 13, 9, 4500, 'yuo', 'f71a3edb97b1d4f47ed6b1cbc48dc60f1742999919.jpg', '', '', '', '', 837842895, '2025-03-26 14:38:39'),
(82, 'sae', '1200X803', 'Potrait', 'Medium', 11, 3, 7, 6500, 'fwwfwe', '2881f88f00da47fb6bad7dcce5c6c78b1743000702jpeg', '', '', '', '', 631244612, '2025-03-26 14:51:42'),
(83, 'scuo', '2017X909', 'Potrait', 'Medium', 1, 1, 0, 7500, 'syuoe', '3adb5aeee0e9b3ed4559a5c3fc5cff351743000740.jpg', '', '', '', '', 303269828, '2025-03-26 14:52:20'),
(84, 'life', '2017X909', 'Potrait', 'Medium', 14, 6, 8, 9500, 'frf', '7280350ac8a74ab3de2d58f49547c2ad1743000805.jpg', '', '', '', '', 863298682, '2025-03-26 14:53:25'),
(85, 'feeling', '2017X909', 'Potrait', 'Medium', 11, 3, 3, 9500, 'eqgergr', 'eef7af791ef29c8c3b2c94dd960c7fc61743000857.jpg', '', '', '', '', 826043396, '2025-03-26 14:54:17'),
(86, 'part', '2017X909', 'Potrait', 'Medium', 4, 6, 11, 9800, 'ejfwe', '91eca28abb9ba8f78d51bca2f539fbe01743000894.jpg', '', '', '', '', 783523859, '2025-03-26 14:54:54'),
(87, 'of', '2017X909', 'Potrait', 'Medium', 2, 4, 8, 5600, 'dreg', '17a56a1f5a668748f3b89255f4e176e21743001184.jpg', '', '', '', '', 772823026, '2025-03-26 14:59:44'),
(90, 'feqfq', '474X328', 'Potrait', 'Medium', 11, 4, 0, 9050, 'qwdwdw', '5b7b48a36da156b4f56608c31f645e141743001449.jpg', '', '', '', '', 234605935, '2025-03-26 15:04:09'),
(91, 'agwrgw', '474X328', 'Potrait', 'Medium', 8, 11, 10, 7000, 'vfwrgw', '5b7b48a36da156b4f56608c31f645e141743001554.jpg', '', '', '', '', 382609563, '2025-03-26 15:05:54'),
(92, 'wefwrgw', '474X328', 'Potrait', 'Medium', 5, 6, 8, 7000, 'egaegerg', 'bc7a0b2329be1329bc02d6e23dab43051743001611.jpg', '', '', '', '', 353154042, '2025-03-26 15:06:51'),
(93, 'op', '474X328', 'Potrait', 'Medium', 3, 6, 9, 7000, 'dcd', '71df28b20cbde6618130d756b79531a81743003176.jpg', '', '', '', '', 891285423, '2025-03-26 15:32:56'),
(94, 'sdsd', '2017X909', 'Potrait', 'Medium', 11, 15, 11, 6000, 'vsvvrwf', '3c4f8a1f12441615c9220ec58d9429921743003370.jpg', '', '', '', '', 808909811, '2025-03-26 15:36:10'),
(96, 're', '2017X909', 'Potrait', 'Medium', 0, 11, 7, 12000, 'ewew', '49c580e773c92d0677bfadce4c9ed0d81743003694.jpg', '', '', '', '', 462378137, '2025-03-26 15:41:34'),
(97, 'qewe', 'qq', 'Potrait', 'Medium', 1, 3, 2, 11000, 'efqefqf', '71df28b20cbde6618130d756b79531a81743003840.jpg', '', '', '', '', 802067292, '2025-03-26 15:44:00'),
(98, 'dfr', '2017X909', 'Potrait', 'Medium', 13, 11, 10, 6000, 'wefewf', '6687ce98ead95ee63ac2d4fc67d1e1761743004065.jpg', '', '', '', '', 800873955, '2025-03-26 15:47:45'),
(99, 'tese', '1200X803', 'Potrait', 'Medium', 5, 11, 11, 9000, 'regrff', '32462b8280dab5c5c907c7c3b4cfd8321743004108.jpg', '', '', '', '', 210492550, '2025-03-26 15:48:28'),
(100, 'trfwf', '2017X909', 'Potrait', 'Medium', 3, 11, 11, 7000, 'g5t3ref', '3b2d27b29e23e88e72acc1895298b81d1743004158.jpg', '', '', '', '', 342639107, '2025-03-26 15:49:18'),
(101, 'ewee', '1200X803', 'Potrait', 'Medium', 4, 11, 11, 6700, 'vevrvf', '3d29ae9239c0b4de4302d7362f3653011743004311.jpg', '', '', '', '', 585535475, '2025-03-26 15:51:51'),
(102, 'regrrere', '1200X803', 'Potrait', 'Medium', 7, 11, 10, 7700, 'revrevrvr', 'fad97274370500a9fdba2027d5ce88e21743004346.jpg', '', '', '', '', 263846625, '2025-03-26 15:52:26'),
(103, 'orrw', '2017X909', 'Potrait', 'Medium', 3, 3, 6, 7990, 'rfwrfwf', '752a4f00b91aed341ef66802963676dd1743004476.jpg', '', '', '', '', 872386432, '2025-03-26 15:54:36'),
(104, 'rewww', '1200X803', 'Potrait', 'Medium', 2, 3, 2, 7000, 'rtrtgtg', 'c49ec0464edb4374c5ee1ba567fae6491743004517.jpg', '', '', '', '', 799763577, '2025-03-26 15:55:17'),
(105, 'frgrere', '1200X803', 'Potrait', 'Medium', 5, 3, 10, 6000, 'rbrtbbt', 'be0a4b42f3152d9d88e15da7380154781743004654.jpg', '', '', '', '', 708957848, '2025-03-26 15:57:34'),
(106, 'wgrrrref', '2000X1336', 'Potrait', 'Medium', 7, 3, 12, 9000, 'regerf4f4', '255d95f04e6f66be31d5cb8e76e623a61743004690.jpg', '', '', '', '', 981549800, '2025-03-26 15:58:10'),
(107, 'rewqrtye', '474X328', 'Potrait', 'Medium', 1, 3, 11, 8000, 'wgeth53twef', '87c9967296bec1e72a7c9dd78050252f1743004762.jpg', '', '', '', '', 631067721, '2025-03-26 15:59:22'),
(108, 'oiuoi', '2017X909', 'Potrait', 'Medium', 6, 3, 11, 5000, 'y5g4324f', '121b4a41c90a67b4fa9d1135c17248651743004798.jpg', '', '', '', '', 924965706, '2025-03-26 15:59:58'),
(109, 'uyrutyt', '474X328', 'Potrait', 'Medium', 6, 3, 2, 4600, '4q3g3442', 'e82d453321fdf5e176d13153bedd49d31743004957.jpg', '', '', '', '', 321536222, '2025-03-26 16:02:37');

-- --------------------------------------------------------

--
-- Table structure for table `tblarttype`
--

CREATE TABLE `tblarttype` (
  `ID` int(5) NOT NULL,
  `ArtType` varchar(250) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblarttype`
--

INSERT INTO `tblarttype` (`ID`, `ArtType`, `CreationDate`) VALUES
(1, 'Sculptures', '2022-12-21 14:21:13'),
(2, 'Serigraphs', '2022-12-21 14:24:46'),
(3, 'Prints', '2022-12-21 14:25:00'),
(4, 'Painting', '2022-12-21 14:25:31'),
(5, 'Street Art', '2022-12-21 14:26:06'),
(6, 'Visual art ', '2022-12-21 14:26:29'),
(7, 'Conceptual art', '2022-12-21 14:26:45'),
(10, 'expressionism art', '2025-03-26 07:02:16'),
(11, 'Fauvism ', '2025-03-26 07:04:34'),
(12, 'Tradition art', '2025-03-26 07:06:59'),
(13, 'Pencil art', '2025-03-26 07:08:06'),
(14, 'Contemproray art', '2025-03-26 07:16:16'),
(15, 'sad', '2025-03-26 12:37:21'),
(16, 'nature', '2025-03-26 12:41:52');

-- --------------------------------------------------------

--
-- Table structure for table `tblenquiry`
--

CREATE TABLE `tblenquiry` (
  `ID` int(10) NOT NULL,
  `EnquiryNumber` varchar(10) NOT NULL,
  `Artpdid` int(9) DEFAULT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `Email` varchar(250) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Message` varchar(250) DEFAULT NULL,
  `EnquiryDate` timestamp NULL DEFAULT current_timestamp(),
  `Status` varchar(10) DEFAULT NULL,
  `AdminRemark` varchar(200) NOT NULL,
  `AdminRemarkdate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblenquiry`
--

INSERT INTO `tblenquiry` (`ID`, `EnquiryNumber`, `Artpdid`, `FullName`, `Email`, `MobileNumber`, `Message`, `EnquiryDate`, `Status`, `AdminRemark`, `AdminRemarkdate`) VALUES
(1, '230873611', 4, 'Anuj kumar', 'ak@test.com', 1234567890, 'This is for testing Purpose.', '2023-01-02 18:16:47', 'Answer', 'test purpose', '2023-01-01 18:30:00'),
(2, '227883179', 5, 'Amit Kumar', 'amitk55@test.com', 1234434321, 'I want this painting', '2023-01-02 18:42:42', 'Answer', 'testing purpose', '2023-01-02 18:43:16'),
(3, '773616302', 3, 'sajna ', 'sajanshr10224@gmail.com', 1232132131, 'price', '2025-03-25 04:49:58', 'Answer', '123123123', '2025-03-25 04:50:20'),
(4, '653270209', 5, 'dsafsad', 'sajanshr10224@gmail.com', 123123123, '12321312321', '2025-03-25 04:51:45', 'Answer', '213123123', '2025-03-25 04:52:08'),
(5, '161810618', 5, 'smil', 'sajanshr10224@gmail.com', 7655846565, 'gfjgfgdfjgdf', '2025-03-25 19:41:10', 'Answer', '45674567', '2025-03-25 19:58:39'),
(6, '985758903', 3, 'babita', 'babitabhujel862@gmail.com', 8765432545, 'ye chaiye  mujhe', '2025-03-25 20:32:49', 'Answer', 'oky contact no', '2025-03-25 20:33:27'),
(7, '602311398', 2, 'sumina', 'suminakhatri6@gmail.com', 9843065753, 'hello', '2025-03-25 20:34:38', 'Answer', 'what can i do for you', '2025-03-25 20:35:10'),
(8, '913798071', 4, 'tashi', 'sherpan9988@gmail.com', 8786543423, 'can i have this detail information', '2025-03-26 05:02:28', 'Answer', 'sure', '2025-03-26 05:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` date DEFAULT NULL,
  `Timing` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`, `Timing`) VALUES
(1, 'aboutus', 'About Us', '<span style=\"color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px;\">An art gallery is&nbsp;</span><b style=\"color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px;\">an exhibition space to display and sell artworks</b><span style=\"color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px;\">. As a result, the art gallery is a commercial enterprise working with a portfolio of artists. The gallery acts as the dealer representing, supporting, and distributing the artworks by the artists in question.</span><br>', NULL, NULL, NULL, ''),
(2, 'contactus', 'Contact Us', 'bagmati,kathmandu,', 'info@gmail.com', 1234567890, NULL, '10:30 am to 7:30 pm');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `ID` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `order_status` varchar(50) DEFAULT 'Pending',
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `menu_item` text NOT NULL,
  `payment_status` enum('Pending','Completed','Failed') DEFAULT 'Pending',
  `time_of_day` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_orders`
--

INSERT INTO `tbl_orders` (`ID`, `product_id`, `fullname`, `email`, `contact_number`, `address`, `city`, `zip`, `order_status`, `order_date`, `total_price`, `quantity`, `menu_item`, `payment_status`, `time_of_day`) VALUES
(1, 16, 'sajan ', 'sdaf@gmail.com', '123', 'klsadjf', 'laskdjf', 'saldkfj', 'Pending', '2025-03-26 23:01:57', 0.00, 0, '', 'Pending', '00:00:00'),
(2, 16, 'sinja commerce pvt. ltd', 'asdasdas@gmail.com', '9802326262', 'Kathmandu', 'Kathmandu', '44600', 'Pending', '2025-03-26 23:35:28', 0.00, 0, '', 'Pending', '00:00:00'),
(3, 16, 'sinja commerce pvt. ltd', 'asdasdas@gmail.com', '9802326262', 'Kathmandu', 'Kathmandu', '44600', 'Pending', '2025-03-26 23:36:16', 0.00, 0, '', 'Pending', '00:00:00'),
(4, 6, 'sinja commerce pvt. ltd', 'sajanshr10224@gmail.com', '9802326262', 'Kathmandu', 'Kathmandu', '44600', 'Pending', '2025-03-27 11:13:22', 0.00, 0, '', 'Pending', '00:00:00'),
(5, 5, 'sinja commerce pvt. ltd', 'onlinenewssite@admin.com', '9802326262', 'Kathmandu', 'Kathmandu', '44600', 'Pending', '2025-03-27 10:20:45', 200.00, 1, '', '', '16:05:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblartist`
--
ALTER TABLE `tblartist`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblartmedium`
--
ALTER TABLE `tblartmedium`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblartproduct`
--
ALTER TABLE `tblartproduct`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblarttype`
--
ALTER TABLE `tblarttype`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblenquiry`
--
ALTER TABLE `tblenquiry`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CardId` (`Artpdid`);

--
-- Indexes for table `tblpage`
--
ALTER TABLE `tblpage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblartist`
--
ALTER TABLE `tblartist`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblartmedium`
--
ALTER TABLE `tblartmedium`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblartproduct`
--
ALTER TABLE `tblartproduct`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `tblarttype`
--
ALTER TABLE `tblarttype`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblenquiry`
--
ALTER TABLE `tblenquiry`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblpage`
--
ALTER TABLE `tblpage`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tbl_orders` (`ID`);

--
-- Constraints for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD CONSTRAINT `tbl_orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tblartproduct` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
