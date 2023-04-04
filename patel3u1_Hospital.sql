-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 07, 2022 at 08:56 PM
-- Server version: 10.4.24-MariaDB-log
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `patel3u1_Hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `admits_in`
--

CREATE TABLE `admits_in` (
  `Hospital_location` varchar(15) NOT NULL,
  `Patient_ID` char(9) NOT NULL,
  `Admit_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admits_in`
--

INSERT INTO `admits_in` (`Hospital_location`, `Patient_ID`, `Admit_date`) VALUES
('LocationABC', '11001', '2022-03-10'),
('LocationABC', '11010', '2022-04-01'),
('LocationABC', '11011', '2022-04-02'),
('LocationABC', '11012', '2022-04-03'),
('LocationABC', '11013', '2022-04-04'),
('LocationDEF', '11002', '2022-02-01'),
('LocationDEF', '11014', '2022-04-05'),
('LocationDEF', '11015', '2022-04-06'),
('LocationDEF', '11016', '2022-04-07'),
('LocationDEF', '11017', '2022-04-08'),
('LocationGHI', '11005', '2022-03-15'),
('LocationGHI', '11018', '2022-04-09'),
('LocationGHI', '11019', '2022-04-10'),
('LocationGHI', '11020', '2022-04-11'),
('LocationGHI', '11021', '2022-04-12');

-- --------------------------------------------------------

--
-- Table structure for table `assign`
--

CREATE TABLE `assign` (
  `Hospital_location` varchar(15) NOT NULL,
  `Patient_ID` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `assign`
--

INSERT INTO `assign` (`Hospital_location`, `Patient_ID`) VALUES
('LocationABC', '11001'),
('LocationABC', '11010'),
('LocationABC', '11011'),
('LocationABC', '11012'),
('LocationABC', '11013'),
('LocationDEF', '11002'),
('LocationDEF', '11014'),
('LocationDEF', '11015'),
('LocationDEF', '11016'),
('LocationDEF', '11017'),
('LocationGHI', '11005'),
('LocationGHI', '11018'),
('LocationGHI', '11019'),
('LocationGHI', '11020'),
('LocationGHI', '11021');

-- --------------------------------------------------------

--
-- Table structure for table `attends`
--

CREATE TABLE `attends` (
  `Hospital_location` varchar(15) NOT NULL,
  `Patient_ID` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attends`
--

INSERT INTO `attends` (`Hospital_location`, `Patient_ID`) VALUES
('LocationABC', '11001'),
('LocationABC', '11002'),
('LocationABC', '11010'),
('LocationABC', '11011'),
('LocationABC', '11012'),
('LocationABC', '11013'),
('LocationDEF', '11014'),
('LocationDEF', '11015'),
('LocationDEF', '11016'),
('LocationDEF', '11017'),
('LocationGHI', '11005'),
('LocationGHI', '11018'),
('LocationGHI', '11019'),
('LocationGHI', '11020'),
('LocationGHI', '11021');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `Doctor_id` char(9) NOT NULL DEFAULT '333444555',
  `Doctor_name` varchar(30) NOT NULL,
  `Doctor_Contact_NO` int(11) DEFAULT NULL,
  `Patient_ID` char(9) NOT NULL DEFAULT '111222333',
  `hospital_location` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`Doctor_id`, `Doctor_name`, `Doctor_Contact_NO`, `Patient_ID`, `hospital_location`) VALUES
('100', 'Kevin', 1112223334, '11001', 'LocationABC'),
('101', 'Victoria', 123456, '11002', 'LocationDEF'),
('102', 'Jenny', 1000000000, '11005', 'LocationGHI'),
('103', 'Ronaldo', 908881234, '11010', 'LocationABC'),
('104', 'Neha', 9994444, '11011', 'LocationDEF'),
('105', 'Jordan', 1002003000, '11012', 'LocationDEF'),
('106', 'Ron', 771892873, '11013', 'LocationGHI'),
('107', 'Shaun', 90908907, '11014', 'LocationABC'),
('108', 'Gia', 990880787, '11015', 'LocationGHI');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `contact` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `suggestions` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`name`, `email`, `contact`, `suggestions`) VALUES
('maysam', 'maysam@pqr.com', '3333333333', 'Friendly staff'),
('naitya', 'naitya@abc.com', '1111111111', 'Nice Hospital'),
('Nishrut', 'nish@def.com', '0101010101', ''),
('Vedang', 'vedang@xyz.com', '2222222222', 'Very well maintained place');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hospital_name` varchar(30) NOT NULL,
  `hospital_location` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hospital_name`, `hospital_location`) VALUES
