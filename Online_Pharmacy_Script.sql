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

-- Dump completed on 2023-02-10 23:30:14
