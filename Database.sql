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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` varchar(50) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('101','Shayban Khan','shayban@gmail.com','VGVzdDEyM0A=','7894561230');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointment_id` varchar(50) NOT NULL,
  `treatment_id` varchar(50) DEFAULT NULL,
  `appointment_date` datetime DEFAULT NULL,
  `dept_id` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
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
INSERT INTO `appointment` VALUES ('AZnVVPUc48','1TPbFlxTQo','2025-05-03 16:00:00','aK8JyQl9Ph','Scheduled','paid'),('jeh4eXLpRP','998uZsaSsv','2025-05-12 19:01:00','aK8JyQl9Ph','Scheduled','paid'),('Nps5JbLUOG','qPnLyJl9ZV','2025-05-05 17:30:00','G937M6ymmh','Scheduled','unpaid'),('vUxQeHDodX','VetHoypDvo','2025-05-13 18:30:00','aK8JyQl9Ph','Scheduled','paid'),('yedBPUh77m','IJHntk0O4C','2025-05-03 00:00:00','18MIA4AsbJ','completed','paid');
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
  `status` varchar(50) DEFAULT NULL,
  `treatment_assigned_at` date DEFAULT NULL,
  `payment_mode` varchar(20) DEFAULT NULL,
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
INSERT INTO `cheif_complaint` VALUES ('03lriMApal','ZRGdofLkTS','2025-05-03','Teeth Whitening','[\"jChBSxtliq\"]','550','Paid','Treatment Assigned','2025-05-03','jChBSxtliq'),('0zvOZcaNpi','ZRGdofLkTS','2025-05-03','Teeth Whitening','[\"\"]','','Paid','Treatment Assigned','2025-05-03','Cash'),('5RI3HaMZ9t','ZRGdofLkTS','2025-05-03','Teeth Cleaning','[\"jChBSxtliq\"]','550','Paid','Treatment Assigned','2025-05-03','Cash'),('6FOMrch1e1','ZRGdofLkTS','2025-05-03','teeeth Cleaning','[\"jChBSxtliq\"]','550','Paid','Treatment Assigned','2025-05-03','Cash'),('qwV9bP2ZcS','FRaTT5t8b1','2025-05-03','Root canal','[\"jChBSxtliq\",\"9lTojSgx7h\"]','850','Paid','Treatment Assigned','2025-05-03','Cash'),('u3IWhlIs4J','eFJnNywunz','2025-05-03','Teeth Pai','[\"jChBSxtliq\",\"2Zf7F3qhmv\"]','4550','Paid','Treatment Assigned','2025-05-03','Cash'),('VAnkDQ0Nqk','CqwWFZDlQv','2025-05-03','Teeth Pain','[\"jChBSxtliq\",\"2Zf7F3qhmv\",\"9lTojSgx7h\"]','4850','Paid','Treatment Assigned','2025-05-03','Cash');
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
INSERT INTO `department` VALUES ('18MIA4AsbJ','OMDR','Shayban','omdr@gmail.com','VGVzdDEyM0A='),('aK8JyQl9Ph','Prosthodontics and Crown & Bridge','Shamsiya Khan','pcb@gmail.com','VGVzdDEyM0A='),('G937M6ymmh','Conservative Dentistry & Endodontics','Shamsiya','cde@gmail.com','VGVzdDEyM0A=');
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
  `qualification` varchar(50) DEFAULT NULL,
  `specialization` varchar(50) DEFAULT NULL,
  `biography` varchar(50) DEFAULT NULL,
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
INSERT INTO `doctor` VALUES ('AgNrcuuLru','Fareeha Shakeel','fareeha@gmail.com','VGVzdDEyM0A=',1,'MBBS','8149863141','Camp','Single','aK8JyQl9Ph','Female','2000-03-29','mbbs','Cardiologist','Love to read books');
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
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(50) DEFAULT NULL,
  `test_price` bigint(20) DEFAULT NULL,
  `test_date` date DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `referred_dept` varchar(50) DEFAULT NULL,
  `complain_id` varchar(50) DEFAULT NULL,
  `report_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`test_id`),
  KEY `userid` (`userid`),
  KEY `referred_dept` (`referred_dept`),
  CONSTRAINT `test_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `test_ibfk_2` FOREIGN KEY (`referred_dept`) REFERENCES `department` (`dept_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (9,'X_RAY',500,'2025-05-03','rzTxzmukVa','18MIA4AsbJ','oS9PNmI5lz','In process'),(10,'Dental Crown (PFM)',4000,'2025-05-03','rzTxzmukVa','18MIA4AsbJ','oS9PNmI5lz','In process'),(11,'X_RAY',500,'2025-05-03','CqwWFZDlQv','18MIA4AsbJ','Q98GGp7Ozr','In process'),(12,'Dental Crown (PFM)',4000,'2025-05-03','CqwWFZDlQv','18MIA4AsbJ','Q98GGp7Ozr','In process'),(13,'X_RAY',500,'2025-05-03','CqwWFZDlQv','18MIA4AsbJ','VAnkDQ0Nqk','In process'),(14,'Dental Crown (PFM)',4000,'2025-05-03','CqwWFZDlQv','18MIA4AsbJ','VAnkDQ0Nqk','In process'),(15,'Dental Cavity Checkup',300,'2025-05-03','CqwWFZDlQv','18MIA4AsbJ','VAnkDQ0Nqk','In process'),(16,'X_RAY',500,'2025-05-03','eFJnNywunz','18MIA4AsbJ','u3IWhlIs4J','In process'),(17,'Dental Crown (PFM)',4000,'2025-05-03','eFJnNywunz','18MIA4AsbJ','u3IWhlIs4J','In process'),(18,'X_RAY',500,'2025-05-03','FRaTT5t8b1','18MIA4AsbJ','qwV9bP2ZcS','In process'),(19,'Dental Cavity Checkup',300,'2025-05-03','FRaTT5t8b1','18MIA4AsbJ','qwV9bP2ZcS','In process'),(20,'X_RAY',500,'2025-05-03','ZRGdofLkTS','18MIA4AsbJ','6FOMrch1e1','In process'),(21,'X_RAY',500,'2025-05-03','ZRGdofLkTS','18MIA4AsbJ','5RI3HaMZ9t','In process'),(22,'X_RAY',500,'2025-05-03','ZRGdofLkTS','18MIA4AsbJ','03lriMApal','In process');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_reports`
--

DROP TABLE IF EXISTS `test_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_reports` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`report_id`),
  KEY `test_id` (`test_id`),
  CONSTRAINT `test_reports_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_reports`
