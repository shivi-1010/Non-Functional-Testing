

-- 
DROP PROCEDURE IF EXISTS getPatient;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPatient` (IN `pid` VARCHAR(20))  
SELECT * FROM patient WHERE patientID=pid$$

DELIMITER ;



--
-- Table structure for table `admin`
--
DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `adminID` VARCHAR(20) NOT NULL,
  `Username` VARCHAR(50) NOT NULL,
  `Password` VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `Username`, `Password`) VALUES
('A001', 'admin', 'admin');

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`);


-- --------------------------------------------------------
-- --------------------------------------------------------
--
-- Table structure for table `doctor`
--
-- DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `doctorID` VARCHAR(20) NOT NULL,
  `dname` VARCHAR(50) NOT NULL,
  `demail` VARCHAR(50) NOT NULL,
  `password` VARCHAR(15),
  `address` VARCHAR(70),
  `phoneno` VARCHAR(15), 
  `gender` VARCHAR(10),
  `specilist` VARCHAR(30),
  `dimage` VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorID`,`dname`,`demail`,`password`, `address`, `phoneno`, `gender`,`specilist`, `dimage`) VALUES
('D001', 'Dr. Smith','docsmith@gmail.com','password', '456 Avenue, City', '0987654321', 'Male','eye surgeon', 'dr_smith.jpg');

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorID`);


-- --------------------------------------------------------
--
-- Table structure for table `patient`
--
DROP TABLE IF EXISTS `patient`;

CREATE TABLE `patient` (
  `patientID` VARCHAR(20) NOT NULL,
 `pname` VARCHAR(50) NOT NULL,
  `pemail` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50),
  `age` FLOAT(5),
  `gender` VARCHAR(10),
  `address` VARCHAR(70),
  `phone` VARCHAR(15),
  `pimage` VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient`(`patientID`,`pname`,`pemail`,`password`,`age`, `gender`, `address`, `phone`, `pimage`)
VALUES
('P001','John Doe','john@gmail.com','password', 30, 'Male', '123 Street, City', '1234567890', 'john_doe.jpg');

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientID`);

  
--
-- Table structure for table `report`
--
DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `reportID` VARCHAR(20) NOT NULL,
  `patientID` VARCHAR(20) NOT NULL,
  `date` DATE,
  `time` TIME,
  `reportf` VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`reportID`),
  ADD CONSTRAINT `FK_report_patient` FOREIGN KEY (`patientID`) REFERENCES `patient`(`patientID`);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--
DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `patientID` VARCHAR(20) NOT NULL,
  `doctorID` VARCHAR(20) NOT NULL,
  `app_no` VARCHAR(20) NOT NULL,
  `date` DATE,
  `time` TIME
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Dumping data for table `appointment`
--
INSERT INTO `appointment` (`patientID`, `doctorID`, `app_no`, `date`, `time`) VALUES
('P001', 'D001', 'APP001', '2022-10-15', '09:00:00');

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`doctorID`, `app_no`),
  ADD CONSTRAINT `FK_appointment_patient` FOREIGN KEY (`patientID`) REFERENCES `patient`(`patientID`),
  ADD CONSTRAINT `FK_appointment_doctor` FOREIGN KEY (`doctorID`) REFERENCES `doctor`(`doctorID`);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--
DROP TABLE IF EXISTS `history`;

CREATE TABLE `history` (
  `patientID` VARCHAR(20) NOT NULL,
  `doctorID` VARCHAR(20) NOT NULL,
  `details` VARCHAR(150),
  `date` DATE,
  `time` TIME
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `history` (`patientID`, `doctorID`, `details`, `date`, `time`) VALUES
('P001', 'D001', 'Patient visited for eye checkup', '2022-10-15', '10:00:00');


--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `FK_history_patient` FOREIGN KEY (`patientID`) REFERENCES `patient`(`patientID`),
  ADD CONSTRAINT `FK_history_doctor` FOREIGN KEY (`doctorID`) REFERENCES `doctor`(`doctorID`);

-- --------------------------------------------------------

--
-- Table structure for table `docDays`
--
DROP TABLE IF EXISTS `docDays`;

CREATE TABLE `docDays` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `doctorID` VARCHAR(20),
  `days` VARCHAR(100),
  `time` TIME,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`doctorID`) REFERENCES `doctor`(`doctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `docDays` (`id`, `doctorID`, `days`, `time`) VALUES
(1, 'D001', 'Monday, Wednesday, Friday', '09:00:00');

ALTER TABLE `docDays` 
ADD CONSTRAINT `FK_docDays_doctor` FOREIGN KEY (`doctorID`) REFERENCES `doctor`(`doctorID`);

