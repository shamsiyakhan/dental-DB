CREATE DATABASE  IF NOT EXISTS `demo_dental` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `demo_dental`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: demo_dental
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admindetails`
--

DROP TABLE IF EXISTS `admindetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admindetails` (
  `admin_id` varchar(20) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `gender` enum('Male','Female','Others') DEFAULT NULL,
  `phone_no` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admindetails`
--

LOCK TABLES `admindetails` WRITE;
/*!40000 ALTER TABLE `admindetails` DISABLE KEYS */;
INSERT INTO `admindetails` VALUES ('28042a67a31e4cd38702','Shamsiya Khan','shams@gmail.com','$2b$10$pj16FfJiyOXLXmhB1RubdubgEdCS1JFa8Pj9gz7ENev','Kharadi','Female',1234567890);
/*!40000 ALTER TABLE `admindetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` varchar(20) NOT NULL,
  `dept_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('0185c641941a4b1d8383','Gum Disease Treatment'),('08fa3822ba1b4725b454','Cavity Fillings'),('1b5cb7ce084e4013816d','Teeth Alignment'),('33ff917b4d9e4ea78346','Oral Hygiene Counseling'),('37323cbb22e54451b177','Braces (Metal, Ceramic, Invisalign)'),('37382812032b4f56b354','Gum Disease Treatment'),('3ae04b6b1da84d5b85e4','Gum Disease Treatment'),('48a6464e0a1e43f0821c','Retainers'),('845e8dcc0c3046d08566','Root Canal'),('a1ac7ea30a3c44feb474','Teeth Cleaning');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept` (
  `did` varchar(50) NOT NULL,
  `dept_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `invoice_id` varchar(20) NOT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `status` enum('Full','Partial','UnPaid','Waived Off') DEFAULT NULL,
  `treatmentId` varchar(20) DEFAULT NULL,
  `patientId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `treatmentId` (`treatmentId`),
  KEY `patientId` (`patientId`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`treatmentId`) REFERENCES `treatment` (`treatmentId`),
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES ('ab467d9b6b5347448c51',NULL,'Full','a89b50a95e4a432e8686','81cc266a50e44a8a93a0');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otpverification`
--

DROP TABLE IF EXISTS `otpverification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otpverification` (
  `otp` varchar(10) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otpverification`
--

LOCK TABLES `otpverification` WRITE;
/*!40000 ALTER TABLE `otpverification` DISABLE KEYS */;
/*!40000 ALTER TABLE `otpverification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patientId` varchar(20) NOT NULL,
  `prn` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_no` bigint(20) DEFAULT NULL,
  `emergency_contact_name` varchar(50) DEFAULT NULL,
  `emergency_contact` bigint(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `maritial_status` enum('single','married','divorced','widow') DEFAULT NULL,
  `gender` enum('M','F','-') DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`patientId`),
  UNIQUE KEY `prn` (`prn`),
  UNIQUE KEY `unique_phone_no` (`phone_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('81cc266a50e44a8a93a0','deb74ea07d724b54a86c','Shayban','Salim','khan','shayban@gmail.com',8149863141,'Shamsiya',7841849749,'Center street camp','1999-10-23','single','M',23);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` varchar(20) NOT NULL,
  `total_payment` decimal(10,2) DEFAULT NULL,
  `pending_payment` decimal(10,2) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_type` enum('Online','Cash') DEFAULT NULL,
  `discountPercent` int(11) DEFAULT NULL,
  `invoice_id` varchar(20) DEFAULT NULL,
  `paid` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('72ff80fd05e54666978b',22500.00,7500.00,'2025-02-28 00:00:00','Online',10,'ab467d9b6b5347448c51',5000.00),('fe8d1e624e3643a2ae60',22500.00,12500.00,'2025-02-28 00:00:00','Cash',10,'ab467d9b6b5347448c51',10000.00);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_details`
--

DROP TABLE IF EXISTS `price_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_details` (
  `priceId` varchar(20) DEFAULT NULL,
  `treatment_name` varchar(50) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_details`
--

LOCK TABLES `price_details` WRITE;
/*!40000 ALTER TABLE `price_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `price_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `roleid` int(11) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Clerk'),(3,'OMDR'),(4,'Patient'),(5,'Doctor');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staffid` varchar(20) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_no` bigint(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `joiningDate` date DEFAULT NULL,
  `gender` enum('M','F','-') DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `maritial_status` enum('single','married','divorced','widow') DEFAULT NULL,
  `emergency_contact` bigint(20) DEFAULT NULL,
  `jobTitle` varchar(50) DEFAULT NULL,
  `staffStatus` enum('Active','On-Leave','Resigned','Terminated') DEFAULT NULL,
  `specialization` varchar(50) DEFAULT NULL,
  `degree` varchar(50) DEFAULT NULL,
  `certification` varchar(100) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `registration_no` varchar(50) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  `fullname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`staffid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `registration_no` (`registration_no`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('68c243fbf5da4081be41','$2b$10$nvfVTdRxGK5Pr3bmk/7rO.MthDad4Z1QY5ejfFOMwKROKM321uGUq','fareeha@gmail.com',1234567890,'Camp , Pune','2025-02-13','F',26,'single',9876543210,'Senior Doctor','Active','Root Canal','MBBS','MBBS Diploma',4,'fareeha12345',5,NULL),('f2e0176d44d84e95be07','$2b$10$iOJwwqcUMmOJdeeogi4sIuUUcoNr33GedGa2MSPG6svjzvKSfXkjm','test@gmail.com',1234567890,'Camp , Pune','2025-02-13','F',26,'single',9876543210,'Junior Doctor','Active','Root Canal','MBBS','MBBS Diploma',4,'test77664wue1',3,'Fareeha Choglay');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_departments`
--

DROP TABLE IF EXISTS `staff_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_departments` (
  `sdId` varchar(20) NOT NULL,
  `dept_id` varchar(20) DEFAULT NULL,
  `staffid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sdId`),
  KEY `dept_id` (`dept_id`),
  KEY `staffid` (`staffid`),
  CONSTRAINT `staff_departments_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`),
  CONSTRAINT `staff_departments_ibfk_2` FOREIGN KEY (`staffid`) REFERENCES `staff` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_departments`
--

LOCK TABLES `staff_departments` WRITE;
/*!40000 ALTER TABLE `staff_departments` DISABLE KEYS */;
INSERT INTO `staff_departments` VALUES ('0422635a99d04ea79125','08fa3822ba1b4725b454','68c243fbf5da4081be41'),('1792a4b05c5d4788a9f0','0185c641941a4b1d8383','f2e0176d44d84e95be07'),('1db132fecb3e42a588c6','0185c641941a4b1d8383','68c243fbf5da4081be41'),('2ed9753cf86c4b33ae64','1b5cb7ce084e4013816d','f2e0176d44d84e95be07'),('4c46c0e355bd451fa338','1b5cb7ce084e4013816d','68c243fbf5da4081be41'),('928e5feba42a44f59471','08fa3822ba1b4725b454','f2e0176d44d84e95be07');
/*!40000 ALTER TABLE `staff_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment` (
  `treatmentId` varchar(20) NOT NULL,
  `treatment_name` varchar(50) DEFAULT NULL,
  `patient_history` varchar(150) DEFAULT NULL,
  `findings` varchar(150) DEFAULT NULL,
  `documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`documents`)),
  `start_date` datetime DEFAULT NULL,
  `treatment_status` enum('In Progress','Completed') DEFAULT NULL,
  `patientId` varchar(20) NOT NULL,
  `dept_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`treatmentId`),
  KEY `fk_treatment_patient` (`patientId`),
  KEY `fk_department` (`dept_id`),
  CONSTRAINT `fk_department` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_treatment_patient` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES ('a89b50a95e4a432e8686','Root Canal issue','Previosuly diagnozed with tuberclosis and cancer','Sevear pain in teeth','{}','2025-02-28 15:30:00','In Progress','81cc266a50e44a8a93a0','845e8dcc0c3046d08566');
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment_diagnosis`
--

DROP TABLE IF EXISTS `treatment_diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment_diagnosis` (
  `diagnosis_id` varchar(20) NOT NULL,
  `diagnosis` varchar(150) DEFAULT NULL,
  `diagnosis_date` datetime DEFAULT NULL,
  `next_appointment` datetime DEFAULT NULL,
  `staffid` varchar(20) DEFAULT NULL,
  `treatmentId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`diagnosis_id`),
  KEY `staffid` (`staffid`),
  KEY `treatmentId` (`treatmentId`),
  CONSTRAINT `treatment_diagnosis_ibfk_1` FOREIGN KEY (`staffid`) REFERENCES `staff` (`staffid`),
  CONSTRAINT `treatment_diagnosis_ibfk_2` FOREIGN KEY (`treatmentId`) REFERENCES `treatment` (`treatmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment_diagnosis`
--

LOCK TABLES `treatment_diagnosis` WRITE;
/*!40000 ALTER TABLE `treatment_diagnosis` DISABLE KEYS */;
INSERT INTO `treatment_diagnosis` VALUES ('f6984a0dd1324302ba36','Root Canal','2025-02-28 00:00:00','2025-03-15 00:00:00','f2e0176d44d84e95be07','a89b50a95e4a432e8686');
/*!40000 ALTER TABLE `treatment_diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workschedule`
--

DROP TABLE IF EXISTS `workschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workschedule` (
  `scheduleId` varchar(20) NOT NULL,
  `staffid` varchar(20) DEFAULT NULL,
  `weekday` varchar(15) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`scheduleId`),
  KEY `staffid` (`staffid`),
  CONSTRAINT `workschedule_ibfk_1` FOREIGN KEY (`staffid`) REFERENCES `staff` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workschedule`
--

LOCK TABLES `workschedule` WRITE;
/*!40000 ALTER TABLE `workschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `workschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'demo_dental'
--

--
-- Dumping routines for database 'demo_dental'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-01 13:02:20
