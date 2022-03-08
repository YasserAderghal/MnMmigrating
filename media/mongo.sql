-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 11, 2022 at 07:33 PM
-- Server version: 8.0.28-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mongo`
--

-- --------------------------------------------------------

--
-- Table structure for table `abc`
--

CREATE TABLE `abc` (
  `id` int NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `abc`
--

INSERT INTO `abc` (`id`, `name`) VALUES
(1, 'yasser'),
(2, 'yassdfdsser'),
(3, 'zefzefr'),
(4, 'aaaazefr');

-- --------------------------------------------------------

--
-- Table structure for table `abcd`
--

CREATE TABLE `abcd` (
  `id` int NOT NULL,
  `name_id` int DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `abcd`
--

INSERT INTO `abcd` (`id`, `name_id`, `lastname`) VALUES
(1, 1, 'fgegerg'),
(2, 1, 'fzefgegerg'),
(3, 2, 'jklkjl'),
(4, 2, 'zgzrgf');

-- --------------------------------------------------------

--
-- Table structure for table `descr`
--

CREATE TABLE `descr` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `description` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `descr`
--

INSERT INTO `descr` (`id`, `user_id`, `description`) VALUES
(1, 2, 'zgzrgffsdv'),
(2, 1, 'sddszgzrgffsdv'),
(3, 1, 'sddsjyj'),
(4, 1, 'sddsjyjgergerg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abc`
--
ALTER TABLE `abc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `abcd`
--
ALTER TABLE `abcd`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name_id` (`name_id`);

--
-- Indexes for table `descr`
--
ALTER TABLE `descr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abcd`
--
ALTER TABLE `abcd`
  ADD CONSTRAINT `abcd_ibfk_1` FOREIGN KEY (`name_id`) REFERENCES `abc` (`id`);

--
-- Constraints for table `descr`
--
ALTER TABLE `descr`
  ADD CONSTRAINT `descr_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `abc` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
