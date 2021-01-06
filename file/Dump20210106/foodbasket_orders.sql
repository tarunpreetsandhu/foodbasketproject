CREATE DATABASE  IF NOT EXISTS `foodbasket` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `foodbasket`;
-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: localhost    Database: foodbasket
-- ------------------------------------------------------
-- Server version	5.5.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(405) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `datetime` varchar(45) DEFAULT NULL,
  `totalprice` int(11) DEFAULT NULL,
  `totalofferprice` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk4` (`username`),
  CONSTRAINT `fk4` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Pratap nagar,100ft Road','Amritsar','tarun','Mon Dec 21 14:38:37 IST 2020',250,250),(2,'Pratap nagar,100ft Road','Chandigarh','tarun','Wed Dec 23 13:49:42 IST 2020',250,250),(3,'lohrka road','Delhi','tarun','Thu Dec 24 11:23:45 IST 2020',250,250),(4,'Pratap nagar,100ft Road','Hyderabad','tarun','Fri Dec 25 14:17:41 IST 2020',170,170),(5,'Pratap nagar,100ft Road','Hyderabad','tarun','Fri Dec 25 14:18:17 IST 2020',0,0),(6,'nbvnbv','Nagpur','tarun','Fri Dec 25 14:21:23 IST 2020',0,0),(7,'nbvnbv','Nagpur','tarun','Fri Dec 25 14:24:15 IST 2020',0,0),(8,'bmnbmn','Meerut','tarun','Fri Dec 25 14:24:54 IST 2020',0,0),(9,'bmnbmb','Jodhpur','tarun','Fri Dec 25 14:29:10 IST 2020',0,0),(10,'bmnbmb','Jodhpur','tarun','Fri Dec 25 14:29:11 IST 2020',0,0),(11,'Ranjit Avenue','Chandigarh','payal','Mon Dec 28 10:59:01 IST 2020',75,75),(12,'abc','Ambala','tarun','Thu Dec 31 15:49:32 IST 2020',330,330),(13,'oo','Ajmer','tarun','Thu Dec 31 16:00:35 IST 2020',550,550),(14,'lohrka road','Jalandhar','tarun','Thu Dec 31 16:04:50 IST 2020',340,340),(15,'7777','Amritsar','tarun','Thu Dec 31 16:10:41 IST 2020',280,280),(16,'4652','Allahabad','tarun','Thu Dec 31 16:12:04 IST 2020',59,59),(17,'4652','Allahabad','tarun','Thu Dec 31 16:12:04 IST 2020',0,0),(18,'pratap nagar','Amritsar','prabh','Fri Jan 01 15:58:13 IST 2021',250,250),(19,'Majitha Road','Bhopal','gagan','Mon Jan 04 12:03:08 IST 2021',310,310);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-06 14:04:44
