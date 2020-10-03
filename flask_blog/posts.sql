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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `tagline` varchar(30) NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(30) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`sno`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'Let\'s Learn About Stock Market', 'What is Stock', 'first-post', 'Stock (also capital stock) of a corporation, is all of the shares into which ownership of the corporation is divided.[1] In American English, the shares are collectively known as \"stock\".[1] A single share of the stock represents fractional ownership of the corporation in proportion to the total number of shares. This typically entitles the stockholder to that fraction of the company\'s earnings, proceeds from liquidation of assets (after discharge of all senior claims such as secured and unsecured debt),[2] or voting power, often dividing these up in proportion to the amount of money each stockholder has invested. Not all stock is necessarily equal, as certain classes of stock may be issued for example without voting rights, with enhanced voting rights, or with a certain priority to receive profits or liquidation proceeds before or after other classes of shareholders.', 'post-sample-image.jpg', '2020-09-01 11:12:35'),
(2, 'Let\'s Learn About Variables in PL', 'What is Variables?', 'variables-intro', 'In computer programming, a variable or scalar is a storage location (identified by a memory address) paired with an associated symbolic name, which contains some known or unknown quantity of information referred to as a value. The variable name is the usual way to reference the stored value, in addition to referring to the variable itself, depending on the context. This separation of name and content allows the name to be used independently of the exact information it represents. The identifier in computer source code can be bound to a value during run time, and the value of the variable may thus change during the course of program execution.', 'img2.jpeg', '2020-09-01 11:04:27'),
(3, 'Let\'s Learn About Static Variables', 'What is Static Variables?', 'static-var-intro', 'In computer programming, a static variable is a variable that has been allocated \"statically\", meaning that its lifetime (or \"extent\") is the entire run of the program. This is in contrast to shorter-lived automatic variables, whose storage is stack allocated and deallocated on the call stack; and in contrast to objects, whose storage is dynamically allocated and deallocated in heap memory.', 'img3.jpeg', '2020-09-01 11:07:39'),
(4, 'Let\'s Disccuss About our Fitness', 'How become Fit?', 'fitness-blog-1', 'Most of us are well aware of the many health benefits of exercise, but finding the discipline to not only start training but to also stick with it is often the hard part.\r\n\r\nWhether you’re at the beginning of your fitness journey or in desperate need of some motivation to keep going, you’ll find it on these blogs — and in their educational, inspirational, and empowering content.\r\n\r\nGet ready to sweat!', 'img4.jpeg', '2020-09-01 11:07:21'),
(5, 'Let\'s Plan a Travel Trip for Summer Vacation', 'How to Plan Successfull Trip?', 'travel-blog-1', 'A couple of years back, the van life craze had everyone curious about rubber-tramping across North America. Maybe you thought, nah, I prefer my city apartment or jet-setting abroad.\r\n\r\nThen COVID-19 hit. All of a sudden, getting out of Dodge with a house on wheels started to sound really good, didn’t it?\r\n\r\nThere is no doubt that RVing is one of the easiest and safest ways to travel right now. No crowded planes or questionable hotel rooms required — an RV gives you the freedom to explore and the peace of mind of having your own space.\r\n\r\nOver the course of our eight-year “HoneyTrek” we’ve tried virtually every style of travel — backpacking, house-sitting, small-ship cruising, backcountry camping, five-star honeymooning, etc. — but the day we rented a campervan in New Zealand, we knew this was our preferred mode of travel.\r\n\r\nFor the past three years, we’ve been traveling full-time in our 1985 Toyota Sunrader “Buddy the Camper,” from the Baja Peninsula to the Arctic Circle and 47 states in between.\r\n\r\nWe’ve learned a lot along the way and are excited to share what we think are the most important things to know before setting out on your RV journey.\r\n\r\nHere’s a video we just filmed which covers all the basics (or read the post below):\r\nHow to Pick the Right Size RV\r\nFor maximum adventure and comfort, we’d recommend a camper around 21 feet long. We know those big RVs tricked out like a penthouse apartment look tempting, but remember that every foot in length costs mobility. A shorter rig allows you to:\r\n\r\nAccess rugged terrain\r\nFit in a normal parking space, even parallel park\r\nAvoid length restrictions on some of America’s most beautiful winding roads and ferry rides\r\nGet better gas mileage (Most rigs get 6–10 MPG. Ours gets 19.)\r\nHave less stuff to break, which means more time exploring and having fun!\r\nAnd, while even shorter 16- to 19-foot-long campervans do have the ultimate mobility, there are a few things you should know before you fall for that adorable Westfalia or stealthy Sprinter.', 'img5.jpeg', '2020-09-01 11:08:06'),
(6, 'Learn About Automation Technology which is in Trending Now.', 'How Automation Works?', 'automation-blog', 'Automation, or labor-saving technology is the technology by which a process or procedure is performed with minimal human assistance.[1] Automation[2] or automatic control is the use of various control systems for operating equipment such as machinery, processes in factories, boilers and heat treating ovens, switching on telephone networks, steering and stabilization of ships, aircraft and other applications and vehicles with minimal or reduced human intervention.\r\n\r\nAutomation covers applications ranging from a household thermostat controlling a boiler, to a large industrial control system with tens of thousands of input measurements and output control signals. In control complexity, it can range from simple on-off control to multi-variable high-level algorithms.\r\n\r\nIn the simplest type of an automatic control loop, a controller compares a measured value of a process with a desired set value, and processes the resulting error signal to change some input to the process, in such a way that the process stays at its set point despite disturbances. This closed-loop control is an application of negative feedback to a system. The mathematical basis of control theory was begun in the 18th century and advanced rapidly in the 20th.\r\n\r\nAutomation has been achieved by various means including mechanical, hydraulic, pneumatic, electrical, electronic devices and computers, usually in combination. Complicated systems, such as modern factories, airplanes and ships typically use all these combined techniques. The benefit of automation includes labor savings, savings in electricity costs, savings in material costs, and improvements to quality, accuracy, and precision.\r\n\r\nThe World Bank\'s World Development Report 2019 shows evidence that the new industries and jobs in the technology sector outweigh the economic effects of workers being displaced by automation.[3]\r\n\r\nJob losses and downward mobility blamed on Automation has been cited as one of many factors in the resurgence of nationalist, protectionist and populist politics in the US, UK and France, among other countries since the 2010s.[4][5][6][7][8]\r\n\r\nThe term automation, inspired by the earlier word automatic (coming from automaton), was not widely used before 1947, when Ford established an automation department.[2] It was during this time that industry was rapidly adopting feedback controllers, which were introduced in the 1930s.', 'img6.jpeg', '2020-09-01 11:08:28'),
(7, 'Lean Wordpress Technology and it\'s use', 'What is Wordpress?', 'about-wordpress', 'WordPress (WP, WordPress.org) is a free and open-source content management system (CMS) written in PHP[4] and paired with a MySQL or MariaDB database. Features include a plugin architecture and a template system, referred to within WordPress as Themes. WordPress was originally created as a blog-publishing system but has evolved to support other types of web content including more traditional mailing lists and forums, media galleries, membership sites, learning management systems (LMS) and online stores. WordPress is used by more than 60 million websites,[5] including 33.6% of the top 10 million websites as of April 2019,[6][7] WordPress is one of the most popular content management system solutions in use.[8] WordPress has also been used for other application domains such as pervasive display systems (PDS).[9]\r\n\r\nWordPress was released on May 27, 2003, by its founders, American developer Matt Mullenweg[1] and English developer Mike Little,[10][11] as a fork of b2/cafelog. The software is released under the GPLv2 (or later) license.[12]\r\n\r\nTo function, WordPress has to be installed on a web server, either part of an Internet hosting service like WordPress.com or a computer running the software package WordPress.org in order to serve as a network host in its own right.[13] A local computer may be used for single-user testing and learning purposes.', 'img7.jpeg', '2020-09-01 11:08:44'),
(8, 'List Comprehension, Dictionary Comprehension and Generator Comprehension', 'Python one-liners', 'python-one-liner', 'Here we add our Comprehension Details.', 'img9.jpeg', '2020-09-01 11:09:04');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
