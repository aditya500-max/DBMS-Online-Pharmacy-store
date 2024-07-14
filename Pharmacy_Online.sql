CREATE DATABASE  IF NOT EXISTS `pharmacy_store` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pharmacy_store`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: pharmacy_store
-- ------------------------------------------------------
-- Server version	8.0.31

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
  `Name` varchar(40) NOT NULL,
  `Admin_ID` int NOT NULL,
  `Password` varchar(40) NOT NULL,
  `Pharmacy_address` varchar(70) DEFAULT NULL,
  `Email_id` varchar(40) DEFAULT NULL,
  `Phone_no` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`Admin_ID`),
  UNIQUE KEY `Admin_ID` (`Admin_ID`),
  KEY `admin_index` (`Name`,`Admin_ID`,`Pharmacy_address`,`Phone_no`),
  KEY `ad_index` (`Admin_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('amit',124,'asd','a20 road','b@gmail.com','7890'),('mit',125,'asd','kota road','v@gmail.com','7891'),('sunitit',127,'asd','abu road','g@gmail.com','7893'),('kamla',128,'asd','78 rc','k@gmail.com','7896'),('bamta',129,'asd','09 bo','b5t@gmail.com','7898');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `BILL_ID` int NOT NULL,
  `PID` int NOT NULL,
  `ADDRESS_DELIVERED` varchar(70) NOT NULL,
  `DRUG_ID` int NOT NULL,
  `QUANTITY` int NOT NULL,
  `PHONE_NO` bigint DEFAULT NULL,
  `TOTAL_PRICE` bigint DEFAULT NULL,
  PRIMARY KEY (`BILL_ID`),
  KEY `PID` (`PID`),
  KEY `DRUG_ID` (`DRUG_ID`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `patient` (`PID`),
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`DRUG_ID`) REFERENCES `medicine_details` (`DRUG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,11,'1234 Main St',11,1,1234567890,500),(2,12,'5678 Elm St',12,5,1234567891,250),(3,13,'9101 Oak St',13,15,1234567892,750),(4,14,'1213 Birch Ave',14,20,1234567893,1000),(5,15,'4156 Maple Rd',15,2,1234567894,1250),(6,16,'7190 Pine St',16,3,1234567895,1500),(7,17,'8021 Cedar Ave',17,5,1234567896,1750),(8,18,'9123 Willow Rd',18,4,1234567897,2000),(9,19,'1023 Elm St',19,4,1234567898,2250),(10,20,'2134 Oak Ave',10,10,1234567899,2500),(11,21,'3145 Maple St',20,12,1234567900,2750),(12,22,'4156 Pine Rd',21,6,1234567901,3000),(13,23,'5167 Cedar St',2,13,1234567902,3250),(14,24,'6178 Willow Ave',3,7,1234567903,3500),(15,25,'7189 Elm Rd',11,4,1234567904,3750),(16,26,'8100 Oak St',16,5,1234567905,4000),(17,27,'9101 Maple Ave',6,8,1234567906,4250),(18,28,'1022 Pine Rd',7,19,1234567907,4500),(19,29,'1123 Cedar St',8,9,1234567908,4750),(20,30,'2134 Willow Ave',9,12,1234567909,5000),(21,31,'3145 Elm Rd',2,15,1234567910,5250),(22,32,'4156 Oak St',13,11,1234567911,5500),(23,33,'5167 Maple Ave',15,19,1234567912,5750),(24,34,'6178 Pine Rd',21,12,1234567913,6000),(25,35,'7189 Cedar St',11,14,1234567914,6250),(26,36,'8100 Willow Ave',16,13,1234567915,6500),(29,11,'1234 Main St',1,1,1234567890,500),(60,20,'2134 Oak Ave',8,10,1234567899,2500),(61,21,'3145 Maple St',9,12,1234567900,2750),(62,22,'4156 Pine Rd',10,6,1234567901,3000),(63,23,'5167 Cedar St',11,13,1234567902,3250),(69,19,'1023 Elm St',5,4,1234567898,2250),(94,13,'9101 Oak St',2,2,1234567892,750),(95,15,'4156 Maple Rd',3,2,1234567894,1250),(96,16,'7190 Pine St',6,3,1234567895,1500),(97,17,'8021 Cedar Ave',7,5,1234567896,1750),(98,14,'1213 Birch Ave',4,20,1234567893,1000);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `CART_ID` int NOT NULL,
  `CART_ITEM` varchar(100) DEFAULT NULL,
  `QUANTITY` int DEFAULT NULL,
  `PRICE` int DEFAULT NULL,
  PRIMARY KEY (`CART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'Crocine',5,50),(2,'Advil',2,10),(3,'Cetirizine',5,8),(4,'Zyrtec',1,12),(5,'Claritin',4,14),(6,'Azithromycin',6,20),(7,'Albuterol',2,18),(8,'Prednisone',7,22),(9,'Amoxicillin',5,10),(10,'Fluticasone',4,13),(11,'Furosemide',3,19),(12,'Omeprazole',1,11),(13,'Metoprolol',2,16),(14,'Meloxicam',6,21);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_details`
--

DROP TABLE IF EXISTS `delivery_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_details` (
  `BILL_ID` int DEFAULT NULL,
  `PATIEN_NAME` varchar(40) NOT NULL,
  `PHONE_NO` bigint DEFAULT NULL,
  `ADDRESS` varchar(70) DEFAULT NULL,
  `DELIVERY_PARTNER_ID` int DEFAULT NULL,
  UNIQUE KEY `BILL_ID` (`BILL_ID`),
  CONSTRAINT `delivery_details_ibfk_1` FOREIGN KEY (`BILL_ID`) REFERENCES `bill` (`BILL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_details`
--

LOCK TABLES `delivery_details` WRITE;
/*!40000 ALTER TABLE `delivery_details` DISABLE KEYS */;
INSERT INTO `delivery_details` VALUES (1,'Julli',92837423,'4156 Maple Rd',12),(2,'Jessica',45743562,'1213 Birch Ave',13),(3,'Romie',1234243,'9101 Oak St',14),(4,'Charles',2334443,'5678 Elm St',15),(5,'Mark',922432423,'1234 Main St',16);
/*!40000 ALTER TABLE `delivery_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Name` varchar(40) NOT NULL,
  `Employee_ID` int NOT NULL,
  `Position` varchar(40) NOT NULL,
  `Email_id` varchar(40) DEFAULT NULL,
  `Phone_no` varchar(34) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  UNIQUE KEY `Employee_ID` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('amit',1224,'CEO','b111@gmail.com','789000'),('mit',1225,'CTO','v111@gmail.com','78999991'),('kamla',1228,'EXECUTIVE','k222@gmail.com','7891116'),('bamta',1229,'CLERK','b5333t@gmail.com','73333898'),('sunitit',12227,'CTTO','g111@gmail.com','77777893');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine_details`