--

LOCK TABLES `test_reports` WRITE;
/*!40000 ALTER TABLE `test_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_reports` ENABLE KEYS */;
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
  `dept_id` varchar(50) DEFAULT NULL,
  `patientid` varchar(50) DEFAULT NULL,
  `doctorid` varchar(50) DEFAULT NULL,
  `complaint_id` varchar(50) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
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
INSERT INTO `treatment_details` VALUES ('1TPbFlxTQo','Teeth Whitening','2025-05-02','In Process',NULL,'','','aK8JyQl9Ph','ZRGdofLkTS',NULL,'03lriMApal','Paid'),('998uZsaSsv','Teeth Cleaning','2025-05-02','In Process',NULL,'','','aK8JyQl9Ph','ZRGdofLkTS',NULL,'5RI3HaMZ9t','Paid'),('IJHntk0O4C','Teeth Pai','2025-05-02','In Process',NULL,'','','18MIA4AsbJ','eFJnNywunz',NULL,'u3IWhlIs4J','Paid'),('kEx4uQdbsw','Teeth Whitening','2025-05-13','In Process',NULL,'','','aK8JyQl9Ph','ZRGdofLkTS',NULL,'0zvOZcaNpi','Paid'),('lMoGzMy36X','teeeth Cleaning','2025-05-02','In Process',NULL,'','',NULL,'ZRGdofLkTS',NULL,'6FOMrch1e1','Paid'),('qPnLyJl9ZV','Teeth Pain','2025-05-02','In Process','5000','','','G937M6ymmh','CqwWFZDlQv',NULL,'VAnkDQ0Nqk','Paid'),('VetHoypDvo','Root canal','2025-05-02','In Process','10000','','','aK8JyQl9Ph','FRaTT5t8b1',NULL,'qwV9bP2ZcS','Paid');
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
  `treatment_price` mediumtext DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `dept_id` varchar(50) DEFAULT NULL,
  KEY `fk_treatment_dept` (`dept_id`),
  CONSTRAINT `fk_treatment_dept` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment_master`
--

LOCK TABLES `treatment_master` WRITE;
/*!40000 ALTER TABLE `treatment_master` DISABLE KEYS */;
INSERT INTO `treatment_master` VALUES ('jChBSxtliq','X_RAY','500','test','18MIA4AsbJ'),('2Zf7F3qhmv','Dental Crown (PFM)','4000','test','18MIA4AsbJ'),('9lTojSgx7h','Dental Cavity Checkup','300','test','18MIA4AsbJ'),('8Iwe2n59ZH','CBCT Scan (Cone Beam CT)','5000','test','18MIA4AsbJ'),('LHr7eV9wXe','Tooth Sensitivity Test','150','test','18MIA4AsbJ'),('he9RLkn61m','Pulp Vitality Test','600','test','18MIA4AsbJ'),('oE3LuUD5BD','Root Canal','8000','treatment','G937M6ymmh');
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
  `registration_payment_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('CqwWFZDlQv','shamsiya1@kalpas.in','Vm10a1YyVnRVa1ZTV0d4T1RVVkZPUT09','Shamsiya khan','Camp pune','Female','Single','1999-04-24','Patient','7841849748','8149863141','Shayban Khan','Online'),('eFJnNywunz','abul@gmail.com','VGVzdDEyM0A=','Abul fazal','Kondwa','Male','Married','2004-02-17','patient','9876543210','9876543210','Shayban',NULL),('FRaTT5t8b1','shaybankhan@gmail.com','VGVzdDEyM0A=','Shayban Khan','Camp center street','Female','','1974-06-01','Patient','+918149863141','7841849749','Shamsiya Khan','UPI'),('qlSwZhbGGG','malik@gmail.com','VGVzdDEyM0A=','Malik Ahmed','lucknow','Male','Single','1999-10-23','Clerk','9527789211','8149863141','Shayban Khan',NULL),('rzTxzmukVa','shamsiya@gmail.com','VGVzdDEyM0A=','Shamsiya Khan','Kharadi','Female','Single','1999-04-27','patient','9898989898','978654321','shayban',NULL),('ZRGdofLkTS','shamsiya@kalpas.in','VGVzdDEyM0A=','Shamsiya khan','Kharadi','Female','Single','1999-04-27','Patient','7841849748','8149863141','Shayban Khan','Online');
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

-- Dump completed on 2025-08-02 12:05:03
