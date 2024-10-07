-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: bankapp
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `bank_accounts`
--

DROP TABLE IF EXISTS `bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_accounts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_number` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `balance` double NOT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_number` (`account_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_accounts`
--

LOCK TABLES `bank_accounts` WRITE;
/*!40000 ALTER TABLE `bank_accounts` DISABLE KEYS */;
INSERT INTO `bank_accounts` VALUES (1,'BA123456789','Selim Yılmaz',1899,'2023-01-15 07:30:00'),(2,'BA987654321','Ayşe Demir',2600.75,'2023-02-20 11:45:00'),(3,'BA135792468','Mehmet Can',3200.5,'2023-03-10 06:15:00'),(4,'BA246813579','Fatma Çelik',1800,'2023-04-05 08:00:00'),(5,'BA864209753','Ahmet Korkmaz',4200.3,'2023-05-15 12:30:00');
/*!40000 ALTER TABLE `bank_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` double NOT NULL,
  `transaction_type` varchar(255) NOT NULL,
  `approval_code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_ibfk_1` (`account_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `bank_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,'2023-01-20 09:00:00',300,'CREDIT','APPROVED123'),(2,1,'2023-02-10 12:00:00',200,'DEBIT','APPROVED456'),(3,2,'2023-02-25 13:00:00',500,'CREDIT','APPROVED789'),(4,2,'2023-03-15 06:00:00',150,'DEBIT','APPROVED012'),(5,3,'2023-03-18 15:00:00',700,'CREDIT','APPROVED345'),(6,3,'2023-03-25 07:30:00',300,'DEBIT','APPROVED678'),(7,4,'2023-04-10 11:00:00',400,'CREDIT','APPROVED901'),(8,4,'2023-04-15 08:45:00',100,'DEBIT','APPROVED234'),(9,5,'2023-05-20 10:00:00',1200,'CREDIT','APPROVED567'),(10,5,'2023-05-25 13:30:00',500,'DEBIT','APPROVED890'),(11,1,'2024-10-05 00:45:10',999,'DepositTransaction','6e094201-8360-44e8-aaf6-0e603ad8e76c'),(12,1,'2024-10-05 00:45:58',200,'WithdrawalTransaction','448947b4-6c48-4d12-83d3-a15905a6de59'),(13,1,'2024-10-05 00:46:03',200,'WithdrawalTransaction','6b78080b-5a4c-42eb-8df5-9462165ca2bb'),(14,1,'2024-10-05 00:46:27',200,'WithdrawalTransaction','344bf29f-d94c-4669-98e5-0ff31327f9b1'),(15,2,'2024-10-05 01:03:30',100,'DepositTransaction','7da3bdba-3502-49a9-ba89-f4c3698f5a72'),(16,2,'2024-10-05 01:03:37',100,'DepositTransaction','bf3d0481-437e-49a2-a755-3369c0f946cc'),(17,2,'2024-10-05 01:03:44',50,'WithdrawalTransaction','c892a6a9-757f-4ddc-9573-31b9b6730551'),(18,2,'2024-10-05 01:03:46',50,'WithdrawalTransaction','0114c2c7-629e-4b6f-a757-706ccfb705ec');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-07 10:25:28