--

DROP TABLE IF EXISTS `medicine_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine_details` (
  `NAME_OF_DRUG` varchar(50) NOT NULL,
  `DRUG_ID` int NOT NULL,
  `MFG_DATE` date NOT NULL,
  `EXPIRY_DATE` date NOT NULL,
  `SUPPLIER` varchar(50) DEFAULT NULL,
  `QUANTITY` int DEFAULT NULL,
  `PRICE` int DEFAULT NULL,
  PRIMARY KEY (`DRUG_ID`),
  UNIQUE KEY `NAME_OF_DRUG` (`NAME_OF_DRUG`),
  UNIQUE KEY `DRUG_ID` (`DRUG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine_details`
--

LOCK TABLES `medicine_details` WRITE;
/*!40000 ALTER TABLE `medicine_details` DISABLE KEYS */;
INSERT INTO `medicine_details` VALUES ('Aspirin',1,'2022-01-01','2023-12-31','Pfizer',500,10),('Paracetamol',2,'2022-03-01','2023-06-30','Johnson & Johnson',700,5),('Ibuprofene',3,'2022-04-01','2023-09-30','Bayer',400,15),('Amoxicilline',4,'2022-05-01','2023-11-30','GlaxoSmithKline',300,25),('Metformine',5,'2022-06-01','2024-01-31','Sanofi',600,20),('Lisinoprile',6,'2022-07-01','2024-03-31','AstraZeneca',500,30),('Omeprazol',7,'2022-08-01','2024-06-30','Pfizer',400,35),('Atorvstatin',8,'2022-09-01','2024-09-30','Bristol-Myers Squibb',300,40),('Hydrochlorothazide',9,'2022-10-01','2024-12-31','Sanofi',700,25),('Azithromycine',10,'2022-11-01','2025-03-31','Pfizer',500,20),('Aspiriin',11,'2022-01-01','2023-12-31','Pfizer',500,10),('Paracetamole',12,'2022-03-01','2023-06-30','Johnson & Johnson',700,5),('Ibuprofen',13,'2022-04-01','2023-09-30','Bayer',400,15),('Amoxicillin',14,'2022-05-01','2023-11-30','GlaxoSmithKline',300,25),('Metformin',15,'2022-06-01','2024-01-31','Sanofi',600,20),('Lisinopril',16,'2022-07-01','2024-03-31','AstraZeneca',500,30),('Omeprazole',17,'2022-08-01','2024-06-30','Pfizer',400,35),('Atorvastatin',18,'2022-09-01','2024-09-30','Bristol-Myers Squibb',300,40),('Hydrochlorothiazide',19,'2022-10-01','2024-12-31','Sanofi',700,25),('Azithromycin',20,'2022-11-01','2025-03-31','Pfizer',500,20),('Aspirine',21,'2022-01-01','2023-12-31','Pfizer',500,10);
/*!40000 ALTER TABLE `medicine_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ORDER_ID` int NOT NULL,
  `ORDER_Name` varchar(40) NOT NULL,
  `QUANTITY` int DEFAULT NULL,
  `TOTAL_PRICE` int DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  UNIQUE KEY `ORDER_ID` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (45,'AYURVEDA',3,233),(46,'ALLOPATHY',2,6700),(48,'SURGICAL',7,3400),(49,'CANCEROUS',9,15600),(75,'HOMPATHY',6,470);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `FIRST_NAME` varchar(50) NOT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `PID` int NOT NULL,
  `AGE` int DEFAULT NULL,
  `MEDICATION` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone_no` bigint DEFAULT NULL,
  PRIMARY KEY (`PID`),
  UNIQUE KEY `PHONE_NO` (`phone_no`),
  UNIQUE KEY `EMAIL` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('RAM','LAL',1,57,'CROCINE','RAMLAL001@GMAIL.COM',9871234),('RAMESH','KUMAR',2,23,'PARA','RAMESH@Gmiail.com',98123451),('John','Smith',3,45,'Cetirizine','johnsmith@gmail.com',58734890),('Jerry','Williams',4,32,'Diabetes Medication','jerrywilliams@example.com',789456123),('Larry','Jones',5,48,'Allergy Medication','larryjones@example.com',456789123),('Karen','Brown',6,41,'Birth Control','karenbrown@example.com',654321987),('Paul','Davis',7,24,'Antidepressants','pauldavis@example.com',321987654),('Harry','Miller',8,57,'Blood Pressure Medication','harrymiller@example.com',987654321),('Robert','Jones',9,25,'Metformin','robertjones@mail.com',8172569845),('Michael','Brown',10,48,'Aspirin','michaelbrown@mail.com',8174956253),('Linda','Davis',11,52,'Synthroid','lindadavis@mail.com',8196352748),('Barbara','Miller',12,44,'Furosemide','barbaramiller@mail.com',8123785642),('William','Jackson',13,41,'Ibuprofen','william.jackson@email.com',12345678912),('Elizabeth','White',14,27,'Paracetamol','elizabeth.white@email.com',12345678913),('Christopher','Harris',15,39,'Aspirin','christopher.harris@email.com',12345678914),('Sarah','Martin',16,34,'Acetaminophen','sarah.martin@email.com',12345678915),('Michael','Thompson',17,43,'Ibuprofen','michael.thompson@email.com',12345678916),('Jennifer','Young',18,29,'Paracetamol','jennifer.young@email.com',12345678917),('John','Allen',19,37,'Aspirin','john.allen@email.com',12345678918),('Jessica','King',20,32,'Acetaminophen','jessica.king@email.com',12345678919),('William','Wright',21,44,'Ibuprofen','william.wright@email.com',12345678920),('Elizabeth','Clark',22,28,'Paracetamol','elizabeth.clark@email.com',12345678921),('John','Lewis',23,35,'Aspirin','john.lewis@email.com',12345678922),('Sarah','Robinson',24,31,'Acetaminophen','sarah.robinson@email.com',12345678923),('Michael','Walker',25,43,'Ibuprofen','michael.walker@email.com',12345678924),('Jane','Perez',26,32,'Paracetamol','jane.perez@email.com',12345678925),('William','Hall',27,40,'Aspirin','willi.kumar@email.com',12345678926),('Emily','Young',28,29,'Acetaminophen','emily.young@email.com',12345678927),('James','Allen',29,42,'Ibuprofen','james.allen@email.com',12345678928),('Jennifer','King',30,33,'Paracetamol','jennifer.king@email.com',12345678929),('David','Wright',31,36,'Aspirin','david.wright@email.com',12345678930),('Sarah','Clark',32,34,'Acetaminophen','sarah.clark@email.com',12345678931),('Michael','Lewis',33,43,'Ibuprofen','michael.lewis@email.com',12345678932),('Jennifer','Robinson',34,29,'Paracetamol','jennifer.robinson@email.com',12345678933),('John','Walker',35,37,'Aspirin','johnny.walker@email.com',12345678934),('Jessica','Perez',36,32,'Acetaminophen','jessica.perez@email.com',12345678935),('William','Hall',37,44,'Ibuprofen','william.hall@email.com',12345678936),('Elizabeth','Young',38,27,'Paracetamol','elizabeth.young@email.com',12345678937),('Christopher','Allen',39,39,'Aspirin','christopher.allen@email.com',12345678938),('Sarah','King',40,34,'Acetaminophen','sarah.king@email.com',12345678939),('Michael','Wright',41,43,'Ibuprofen','michael.wright@email.com',12345678940),('William','Lewis',42,44,'Ibuprofen','william.lewis@email.com',12345678942),('Elizabeth','Robinson',43,28,'Paracetamol','elizabeth.robinson@email.com',12345678943),('John','Walker',44,35,'Aspirin','john.walker@email.com',12345678944),('Sarah','Perez',45,31,'Acetaminophen','sarah.perez@email.com',12345678945),('Michael','Hall',46,43,'Ibuprofen','michael.hall@email.com',12345678946),('Jane','Young',47,32,'Paracetamol','jane.young@email.com',12345678947),('William','Allen',48,40,'Aspirin','william.allen@email.com',12345678948),('Emily','King',49,29,'Acetaminophen','emily.king@email.com',12345678949),('James','Wright',50,42,'Ibuprofen','james.wright@email.com',12345678950),('Jennifer','Clark',51,33,'Paracetamol','jennifer.clark@email.com',12345678951),('David','Lewis',52,36,'Aspirin','david.lewis@email.com',12345678952),('Sarah','Robinson',53,34,'Acetaminophen','sarah.robin@email.com',12345678953),('Michael','Walker',54,43,'Ibuprofen','michael.walk@email.com',12345678954),('Jennifer','Perez',55,29,'Paracetamol','jennifer.perez@email.com',12345678955),('John','Hall',56,37,'Aspirin','john.hall@email.com',12345678956),('Jessica','Young',57,32,'Acetaminophen','jessica.young@email.com',12345678957),('William','Allen',58,44,'Ibuprofen','william.allien@email.com',12345678958),('Elizabeth','King',59,27,'Paracetamol','elizabeth.king@email.com',12345678959),('Christopher','Wright',60,39,'Aspirin','christopher.wright@email.com',12345678960),('Sarah','Clark',61,34,'Acetaminophen','sarah.clarck@email.com',12345678961),('Michael','Lewis',62,43,'Ibuprofen','michael.lewiss@email.com',12345678962),('Emily','Walker',63,32,'Acetaminophen','emily.walker@email.com',12345678963),('James','Perez',64,41,'Ibuprofen','james.perez@email.com',12345678964),('Jennifer','Hall',65,28,'Paracetamol','jennifer.hall@email.com',12345678965),('David','Young',66,35,'Aspirin','david.young@email.com',12345678966),('Sarah','Allen',67,33,'Acetaminophen','sarah.allen@email.com',12345678967),('Michael','King',68,42,'Ibuprofen','michael.king@email.com',12345678968),('Jennifer','Wright',69,29,'Paracetamol','jennifer.wright@email.com',12345678969),('John','Clark',70,36,'Aspirin','john.clark@email.com',12345678970),('Jessica','Lewis',71,32,'Acetaminophen','jessica.lewis@email.com',12345678971),('William','Robinson',72,44,'Ibuprofen','william.robinson@email.com',12345678972),('Elizabeth','Walker',73,27,'Paracetamol','elizabeth.walker@email.com',12345678973),('Christopher','Perez',74,38,'Aspirin','christopher.perez@email.com',12345678974),('Sarah','Hall',75,34,'Acetaminophen','sarah.hall@email.com',12345678975),('Michael','Young',76,43,'Ibuprofen','michael.young@email.com',12345678976),('Jennifer','Allen',77,29,'Paracetamol','jennifer.allen@email.com',12345678977),('John','King',78,37,'Aspirin','john.king@email.com',12345678978),('Jessica','Wright',79,32,'Acetaminophen','jessica.wright@email.com',12345678979),('William','Clark',80,44,'Ibuprofen','william.clark@email.com',12345678980),('Elizabeth','Lewis',81,28,'Paracetamol','elizabeth.lewis@email.com',12345678981),('Christopher','Robinson',82,39,'Aspirin','christopher.robinson@email.com',12345678982),('Sarah','Walker',83,34,'Acetaminophen','sarah.walker@email.com',12345678983),('Jane','Doe',84,32,'Ibuprofen','jane.doe@email.com',2345678901),('Michael','Smith',85,40,'Paracetamol','michael.smith@email.com',3456789012),('Emily','Johnson',86,38,'Naproxen','emily.johnson@email.com',4567890123),('Matthew','Williams',87,41,'Acetaminophen','matthew.williams@email.com',5678901234),('Jessica','Jones',88,36,'Morphine','jessica.jones@email.com',6789012345),('William','Brown',89,42,'Codeine','william.brown@email.com',7890123456),('Ashley','Davis',90,31,'Hydrocodone','ashley.davis@email.com',8901234567),('David','Miller',91,39,'Oxycodone','david.miller@email.com',9012345678),('Sarah','Wilson',92,33,'Diclofenac','sarah.wilson@email.com',123456789),('Brian','Anderson',93,37,'Meloxicam','brian.anderson@email.com',1234567890),('Amy','Thomas',94,29,'Methadone','amy.thomas@email.com',2345678678),('James','Jackson',95,45,'Tramadol','james.jackson@email.com',3456789056),('Elizabeth','White',96,43,'Fentanyl','elizabeth.black@email.com',4567832123),('Daniel','Harris',97,34,'Percocet','daniel.harris@email.com',5678121234),('Ava','Clark',98,30,'Vicodin','ava.clark@email.com',6789012343),('Ethan','Lewis',99,28,'Lortab','ethan.lewis@email.com',7890145456),('Isabella','Robinson',100,31,'Norco','isabella.robinson@email.com',8901232367);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `Doctor_Name` varchar(40) NOT NULL,
  `Hospital` varchar(40) DEFAULT NULL,
  `Patient` varchar(40) NOT NULL,
  `Prescription_Id` int NOT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`Prescription_Id`),
  UNIQUE KEY `Prescription_Id` (`Prescription_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES ('dr. seena','hpm','srta',213,5),('dr. ram','hpc','aburta',214,6),('dr. sham','bgt','sera',215,5),('dr. siya','pant','qrta',216,8),('dr. kita','apolo','yrta',217,5);
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_details`
--

DROP TABLE IF EXISTS `sales_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_details` (
  `Invoice_ID` int NOT NULL,
  `Medicine_Name` varchar(40) NOT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `ITEM_CODE` varchar(70) DEFAULT NULL,
  `Total_quantity` int DEFAULT NULL,
  `Total_sales` int DEFAULT NULL,
  PRIMARY KEY (`Invoice_ID`),
  UNIQUE KEY `Invoice_ID` (`Invoice_ID`),
  KEY `sales_index` (`Invoice_ID`,`Medicine_Name`,`ITEM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_details`
--

LOCK TABLES `sales_details` WRITE;
/*!40000 ALTER TABLE `sales_details` DISABLE KEYS */;
INSERT INTO `sales_details` VALUES (1,'boyu','2021-08-09','11:12:13','23',1,190),(2,'coyu','2021-08-04','03:12:13','33',4,1990),(3,'doyu','2021-08-03','01:12:13','43',6,193),(4,'zoyu','2021-08-02','10:12:13','53',6,140),(5,'eoyu','2021-08-01','10:22:13','63',8,230);
/*!40000 ALTER TABLE `sales_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `NAME` varchar(50) NOT NULL,
  `COMPANY` varchar(50) NOT NULL,
  `SUPPLIER_ID` int NOT NULL,
  `PHONE_NO` bigint DEFAULT NULL,
  `DRUG_ID` int DEFAULT NULL,
  PRIMARY KEY (`SUPPLIER_ID`),
  KEY `DRUG_ID` (`DRUG_ID`),
  KEY `supplier_index` (`SUPPLIER_ID`,`DRUG_ID`),
  CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`DRUG_ID`) REFERENCES `medicine_details` (`DRUG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('wer','trui',60,2241,14),('wer','qwenbx',61,2541,13),('wer','raert',64,2371,12),('wer','rmju',66,2391,21),('wer','ranbxy',67,2341,2);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pharmacy_store'
--

--
-- Dumping routines for database 'pharmacy_store'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-11  0:04:27