('HospitalA', 'LocationABC'),
('HospitalD', 'LocationDEF'),
('HospitalG', 'LocationGHI');

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `Nurse_id` char(9) NOT NULL DEFAULT '111222333',
  `Nurse_name` varchar(30) NOT NULL,
  `Patient_id` char(9) NOT NULL,
  `Hospital_location` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`Nurse_id`, `Nurse_name`, `Patient_id`, `Hospital_location`) VALUES
('201', 'Maya', '11001', 'LocationABC'),
('202', 'Sarah', '11002', 'LocationDEF'),
('203', 'Jaxon', '11005', 'LocationGHI'),
('204', 'Riya', '11010', 'LocationABC'),
('205', 'Mike', '11011', 'LocationABC'),
('206', 'Jason', '11012', 'LocationABC'),
('207', 'Isa', '11013', 'LocationABC'),
('208', 'Mona', '11014', 'LocationDEF'),
('209', 'Nora', '11015', 'LocationDEF'),
('210', 'Kyle', '11016', 'LocationDEF'),
('211', 'Haverts', '11017', 'LocationDEF'),
('212', 'Nick', '11018', 'LocationGHI'),
('213', 'Nehra', '11019', 'LocationGHI'),
('214', 'Michele', '11020', 'LocationGHI'),
('215', 'Mayan', '11021', 'LocationGHI');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `Patient_id` char(9) NOT NULL DEFAULT '333444555',
  `Patient_name` varchar(30) NOT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Disease` varchar(30) DEFAULT NULL,
  `Treatment` varchar(100) DEFAULT NULL,
  `AdmissionDate` date NOT NULL,
  `Contact_info` int(11) NOT NULL,
  `Patient_Address` varchar(30) DEFAULT NULL,
  `hospital_location` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`Patient_id`, `Patient_name`, `Sex`, `Disease`, `Treatment`, `AdmissionDate`, `Contact_info`, `Patient_Address`, `hospital_location`) VALUES
('11001', 'John', 'male', 'fever', 'paracetamol injections 2 times a day and complete bed rest for 5 days', '2022-03-10', 1002003004, '123 Windsor Street', 'LocationABC'),
('11002', 'Smith', 'male', 'cough', 'XYZ cough injections 2 times a day and complete bed rest for 4 days', '2022-02-01', 1000100011, '100 NonWindsor Street', 'LocationDEF'),
('11005', 'Sakshi', 'female', 'Dengue', 'Paracetamol and ABC injections 3 times a day and 10 days toatl bed rest.', '2022-03-15', 1002003009, '999 Abc Street', 'LocationGHI'),
('11010', 'Sohan', 'male', 'malaria', 'malaria tablets and rest for 15 days', '2022-04-01', 1948370981, '11 Peter Street', 'LocationABC'),
('11011', 'Nicole', 'female', 'Mental Disorder', 'Medication on Mental recovery tablets 3 times a day lifetime', '2022-04-02', 923348957, '19 Chip Drive', 'LocationABC'),
('11012', 'Jetha', 'male', 'Comic Disorder', 'Non comic medicine for 10 days 2 times a day', '2022-04-03', 1230988400, '000 canada strret', 'LocationABC'),
('11013', 'Bhide', 'male', 'fracture', 'fracture bandaid for 1 month ', '2022-04-04', 1237654345, '777 magic street', 'LocationABC'),
('11014', 'Sweety', 'female', 'Liver Fail', 'Liver replacement and operation and then bed rest for 6 months', '2022-04-05', 986541234, '666 op drive', 'LocationDEF'),
('11015', 'Mina', 'female', 'fracture', 'ct scan and fracture bandaid', '2022-04-06', 789123456, '09 north street', 'LocationDEF'),
('11016', 'Nick', 'male', 'fever', 'paracetamol tablets for 7 days', '2022-04-07', 9980111, '1 south street', 'LocationDEF'),
('11017', 'Vetor', 'male', 'Heart Arrest', 'Bypass surgery and 1 month bed rest', '2022-04-08', 901110000, '89 Mill street', 'LocationDEF'),
('11018', 'Victoria', 'male', 'cough', 'cough syrup 2 times a day', '2022-04-09', 771112222, '777 amber street', 'LocationGHI'),
('11019', 'Tina', 'female', 'typhoid', 'typhoid injections 2 times a day, and 3 days bed rest', '2022-04-10', 1110009999, '99 Northwood street', 'LocationGHI'),
('11020', 'Mikel', 'male', 'sleep disorder', 'medications for 1 month, 2 times a day AB tablet.', '2022-04-11', 71990000, '45 time street', 'LocationGHI'),
('11021', 'Tom', 'male', 'Malaria', 'Paracetamol 2 times a day and malaria injections daily at 9 am for 7 days', '2022-04-12', 8886666, '56 east street', 'LocationGHI'),
('11029', 'Emily', 'female', 'Fracture on Left palm', 'Normal Plaster', '2022-03-25', 1470122030, '1247 Lauzon St.', 'LocationDEF');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `Pharmacy_id` char(9) NOT NULL,
  `Pharmacy_name` varchar(30) NOT NULL,
  `Drug` varchar(20) NOT NULL,
  `Hospital_location` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`Pharmacy_id`, `Pharmacy_name`, `Drug`, `Hospital_location`) VALUES
('10', 'PharmaA', 'DrugA', 'LocationABC'),
('11', 'PharmaD', 'DrugD', 'LocationDEF'),
('12', 'PharmaG', 'DrugG', 'LocationGHI');

-- --------------------------------------------------------

--
-- Table structure for table `work`
--

CREATE TABLE `work` (
  `location` varchar(30) NOT NULL,
  `doctor_id` char(9) NOT NULL,
  `nurse_id` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admits_in`
