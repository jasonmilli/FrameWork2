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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controller`
--

LOCK TABLES `controller` WRITE;
/*!40000 ALTER TABLE `controller` DISABLE KEYS */;
INSERT INTO `controller` VALUES (1,'\\Work\\Controllers\\Login::login','2015-11-30 20:41:04','2015-11-30 20:41:04'),(2,'\\Work\\Controllers\\Login::check','2015-11-30 20:41:24','2015-11-30 20:41:24'),(3,'\\Work\\Controllers\\Main::start','2015-12-01 19:28:35','2015-12-01 19:28:35'),(4,'\\Work\\Controllers\\Main::middle','2015-12-01 19:28:50','2015-12-01 19:28:50'),(5,'\\Work\\Controllers\\Main::welcome','2015-12-01 19:29:04','2015-12-01 19:29:04'),(6,'\\Work\\Controllers\\Testing::controllers','2015-12-03 23:11:45','2015-12-03 23:11:45'),(7,'\\Work\\Controllers\\Testing::tests','2015-12-03 23:11:54','2015-12-03 23:11:54'),(8,'\\Work\\Controllers\\Testing::inputs','2015-12-05 12:48:48','2015-12-05 12:48:48'),(9,'\\Work\\Controllers\\Testing::output','2015-12-05 13:19:03','2015-12-05 13:19:03'),(10,'\\Work\\Controllers\\Testing::save','2015-12-07 22:10:55','2015-12-07 22:10:55');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_role`
--

