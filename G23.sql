-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: g23
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `population` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'Taipei City',2646000),(2,'New Taipei City',4015000),(3,'Keelung City',371900),(4,'Taoyuan City',2245000),(5,'Hsinchu City',448200),(6,'Hsinchu County',563100),(7,'Miaoli County',567100),(8,'Taichung City',2817000),(9,'Changhua County',1289000),(10,'Nantou County',514300),(11,'Yunlin County',682100),(12,'Chiayi City',270300),(13,'Chiayi County',524800),(14,'Tainan City',1881000),(15,'Kaohsiung City',2773000),(16,'Pingtung County',839000),(17,'Yilan County',454300),(18,'Hualien County',333400),(19,'Taitung County',224500),(20,'Penghu County',101800),(21,'Kinmen County',139400),(22,'Lienchiang County',13400);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `remote_url` varchar(255) DEFAULT NULL,
  `local_url` varchar(255) DEFAULT NULL,
  `link_url` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'CoolerMaster','https://i.ibb.co/tKWn4Fh/Cooler-Master.png','/img/CoolerMaster.png','/shop/brand/CoolerMaster'),(2,'Corsair','https://i.ibb.co/HFz2r0b/Corsair.png','/img/brand/Corsair.png','/shop/brand/Corsair'),(3,'Logitech','https://i.ibb.co/Zf79rph/Logitech.png','/img/brand/Corsair.png','/shop/brand/Logitech'),(4,'Razer','https://i.ibb.co/ZzT0rZ1/Razer.png','/img/brand/Razer.png','/shop/brand/Razer'),(5,'ROG','https://i.ibb.co/0ZRVM82/ROG.png','/img/brand/ROG.png','/shop/brand/ROG');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `remote_url` varchar(255) DEFAULT NULL,
  `local_url` varchar(255) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Mouse','https://i.ibb.co/4FtbsyF/mouse.png','/img/mouse.png','/shop/category/Mouse'),(2,'Keyboard','https://i.ibb.co/w6WHQfY/keyboard.png','/img/keyboard.png','/shop/category/Keyboard'),(3,'Headset','https://i.ibb.co/YyFx3XX/headset.png','/img/headset','/shop/category/Headset');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'Anna','095527356','anna@gmail.com'),(2,'Bella','093350459','Bella77@gmail.com'),(3,'Jerry','098770581','jerrylee@gmail.com'),(4,'Andy','095511294','andylao@gmail.com'),(5,'Herokoo','091062945','herokooooo@gmail.com'),(6,'Alan','093673439','alan114@gmail.com'),(7,'Bobby','093409071','bobby0332@gmail.com'),(8,'Aaron','096321881','aaron789@gmail.com'),(9,'Ace','095645572','acesuper@gmail.com'),(10,'Adam','093325452','adam1103@gmail.com'),(11,'George','095278988','george0108@gmail.com'),(12,'John','093845482','john123456@gmail.com'),(13,'Kevin','093475574','kevin555@gmail.com'),(14,'Louis','093302688','louis1230@gmail.com'),(15,'Irissa','096838222','irissa0526@gmail.com'),(16,'oak','097845218','oak78@gmail.com');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `aid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,2,25,2),(2,5,36,2),(3,6,1,7),(4,9,18,6),(5,11,29,7),(6,13,21,9),(7,16,6,15);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `cid` int DEFAULT NULL,
  `bid` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `remote_url` varchar(255) DEFAULT NULL,
  `local_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'MM711 Retro',1,1,1590.00,'https://i.ibb.co/X87m71q/MM711-Retro.png','/img/MM711Retro.png'),(2,'MM710',1,1,1090.00,'https://i.ibb.co/4R2TwPp/MM710.png','/img/MM710.png'),(3,'CM110',1,1,690.00,'https://i.ibb.co/LtqxvP9/CM110.png','/img/CM110.png'),(4,'CM310',1,1,990.00,'https://i.ibb.co/Cw4cDXh/CM310.png','/img/CM310.png'),(5,'Sabre RGB pro Champion Series',1,2,1990.00,'https://i.ibb.co/vZLJG43/Sabre-RGBpro-Champion-Series.png','/img/SabreRGBproChampionSeries.png'),(6,'Glaive RGB Pro',1,2,2690.00,'https://i.ibb.co/k1hzSKH/Glaive-RGBpro.png','/img/GlaiveRGBpro.png'),(7,'G Pro Wireless',1,3,3390.00,'https://i.ibb.co/GVM0nf1/g-Pro-Wireless.png','/img/gProWireless.png'),(8,'G403 Hero',1,3,2290.00,'https://i.ibb.co/JtQsVjx/G403Hero.png','/img/G403Hero.png'),(9,'G703 Lightspeed Wireless',1,3,2490.00,'https://i.ibb.co/cwFxXkc/G703-Lightspeed-Wireless.png','/img/G703LightspeedWireless.png'),(10,'G502 Lightspeed Wireless',1,3,3490.00,'https://i.ibb.co/rkCbpPn/G502-Lightspeed-Wireless.png','/img/G502LightspeedWireless.png'),(11,'DeathAdder v2 Pro Wireless',1,4,4090.00,'https://i.ibb.co/nfCLLZX/Death-Adder-V2-Pro-Wireless.png','/img/DeathAdderV2ProWireless.png'),(12,'Mamba Elite',1,4,3290.00,'https://i.ibb.co/x3BS41v/Mamba-Elite.png','/img/MambaElite.png'),(13,'Viper',1,4,2790.00,'https://i.ibb.co/ys6F7HT/Viper.png','/img/Viper.png'),(14,'Viper Ultimate',1,4,4249.00,'https://i.ibb.co/whz4vRc/Viper-Ultimate.png','/img/ViperUltimate.png'),(15,'Pugio',1,5,2590.00,'https://i.ibb.co/rkrh4N1/Pugio.png','/img/Pugio.png'),(16,'Pugio II',1,5,2490.00,'https://i.ibb.co/F0ctTTj/PugioII.png','/img/PugioII.png'),(17,'Gladius III Wireless',1,5,3190.00,'https://i.ibb.co/wRnZbMP/Gladius-IIIWireless.png','/img/GladiusIIIWireless.png'),(18,'SK652 Full Mechanical Keyboard',2,1,2990.00,'https://i.ibb.co/R9yFGZt/SK652-Keyboard.png','/img/SK652Keyboard.png'),(19,'CK351 Gaming Keyboard',2,1,2090.00,'https://i.ibb.co/1sHFtN6/CK351-Gaming-Keyboard.png','/img/CK351GamingKeyboard.png'),(20,'CK352 Gaming Keyboard',2,1,1790.00,'https://i.ibb.co/zXbvFQW/C352-Gaming-Keyboard.png','/img/C352GamingKeyboard.png'),(21,'K95 RGB Platinum Mechanical Gaming Keyboard',2,2,5790.00,'https://i.ibb.co/TRdR6d1/K95-Gaming-Keyboard.png','/img/K95GamingKeyboard.png'),(22,'K70 RGB MK.2 Mechanical Gaming Keyboard',2,2,4890.00,'https://i.ibb.co/W2yb84v/K70-Gaming-Keyboard.png','/img/K70GamingKeyboard.png'),(23,'K68 RGB Mechanical Gaming Keyboard',2,2,4190.00,'https://i.ibb.co/Hnx4TWP/K68-Gaming-Keyboard.png','/img/K68GamingKeyboard.png'),(24,'Pro X Keyboard',2,3,3490.00,'https://i.ibb.co/pv2tDmw/Pro-XKeyboard.png','/img/ProXKeyboard.png'),(25,'G913 TKL',2,3,5990.00,'https://i.ibb.co/xhM0TbZ/G913TKL.png','/img/G913TKL.png'),(26,'G512 Carbon',2,3,1990.00,'https://i.ibb.co/zFH5nxw/G512-Carbon.png','/img/G512Carbon.png'),(27,' Huntsman',2,4,4890.00,'https://i.ibb.co/RCXGnPv/Huntsman.png','/img/Huntsman.png'),(28,'Huntsman Elite',2,4,6990.00,'https://i.ibb.co/VBVrQKn/Huntsman-Elite.png','/img/HuntsmanElite.png'),(29,'Cynosa Chroma',2,4,2290.00,'https://i.ibb.co/MMqFGCK/Cynosa-Chroma.png','/img/CynosaChroma.png'),(30,'Claymore II',2,5,7290.00,'https://i.ibb.co/g7ykt0t/Claymore-II.png','/img/ClaymoreII.png'),(31,'Strix Scope RX',2,5,3190.00,'https://i.ibb.co/xMpWXx1/Strix-Scope-RX.png','/img/StrixScopeRX.png'),(32,'Strix Flare',2,5,4690.00,'https://i.ibb.co/7z3JFzP/Strix-Flare.png','/img/StrixFlare.png'),(33,'MH670',3,1,2530.00,'https://i.ibb.co/R7ww176/MH670.png','/img/MH670.png'),(34,'MH752',3,1,2590.00,'https://i.ibb.co/rpvhxd6/MH752.png','/img/MH752.png'),(35,'MH710',3,1,2490.00,'https://i.ibb.co/NLfzCWN/MH710.png','/img/MH710.png'),(36,'Virtuoso RGB Wireless SE',3,2,7590.00,'https://i.ibb.co/1KnrPHv/Virtuoso-RGBWireless-SE.png','/img/VirtuosoRGBWirelessSE.png'),(37,'Virtuoso RGB Wireless',3,2,6490.00,'https://i.ibb.co/bzP4Wnq/Virtuoso-RGBWireless.png','/img/VirtuosoRGBWireless.png'),(38,'Void RGB Elite Wireless 7.1',3,2,3690.00,'https://i.ibb.co/37wfTmM/Void-RGBElite-Wireless.png','/img/VoidRGBEliteWireless.png'),(39,'G733 Lightspeed Wireless RGB',3,3,3990.00,'https://i.ibb.co/wgKvh1b/G733-Wireless-RGB.png','/img/G733WirelessRGB.png'),(40,'Pro X Wireless',3,3,6690.00,'https://i.ibb.co/WyTP2Rq/Pro-XWireless.png','/img/ProXWireless.png'),(41,'Nari Ultimate',3,4,7690.00,'https://i.ibb.co/fvFTdrG/Nari-Ultimate.png','/img/NariUltimate.png'),(42,'Thresher 7.1',3,4,5299.00,'https://i.ibb.co/TwtDbDc/Thresher.png','/img/Thresher.png'),(43,'MANO\'WAR',3,4,6990.00,'https://i.ibb.co/cFxn4jx/MANO-WAR.png','/img/MANO\'WAR.png'),(44,'Delta S',3,5,5890.00,'https://i.ibb.co/JzBfqhf/DeltaS.png','/img/DeltaS.png'),(45,'Strix Fusion 300',3,5,3590.00,'https://i.ibb.co/fqvkCG7/Strix-Fusion300.png','/img/StrixFusion300.png');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-13 23:23:34
