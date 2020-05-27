CREATE DATABASE  IF NOT EXISTS `carsys` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `carsys`;
-- MySQL dump 10.13  Distrib 5.6.10, for Win64 (x86_64)
--
-- Host: localhost    Database: carsys
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `carmessage`
--

DROP TABLE IF EXISTS `carmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carName` varchar(100) DEFAULT NULL,
  `carType` varchar(100) DEFAULT NULL,
  `carSeries` varchar(200) DEFAULT NULL,
  `price` decimal(65,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carmessage`
--

LOCK TABLES `carmessage` WRITE;
/*!40000 ALTER TABLE `carmessage` DISABLE KEYS */;
INSERT INTO `carmessage` VALUES (1,'别克','VELITE 6','VELITE 6',20.00),(2,'别克','GL8商务车','GL8豪华商务车',30.00),(3,'凯迪拉克','XT4','凯迪拉克 XT4',40.00),(4,'凯迪拉克','A2LL','凯迪拉克 A2LL',40.00),(5,'雪佛兰','K229','K229 BEV LS',20.00),(6,'雪佛兰','科鲁兹掀背车','科鲁兹掀背车 SE',25.00),(7,'别克','别克赛欧','赛欧两厢车',20.00),(8,'别克','英朗 XT','英朗 XT GL',28.00);
/*!40000 ALTER TABLE `carmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_message_id` int(11) NOT NULL,
  `count` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `car_message_idx` (`car_message_id`),
  CONSTRAINT `car_message` FOREIGN KEY (`car_message_id`) REFERENCES `carmessage` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,110),(2,2,90),(3,3,10),(4,4,58),(5,5,90),(6,6,20),(7,7,100),(8,8,200);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-27  8:56:42
