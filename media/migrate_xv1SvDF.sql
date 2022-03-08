-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 12, 2022 at 06:10 PM
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
-- Database: `migrate`
--

-- --------------------------------------------------------

--
-- Table structure for table `etudiant`
--

CREATE TABLE `etudiant` (
  `code` int NOT NULL,
  `numero` int DEFAULT NULL,
  `nom` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `etudiant`
--

INSERT INTO `etudiant` (`code`, `numero`, `nom`) VALUES
(0, 22, 'Etudiant 0'),
(1, 21, 'Etudiant 1'),
(2, 27, 'Etudiant 2'),
(3, 14, 'Etudiant 3'),
(4, 37, 'Etudiant 4'),
(5, 19, 'Etudiant 5'),
(6, 22, 'Etudiant 6'),
(7, 26, 'Etudiant 7'),
(8, 28, 'Etudiant 8'),
(9, 12, 'Etudiant 9'),
(10, 42, 'Etudiant 10'),
(11, 31, 'Etudiant 11'),
(12, 28, 'Etudiant 12'),
(13, 20, 'Etudiant 13'),
(14, 46, 'Etudiant 14'),
(15, 10, 'Etudiant 15'),
(16, 6, 'Etudiant 16'),
(17, 14, 'Etudiant 17'),
(18, 8, 'Etudiant 18'),
(19, 20, 'Etudiant 19'),
(20, 19, 'Etudiant 20'),
(21, 14, 'Etudiant 21'),
(22, 27, 'Etudiant 22'),
(23, 5, 'Etudiant 23'),
(24, 23, 'Etudiant 24'),
(25, 24, 'Etudiant 25'),
(26, 25, 'Etudiant 26'),
(27, 3, 'Etudiant 27'),
(28, 10, 'Etudiant 28'),
(29, 0, 'Etudiant 29'),
(30, 48, 'Etudiant 30'),
(31, 15, 'Etudiant 31'),
(32, 11, 'Etudiant 32'),
(33, 38, 'Etudiant 33'),
(34, 35, 'Etudiant 34'),
(35, 8, 'Etudiant 35'),
(36, 50, 'Etudiant 36'),
(37, 14, 'Etudiant 37'),
(38, 41, 'Etudiant 38'),
(39, 6, 'Etudiant 39'),
(40, 33, 'Etudiant 40'),
(41, 28, 'Etudiant 41'),
(42, 47, 'Etudiant 42'),
(43, 16, 'Etudiant 43'),
(44, 12, 'Etudiant 44'),
(45, 26, 'Etudiant 45'),
(46, 39, 'Etudiant 46'),
(47, 47, 'Etudiant 47'),
(48, 26, 'Etudiant 48'),
(49, 12, 'Etudiant 49'),
(50, 16, 'Etudiant 50'),
(51, 12, 'Etudiant 51'),
(52, 24, 'Etudiant 52'),
(53, 26, 'Etudiant 53'),
(54, 1, 'Etudiant 54'),
(55, 5, 'Etudiant 55'),
(56, 16, 'Etudiant 56'),
(57, 12, 'Etudiant 57'),
(58, 39, 'Etudiant 58'),
(59, 45, 'Etudiant 59'),
(60, 11, 'Etudiant 60'),
(61, 0, 'Etudiant 61'),
(62, 28, 'Etudiant 62'),
(63, 42, 'Etudiant 63'),
(64, 35, 'Etudiant 64'),
(65, 9, 'Etudiant 65'),
(66, 23, 'Etudiant 66'),
(67, 30, 'Etudiant 67'),
(68, 12, 'Etudiant 68'),
(69, 26, 'Etudiant 69'),
(70, 49, 'Etudiant 70'),
(71, 19, 'Etudiant 71'),
(72, 7, 'Etudiant 72'),
(73, 3, 'Etudiant 73'),
(74, 3, 'Etudiant 74'),
(75, 44, 'Etudiant 75'),
(76, 22, 'Etudiant 76'),
(77, 7, 'Etudiant 77'),
(78, 0, 'Etudiant 78'),
(79, 39, 'Etudiant 79'),
(80, 46, 'Etudiant 80'),
(81, 30, 'Etudiant 81'),
(82, 3, 'Etudiant 82'),
(83, 36, 'Etudiant 83'),
(84, 24, 'Etudiant 84'),
(85, 10, 'Etudiant 85'),
(86, 44, 'Etudiant 86'),
(87, 10, 'Etudiant 87'),
(88, 34, 'Etudiant 88'),
(89, 14, 'Etudiant 89'),
(90, 3, 'Etudiant 90'),
(91, 26, 'Etudiant 91'),
(92, 16, 'Etudiant 92'),
(93, 11, 'Etudiant 93'),
(94, 9, 'Etudiant 94'),
(95, 4, 'Etudiant 95'),
(96, 27, 'Etudiant 96'),
(97, 32, 'Etudiant 97'),
(98, 14, 'Etudiant 98'),
(99, 44, 'Etudiant 99'),
(100, 2, 'Module 100');

-- --------------------------------------------------------

--
-- Table structure for table `filiere`
--

CREATE TABLE `filiere` (
  `numero` int NOT NULL,
  `libelle` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `filiere`
--

INSERT INTO `filiere` (`numero`, `libelle`) VALUES
(0, 'Module 0'),
(1, 'Module 1'),
(2, 'Module 2'),
(3, 'Module 3'),
(4, 'Module 4'),
(5, 'Module 5'),
(6, 'Module 6'),
(7, 'Module 7'),
(8, 'Module 8'),
(9, 'Module 9'),
(10, 'Module 10'),
(11, 'Module 11'),
(12, 'Module 12'),
(13, 'Module 13'),
(14, 'Module 14'),
(15, 'Module 15'),
(16, 'Module 16'),
(17, 'Module 17'),
(18, 'Module 18'),
(19, 'Module 19'),
(20, 'Module 20'),
(21, 'Module 21'),
(22, 'Module 22'),
(23, 'Module 23'),
(24, 'Module 24'),
(25, 'Module 25'),
(26, 'Module 26'),
(27, 'Module 27'),
(28, 'Module 28'),
(29, 'Module 29'),
(30, 'Module 30'),
(31, 'Module 31'),
(32, 'Module 32'),
(33, 'Module 33'),
(34, 'Module 34'),
(35, 'Module 35'),
(36, 'Module 36'),
(37, 'Module 37'),
(38, 'Module 38'),
(39, 'Module 39'),
(40, 'Module 40'),
(41, 'Module 41'),
(42, 'Module 42'),
(43, 'Module 43'),
(44, 'Module 44'),
(45, 'Module 45'),
(46, 'Module 46'),
(47, 'Module 47'),
(48, 'Module 48'),
(49, 'Module 49'),
(50, 'Module 50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`code`),
  ADD KEY `numero` (`numero`);

--
-- Indexes for table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`numero`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`numero`) REFERENCES `filiere` (`numero`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
