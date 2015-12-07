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
INSERT INTO `key` VALUES (1,'default','00000000000000000000000000000145','2015-10-29 22:42:27','2015-12-07 22:21:06');
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
) ENGINE=InnoDB AUTO_INCREMENT=2907 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation`
--

LOCK TABLES `navigation` WRITE;
/*!40000 ALTER TABLE `navigation` DISABLE KEYS */;
INSERT INTO `navigation` VALUES (2847,1,'d3342fa99e29e9e5b54ef9732d0fa25aae322f7d613ea495c75c57d5fc243ab2','input',1,'2015-12-07 22:17:09','2015-12-07 22:17:09'),(2848,1,'0f7fa9cdaf1686bf29cfbbc104a91ae6361a8ce77fce189b54f5f94b6d064157','input',2,'2015-12-07 22:17:09','2015-12-07 22:17:09'),(2849,1,'b2a69f2bfb2de790b114659ee7ed91fa288e394e21d5dbab5285c4f53ca0ad35','input',3,'2015-12-07 22:17:09','2015-12-07 22:17:09'),(2850,1,'d050fe8a12d66bea29adcd067fbedd0036646b9ab925ee27fdc30a67100410f8','controller',5,'2015-12-07 22:17:09','2015-12-07 22:17:09'),(2851,1,'aa9e3aa95ead04108edfb8d670d3a9466322d7b82374ae487199dc9260ad193a','controller',6,'2015-12-07 22:17:09','2015-12-07 22:17:09'),(2852,1,'3b3d26a63527120b3b279965e59f1006e5e32f3884ef5f3a005b6fafa7414d6a','controller',7,'2015-12-07 22:17:10','2015-12-07 22:17:10'),(2854,1,'c7539580442d8e44806fc3c4af4c38cc4706d61551ec6e947de9e910c439456f','target',3,'2015-12-07 22:17:12','2015-12-07 22:17:12'),(2855,1,'fe58e4bd1c2551529520c26ea2ee352e86cc5672a4a929c6820fd2e92d08fc3b','target',4,'2015-12-07 22:17:12','2015-12-07 22:17:12'),(2856,1,'c9e890a8d753749e06b14b1b8ea28712b3ddbedd08acef4bea2440160847f588','input',4,'2015-12-07 22:17:12','2015-12-07 22:17:12'),(2857,1,'6a55e27f4767e74a61eca11d947d9811f176537f0f9ee5b46be9eeff36b4b832','controller',8,'2015-12-07 22:17:12','2015-12-07 22:17:12'),(2858,1,'bcb9ba38fe1906756263964d350d819e26de90e52eb5e8e3384451c9d41df6d8','input',4,'2015-12-07 22:17:13','2015-12-07 22:17:13'),(2859,1,'f82bf3471021a9e37ef1ed96bfc96dbd02954dcc7da59dc152b7a68e1046c84b','controller',8,'2015-12-07 22:17:13','2015-12-07 22:17:13'),(2860,1,'a2b754011266280d61a325764a2e663b2e1c9c8c1cd0a168cda949f58a0506a3','input',4,'2015-12-07 22:17:13','2015-12-07 22:17:13'),(2861,1,'c3d5042c5ed1caf4a370bec105da589d4019939c7733a18316241358740d7e4f','controller',8,'2015-12-07 22:17:13','2015-12-07 22:17:13'),(2862,1,'c020e281ee135fe95e64f6ac51123c6bad777206535587861b2381e64a58f244','input',4,'2015-12-07 22:17:13','2015-12-07 22:17:13'),(2863,1,'5642bd2beb35a55467450c21b9521363bb8bde264dcf42b6a26d44ab89774dfe','controller',8,'2015-12-07 22:17:13','2015-12-07 22:17:13'),(2864,1,'2e8e0c2d53602c349718cd6e155f7c8617790af4060179902455e63bb8819d07','input',4,'2015-12-07 22:17:13','2015-12-07 22:17:13'),(2865,1,'ba026a463ed74f8b36455f908aa98eea41b806f7ed64ccebc505b00424abe581','controller',8,'2015-12-07 22:17:14','2015-12-07 22:17:14'),(2866,1,'8fef1f33860e26a7546d4bbb9b2e888472773a8f9440418c44257b380806bcfd','input',4,'2015-12-07 22:17:14','2015-12-07 22:17:14'),(2867,1,'64f259273e06c3201705349600670206e54ec95738781198384fb8f60e369986','controller',8,'2015-12-07 22:17:14','2015-12-07 22:17:14'),(2868,1,'a033a853297755714ad0486129a4ac7a31828f4a992e63e81352c0e5064447fd','input',4,'2015-12-07 22:17:14','2015-12-07 22:17:14'),(2869,1,'5b224f28961713f6473f749606e0d2edbcc4e815815c74066a93118db66c79a5','controller',8,'2015-12-07 22:17:14','2015-12-07 22:17:14'),(2870,1,'9d62e8b5584e83415b128840d1f672ab33be508c61e9e78ee7e9d20265da8534','input',4,'2015-12-07 22:17:14','2015-12-07 22:17:14'),(2871,1,'4b05319b15a66b3c0f3fc0c519522535ce6d402630bbdf047467aecf1c116ab3','controller',8,'2015-12-07 22:17:14','2015-12-07 22:17:14'),(2872,1,'07bab9938198eaeba17aa3f6f22cbe37f564f1f3735edfd2f5080b2934a9901e','input',4,'2015-12-07 22:17:14','2015-12-07 22:17:14'),(2873,1,'7ff9b9ea6fa9717cc16aec1e8a793fab055d32ceebdbfabc815bcd80686a274f','controller',8,'2015-12-07 22:17:15','2015-12-07 22:17:15'),(2874,1,'27fe9e2e848befa55725f4a10a06ce0aef0d2a0380dac48d9c1c09de7a187737','input',4,'2015-12-07 22:17:15','2015-12-07 22:17:15'),(2875,1,'2f2c74ab0666768445a4eefb2e21c2c785b63857bd7fd297edac249561785473','controller',8,'2015-12-07 22:17:15','2015-12-07 22:17:15'),(2876,1,'99236d1d2b80cf2029add3f03a199953715c85361ec303785fc9c03628eaa8ed','input',5,'2015-12-07 22:17:18','2015-12-07 22:17:18'),(2877,1,'aed332669c3193a3e55e91f8c591f91c1fb7a2274585977b96250adb55c6b7b5','input',1,'2015-12-07 22:17:18','2015-12-07 22:17:18'),(2878,1,'5b92b8520ac5fabf88588e84018fc4a8b69e80b9bb69b7517256d18c2bd15678','input',2,'2015-12-07 22:17:18','2015-12-07 22:17:18'),(2879,1,'b385422d60c81592db0d25a6961bbda857ed451f6b3ecf6dc4b47171f06509a9','input',3,'2015-12-07 22:17:18','2015-12-07 22:17:18'),(2880,1,'fad12e32ac3c7142147fda3922afa34d6529f73376dd7068636ba5f061be378e','controller',9,'2015-12-07 22:17:18','2015-12-07 22:17:18'),(2893,1,'afa47cd691beb4b5faee9ca9b56981e46a38c1eb8b1834d4bfab7a88e88b1ca7','target',5,'2015-12-07 22:21:03','2015-12-07 22:21:03'),(2898,1,'a2f7599e15654640f33e68f2b1d413c3e234fe0b0336b2cf71e6fce8c13264e2','target',2,'2015-12-07 22:21:05','2015-12-07 22:21:05'),(2899,1,'2ef15b43605af59d41c71edb0c87ae5f0d66242135ee13b9aafa3bb1b6ebde02','target',1,'2015-12-07 22:21:05','2015-12-07 22:21:05'),(2900,1,'45eccf0a00b243a145879a38d08500309a143788f23fca7d4182634db7b4a13d','input',1,'2015-12-07 22:21:06','2015-12-07 22:21:06'),(2901,1,'06f677e637ad8aa30c327ca95dfc485a0400f4f5fa8df2ee48325930a99faaa1','input',2,'2015-12-07 22:21:06','2015-12-07 22:21:06'),(2902,1,'6ac296478b4452a34cddca344763a05c2d6b0a5c31368dc4d6cd0ba547ba8a8a','input',3,'2015-12-07 22:21:06','2015-12-07 22:21:06'),(2903,1,'16a93af92fccf656cef70a92dc4c3dd2da6005ab517be94159150fbd59ef3b43','controller',5,'2015-12-07 22:21:06','2015-12-07 22:21:06'),(2904,1,'b5d319989ecc4663a13a56b3580a0a752cd111fa0ea4972e63195f1da0021fd5','controller',6,'2015-12-07 22:21:06','2015-12-07 22:21:06'),(2905,1,'ccbbfdad1e24ff05522b165d3e9fac784247b75650a6c1c7de632cebaa15fbbf','controller',7,'2015-12-07 22:21:06','2015-12-07 22:21:06'),(2906,1,'5ec2b3834fa90eba598dbdec7a781f4fb4f1a54eb38b06f2e91dfd07be035176','controller',4,'2015-12-07 22:21:06','2015-12-07 22:21:06');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_input`
--

LOCK TABLES `test_input` WRITE;
/*!40000 ALTER TABLE `test_input` DISABLE KEYS */;
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

-- Dump completed on 2015-12-07 22:25:09
