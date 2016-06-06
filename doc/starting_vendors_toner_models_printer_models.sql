-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: got
-- ------------------------------------------------------
-- Server version	5.5.49-0+deb8u1

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
-- Table structure for table `vendors`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` (`id`, `name`) VALUES (1,'HP'),(2,'Ibm'),(3,'Brother'),(4,'Canon'),(5,'Epson'),(6,'Kyocera Mita'),(7,'Lexmark'),(8,'Samsung'),(9,'Sharp'),(10,'Xerox'),(11,'Dell'),(12,'RICOH Aficio');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toner_models`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `toner_models` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `compatible` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`),
  CONSTRAINT `toner_models_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toner_models`
--

LOCK TABLES `toner_models` WRITE;
/*!40000 ALTER TABLE `toner_models` DISABLE KEYS */;
INSERT INTO `toner_models` (`id`, `vendor_id`, `name`, `compatible`) VALUES (1,6,'TK-725',NULL),(2,6,'TK-3130',NULL),(3,1,'42X',NULL),(4,7,'602H',NULL),(5,10,'PHASER 5550',NULL),(6,8,'ML-D3470',NULL),(7,6,'TK-560',NULL),(8,1,'CE390X',NULL),(9,6,'TK-3110',NULL),(10,3,'TN-3170',NULL),(11,1,'C3903A',NULL),(12,1,'96A',NULL),(13,1,'27X',NULL),(14,3,'TN-2120',NULL),(15,12,'400998 BLACK',NULL),(16,12,'400996 MAGENTA',NULL),(17,6,'TK-350',NULL),(18,12,'88831X',NULL),(19,1,'C3105A',NULL),(20,1,'55A',NULL),(21,7,'E450A11E',NULL);
/*!40000 ALTER TABLE `toner_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printer_models`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printer_models` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `laser` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`),
  CONSTRAINT `printer_models_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printer_models`
--

LOCK TABLES `printer_models` WRITE;
/*!40000 ALTER TABLE `printer_models` DISABLE KEYS */;
INSERT INTO `printer_models` (`id`, `vendor_id`, `name`, `laser`) VALUES (1,1,'LaserJet 4050',1),(2,1,'LaserJet 4300',1),(3,1,'LaserJet 4350',1),(4,1,'LaserJet 4250',1),(5,12,'CL 3500',1),(6,10,'Phaser 5550',1),(7,6,'TASKalfa 3510i',1),(8,6,'FS-C5350',1),(9,6,'FS-4300',1),(10,7,'MX310',1),(11,7,'MX410',1),(12,7,'MX510',1),(13,7,'MX511',1),(14,7,'MX610',1),(15,7,'MX611',1),(16,6,'ECOSYS FS-1061',1),(17,7,'E450',1),(18,6,'TASKalfa 420i',1),(19,6,'TASKalfa 520i',1),(20,6,'FS-4200',1),(22,6,'ECOSYS M3550idn',1),(23,6,'ECOSYS M3560idn',1),(24,8,'ML-331x',1),(25,8,'ML-3471',1),(26,8,'ML-3470',1),(27,1,'LaserJet Pro MFP M127fw',1),(28,1,'LaserJet P3015',1),(29,6,'FS-3920',1),(30,6,'FS-C5300',1),(31,6,'ECOSYS P6030cdn',1),(32,1,'LaserJet 600',1),(33,12,'MP 2000',1),(34,1,'LaserJet 4000',1),(35,1,'LaserJet 2420',1),(36,6,'FS-4100',1),(37,3,'HL-5240',1),(38,3,'HL-5250',1),(39,3,'HL-5270',1),(40,3,'HL-5280',1),(41,1,'LaserJet 5P',1),(42,1,'LaserJet 6P',1),(43,1,'Laserjet 2100',1),(44,3,'HL-2140',1),(45,3,'MFC-7320',1),(46,3,'MFC-7340',1),(47,3,'TN-2120',1),(48,12,'AP 206',1),(49,6,'FS-3040',1),(50,6,'FS-3140',1),(51,6,'FS-3540',1),(52,6,'FS-3640',1),(53,12,'CL 4000',1),(54,12,'SP C410',1),(55,12,'SP C411',1),(56,12,'SP C420',1),(57,1,'Color LaserJet 5',1),(58,1,'LaserJet Pro M521',1);
/*!40000 ALTER TABLE `printer_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'got'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-06 12:32:03
