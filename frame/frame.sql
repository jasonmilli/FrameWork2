-- MySQL dump 10.13  Distrib 5.5.45, for CYGWIN (x86_64)
--
-- Host: 127.0.0.1    Database: frame
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `controller`
--

DROP TABLE IF EXISTS `controller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controller` (
  `controller_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`controller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controller`
--

LOCK TABLES `controller` WRITE;
/*!40000 ALTER TABLE `controller` DISABLE KEYS */;
INSERT INTO `controller` VALUES (1,'\\Work\\Controllers\\Login::login','2015-11-30 20:41:04','2015-11-30 20:41:04'),(2,'\\Work\\Controllers\\Login::check','2015-11-30 20:41:24','2015-11-30 20:41:24'),(3,'\\Work\\Controllers\\Main::start','2015-12-01 19:28:35','2015-12-01 19:28:35'),(4,'\\Work\\Controllers\\Main::middle','2015-12-01 19:28:50','2015-12-01 19:28:50'),(5,'\\Work\\Controllers\\Main::welcome','2015-12-01 19:29:04','2015-12-01 19:29:04');
/*!40000 ALTER TABLE `controller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'Admin','2015-11-17 21:30:11','2015-11-17 21:30:11'),(2,'Basic','2015-11-22 14:25:31','2015-11-22 14:25:31');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_role`
--

DROP TABLE IF EXISTS `group_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_role` (
  `group_role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`group_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_role`
--

