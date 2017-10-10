-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: caruca
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks`
--

LOCK TABLES `bookmarks` WRITE;
/*!40000 ALTER TABLE `bookmarks` DISABLE KEYS */;
INSERT INTO `bookmarks` VALUES (1,3,17),(2,3,10),(3,4,10),(7,7,17);
/*!40000 ALTER TABLE `bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brandphotos`
--

DROP TABLE IF EXISTS `brandphotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brandphotos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(512) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brandphotos`
--

LOCK TABLES `brandphotos` WRITE;
/*!40000 ALTER TABLE `brandphotos` DISABLE KEYS */;
/*!40000 ALTER TABLE `brandphotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `photo` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (5,'BMW','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/10 (1).jpg'),(6,'Alfa Romeo','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/4.jpg'),(7,'Mercedes-Benz','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/54.jpg'),(8,'Audi','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/8.jpg'),(9,'Ford','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/26.jpg'),(10,'Infiniti','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/34.jpg'),(11,'Jaguar','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/36.jpg'),(12,'Subaru','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/76.jpg'),(13,'VW','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/86.jpg'),(15,'suzuki','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/77.jpg');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `description` longtext,
  `photo` varchar(512) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (4,'BMW 740 xDrive',124000,2,5,'asdfas\r\nfasdfa\r\nsdfasd sdfa\r\nasd','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/16430829o.jpg',1),(5,'BMW X6 xDrive40dMLED',82000,3,5,'ASDasdzx zx\r\nzxczvx\r\nxzc zxczxc\r\nzxc','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/13342142o.jpg',1),(6,'BMW 740 L xDrive',179000,2,5,'  dasdfasdf sdfas\r\nasdfasd sdf sd dsfs\r\nsadfa df asdfasd\r\nasdfasdfas\r\nasdddddd as dfasd','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/8096618o.jpg',1),(7,'Audi R8 Racer Automatik',125000,2,8,'  assd\r\nasdfas\r\nsadfasdfadf sdf as\r\nasdfa\r\ns sdafsdf asdfasdf  \r\na','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/15816137o.jpg',1),(8,'Audi RS7 Keramika Head-U',180000,2,8,'  afasdf asdf s fa sdfa\r\nsdfas ad dfasdfasdf\r\nasfas sdf asdfasd\r\nasdfasdfa\r\nsdfas','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/12486207o.jpg',1),(9,'Audi A8 L 4.2 TDiquattro',215000,2,8,'  asdfaf sfa sdfasdf\r\nasdfasd\r\nfasdfas\r\nfasfasdf d  fd\r\nasdfasd  af safas\r\nddffgs dfg fs','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/5015483o.jpg',1),(10,'BMW i8 Pure Impulse',310500,2,5,'  sdafa\r\nsdfasdf\r\nasdfas as sdfasdfsa\r\nasdfasf  sdafsdfas asdf\r\nsadfasdfasfas\r\nasdfasdf','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/834215o.jpg',1),(11,'Alfa Romeo Giulia',150000,2,6,'  sdfassadf\r\nasdf\r\nasdfasdfas\r\nasdfasdfasdfa dsfs\r\ndfasdfa','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/15403497o.jpg',1),(12,'Mercedes-Benz SLS AMG',375000,2,7,'  adsfasd\r\nfasdfasd\r\nfas\r\ndfasdfasdfas\r\nfasdfasdfasd adsf asdf\r\nasdfasd\r\nsdfas','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/7410411o.jpg',1),(17,'Mercedes-Benz GLE 63',325700,3,7,'  sdfasdfa\r\nsfs fas dfasdf asdfa\r\nsfdas fasdfa sdfas\r\nfasdfasdf sfddsdfasd\r\nfasdfasdfasd fasdf\r\nsdfasf','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/10825347o.jpg',1),(18,'Mercedes-Benz G 63 AMG',280000,3,7,'  asdasd\r\nASDad\r\nASDas ads asd \r\nsdad asd ad D asd ASD\r\nASDFASDA SAS DFA\r\nfsfdgs sdfgsdf\r\nsdfgs\r\ndgsdfgsdfsdf fsd ','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/16393930o.jpg',1),(20,'Suzuki GSXR ',1200,5,15,'  dsfgsd\r\nfg\r\nsd\r\nfg\r\nsdfg\r\nsdfgsd','C:/Users/Peter/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Caruca.bg/uploads/14243621o.jpg',7);
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (2,'Sedan'),(3,'SUV'),(4,'Truck'),(5,'Motorcycle'),(6,'BUS'),(7,'Trailer');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `role` enum('admin','default') DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'peter','63a9f0ea7bb98050796b649e85481845','admin','09778654677'),(2,'vasilena','63a9f0ea7bb98050796b649e85481845','admin','08776555557'),(3,'tyson','4fe9cb131031fa6489723e3d49194f99','default','0888665311'),(4,'fucker','7815696ecbf1c96e6894b779456d330e','default','08776555667'),(5,'maria','263bce650e68ab4e23f28263760b9fa5','default','0888977633'),(6,'niki','587c8d2a43ec581df67365aac7ed819f','default','0897665444'),(7,'adi','c46335eb267e2e1cde5b017acb4cd799','default','234234234');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-10 13:59:26