LOCK TABLES `group_role` WRITE;
/*!40000 ALTER TABLE `group_role` DISABLE KEYS */;
INSERT INTO `group_role` VALUES (1,2,1,'2015-11-23 14:56:17','2015-11-23 14:56:17'),(2,2,2,'2015-12-03 22:49:09','2015-12-03 22:49:09');
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
  `label` varchar(100) DEFAULT NULL,
  `type` enum('text','hidden','password','submit') DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  `input` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`input_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `input`
--

LOCK TABLES `input` WRITE;
/*!40000 ALTER TABLE `input` DISABLE KEYS */;
INSERT INTO `input` VALUES (1,5,'Name:','text','','name','2015-12-02 20:53:34','2015-12-02 20:53:34'),(2,5,'Age:','text','','age','2015-12-02 20:53:41','2015-12-02 20:53:41'),(3,5,'','submit','Submit','submit','2015-12-02 21:05:19','2015-12-02 21:05:19'),(4,8,'','submit','Test','inputs_submit','2015-12-05 13:05:28','2015-12-05 13:05:28'),(5,9,'','hidden','','output','2015-12-07 19:20:30','2015-12-07 19:20:30'),(6,10,'','hidden','','result','2015-12-07 22:14:10','2015-12-07 22:14:10'),(7,10,'','hidden','','output_controller','2015-12-07 22:14:28','2015-12-07 22:14:28');
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
INSERT INTO `key` VALUES (1,'default','0000000000000000000000000000018B','2015-10-29 22:42:27','2015-12-08 22:29:47');
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
  `navigation` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`navigation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3159 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation`
--

LOCK TABLES `navigation` WRITE;
/*!40000 ALTER TABLE `navigation` DISABLE KEYS */;
INSERT INTO `navigation` VALUES (2912,1,'333eb08c0b2ccb8dd7628c81d418d12f3c8a1590328a8913f207655cd362d3fd','target',2,'2015-12-08 19:25:02','2015-12-08 19:25:02'),(2913,1,'aecbe8d016498bd432156034700efd17816b6a6622c5f33c3a8bd38c7dd61a88','target',1,'2015-12-08 19:25:02','2015-12-08 19:25:02'),(3130,1,'cd050fad65090349cf0ee6f6105fdd3dd45d0f1ac1dcd7f6e41d8d9ec22dbc44','input',1,'2015-12-08 22:29:40','2015-12-08 22:29:40'),(3131,1,'7cc9bd091412c83452fcce68e812de78aa5af6ee59b7d36becc01fefd6df5112','input',2,'2015-12-08 22:29:40','2015-12-08 22:29:40'),(3132,1,'590f110f073f8a166e0eb2c2d3195a90ff66f54eee3c479407ccb9b8e16271b7','input',3,'2015-12-08 22:29:40','2015-12-08 22:29:40'),(3133,1,'57ea8e4f24a9abf9c11a705ab87aa1ffb87e53e91d8f85c3f979156cea23b79d','controller',5,'2015-12-08 22:29:40','2015-12-08 22:29:40'),(3134,1,'f65539ffc0279a7dca79d37cdf77c73b24a227209e6d200e2934af3e36979fd8','controller',6,'2015-12-08 22:29:40','2015-12-08 22:29:40'),(3135,1,'9c3a611d769c0695b4ea06ef6f9086518d73998337c7384aafd5d74ae3d0e8d9','controller',7,'2015-12-08 22:29:40','2015-12-08 22:29:40'),(3137,1,'b3a6de50809f65a433da523cfd0b848dd7d413cd5fc5a26c8b61ae73e21bb326','target',3,'2015-12-08 22:29:44','2015-12-08 22:29:44'),(3138,1,'1f726b341ef92c9a6ce9501833a2fb2b365d6d2bb53822729a01182669db6793','target',4,'2015-12-08 22:29:44','2015-12-08 22:29:44'),(3139,1,'0018cf5969e16ecfbda67f7dea3c1d8d9533a3f46b8a2461ae8ef84d02ca63e5','input',4,'2015-12-08 22:29:44','2015-12-08 22:29:44'),(3140,1,'cfcc42c35d435628f737534d69681156e0d579e56fcc08a5210138c200c4d2de','controller',8,'2015-12-08 22:29:45','2015-12-08 22:29:45'),(3141,1,'17cde5b1b064a070bcc7ecab8882d492ef6813723764dd9abdacbf1bdc250806','input',4,'2015-12-08 22:29:45','2015-12-08 22:29:45'),(3142,1,'eb14434cee120d3db9cbcf09475bde49c7f927bab3de87e5353451c0eb31204e','controller',8,'2015-12-08 22:29:45','2015-12-08 22:29:45'),(3143,1,'84bf5d37a6d89334658f7650d68bfe140b52bd483b90726cde8a22704c0eada7','input',4,'2015-12-08 22:29:45','2015-12-08 22:29:45'),(3144,1,'d9a839ca8d8bcf18c128964b6479041a305e22c60c5a0b4fc49ded1bce5a5c9a','controller',8,'2015-12-08 22:29:45','2015-12-08 22:29:45'),(3145,1,'bb0d1b5dedc60a5da55e6431589a277bfd05dbcd042e27884a0458530b5521f2','input',4,'2015-12-08 22:29:45','2015-12-08 22:29:45'),(3146,1,'f0de4cfec233dbcd9c204c20ffea2eacaf96e6d2e9a07bdfec87dd0f7e9b1298','controller',8,'2015-12-08 22:29:45','2015-12-08 22:29:45'),(3147,1,'54f9fdd1f9f3cba3ea9f68e5e1822b7b6634732f947cb243cd158c34294723ca','input',4,'2015-12-08 22:29:45','2015-12-08 22:29:45'),(3148,1,'f5d5d744fb956e36164ecffa8139c5a26f9584d892de6a8f9c2c01434b9a0f81','controller',8,'2015-12-08 22:29:46','2015-12-08 22:29:46'),(3149,1,'d778fc30bd73c79f9b5e73e97decbd8a6f10dd66063ccf03e66f9536ea4b14ef','input',4,'2015-12-08 22:29:46','2015-12-08 22:29:46'),(3150,1,'e5e0c8d084fae7c3aacca3c9fc5b6466317773502e383e2adc1082952206be8e','controller',8,'2015-12-08 22:29:46','2015-12-08 22:29:46'),(3151,1,'203a4de93674ce6c60b1408a0af50842669372c77b225ae5f509a275b60c320a','input',4,'2015-12-08 22:29:46','2015-12-08 22:29:46'),(3152,1,'8bf7214d888bb561e49c38f895ea141a4a7f1e72c1ab32692ebabfa5540e3448','controller',8,'2015-12-08 22:29:46','2015-12-08 22:29:46'),(3153,1,'af4e1030999a199fadcfccbaf430be6399dccfe4bb83bbd20daf26316c48e005','input',4,'2015-12-08 22:29:46','2015-12-08 22:29:46'),(3154,1,'1da85fddee39e8367e4146fce344955bc4a5cc83b2ddcc6fb77f9246426b6f77','controller',8,'2015-12-08 22:29:47','2015-12-08 22:29:47'),(3155,1,'280caa6a8c65b0c97d2c0c837f5acf898979f1ea2cdadd20ab6c9b5b4e1cc792','input',4,'2015-12-08 22:29:47','2015-12-08 22:29:47'),(3156,1,'ed4b27ac21a40b8dff068f0e612ba2a486e3a20b4f2fe893edee71d6788a5611','controller',8,'2015-12-08 22:29:47','2015-12-08 22:29:47'),(3157,1,'17c4ca50719031a045454ae42657c71f1f6097d7e75d71ede25e7ed4ac9d265c','input',4,'2015-12-08 22:29:47','2015-12-08 22:29:47'),(3158,1,'273bed1163e9e7820d9f8d4162fbb2766ee6da8e27b8cc6a405e4c3f17e56c9f','controller',8,'2015-12-08 22:29:47','2015-12-08 22:29:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'login','2015-11-23 14:56:39','2015-11-23 14:56:39'),(2,'testing','2015-12-03 22:45:45','2015-12-03 22:45:45');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_controller`
--