LOCK TABLES `group_role` WRITE;
/*!40000 ALTER TABLE `group_role` DISABLE KEYS */;
INSERT INTO `group_role` VALUES (1,2,1,'2015-11-23 14:56:17','2015-11-23 14:56:17');
/*!40000 ALTER TABLE `group_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `input`
--

DROP TABLE IF EXISTS `input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `input` (
  `input_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller_id` int(10) unsigned NOT NULL,
  `input` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`input_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `input`
--

LOCK TABLES `input` WRITE;
/*!40000 ALTER TABLE `input` DISABLE KEYS */;
INSERT INTO `input` VALUES (1,5,'name','2015-12-02 20:53:34','2015-12-02 20:53:34'),(2,5,'age','2015-12-02 20:53:41','2015-12-02 20:53:41'),(3,5,'submit','2015-12-02 21:05:19','2015-12-02 21:05:19');
/*!40000 ALTER TABLE `input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `input_validation`
--

DROP TABLE IF EXISTS `input_validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `input_validation` (
  `input_validation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `input_id` int(10) unsigned NOT NULL,
  `validation_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`input_validation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `input_validation`
--

LOCK TABLES `input_validation` WRITE;
/*!40000 ALTER TABLE `input_validation` DISABLE KEYS */;
INSERT INTO `input_validation` VALUES (3,2,2,'2015-12-02 22:14:09','2015-12-02 22:14:09');
/*!40000 ALTER TABLE `input_validation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `key`
--

DROP TABLE IF EXISTS `key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `key` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `key` varchar(32) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `key`
--

LOCK TABLES `key` WRITE;
/*!40000 ALTER TABLE `key` DISABLE KEYS */;
INSERT INTO `key` VALUES (1,'default','000000000000000000000000000000I_','2015-10-29 22:42:27','2015-12-02 22:37:42');
/*!40000 ALTER TABLE `key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation`
--

DROP TABLE IF EXISTS `navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation` (
  `navigation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `key` varchar(64) NOT NULL,
  `type` enum('controller','target','input') NOT NULL,
  `navigation` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`navigation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1705 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation`
--

LOCK TABLES `navigation` WRITE;
/*!40000 ALTER TABLE `navigation` DISABLE KEYS */;
INSERT INTO `navigation` VALUES (1684,1,'09f2d7e868fbb1635bdca9eb33d81072c130412113cf8fe9f96c421e23b1de97','target','1','2015-12-02 22:35:00','2015-12-02 22:35:00'),(1689,1,'f52c3a4c55364960a2f3c0f1ce6a9d38f05b8284f5977abc928167c69eae19ad','target','2','2015-12-02 22:35:01','2015-12-02 22:35:01'),(1690,1,'e756732a4e51aaee3ff54d723fc1e4dc295d2f84c4cca528a3086b6f63eac548','controller','4','2015-12-02 22:35:01','2015-12-02 22:35:01'),(1691,1,'f7d399c95259bf529b7c0b28fa991effd35467aa4d1ed01421a12818d0b39569','target','1','2015-12-02 22:35:10','2015-12-02 22:35:10'),(1692,1,'b2eeaf6295de3a21ed70bf02e5639ba4c3fb2352649cf340f7a11e8341824ab3','input','1','2015-12-02 22:35:10','2015-12-02 22:35:10'),(1693,1,'4daf510293b93b73605a161e3e5335165de35f117a3ab995dfd4ccaabdd88854','input','2','2015-12-02 22:35:10','2015-12-02 22:35:10'),(1694,1,'df4c85648443eff11c9451f17d8197528c4a61707338c20cc4a049add0c5ec09','input','3','2015-12-02 22:35:10','2015-12-02 22:35:10'),(1695,1,'277852e5a1abab45c72a287c9871c4b43a832d80e445cac7ed03b882d3510da4','controller','5','2015-12-02 22:35:10','2015-12-02 22:35:10'),(1696,1,'d16ba401734f22f0c1ca4b72e401bb53f4ecb7b224ab47176c86b06ceb94f94d','target','2','2015-12-02 22:35:10','2015-12-02 22:35:10'),(1697,1,'2d98ee79a61dd26e72f665c2322183ee95f14cefebec448f60d3ca1447d4d860','controller','4','2015-12-02 22:35:11','2015-12-02 22:35:11'),(1698,1,'1ac97a6b17cbbf4556e8ac4c445f92b8a408f47b247e3bda9a44a03992a60fe3','target','1','2015-12-02 22:37:41','2015-12-02 22:37:41'),(1699,1,'a5af8c7ab54832ada71478390cfee88e0dd8cbbb4aec3f89d6f1135f4ab8fb09','input','1','2015-12-02 22:37:41','2015-12-02 22:37:41'),(1700,1,'fcf28d7254226116e4690c79199e506ebd0ce86701c05fe84c2c8404202e2953','input','2','2015-12-02 22:37:41','2015-12-02 22:37:41'),(1701,1,'12afe260c57c6ecc161bf3b604449ff0c37bfd3d011b285c214f7f1f1c003ac0','input','3','2015-12-02 22:37:41','2015-12-02 22:37:41'),(1702,1,'b984db84eca99531674a69b088b6ebe344d8dc0a833e90ff0a657747790a1c82','controller','5','2015-12-02 22:37:42','2015-12-02 22:37:42'),(1703,1,'f463dcef4179eeeb16e07ec63111d08c71f17e2468d76e95f7c84e3fe172dc10','target','2','2015-12-02 22:37:42','2015-12-02 22:37:42'),(1704,1,'5901638fb5341a76a5ef2df52b31be45156bf53c4c2bb20ec33b711fd91a439d','controller','4','2015-12-02 22:37:42','2015-12-02 22:37:42');
/*!40000 ALTER TABLE `navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'login','2015-11-23 14:56:39','2015-11-23 14:56:39');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_controller`
--

DROP TABLE IF EXISTS `role_controller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_controller` (
  `role_controller_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `controller_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`role_controller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_controller`
--

LOCK TABLES `role_controller` WRITE;
/*!40000 ALTER TABLE `role_controller` DISABLE KEYS */;
INSERT INTO `role_controller` VALUES (1,1,1,'2015-11-30 19:39:15','2015-11-30 19:39:15'),(2,1,2,'2015-11-30 19:41:35','2015-11-30 19:41:35'),(3,1,3,'2015-12-01 21:04:21','2015-12-01 21:04:21'),(4,1,4,'2015-12-01 21:04:34','2015-12-01 21:04:34'),(5,1,5,'2015-12-02 21:59:13','2015-12-02 21:59:13');
/*!40000 ALTER TABLE `role_controller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target`
--

DROP TABLE IF EXISTS `target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `target` (
  `target_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`target_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target`
--

LOCK TABLES `target` WRITE;
/*!40000 ALTER TABLE `target` DISABLE KEYS */;
INSERT INTO `target` VALUES (1,'welcome','2015-12-01 22:11:10','2015-12-01 22:11:10'),(2,'middle','2015-12-01 22:11:16','2015-12-01 22:11:16');
/*!40000 ALTER TABLE `target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL,
  `session` varchar(64) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'jason','$2y$10$5giOv3zO.R6xDxVdIT71C.LnqNdv3LA3Parjb5ko.11Nb.FFe3fT2','82a53dc06cd8c94da1619ea6c6f7d5ed2b0f81550fc9b69db93ad57dc45dbed4','2015-10-14 19:34:51','2015-11-30 22:43:10'),(2,'jason2','$2y$10$TQv7lbkfVnml4zxnVKZ1yeUeyyp9TPXslHEBDBjPgD2u7B08B3KgS',NULL,'2015-11-30 21:35:59','2015-11-30 21:35:59');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `user_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (1,1,1,'2015-11-17 21:29:24','2015-11-17 21:29:24'),(2,1,2,'2015-11-22 14:26:32','2015-11-22 14:26:32'),(3,2,2,'2015-11-30 21:36:21','2015-11-30 21:36:21');
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `validation`
--

DROP TABLE IF EXISTS `validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `validation` (
  `validation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `validation` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`validation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validation`
--

LOCK TABLES `validation` WRITE;
/*!40000 ALTER TABLE `validation` DISABLE KEYS */;
INSERT INTO `validation` VALUES (2,'\\Work\\Validation::numeric','2015-12-02 22:10:02','2015-12-02 22:10:02');
/*!40000 ALTER TABLE `validation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-02 22:45:02
