-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: DB20152445
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Account` (
  `account_number` varchar(45) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_number`),
  CONSTRAINT `account_chk_1` CHECK ((`amount` <= 1500))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES ('1',1500),('2',200),('3',300),('4',400),('5',500),('6',600),('7',700);
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Borrow`
--

DROP TABLE IF EXISTS `Borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Borrow` (
  `customer_id` varchar(45) NOT NULL,
  `loan_number` varchar(45) NOT NULL,
  PRIMARY KEY (`customer_id`,`loan_number`),
  KEY `loan_number` (`loan_number`),
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`loan_number`) REFERENCES `loan` (`loan_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Borrow`
--

LOCK TABLES `Borrow` WRITE;
/*!40000 ALTER TABLE `Borrow` DISABLE KEYS */;
INSERT INTO `Borrow` VALUES ('1','1'),('4','10'),('1','2'),('1','3'),('2','4'),('2','5'),('2','6'),('3','7'),('4','7'),('4','8'),('4','9');
/*!40000 ALTER TABLE `Borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Branch`
--

DROP TABLE IF EXISTS `Branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Branch` (
  `branch_name` varchar(45) NOT NULL,
  `branch_city` varchar(45) DEFAULT NULL,
  `asserts` int(11) DEFAULT NULL,
  PRIMARY KEY (`branch_name`),
  CONSTRAINT `branch_chk_1` CHECK ((`asserts` <= 5000))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branch`
--

