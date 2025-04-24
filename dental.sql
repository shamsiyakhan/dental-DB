CREATE DATABASE  IF NOT EXISTS `dental` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `dental`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dental
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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointment_id` varchar(50) NOT NULL,
  `treatment_id` varchar(50) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `dept_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `fk_appointment_department` (`dept_id`),
  CONSTRAINT `fk_appointment_department` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bill_id` varchar(50) NOT NULL,
  `treatment_id` varchar(50) DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `total` mediumtext DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `billtype` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `treatment_id` (`treatment_id`),
  KEY `userid` (`userid`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`treatment_id`) REFERENCES `treatment_details` (`treatment_id`) ON DELETE CASCADE,
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cheif_complaint`
--

DROP TABLE IF EXISTS `cheif_complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cheif_complaint` (
  `complaint_id` varchar(50) NOT NULL,
  `patientid` varchar(50) DEFAULT NULL,
  `reporting_date` date DEFAULT NULL,
  `issue_reported` varchar(50) DEFAULT NULL,
  `tests` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tests`)),
  `total_charge` mediumtext DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`),
  KEY `patientid` (`patientid`),
  CONSTRAINT `cheif_complaint_ibfk_1` FOREIGN KEY (`patientid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cheif_complaint`
--

LOCK TABLES `cheif_complaint` WRITE;
/*!40000 ALTER TABLE `cheif_complaint` DISABLE KEYS */;
INSERT INTO `cheif_complaint` VALUES ('DUbx1SLtl4','rzTxzmukVa','2025-04-23','Teeth Pain','[\"mri\",\"ct scan\"]','900','paid');
/*!40000 ALTER TABLE `cheif_complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` varchar(50) NOT NULL,
  `dept_name` varchar(50) DEFAULT NULL,
  `hodname` varchar(50) DEFAULT NULL,
  `dept_username` varchar(50) DEFAULT NULL,
  `dept_password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('18MIA4AsbJ','OMDR','Shayban','omdr@gmail.com','VGVzdDEyM0A='),('aK8JyQl9Ph','Prosthodontics and Crown & Bridge','Shamsiya Khan','pcb@gmail.com','VGVzdDEyM0A=');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnose`
--

DROP TABLE IF EXISTS `diagnose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnose` (
  `diagnose_id` varchar(50) NOT NULL,
  `diagnose_date` date DEFAULT NULL,
  `treatment_suggested` varchar(50) DEFAULT NULL,
  `next_appointment_date` date DEFAULT NULL,
  `medicine` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`medicine`)),
  PRIMARY KEY (`diagnose_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnose`
--

LOCK TABLES `diagnose` WRITE;
/*!40000 ALTER TABLE `diagnose` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctor_id` varchar(50) NOT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `degree` varchar(200) DEFAULT NULL,
  `phone_no` mediumtext DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `marital_status` varchar(10) DEFAULT NULL,
  `dept_id` varchar(50) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`doctor_id`),
  UNIQUE KEY `email` (`email`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('AgNrcuuLru','Fareeha Shakeel','fareeha@gmail.com','VGVzdDEyM0A=',1,'MBBS','8149863141','Camp','Single','aK8JyQl9Ph','Female','2000-03-29');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` varchar(50) DEFAULT NULL,
  `payment_type` varchar(10) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `bill_id` varchar(50) DEFAULT NULL,
  KEY `bill_id` (`bill_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment_details`
--

DROP TABLE IF EXISTS `treatment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment_details` (
  `treatment_id` varchar(50) NOT NULL,
  `treatment_name` varchar(50) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `total_charges` mediumtext DEFAULT NULL,
  `finding` varchar(50) DEFAULT NULL,
  `history` varchar(50) DEFAULT NULL,
  `reports` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`reports`)),
  `dept_id` varchar(50) DEFAULT NULL,
  `patientid` varchar(50) DEFAULT NULL,
  `doctorid` varchar(50) DEFAULT NULL,
  `complaint_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`treatment_id`),
  KEY `dept_id` (`dept_id`),
  KEY `patientid` (`patientid`),
  KEY `doctorid` (`doctorid`),
  KEY `fk_complaint_id` (`complaint_id`),
  CONSTRAINT `fk_complaint_id` FOREIGN KEY (`complaint_id`) REFERENCES `cheif_complaint` (`complaint_id`),
  CONSTRAINT `treatment_details_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`),
  CONSTRAINT `treatment_details_ibfk_2` FOREIGN KEY (`patientid`) REFERENCES `user` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `treatment_details_ibfk_3` FOREIGN KEY (`doctorid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment_details`
--

LOCK TABLES `treatment_details` WRITE;
/*!40000 ALTER TABLE `treatment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `treatment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment_master`
--

DROP TABLE IF EXISTS `treatment_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment_master` (
  `treatment_id` varchar(50) DEFAULT NULL,
  `treatment_name` varchar(50) DEFAULT NULL,
  `treatment_price` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment_master`
--

LOCK TABLES `treatment_master` WRITE;
/*!40000 ALTER TABLE `treatment_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `treatment_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `marital_status` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `phone` mediumtext DEFAULT NULL,
  `emergency_contact` mediumtext DEFAULT NULL,
  `emergency_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('eFJnNywunz','abul@gmail.com','VGVzdDEyM0A=','Abul fazal','Kondwa','Male','Married','2004-02-17','patient','9876543210','9876543210','Shayban'),('rzTxzmukVa','shamsiya@gmail.com','VGVzdDEyM0A=','Shamsiya Khan','Kharadi','Female','Single','1999-04-27','patient','9898989898','978654321','shayban');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dental'
--

--
-- Dumping routines for database 'dental'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-24 13:54:40
