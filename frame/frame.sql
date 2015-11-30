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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controller`
--

LOCK TABLES `controller` WRITE;
/*!40000 ALTER TABLE `controller` DISABLE KEYS */;
INSERT INTO `controller` VALUES (1,'\\Work\\Controllers\\Login::login','2015-11-30 20:41:04','2015-11-30 20:41:04'),(2,'\\Work\\Controllers\\Login::check','2015-11-30 20:41:24','2015-11-30 20:41:24');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `input`
--

LOCK TABLES `input` WRITE;
/*!40000 ALTER TABLE `input` DISABLE KEYS */;
/*!40000 ALTER TABLE `input` ENABLE KEYS */;
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
INSERT INTO `key` VALUES (1,'default','000000000000000000000000000000Cl','2015-10-29 22:42:27','2015-11-30 22:43:11');
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
) ENGINE=InnoDB AUTO_INCREMENT=1296 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation`
--

LOCK TABLES `navigation` WRITE;
/*!40000 ALTER TABLE `navigation` DISABLE KEYS */;
INSERT INTO `navigation` VALUES (1198,1,'76e423fcbb30147548e960badfacc80791afc1f270f6d9bf083306a29ac1fb64','target','welcome','2015-11-30 22:07:58','2015-11-30 22:07:58'),(1202,1,'a2954fd290c9f2ae1d480133ed715bc7d98c6c52fca89e32ac016b0153e5afcd','target','middle','2015-11-30 22:07:58','2015-11-30 22:07:58'),(1203,1,'fd91561143be5b3bd7f02a32b028f8bd2d09abb601d9eeb60f9b2c2f63e22dc2','target','welcome','2015-11-30 22:08:06','2015-11-30 22:08:06'),(1204,1,'bcd33800f90b78dd32f660eae1c5092bda3cb7907cd01269cf2de0cfef082104','input','name','2015-11-30 22:08:06','2015-11-30 22:08:06'),(1205,1,'dd86f61100aa431aae6c327f64288a937aecf5eaf900a9dd365d1f1b160881f7','input','age','2015-11-30 22:08:06','2015-11-30 22:08:06'),(1206,1,'34e1d6f1db547b07eaaef4def8f4008f7926fa3dc2d76c46a19c5c6b008d9e72','input','submit','2015-11-30 22:08:06','2015-11-30 22:08:06'),(1207,1,'2e677917118a67c7c7648e24f6b1a450da7abaa2a7d0b93f107ac8ef102ab00b','target','middle','2015-11-30 22:08:06','2015-11-30 22:08:06'),(1208,1,'079e8e205b6a24594555f7ff5c86734f1266e2ee10d23bc7d43db361f755debe','target','welcome','2015-11-30 22:12:03','2015-11-30 22:12:03'),(1209,1,'f350649e19da7782d4e800cf15ff42a24c083f33872f2cf83d6ca35ff81b0025','input','name','2015-11-30 22:12:03','2015-11-30 22:12:03'),(1210,1,'d38d7d8ab8f62e22691d1b973a1c2891603005e615aad6845ef70ab2a793cc8d','input','age','2015-11-30 22:12:03','2015-11-30 22:12:03'),(1211,1,'a2fd002a8e41756e3332ce5fb158c94a02b1ca1d06ae470054bce1f5966e37d5','input','submit','2015-11-30 22:12:03','2015-11-30 22:12:03'),(1212,1,'54fe33207b5e31a472ec2b1781c1ed3fb93720abf2668adbca4c76cef79bb2e8','target','middle','2015-11-30 22:12:03','2015-11-30 22:12:03'),(1274,1,'8cfbdee18161605f22797f95196d219ccdc0d25794b30673b161f89b5ca1e1b5','target','welcome','2015-11-30 22:42:46','2015-11-30 22:42:46'),(1275,1,'2e2417f6b331f0236f1bd5122ef9fe731d68dfae2dea6e0a4c6a17d12f5e71d0','input','name','2015-11-30 22:42:46','2015-11-30 22:42:46'),(1276,1,'d6277458ec07a437c7241a5a159464fd5e1691322a9a94485b534def3b88ce61','input','age','2015-11-30 22:42:46','2015-11-30 22:42:46'),(1277,1,'e42e27745e50a3e6522a0886363907b74994a219cff5111a6258b54e2aee71e4','input','submit','2015-11-30 22:42:46','2015-11-30 22:42:46'),(1278,1,'d9690c92b3a47b828fce880e82243f545eeec804fe4e231fd99cfb35cec70f0a','target','middle','2015-11-30 22:42:46','2015-11-30 22:42:46'),(1291,1,'c9199ec9989c463fa1c9904f435af5e1b07aa1c54604a9935c3c21a9b91fbc9a','target','welcome','2015-11-30 22:43:10','2015-11-30 22:43:10'),(1292,1,'7141f6397b5e3d0fa621ab2e56ca71b2d254a5c50507c8f79faa983f1399dee6','input','name','2015-11-30 22:43:10','2015-11-30 22:43:10'),(1293,1,'4d800703065e2b9ff40ba06601decc6bdf3dd9fa6d91096858dc9dd804d228ef','input','age','2015-11-30 22:43:10','2015-11-30 22:43:10'),(1294,1,'32b99e03e7918b2053a73c9477549f69f76c1dc6b5b51c456789ac677f582755','input','submit','2015-11-30 22:43:11','2015-11-30 22:43:11'),(1295,1,'199d63d6b3c09f3954e304e3d8fa2a170ac969cb0a686cab34078355d917effc','target','middle','2015-11-30 22:43:11','2015-11-30 22:43:11');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_controller`
--

LOCK TABLES `role_controller` WRITE;
/*!40000 ALTER TABLE `role_controller` DISABLE KEYS */;
INSERT INTO `role_controller` VALUES (1,1,1,'2015-11-30 19:39:15','2015-11-30 19:39:15'),(2,1,2,'2015-11-30 19:41:35','2015-11-30 19:41:35');
/*!40000 ALTER TABLE `role_controller` ENABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-30 22:45:31
