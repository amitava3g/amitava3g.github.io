-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: localhost    Database: spicyworldcontent
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(50) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `add_title` varchar(1000) NOT NULL,
  `description` text NOT NULL,
  `completion_statement` varchar(2000) DEFAULT NULL,
  `garnishment` varchar(2000) DEFAULT NULL,
  `main_pic` varchar(50) NOT NULL,
  `add_pic` varchar(50) NOT NULL,
  `add_pic_style` smallint(3) DEFAULT NULL,
  `add_pic_top` varchar(50) DEFAULT NULL,
  `add_pic_top_style` smallint(3) DEFAULT NULL,
  `end_pic` varchar(50) DEFAULT NULL,
  `end_pic_style` smallint(3) DEFAULT NULL,
  `keywords` varchar(2000) NOT NULL,
  `tags` varchar(1000) NOT NULL,
  `pub_date` varchar(20) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,'coconut-cake','Soft Coconut Cake (eggless)','','I made last weekend another successful eggless cake and the flavour was \'coconut\'. I have never used coconut before in cake batter but this time I do and result was \'scrumptious\'. After making this, your heart will call for a bite to this moist cake and then a sip of warm tea ... aaaahh pure bliss ! If you are obsessed with coconut then treat yourself with a big piece of this eggless flaky coconut cake. I won\'t tell you about the beautiful aroma, because, to get that you have to make this cake !','Your coconut cake is ready ...','Serve this with a cup of tea ...','coconut-cake.jpg','coconut-cake-add.jpg',55,'coconut-cake-add-top.jpg',0,'coconut-cake-end.jpg',0,'cake, coconut, eggless, dessert, sweet, butter, flour, sponge, soft, flaky, moist','cake,sweet,dessert','03/17/2016','vegItem');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredients` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content_id` varchar(50) NOT NULL,
  `data` varchar(8000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'1','1 cup flour.'),(2,'1','Half Teaspoon of baking powder.'),(3,'1','1 Teaspoon of baking soda.'),(4,'1','Half cup of coconut flakes / desiccated coconut / fresh grated coconut.'),(5,'1','2 Tablespoons of curd.'),(6,'1','Half cup   1 Tablespoon of sugar.'),(7,'1','1/4 th cup of soft butter.'),(8,'1','Pinch of salt.'),(9,'1','1 Teaspoon of vinegar.'),(10,'1','1 Teaspoon of coconut / vanilla essence.'),(11,'1','3/4th cup of coconut milk / full fat milk.');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `steps`
--

DROP TABLE IF EXISTS `steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `steps` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content_id` varchar(50) NOT NULL,
  `data` varchar(8000) NOT NULL,
  `type` varchar(3) NOT NULL DEFAULT 'TXT',
  `width` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `steps`
--

LOCK TABLES `steps` WRITE;
/*!40000 ALTER TABLE `steps` DISABLE KEYS */;
INSERT INTO `steps` VALUES (1,'1','Sieve the flour, baking soda, baking powder and salt twice / thrice in a bowl. Keep it aside.','TXT',0),(2,'1','coconut-cake-52dcd832-d1f9-4b6f-ab2b-294a57a931ba.jpg','IMG',0),(3,'1','Now take soft butter, sugar, vinegar and coconut / vanilla essence in a mixing bowl. Beat everything for 10 minutes or until they becomes fluffy and light.','TXT',0),(4,'1','coconut-cake-e946ac37-4e2a-4edc-97ce-984a069bad49.jpg','IMG',0),(5,'1','Now add the curd / sour cream to this butter and mix well.','TXT',0),(6,'1','coconut-cake-a92c6aa0-48ca-4a92-a982-4b30195b2d77.jpg','IMG',0),(7,'1','Start adding the flour mixture and milk little by little through mixing.','TXT',0),(8,'1','coconut-cake-21f275bc-9d4b-473a-bfd7-4a823eff075a.jpg','IMG',0),(9,'1','After mixing everything well, add coconut to the batter. Give it a good mix.','TXT',0),(10,'1','coconut-cake-7a78ea66-ece4-4752-aed9-cdb98a09a087.jpg','IMG',0),(11,'1','Pour the batter in a baking tray and bake it in a preheated oven for 50 minutes in 350F.','TXT',0),(12,'1','After that let it cool down completely and then remove it to a plate.','TXT',0),(13,'1','coconut-cake-db959f30-7362-4d96-b9f2-7a9b0b1e9676.jpg','IMG',0),(14,'1','coconut-cake-05a61279-8143-4c9d-95cb-6ba6365a8d0b.jpg','IMG',0);
/*!40000 ALTER TABLE `steps` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-24 22:17:01
