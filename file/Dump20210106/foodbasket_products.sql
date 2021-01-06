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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(405) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `offerprice` int(11) DEFAULT NULL,
  `brand` varchar(45) DEFAULT NULL,
  `categoryname` varchar(45) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `fk1` (`categoryname`),
  KEY `fk88` (`mid`),
  CONSTRAINT `fk88` FOREIGN KEY (`mid`) REFERENCES `merchants` (`mid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk1` FOREIGN KEY (`categoryname`) REFERENCES `categories` (`categoryname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Blue Lays','This Pack contains 52 grams with Magic masala flavour','myuploads\\bchips.jpg',30,25,'Lays_india','Snacks',8),(2,'Rajdhani Besan Grade 1','No Returns Applicable. Cash on Delivery available.','myuploads\\besan.jpg',150,120,'Rajdhani','Rice and Flours',6),(3,'Patanjali Besan','No Returns Applicable. Cash on Delivery available.','myuploads\\besan2.jpg',150,115,'Patanjali','Rice and Flours',7),(4,'Organic Soul Black Channa','No Returns Applicable. Cash on Delivery available.','myuploads\\blackchaana.jpg',250,240,'Organic Soul','Pulses',9),(5,'Channa dal','No Returns Applicable. Cash on Delivery available.','myuploads\\chanadal.jpg',240,220,'Agro plus','Pulses',10),(6,'Coca-Cola','Cash on Delivery available.','myuploads\\cocacola.jpg',45,40,'Coca-Cola','Soft Drinks',8),(7,'Fanta','Cash on Delivery available.','myuploads\\fanta.jpg',40,35,'Coca-Cola','Soft Drinks',8),(8,'Daawat Traditional Rice','No Returns Applicable. Cash on Delivery available.','myuploads\\dawatrice1.jpeg',299,260,'Daawat','Rice and Flours',9),(9,'Daawat Extra Long Basmati Rice','No Returns Applicable. Cash on Delivery available.','myuploads\\dawatrice2.jpg',360,300,'Daawat','Rice and Flours',7),(10,'Daawat Super Basmati Rice','No Returns Applicable. Cash on Delivery available.','myuploads\\dawatrice3.jpg',320,290,'Daawat','Rice and Flours',10),(11,'Daawat Briyani Rice','No Returns Applicable. Cash on Delivery available.','myuploads\\dawatrice4.jpg',320,290,'Daawat','Rice and Flours',6),(12,'Daawat Pulav Basmati Rice','No Returns Applicable. Cash on Delivery available.','myuploads\\dawatricr6.jpg',330,300,'Daawat','Rice and Flours',8),(13,'Daawat Rozana Basmati Rice','No Returns Applicable. Cash on Delivery available.','myuploads\\dawatrice6.png',320,290,'Daawat','Rice and Flours',9),(14,'Aashirwaad Shudh Chakki Atta','Cash on Delivery available.','myuploads\\f1.png',499,409,'Aashirwaad','Rice and Flours',7),(15,'Aashirwaad Atta with Multigrains','Cash on Delivery available.','myuploads\\f2.png',520,460,'Aashirwaad','Rice and Flours',8),(16,'Aashirwaad Select Atta','Cash on Delivery available.','myuploads\\f4.jpeg',480,420,'Aashirwaad','Rice and Flours',10),(17,'Organic Whole Wheat Atta','Cash on Delivery available.','myuploads\\f3.jpg',590,472,'Organic','Rice and Flours',10),(18,'Green Lays','Cash on Delivery available.','myuploads\\gchips.jpg',25,20,'Lays_india','Snacks',10),(19,'Limca','Cash on Delivery available.','myuploads\\limca.jpg',35,30,'Coca-Cola','Soft Drinks',10),(20,'Pepsi','Cash on Delivery available.','myuploads\\pepsi.jpg',35,30,'Coca-Cola','Soft Drinks',8),(21,'Mountain Dew','No Returns Applicable. Cash on Delivery available.','myuploads\\mountaindew.jpg',35,30,'Coca-Cola','Soft Drinks',8),(22,'Red Lays','No Returns Applicable. Cash on Delivery available.','myuploads\\redchips.jpg',25,20,'Lays_india','Snacks',7),(23,'Doritos Purple','No Returns Applicable. Cash on Delivery available.','myuploads\\c1.jpeg',59,50,'Doritos','Snacks',10),(24,'Doritos Red','Cash on Delivery available.','myuploads\\c2.jpeg',59,50,'Doritos','Snacks',7),(25,'Doritos Orange','Cash on Delivery available.','myuploads\\c3.jpeg',59,50,'Doritos','Snacks',6),(26,'Doritos Blue','Cash on Delivery available.','myuploads\\c4.jpeg',59,50,'Doritos','Snacks',7),(27,'Rajma','No Returns Applicable. Cash on Delivery available.','myuploads\\rajma.png',290,250,'Agro Pure','Pulses',9),(28,'Toor Dal','No Returns Applicable. Cash on Delivery available.','myuploads\\toordal.jpg',360,300,'Tata','Pulses',8),(29,'Masoor Dal','No Returns Applicable. Cash on Delivery available.','myuploads\\masoordal.jpg',340,290,'Tata','Pulses',10),(30,'Lobiya','No Returns Applicable. Cash on Delivery available.','myuploads\\lobiya.jpg',280,250,'Rajdhani','Pulses',10),(31,'Moong Dal','No Returns Applicable. Cash on Delivery available.','myuploads\\moongdal.png',290,260,'Rajasthani','Pulses',10),(32,'Urad Dal','No Returns Applicable. Cash on Delivery available.','myuploads\\d2.jpg',220,190,'GoShudh','Pulses',6),(33,'Vezlay Soya Veg Meat','No Returns Applicable. Cash on Delivery available.','myuploads\\fr1.jpeg',550,540,'Vezlay','Frozen Food',7),(34,'Vezlay Soya Indi Chop','No Returns Applicable. Cash on Delivery available.','myuploads\\fr2.jpeg',396,390,'Vezlay','Frozen Food',8),(35,'McCain Smiles','No Returns Applicable. Cash on Delivery available.','myuploads\\fr3.png',160,152,'McCain','Frozen Food',9),(36,'McCain Super Wedges','No Returns Applicable. Cash on Delivery available.','myuploads\\fr4.png',210,200,'McCain','Frozen Food',10),(37,'McCain Veggie Burger','No Returns Applicable. Cash on Delivery available.','myuploads\\fr5.png',165,150,'McCain','Frozen Food',6),(38,'McCain Crazy Fries Masala Mix Herbs n Garlic','No Returns Applicable. Cash on Delivery available.','myuploads\\fr6.png',200,185,'McCain','Frozen Food',7),(39,'McCain Crazy Fries Masala Mix Hot n Tangy','No Returns Applicable. Cash on Delivery available.','myuploads\\fr7.png',210,196,'McCain','Frozen Food',8),(40,'McCain Smiles Tangy Tomato','No Returns Applicable. Cash on Delivery available.','myuploads\\fr8.png',210,200,'McCain','Frozen Food',9),(41,'McCain Veggie Nuggets','No Returns Applicable. Cash on Delivery available.','myuploads\\fr9.png',170,155,'McCain','Frozen Food',6),(42,'McCain Chilli Garlic Potato Bites','No Returns Applicable. Cash on Delivery available.','myuploads\\fr10.png',190,175,'McCain','Frozen Food',8),(43,'McCain Potato Cheese Shotz','No Returns Applicable. Cash on Delivery available.','myuploads\\fr11.png',210,186,'McCain','Frozen Food',9),(44,'McCain Mini Samosa Cheese Corn','No Returns Applicable. Cash on Delivery available.','myuploads\\fr12.png',280,250,'McCain','Frozen Food',7),(45,'McCain Mini Samosa Cheese Pizza','No Returns Applicable. Cash on Delivery available.','myuploads\\fr13.png',280,250,'McCain','Frozen Food',8),(46,'McCain Chilli Cheesy Nuggets','No Returns Applicable. Cash on Delivery available.','myuploads\\fr14.png',190,175,'McCain','Frozen Food',9),(47,'McCain Aloo Tikki','No Returns Applicable. Cash on Delivery available.','myuploads\\fr15.jpeg',150,142,'McCain','Frozen Food',6),(48,'MDH Black Pepper Powder','Cash on Delivery available.','myuploads\\s1.jpg',170,152,'MDH','Spices',7),(49,'MDH Butter Chicken Masala','Cash on Delivery available.','myuploads\\s10.jpg',175,160,'MDH','Spices',8),(50,'MDH Garam Masala','Cash on Delivery available.','myuploads\\s11.jpg',165,158,'MDH','Spices',9),(51,'MDH Kitchen King','Cash on Delivery available.','myuploads\\s12.jpg',178,160,'MDH','Spices',8),(52,'MDH Pav Bhaji Masala','Cash on Delivery available.','myuploads\\s13.jpg',155,152,'MDH','Spices',10),(53,'MDH Shahi Paneer Masala','Cash on Delivery available.','myuploads\\s14.jpg',165,162,'MDH','Spices',10),(54,'MDH Mutton Masala','Cash on Delivery available.','myuploads\\s15.jpg',165,158,'MDH','Spices',10),(55,'MDH Degi Mirch','Cash on Delivery available.','myuploads\\s2.jpg',175,169,'MDH','Spices',10),(56,'MDH Dhania Powder','No Returns Applicable. Cash on Delivery available.','myuploads\\s3.jpg',165,162,'MDH','Spices',10),(57,'MDH Haldi Powder','No Returns Applicable. Cash on Delivery available.','myuploads\\s4.jpg',168,162,'MDH','Spices',10),(58,'MDH Jeera Powder','No Returns Applicable. Cash on Delivery available.','myuploads\\s5.jpg',190,185,'MDH','Spices',10),(59,'MDH Kastori Methi','No Returns Applicable. Cash on Delivery available.','myuploads\\s6.jpg',165,164,'MDH','Spices',8),(60,'MDH Aamchoor Powder','No Returns Applicable. Cash on Delivery available.','myuploads\\s7.jpg',175,165,'MDH','Spices',9),(61,'MDH Briyani Powder','No Returns Applicable. Cash on Delivery available.','myuploads\\s8.jpg',172,160,'MDH','Spices',9),(62,'MDH Channa Powder','No Returns Applicable. Cash on Delivery available.','myuploads\\s9.jpg',169,152,'MDH','Spices',9);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-06 14:04:43
