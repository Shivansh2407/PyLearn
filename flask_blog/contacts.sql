-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 01, 2020 at 07:48 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(1, 'first', '9999999999', 'first Message Testing...!!!', '2020-08-31 11:13:58', 'first@gmail.com'),
(2, 'harry', '123456789', 'hello Message..!!!', '2020-08-31 13:15:43', 'harry@gmail.com'),
(3, 'harry', '123456789', 'message me.!!!!', '2020-08-31 13:21:12', 'hary@gmail.com'),
(4, 'abhi', '8987685612', 'I\'m Abhi. I\'ve Seen your Blog and implement it but i\'m getting some errors.\r\nPlease send me your Contact information so i can share my errors or contact me on : \r\n+918987685612\r\n\r\nThank you !\r\ni hope you\'ll reply me as soon as you read this.\r\n\r\nYour BlogViewer,\r\nAbhi Goyani', '2020-08-31 13:26:47', 'abhi@gmail.com'),
(5, 'abhi', '8987685612', 'I\'m Abhi. I\'ve Seen your Blog and implement it but i\'m getting some errors.\r\nPlease send me your Contact information so i can share my errors or contact me on :\r\n+918987685612\r\n\r\nThank you !\r\ni hope you\'ll reply me as soon as you read this.\r\n\r\nYour BlogViewer,\r\nAbhi Goyani', '2020-08-31 13:30:23', 'abhi@gmail.com'),
(6, 'abhi', '8987685612', 'I\'m Abhi. I\'ve Seen your Blog and implement it but i\'m getting some errors.\r\nPlease send me your Contact information so i can share my errors or contact me on : \r\n+918987685612\r\n\r\nThank you !\r\ni hope you\'ll reply me as soon as you read this.\r\n\r\nYour BlogViewer,\r\nAbhi Goyani', '2020-08-31 13:30:54', 'abhi@gmail.com'),
(7, 'harry', '123456789', 'message me.!!!!', '2020-08-31 13:31:13', 'hary@gmail.com'),
(8, 'harry', '1234567889', '12345', '2020-08-31 13:31:57', 'hary@gmail.com'),
(9, 'harry', '1234567889', '12345', '2020-08-31 13:33:00', 'hary@gmail.com'),
(10, 'testing', '1237761209', 'testing is mail sent or not?', '2020-08-31 13:35:20', 'test@gmail.com'),
(11, 'testing', '1234567889', 'testing mail sent or not?\r\n', '2020-08-31 13:36:07', 'test@gmail.com'),
(12, 'harry', '1234567889', '1234', '2020-08-31 13:36:33', 'hary@gmail.com'),
(13, 'harry', '1234567889', '1234', '2020-08-31 13:36:51', 'hary@gmail.com'),
(14, 'DK', '6865458796', 'encesdnec hiwena  uuwe bwce ubudb', '2020-08-31 13:38:48', 'mail@gmail.com'),
(15, 'testing', '1237761209', 'tesing message for sending mail to my original account', '2020-08-31 13:40:11', 'hary@gmail.com');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