LOCK TABLES `Branch` WRITE;
/*!40000 ALTER TABLE `Branch` DISABLE KEYS */;
INSERT INTO `Branch` VALUES ('강원대지점','강원',500),('대전대지점','대전',4000),('부산대지점','부산',500),('서울대지점','서울',1000),('숭실대지점','서울',1000),('울릉도지점','울릉',100),('제주대지점','제주',1000),('중앙대지점','서울',1000);
/*!40000 ALTER TABLE `Branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `customer_id` varchar(45) NOT NULL,
  `customer_name` varchar(45) NOT NULL,
  `customer_street` varchar(45) DEFAULT NULL,
  `customer_city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('1','강지훈','동작구 상도동 1번지','서울'),('2','김지훈','동작구 상도동 2번지','서울'),('3','이지훈','동작구 상도동 3번지','서울'),('4','박지훈','동작구 상도동 4번지','서울'),('5','이성민','연수구 연수동 1번지','인천'),('6','이동호','연수구 연수동 2번지','인천'),('7','박동주','서귀포구 서귀동 7번지','제주'),('8','김이박','금촌동 8번지','파주');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_Banker`
--

DROP TABLE IF EXISTS `Customer_Banker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_Banker` (
  `customer_id` varchar(45) NOT NULL,
  `employee_id` varchar(45) NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `customer_banker_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `customer_banker_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Banker`
--

LOCK TABLES `Customer_Banker` WRITE;
/*!40000 ALTER TABLE `Customer_Banker` DISABLE KEYS */;
INSERT INTO `Customer_Banker` VALUES ('1','1'),('2','2'),('3','2'),('4','3'),('5','4'),('6','5'),('8','6');
/*!40000 ALTER TABLE `Customer_Banker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Depositor`
--

DROP TABLE IF EXISTS `Depositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Depositor` (
  `customer_id` varchar(45) NOT NULL,
  `account_number` varchar(45) NOT NULL,
  `access_date` date DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`account_number`),
  KEY `account_number` (`account_number`),
  CONSTRAINT `depositor_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `depositor_ibfk_2` FOREIGN KEY (`account_number`) REFERENCES `account` (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Depositor`
--

LOCK TABLES `Depositor` WRITE;
/*!40000 ALTER TABLE `Depositor` DISABLE KEYS */;
INSERT INTO `Depositor` VALUES ('1','6','2015-10-01'),('2','7','2015-10-01'),('5','1','2015-10-04'),('5','2','2015-10-04'),('6','3','2015-10-01'),('6','4','2015-10-01'),('7','5','2015-10-01');
/*!40000 ALTER TABLE `Depositor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `employee_id` varchar(45) NOT NULL,
  `employee_name` varchar(45) DEFAULT NULL,
  `telephone_number` char(13) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `employee_length` int(11) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES ('1','홍지만','001-1111','2017-01-01',1),('2','김석윤','002-2222','2017-01-01',1),('3','나현숙','003-3333','2017-01-01',1),('4','양승민','004-4444','2017-01-01',1),('5','박영택','0005-5555','2017-01-01',1),('6','전문석','0006-6666','2017-01-01',1),('7','최종선','0007-7777','2017-01-01',1),('8','이상호','0008-8888','2017-01-01',1);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_Dependent`
--

DROP TABLE IF EXISTS `Employee_Dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee_Dependent` (
  `employee_id` varchar(45) NOT NULL,
  `dependent_name` varchar(45) NOT NULL,
  PRIMARY KEY (`employee_id`,`dependent_name`),
  CONSTRAINT `employee_dependent_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_Dependent`
--

LOCK TABLES `Employee_Dependent` WRITE;
/*!40000 ALTER TABLE `Employee_Dependent` DISABLE KEYS */;
INSERT INTO `Employee_Dependent` VALUES ('1','김태희'),('1','홍가을'),('1','홍봄'),('1','홍여름'),('2','고소영'),('2','김아들'),('3','장동건');
/*!40000 ALTER TABLE `Employee_Dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Loan`
--

DROP TABLE IF EXISTS `Loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Loan` (
  `loan_number` varchar(45) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`loan_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Loan`
--

LOCK TABLES `Loan` WRITE;
/*!40000 ALTER TABLE `Loan` DISABLE KEYS */;
INSERT INTO `Loan` VALUES ('1',10),('10',10),('2',20),('3',30),('4',1000),('5',1000),('6',60),('7',70),('8',80),('9',90);
/*!40000 ALTER TABLE `Loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Loan_Branch`
--

DROP TABLE IF EXISTS `Loan_Branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Loan_Branch` (
  `loan_number` varchar(45) NOT NULL,
  `branch_name` varchar(45) NOT NULL,
  PRIMARY KEY (`loan_number`),
  KEY `branch_name` (`branch_name`),
  CONSTRAINT `loan_branch_ibfk_1` FOREIGN KEY (`loan_number`) REFERENCES `loan` (`loan_number`),
  CONSTRAINT `loan_branch_ibfk_2` FOREIGN KEY (`branch_name`) REFERENCES `branch` (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Loan_Branch`
--

LOCK TABLES `Loan_Branch` WRITE;
/*!40000 ALTER TABLE `Loan_Branch` DISABLE KEYS */;
INSERT INTO `Loan_Branch` VALUES ('4','강원대지점'),('6','대전대지점'),('5','부산대지점'),('9','서울대지점'),('10','숭실대지점'),('7','숭실대지점'),('1','제주대지점'),('2','제주대지점'),('3','제주대지점'),('8','중앙대지점');
/*!40000 ALTER TABLE `Loan_Branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manager_Worker`
--

DROP TABLE IF EXISTS `Manager_Worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Manager_Worker` (
  `employee_manager` varchar(45) DEFAULT NULL,
  `employee_worker` varchar(45) NOT NULL,
  PRIMARY KEY (`employee_worker`),
  KEY `employee_manager` (`employee_manager`),
  CONSTRAINT `manager_worker_ibfk_1` FOREIGN KEY (`employee_manager`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `manager_worker_ibfk_2` FOREIGN KEY (`employee_worker`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manager_Worker`
--

LOCK TABLES `Manager_Worker` WRITE;
/*!40000 ALTER TABLE `Manager_Worker` DISABLE KEYS */;
INSERT INTO `Manager_Worker` VALUES (NULL,'1'),('1','2'),('1','3'),('1','4'),('1','5'),('1','6'),('2','7'),('2','8');
/*!40000 ALTER TABLE `Manager_Worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `loan_number` varchar(45) NOT NULL,
  `payment_number` int(11) NOT NULL,
  `payment_amount` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`loan_number`,`payment_number`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`loan_number`) REFERENCES `loan` (`loan_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES ('1',1,4,'2015-01-01'),('1',2,5,'2016-01-01'),('1',3,6,'2017-01-01'),('10',1,5,'2015-01-01'),('10',2,5,'2015-01-01'),('4',1,1000,'2015-10-04'),('5',1,1000,'2015-10-04');
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-12 23:04:47
