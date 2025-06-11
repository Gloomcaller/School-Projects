-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2025 at 11:15 AM
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
-- Database: `arp`
--

-- --------------------------------------------------------

--
-- Table structure for table `artifacts`
--

CREATE TABLE `artifacts` (
  `artifactid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `yeardiscovered` int(11) DEFAULT NULL,
  `sourceid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artifacts`
--

INSERT INTO `artifacts` (`artifactid`, `name`, `description`, `origin`, `yeardiscovered`, `sourceid`) VALUES
(1, 'Golden Chalice', 'A ceremonial chalice adorned with intricate designs.', 'Egypt', 1923, 1),
(2, 'Ancient Scroll', 'A fragile parchment containing ancient text.', 'China', 1856, 2),
(3, 'Jeweled Dagger', 'A weapon encrusted with rubies and emeralds.', 'Persia', 1754, 3),
(4, 'Bronze Shield', 'A well-preserved shield with engraved symbols.', 'Greece', 200, 4),
(5, 'Ivory Statuette', 'A small figurine carved from ivory.', 'India', 1898, 5),
(6, 'Ceramic Vase', 'An ornate vase used in ancient rituals.', 'Mesopotamia', 1500, 6),
(7, 'Silver Coin', 'A coin minted during a legendary reign.', 'Rome', 44, 7),
(8, 'Obsidian Mirror', 'A reflective surface crafted from volcanic glass.', 'Mexico', 1400, 1),
(9, 'Jade Pendant', 'A necklace centerpiece crafted from jade.', 'Korea', 700, 2),
(10, 'Steel Helm', 'A medieval helmet used by knights.', 'England', 1405, 3);

-- --------------------------------------------------------

--
-- Table structure for table `custodians`
--

CREATE TABLE `custodians` (
  `custodianid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `roleid` int(11) NOT NULL,
  `departmentid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `custodians`
--

INSERT INTO `custodians` (`custodianid`, `name`, `roleid`, `departmentid`) VALUES
(1, 'Alice Morgan', 1, 2),
(2, 'James Scott', 2, 1),
(3, 'Emily Davis', 3, 4),
(4, 'Daniel Harris', 4, 3),
(5, 'Grace Thompson', 5, 6),
(6, 'Olivia Wilson', 6, 5),
(7, 'Liam Moore', 7, 4),
(8, 'Sophia Taylor', 1, 2),
(9, 'Ethan White', 2, 1),
(10, 'Mia Martinez', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `departmentid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `overseer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`departmentid`, `name`, `overseer`) VALUES
(1, 'Preservation', 'Elena Carter'),
(2, 'Research', 'Dr. Victor Yu'),
(3, 'Security', 'Samantha Hall'),
(4, 'Logistics', 'Michael Thompson'),
(5, 'Cataloging', 'Sophia Lee'),
(6, 'Maintenance', 'Harold Greene');

-- --------------------------------------------------------

--
-- Table structure for table `maintenancerecords`
--

CREATE TABLE `maintenancerecords` (
  `recordid` int(11) NOT NULL,
  `date` date NOT NULL,
  `artifactcondition` varchar(100) DEFAULT NULL,
  `artifactid` int(11) NOT NULL,
  `custodianid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maintenancerecords`
--

INSERT INTO `maintenancerecords` (`recordid`, `date`, `artifactcondition`, `artifactid`, `custodianid`) VALUES
(1, '2024-01-15', 'Good', 1, 2),
(2, '2024-02-01', 'Fair', 3, 5),
(3, '2024-02-10', 'Restored', 4, 1),
(4, '2024-03-22', 'Excellent', 7, 3),
(5, '2024-04-18', 'Needs Repair', 6, 6),
(6, '2024-05-05', 'Good', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roleid` int(11) NOT NULL,
  `rolename` varchar(100) NOT NULL,
  `expertise` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roleid`, `rolename`, `expertise`) VALUES
(1, 'Research Specialist', 'Artifact Research'),
(2, 'Preservation Specialist', 'Conservation'),
(3, 'Logistics Coordinator', 'Transportation & Storage'),
(4, 'Security Officer', 'Artifact Protection'),
(5, 'Maintenance Technician', 'Artifact Repairs'),
(6, 'Cataloging Specialist', 'Database Management'),
(7, 'Field Archaeologist', 'Excavation & Recovery');

-- --------------------------------------------------------

--
-- Table structure for table `sources`
--

CREATE TABLE `sources` (
  `sourceid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `contactinfo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sources`
--

INSERT INTO `sources` (`sourceid`, `name`, `type`, `contactinfo`) VALUES
(1, 'National Museum', 'Government', 'museum@compas.com'),
(2, 'Explorers Guild', 'Private Organization', 'explorers@compas.com'),
(3, 'Antique Collectors Union', 'Private', 'collectorsunion@compas.com'),
(4, 'Global Archaeology Network', 'NGO', 'gan@compas.com'),
(5, 'Historical Artifacts Foundation', 'Charity', 'hafundation@compas.com'),
(6, 'Private Donor', 'Individual', 'private@compas.com'),
(7, 'Excavation Team Diamond', 'Field Team', 'teamdiamond@compas.com');

-- --------------------------------------------------------

--
-- Table structure for table `testingrecords`
--

CREATE TABLE `testingrecords` (
  `testid` int(11) NOT NULL,
  `date` date NOT NULL,
  `artifactid` int(11) NOT NULL,
  `custodianid` int(11) NOT NULL,
  `testtype` varchar(100) DEFAULT NULL,
  `result` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testingrecords`
--

INSERT INTO `testingrecords` (`testid`, `date`, `artifactid`, `custodianid`, `testtype`, `result`) VALUES
(1, '2024-01-10', 1, 1, 'Material Analysis', 'Gold alloy with unknown impurities.'),
(2, '2024-01-20', 2, 3, 'Radiocarbon Dating', 'Estimated age: 1,500 years.'),
(3, '2024-02-05', 4, 5, 'Structural Integrity', 'Shield is stable and intact.'),
(4, '2024-03-01', 7, 2, 'Chemical Analysis', 'Obsidian purity at 97%.'),
(5, '2024-03-15', 5, 6, 'Artifact Authentication', 'Confirmed origin: India.'),
(6, '2024-04-10', 9, 7, 'Microscopic Examination', 'No signs of modern tampering.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artifacts`
--
ALTER TABLE `artifacts`
  ADD PRIMARY KEY (`artifactid`),
  ADD KEY `sourceid` (`sourceid`);

--
-- Indexes for table `custodians`
--
ALTER TABLE `custodians`
  ADD PRIMARY KEY (`custodianid`),
  ADD KEY `roleid` (`roleid`),
  ADD KEY `departmentid` (`departmentid`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`departmentid`);

--
-- Indexes for table `maintenancerecords`
--
ALTER TABLE `maintenancerecords`
  ADD PRIMARY KEY (`recordid`),
  ADD KEY `artifactid` (`artifactid`),
  ADD KEY `custodianid` (`custodianid`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleid`);

--
-- Indexes for table `sources`
--
ALTER TABLE `sources`
  ADD PRIMARY KEY (`sourceid`);

--
-- Indexes for table `testingrecords`
--
ALTER TABLE `testingrecords`
  ADD PRIMARY KEY (`testid`),
  ADD KEY `artifactid` (`artifactid`),
  ADD KEY `custodianid` (`custodianid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artifacts`
--
ALTER TABLE `artifacts`
  MODIFY `artifactid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `custodians`
--
ALTER TABLE `custodians`
  MODIFY `custodianid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `departmentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `maintenancerecords`
--
ALTER TABLE `maintenancerecords`
  MODIFY `recordid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `roleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sources`
--
ALTER TABLE `sources`
  MODIFY `sourceid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `testingrecords`
--
ALTER TABLE `testingrecords`
  MODIFY `testid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artifacts`
--
ALTER TABLE `artifacts`
  ADD CONSTRAINT `artifacts_ibfk_1` FOREIGN KEY (`sourceid`) REFERENCES `sources` (`sourceid`);

--
-- Constraints for table `custodians`
--
ALTER TABLE `custodians`
  ADD CONSTRAINT `custodians_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `roles` (`roleid`),
  ADD CONSTRAINT `custodians_ibfk_2` FOREIGN KEY (`departmentid`) REFERENCES `departments` (`departmentid`);

--
-- Constraints for table `maintenancerecords`
--
ALTER TABLE `maintenancerecords`
  ADD CONSTRAINT `maintenancerecords_ibfk_1` FOREIGN KEY (`artifactid`) REFERENCES `artifacts` (`artifactid`),
  ADD CONSTRAINT `maintenancerecords_ibfk_2` FOREIGN KEY (`custodianid`) REFERENCES `custodians` (`custodianid`);

--
-- Constraints for table `testingrecords`
--
ALTER TABLE `testingrecords`
  ADD CONSTRAINT `testingrecords_ibfk_1` FOREIGN KEY (`artifactid`) REFERENCES `artifacts` (`artifactid`),
  ADD CONSTRAINT `testingrecords_ibfk_2` FOREIGN KEY (`custodianid`) REFERENCES `custodians` (`custodianid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
