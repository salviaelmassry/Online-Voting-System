-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2017 at 10:21 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `campusvoters`
--

-- --------------------------------------------------------

--
-- Table structure for table `Answer`
--

CREATE TABLE IF NOT EXISTS `Answer` (
  `answerId` int NOT NULL,
  `answer` text NOT NULL,
  `pollId` int NOT NULL,
  `sectionId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Building`
--

CREATE TABLE IF NOT EXISTS `Building` (
  `buildingNum` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CampusMember`
--

CREATE TABLE IF NOT EXISTS `CampusMember` (
  `id` int NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` char NOT NULL,
  `email` varchar(50) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `address` text NOT NULL,
  `availableRewards` int NOT NULL,
  `facultyName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `User_commentsOn_Poll`
--

CREATE TABLE IF NOT EXISTS `User_commentsOn_Poll` (
  `username` varchar(40) NOT NULL,
  `pollId` int NOT NULL,
  `comment` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE IF NOT EXISTS `Department` (
  `name` varchar(100) NOT NULL,
  `facultyName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE IF NOT EXISTS `Faculty` (
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Building_has_Faculty`
--

CREATE TABLE IF NOT EXISTS `Building_has_Faculty` (
  `name` varchar(100) NOT NULL,
  `buildingNum` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE IF NOT EXISTS `phone` (
  `phone` varchar(20) NOT NULL,
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Poll`
--

CREATE TABLE IF NOT EXISTS `Poll` (
  `pollId` int NOT NULL,
  `dateCreated` date NOT NULL,
  `endDate` date NOT NULL,
  `type` text NOT NULL,
  `description` text NOT NULL,
  `title` text NOT NULL,
  `username` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Poll_regarding_Building`
--

CREATE TABLE IF NOT EXISTS `Poll_regarding_Building` (
  `pollId` int NOT NULL,
  `buildingNum` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Room`
--

CREATE TABLE IF NOT EXISTS `Room` (
  `roomNum` int NOT NULL,
  `buildingNum` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Section`
--

CREATE TABLE IF NOT EXISTS `Section` (
  `sectionId` int NOT NULL,
  `pollId` int NOT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `username` varchar(40) NOT NULL,
  `gender` char NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(256) NOT NULL,
  `points` int NOT NULL,
  `facultyName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `User_votesOn_Section`
--

CREATE TABLE IF NOT EXISTS `User_votesOn_Section` (
  `username` varchar(40) NOT NULL,
  `sectionId` int NOT NULL,
  `pollId` int NOT NULL,
  `answerId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Answer`
--
ALTER TABLE `Answer`
 ADD PRIMARY KEY (`answerId`,`pollId`,`sectionId`), ADD KEY `pollId` (`pollId`), ADD KEY `sectionId` (`sectionId`);

--
-- Indexes for table `Building`
--
ALTER TABLE `Building`
 ADD PRIMARY KEY (`buildingNum`);

--
-- Indexes for table `CampusMember`
--
ALTER TABLE `CampusMember`
 ADD PRIMARY KEY (`id`), ADD KEY `facultyName` (`facultyName`);

--
-- Indexes for table `User_commentsOn_Poll`
--
ALTER TABLE `User_commentsOn_Poll`
 ADD PRIMARY KEY (`pollId`,`username`), ADD KEY `username` (`username`,`pollId`);

--
-- Indexes for table `Department`
--
ALTER TABLE `Department`
 ADD PRIMARY KEY (`name`,`facultyName`), ADD KEY `facultyName` (`facultyName`);

--
-- Indexes for table `Faculty`
--
ALTER TABLE `Faculty`
 ADD PRIMARY KEY (`name`);

--
-- Indexes for table `Building_has_Faculty`
--
ALTER TABLE `Building_has_Faculty`
 ADD PRIMARY KEY (`name`,`buildingNum`), ADD KEY `name` (`name`), ADD KEY `buildingNum` (`buildingNum`);

--
-- Indexes for table `phone`
--
ALTER TABLE `phone`
 ADD PRIMARY KEY (`phone`,`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `Poll`
--
ALTER TABLE `Poll`
 ADD PRIMARY KEY (`pollId`), ADD KEY `username` (`username`);

--
-- Indexes for table `Poll_regarding_Building`
--
ALTER TABLE `Poll_regarding_Building`
 ADD PRIMARY KEY (`pollId`), ADD KEY `buildingNum` (`buildingNum`);

--
-- Indexes for table `Room`
--
ALTER TABLE `Room`
 ADD PRIMARY KEY (`roomNum`,`buildingNum`), ADD KEY `buildingNum` (`buildingNum`);

--
-- Indexes for table `Section`
--
ALTER TABLE `Section`
 ADD PRIMARY KEY (`sectionId`,`pollId`), ADD KEY `pollId` (`pollId`);

--
-- Indexes for table `user`
--
ALTER TABLE `User`
 ADD PRIMARY KEY (`username`), ADD KEY `facultyName` (`facultyName`);

--
-- Indexes for table `User_votesOn_Section`
--
ALTER TABLE `User_votesOn_Section`
 ADD PRIMARY KEY (`pollId`,`username`,`sectionId`,`answerId`), ADD KEY `username` (`username`,`sectionid`,`pollid`,`answerId`), ADD KEY `sectionId` (`sectionId`), ADD KEY `answerId` (`answerId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Poll`
--
ALTER TABLE `Poll`
MODIFY `pollId` int(255) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Answer`
--
ALTER TABLE `Answer`
ADD CONSTRAINT `Answer_ibfk_1` FOREIGN KEY (`pollId`) REFERENCES `Section` (`pollId`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `Answer_ibfk_2` FOREIGN KEY (`sectionId`) REFERENCES `Section` (`sectionId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `CampusMember`
--
ALTER TABLE `CampusMember`
ADD CONSTRAINT `CampusMember_ibfk_1` FOREIGN KEY (`facultyName`) REFERENCES `Faculty` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `User_commentsOn_Poll`
--
ALTER TABLE `User_commentsOn_Poll`
ADD CONSTRAINT `User_commentsOn_Poll_ibfk_1` FOREIGN KEY (`username`) REFERENCES `User` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `User_commentsOn_Poll_ibfk_2` FOREIGN KEY (`pollId`) REFERENCES `Poll` (`pollId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Department`
--
ALTER TABLE `Department`
ADD CONSTRAINT `Department_ibfk_1` FOREIGN KEY (`facultyName`) REFERENCES `Faculty` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Building_has_Faculty`
--
ALTER TABLE `Building_has_Faculty`
ADD CONSTRAINT `Building_has_Faculty_ibfk_1` FOREIGN KEY (`name`) REFERENCES `Faculty` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `Building_has_Faculty_ibfk_2` FOREIGN KEY (`buildingNum`) REFERENCES `Building` (`buildingNum`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `phone`
--
ALTER TABLE `phone`
ADD CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`id`) REFERENCES `CampusMember` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Poll`
--
ALTER TABLE `Poll`
ADD CONSTRAINT `Poll_ibfk_1` FOREIGN KEY (`username`) REFERENCES `User` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Poll_regarding_Building`
--
ALTER TABLE `Poll_regarding_Building`
ADD CONSTRAINT `Poll_regarding_Building_ibfk_1` FOREIGN KEY (`buildingNum`) REFERENCES `Building` (`buildingNum`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `Poll_regarding_Building_ibfk_2` FOREIGN KEY (`pollId`) REFERENCES `Poll` (`pollId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Room`
--
ALTER TABLE `Room`
ADD CONSTRAINT `Room_ibfk_1` FOREIGN KEY (`buildingNum`) REFERENCES `Building` (`buildingNum`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Section`
--
ALTER TABLE `Section`
ADD CONSTRAINT `Section_ibfk_1` FOREIGN KEY (`pollId`) REFERENCES `Poll` (`pollId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `User`
--
ALTER TABLE `User`
ADD CONSTRAINT `User_ibfk_1` FOREIGN KEY (`facultyName`) REFERENCES `Faculty` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `voteon`
--
ALTER TABLE `User_votesOn_Section`
ADD CONSTRAINT `User_votesOn_Section_ibfk_1` FOREIGN KEY (`username`) REFERENCES `User` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `User_votesOn_Section_ibfk_2` FOREIGN KEY (`pollId`) REFERENCES `Answer` (`pollId`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `User_votesOn_Section_ibfk_3` FOREIGN KEY (`answerId`) REFERENCES `Answer` (`answerId`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `User_votesOn_Section_ibfk_4` FOREIGN KEY (`sectionId`) REFERENCES `Section` (`sectionId`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
