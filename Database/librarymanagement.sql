-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2020 at 06:49 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `librarymanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `author` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `publisher` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `isAvail` tinyint(1) DEFAULT 1,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `title`, `author`, `publisher`, `isAvail`, `price`) VALUES
(1, 'a', 'fdgfdfdg', 'đfgdfsg', 0, 12.45),
(2, 'b', 'gdfsgd', 'dfgdfs', 0, 23.45);

-- --------------------------------------------------------

--
-- Table structure for table `issue`
--

CREATE TABLE `issue` (
  `bookID` int(11) NOT NULL,
  `memberID` int(11) DEFAULT NULL,
  `issueTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `renew_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `issue`
--

INSERT INTO `issue` (`bookID`, `memberID`, `issueTime`, `renew_count`) VALUES
(1, 1, '2020-08-17 18:09:49', 0),
(2, 2, '2020-08-17 18:48:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mail_server_info`
--

CREATE TABLE `mail_server_info` (
  `server_name` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `server_port` int(11) DEFAULT NULL,
  `user_email` varchar(1024) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `user_password` varchar(1024) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `ssl_enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `mail_server_info`
--

INSERT INTO `mail_server_info` (`server_name`, `server_port`, `user_email`, `user_password`, `ssl_enabled`) VALUES
('smtp.gmail.com', 587, 'cuavip1999@gmail.com', 'matkhaumoi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `password`, `name`, `mobile`, `email`, `position`) VALUES
(1, 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Nguyễn Văn Bách', '0333148314', 'nguyenvanbach579@gmail.com', 1),
(2, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'nv1', '1234564', 'vsdafdsgfd', 2),
(3, NULL, 'member1', 'fsgdfgdfs', 'fdgdsfg', 3),
(4, '6c7ca345f63f835cb353ff15bd6c5e052ec08e7a', 'Trần Quang Vũ', '0903 476 171', 'vu.tran171@gmail.com', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issue`
--
ALTER TABLE `issue`
  ADD PRIMARY KEY (`bookID`),
  ADD KEY `memberID` (`memberID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `issue`
--
ALTER TABLE `issue`
  ADD CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`bookID`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `issue_ibfk_2` FOREIGN KEY (`memberID`) REFERENCES `member` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
