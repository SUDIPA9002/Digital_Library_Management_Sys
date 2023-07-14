-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 18, 2023 at 02:25 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookpic` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bookname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bookdetail` varchar(110) NOT NULL,
  `bookauthor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bookpub` varchar(25) NOT NULL,
  `branch` varchar(110) NOT NULL,
  `bookprice` varchar(25) NOT NULL,
  `bookquantity` int NOT NULL,
  `bookava` int NOT NULL,
  `bookrent` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `bookpic`, `bookname`, `bookdetail`, `bookauthor`, `bookpub`, `branch`, `bookprice`, `bookquantity`, `bookava`, `bookrent`) VALUES
(7, 'elctrical4.jpg', 'Power System Engineering ', 'Power System', 'D. P. Kothari;I. J. Nagra', 'Paperback-26', 'B.Tech', '710', 100, 99, 1),
(8, 'Practical Microbiology for MBBS.jpg', 'Practical Micobiology for MBBS ', 'Practical Micobiology for MBBS has been Written as per the Revised Competency Based NMC (MCI) Practical Curric', 'Dr C P Baveja', 'Paperback-1', 'MBBS', '450', 50, 49, 1),
(9, 'TEXTBOOK OF PATHOLOGY.jpg', 'TEXTBOOK OF PATHOLOGY', 'The book is written in a simple and lucid language which makes the book student-friendly. The topics in the bo', ' A K Mandal, Sharmana Choudhary', 'Paperback – 1', 'MBBS', '1800', 50, 50, 0);

-- --------------------------------------------------------

--
-- Table structure for table `issuebook`
--

DROP TABLE IF EXISTS `issuebook`;
CREATE TABLE IF NOT EXISTS `issuebook` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `issuename` varchar(25) NOT NULL,
  `issuebook` varchar(50) NOT NULL,
  `issuetype` varchar(25) NOT NULL,
  `issuedays` int NOT NULL,
  `issuedate` varchar(25) NOT NULL,
  `issuereturn` varchar(25) NOT NULL,
  `fine` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_fk` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `issuebook`
--

INSERT INTO `issuebook` (`id`, `userid`, `issuename`, `issuebook`, `issuetype`, `issuedays`, `issuedate`, `issuereturn`, `fine`) VALUES
(12, 7, 'Simran Islam', 'Power System Engineering ', 'B.Tech Student', 3, '18/05/2023', '21/05/2023', 0),
(13, 8, 'Sudeshna Sanyal', 'Practical Micobiology for', 'MBBS Student', 5, '18/05/2023', '23/05/2023', 0);

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

DROP TABLE IF EXISTS `librarian`;
CREATE TABLE IF NOT EXISTS `librarian` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(25) NOT NULL,
  `pass` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`id`, `email`, `pass`) VALUES
(1, 'idno22381@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `requestbook`
--

DROP TABLE IF EXISTS `requestbook`;
CREATE TABLE IF NOT EXISTS `requestbook` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `bookid` int NOT NULL,
  `username` varchar(25) NOT NULL,
  `usertype` varchar(25) NOT NULL,
  `bookname` varchar(50) NOT NULL,
  `issuedays` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_fk_book` (`bookid`),
  KEY `pk_fk_users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

DROP TABLE IF EXISTS `userdata`;
CREATE TABLE IF NOT EXISTS `userdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `pass` varchar(25) NOT NULL,
  `type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`id`, `name`, `email`, `pass`, `type`) VALUES
(1, 'Sudipa ', 'idno22382@gmail.com', '123', 'B.Tech Student'),
(2, 'Randal Biswas', 'voqo@mailinator.com', 'Ratione nulla dolore', 'Teacher'),
(5, 'Sheuli Koner', 'sheuli456@gmail.com', '456', 'Teacher'),
(6, 'Juniad Masad', 'juniad456@gmail.com', '456', 'B.Sc Student'),
(7, 'Simran Islam', 'simran098@gmail.com', '098', 'B.Tech Student'),
(8, 'Sudeshna Sanyal', 'sudeshna@gmail.com', '12345', 'MBBS Student'),
(9, 'Subhadip Ghosh', 'subha@gmail.com', '123', 'MA Student');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `issuebook`
--
ALTER TABLE `issuebook`
  ADD CONSTRAINT `pk_fk` FOREIGN KEY (`userid`) REFERENCES `userdata` (`id`);

--
-- Constraints for table `requestbook`
--
ALTER TABLE `requestbook`
  ADD CONSTRAINT `pk_fk_users` FOREIGN KEY (`userid`) REFERENCES `userdata` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
