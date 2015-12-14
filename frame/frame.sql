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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `input`
--

LOCK TABLES `input` WRITE;
/*!40000 ALTER TABLE `input` DISABLE KEYS */;
INSERT INTO `input` VALUES (1,5,'Name:','text','','name','2015-12-02 20:53:34','2015-12-02 20:53:34'),(2,5,'Age:','text','','age','2015-12-02 20:53:41','2015-12-02 20:53:41'),(3,5,'','submit','Submit','submit','2015-12-02 21:05:19','2015-12-02 21:05:19'),(4,8,'','submit','Test','inputs_submit','2015-12-05 13:05:28','2015-12-05 13:05:28'),(5,9,'','hidden','','output','2015-12-07 19:20:30','2015-12-07 19:20:30'),(6,10,'','hidden','','result','2015-12-07 22:14:10','2015-12-07 22:14:10'),(7,10,'','hidden','','output_controller','2015-12-07 22:14:28','2015-12-07 22:14:28'),(8,2,'','hidden','','class','2015-12-10 22:54:47','2015-12-10 22:54:47'),(9,2,'','hidden','','method','2015-12-10 22:54:53','2015-12-10 22:54:53'),(10,2,'Username','text','','username','2015-12-10 22:55:45','2015-12-10 22:55:45'),(11,2,'Password','password','','password','2015-12-10 22:56:31','2015-12-10 22:56:31');
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
INSERT INTO `key` VALUES (1,'default','000000000000000000000000000001rp','2015-10-29 22:42:27','2015-12-14 19:50:07');
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
) ENGINE=InnoDB AUTO_INCREMENT=3919 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation`
--

LOCK TABLES `navigation` WRITE;
/*!40000 ALTER TABLE `navigation` DISABLE KEYS */;
INSERT INTO `navigation` VALUES (2912,1,'333eb08c0b2ccb8dd7628c81d418d12f3c8a1590328a8913f207655cd362d3fd','target',2,'2015-12-08 19:25:02','2015-12-08 19:25:02'),(2913,1,'aecbe8d016498bd432156034700efd17816b6a6622c5f33c3a8bd38c7dd61a88','target',1,'2015-12-08 19:25:02','2015-12-08 19:25:02'),(3824,1,'4a51c1d4d3f2016e4f0a32a84c004f4e742b375c5c0fec0ae1e3b94b093fc3ae','input',1,'2015-12-14 19:48:52','2015-12-14 19:48:52'),(3825,1,'be2d7ebfb7f54617c98f12d82a5b9fb7f7a3c8203ea3ec98444391e3d4f8b7bd','input',2,'2015-12-14 19:48:52','2015-12-14 19:48:52'),(3826,1,'c53499a5b9d0891f45798f62abb9605f6d2f84bf2b74d0b679df8a87350aae0a','input',3,'2015-12-14 19:48:52','2015-12-14 19:48:52'),(3827,1,'0ba31905184ade5d1d75dd4eac29400b34bf9af8b1105e4b3d9f43596cf64d39','controller',5,'2015-12-14 19:48:52','2015-12-14 19:48:52'),(3828,1,'bbd430d5da782bcbcaeb1309b106ee7193fa4b33bd853040706dac986a92014e','controller',6,'2015-12-14 19:48:52','2015-12-14 19:48:52'),(3829,1,'e524249236d7ca68d9522f593ee97506a2b4f54e9c09a77e291cddee0eb6932e','controller',7,'2015-12-14 19:48:52','2015-12-14 19:48:52'),(3830,1,'55e0fe845f3cdabf4e0b478a36e3aacc771578924724e71987e0f7b0c4dbc759','controller',4,'2015-12-14 19:48:52','2015-12-14 19:48:52');
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
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `store_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,5,'<p>Welcome jason, 35</p>','2015-12-08 20:06:02','2015-12-08 20:06:02'),(2,5,'<p>Welcome jason, 34</p>','2015-12-08 20:06:09','2015-12-08 20:06:09'),(3,5,'<p>Welcome jason, 34</p>','2015-12-10 21:10:09','2015-12-10 21:10:09'),(4,5,'<p>Welcome jason, 34</p>','2015-12-13 21:58:43','2015-12-13 21:58:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_input`
--

LOCK TABLES `test_input` WRITE;
/*!40000 ALTER TABLE `test_input` DISABLE KEYS */;
INSERT INTO `test_input` VALUES (1,1,1,'jason','2015-12-08 20:06:02','2015-12-08 20:06:02'),(2,1,2,'37','2015-12-08 20:06:02','2015-12-08 20:06:02'),(3,2,1,'jason','2015-12-08 20:06:09','2015-12-08 20:06:09'),(4,2,2,'34','2015-12-08 20:06:09','2015-12-08 20:06:09'),(5,3,1,'jason','2015-12-10 21:10:09','2015-12-10 21:10:09'),(6,3,2,'34','2015-12-10 21:10:09','2015-12-10 21:10:09'),(7,4,1,'jason','2015-12-13 21:58:43','2015-12-13 21:58:43'),(8,4,2,'34','2015-12-13 21:58:43','2015-12-13 21:58:43');
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
INSERT INTO `user` VALUES (1,'jason','$2y$10$5giOv3zO.R6xDxVdIT71C.LnqNdv3LA3Parjb5ko.11Nb.FFe3fT2','82a53dc06cd8c94da1619ea6c6f7d5ed2b0f81550fc9b69db93ad57dc45dbed4','2015-10-14 19:34:51','2015-12-13 21:25:57'),(2,'jason2','$2y$10$TQv7lbkfVnml4zxnVKZ1yeUeyyp9TPXslHEBDBjPgD2u7B08B3KgS',NULL,'2015-11-30 21:35:59','2015-11-30 21:35:59');
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

-- Dump completed on 2015-12-14 22:29:14