--
ALTER TABLE `admits_in`
  ADD PRIMARY KEY (`Hospital_location`,`Patient_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Hospital_location` (`Hospital_location`);

--
-- Indexes for table `assign`
--
ALTER TABLE `assign`
  ADD PRIMARY KEY (`Hospital_location`,`Patient_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Indexes for table `attends`
--
ALTER TABLE `attends`
  ADD PRIMARY KEY (`Hospital_location`,`Patient_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`Doctor_id`),
  ADD KEY `DCFK` (`Patient_ID`),
  ADD KEY `hospital_location` (`hospital_location`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospital_location`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`Nurse_id`),
  ADD KEY `NURSFK` (`Patient_id`),
  ADD KEY `Hospital_location` (`Hospital_location`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`Patient_id`),
  ADD KEY `PATFK` (`hospital_location`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`Pharmacy_id`),
  ADD UNIQUE KEY `Drug` (`Drug`),
  ADD KEY `PHARMFK` (`Hospital_location`);

--
-- Indexes for table `work`
--
ALTER TABLE `work`
  ADD PRIMARY KEY (`location`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `nurse_id` (`nurse_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admits_in`
--
ALTER TABLE `admits_in`
  ADD CONSTRAINT `admits_in_ibfk_1` FOREIGN KEY (`Hospital_location`) REFERENCES `hospital` (`hospital_location`),
  ADD CONSTRAINT `admits_in_ibfk_2` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_id`);

--
-- Constraints for table `assign`
--
ALTER TABLE `assign`
  ADD CONSTRAINT `assign_ibfk_1` FOREIGN KEY (`Hospital_location`) REFERENCES `hospital` (`hospital_location`),
  ADD CONSTRAINT `assign_ibfk_2` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_id`);

--
-- Constraints for table `attends`
--
ALTER TABLE `attends`
  ADD CONSTRAINT `attends_ibfk_1` FOREIGN KEY (`Hospital_location`) REFERENCES `hospital` (`hospital_location`),
  ADD CONSTRAINT `attends_ibfk_2` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_id`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `DCFK` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_id`),
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`hospital_location`) REFERENCES `hospital` (`hospital_location`);

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `NURSFK` FOREIGN KEY (`Patient_id`) REFERENCES `patient` (`Patient_id`),
  ADD CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`Hospital_location`) REFERENCES `hospital` (`hospital_location`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `PATFK` FOREIGN KEY (`hospital_location`) REFERENCES `hospital` (`hospital_location`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD CONSTRAINT `PHARMFK` FOREIGN KEY (`Hospital_location`) REFERENCES `hospital` (`hospital_location`);

--
-- Constraints for table `work`
--
ALTER TABLE `work`
  ADD CONSTRAINT `work_ibfk_1` FOREIGN KEY (`location`) REFERENCES `hospital` (`hospital_location`),
  ADD CONSTRAINT `work_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`Doctor_id`),
  ADD CONSTRAINT `work_ibfk_3` FOREIGN KEY (`nurse_id`) REFERENCES `nurse` (`Nurse_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