LOCK TABLES `role_controller` WRITE;
/*!40000 ALTER TABLE `role_controller` DISABLE KEYS */;
INSERT INTO `role_controller` VALUES (1,1,1,'2015-11-30 19:39:15','2015-11-30 19:39:15'),(2,1,2,'2015-11-30 19:41:35','2015-11-30 19:41:35'),(3,1,3,'2015-12-01 21:04:21','2015-12-01 21:04:21'),(4,1,4,'2015-12-01 21:04:34','2015-12-01 21:04:34'),(5,1,5,'2015-12-02 21:59:13','2015-12-02 21:59:13'),(6,2,6,'2015-12-03 23:16:00','2015-12-03 23:16:00'),(7,2,7,'2015-12-03 23:16:05','2015-12-03 23:16:05'),(8,2,8,'2015-12-05 12:53:45','2015-12-05 12:53:45'),(9,2,9,'2015-12-07 19:06:55','2015-12-07 19:06:55'),(10,2,10,'2015-12-07 22:15:21','2015-12-07 22:15:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target`
--

LOCK TABLES `target` WRITE;
/*!40000 ALTER TABLE `target` DISABLE KEYS */;
INSERT INTO `target` VALUES (1,'welcome','2015-12-01 22:11:10','2015-12-01 22:11:10'),(2,'middle','2015-12-01 22:11:16','2015-12-01 22:11:16'),(3,'input','2015-12-05 12:51:50','2015-12-05 12:51:50'),(4,'output','2015-12-05 12:51:55','2015-12-05 12:51:55'),(5,'save_test','2015-12-07 22:11:50','2015-12-07 22:11:50');
/*!40000 ALTER TABLE `target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `test_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller_id` int(10) unsigned NOT NULL,
  `result` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,5,'<p>Welcome jason, 35</p>','2015-12-08 20:06:02','2015-12-08 20:06:02'),(2,5,'<p>Welcome jason, 34</p>','2015-12-08 20:06:09','2015-12-08 20:06:09');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_input`
--

DROP TABLE IF EXISTS `test_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_input` (
  `test_input_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_id` int(10) unsigned NOT NULL,
  `input_id` int(10) unsigned NOT NULL,
  `input` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`test_input_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_input`
--

LOCK TABLES `test_input` WRITE;
/*!40000 ALTER TABLE `test_input` DISABLE KEYS */;
INSERT INTO `test_input` VALUES (1,1,1,'jason','2015-12-08 20:06:02','2015-12-08 20:06:02'),(2,1,2,'37','2015-12-08 20:06:02','2015-12-08 20:06:02'),(3,2,1,'jason','2015-12-08 20:06:09','2015-12-08 20:06:09'),(4,2,2,'34','2015-12-08 20:06:09','2015-12-08 20:06:09');
/*!40000 ALTER TABLE `test_input` ENABLE KEYS */;
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

-- Dump completed on 2015-12-08 22:45:10
