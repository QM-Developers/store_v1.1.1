-- MySQL dump 10.13  Distrib 5.6.35, for Win64 (x86_64)
--
-- Host: localhost    Database: store_v1_1_1
-- ------------------------------------------------------
-- Server version	5.6.35-log

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
-- Table structure for table `app_update`
--

DROP TABLE IF EXISTS `app_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_update` (
  `app_update_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_version` varchar(25) NOT NULL DEFAULT '',
  `app_update_url` text,
  `app_update_content` text,
  PRIMARY KEY (`app_update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_update`
--

LOCK TABLES `app_update` WRITE;
/*!40000 ALTER TABLE `app_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_history`
--

DROP TABLE IF EXISTS `chat_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_history` (
  `history_id` varchar(35) NOT NULL,
  `send_user_id` varchar(35) NOT NULL DEFAULT '',
  `receive_user_id` varchar(35) NOT NULL DEFAULT '',
  `data_type` int(11) NOT NULL DEFAULT '0',
  `send_data` text,
  `send_time` varchar(15) NOT NULL DEFAULT '',
  `is_read` tinyint(4) NOT NULL DEFAULT '0',
  `is_received` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_history`
--

LOCK TABLES `chat_history` WRITE;
/*!40000 ALTER TABLE `chat_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_apply`
--

DROP TABLE IF EXISTS `common_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_apply` (
  `apply_id` varchar(35) NOT NULL,
  `apply_title` varchar(100) NOT NULL,
  `proposer_id` varchar(35) NOT NULL,
  `proposer_name` varchar(20) NOT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `apply_result` tinyint(4) NOT NULL,
  `apply_reason` text,
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_apply`
--

LOCK TABLES `common_apply` WRITE;
/*!40000 ALTER TABLE `common_apply` DISABLE KEYS */;
INSERT INTO `common_apply` VALUES ('223b5684a88c4875a69291f38a3e3fa1','1','89d9317fb3834353bcf2a507bee2eb82','张三',NULL,NULL,'2017-10-23 09:47:17',12,'1'),('2292f55d924049dfb35261807c94a53f','1','89d9317fb3834353bcf2a507bee2eb82','张三','2017-08-30','2017-08-31','2017-10-23 09:03:31',12,'1'),('2c4dd862aa2f4ab1bb4a03590582f210','请假申请','89d9317fb3834353bcf2a507bee2eb82','张三','2017-08-30','2017-08-31','2017-09-04 16:14:30',12,'累');
/*!40000 ALTER TABLE `common_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_apply_approve`
--

DROP TABLE IF EXISTS `common_apply_approve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_apply_approve` (
  `apply_id` varchar(35) NOT NULL,
  `approve_id` varchar(35) NOT NULL,
  `approve_name` varchar(35) NOT NULL,
  `approve_result` tinyint(4) NOT NULL,
  `approve_sequence` tinyint(4) DEFAULT NULL,
  `approve_advice` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_apply_approve`
--

LOCK TABLES `common_apply_approve` WRITE;
/*!40000 ALTER TABLE `common_apply_approve` DISABLE KEYS */;
INSERT INTO `common_apply_approve` VALUES ('2c4dd862aa2f4ab1bb4a03590582f210','89d9317fb3834353bcf2a507bee2eb84','王五',21,1,NULL),('2c4dd862aa2f4ab1bb4a03590582f210','41370f132bd44bca943e2fe5dd9862ab','赵六',22,2,NULL),('2292f55d924049dfb35261807c94a53f','5a27d0f892cd48a482622f8b76fd239c','王舞欣',21,1,NULL),('2292f55d924049dfb35261807c94a53f','9f6bc79d769342f1b90ed0b532b870f2','李思思',22,2,NULL),('223b5684a88c4875a69291f38a3e3fa1','5a27d0f892cd48a482622f8b76fd239c','王舞欣',21,1,'意见'),('223b5684a88c4875a69291f38a3e3fa1','9f6bc79d769342f1b90ed0b532b870f2','李思思',22,2,'建议');
/*!40000 ALTER TABLE `common_apply_approve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_apply_image`
--

DROP TABLE IF EXISTS `common_apply_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_apply_image` (
  `apply_id` varchar(35) NOT NULL DEFAULT '',
  `image_id` varchar(35) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `image_sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_apply_image`
--

LOCK TABLES `common_apply_image` WRITE;
/*!40000 ALTER TABLE `common_apply_image` DISABLE KEYS */;
INSERT INTO `common_apply_image` VALUES ('223b5684a88c4875a69291f38a3e3fa1','a3ad0592c5324e2b8f9fe46aa8047f31','/upload/img/user/apply/9f6bc79d769342f1b90ed0b532b870f2\\c4960e06401f47d1849a20e9aa4fd868.jpg',0);
/*!40000 ALTER TABLE `common_apply_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` varchar(35) NOT NULL,
  `customer_type` varchar(20) NOT NULL DEFAULT '',
  `user_id` varchar(35) NOT NULL DEFAULT '',
  `promoter_id` varchar(35) NOT NULL DEFAULT '',
  `merchandiser_id` varchar(35) NOT NULL DEFAULT '',
  `my_team_id` varchar(35) NOT NULL DEFAULT '',
  `business_address` varchar(50) NOT NULL DEFAULT '',
  `station` varchar(20) NOT NULL DEFAULT '',
  `credit_rating` tinyint(4) NOT NULL DEFAULT '0',
  `had_account` tinyint(4) NOT NULL DEFAULT '0',
  `update_date` datetime DEFAULT NULL,
  `update_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('94a397ea0eae4632994108c02fe3b762','personal','0bb4b24df33948cfb68e61c1d5c1c75d','9f6bc79d769342f1b90ed0b532b870f2','528832fa9cc54d0290f6ee2922b27256','10001','','',0,1,'2017-10-19 11:43:48',7);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_account_request`
--

DROP TABLE IF EXISTS `customer_account_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_account_request` (
  `request_id` varchar(35) NOT NULL,
  `proposer_id` varchar(35) NOT NULL,
  `proposer_name` varchar(20) NOT NULL,
  `customer_id` varchar(35) NOT NULL,
  `customer_name` varchar(20) NOT NULL,
  `merchandiser_id` varchar(35) NOT NULL,
  `merchandiser_name` varchar(20) NOT NULL,
  `checker_id` varchar(35) NOT NULL,
  `checker_name` varchar(20) NOT NULL,
  `request_status` tinyint(4) NOT NULL,
  `create_date` datetime NOT NULL,
  `request_reason` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_account_request`
--

LOCK TABLES `customer_account_request` WRITE;
/*!40000 ALTER TABLE `customer_account_request` DISABLE KEYS */;
INSERT INTO `customer_account_request` VALUES ('320cd46e93004f12890dba46bf0d2a4d','03ef5797bae2466699d5efc970a8962f','李四','43a3f72f83d14b498e117f9be76e8d4f','jackson','03ef5797bae2466699d5efc970a8962f','李四','9f6bc79d769342f1b90ed0b532b870f2','李思思',2,'2017-10-12 15:37:28','loginInfo'),('7c2c30d5d1ef49289f10f21de4e1ed5e','03ef5797bae2466699d5efc970a8962f','李四','94a397ea0eae4632994108c02fe3b762','alisa','5a27d0f892cd48a482622f8b76fd239c','王舞欣','9f6bc79d769342f1b90ed0b532b870f2','李思思',2,'2017-10-19 10:29:22','啊'),('929ca76f1b1e43ef8d6fba1ac86a0066','89d9317fb3834353bcf2a507bee2eb82','张三','21e7e3bcab354cfc8aae9ed21162d5a6','三三','89d9317fb3834353bcf2a507bee2eb82','张三','89d9317fb3834353bcf2a507bee2eb82','张三',1,'2017-09-20 17:17:07','loginInfo'),('e0fc8ae5811648b89732d9fdf87d664f','89d9317fb3834353bcf2a507bee2eb82','张三','c1e0c28313ee42a38e06e25233619369','三三','89d9317fb3834353bcf2a507bee2eb82','张三','89d9317fb3834353bcf2a507bee2eb82','张三',2,'2017-09-20 17:20:44','loginInfo');
/*!40000 ALTER TABLE `customer_account_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_assist`
--

DROP TABLE IF EXISTS `customer_assist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_assist` (
  `assist_id` varchar(35) NOT NULL,
  `assist_title` varchar(100) NOT NULL DEFAULT '',
  `assist_reason` varchar(255) NOT NULL DEFAULT '',
  `user_id` varchar(35) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`assist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_assist`
--

LOCK TABLES `customer_assist` WRITE;
/*!40000 ALTER TABLE `customer_assist` DISABLE KEYS */;
INSERT INTO `customer_assist` VALUES ('20a0d03c621b4ffcbd06b25f970e4e8e','搞不定','太难搞','89d9317fb3834353bcf2a507bee2eb82','张三','2017-09-11 16:22:19'),('2d0ac0adfe674fa39a1573ac2da70530','','10001','89d9317fb3834353bcf2a507bee2eb82','张三','2017-10-24 09:42:18'),('ec763147d35c4ab285fbcba67ca57a30','10001','10001','89d9317fb3834353bcf2a507bee2eb82','张三','2017-10-19 18:20:27');
/*!40000 ALTER TABLE `customer_assist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_assist_customer`
--

DROP TABLE IF EXISTS `customer_assist_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_assist_customer` (
  `assist_id` varchar(35) NOT NULL,
  `customer_id` varchar(35) NOT NULL,
  `customer_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_assist_customer`
--

LOCK TABLES `customer_assist_customer` WRITE;
/*!40000 ALTER TABLE `customer_assist_customer` DISABLE KEYS */;
INSERT INTO `customer_assist_customer` VALUES ('20a0d03c621b4ffcbd06b25f970e4e8e','1ddd3d18c22a4c129c2517d50e69a400','三三'),('ec763147d35c4ab285fbcba67ca57a30','9f6bc79d769342f1b90ed0b532b870f2','alisa'),('2d0ac0adfe674fa39a1573ac2da70530','94a397ea0eae4632994108c02fe3b762','alisa');
/*!40000 ALTER TABLE `customer_assist_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_assist_image`
--

DROP TABLE IF EXISTS `customer_assist_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_assist_image` (
  `image_id` varchar(35) NOT NULL,
  `image_path` text,
  `assist_id` varchar(35) NOT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_assist_image`
--

LOCK TABLES `customer_assist_image` WRITE;
/*!40000 ALTER TABLE `customer_assist_image` DISABLE KEYS */;
INSERT INTO `customer_assist_image` VALUES ('698a60e791324ea8bfce26029108b110','/upload/img/user/assist/89d9317fb3834353bcf2a507bee2eb82/698a60e791324ea8bfce26029108b110.jpg','20a0d03c621b4ffcbd06b25f970e4e8e'),('85bec1897c8e4abcb7faed0e1e3c88d9','/upload/img/user/assist/9f6bc79d769342f1b90ed0b532b870f2/85bec1897c8e4abcb7faed0e1e3c88d9.jpg','2d0ac0adfe674fa39a1573ac2da70530');
/*!40000 ALTER TABLE `customer_assist_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_assist_user`
--

DROP TABLE IF EXISTS `customer_assist_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_assist_user` (
  `assist_id` varchar(35) NOT NULL,
  `assist_result` text,
  `user_id` varchar(35) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `department_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_assist_user`
--

LOCK TABLES `customer_assist_user` WRITE;
/*!40000 ALTER TABLE `customer_assist_user` DISABLE KEYS */;
INSERT INTO `customer_assist_user` VALUES ('20a0d03c621b4ffcbd06b25f970e4e8e','自己解决','89d9317fb3834353bcf2a507bee2eb83','李四','财务部'),('ec763147d35c4ab285fbcba67ca57a30','122130','0420cb22c06b43a488c39967779eecec','王五','departmentName'),('2d0ac0adfe674fa39a1573ac2da70530','','0420cb22c06b43a488c39967779eecec','王五','departmentName');
/*!40000 ALTER TABLE `customer_assist_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_follow`
--

DROP TABLE IF EXISTS `customer_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_follow` (
  `follow_id` varchar(35) NOT NULL,
  `follow_title` varchar(50) NOT NULL,
  `follow_date` datetime NOT NULL,
  `follow_content` text,
  `follow_result` text,
  `customer_id` varchar(35) NOT NULL,
  `customer_name` varchar(20) NOT NULL,
  `promoter_id` varchar(35) NOT NULL,
  `promoter_name` varchar(20) NOT NULL,
  PRIMARY KEY (`follow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_follow`
--

LOCK TABLES `customer_follow` WRITE;
/*!40000 ALTER TABLE `customer_follow` DISABLE KEYS */;
INSERT INTO `customer_follow` VALUES ('4231e8124e9247139d095044b5f83a08','跟进测试','2017-12-12 00:00:00','忘记去了','followResult','94a397ea0eae4632994108c02fe3b762','alisa','89d9317fb3834353bcf2a507bee2eb82','张三'),('6ab57a2bde64458a9cf19c16226a45e6','标题','2017-07-07 00:00:00',NULL,NULL,'43a3f72f83d14b498e117f9be76e8d4f','jackson','03ef5797bae2466699d5efc970a8962f','李四');
/*!40000 ALTER TABLE `customer_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_repertory`
--

DROP TABLE IF EXISTS `customer_repertory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_repertory` (
  `customer_type` varchar(20) NOT NULL DEFAULT '',
  `my_team_id` varchar(35) NOT NULL DEFAULT '',
  `repertory_type` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_repertory`
--

LOCK TABLES `customer_repertory` WRITE;
/*!40000 ALTER TABLE `customer_repertory` DISABLE KEYS */;
INSERT INTO `customer_repertory` VALUES ('personal','10001',1),('dealer','10001',2);
/*!40000 ALTER TABLE `customer_repertory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_visit`
--

DROP TABLE IF EXISTS `customer_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_visit` (
  `member_id` varchar(35) NOT NULL,
  `department_id` varchar(35) NOT NULL,
  `department_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_visit`
--

LOCK TABLES `customer_visit` WRITE;
/*!40000 ALTER TABLE `customer_visit` DISABLE KEYS */;
INSERT INTO `customer_visit` VALUES ('89d9317fb3834353bcf2a507bee2eb82','27a9c57b4c69441aa569ef4ae1a9ef7c','总经办'),('89d9317fb3834353bcf2a507bee2eb82','47f0a0a4c639488b8772c4e51219ad02','测试部10'),('89d9317fb3834353bcf2a507bee2eb82','6256feb92d844cd5951d7cfe01d922ed','技术部');
/*!40000 ALTER TABLE `customer_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_position`
--

DROP TABLE IF EXISTS `department_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department_position` (
  `position_id` varchar(35) NOT NULL,
  `position_name` varchar(10) NOT NULL DEFAULT '',
  `team_department_id` varchar(35) NOT NULL DEFAULT '',
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_position`
--

LOCK TABLES `department_position` WRITE;
/*!40000 ALTER TABLE `department_position` DISABLE KEYS */;
INSERT INTO `department_position` VALUES ('2a127fcd70fd40988508dacadaa5f0d0','测试主任','e6ab7ff31bc641749b458c59ac8204ac'),('3269998df292491889173c0e00259221','财务主管','dc89587b44ff4652b44f81da12589175'),('67c9a3c744e84905b125707785354396','负责人','9e8d946ef94b4795bd9218795354e631'),('6bc47243d1a24b4ca1b2ede9cedc3374','后勤主管','4bc0ec2d68a444e7a584b9f8d03cbc44'),('74e75f325887434e9fb846509ec74c32','业务主管','5a20e0ea32b948c08c928995b26af64e'),('93bb14244c9644df9eb966f257ac0795','财务员','dc89587b44ff4652b44f81da12589175'),('b07d5450f6ae448b88db7dfcdf0d1dc7','后勤人员','4bc0ec2d68a444e7a584b9f8d03cbc44'),('ecc6efd7b0904b2e9ca069342ade21eb','业务员','5a20e0ea32b948c08c928995b26af64e');
/*!40000 ALTER TABLE `department_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dictionary`
--

DROP TABLE IF EXISTS `dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dictionary` (
  `dict_id` varchar(35) NOT NULL,
  `par_dict_id` varchar(35) NOT NULL DEFAULT '',
  `dict_name` varchar(50) NOT NULL DEFAULT '',
  `dict_code` varchar(50) NOT NULL DEFAULT '',
  `dict_create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sort` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`dict_id`),
  KEY `FK_par_dic_child_dic_RE` (`par_dict_id`),
  CONSTRAINT `FK_par_dic_child_dic_RE` FOREIGN KEY (`par_dict_id`) REFERENCES `parent_dictionary` (`par_dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dictionary`
--

LOCK TABLES `dictionary` WRITE;
/*!40000 ALTER TABLE `dictionary` DISABLE KEYS */;
INSERT INTO `dictionary` VALUES ('11ab454a1bfa45e7b8f93871c617d037','60da30408feb45b78a6340e45427a77d','女','sex_0','2017-06-17 09:06:21','1'),('23616b1025cc44e4af1268c541bfb85b','b3a5fa19c94d4a18b5b6c75ce8d3c828','次图','2','2017-05-19 09:23:49','1'),('3b69b0b46801437a80b7d9436a5db1d4','7358aa8f92bd43dfb8e9472a7a4c74f5','等待发货','order_st_waiting_deliver','2017-05-19 10:37:16','3'),('41ce4f97b0414cce823af762169792b1','297ebc9fd0f640fca9f04c8fc067414e','填写','in_t_0','2017-05-19 09:22:13','0'),('43e1b93384cf47edac841d6f639cf308','ca970ab6c3d847b0b14cc6cd64ea253c','用户已建账','u_st_1','2017-05-19 09:51:21','1'),('48427fea6c4d4da0bdb0262fbe24141e','60da30408feb45b78a6340e45427a77d','男','sex_1','2017-06-17 09:06:21','0'),('4998bc243b704849a70c5322d24c8355','9fb5903640b340b795bc68481f1b48e3','合作社','c_g_3','2017-05-19 09:35:58','3'),('5f1fd7c385624f7d9f2f7c05ad9ce231','7358aa8f92bd43dfb8e9472a7a4c74f5','等待付款','order_st_waiting_pay','2017-05-19 10:37:16','2'),('65e6982be1a64e689c286f9bc874bfc1','297ebc9fd0f640fca9f04c8fc067414e','填写选择','in_t_2','2017-05-19 09:22:13','2'),('672b02e15beb4808945feab02ff93242','ca970ab6c3d847b0b14cc6cd64ea253c','用户已注册','u_st_2','2017-05-19 09:51:21','2'),('70b44cfa2133407690a408c0d141cfd2','7358aa8f92bd43dfb8e9472a7a4c74f5','等待评价','order_st_waiting_estimate','2017-05-19 10:37:16','5'),('719623566b1b48f4987dfb16f0e19a5c','9fb5903640b340b795bc68481f1b48e3','合作农户','c_g_2','2017-05-19 09:35:58','2'),('78b059a98fa04c11a6d9badca4650cf4','7358aa8f92bd43dfb8e9472a7a4c74f5','交易成功','order_st_succeeded','2017-05-19 10:37:16','4'),('a056459ca4144a9d879f5b5441354380','297ebc9fd0f640fca9f04c8fc067414e','选择','in_t_1','2017-05-19 09:22:13','1'),('a256240b3ec544188b4228028dc27099','8a17ada2ba50486db550935f4ca90780','已拒绝','negative','2017-06-16 17:06:42','2'),('a37079a23bff4a069652ec4ab45cabb2','7358aa8f92bd43dfb8e9472a7a4c74f5','正在审核','order_st_checking','2017-05-19 10:37:16','0'),('c120146b6eaa4c5a94d2e0b4e4c48ff6','9fb5903640b340b795bc68481f1b48e3','个体户','c_g_0','2017-05-19 09:35:58','0'),('cd36e1adee22447281805b45a9b51ac3','58c359e4f354459aa2d9692a50ca3e19','否','0','2017-05-19 09:38:38','0'),('d25adc48227a42fb8a6d7a53d7150ef5','58c359e4f354459aa2d9692a50ca3e19','是','1','2017-05-19 09:38:38','1'),('d643610b2ade4853b650cfb35230ca6a','7c91ff9e7e3b47a7ba42b4d4ea78ab5a','已付款','pyment_method_2','2017-05-19 09:50:00','2'),('da0ffec3e70f4cef9fef0fc7b8efd1c1','8a17ada2ba50486db550935f4ca90780','等待确认','request','2017-06-16 17:06:42','0'),('e21f405b452d4341ad8492f12289caf5','7358aa8f92bd43dfb8e9472a7a4c74f5','审核通过','order_st_pass','2017-05-19 10:37:16','1'),('e657734638874998b73d5cd958c48aac','7c91ff9e7e3b47a7ba42b4d4ea78ab5a','月结','pyment_method_0','2017-05-19 09:50:00','0'),('e66d45092957445f8d2df43c34b4326d','7c91ff9e7e3b47a7ba42b4d4ea78ab5a','到付','pyment_method_1','2017-05-19 09:50:00','1'),('e7837f343ff24baf8e0f15d8f607f4d2','9fb5903640b340b795bc68481f1b48e3','经销商','c_g_1','2017-05-19 09:35:58','1'),('e8acaa7cbed0462cb1c8913b3e432d5d','b3a5fa19c94d4a18b5b6c75ce8d3c828','主图','1','2017-05-19 09:23:49','0'),('eb9a8c796c9e4e2397de53603d7e6b75','8a17ada2ba50486db550935f4ca90780','已同意','agree','2017-06-16 17:06:42','1'),('efb2ca5424e34119970cbcdd9f17dde0','ca970ab6c3d847b0b14cc6cd64ea253c','用户已建档','u_st_0','2017-05-19 09:51:21','0');
/*!40000 ALTER TABLE `dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmer`
--

DROP TABLE IF EXISTS `farmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmer` (
  `farmer_id` varchar(35) NOT NULL,
  `customer_id` varchar(35) NOT NULL DEFAULT '',
  `farmer_name` varchar(20) NOT NULL DEFAULT '',
  `farmer_phone` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`farmer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer`
--

LOCK TABLES `farmer` WRITE;
/*!40000 ALTER TABLE `farmer` DISABLE KEYS */;
INSERT INTO `farmer` VALUES ('15b6e9a5106f4bdfadb40a5db75ef4dd','94a397ea0eae4632994108c02fe3b762','山姆大叔','11912011211');
/*!40000 ALTER TABLE `farmer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freight_temp`
--

DROP TABLE IF EXISTS `freight_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freight_temp` (
  `freight_id` varchar(35) NOT NULL,
  `freight_name` varchar(20) NOT NULL DEFAULT '',
  `weight_allowance` float NOT NULL DEFAULT '0',
  `start_range` float NOT NULL DEFAULT '0',
  `start_price` float NOT NULL DEFAULT '0',
  `increase_range` float NOT NULL DEFAULT '0',
  `increase_price` float NOT NULL DEFAULT '0',
  `my_team_id` varchar(35) NOT NULL DEFAULT '',
  `user_id` varchar(35) NOT NULL DEFAULT '',
  PRIMARY KEY (`freight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freight_temp`
--

LOCK TABLES `freight_temp` WRITE;
/*!40000 ALTER TABLE `freight_temp` DISABLE KEYS */;
INSERT INTO `freight_temp` VALUES ('a9dbba21bdcb4100968e8bd000878bae','小卡车',65,65,600,62,60,'10001','89d9317fb3834353bcf2a507bee2eb82');
/*!40000 ALTER TABLE `freight_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend` (
  `friend_id` varchar(35) NOT NULL,
  `user_id` varchar(35) NOT NULL DEFAULT '',
  `friend_user_id` varchar(35) NOT NULL DEFAULT '',
  `friend_origin` varchar(10) NOT NULL DEFAULT '',
  `friend_remark_name` varchar(20) NOT NULL DEFAULT '',
  `friend_remark_text` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
INSERT INTO `friend` VALUES ('5405deb2a74e44dbb75610ea7a149aba','89d9317fb3834353bcf2a507bee2eb83','89d9317fb3834353bcf2a507bee2eb82','','',''),('bf5f51127d984eb987540bfc2429c315','89d9317fb3834353bcf2a507bee2eb82','89d9317fb3834353bcf2a507bee2eb83','','','');
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_request`
--

DROP TABLE IF EXISTS `friend_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_request` (
  `request_id` varchar(35) NOT NULL,
  `user_id` varchar(35) NOT NULL DEFAULT '',
  `friend_id` varchar(35) NOT NULL DEFAULT '',
  `friend_origin` varchar(10) NOT NULL DEFAULT '',
  `request_info` varchar(20) NOT NULL DEFAULT '',
  `request_state` varchar(10) NOT NULL DEFAULT '',
  `is_read` tinyint(4) NOT NULL DEFAULT '0',
  `is_received` tinyint(4) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_request`
--

LOCK TABLES `friend_request` WRITE;
/*!40000 ALTER TABLE `friend_request` DISABLE KEYS */;
INSERT INTO `friend_request` VALUES ('ca5edb2a0d824bfeb9bfe60ac46845cd','89d9317fb3834353bcf2a507bee2eb83','89d9317fb3834353bcf2a507bee2eb82','','','agree',0,1,'2017-08-05 09:36:24'),('e8244dc1a95d347e','89d9317fb3834353bcf2a507bee2eb82','89d9317fb3834353bcf2a507bee2eb83','','加加加','agree',0,1,'2017-08-05 09:33:46');
/*!40000 ALTER TABLE `friend_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_enshrine`
--

DROP TABLE IF EXISTS `goods_enshrine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_enshrine` (
  `goods_id` varchar(35) NOT NULL,
  `user_id` varchar(35) NOT NULL,
  PRIMARY KEY (`goods_id`,`user_id`),
  KEY `FK_user_goods_RE2` (`user_id`),
  CONSTRAINT `FK_user_goods_RE` FOREIGN KEY (`goods_id`) REFERENCES `goodsinfo` (`goods_id`),
  CONSTRAINT `FK_user_goods_RE2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_enshrine`
--

LOCK TABLES `goods_enshrine` WRITE;
/*!40000 ALTER TABLE `goods_enshrine` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_enshrine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_image`
--

DROP TABLE IF EXISTS `goods_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_image` (
  `goods_id` varchar(35) NOT NULL DEFAULT '',
  `image_id` varchar(35) NOT NULL DEFAULT '',
  `sort` varchar(2) NOT NULL DEFAULT '',
  `goods_img_type` tinyint(4) NOT NULL DEFAULT '0',
  KEY `FK_goods_img_RE` (`goods_id`),
  KEY `FK_goods_img_space_re` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_image`
--

LOCK TABLES `goods_image` WRITE;
/*!40000 ALTER TABLE `goods_image` DISABLE KEYS */;
INSERT INTO `goods_image` VALUES ('f0c3df5bdb0a45aabf22464bb27dbb88','f0c3df5bdb0a45aabf22464bb27dbb88','',1),('bae0a50f935248cfa03a0e0cbffd2dda','35aa7507390f4ead9d64dc55cc2aa768','0',1),('bae0a50f935248cfa03a0e0cbffd2dda','4ece06b76d3f42718722e37a92b44d0c','1',2),('bae0a50f935248cfa03a0e0cbffd2dda','4fb2d3accff24ba4a9dec5d2a38e5b25','2',2),('bae0a50f935248cfa03a0e0cbffd2dda','716e780e379142a5812587a4ba11387e','3',2),('bae0a50f935248cfa03a0e0cbffd2dda','eedad265f3624c0eb2c6f9ac890989aa','4',2),('091987de11a94e62ad65005a6cf8aa4c','eedad265f3624c0eb2c6f9ac890989aa','0',1),('091987de11a94e62ad65005a6cf8aa4c','f0c3df5bdb0a45aabf22464bb27dbb88','1',2),('c15a234444ae4a2faf84b627e4a77c07','eedad265f3624c0eb2c6f9ac890989aa','0',1),('c15a234444ae4a2faf84b627e4a77c07','f0c3df5bdb0a45aabf22464bb27dbb88','1',2);
/*!40000 ALTER TABLE `goods_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_standard`
--

DROP TABLE IF EXISTS `goods_standard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_standard` (
  `standard_id` varchar(35) NOT NULL,
  `goods_id` varchar(35) NOT NULL DEFAULT '',
  `standard_name` varchar(20) NOT NULL DEFAULT '',
  `standard_price` float NOT NULL DEFAULT '0',
  `standard_count` int(11) NOT NULL DEFAULT '0',
  `standard_weight` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`standard_id`),
  KEY `FK_goods_standard_re` (`goods_id`),
  CONSTRAINT `FK_goods_standard_re` FOREIGN KEY (`goods_id`) REFERENCES `goodsinfo` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_standard`
--

LOCK TABLES `goods_standard` WRITE;
/*!40000 ALTER TABLE `goods_standard` DISABLE KEYS */;
INSERT INTO `goods_standard` VALUES ('4e3007c4db5d483bb9245743fa5c08eb','f0c3df5bdb0a45aabf22464bb27dbb88','10kg/袋',20,100,10),('8e6aabae569e44ca80db3115372aa1a4','bae0a50f935248cfa03a0e0cbffd2dda','100g/袋',20,497,100),('e0841a5ee98a410c9f1fe4a786a6d6f0','f0c3df5bdb0a45aabf22464bb27dbb88','20kg/袋',35,200,20);
/*!40000 ALTER TABLE `goods_standard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_type_attr`
--

DROP TABLE IF EXISTS `goods_type_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_type_attr` (
  `goods_type_attr_id` varchar(35) NOT NULL,
  `goods_type_id` varchar(35) NOT NULL DEFAULT '',
  `goods_type_attr_name` varchar(50) NOT NULL DEFAULT '',
  `goods_type_attr_value` varchar(30) NOT NULL DEFAULT '',
  `goods_type_attr_const` tinyint(4) NOT NULL DEFAULT '0',
  `goods_type_attr_input_type` varchar(10) NOT NULL DEFAULT '',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `delete_date` datetime DEFAULT NULL,
  PRIMARY KEY (`goods_type_attr_id`),
  KEY `FK_type_detail_re` (`goods_type_id`),
  CONSTRAINT `FK_type_detail_re` FOREIGN KEY (`goods_type_id`) REFERENCES `goods_typeinfo` (`goods_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_type_attr`
--

LOCK TABLES `goods_type_attr` WRITE;
/*!40000 ALTER TABLE `goods_type_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_type_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_typeinfo`
--

DROP TABLE IF EXISTS `goods_typeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_typeinfo` (
  `goods_type_id` varchar(35) NOT NULL,
  `goods_type_name` varchar(20) NOT NULL DEFAULT '',
  `goods_type_pid` varchar(35) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `delete_date` date DEFAULT NULL,
  PRIMARY KEY (`goods_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_typeinfo`
--

LOCK TABLES `goods_typeinfo` WRITE;
/*!40000 ALTER TABLE `goods_typeinfo` DISABLE KEYS */;
INSERT INTO `goods_typeinfo` VALUES ('03d6bea1b2d9482e9e254265e9945736','添加剂','286f09ac9e744088ad7ae9dbf8b5c70e',0,NULL),('07d6d3ebc7dd440eb381d7771e73a156','解热镇痛','286f09ac9e744088ad7ae9dbf8b5c70e',0,NULL),('0894a22a052d4bb8a9a2995474dd4943','解热镇痛','49014b0e6c1e4a27aa952022b22c13b2',0,NULL),('0aab6554bb784adf9660b262fcb5e8d6','抗菌消炎','49014b0e6c1e4a27aa952022b22c13b2',0,NULL),('0b49ef854bb74ff9b9317132dba053d7','中猪料','2267430251874ea69ea82834c558977a',0,NULL),('10024c95782b4e9a9aa65b12d24153c3','脱霉剂','03d6bea1b2d9482e9e254265e9945736',0,NULL),('1fb7c7f35d5d495d8f37a26ef73701d5','环境改良剂','03d6bea1b2d9482e9e254265e9945736',0,NULL),('201e884d225d40bd8e31cbc56b7df81e','人工授精','583fdc38ee8c4b5aa6be0b9497da9594',0,NULL),('2267430251874ea69ea82834c558977a','饲料','0',0,NULL),('273b080cc35f4b04946db52daca07798','保育类','2267430251874ea69ea82834c558977a',0,NULL),('286f09ac9e744088ad7ae9dbf8b5c70e','药品','0',0,NULL),('2a2dc78ea7df40ae90a60bb49619df05','原料','2267430251874ea69ea82834c558977a',0,NULL),('2dab53064cc74c468fb4b6b99b6f9b79','养保健类','49014b0e6c1e4a27aa952022b22c13b2',0,NULL),('49014b0e6c1e4a27aa952022b22c13b2','兽药','286f09ac9e744088ad7ae9dbf8b5c70e',0,NULL),('494869f36a254c41b9a7384a8673ba28','呼吸道','49014b0e6c1e4a27aa952022b22c13b2',0,NULL),('4b6533e3a7214dd39eafd2076b9d9813','内三元','c3428a9f163f462a86fc93fc0ab02317',0,NULL),('52c03e15d23747559990472b909cf931','温控环控','583fdc38ee8c4b5aa6be0b9497da9594',0,NULL),('583fdc38ee8c4b5aa6be0b9497da9594','设备','0',0,NULL),('6102cb1d32524f868103c2ed13d7b873','肠道改善剂','03d6bea1b2d9482e9e254265e9945736',0,NULL),('6d905405704c4358a199c6b96c814012','管理辅助','583fdc38ee8c4b5aa6be0b9497da9594',0,NULL),('73b0faa3f9ef41d38ea0ab6a7d647322','免疫增强剂','03d6bea1b2d9482e9e254265e9945736',0,NULL),('7671e2616d2a496a866bcab01553c35f','公猪料','2267430251874ea69ea82834c558977a',0,NULL),('7877698c230446759cb0c2d9c2871f4f','疫苗','49014b0e6c1e4a27aa952022b22c13b2',0,NULL),('85d6d6acc56a45e1b9cc5ebb3ba1ffe6','消毒药','49014b0e6c1e4a27aa952022b22c13b2',0,NULL),('89aaeccbe11b415f822eec109067bc3c','母猪保健类','49014b0e6c1e4a27aa952022b22c13b2',0,NULL),('8fd39f27901e4bd28641e0b3361f5d2b','补铁药','49014b0e6c1e4a27aa952022b22c13b2',0,NULL),('945ecca898284c2187ef6a5475a1363e','兽药大礼包','49014b0e6c1e4a27aa952022b22c13b2',0,NULL),('995dbbd290c34bdb90d72f8e683b5c80','多维','03d6bea1b2d9482e9e254265e9945736',0,NULL),('99a66937a0a3487d96cfccece374490e','促生长类','03d6bea1b2d9482e9e254265e9945736',0,NULL),('9fb6e69754ff423aadeb949d64e2888e','外三元','c3428a9f163f462a86fc93fc0ab02317',0,NULL),('a90311d9c1e143658622922edb76f0d8','注射工具','583fdc38ee8c4b5aa6be0b9497da9594',0,NULL),('ace7d59777d84d63a05c462efc6c8ebf','消化道','49014b0e6c1e4a27aa952022b22c13b2',0,NULL),('b6ec605c1e3e4ebb932f287567720f79','大猪料','2267430251874ea69ea82834c558977a',0,NULL),('bced61eacc0647ecb5827dd8856f3457','驱虫类','49014b0e6c1e4a27aa952022b22c13b2',0,NULL),('c3428a9f163f462a86fc93fc0ab02317','种苗','0',0,NULL),('c357720497e44bdb8720941fe39a1f05','教槽类','2267430251874ea69ea82834c558977a',0,NULL),('cc7e99740f8c467987679f7ee6bc3504','促发情','03d6bea1b2d9482e9e254265e9945736',0,NULL),('cd0dbec4bd914ce2855a9dfab8c85420','抗病毒类','49014b0e6c1e4a27aa952022b22c13b2',0,NULL),('d792326c2d264e529b39c35d8dbc3d2e','母猪料','2267430251874ea69ea82834c558977a',0,NULL),('d9a1c7aa8b8f4d50b6887cf81f60d4c3','成套设备','583fdc38ee8c4b5aa6be0b9497da9594',0,NULL),('e193484a9343450ab72bc3e6687c9023','泌乳类','03d6bea1b2d9482e9e254265e9945736',0,NULL),('f9bd59fa75384f329a5d62b3ee92896c','酶制剂','03d6bea1b2d9482e9e254265e9945736',0,NULL),('f9d0297d747645579b6219abd65c171f','仔猪类','2267430251874ea69ea82834c558977a',0,NULL),('fbca6549122a40029d1e5a5ecef76704','饲料原料','2267430251874ea69ea82834c558977a',0,NULL);
/*!40000 ALTER TABLE `goods_typeinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodsinfo`
--

DROP TABLE IF EXISTS `goodsinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goodsinfo` (
  `goods_id` varchar(35) NOT NULL,
  `goods_type_id` varchar(35) NOT NULL DEFAULT '',
  `my_team_id` varchar(35) NOT NULL DEFAULT '',
  `template_freight_id` varchar(35) NOT NULL DEFAULT '',
  `goods_name` varchar(60) NOT NULL DEFAULT '',
  `goods_price` float NOT NULL DEFAULT '0',
  `goods_count` int(11) NOT NULL DEFAULT '0',
  `goods_attr` text,
  `goods_describe` text,
  `goods_standard` text,
  `goods_freight` int(11) NOT NULL DEFAULT '0',
  `goods_sales` int(11) NOT NULL DEFAULT '0',
  `goods_create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `delete_date` datetime DEFAULT NULL,
  `goods_code` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`goods_id`),
  KEY `FK_goods_freight_re` (`template_freight_id`),
  KEY `FK_goods_type_RE` (`goods_type_id`),
  KEY `FK_team_goods_re` (`my_team_id`),
  CONSTRAINT `FK_goods_type_RE` FOREIGN KEY (`goods_type_id`) REFERENCES `goods_typeinfo` (`goods_type_id`),
  CONSTRAINT `FK_team_goods_re` FOREIGN KEY (`my_team_id`) REFERENCES `my_team` (`my_team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodsinfo`
--

LOCK TABLES `goodsinfo` WRITE;
/*!40000 ALTER TABLE `goodsinfo` DISABLE KEYS */;
INSERT INTO `goodsinfo` VALUES ('bae0a50f935248cfa03a0e0cbffd2dda','945ecca898284c2187ef6a5475a1363e','10001','','【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋',0,0,'品牌?哼哼动保','4fb2d3accff24ba4a9dec5d2a38e5b25|7bc2d9bfafc744c8a6ecabfb7c6e9ce2|7ea010df01dd4e88847daf5c3e3a5002|cb4e6691e9dc46b980576492cc5567d3|eedad265f3624c0eb2c6f9ac890989aa|',NULL,0,0,'2017-10-13 14:47:49',0,NULL,'S119'),('f0c3df5bdb0a45aabf22464bb27dbb88','0b49ef854bb74ff9b9317132dba053d7','10001','','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG',0,0,'品牌?新希望六和','35aa7507390f4ead9d64dc55cc2aa768',NULL,0,0,'2017-10-10 14:36:32',0,NULL,'D110');
/*!40000 ALTER TABLE `goodsinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_space`
--

DROP TABLE IF EXISTS `image_space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_space` (
  `image_id` varchar(35) NOT NULL,
  `my_team_id` varchar(35) NOT NULL DEFAULT '',
  `image_path` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`image_id`),
  KEY `FK_team_img_space` (`my_team_id`),
  CONSTRAINT `FK_team_img_space` FOREIGN KEY (`my_team_id`) REFERENCES `my_team` (`my_team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_space`
--

LOCK TABLES `image_space` WRITE;
/*!40000 ALTER TABLE `image_space` DISABLE KEYS */;
INSERT INTO `image_space` VALUES ('2246ffa623db455890018a19296e5cab','10001','/upload/img/user/space/9f6bc79d769342f1b90ed0b532b870f2/217c49eafbbf4893ac777383fbe96d84.jpg'),('35aa7507390f4ead9d64dc55cc2aa768','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/f4845d04353643989e87cb129e01670d.jpg'),('4c2a6260f11f4830a135138b9d036b19','10001','/upload/img/user/space/9f6bc79d769342f1b90ed0b532b870f2/91fdf1dea6e942578cb25ca336547aa2.jpg'),('4ece06b76d3f42718722e37a92b44d0c','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/68ddd98e90124766a2847a338fe8c1d9.jpg'),('4fb2d3accff24ba4a9dec5d2a38e5b25','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/4bcc8080c171406c846d5fecbbf4ca7b.jpg'),('716e780e379142a5812587a4ba11387e','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/bc7d6b41762f43c89138dde1afedcf17.jpg'),('7bc2d9bfafc744c8a6ecabfb7c6e9ce2','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/59656c7010a24bcbb98074b9eb044b2c.jpg'),('7ea010df01dd4e88847daf5c3e3a5002','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/159bbb9842d549b4b7fceefad2921cfb.jpg'),('cb4e6691e9dc46b980576492cc5567d3','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/68d122f29bb6467e8e3185998dc102c5.jpg'),('ee33de9884e243488d3c3c79da6ac173','10001','/upload/img/user/space/9f6bc79d769342f1b90ed0b532b870f2/4e836a28073343bc80a15ee1a3b0af0d.jpg'),('eedad265f3624c0eb2c6f9ac890989aa','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/c9f81702668c4a03ba920c2bdd3ec88b.jpg'),('f0c3df5bdb0a45aabf22464bb27dbb88','10001','112'),('fdce86cccb6440c2abd153e50604fa24','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/ac77e073ed7546fe8767e91535de0115.jpg');
/*!40000 ALTER TABLE `image_space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface_info`
--

DROP TABLE IF EXISTS `interface_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface_info` (
  `info_id` varchar(35) NOT NULL,
  `info_name` varchar(20) NOT NULL,
  `info_path` varchar(255) NOT NULL,
  `info_method` varchar(10) NOT NULL,
  `into_format` varchar(10) NOT NULL,
  `info_remark` text,
  `request_example` text,
  `response_example` text,
  `type_id` varchar(35) NOT NULL,
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface_info`
--

LOCK TABLES `interface_info` WRITE;
/*!40000 ALTER TABLE `interface_info` DISABLE KEYS */;
INSERT INTO `interface_info` VALUES ('000186dbcd4b436081cefc9fd13f8846','获取部门列表','/s/listTeamDepartment.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"711719920ab841638cb9814bb28671bc\"}','{\"result\":[{\"count\":2,\"teamDepartmentId\":\"4bc0ec2d68a444e7a584b9f8d03cbc44\",\"teamDepartmentName\":\"后勤部\"},{\"count\":2,\"teamDepartmentId\":\"5a20e0ea32b948c08c928995b26af64e\",\"teamDepartmentName\":\"业务部\"},{\"count\":1,\"teamDepartmentId\":\"9e8d946ef94b4795bd9218795354e631\",\"teamDepartmentName\":\"总经办\"},{\"count\":2,\"teamDepartmentId\":\"dc89587b44ff4652b44f81da12589175\",\"teamDepartmentName\":\"财务部\"}],\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','2aa8bd982bef40469246fbb09f74d916'),('015b1e3ea6a24a65ba6bfbb9284d8f30','获取图片','/s/getCustomerIDCard.action','GET','JSON','','','','398da1cd89974535809862c823150653'),('04c7a9e0777849c784e8a3416a8ca9ed','搜索商品','/s/findGoodsListByKeyword.action','POST','JSON','','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"goodsName\":\"哼哼\",\"pageNum\":\"1\",\"token\":\"1\"}','{\"result\":[{\"goodsId\":\"bae0a50f935248cfa03a0e0cbffd2dda\",\"goodsTypeName\":\"兽药大礼包\",\"standardList\":[{\"standardName\":\"100g/袋\",\"standardId\":\"8e6aabae569e44ca80db3115372aa1a4\",\"standardPrice\":20.0,\"standardCount\":128}],\"goodsCode\":\"S119\",\"goodsName\":\"【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋\",\"createDate\":1507824000000,\"imgList\":[]}],\"pageCount\":1,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e2d7ca9f1bd144119c40cc5d29d3a846'),('075fb5c1a2144104bebd861d06238210','获取库存审批列表','/s/listRepertoryApply.action','POST','JSON','开始时间 和 结束时间 必须同时填或同时不填		\n\n申请状态(applyStatus)		\n待审核		10\n已通过(已发货)		11\n已签收		12','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"finishDate\":\"2017-12-12\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"pageNum\":\"1\",\"token\":\"2ae7592cff0249e59c2bdcb173c9091f\",\"createDate\":\"2017-1-1\"}','{\"result\":[{\"branchId\":\"0f3965187f1d4bbf963453b7a2ae0b20\",\"myTeamId\":\"10001\",\"approverId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"applyList\":[{\"applyId\":\"8097616c247b4cc2b0b3862f627e7445\",\"standardName\":\"10kg/袋\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"currentCount\":3000,\"standardId\":\"4e3007c4db5d483bb9245743fa5c08eb\",\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"goodsType\":\"中猪料\",\"standardCount\":200},{\"applyId\":\"8097616c247b4cc2b0b3862f627e7445\",\"standardName\":\"20kg/袋\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"currentCount\":3000,\"standardId\":\"e0841a5ee98a410c9f1fe4a786a6d6f0\",\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"goodsType\":\"中猪料\",\"standardCount\":300}],\"branchName\":\"鹤山销售点\",\"proposerId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"approverName\":\"王舞欣\",\"applyId\":\"8097616c247b4cc2b0b3862f627e7445\",\"proposerName\":\"李思思\",\"applyRemark\":\"备注\",\"applyCode\":\"\",\"applyStatus\":12,\"createDate\":1507707330000},{\"acceptDate\":1507712579000,\"branchId\":\"0f3965187f1d4bbf963453b7a2ae0b20\",\"myTeamId\":\"10001\",\"approverId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"applyList\":[{\"applyId\":\"9e1d7ab46f3c41a382413059ab615f4f\",\"standardName\":\"10kg/袋\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"currentCount\":3000,\"standardId\":\"4e3007c4db5d483bb9245743fa5c08eb\",\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"goodsType\":\"中猪料\",\"standardCount\":200},{\"applyId\":\"9e1d7ab46f3c41a382413059ab615f4f\",\"standardName\":\"20kg/袋\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"currentCount\":3000,\"standardId\":\"e0841a5ee98a410c9f1fe4a786a6d6f0\",\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"goodsType\":\"中猪料\",\"standardCount\":300}],\"branchName\":\"鹤山销售点\",\"proposerId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"approverName\":\"王舞欣\",\"applyId\":\"9e1d7ab46f3c41a382413059ab615f4f\",\"proposerName\":\"李思思\",\"applyRemark\":\"备注\",\"applyCode\":\"\",\"applyStatus\":12,\"createDate\":1507712566000},{\"branchId\":\"0f3965187f1d4bbf963453b7a2ae0b20\",\"myTeamId\":\"10001\",\"approverId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"applyList\":[{\"applyId\":\"dac29c84ff574042add0305a2ce1e1ef\",\"standardName\":\"100g/袋\",\"goodsId\":\"bae0a50f935248cfa03a0e0cbffd2dda\",\"currentCount\":256,\"standardId\":\"8e6aabae569e44ca80db3115372aa1a4\",\"goodsImage\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/f4845d04353643989e87cb129e01670d.jpg\",\"goodsCode\":\"S119\",\"goodsName\":\"【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋\",\"goodsType\":\"兽药大礼包\",\"standardCount\":10}],\"branchName\":\"鹤山销售点\",\"proposerId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"approverName\":\"王舞欣\",\"applyId\":\"dac29c84ff574042add0305a2ce1e1ef\",\"proposerName\":\"李思思\",\"applyRemark\":\"备注\",\"applyCode\":\"201710135952\",\"applyStatus\":10,\"createDate\":1507881862000}],\"pageCount\":1,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','3a9bb3d99734486ba7fe0ab5330eb869'),('09e37c8416f748f4b2d7fae1f8e670bd','更新跟进信息','/s/updateCustomerFollow.action','POST','JSON','','{\"followId\":\"4231e8124e9247139d095044b5f83a08\",\"myTeamId\":\"10001\",\"followResult\":\"followResult\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"07ea6ac606564b4a8ef51e755f25b11c\"}','{\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','2ac5d668d40a45178887cb7bb9bbb286'),('0ad7296452c443cea329dfca7ff04fc0','添加销售点','/s/addBranch.action','POST','JSON','','{\"departmentName\":\"财务部\",\"branchArea\":\"江门\",\"myTeamId\":\"10001\",\"managerPhone\":\"13511113333\",\"departmentId\":\"dc89587b44ff4652b44f81da12589175\",\"branchName\":\"江门销售点\",\"managerId\":\"528832fa9cc54d0290f6ee2922b27256\",\"managerName\":\"赵柳燕\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"latLng\":\"100,01\",\"token\":\"10001\"}','{\"result\":\"0ecfc2fe4ede4800bbb4087231720db2\",\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','c6a2b85d8be242c194af42841387059a'),('1021029f149a4a5aa80cdd61f3d06dd8','拒绝申请','/s/updateCommonApplyRefuse.action','POST','JSON','申请状态		\n等待审批		10\n申请成功		11\n申请失败		12\n\n审批状态		\n等待审核		20\n审核通过		21\n审核不通过		22','{\"applyId\":\"223b5684a88c4875a69291f38a3e3fa1\",\"myTeamId\":\"10001\",\"approveSequence\":\"2\",\"approveAdvice\":\"建议\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"1\"}','{\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e4bd837de42f4c3fac48be13d6ad0b40'),('10ee376f64a7404d8f24c453401dc335','上传手持身份证照','/insertCardHand.action','POST','JSON','','','{\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\",\"result\":\"/WEB-INF/upload/img/id_card/f463f02d0fb346939a5d61921c0ae03e.jpg\"}','d68ae3cef71d47a8aa4ed8cf50724239'),('1219aa8936b24bd7ae26bdefc1b5165c','删除养殖信息','/s/removeUserBreed.action','POST','JSON','','{\"myTeamId\":\"10001\",\"breedId\":\"1e4787a807fe4946820f143c4b2a25d9\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"471a84a618844ed28e60d9dd66e6ac25\"}','{\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','2cc520f7d1f348a485bb59e12aa6aefb'),('13a33a322fe844a7bcd481664b367f1c','获取跟进详情','/s/getVisitCustomerFollow.action','POST','JSON','','{\"followId\":\"4231e8124e9247139d095044b5f83a08\",\"myTeamId\":\"10001\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"9cdf4462f3774d7381ff48254d6a8bba\"}','{\"result\":{\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"customerName\":\"alisa\",\"followContent\":\"忘记去了\",\"followDate\":1513008000000,\"followId\":\"4231e8124e9247139d095044b5f83a08\",\"followResult\":\"followResult\",\"followTitle\":\"跟进测试\",\"promoterId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"promoterName\":\"张三\"},\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','773bf9c8af0c4721b5e444fe21abcda1'),('163325edc6ab4e32afb3b189bdfe68d2','获取养殖信息列表','/s/listVisitUserBreed.action','POST','JSON','','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userPlaceId\":\"daab4edac0fa48d5b62f6c241f5dd590\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"pageNum\":\"1\",\"token\":\"7b54224694fb4afaba7eccdee8e8522f\"}','{\"result\":[{\"breedCategory\":\"\",\"breedId\":\"b58ea1b0a12e47fc8f8fb03b8e878e9a\",\"emptyShedNum\":0,\"obstetricTableNum\":0,\"breedVariety\":\"\",\"competitiveBrand\":\"\",\"shedNum\":0,\"breedScale\":0,\"femaleNum\":0,\"maleNum\":0,\"json\":\"{\\\"母体数量\\\":\\\"45\\\",\\\"养殖类目\\\":\\\"猪\\\",\\\"养殖类型\\\":\\\"商品养殖\\\",\\\"养殖品种\\\":\\\"内三元\\\",\\\"公体数量\\\":\\\"12\\\"}\",\"breedAge\":0,\"userPlaceId\":\"daab4edac0fa48d5b62f6c241f5dd590\",\"livestockNum\":0,\"breedType\":\"\",\"createDate\":1508491001000}],\"pageCount\":1,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','773bf9c8af0c4721b5e444fe21abcda1'),('18c4a390109e474997512cfd5531901f','获取商品列表','/s/findGoodsList.action','POST','JSON','','{\"myTeamId\":\"10001\",\"pageSize\":\"1\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"pageNum\":\"1\",\"token\":\"1\"}','{\"result\":[{\"goodsId\":\"bae0a50f935248cfa03a0e0cbffd2dda\",\"goodsTypeName\":\"兽药大礼包\",\"standardList\":[{\"standardName\":\"100g/袋\",\"standardId\":\"8e6aabae569e44ca80db3115372aa1a4\",\"standardPrice\":20.0,\"standardCount\":128}],\"goodsCode\":\"S119\",\"goodsName\":\"【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋\",\"createDate\":1507824000000,\"imgList\":[]}],\"pageCount\":2,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e2d7ca9f1bd144119c40cc5d29d3a846'),('199830f70dcc47c2946b69656a3ca65d','获取跟进详情','/s/getCustomerFollow.action','POST','JSON','','{\"followId\":\"4231e8124e9247139d095044b5f83a08\",\"myTeamId\":\"10001\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"dae3c7c1bd594d91ba451106fa944f61\"}','{\"result\":{\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"customerName\":\"alisa\",\"followContent\":\"忘记去了\",\"followDate\":1513008000000,\"followId\":\"4231e8124e9247139d095044b5f83a08\",\"followResult\":\"followResult\",\"followTitle\":\"跟进测试\",\"promoterId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"promoterName\":\"张三\"},\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','2ac5d668d40a45178887cb7bb9bbb286'),('1b59b7d653454aedac39344693f7a027','查看商品详情','/user_findGoodsDetail.action','POST','JSON','','{\"myTeamId\":\"10001\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"token\":\"a35b18334b5f45dbb99493502b035475\"}','{\"result\":{\"detailImages\":[\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/f4845d04353643989e87cb129e01670d.jpg\"],\"goodsAttr\":\"新希望六和\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"goodsImages\":[\"112\"],\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"goodsSales\":0,\"standards\":[{\"standardCount\":3000,\"standardId\":\"4e3007c4db5d483bb9245743fa5c08eb\",\"standardName\":\"10kg/袋\",\"standardPrice\":20.0,\"standardWeight\":10.0},{\"standardCount\":3000,\"standardId\":\"e0841a5ee98a410c9f1fe4a786a6d6f0\",\"standardName\":\"20kg/袋\",\"standardPrice\":35.0,\"standardWeight\":20.0}]},\"state\":1,\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\"}','6d186aa139c74f7185eb0b132905dee8'),('1b85812f0be9490a84657a03500b4008','更新指定收货地址','/user_updateMyAddress.action','POST','JSON','','{\"userAddress\":\"29.03,12.53\",\"myTeamId\":\"10001\",\"userAddressId\":\"5bf6cb4001e14998ad2e6e6a41dc97f5\",\"userPhone\":\"13688885522\",\"userAddressDefault\":\"0\",\"userName\":\"10001\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"userArea\":\"鹤山市文化路华美洗车\",\"token\":\"11f247c1f78a41489ba930d5ce91a77d\"}','{\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\",\"result\":null}','05a6b344fa244892856d6113fafa824f'),('1dd677ec548443b08eb3d5611f17a3ae','获取申请详情','/s/getCustomerAssist.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"0420cb22c06b43a488c39967779eecec\",\"assistId\":\"ec763147d35c4ab285fbcba67ca57a30\",\"token\":\"439c4174f1bc48be978e15218033469e\"}','{\"result\":{\"assistId\":\"ec763147d35c4ab285fbcba67ca57a30\",\"assistReason\":\"10001\",\"assistTitle\":\"10001\",\"createDate\":1508408427000,\"customerList\":[{\"assistId\":\"ec763147d35c4ab285fbcba67ca57a30\",\"customerId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"customerName\":\"alisa\"}],\"imageList\":[{\"assistId\":\"ec763147d35c4ab285fbcba67ca57a30\",\"imageId\":\"85bec1897c8e4abcb7faed0e1e3c88d9\",\"imagePath\":\"/upload/img/user/assist/9f6bc79d769342f1b90ed0b532b870f2/85bec1897c8e4abcb7faed0e1e3c88d9.jpg\"}],\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"userList\":[{\"assistId\":\"ec763147d35c4ab285fbcba67ca57a30\",\"assistResult\":\"122130\",\"departmentName\":\"departmentName\",\"userId\":\"0420cb22c06b43a488c39967779eecec\",\"userName\":\"王五\"}],\"userName\":\"张三\"},\"state\":1,\"token\":\"619a3ebdb0c941958dfade8850c0600f1507604189530\"}','86ff4b4396514203bab501fc6e7ae067'),('21341a8e99bc4a17b3f9acbd6769170a','获取库存盘点记录详情','/s/getRepertoryRecord.action','POST','JSON','','{\"recordId\":\"8cc618af34f24beaa2bcfd28a1862460\",\"myTeamId\":\"10001\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"1\"}','{\"result\":{\"branchId\":\"9e8d946ef94b4795bd9218795354e631\",\"branchName\":\"总经办\",\"createDate\":1507686659000,\"myTeamId\":\"10001\",\"operatorId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"operatorName\":\"张三\",\"recordCode\":\"201710119708\",\"recordId\":\"8cc618af34f24beaa2bcfd28a1862460\",\"recordList\":[{\"currentCount\":3000,\"goodsCode\":\"D110\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"goodsImage\":\"112\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"goodsType\":\"中猪料\",\"recordId\":\"8cc618af34f24beaa2bcfd28a1862460\",\"recordReason\":\"正常处理\",\"recordType\":1,\"standardCount\":1000,\"standardId\":\"4e3007c4db5d483bb9245743fa5c08eb\",\"standardName\":\"10kg/袋\"},{\"currentCount\":3000,\"goodsCode\":\"D110\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"goodsImage\":\"112\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"goodsType\":\"中猪料\",\"recordId\":\"8cc618af34f24beaa2bcfd28a1862460\",\"recordReason\":\"正常处理\",\"recordType\":1,\"standardCount\":2000,\"standardId\":\"e0841a5ee98a410c9f1fe4a786a6d6f0\",\"standardName\":\"20kg/袋\"}],\"recordRemark\":\"\"},\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','1bef32e052414c69a3deeddecf49d806'),('22e156f92d97482b8be66da2d13a52c4','添加养殖信息（新）','/s/saveUserBreedJson.action','POST','JSON','养殖信息\n将类目名称作为 key，选项名称作为 value 以及信息名称作为 key，客户的填入内容作为 value 拼接成一个 json 串','{\"myTeamId\":\"10001\",\"json\":\"{\\\"母体数量\\\":\\\"45\\\",\\\"养殖类目\\\":\\\"猪\\\",\\\"养殖类型\\\":\\\"商品养殖\\\",\\\"养殖品种\\\":\\\"内三元\\\",\\\"公体数量\\\":\\\"12\\\"}\",\"userPlaceId\":\"b76ddc7446fa4e108ecaacc4a1d16bc7\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"86baee74e3bb4816baffc0a1ae1d34cb\"}','{\"result\":\"1e4787a807fe4946820f143c4b2a25d9\",\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','2902131e007c427a85387dc11cf15898'),('23e911701b1a49b58abf7b099e154c9c','添加协助申请','/s/saveCustomerAssist.action','POST','JSON','如果在上传图片的时候传过申请的Id,这里就不需要再次上传图片Id','{\"assistTitle\":\"10001\",\"image\":\"[{\\\"imageId\\\":\\\"85bec1897c8e4abcb7faed0e1e3c88d9\\\"}]\",\"myTeamId\":\"10001\",\"assistReason\":\"10001\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"user\":\"[{\\\"departmentName\\\":\\\"departmentName\\\",\\\"userName\\\":\\\"王五\\\",\\\"userId\\\":\\\"0420cb22c06b43a488c39967779eecec\\\"}]\",\"token\":\"c260f7f823514a84ae5fc3f62caacd1f\",\"customer\":\"[{\\\"customerId\\\":\\\"94a397ea0eae4632994108c02fe3b762\\\",\\\"customerName\\\":\\\"alisa\\\"}]\"}','{\"result\":\"ec763147d35c4ab285fbcba67ca57a30\",\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','86ff4b4396514203bab501fc6e7ae067'),('2610368ff96746fab6be2bb481eecdea','查看当前销售点库存','/s/getRepertory.action','POST','JSON','','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"pageNum\":\"1\",\"token\":\"c7b76365251647cf8588065c5e1edf2f\"}','{\"result\":[{\"goodsId\":\"bae0a50f935248cfa03a0e0cbffd2dda\",\"goodsCreateDate\":1507824000000,\"goodsType\":\"兽药大礼包\",\"standards\":[{\"standardName\":\"100g/袋\",\"standardId\":\"8e6aabae569e44ca80db3115372aa1a4\",\"standardPrice\":20.0,\"standardCount\":256}],\"goodsImage\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/f4845d04353643989e87cb129e01670d.jpg\",\"goodsCode\":\"S119\",\"goodsName\":\"【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋\"},{\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"goodsCreateDate\":1507564800000,\"goodsType\":\"中猪料\",\"standards\":[{\"standardName\":\"10kg/袋\",\"standardId\":\"4e3007c4db5d483bb9245743fa5c08eb\",\"standardPrice\":20.0,\"standardCount\":3000},{\"standardName\":\"20kg/袋\",\"standardId\":\"e0841a5ee98a410c9f1fe4a786a6d6f0\",\"standardPrice\":35.0,\"standardCount\":3000}],\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\"}],\"branchId\":\"0f8ad87fcb564f358d287c39749362d4\",\"pageCount\":1,\"branchName\":\"总经办\",\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','7337e6e76a644066854e16b2c329cfdf'),('28a007602c4d47648d599485b7adcb5f','获取商品描述','/s/findGoodsDescribe.action','POST','JSON','','{\"goodsDescribe\":\"4fb2d3accff24ba4a9dec5d2a38e5b25|7bc2d9bfafc744c8a6ecabfb7c6e9ce2|7ea010df01dd4e88847daf5c3e3a5002|cb4e6691e9dc46b980576492cc5567d3|eedad265f3624c0eb2c6f9ac890989aa|\",\"myTeamId\":\"10001\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"1\"}','{\"result\":[{\"goodsImgType\":0,\"imageId\":\"4fb2d3accff24ba4a9dec5d2a38e5b25\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/4bcc8080c171406c846d5fecbbf4ca7b.jpg\"},{\"goodsImgType\":0,\"imageId\":\"7bc2d9bfafc744c8a6ecabfb7c6e9ce2\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/59656c7010a24bcbb98074b9eb044b2c.jpg\"},{\"goodsImgType\":0,\"imageId\":\"7ea010df01dd4e88847daf5c3e3a5002\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/159bbb9842d549b4b7fceefad2921cfb.jpg\"},{\"goodsImgType\":0,\"imageId\":\"cb4e6691e9dc46b980576492cc5567d3\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/68d122f29bb6467e8e3185998dc102c5.jpg\"},{\"goodsImgType\":0,\"imageId\":\"eedad265f3624c0eb2c6f9ac890989aa\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/c9f81702668c4a03ba920c2bdd3ec88b.jpg\"}],\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e2d7ca9f1bd144119c40cc5d29d3a846'),('2b3f3d20172c4eb78d11d5859fbc1f1b','查找商品类目','/s/findGoodsTypeByPid.action','POST','JSON','第一次获取[goodsTypePid]传0，后续获取将上次获取到的[goodsTypeId]作为[goodsTypePid]的参数','{\"myTeamId\":\"10001\",\"goodsTypePid\":\"0\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"1\"}','{\"result\":[{\"goodsTypeId\":\"2267430251874ea69ea82834c558977a\",\"goodsTypeName\":\"饲料\",\"goodsTypePid\":\"0\"},{\"goodsTypeId\":\"286f09ac9e744088ad7ae9dbf8b5c70e\",\"goodsTypeName\":\"药品\",\"goodsTypePid\":\"0\"},{\"goodsTypeId\":\"583fdc38ee8c4b5aa6be0b9497da9594\",\"goodsTypeName\":\"设备\",\"goodsTypePid\":\"0\"},{\"goodsTypeId\":\"c3428a9f163f462a86fc93fc0ab02317\",\"goodsTypeName\":\"种苗\",\"goodsTypePid\":\"0\"}],\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e2d7ca9f1bd144119c40cc5d29d3a846'),('2c54c4e68d0844b48b12f78af93783dc','修改场地','/s/updateUserPlace.action','POST','JSON','[所属证明]和[场地环境]，提交的是图片的Id，用逗号\",\"分隔，如果在上传图片的时候已经提交了场地Id，就不需要再提交[所属证明]和[场地环境]\n\n场地类型有：\n\"allow\"(可养区)\n\"forbid\"(禁养区)\n\"restrict\"(限养区)\n\"no\"(无限定)','{\"myTeamId\":\"10001\",\"certificate\":\"11eddd677e8e414492e94011449fb4df\",\"userPlaceId\":\"582c2eecfffc42ac939ad146247c0f3f\",\"userAlreadyUse\":\"12\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"ed4fd20b17c449d8b2a0e806c21c67a4\"}','{\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e8d1b8996f89483589013a0669deca7a'),('2c9a1b2c5e234a39b6363cf88ef3701b','添加农户','/s/saveFarmer.action','POST','JSON','','{\"myTeamId\":\"10001\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"farmerPhone\":\"11912011211\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"farmerName\":\"山姆大叔\",\"token\":\"f8ec75a6210b4e649546c4dba8c1a38b\"}','{\"result\":\"0792f791ab85422d8dc1bc92494bb877\",\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','7f3efac49cba4219a4e3c7ba93263a47'),('2cae0fb22c5e41c6abdc600662224dbb','同意申请','/s/updateCommonApplyAccept.action','POST','JSON','','{\"applyId\":\"2292f55d924049dfb35261807c94a53f\",\"myTeamId\":\"10001\",\"approveSequence\":\"1\",\"approveAdvice\":\"意见\",\"userId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"token\":\"1\"}','{\"state\":1,\"token\":\"afc5f8d65cf440a1b58a5f2295361fa01507604201402\"}','e4bd837de42f4c3fac48be13d6ad0b40'),('2d9196ddb2024b9581bfcb510fb2cce5','获取养殖信息详情','/s/getVisitUserBreed.action','POST','JSON','','{\"myTeamId\":\"10001\",\"breedId\":\"b58ea1b0a12e47fc8f8fb03b8e878e9a\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"960f9f2a2f554c4ba9cc98a90019964e\"}','{\"result\":{\"breedAge\":0,\"breedCategory\":\"\",\"breedId\":\"b58ea1b0a12e47fc8f8fb03b8e878e9a\",\"breedScale\":0,\"breedType\":\"\",\"breedVariety\":\"\",\"competitiveBrand\":\"\",\"createDate\":1508491001000,\"emptyShedNum\":0,\"femaleNum\":0,\"json\":\"{\\\"母体数量\\\":\\\"45\\\",\\\"养殖类目\\\":\\\"猪\\\",\\\"养殖类型\\\":\\\"商品养殖\\\",\\\"养殖品种\\\":\\\"内三元\\\",\\\"公体数量\\\":\\\"12\\\"}\",\"livestockNum\":0,\"maleNum\":0,\"obstetricTableNum\":0,\"shedNum\":0,\"userPlaceId\":\"daab4edac0fa48d5b62f6c241f5dd590\"},\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','773bf9c8af0c4721b5e444fe21abcda1'),('2dd479f0086942689837f2ca54852d34','获取农户列表','/s/listVisitFarmer.action','POST','JSON','','{\"myTeamId\":\"10001\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"pageSize\":\"10\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"pageNum\":\"1\",\"token\":\"336a65dd335c4be29728692ba74b40aa\"}','{\"result\":[{\"farmerId\":\"15b6e9a5106f4bdfadb40a5db75ef4dd\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"farmerPhone\":\"11912011211\",\"farmerName\":\"山姆大叔\"}],\"pageCount\":1,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','773bf9c8af0c4721b5e444fe21abcda1'),('322ff7ff769c41f6b1ab5e5d9c74570d','获取购物车商品列表','/user_listGoodsFromCart.action','POST','JSON','','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"pageNum\":\"1\",\"token\":\"73a083045ca244668ca1011de6e903b1\"}','{\"result\":[{\"goodsImg\":\"112\",\"standardName\":\"10kg/袋\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"standardId\":\"4e3007c4db5d483bb9245743fa5c08eb\",\"standardPrice\":\"20\",\"standardWeight\":10,\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"goodsNum\":\"10\",\"standardCount\":100}],\"pageCount\":1,\"state\":1,\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\"}','c652ad76506748a7b0be357066aac0e5'),('3315be9003d7486db2ee1d4761a4455b','获取默认收货地址','/user_findMyDefaultAddress.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"ceb75014208f423588eb68981a18e179\"}','{\"result\":{\"userAddress\":\"29.03,12.53\",\"userAddressDefault\":1,\"userAddressId\":\"5bf6cb4001e14998ad2e6e6a41dc97f5\",\"userArea\":\"鹤山市文化路华美洗车\",\"userName\":\"10001\",\"userPhone\":\"13688885522\"},\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','05a6b344fa244892856d6113fafa824f'),('333e55a21b3b4976aad5879915f3d517','审批人获取申请列表','/s/listCommonApplyByApprove.action','POST','JSON','申请状态		\n等待审批		10\n申请成功		11\n申请失败		12\n\n审批状态		\n等待审核		20\n审核通过		21\n审核不通过		22','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"pageNum\":\"1\",\"token\":\"1\"}','{\"result\":[{\"endDate\":1504108800000,\"applyReason\":\"1\",\"approveList\":[{\"approveResult\":21,\"approveSequence\":1,\"approveName\":\"王舞欣\"},{\"approveResult\":20,\"approveSequence\":2,\"approveName\":\"李思思\"}],\"proposerId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"applyId\":\"2292f55d924049dfb35261807c94a53f\",\"beginDate\":1504022400000,\"proposerName\":\"张三\",\"applyResult\":10,\"imageList\":[{\"imagePath\":\"/upload/img/user/apply/9f6bc79d769342f1b90ed0b532b870f2\\\\c4960e06401f47d1849a20e9aa4fd868.jpg\"}],\"applyTitle\":\"1\",\"createDate\":1508720611000}],\"pageCount\":1,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e4bd837de42f4c3fac48be13d6ad0b40'),('348ef14fc589415ea03f07ea1f9deec5','获取库存审批详情','/s/getRepertoryApply.action','POST','JSON','申请状态(applyStatus)		\n待审核		10\n已通过(已发货)		11\n已签收		12','{\"applyId\":\"dac29c84ff574042add0305a2ce1e1ef\",\"myTeamId\":\"10001\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"b70426d06d774f28b8fa384b3b10d5bb\"}','{\"result\":{\"applyCode\":\"201710135952\",\"applyId\":\"dac29c84ff574042add0305a2ce1e1ef\",\"applyList\":[{\"applyId\":\"dac29c84ff574042add0305a2ce1e1ef\",\"currentCount\":256,\"goodsCode\":\"S119\",\"goodsId\":\"bae0a50f935248cfa03a0e0cbffd2dda\",\"goodsImage\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/f4845d04353643989e87cb129e01670d.jpg\",\"goodsName\":\"【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋\",\"goodsType\":\"兽药大礼包\",\"standardCount\":10,\"standardId\":\"8e6aabae569e44ca80db3115372aa1a4\",\"standardName\":\"100g/袋\"}],\"applyRemark\":\"备注\",\"applyStatus\":10,\"approverId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"approverName\":\"王舞欣\",\"branchId\":\"0f3965187f1d4bbf963453b7a2ae0b20\",\"branchName\":\"鹤山销售点\",\"createDate\":1507881862000,\"myTeamId\":\"10001\",\"proposerId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"proposerName\":\"李思思\"},\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','3a9bb3d99734486ba7fe0ab5330eb869'),('365177c2935b4857aa6e39362cfb3694','获取场地列表','/s/listUserPlace.action','POST','JSON','场地类型有：\n\"allow\"(可养区)\n\"forbid\"(禁养区)\n\"restrict\"(限养区)\n\"no\"(无限定)','{\"myTeamId\":\"10001\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"pageSize\":\"10\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"pageNum\":\"1\",\"token\":\"6ce8d1e9bc104d72ab3f1700b54cc94c\"}','{\"result\":[{\"userPlaceAcreage\":142,\"userOwnerNum\":0,\"userPlaceArea\":\"鹤山\",\"userPlaceType\":\"\",\"userEmployeeNum\":0,\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"environmentList\":[],\"userPlaceId\":\"582c2eecfffc42ac939ad146247c0f3f\",\"userAlreadyUse\":0,\"certificateList\":[]}],\"pageCount\":1,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e8d1b8996f89483589013a0669deca7a'),('37c6ab15d18643379e3a3685dcb37a2b','删除农户','/s/removeFarmer.action','POST','JSON','','{\"myTeamId\":\"10001\",\"farmerId\":\"0792f791ab85422d8dc1bc92494bb877\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"cdf3fd51aab84f68a9d84b7433ff3948\"}','{\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','7f3efac49cba4219a4e3c7ba93263a47'),('38807a822f1b4759b35ab82093ce99e3','获取图片空间图片','/s/findImages.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"1\"}','{\"result\":[{\"imageId\":\"35aa7507390f4ead9d64dc55cc2aa768\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/f4845d04353643989e87cb129e01670d.jpg\"},{\"imageId\":\"4ece06b76d3f42718722e37a92b44d0c\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/68ddd98e90124766a2847a338fe8c1d9.jpg\"},{\"imageId\":\"4fb2d3accff24ba4a9dec5d2a38e5b25\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/4bcc8080c171406c846d5fecbbf4ca7b.jpg\"},{\"imageId\":\"716e780e379142a5812587a4ba11387e\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/bc7d6b41762f43c89138dde1afedcf17.jpg\"},{\"imageId\":\"7bc2d9bfafc744c8a6ecabfb7c6e9ce2\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/59656c7010a24bcbb98074b9eb044b2c.jpg\"},{\"imageId\":\"7ea010df01dd4e88847daf5c3e3a5002\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/159bbb9842d549b4b7fceefad2921cfb.jpg\"},{\"imageId\":\"cb4e6691e9dc46b980576492cc5567d3\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/68d122f29bb6467e8e3185998dc102c5.jpg\"},{\"imageId\":\"eedad265f3624c0eb2c6f9ac890989aa\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/c9f81702668c4a03ba920c2bdd3ec88b.jpg\"},{\"imageId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"imagePath\":\"112\"},{\"imageId\":\"fdce86cccb6440c2abd153e50604fa24\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/ac77e073ed7546fe8767e91535de0115.jpg\"}],\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e2d7ca9f1bd144119c40cc5d29d3a846'),('3919f61cc5bb4d459c52b0c98bc216da','获取客户详情','/s/getVisitCustomer.action','POST','JSON','','{\"myTeamId\":\"10001\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"1a4e8e5bba28497ca02a1f95a153c867\"}','{\"result\":{\"businessAddress\":\"\",\"creditRating\":0,\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"customerType\":\"personal\",\"hadAccount\":1,\"station\":\"\",\"updateCount\":7,\"userAddress\":\"鹤山市\",\"userCardBack\":\"/WEB-INF/upload/img/id_card/d88e28c3a0e6429f9f1d03ad99fabc61/d2853b0c5a6a4dbcb0eceb0a4c2febba.jpg\",\"userCardFront\":\"/WEB-INF/upload/img/id_card/d88e28c3a0e6429f9f1d03ad99fabc61/2ad8e7e9db1048d9993ae44061027219.jpg\",\"userCardHand\":\"/WEB-INF/upload/img/id_card/d88e28c3a0e6429f9f1d03ad99fabc61/07308795030843e88749b0a31932a543.jpg\",\"userCreateDate\":1508316332000,\"userImg\":\"\",\"userName\":\"alisa\",\"userPhone\":\"13598765678\",\"userSex\":\"女\",\"userUpdateTime\":1508384628000},\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','773bf9c8af0c4721b5e444fe21abcda1'),('4009414df88f4c60a0f3854838c9e619','获取客户列表','/s/listCustomer.action','POST','JSON','','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"pageNum\":\"1\",\"token\":\"f7455770afab406287e1bd8c1fec7b4d\"}','{\"result\":[{\"userImg\":\"\",\"userPhone\":\"13598765678\",\"customerType\":\"personal\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"station\":\"\",\"businessAddress\":\"\",\"creditRating\":0,\"userBirthday\":\"\",\"userSex\":\"男\",\"hadAccount\":0,\"userName\":\"jackson\",\"userId\":\"0bb4b24df33948cfb68e61c1d5c1c75d\",\"userAddress\":\"鹤山市\"}],\"pageCount\":1,\"state\":1,\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\"}','398da1cd89974535809862c823150653'),('45c1282d58b248df8cba4ba393513e74','获取订单凭证列表','/user_listOrderProof.action','POST','JSON','','{\"myTeamId\":\"10001\",\"orderId\":\"580e6b11712d481ba38b307bf47b6966\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"1\"}','{\"result\":[{\"orderId\":\"580e6b11712d481ba38b307bf47b6966\",\"proofId\":\"9f2a3f850d17408fa82884678e13bb12\",\"proofUrl\":\"/upload/img/user/order_proof/9f6bc79d769342f1b90ed0b532b870f2/359bb432377840cd9556b17bbe4724ef.jpg\"}],\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','2cc520f7d1f348a485bb59e12aa6aefb'),('45f3e927c45b4447b74d59a728e807b5','头像上传','/user_uploadHeadPortrait.action','POST','JSON','','','{\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\",\"result\":\"/upload/img/user/head_portrait/89d9317fb3834353bcf2a507bee2eb82/68aa7ff3ac194975ba610998d27c855f.jpg\"}','05a6b344fa244892856d6113fafa824f'),('489a8428ee114557a34ab2cbb8be70a2','获取农户列表','/s/listFarmer.action','POST','JSON','','{\"myTeamId\":\"10001\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"pageSize\":\"10\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"pageNum\":\"1\",\"token\":\"5a26d6070f0c4a9f9a2652eb88a640d9\"}','{\"result\":[{\"farmerId\":\"0792f791ab85422d8dc1bc92494bb877\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"farmerPhone\":\"11912011211\",\"farmerName\":\"山姆大叔\"}],\"pageCount\":1,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','7f3efac49cba4219a4e3c7ba93263a47'),('48fc8855932644dcbf3ecd642b1c12f3','获取审批人列表','/s/listRepertoryChecker.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"token\":\"1adf64a61f9a42fca59a355fa5cd7a9b\"}','{\"result\":[{\"approverId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"approverName\":\"王舞欣\"}],\"state\":1,\"token\":\"afc5f8d65cf440a1b58a5f2295361fa01507604201402\"}','3a9bb3d99734486ba7fe0ab5330eb869'),('49424a82256e400d967baa2b6d8f890b','修改商品','/s/updateGoods.action','POST','JSON','','{\"goodsAttr\":\"品牌?呵呵动保|\",\"standards\":\"[{\\\"standardName\\\":\\\"80g/袋\\\",\\\"standardId\\\":\\\"9e5e7bbb97194c6a95aae84e838fba1e\\\",\\\"standardPrice\\\":\\\"900\\\",\\\"standardWeight\\\":\\\"60\\\"}]\",\"myTeamId\":\"10001\",\"goodsTypeId\":\"945ecca898284c2187ef6a5475a1363e\",\"goodsId\":\"b1d2379b6812430482d78a536441f0b2\",\"goodsCode\":\"R179\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"goodsName\":\"【呵呵动保】10%酸化阿莫西林可溶性粉 80g/袋\",\"token\":\"1\"}','{\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e2d7ca9f1bd144119c40cc5d29d3a846'),('49624057be4445559f93489bb2cccee4','获取跟进列表','/s/listVisitCustomerFollow.action','POST','JSON','','{\"myTeamId\":\"10001\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"pageSize\":\"10\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"pageNum\":\"1\",\"token\":\"1a6073a093a84dd9af6a1489a161dc0b\"}','{\"result\":[{\"followId\":\"4231e8124e9247139d095044b5f83a08\",\"followContent\":\"忘记去了\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"followResult\":\"followResult\",\"promoterName\":\"张三\",\"followDate\":1513008000000,\"followTitle\":\"跟进测试\",\"promoterId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"customerName\":\"alisa\"}],\"pageCount\":1,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','773bf9c8af0c4721b5e444fe21abcda1'),('4976dbc328224aca85aea629c44bca5d','删除运费模板','/s/removeFreightTemp.action','POST','JSON','','{\"myTeamId\":\"10001\",\"freightId\":\"394e6ec3b3e646e4ac775abe470806cc\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"1\"}','{\"result\":1,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','4a9a8d91d40f4b5bb3a37bc532a6b982'),('49a557aabb3641119a08803f8c08b8dd','拒绝客户建账','/s/updateCustomerAccountRefuse.action','POST','JSON','','{\"myTeamId\":\"320cd46e93004f12890dba46bf0d2a4d\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"30dd5dd9079b46679f00476261f59ae0\"}','{\"state\":2,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','f298278523b449a7ac84f58f6a4fdd81'),('4a4cfc3d2e9d467ea8ffc0077745238f','获取成员的客户列表','/s/listVisitCustomer.action','POST','JSON','','{\"myTeamId\":\"10001\",\"hadAccount\":\"1\",\"pageSize\":\"10\",\"promoter\":\"[{\\\"promoterId\\\":\\\"9f6bc79d769342f1b90ed0b532b870f2\\\"}]\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"pageNum\":\"1\",\"token\":\"a5ace7e471fa456cbce268eb97e7f6a0\"}','{\"result\":[{\"userImg\":\"\",\"userPhone\":\"13598765678\",\"customerType\":\"personal\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"station\":\"\",\"businessAddress\":\"\",\"creditRating\":0,\"userSex\":\"女\",\"hadAccount\":1,\"userName\":\"alisa\",\"userAddress\":\"鹤山市\"}],\"pageCount\":0,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','773bf9c8af0c4721b5e444fe21abcda1'),('4bdc5ca52ef749829ba4bf281f397be2','获取经营单位列表','/s/listManageUnit.action','POST','JSON','','{\"myTeamId\":\"10001\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"pageSize\":\"10\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"pageNum\":\"1\",\"token\":\"522a265a0f6c4a2aae1b76e28369697e\"}','{\"result\":[{\"manageType\":\"猪,鱼\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"manageId\":\"b45725e4bea3434f90720251711376b0\",\"manageName\":\"鹤山经营部\",\"manageAcreage\":0,\"manageAddress\":\"\"}],\"pageCount\":1,\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','a5d007b995274e6d808e60c9d4e22584'),('4c58f08a5f47440ea3d5c419b64bf27e','发起人获取申请列表','/s/listCommonApplyByProposer.action','POST','JSON','申请状态		\n等待审批		10\n申请成功		11\n申请失败		12\n\n审批状态		\n等待审核		20\n审核通过		21\n审核不通过		22','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"pageNum\":\"1\",\"token\":\"1\"}','{   \"result\": [     {       \"endDate\": 1504108800000,       \"applyReason\": \"1\",       \"approveList\": [         {           \"approveResult\": 20,           \"approveSequence\": 1,           \"approveName\": \"王舞欣\"         },         {           \"approveResult\": 20,           \"approveSequence\": 2,           \"approveName\": \"李思思\"         }       ],       \"proposerId\": \"89d9317fb3834353bcf2a507bee2eb82\",       \"applyId\": \"2292f55d924049dfb35261807c94a53f\",       \"beginDate\": 1504022400000,       \"proposerName\": \"张三\",       \"applyResult\": 10,       \"imageList\": [         {           \"imagePath\": \"/upload/img/user/apply/9f6bc79d769342f1b90ed0b532b870f2\\\\c4960e06401f47d1849a20e9aa4fd868.jpg\"         }       ],       \"applyTitle\": \"1\",       \"createDate\": 1508720611000     }   ],   \"pageCount\": 1,   \"state\": 1,   \"token\": \"da8990b107b84cf980035927cce112721507599537351\" }','e4bd837de42f4c3fac48be13d6ad0b40'),('4d3bd0c8d6cf4631908d3132b72c9aa0','用户登录(浏览器)','/login_on_browser.action','POST','JSON','','{\"userPassword\":\"699c167824a5f8caf7f0d0893da73e75\",\"myTeamId\":\"10001\",\"userPhone\":\"13688888888\"}','{\"result\":{\"departmentId\":\"9e8d946ef94b4795bd9218795354e631\",\"myTeamId\":\"10001\",\"myTeamName\":\"青麦科技\",\"roleId\":\"1002\",\"token\":\"da8990b107b84cf980035927cce112721507599537351\",\"userArea\":\"\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"userImg\":\"\",\"userName\":\"张三\",\"userPassword\":\"825682eafec59c2e1632828195133a52\",\"userPhone\":\"13688888888\",\"userStatus\":\"u_st_2\"},\"state\":1}','d68ae3cef71d47a8aa4ed8cf50724239'),('4d6066fba7b842d9bc821a9fa3fde1d9','查看销售点库存','/s/listBranchGoods.action','POST','JSON','','{\"branchId\":\"9c5ef58ed0034a1c8dd885369ac3b97c\",\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"pageNum\":\"1\",\"token\":\"d1c7d8c48b984442a060e101980b1a05\"}','{\"result\":[{\"goodsId\":\"bae0a50f935248cfa03a0e0cbffd2dda\",\"goodsCreateDate\":1507824000000,\"goodsType\":\"兽药大礼包\",\"standards\":[{\"standardName\":\"100g/袋\",\"standardId\":\"8e6aabae569e44ca80db3115372aa1a4\",\"standardPrice\":20.0,\"standardCount\":128}],\"goodsImage\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/f4845d04353643989e87cb129e01670d.jpg\",\"goodsCode\":\"S119\",\"goodsName\":\"【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋\"},{\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"goodsCreateDate\":1507564800000,\"goodsType\":\"中猪料\",\"standards\":[{\"standardName\":\"10kg/袋\",\"standardId\":\"4e3007c4db5d483bb9245743fa5c08eb\",\"standardPrice\":20.0,\"standardCount\":0},{\"standardName\":\"20kg/袋\",\"standardId\":\"e0841a5ee98a410c9f1fe4a786a6d6f0\",\"standardPrice\":35.0,\"standardCount\":0}],\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\"}],\"branchId\":\"9c5ef58ed0034a1c8dd885369ac3b97c\",\"pageCount\":1,\"branchName\":\"鹤山销售点\",\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','7337e6e76a644066854e16b2c329cfdf'),('4dc8445648204150a5b9cd4858657184','获取当前销售点进仓单列表','/s/listCurrentRepertoryIncome.action','POST','JSON','','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"pageNum\":\"1\",\"token\":\"1\"}','{\"result\":[{\"recordId\":\"d99e5e828ef142a39feda16a724c3119\",\"branchId\":\"0f8ad87fcb564f358d287c39749362d4\",\"myTeamId\":\"10001\",\"incomeList\":[{\"recordId\":\"d99e5e828ef142a39feda16a724c3119\",\"standardName\":\"100g/袋\",\"goodsId\":\"bae0a50f935248cfa03a0e0cbffd2dda\",\"currentCount\":502,\"standardId\":\"8e6aabae569e44ca80db3115372aa1a4\",\"goodsImage\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/f4845d04353643989e87cb129e01670d.jpg\",\"goodsCode\":\"S119\",\"goodsName\":\"【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋\",\"goodsType\":\"兽药大礼包\",\"standardCount\":256}],\"branchName\":\"总经办\",\"recordCode\":\"201710218860\",\"recordRemark\":\"\",\"operatorId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"operatorName\":\"王舞欣\",\"createDate\":1508569871000}],\"pageCount\":1,\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','9b9ab57e6150419ba468cdfc82f22477'),('5097f0bc6f10496f8783965acc53b8a5','删除场地','/s/removeUserPlace.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userPlaceId\":\"582c2eecfffc42ac939ad146247c0f3f\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"39363c14b0ea4d3db1e44f7f2f6efd54\"}','{\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e8d1b8996f89483589013a0669deca7a'),('51c95f7d95194fd884af041e23497bbe','获取进仓单详情','/s/getRepertoryIncome.action','POST','JSON','','','','9b9ab57e6150419ba468cdfc82f22477'),('53f8cb30bc1747b3a1c9800aa377117b','获取部门详情','/s/findDepartmentDetail.action','POST','JSON','','{\"myTeamId\":\"10001\",\"teamDepartmentId\":\"4bc0ec2d68a444e7a584b9f8d03cbc44\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"1f45e85d79e54ef9b282b5d84c9a2404\"}','{\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\",\"result\":{\"teamDepartmentId\":\"4bc0ec2d68a444e7a584b9f8d03cbc44\",\"teamDepartmentName\":\"后勤部\",\"departmentType\":null,\"myTeamId\":null,\"myTeamName\":\"青麦科技\",\"createDate\":\"2017-10-10 00:00:00.0\",\"count\":2,\"memberList\":null}}','2aa8bd982bef40469246fbb09f74d916'),('54b4dd7bb9004e6189725e2148944ae9','删除购物车商品','/user_removeGoodsFromCart.action','POST','JSON','','{\"myTeamId\":\"10001\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"standardId\":\"4e3007c4db5d483bb9245743fa5c08eb\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"token\":\"39b198c640b94bd6ba9802b00e8b3b23\"}','{\"state\":1,\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\"}','c652ad76506748a7b0be357066aac0e5'),('56095eba55614987bf9945dd3d69566f','添加场地','/s/saveUserPlace.action','POST','JSON','[所属证明]和[场地环境]，提交的是图片的Id，用逗号\",\"分隔，如果在上传图片的时候已经提交了场地Id，就不需要再提交[所属证明]和[场地环境]\n\no\n场地类型有：\n\"allow\"(可养区)\n\"forbid\"(禁养区)\n\"restrict\"(限养区)\n\"no\"(无限定)','{\"userPlaceAcreage\":\"142\",\"myTeamId\":\"10001\",\"userPlaceArea\":\"鹤山\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"94d9488c912f4d3bad02841348658d50\"}','{\"result\":\"582c2eecfffc42ac939ad146247c0f3f\",\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e8d1b8996f89483589013a0669deca7a'),('5752bee950ed4e15956a5d6e6a2f9cba','获取销售点详情','/s/getBranch.action','POST','JSON','','{\"branchId\":\"0ecfc2fe4ede4800bbb4087231720db2\",\"myTeamId\":\"10001\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"8a37d757c1a44ad691bd216e9076b375\"}','{\"result\":{\"branchArea\":\"江门\",\"branchId\":\"0ecfc2fe4ede4800bbb4087231720db2\",\"branchName\":\"江门销售点\",\"departmentId\":\"dc89587b44ff4652b44f81da12589175\",\"departmentName\":\"财务部\",\"latLng\":\"100,01\",\"managerId\":\"528832fa9cc54d0290f6ee2922b27256\",\"managerName\":\"赵柳燕\",\"managerPhone\":\"13511113333\",\"myTeamId\":\"10001\"},\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','c6a2b85d8be242c194af42841387059a'),('57fd35bd79cf4879ae1ec14dee7e73fa','添加商品','/s/goodsRelease.action','POST','JSON','[goodsAttr]的属性名与值之间用问号分隔，多组属性用竖线分隔，例:key?value|key?value		\n		\n[goodsImages]和[goodsDescribe]多个用竖线分隔','{\"goodsAttr\":\"品牌?呵呵|\",\"standards\":\"[{\\\"standardName\\\":\\\"60g/袋\\\",\\\"standardPrice\\\":\\\"100\\\",\\\"standardWeight\\\":\\\"60\\\"}]\",\"goodsDescribe\":\"35aa7507390f4ead9d64dc55cc2aa768|ee33de9884e243488d3c3c79da6ac173|\",\"myTeamId\":\"10001\",\"goodsTypeId\":\"945ecca898284c2187ef6a5475a1363e\",\"goodsImages\":\"eedad265f3624c0eb2c6f9ac890989aa|f0c3df5bdb0a45aabf22464bb27dbb88|\",\"goodsCode\":\"R178\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"goodsName\":\"【呵呵动保】10%酸化阿莫西林可溶性粉 60g/袋\",\"token\":\"1\"}','{\"result\":\"b1d2379b6812430482d78a536441f0b2\",\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e2d7ca9f1bd144119c40cc5d29d3a846'),('590cb636436a49f788f763689af707ed','审批员获取建账申请列表','/s/listCustomerAccountByChecker.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"ac6948a5c8fc48abaa9bb26906a8dc55\"}','{\"result\":[{\"checkerId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"checkerName\":\"李思思\",\"createDate\":1507737600000,\"customerId\":\"43a3f72f83d14b498e117f9be76e8d4f\",\"customerName\":\"jackson\",\"merchandiserId\":\"03ef5797bae2466699d5efc970a8962f\",\"merchandiserName\":\"李四\",\"proposerId\":\"03ef5797bae2466699d5efc970a8962f\",\"proposerName\":\"李四\",\"requestId\":\"320cd46e93004f12890dba46bf0d2a4d\",\"requestReason\":\"loginInfo\",\"requestStatus\":2},{\"checkerId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"checkerName\":\"李思思\",\"createDate\":1508342400000,\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"customerName\":\"alisa\",\"merchandiserId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"merchandiserName\":\"王舞欣\",\"proposerId\":\"03ef5797bae2466699d5efc970a8962f\",\"proposerName\":\"李四\",\"requestId\":\"7c2c30d5d1ef49289f10f21de4e1ed5e\",\"requestReason\":\"啊\",\"requestStatus\":1}],\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','f298278523b449a7ac84f58f6a4fdd81'),('5c41389f57544f0eb92959d68744820c','审批人获取库存审批列表','/s/listRepertoryApplyByApprover.action','POST','JSON','申请状态(applyStatus)		\n待审核		10\n已通过(已发货)		11\n已签收		12\n\n开始时间 和 结束时间 必须同时填或同时不填','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"finishDate\":\"2017-12-12\",\"userId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"pageNum\":\"1\",\"token\":\"3ca6ea3b956b44ec993dd9e87b5fe8c6\",\"createDate\":\"2017-1-1\"}','{\"result\":[{\"branchId\":\"0f3965187f1d4bbf963453b7a2ae0b20\",\"myTeamId\":\"10001\",\"approverId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"applyList\":[{\"applyId\":\"6f2688117af64bff81edd3994314c225\",\"standardName\":\"100g/袋\",\"goodsId\":\"bae0a50f935248cfa03a0e0cbffd2dda\",\"currentCount\":256,\"standardId\":\"8e6aabae569e44ca80db3115372aa1a4\",\"goodsImage\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/f4845d04353643989e87cb129e01670d.jpg\",\"goodsCode\":\"S119\",\"goodsName\":\"【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋\",\"goodsType\":\"兽药大礼包\",\"standardCount\":10}],\"branchName\":\"鹤山销售点\",\"proposerId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"approverName\":\"王舞欣\",\"applyId\":\"6f2688117af64bff81edd3994314c225\",\"proposerName\":\"李思思\",\"applyRemark\":\"备注\",\"applyCode\":\"201710214126\",\"applyStatus\":10,\"createDate\":1508568026000}],\"pageCount\":1,\"state\":1,\"token\":\"afc5f8d65cf440a1b58a5f2295361fa01507604201402\"}','3a9bb3d99734486ba7fe0ab5330eb869'),('5ccff2b760ee4d588a41228d565b9aad','删除经营单位','/s/removeManageUnit.action','POST','JSON','','{\"myTeamId\":\"10001\",\"manageId\":\"b45725e4bea3434f90720251711376b0\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"6b35694566574a818c4cc573a44caabd\"}','{\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','a5d007b995274e6d808e60c9d4e22584'),('5ea6c6c4ba9646ceaf6d876845f90430','添加客户跟进','/s/saveCustomerFollow.action','POST','JSON','','{\"myTeamId\":\"10001\",\"followContent\":\"忘记去了\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"followDate\":\"2017-12-12\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"followTitle\":\"跟进测试\",\"customerName\":\"alisa\",\"token\":\"5c16eae7feea492bb51fa4f8f57e1054\"}','{\"result\":\"5c16eae7feea492bb51fa4f8f57e1011\",\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','2ac5d668d40a45178887cb7bb9bbb286'),('5ed5402addf74895a91305716eadab24','获取凭证图片','/user_getProofImage.action','GET','JSON','','','','2cc520f7d1f348a485bb59e12aa6aefb'),('5ff1ca6c80d04d509c7e2b358cca5eb5','上传申请用图片','/s/saveCommonApplyImage.action','POST','JSON','','{\"myTeamId\":\"10001\",\"img\":\"图片\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"340419d796b24d9daa8385ad1631ffd0\"}','{\"result\":\"a3ad0592c5324e2b8f9fe46aa8047f31\",\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e4bd837de42f4c3fac48be13d6ad0b40'),('610442c7ecc34b46a419a919e2c78126','申请者获取协助列表','/s/listCustomerAssistByProposer.action','POST','JSON','','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"pageNum\":\"1\",\"token\":\"f79af217dd2449e7b80d045c20429b81\"}','{\"result\":[{\"assistTitle\":\"搞不定\",\"assistReason\":\"太难搞\",\"userName\":\"张三\",\"assistId\":\"20a0d03c621b4ffcbd06b25f970e4e8e\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"createDate\":1505118139000},{\"assistTitle\":\"10001\",\"assistReason\":\"10001\",\"userName\":\"张三\",\"assistId\":\"ec763147d35c4ab285fbcba67ca57a30\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"createDate\":1508408427000}],\"pageCount\":2,\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','86ff4b4396514203bab501fc6e7ae067'),('623c680edca6456b89f275ab8c614bf7','获取当前部门下的客户列表','/s/listVisitCurrentCustomer.action','POST','JSON','','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"pageNum\":\"1\",\"token\":\"9b6861a082da4d2f9b648bfa47e22e1e\"}','{\"result\":[{\"userImg\":\"\",\"userPhone\":\"13598765678\",\"customerType\":\"personal\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"station\":\"\",\"businessAddress\":\"\",\"creditRating\":0,\"userSex\":\"女\",\"hadAccount\":1,\"userName\":\"alisa\",\"userAddress\":\"鹤山市\"}],\"pageCount\":1,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','773bf9c8af0c4721b5e444fe21abcda1'),('6414f8e5d33f4a93a7793df1459a90cb','上传身份证正面照','/insertCardFront.action','POST','JSON','','','{\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\",\"result\":\"/WEB-INF/upload/img/id_card/f463f02d0fb346939a5d61921c0ae03e.jpg\"}','d68ae3cef71d47a8aa4ed8cf50724239'),('689bc97709b949019ab4e381744e0639','上传身份证正面照片','/s/saveFrontImage.action','POST','JSON','','{\"myTeamId\":\"10001\",\"img\":\"图片\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"token\":\"1e3aa4ee217e462d8a0531bb215d16ba\"}','{\"result\":\"/WEB-INF/upload/img/id_card/d88e28c3a0e6429f9f1d03ad99fabc61/2ad8e7e9db1048d9993ae44061027219.jpg\",\"state\":1,\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\"}','398da1cd89974535809862c823150653'),('68b03974db434ab3bdd09d04dead9d6b','查找分类下的商品','/user_findGoodsList.action','POST','JSON','','{\"myTeamId\":\"10001\",\"goodsTypeId\":\"0b49ef854bb74ff9b9317132dba053d7\",\"pageSize\":\"10\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"pageNum\":\"1\",\"token\":\"32fe1c17ab824b68a1bf92b92c5acda8\"}','{\"result\":[{\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"goodsImages\":\"112\",\"goodsSales\":0,\"goodsPrice\":20.0,\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\"}],\"pageCount\":1,\"state\":1,\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\"}','6d186aa139c74f7185eb0b132905dee8'),('68feadadea904d6fa18c17aec18c98a7','协助者更新协助结果','/s/updateCustomerAssistResult.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"0420cb22c06b43a488c39967779eecec\",\"assistId\":\"ec763147d35c4ab285fbcba67ca57a30\",\"assistResult\":\"122130\",\"token\":\"fc92dfacfcd84fb1b51c5d7b09b62e02\"}','{\"state\":1,\"token\":\"619a3ebdb0c941958dfade8850c0600f1507604189530\"}','86ff4b4396514203bab501fc6e7ae067'),('6a8b2e211bdb4ab8a990af919abb5f2b','获取类目选项','/s/listBreedSelect.action','POST','JSON','','{\"myTeamId\":\"10001\",\"typeId\":\"65053460a17a450f91b8c26b3ae3e751\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"f38e34b3486b4f72b1d7774beec36f33\"}','{\"result\":[{\"selectId\":\"3c08620d09ba4205899991303f2f5803\",\"selectName\":\"鱼\"},{\"selectId\":\"5df461683de641bcab4d5ab7ad016741\",\"selectName\":\"虾\"},{\"selectId\":\"8f3b8f7239874d98849a2ade075a8b31\",\"selectName\":\"猪\"}],\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','2902131e007c427a85387dc11cf15898'),('6b67151fe2e74de6ad2bd90606dc19e9','编辑销售点','/s/updateBranch.action','POST','JSON','','{\"branchId\":\"0ecfc2fe4ede4800bbb4087231720db2\",\"myTeamId\":\"10001\",\"branchName\":\"江门销售点2\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"04f57b8973ef43759def51fdf4a8935d\"}','{\"result\":1,\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','c6a2b85d8be242c194af42841387059a'),('6bba4f0169234ce1b1cacb2c0d1ffe23','删除场地环境、证明图片','/s/removePlaceImage.action','POST','JSON','','{\"myTeamId\":\"10001\",\"imgId\":\"5c4151870c3b4551a37191b934e2e483\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"b8173a3be3d24650ac894ec63323e24b\"}','{\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e8d1b8996f89483589013a0669deca7a'),('6c4e7a503eca4112b4a734d50f3e7812','获取团队内所有成员','/s/listAllMember.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"c0729031d8a2429cb5774e03a70eec58\"}','{\"result\":[{\"departmentName\":\"后勤部\",\"memberId\":\"0420cb22c06b43a488c39967779eecec\",\"myTeamName\":\"青麦科技\",\"positionName\":\"后勤人员\",\"userIdentity\":\"101010101020202020\",\"userImg\":\"\",\"userName\":\"王五\",\"userPhone\":\"13211112222\",\"userSex\":\"男\"},{\"departmentName\":\"后勤部\",\"memberId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"myTeamName\":\"青麦科技\",\"positionName\":\"后勤主管\",\"userIdentity\":\"101010101020202020\",\"userImg\":\"\",\"userName\":\"王舞欣\",\"userPhone\":\"13211113333\",\"userSex\":\"女\"},{\"departmentName\":\"业务部\",\"memberId\":\"03ef5797bae2466699d5efc970a8962f\",\"myTeamName\":\"青麦科技\",\"positionName\":\"业务员\",\"userIdentity\":\"101010101010101010\",\"userImg\":\"\",\"userName\":\"李四\",\"userPhone\":\"13311112222\",\"userSex\":\"男\"},{\"departmentName\":\"业务部\",\"memberId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"myTeamName\":\"青麦科技\",\"positionName\":\"业务主管\",\"userIdentity\":\"101010101010101010\",\"userImg\":\"\",\"userName\":\"李思思\",\"userPhone\":\"13311113333\",\"userSex\":\"女\"},{\"departmentName\":\"总经办\",\"memberId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"myTeamName\":\"青麦科技\",\"positionName\":\"负责人\",\"userIdentity\":\"000000000000000000\",\"userImg\":\"/upload/img/user/head_portrait/89d9317fb3834353bcf2a507bee2eb82/165b159a27544fba89533d5d22adae7c.jpg\",\"userName\":\"张三\",\"userPhone\":\"13688888888\",\"userSex\":\"男\"},{\"departmentName\":\"财务部\",\"memberId\":\"528832fa9cc54d0290f6ee2922b27256\",\"myTeamName\":\"青麦科技\",\"positionName\":\"财务员\",\"userIdentity\":\"101010101020202020\",\"userImg\":\"\",\"userName\":\"赵柳燕\",\"userPhone\":\"13511113333\",\"userSex\":\"女\"},{\"departmentName\":\"财务部\",\"memberId\":\"bed87f05893440698bf6d01028ea7c6a\",\"myTeamName\":\"青麦科技\",\"positionName\":\"财务主管\",\"userIdentity\":\"101010101020202020\",\"userImg\":\"\",\"userName\":\"赵六\",\"userPhone\":\"13511112222\",\"userSex\":\"男\"}],\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','2aa8bd982bef40469246fbb09f74d916'),('6db79ab903874e559cf799c0c5194be5','修改养殖信息（新）','/s/updateUserBreedJson.action','POST','JSON','养殖信息\n将类目名称作为 key，选项名称作为 value 以及信息名称作为 key，客户的填入内容作为 value 拼接成一个 json 串','{\"myTeamId\":\"10001\",\"breedId\":\"1e4787a807fe4946820f143c4b2a25d9\",\"json\":\"{\\\"母体数量\\\":\\\"22\\\",\\\"养殖类目\\\":\\\"猪\\\",\\\"养殖类型\\\":\\\"商品养殖\\\",\\\"养殖品种\\\":\\\"内三元\\\",\\\"公体数量\\\":\\\"12\\\"}\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"594335c05f30433ca7c1bb8083afb8ea\"}','{\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','2902131e007c427a85387dc11cf15898'),('701aae07c8d94171a5d4fe8cf0622511','查找商品分类','/user_findGoodsType.action','POST','JSON','','{\"myTeamId\":\"10001\",\"goodsTypePid\":\"0b49ef854bb74ff9b9317132dba053d7\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"token\":\"470793775bb34cb3ba82465c6404d3dc\"}','{\"result\":[{\"children\":[{\"children\":[],\"goodsTypeId\":\"0b49ef854bb74ff9b9317132dba053d7\",\"goodsTypeName\":\"中猪料\",\"goodsTypePid\":\"2267430251874ea69ea82834c558977a\"},{\"children\":[],\"goodsTypeId\":\"273b080cc35f4b04946db52daca07798\",\"goodsTypeName\":\"保育类\",\"goodsTypePid\":\"2267430251874ea69ea82834c558977a\"},{\"children\":[],\"goodsTypeId\":\"2a2dc78ea7df40ae90a60bb49619df05\",\"goodsTypeName\":\"原料\",\"goodsTypePid\":\"2267430251874ea69ea82834c558977a\"},{\"children\":[],\"goodsTypeId\":\"7671e2616d2a496a866bcab01553c35f\",\"goodsTypeName\":\"公猪料\",\"goodsTypePid\":\"2267430251874ea69ea82834c558977a\"},{\"children\":[],\"goodsTypeId\":\"b6ec605c1e3e4ebb932f287567720f79\",\"goodsTypeName\":\"大猪料\",\"goodsTypePid\":\"2267430251874ea69ea82834c558977a\"},{\"children\":[],\"goodsTypeId\":\"c357720497e44bdb8720941fe39a1f05\",\"goodsTypeName\":\"教槽类\",\"goodsTypePid\":\"2267430251874ea69ea82834c558977a\"},{\"children\":[],\"goodsTypeId\":\"d792326c2d264e529b39c35d8dbc3d2e\",\"goodsTypeName\":\"母猪料\",\"goodsTypePid\":\"2267430251874ea69ea82834c558977a\"},{\"children\":[],\"goodsTypeId\":\"f9d0297d747645579b6219abd65c171f\",\"goodsTypeName\":\"仔猪类\",\"goodsTypePid\":\"2267430251874ea69ea82834c558977a\"},{\"children\":[],\"goodsTypeId\":\"fbca6549122a40029d1e5a5ecef76704\",\"goodsTypeName\":\"饲料原料\",\"goodsTypePid\":\"2267430251874ea69ea82834c558977a\"}],\"goodsTypeId\":\"2267430251874ea69ea82834c558977a\",\"goodsTypeName\":\"饲料\",\"goodsTypePid\":\"0\"},{\"children\":[{\"children\":[{\"children\":[],\"goodsTypeId\":\"10024c95782b4e9a9aa65b12d24153c3\",\"goodsTypeName\":\"脱霉剂\",\"goodsTypePid\":\"03d6bea1b2d9482e9e254265e9945736\"},{\"children\":[],\"goodsTypeId\":\"1fb7c7f35d5d495d8f37a26ef73701d5\",\"goodsTypeName\":\"环境改良剂\",\"goodsTypePid\":\"03d6bea1b2d9482e9e254265e9945736\"},{\"children\":[],\"goodsTypeId\":\"6102cb1d32524f868103c2ed13d7b873\",\"goodsTypeName\":\"肠道改善剂\",\"goodsTypePid\":\"03d6bea1b2d9482e9e254265e9945736\"},{\"children\":[],\"goodsTypeId\":\"73b0faa3f9ef41d38ea0ab6a7d647322\",\"goodsTypeName\":\"免疫增强剂\",\"goodsTypePid\":\"03d6bea1b2d9482e9e254265e9945736\"},{\"children\":[],\"goodsTypeId\":\"995dbbd290c34bdb90d72f8e683b5c80\",\"goodsTypeName\":\"多维\",\"goodsTypePid\":\"03d6bea1b2d9482e9e254265e9945736\"},{\"children\":[],\"goodsTypeId\":\"99a66937a0a3487d96cfccece374490e\",\"goodsTypeName\":\"促生长类\",\"goodsTypePid\":\"03d6bea1b2d9482e9e254265e9945736\"},{\"children\":[],\"goodsTypeId\":\"cc7e99740f8c467987679f7ee6bc3504\",\"goodsTypeName\":\"促发情\",\"goodsTypePid\":\"03d6bea1b2d9482e9e254265e9945736\"},{\"children\":[],\"goodsTypeId\":\"e193484a9343450ab72bc3e6687c9023\",\"goodsTypeName\":\"泌乳类\",\"goodsTypePid\":\"03d6bea1b2d9482e9e254265e9945736\"},{\"children\":[],\"goodsTypeId\":\"f9bd59fa75384f329a5d62b3ee92896c\",\"goodsTypeName\":\"酶制剂\",\"goodsTypePid\":\"03d6bea1b2d9482e9e254265e9945736\"}],\"goodsTypeId\":\"03d6bea1b2d9482e9e254265e9945736\",\"goodsTypeName\":\"添加剂\",\"goodsTypePid\":\"286f09ac9e744088ad7ae9dbf8b5c70e\"},{\"children\":[],\"goodsTypeId\":\"07d6d3ebc7dd440eb381d7771e73a156\",\"goodsTypeName\":\"解热镇痛\",\"goodsTypePid\":\"286f09ac9e744088ad7ae9dbf8b5c70e\"},{\"children\":[{\"children\":[],\"goodsTypeId\":\"0894a22a052d4bb8a9a2995474dd4943\",\"goodsTypeName\":\"解热镇痛\",\"goodsTypePid\":\"49014b0e6c1e4a27aa952022b22c13b2\"},{\"children\":[],\"goodsTypeId\":\"0aab6554bb784adf9660b262fcb5e8d6\",\"goodsTypeName\":\"抗菌消炎\",\"goodsTypePid\":\"49014b0e6c1e4a27aa952022b22c13b2\"},{\"children\":[],\"goodsTypeId\":\"2dab53064cc74c468fb4b6b99b6f9b79\",\"goodsTypeName\":\"养保健类\",\"goodsTypePid\":\"49014b0e6c1e4a27aa952022b22c13b2\"},{\"children\":[],\"goodsTypeId\":\"494869f36a254c41b9a7384a8673ba28\",\"goodsTypeName\":\"呼吸道\",\"goodsTypePid\":\"49014b0e6c1e4a27aa952022b22c13b2\"},{\"children\":[],\"goodsTypeId\":\"7877698c230446759cb0c2d9c2871f4f\",\"goodsTypeName\":\"疫苗\",\"goodsTypePid\":\"49014b0e6c1e4a27aa952022b22c13b2\"},{\"children\":[],\"goodsTypeId\":\"85d6d6acc56a45e1b9cc5ebb3ba1ffe6\",\"goodsTypeName\":\"消毒药\",\"goodsTypePid\":\"49014b0e6c1e4a27aa952022b22c13b2\"},{\"children\":[],\"goodsTypeId\":\"89aaeccbe11b415f822eec109067bc3c\",\"goodsTypeName\":\"母猪保健类\",\"goodsTypePid\":\"49014b0e6c1e4a27aa952022b22c13b2\"},{\"children\":[],\"goodsTypeId\":\"8fd39f27901e4bd28641e0b3361f5d2b\",\"goodsTypeName\":\"补铁药\",\"goodsTypePid\":\"49014b0e6c1e4a27aa952022b22c13b2\"},{\"children\":[],\"goodsTypeId\":\"945ecca898284c2187ef6a5475a1363e\",\"goodsTypeName\":\"兽药大礼包\",\"goodsTypePid\":\"49014b0e6c1e4a27aa952022b22c13b2\"},{\"children\":[],\"goodsTypeId\":\"ace7d59777d84d63a05c462efc6c8ebf\",\"goodsTypeName\":\"消化道\",\"goodsTypePid\":\"49014b0e6c1e4a27aa952022b22c13b2\"},{\"children\":[],\"goodsTypeId\":\"bced61eacc0647ecb5827dd8856f3457\",\"goodsTypeName\":\"驱虫类\",\"goodsTypePid\":\"49014b0e6c1e4a27aa952022b22c13b2\"},{\"children\":[],\"goodsTypeId\":\"cd0dbec4bd914ce2855a9dfab8c85420\",\"goodsTypeName\":\"抗病毒类\",\"goodsTypePid\":\"49014b0e6c1e4a27aa952022b22c13b2\"}],\"goodsTypeId\":\"49014b0e6c1e4a27aa952022b22c13b2\",\"goodsTypeName\":\"兽药\",\"goodsTypePid\":\"286f09ac9e744088ad7ae9dbf8b5c70e\"}],\"goodsTypeId\":\"286f09ac9e744088ad7ae9dbf8b5c70e\",\"goodsTypeName\":\"药品\",\"goodsTypePid\":\"0\"},{\"children\":[{\"children\":[],\"goodsTypeId\":\"201e884d225d40bd8e31cbc56b7df81e\",\"goodsTypeName\":\"人工授精\",\"goodsTypePid\":\"583fdc38ee8c4b5aa6be0b9497da9594\"},{\"children\":[],\"goodsTypeId\":\"52c03e15d23747559990472b909cf931\",\"goodsTypeName\":\"温控环控\",\"goodsTypePid\":\"583fdc38ee8c4b5aa6be0b9497da9594\"},{\"children\":[],\"goodsTypeId\":\"6d905405704c4358a199c6b96c814012\",\"goodsTypeName\":\"管理辅助\",\"goodsTypePid\":\"583fdc38ee8c4b5aa6be0b9497da9594\"},{\"children\":[],\"goodsTypeId\":\"a90311d9c1e143658622922edb76f0d8\",\"goodsTypeName\":\"注射工具\",\"goodsTypePid\":\"583fdc38ee8c4b5aa6be0b9497da9594\"},{\"children\":[],\"goodsTypeId\":\"d9a1c7aa8b8f4d50b6887cf81f60d4c3\",\"goodsTypeName\":\"成套设备\",\"goodsTypePid\":\"583fdc38ee8c4b5aa6be0b9497da9594\"}],\"goodsTypeId\":\"583fdc38ee8c4b5aa6be0b9497da9594\",\"goodsTypeName\":\"设备\",\"goodsTypePid\":\"0\"},{\"children\":[{\"children\":[],\"goodsTypeId\":\"4b6533e3a7214dd39eafd2076b9d9813\",\"goodsTypeName\":\"内三元\",\"goodsTypePid\":\"c3428a9f163f462a86fc93fc0ab02317\"},{\"children\":[],\"goodsTypeId\":\"9fb6e69754ff423aadeb949d64e2888e\",\"goodsTypeName\":\"外三元\",\"goodsTypePid\":\"c3428a9f163f462a86fc93fc0ab02317\"}],\"goodsTypeId\":\"c3428a9f163f462a86fc93fc0ab02317\",\"goodsTypeName\":\"种苗\",\"goodsTypePid\":\"0\"}],\"state\":1,\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\"}','6d186aa139c74f7185eb0b132905dee8'),('70c88de9266441d2afc130810f251b1d','查找商品所属类目','/s/findTypeAndParents.action','POST','JSON','','{\"myTeamId\":\"10001\",\"goodsTypeId\":\"0b49ef854bb74ff9b9317132dba053d7\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"1\"}','{\"result\":{\"goodsTypeId\":\"0b49ef854bb74ff9b9317132dba053d7\",\"goodsTypeName\":\"中猪料\",\"goodsTypePid\":\"2267430251874ea69ea82834c558977a\",\"parent\":{\"goodsTypeId\":\"2267430251874ea69ea82834c558977a\",\"goodsTypeName\":\"饲料\",\"goodsTypePid\":\"0\"}},\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e2d7ca9f1bd144119c40cc5d29d3a846'),('72740512043848ee9cc9a9a4e5740a34','查看总部销售点库存','/s/getFirstRepertory.action','POST','JSON','','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"pageNum\":\"1\",\"token\":\"e694d48f30ed4f2fb9904ea8782d2812\"}','{\"result\":[{\"goodsId\":\"bae0a50f935248cfa03a0e0cbffd2dda\",\"goodsCreateDate\":1507824000000,\"goodsType\":\"兽药大礼包\",\"standards\":[{\"standardName\":\"100g/袋\",\"standardId\":\"8e6aabae569e44ca80db3115372aa1a4\",\"standardPrice\":20.0,\"standardCount\":256}],\"goodsImage\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/f4845d04353643989e87cb129e01670d.jpg\",\"goodsCode\":\"S119\",\"goodsName\":\"【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋\"},{\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"goodsCreateDate\":1507564800000,\"goodsType\":\"中猪料\",\"standards\":[{\"standardName\":\"10kg/袋\",\"standardId\":\"4e3007c4db5d483bb9245743fa5c08eb\",\"standardPrice\":20.0,\"standardCount\":3000},{\"standardName\":\"20kg/袋\",\"standardId\":\"e0841a5ee98a410c9f1fe4a786a6d6f0\",\"standardPrice\":35.0,\"standardCount\":3000}],\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\"}],\"branchId\":\"0f8ad87fcb564f358d287c39749362d4\",\"pageCount\":1,\"branchName\":\"总经办\",\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','7337e6e76a644066854e16b2c329cfdf'),('72ad114d06fe4812bae7dd4449b89971','修改购物车商品','/user_updateGoodsInCart.action','POST','JSON','','{\"myTeamId\":\"10001\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"standardId\":\"4e3007c4db5d483bb9245743fa5c08eb\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"goodsNum\":\"15\",\"token\":\"ccaf37695fda40b3a81db4f2577236fe\"}','{\"state\":1,\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\"}','c652ad76506748a7b0be357066aac0e5'),('72ffcee59d9140cca65868e7e95ead29','业务员移交客户','/s/updateCustomerToPromoter.action','POST','JSON','','{\"myTeamId\":\"10001\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"merchandiserId\":\"528832fa9cc54d0290f6ee2922b27256\",\"userId\":\"03ef5797bae2466699d5efc970a8962f\",\"token\":\"5aa59e7d775e42369cf71ffcd2369e27\"}','{\"state\":1,\"token\":\"acbb4ca124d743479f8aa68af04c91561507604181998\"}','398da1cd89974535809862c823150653'),('7472c31609f042ec8961582fe4dbacb4','新建进仓单','/s/saveRepertoryIncome.action','POST','JSON','','{\"branchId\":\"0f8ad87fcb564f358d287c39749362d4\",\"myTeamId\":\"10001\",\"applyRemark\":\"1\",\"branchName\":\"总经办\",\"userId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"goodsInfo\":\"[{\\\"standardName\\\":\\\"100g/袋\\\",\\\"goodsId\\\":\\\"bae0a50f935248cfa03a0e0cbffd2dda\\\",\\\"standardId\\\":\\\"8e6aabae569e44ca80db3115372aa1a4\\\",\\\"goodsName\\\":\\\"【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋\\\",\\\"standardCount\\\":\\\"256\\\"}]\",\"token\":\"1\"}','{\"result\":\"d99e5e828ef142a39feda16a724c3119\",\"state\":1,\"token\":\"afc5f8d65cf440a1b58a5f2295361fa01507604201402\"}','9b9ab57e6150419ba468cdfc82f22477'),('75b48036547c4d5390172b21a4491e93','获取经营单位列表','/s/listVisitManageUnit.action','POST','JSON','','{\"myTeamId\":\"10001\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"pageSize\":\"10\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"pageNum\":\"1\",\"token\":\"f7d2446ceba24cd9b57472d5a3efe906\"}','{\"result\":[{\"manageType\":\"猪,鱼\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"manageId\":\"f2e69fb129e640a082a8eb4730aa3ab9\",\"manageName\":\"鹤山经营部\",\"manageAcreage\":0,\"manageAddress\":\"\"}],\"pageCount\":1,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','773bf9c8af0c4721b5e444fe21abcda1'),('76b40c145b294413878787e3ab3bb9ab','获取审批人列表','/s/listAccountChecker.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"03ef5797bae2466699d5efc970a8962f\",\"token\":\"d3ebf444cd5044d085cd69f7657168ab\"}','{\"result\":[{\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"userImg\":\"\",\"userName\":\"李思思\"}],\"state\":1,\"token\":\"acbb4ca124d743479f8aa68af04c91561507604181998\"}','f298278523b449a7ac84f58f6a4fdd81'),('76ba873f638743708f4f949ba1a338e3','添加运费模板','/s/saveFreightTemp.action','POST','JSON','','{\"startRange\":\"30\",\"startPrice\":\"40\",\"myTeamId\":\"10001\",\"weightAllowance\":\"20\",\"increaseRange\":\"50\",\"increasePrice\":\"60\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"freightName\":\"大卡车\",\"token\":\"1\"}','{\"result\":\"394e6ec3b3e646e4ac775abe470806cc\",\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','4a9a8d91d40f4b5bb3a37bc532a6b982'),('77030f6cf1bd4572b9718d6f109add9a','获取输入信息列表','/s/listBreedInfo.action','POST','JSON','填写类型有\n文本text\n数字number','{\"myTeamId\":\"10001\",\"selectId\":\"76b0bdb9dfb74d1ca0e6c8021b33647a\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"65fb9dc6d59c4149b4bd2d7b94519dd3\"}','{\"result\":[{\"infoId\":\"26332909988545ed803b11eb7ebf062f\",\"infoName\":\"公体数量\",\"infoType\":\"text\"},{\"infoId\":\"85856526c78345009300d9f1eb5c7246\",\"infoName\":\"母体数量\",\"infoType\":\"text\"}],\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','2902131e007c427a85387dc11cf15898'),('7d13aacf67af4ba9abe1b9f6733a9919','上传身份证背面照片','/s/saveBackImage.action','POST','JSON','','{\"myTeamId\":\"10001\",\"img\":\"图片\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"token\":\"6094606b4d714d7f802b8461a9730b80\"}','{\"result\":\"/WEB-INF/upload/img/id_card/d88e28c3a0e6429f9f1d03ad99fabc61/d2853b0c5a6a4dbcb0eceb0a4c2febba.jpg\",\"state\":1,\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\"}','398da1cd89974535809862c823150653'),('7dc5d9e986904416a376065e7134bcd7','提交体验申请','/registerExperience.action','POST','JSON','','{\"phone\":\"13688888888\",\"company\":\"青麦科技\",\"position\":\"经理\",\"contacts\":\"张三\"}','{\"state\":1,\"token\":null,\"result\":null}','c87afae7685d4338a47e7a38ecc85339'),('7dd5837b04d5432391976e8824ce5896','获取场地详情','/s/getUserPlace.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userPlaceId\":\"582c2eecfffc42ac939ad146247c0f3f\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"429325fe054b44aebcc8446d363a088d\"}','{\"result\":{\"certificateList\":[{\"imgId\":\"5c4151870c3b4551a37191b934e2e483\",\"imgType\":2,\"imgUrl\":\"/upload/img/user/place/\\\\97ed4abf9ad842088fcd824db72a0835.jpg\"},{\"imgId\":\"c75f102219104744a16222666301bfdd\",\"imgType\":2,\"imgUrl\":\"/upload/img/user/place/\\\\6ebd5f326c5f4fb8a83a1c4fdbb51eda.jpg\"},{\"imgId\":\"ebb4f011d992416d90a54e74c74ef355\",\"imgType\":2,\"imgUrl\":\"/upload/img/user/place/\\\\c507efb8ad894aa6aea2df48331d2aac.jpg\"}],\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"environmentList\":[{\"imgId\":\"11eddd677e8e414492e94011449fb4df\",\"imgType\":1,\"imgUrl\":\"/upload/img/user/place/\\\\7d1d9f64e2564cecb1e5083047be0b3f.jpg\"}],\"userAlreadyUse\":12,\"userEmployeeNum\":0,\"userOwnerNum\":0,\"userPlaceAcreage\":142,\"userPlaceArea\":\"鹤山\",\"userPlaceId\":\"582c2eecfffc42ac939ad146247c0f3f\",\"userPlaceType\":\"\"},\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e8d1b8996f89483589013a0669deca7a'),('7e995923923742a3bcf111287845011f','协助者获取协助列表','/s/listCustomerAssistByHelper.action','POST','JSON','','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"0420cb22c06b43a488c39967779eecec\",\"pageNum\":\"1\",\"token\":\"3055c1e3cd51468eb413f62202b949fe\"}','{\"result\":[{\"assistTitle\":\"10001\",\"assistReason\":\"10001\",\"userName\":\"张三\",\"assistId\":\"ec763147d35c4ab285fbcba67ca57a30\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"createDate\":1508408427000}],\"pageCount\":1,\"state\":1,\"token\":\"619a3ebdb0c941958dfade8850c0600f1507604189530\"}','86ff4b4396514203bab501fc6e7ae067'),('8364681d60f7477b9ee1946ea0eedd54','确认签收','/s/updateRepertoryApplyFinish.action','POST','JSON','','{\"applyId\":\"6f2688117af64bff81edd3994314c225\",\"myTeamId\":\"10001\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"4d5219ae71364f619e57037781afda24\"}','{\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','3a9bb3d99734486ba7fe0ab5330eb869'),('848c7efdb62940e3be672c5878afa0ed','获取销售点列表','/s/listBranch.action','POST','JSON','','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"pageNum\":\"1\",\"token\":\"7ad971283ec04a5795908b05c8e64ea1\"}','{\"result\":[{\"departmentName\":\"业务部\",\"branchId\":\"9c5ef58ed0034a1c8dd885369ac3b97c\",\"branchName\":\"鹤山销售点\",\"managerName\":\"李思思\",\"managerPhone\":\"13311113333\"},{\"departmentName\":\"财务部\",\"branchId\":\"0ecfc2fe4ede4800bbb4087231720db2\",\"branchName\":\"江门销售点\",\"managerName\":\"赵柳燕\",\"managerPhone\":\"13511113333\"}],\"pageCount\":1,\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','c6a2b85d8be242c194af42841387059a'),('87ee0eceaa3348a99c72b16f6bb44afb','删除指定收货地址','/user_deleteMyAddress.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userAddressId\":\"5bf6cb4001e14998ad2e6e6a41dc97f5\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"7584cce9d3a54d5da95c7cd83f11af95\"}','{\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\",\"result\":null}','05a6b344fa244892856d6113fafa824f'),('8b2bd88dc8cc4717b86bdbde6305b65d','获取场地列表','/s/listVisitUserPlace.action','POST','JSON','','{\"myTeamId\":\"10001\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"pageSize\":\"10\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"pageNum\":\"1\",\"token\":\"c7d10c191fe7447b8f3be51040ebf744\"}','{\"result\":[{\"userPlaceAcreage\":142,\"userOwnerNum\":0,\"userPlaceArea\":\"鹤山\",\"userPlaceType\":\"\",\"userEmployeeNum\":0,\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"environmentList\":[{\"imgUrl\":\"/upload/img/user/place/\\\\d0828d61fae1406299deb0fa9a142b06.jpg\",\"imgId\":\"192d4362a6554e9a9f2008ab23d110de\",\"imgType\":1}],\"userPlaceId\":\"daab4edac0fa48d5b62f6c241f5dd590\",\"userAlreadyUse\":0,\"certificateList\":[]}],\"pageCount\":1,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','773bf9c8af0c4721b5e444fe21abcda1'),('8bdb3571946a4c87913beeca3bfcca13','获取团队部门及成员','/s/listDepartmentAndMember.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"a1080c4ca1d24b5db54329ad298530d8\"}','{\"result\":[{\"count\":2,\"memberList\":[{\"departmentName\":\"后勤部\",\"memberId\":\"0420cb22c06b43a488c39967779eecec\",\"myTeamName\":\"青麦科技\",\"positionName\":\"后勤人员\",\"userIdentity\":\"101010101020202020\",\"userImg\":\"\",\"userName\":\"王五\",\"userPhone\":\"13211112222\",\"userSex\":\"男\"},{\"departmentName\":\"后勤部\",\"memberId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"myTeamName\":\"青麦科技\",\"positionName\":\"后勤主管\",\"userIdentity\":\"101010101020202020\",\"userImg\":\"\",\"userName\":\"王舞欣\",\"userPhone\":\"13211113333\",\"userSex\":\"女\"}],\"teamDepartmentId\":\"4bc0ec2d68a444e7a584b9f8d03cbc44\",\"teamDepartmentName\":\"后勤部\"},{\"count\":2,\"memberList\":[{\"departmentName\":\"业务部\",\"memberId\":\"03ef5797bae2466699d5efc970a8962f\",\"myTeamName\":\"青麦科技\",\"positionName\":\"业务员\",\"userIdentity\":\"101010101010101010\",\"userImg\":\"\",\"userName\":\"李四\",\"userPhone\":\"13311112222\",\"userSex\":\"男\"},{\"departmentName\":\"业务部\",\"memberId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"myTeamName\":\"青麦科技\",\"positionName\":\"业务主管\",\"userIdentity\":\"101010101010101010\",\"userImg\":\"\",\"userName\":\"李思思\",\"userPhone\":\"13311113333\",\"userSex\":\"女\"}],\"teamDepartmentId\":\"5a20e0ea32b948c08c928995b26af64e\",\"teamDepartmentName\":\"业务部\"},{\"count\":1,\"memberList\":[{\"departmentName\":\"总经办\",\"memberId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"myTeamName\":\"青麦科技\",\"positionName\":\"负责人\",\"userIdentity\":\"000000000000000000\",\"userImg\":\"/upload/img/user/head_portrait/89d9317fb3834353bcf2a507bee2eb82/165b159a27544fba89533d5d22adae7c.jpg\",\"userName\":\"张三\",\"userPhone\":\"13688888888\",\"userSex\":\"男\"}],\"teamDepartmentId\":\"9e8d946ef94b4795bd9218795354e631\",\"teamDepartmentName\":\"总经办\"},{\"count\":2,\"memberList\":[{\"departmentName\":\"财务部\",\"memberId\":\"528832fa9cc54d0290f6ee2922b27256\",\"myTeamName\":\"青麦科技\",\"positionName\":\"财务员\",\"userIdentity\":\"101010101020202020\",\"userImg\":\"\",\"userName\":\"赵柳燕\",\"userPhone\":\"13511113333\",\"userSex\":\"女\"},{\"departmentName\":\"财务部\",\"memberId\":\"bed87f05893440698bf6d01028ea7c6a\",\"myTeamName\":\"青麦科技\",\"positionName\":\"财务主管\",\"userIdentity\":\"101010101020202020\",\"userImg\":\"\",\"userName\":\"赵六\",\"userPhone\":\"13511112222\",\"userSex\":\"男\"}],\"teamDepartmentId\":\"dc89587b44ff4652b44f81da12589175\",\"teamDepartmentName\":\"财务部\"}],\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','2aa8bd982bef40469246fbb09f74d916'),('8d5c6f7446634d8f85b759d6d3175a06','获取经营单位详情','/s/getManageUnit.action','POST','JSON','','{\"myTeamId\":\"10001\",\"manageId\":\"b45725e4bea3434f90720251711376b0\",\"pageSize\":\"10\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"57f37a1d330b48738c58beba82e6bac8\"}','{\"result\":{\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"manageAcreage\":0,\"manageAddress\":\"122\",\"manageId\":\"b45725e4bea3434f90720251711376b0\",\"manageName\":\"鹤山经营部\",\"manageType\":\"猪,鱼\"},\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','a5d007b995274e6d808e60c9d4e22584'),('8fcbfa36708a4db086fa16e23c38886a','获取总部销售点Id','/s/getFirstBranchId.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"b7290705d5bf498ab1855b8d8be2b62b\"}','{\"result\":\"0f8ad87fcb564f358d287c39749362d4\",\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','7337e6e76a644066854e16b2c329cfdf'),('912a22a6fd734458ba1d56ae39b4cde9','获取当前部门下的成员列表','/s/listVisitCurrentMember.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"017c5f8e702e496e968b006e03e2abac\"}','{\"result\":[{\"memberId\":\"03ef5797bae2466699d5efc970a8962f\",\"userName\":\"李四\"},{\"memberId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"userName\":\"李思思\"}],\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','773bf9c8af0c4721b5e444fe21abcda1'),('9205c489f42f4634a8148de0200384b9','获取收货地址','/user_findMyAddress.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"11158169910c4dd495c99b3d18f7883b\"}','{\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\",\"result\":[{\"userId\":null,\"userAddressId\":\"5bf6cb4001e14998ad2e6e6a41dc97f5\",\"userPhone\":\"13688885526\",\"userArea\":\"鹤山市\",\"userAddress\":\"文化路华美洗车\",\"userName\":\"张三\",\"userAddressDefault\":1}]}','05a6b344fa244892856d6113fafa824f'),('941d290e7cab40d2809c07c7d4cc7321','获取部门下的成员列表','/s/findMemberList.action','POST','JSON','','{\"myTeamId\":\"10001\",\"departmentId\":\"4bc0ec2d68a444e7a584b9f8d03cbc44\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"1\"}','{\"result\":[{\"departmentName\":\"后勤部\",\"permissionList\":[],\"positionName\":\"后勤人员\",\"userId\":\"0420cb22c06b43a488c39967779eecec\",\"userName\":\"王五\",\"userPhone\":\"13211112222\",\"userSex\":\"男\"},{\"departmentName\":\"后勤部\",\"permissionList\":[],\"positionName\":\"后勤主管\",\"userId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"userName\":\"王舞欣\",\"userPhone\":\"13211113333\",\"userSex\":\"女\"}],\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','e4bd837de42f4c3fac48be13d6ad0b40'),('94a4b4adbeed48aca99267235d97781b','上传手持身份证照片','/s/saveHandImage.action','POST','JSON','','{\"myTeamId\":\"10001\",\"img\":\"图片\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"token\":\"28bc97b8007d43e0bfa4d5ea58bfe249\"}','{\"result\":\"/WEB-INF/upload/img/id_card/d88e28c3a0e6429f9f1d03ad99fabc61/07308795030843e88749b0a31932a543.jpg\",\"state\":1,\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\"}','398da1cd89974535809862c823150653'),('96950ed4881047ce843c7447508d56d1','盘点库存','/s/updateRepertory.action','POST','JSON','','{\"branchId\":\"9e8d946ef94b4795bd9218795354e631\",\"myTeamId\":\"10001\",\"branchName\":\"总经办\",\"recordRemark\":\"\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"goodsInfo\":\"[{\\\"standardName\\\":\\\"10kg/袋\\\",\\\"goodsId\\\":\\\"f0c3df5bdb0a45aabf22464bb27dbb88\\\",\\\"recordType\\\":\\\"1\\\",\\\"standardId\\\":\\\"4e3007c4db5d483bb9245743fa5c08eb\\\",\\\"goodsName\\\":\\\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\\\",\\\"recordReason\\\":\\\"正常处理\\\",\\\"standardCount\\\":\\\"1000\\\"},{\\\"standardName\\\":\\\"20kg/袋\\\",\\\"goodsId\\\":\\\"f0c3df5bdb0a45aabf22464bb27dbb88\\\",\\\"recordType\\\":\\\"1\\\",\\\"standardId\\\":\\\"e0841a5ee98a410c9f1fe4a786a6d6f0\\\",\\\"goodsName\\\":\\\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\\\",\\\"recordReason\\\":\\\"正常处理\\\",\\\"standardCount\\\":\\\"2000\\\"}]\",\"token\":\"1\"}','{\"result\":\"d587612e94374da68152d7eeae64be0d\",\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','1bef32e052414c69a3deeddecf49d806'),('97b9990fc5124331b6f761cd267dc772','分配库存等级','/s/saveRepertoryLevel.action','POST','JSON','客户类型有\n\"personal\"(个体户)\n\"cooperation\"(合作农户)\n\"cooperative\"(合作社)\n\"dealer\"(经销商)\n\n库存等级\n一级库存为\"1\"\n二级库存为\"2\"','{\"repertoryType\":\"1\",\"myTeamId\":\"10001\",\"customerType\":\"personal\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"token\":\"6ba4c9be12c04fae9dc5f301b6ec7f49\"}','{\"state\":3,\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\"}','398da1cd89974535809862c823150653'),('9a14b37330e54b38abadd056f18d10fe','获取验证码','/retrieveGetPasswordVerify.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userPhone\":\"13597165115\"}','{\"state\":3}','03f3f8250a1d441aa092232ee6c91a4d'),('9f3bef34a9ea46afb8fba1515490efaf','获取跟进列表','/s/listCustomerFollow.action','POST','JSON','','{\"myTeamId\":\"10001\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"pageSize\":\"10\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"pageNum\":\"1\",\"token\":\"7a9173e772ba47b5bd3198bde73c59b8\"}','{\"result\":[{\"followId\":\"4231e8124e9247139d095044b5f83a08\",\"followContent\":\"忘记去了\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"promoterName\":\"张三\",\"followDate\":1513008000000,\"followTitle\":\"跟进测试\",\"promoterId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"customerName\":\"alisa\"}],\"pageCount\":1,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','2ac5d668d40a45178887cb7bb9bbb286'),('a9d6547582b6423083a598ef042d6772','删除销售点','/s/removeBranch.action','POST','JSON','','{\"branchId\":\"0ecfc2fe4ede4800bbb4087231720db2\",\"myTeamId\":\"10001\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"1bbbc14523dc407980fa65466278d891\"}','{\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\",\"result\":1}','c6a2b85d8be242c194af42841387059a'),('aba5ce2d65fe4f75be0bbf100a1bbe3d','获取成员详情','/s/getDepartmentMember.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"13c13ae05e9a439cbe3319f56b0f2a2d\",\"memberId\":\"0420cb22c06b43a488c39967779eecec\"}','{\"result\":{\"departmentName\":\"后勤部\",\"memberId\":\"0420cb22c06b43a488c39967779eecec\",\"myTeamName\":\"青麦科技\",\"positionName\":\"后勤人员\",\"userIdentity\":\"101010101020202020\",\"userImg\":\"\",\"userName\":\"王五\",\"userPhone\":\"13211112222\",\"userSex\":\"男\"},\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','2aa8bd982bef40469246fbb09f74d916'),('account_check','同意客户建账','/s/updateCustomerAccountAccept.action','POST','JSON','','{\"myTeamId\":\"10001\",\"requestId\":\"320cd46e93004f12890dba46bf0d2a4d\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"72087db29e47495fa6fb4bcd09c66273\"}','{\"state\":2,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','f298278523b449a7ac84f58f6a4fdd81'),('ada1e8b8ed284b0da83b56131202cd53','修改密码','/updatePassword.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userPassword\":\"699c167824a5f8caf7f0d0893da73e75\",\"userId\":\"13597165115\",\"token\":\"7e84da3c6c154e4a92b7617b3d0d84f3\"}','{\"state\":1,\"token\":null,\"result\":null}','03f3f8250a1d441aa092232ee6c91a4d'),('ae90901e86b7472899c20756136e7cc8','用户登录','/login.action','POST','JSON','','{\"userPassword\":\"699c167824a5f8caf7f0d0893da73e75\",\"myTeamId\":\"10001\",\"userPhone\":\"13688888888\",\"deviceToken\":\"37b3f98a018e4af78e01aa16d127a25f\"}','{\"result\":{\"myTeamId\":\"10001\",\"userImg\":\"\",\"userPassword\":\"825682eafec59c2e1632828195133a52\",\"userStatus\":\"u_st_2\",\"roleId\":\"1002\",\"departmentId\":\"9e8d946ef94b4795bd9218795354e631\",\"userName\":\"张三\",\"userArea\":\"\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"da8990b107b84cf980035927cce112721507599537351\",\"myTeamName\":\"青麦科技\",\"rCloudToken\":\"Orqhu1VZtfzEnsxmwh7nmWPnFx8I0rlLEoIjd1oa/Wi6Dzm9CEKp3DBhHmaTI+wXYvXGUf3a/0YZoJHRu6Db4mVdyXE/SZal4xftuWaOF1KX1A+MIx+lEXmUVOA5eIEV1AhLtoKZQIM=\"},\"state\":1,\"token\":\"ce710d7811ae4f9593fcbed56313cf391508148342663\"}','d68ae3cef71d47a8aa4ed8cf50724239'),('af1379d79875405cbfba73d080e1cab2','获取类目','/s/listBreedType.action','POST','JSON','\"对应类目选项Id\" 再首次请求的时候传空字符串 \"\"\no\n当返回的数组长度为 0 的时候，调用 \"获取输入信息\" 接口','{\"myTeamId\":\"10001\",\"selectId\":\"\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"3e75728726374f8598f4e04f7b110e0c\"}','{\"result\":[{\"typeId\":\"65053460a17a450f91b8c26b3ae3e751\",\"typeName\":\"养殖类目\"}],\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','2902131e007c427a85387dc11cf15898'),('af4194226ffb4608b0bd9771b1d90254','获取养殖信息列表（新）','/s/listUserBreedJson.action','POST','JSON','','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userPlaceId\":\"b76ddc7446fa4e108ecaacc4a1d16bc7\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"pageNum\":\"1\",\"token\":\"f65b34d92c4249bcb9814352cd43a288\"}','{\"result\":[{\"breedCategory\":\"\",\"breedId\":\"1e4787a807fe4946820f143c4b2a25d9\",\"emptyShedNum\":0,\"obstetricTableNum\":0,\"breedVariety\":\"\",\"competitiveBrand\":\"\",\"shedNum\":0,\"breedScale\":0,\"femaleNum\":0,\"maleNum\":0,\"json\":\"{\\\"母体数量\\\":\\\"45\\\",\\\"养殖类目\\\":\\\"猪\\\",\\\"养殖类型\\\":\\\"商品养殖\\\",\\\"养殖品种\\\":\\\"内三元\\\",\\\"公体数量\\\":\\\"12\\\"}\",\"breedAge\":0,\"userPlaceId\":\"b76ddc7446fa4e108ecaacc4a1d16bc7\",\"livestockNum\":0,\"breedType\":\"\",\"createDate\":1508400021000}],\"pageCount\":1,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','2902131e007c427a85387dc11cf15898'),('af6ec83c58c04efbaa66407d5f637e97','获取库存盘点记录','/s/listRepertoryRecord.action','POST','JSON','开始时间 和 结束时间 必须同时填或同时不填		\n		\n		\n销售点Id(branchId)为空获取所有销售点盘点记录','{\"branchId\":\"9e8d946ef94b4795bd9218795354e631\",\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"pageNum\":\"1\",\"token\":\"7c3be6d28d4c465fb0821d61731e352e\"}','{\"result\":[{\"recordId\":\"8cc618af34f24beaa2bcfd28a1862460\",\"branchId\":\"9e8d946ef94b4795bd9218795354e631\",\"myTeamId\":\"10001\",\"recordList\":[{\"recordId\":\"8cc618af34f24beaa2bcfd28a1862460\",\"standardName\":\"10kg/袋\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"recordType\":1,\"currentCount\":3000,\"standardId\":\"4e3007c4db5d483bb9245743fa5c08eb\",\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"recordReason\":\"正常处理\",\"goodsType\":\"中猪料\",\"standardCount\":1000},{\"recordId\":\"8cc618af34f24beaa2bcfd28a1862460\",\"standardName\":\"20kg/袋\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"recordType\":1,\"currentCount\":3000,\"standardId\":\"e0841a5ee98a410c9f1fe4a786a6d6f0\",\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"recordReason\":\"正常处理\",\"goodsType\":\"中猪料\",\"standardCount\":2000}],\"branchName\":\"总经办\",\"recordCode\":\"201710119708\",\"recordRemark\":\"\",\"operatorId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"operatorName\":\"张三\",\"createDate\":1507686659000},{\"recordId\":\"d587612e94374da68152d7eeae64be0d\",\"branchId\":\"9e8d946ef94b4795bd9218795354e631\",\"myTeamId\":\"10001\",\"recordList\":[{\"recordId\":\"d587612e94374da68152d7eeae64be0d\",\"standardName\":\"10kg/袋\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"recordType\":1,\"currentCount\":3000,\"standardId\":\"4e3007c4db5d483bb9245743fa5c08eb\",\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"recordReason\":\"正常处理\",\"goodsType\":\"中猪料\",\"standardCount\":1000},{\"recordId\":\"d587612e94374da68152d7eeae64be0d\",\"standardName\":\"20kg/袋\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"recordType\":1,\"currentCount\":3000,\"standardId\":\"e0841a5ee98a410c9f1fe4a786a6d6f0\",\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"recordReason\":\"正常处理\",\"goodsType\":\"中猪料\",\"standardCount\":2000}],\"branchName\":\"总经办\",\"recordCode\":\"201710212551\",\"recordRemark\":\"\",\"operatorId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"operatorName\":\"张三\",\"createDate\":1508557818000}],\"pageCount\":1,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','1bef32e052414c69a3deeddecf49d806'),('b01576d116e743e398c4237c9c1b4bcb','获取场地详情','/s/getVisitUserPlace.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userPlaceId\":\"daab4edac0fa48d5b62f6c241f5dd590\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"6b646a9cf6e5492caa2bb40758844255\"}','{\"result\":{\"certificateList\":[],\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"environmentList\":[{\"imgId\":\"192d4362a6554e9a9f2008ab23d110de\",\"imgType\":1,\"imgUrl\":\"/upload/img/user/place/\\\\d0828d61fae1406299deb0fa9a142b06.jpg\"}],\"userAlreadyUse\":0,\"userEmployeeNum\":0,\"userOwnerNum\":0,\"userPlaceAcreage\":142,\"userPlaceArea\":\"鹤山\",\"userPlaceId\":\"daab4edac0fa48d5b62f6c241f5dd590\",\"userPlaceType\":\"\"},\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','773bf9c8af0c4721b5e444fe21abcda1'),('b13a7dcf179d4bffb46ab3c1561915a3','删除商品','/s/deleteGoods.action','POST','JSON','','{\"myTeamId\":\"10001\",\"goodsId\":\"b1d2379b6812430482d78a536441f0b2\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"1\"}','{\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e2d7ca9f1bd144119c40cc5d29d3a846'),('b2ed25be654f4bb6b16aaaf7a6c2aa07','获取部门列表','/s/findDepartmentList.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"1\"}','{\"result\":[{\"departmentId\":\"4bc0ec2d68a444e7a584b9f8d03cbc44\",\"departmentName\":\"后勤部\",\"positionList\":[]},{\"departmentId\":\"5a20e0ea32b948c08c928995b26af64e\",\"departmentName\":\"业务部\",\"positionList\":[]},{\"departmentId\":\"9e8d946ef94b4795bd9218795354e631\",\"departmentName\":\"总经办\",\"positionList\":[]},{\"departmentId\":\"dc89587b44ff4652b44f81da12589175\",\"departmentName\":\"财务部\",\"positionList\":[]}],\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','e4bd837de42f4c3fac48be13d6ad0b40'),('b438e782f0444b07b3ee397bc309bc7c','跟单员移交客户','/s/updateCustomerToMerchandiser.action','POST','JSON','','{\"myTeamId\":\"10001\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"userId\":\"03ef5797bae2466699d5efc970a8962f\",\"promoterId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"token\":\"3e8191a657a444509513077afa45b1a6\"}','{\"state\":1,\"token\":\"acbb4ca124d743479f8aa68af04c91561507604181998\"}','398da1cd89974535809862c823150653'),('b44cc2e23e6e4f2eb2761bf672b6fb0f','获取验证码','/registerGetVerify.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userPhone\":\"13688888888\"}','{\"state\":4,\"token\":null,\"result\":null}','d68ae3cef71d47a8aa4ed8cf50724239'),('b501882d44af4ad7b8bdb9ae48149acc','申请人获取库存申请列表','/s/listRepertoryApplyByProposer.action','POST','JSON','申请状态(applyStatus)\n待审核10\n已通过(已发货)11\n已签收12','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"pageNum\":\"1\",\"token\":\"9ccf52f0c98b43709ce8102a25e53df3\"}','{\"result\":[{\"branchId\":\"0f3965187f1d4bbf963453b7a2ae0b20\",\"myTeamId\":\"10001\",\"approverId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"applyList\":[{\"applyId\":\"8097616c247b4cc2b0b3862f627e7445\",\"standardName\":\"10kg/袋\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"currentCount\":3000,\"standardId\":\"4e3007c4db5d483bb9245743fa5c08eb\",\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"goodsType\":\"中猪料\",\"standardCount\":200},{\"applyId\":\"8097616c247b4cc2b0b3862f627e7445\",\"standardName\":\"20kg/袋\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"currentCount\":3000,\"standardId\":\"e0841a5ee98a410c9f1fe4a786a6d6f0\",\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"goodsType\":\"中猪料\",\"standardCount\":300}],\"branchName\":\"鹤山销售点\",\"proposerId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"approverName\":\"王舞欣\",\"applyId\":\"8097616c247b4cc2b0b3862f627e7445\",\"proposerName\":\"李思思\",\"applyRemark\":\"备注\",\"applyCode\":\"\",\"applyStatus\":12,\"createDate\":1507707330000},{\"acceptDate\":1507712579000,\"branchId\":\"0f3965187f1d4bbf963453b7a2ae0b20\",\"myTeamId\":\"10001\",\"approverId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"applyList\":[{\"applyId\":\"9e1d7ab46f3c41a382413059ab615f4f\",\"standardName\":\"10kg/袋\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"currentCount\":3000,\"standardId\":\"4e3007c4db5d483bb9245743fa5c08eb\",\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"goodsType\":\"中猪料\",\"standardCount\":200},{\"applyId\":\"9e1d7ab46f3c41a382413059ab615f4f\",\"standardName\":\"20kg/袋\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"currentCount\":3000,\"standardId\":\"e0841a5ee98a410c9f1fe4a786a6d6f0\",\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"goodsType\":\"中猪料\",\"standardCount\":300}],\"branchName\":\"鹤山销售点\",\"proposerId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"approverName\":\"王舞欣\",\"applyId\":\"9e1d7ab46f3c41a382413059ab615f4f\",\"proposerName\":\"李思思\",\"applyRemark\":\"备注\",\"applyCode\":\"\",\"applyStatus\":12,\"createDate\":1507712566000},{\"branchId\":\"0f3965187f1d4bbf963453b7a2ae0b20\",\"myTeamId\":\"10001\",\"approverId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"applyList\":[{\"applyId\":\"dac29c84ff574042add0305a2ce1e1ef\",\"standardName\":\"100g/袋\",\"goodsId\":\"bae0a50f935248cfa03a0e0cbffd2dda\",\"currentCount\":256,\"standardId\":\"8e6aabae569e44ca80db3115372aa1a4\",\"goodsImage\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/f4845d04353643989e87cb129e01670d.jpg\",\"goodsCode\":\"S119\",\"goodsName\":\"【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋\",\"goodsType\":\"兽药大礼包\",\"standardCount\":10}],\"branchName\":\"鹤山销售点\",\"proposerId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"approverName\":\"王舞欣\",\"applyId\":\"dac29c84ff574042add0305a2ce1e1ef\",\"proposerName\":\"李思思\",\"applyRemark\":\"备注\",\"applyCode\":\"201710135952\",\"applyStatus\":10,\"createDate\":1507881862000}],\"pageCount\":1,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','3a9bb3d99734486ba7fe0ab5330eb869'),('b5a03ad641ba4dd7b3a8124d8bab42e5','申请客户建账','/s/saveCustomerAccount.action','POST','JSON','','{\"requestReason\":\"啊\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"merchandiserId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"checkerId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"checkerName\":\"李思思\",\"userId\":\"03ef5797bae2466699d5efc970a8962f\",\"customerName\":\"alisa\",\"token\":\"ab9f2847b81142dcbd713ef2faadf207\",\"merchandiserName\":\"王舞欣\"}','{\"result\":\"7c2c30d5d1ef49289f10f21de4e1ed5e\",\"state\":1,\"token\":\"acbb4ca124d743479f8aa68af04c91561507604181998\"}','f298278523b449a7ac84f58f6a4fdd81'),('b6625b81b5884825ad1c51072eb22d94','上传身份证背面照','/insertCardBack.action','POST','JSON','','','{\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\",\"result\":\"/WEB-INF/upload/img/id_card/f463f02d0fb346939a5d61921c0ae03e.jpg\"}','d68ae3cef71d47a8aa4ed8cf50724239'),('b6f3fb9478aa43398e96bd03823aa667','验证短信验证码','/registerVerify.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userPhone\":\"13688888888\",\"verify\":\"10001\"}','','d68ae3cef71d47a8aa4ed8cf50724239'),('b7ebc400c4244282b50cb53016719fa8','添加商品到购物车','/user_saveGoodsToCart.action','POST','JSON','','{\"myTeamId\":\"10001\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"standardId\":\"standardId\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"goodsNum\":\"10\",\"token\":\"c265a3b0132940148ef0582d40c362d2\"}','{\"state\":1,\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\"}','c652ad76506748a7b0be357066aac0e5'),('b8995f0262e64652ba85a136b3cb24c6','获取业务员列表','/s/listPromoter.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"token\":\"aebd4ac21b1d4632b1fe9980eb574208\"}','{\"result\":[{\"userId\":\"03ef5797bae2466699d5efc970a8962f\",\"userImg\":\"\",\"userName\":\"李四\"},{\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"userImg\":\"\",\"userName\":\"李思思\"}],\"state\":1,\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\"}','f298278523b449a7ac84f58f6a4fdd81'),('b8e2d60dd0c64f49b9fe6bcb50bfe078','上传场地证明图片','/s/uploadPlaceCertificate.action','POST','JSON','','{\"myTeamId\":\"10001\",\"img\":\"图片\",\"userPlaceId\":\"582c2eecfffc42ac939ad146247c0f3f\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"d33a924bba1147cba495d1776015f25a\"}','{\"result\":\"c75f102219104744a16222666301bfdd\",\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e8d1b8996f89483589013a0669deca7a'),('b9b3db9cc3d844fa8fb762a243dd7e7f','发起申请','/s/saveRepertoryApply.action','POST','JSON','','{\"branchId\":\"0f3965187f1d4bbf963453b7a2ae0b20\",\"myTeamId\":\"10001\",\"proposerName\":\"李思思\",\"applyRemark\":\"备注\",\"approverId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"branchName\":\"鹤山销售点\",\"proposerId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"goodsInfo\":\"[{\\\"standardName\\\":\\\"100g/袋\\\",\\\"goodsId\\\":\\\"bae0a50f935248cfa03a0e0cbffd2dda\\\",\\\"standardId\\\":\\\"8e6aabae569e44ca80db3115372aa1a4\\\",\\\"goodsName\\\":\\\"【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋\\\",\\\"standardCount\\\":\\\"10\\\"}]\",\"token\":\"1\",\"approverName\":\"王舞欣\"}','{\"result\":\"3a217749567a4fd990e5530592ee4016\",\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','3a9bb3d99734486ba7fe0ab5330eb869'),('bcabcf0bf5944692bcd084fed8c0e4b1','搜索库存商品','/s/listRepertoryByKeyword.action','POST','JSON','','{\"branchId\":\"0f8ad87fcb564f358d287c39749362d4\",\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"keyword\":\"哼哼\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"pageNum\":\"1\",\"token\":\"1d1abcaa6db24519aa74edc6ab5bd346\"}','{\"result\":[{\"goodsId\":\"bae0a50f935248cfa03a0e0cbffd2dda\",\"goodsCreateDate\":1507824000000,\"goodsType\":\"兽药大礼包\",\"standards\":[{\"standardName\":\"100g/袋\",\"standardId\":\"8e6aabae569e44ca80db3115372aa1a4\",\"standardPrice\":20.0,\"standardCount\":256}],\"goodsImage\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/f4845d04353643989e87cb129e01670d.jpg\",\"goodsCode\":\"S119\",\"goodsName\":\"【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋\"}],\"pageCount\":1,\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','7337e6e76a644066854e16b2c329cfdf'),('bd07a2e7f9634d2f8fd980239bcc5374','添加图片到图片空间','/s/uploadToImgSpace.action','POST','JSON','','{\"myTeamId\":\"10001\",\"img\":\"图片\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"73c1d64389e34fc98152cf5e8c2c82f8\"}','{\"state\":0,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\",\"result\":\"2246ffa623db455890018a19296e5cab\"}','e2d7ca9f1bd144119c40cc5d29d3a846'),('be58dab447ee4d84b517846e1bc1372c','修改经营单位','/s/updateManageUnit.action','POST','JSON','','{\"myTeamId\":\"10001\",\"manageId\":\"b45725e4bea3434f90720251711376b0\",\"pageSize\":\"10\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"manageAddress\":\"122\",\"token\":\"9c97e847e38947c78d8b313c86c85728\"}','{\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','a5d007b995274e6d808e60c9d4e22584'),('be6a4c3222e740f2b4ca5dc4265eb377','上传场地环境图片','/s/uploadPlaceEnvironment.action','POST','JSON','','{\"myTeamId\":\"10001\",\"img\":\"图片\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"7c1e31414f0e402ea5b312ede5688309\"}','{\"result\":\"11eddd677e8e414492e94011449fb4df\",\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e8d1b8996f89483589013a0669deca7a'),('c05bf841e4ee449a81bc7c011d06e970','获取跟单员列表','/s/listMerchandiser.action','POST','JSON','客户类型有\n\"personal\"(个体户)\n\"cooperation\"(合作农户)\n\"cooperative\"(合作社)\n\"dealer\"(经销商)','{\"myTeamId\":\"10001\",\"customerType\":\"personal\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"token\":\"227805d6ed1744a2a22906e8b6fa6cf6\"}','{\"result\":[{\"userId\":\"0420cb22c06b43a488c39967779eecec\",\"userImg\":\"\",\"userName\":\"王五\"},{\"userId\":\"528832fa9cc54d0290f6ee2922b27256\",\"userImg\":\"\",\"userName\":\"赵柳燕\"},{\"userId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"userImg\":\"\",\"userName\":\"王舞欣\"}],\"state\":1,\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\"}','f298278523b449a7ac84f58f6a4fdd81'),('c0e549cd48fa4679b5b50bf7f52131ae','获取销售点列表','/s/listBranch.action','POST','JSON','','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"pageNum\":\"1\",\"token\":\"fa074f561ecc4b2bbdc8e4783d9d90df\"}','{\"result\":[{\"departmentName\":\"业务部\",\"branchId\":\"9c5ef58ed0034a1c8dd885369ac3b97c\",\"branchName\":\"鹤山销售点\",\"managerName\":\"李思思\",\"managerPhone\":\"13311113333\"}],\"pageCount\":1,\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','c6a2b85d8be242c194af42841387059a'),('c1cc55d75ed24d47a9dd4f73bcbe8cbd','发起通用申请','/s/saveCommonApply.action','POST','JSON','','{\"beginDate\":\"1\",\"commonApplyApprove\":\"[{\\\"approveSequence\\\":\\\"1\\\",\\\"approveName\\\":\\\"王舞欣\\\",\\\"approveId\\\":\\\"5a27d0f892cd48a482622f8b76fd239c\\\"},{\\\"approveSequence\\\":\\\"2\\\",\\\"approveName\\\":\\\"李思思\\\",\\\"approveId\\\":\\\"9f6bc79d769342f1b90ed0b532b870f2\\\"}]\",\"myTeamId\":\"10001\",\"endDate\":\"1\",\"commonApplyImage\":\"[{\\\"imageId\\\":\\\"a3ad0592c5324e2b8f9fe46aa8047f31\\\"}]\",\"applyReason\":\"1\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"applyTitle\":\"1\",\"token\":\"1\"}','{\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','e4bd837de42f4c3fac48be13d6ad0b40'),('c31cf58828ec4aed93d7919181714038','获取商品详情','/s/findGoodsInfo.action','POST','JSON','','{\"myTeamId\":\"10001\",\"goodsId\":\"bae0a50f935248cfa03a0e0cbffd2dda\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"1\"}','{\"result\":{\"goodsAttr\":\"品牌?哼哼动保\",\"goodsCode\":\"S119\",\"goodsDescribe\":\"4fb2d3accff24ba4a9dec5d2a38e5b25|7bc2d9bfafc744c8a6ecabfb7c6e9ce2|7ea010df01dd4e88847daf5c3e3a5002|cb4e6691e9dc46b980576492cc5567d3|eedad265f3624c0eb2c6f9ac890989aa|\",\"goodsId\":\"bae0a50f935248cfa03a0e0cbffd2dda\",\"goodsName\":\"【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋\",\"goodsTypeId\":\"945ecca898284c2187ef6a5475a1363e\",\"imgList\":[{\"goodsImgType\":0,\"imageId\":\"35aa7507390f4ead9d64dc55cc2aa768\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/f4845d04353643989e87cb129e01670d.jpg\"},{\"goodsImgType\":0,\"imageId\":\"4ece06b76d3f42718722e37a92b44d0c\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/68ddd98e90124766a2847a338fe8c1d9.jpg\"},{\"goodsImgType\":0,\"imageId\":\"4fb2d3accff24ba4a9dec5d2a38e5b25\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/4bcc8080c171406c846d5fecbbf4ca7b.jpg\"},{\"goodsImgType\":0,\"imageId\":\"716e780e379142a5812587a4ba11387e\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/bc7d6b41762f43c89138dde1afedcf17.jpg\"},{\"goodsImgType\":0,\"imageId\":\"eedad265f3624c0eb2c6f9ac890989aa\",\"imagePath\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/c9f81702668c4a03ba920c2bdd3ec88b.jpg\"}],\"standardList\":[{\"standardCount\":0,\"standardId\":\"8e6aabae569e44ca80db3115372aa1a4\",\"standardName\":\"100g/袋\",\"standardPrice\":20.0,\"standardWeight\":100.0}]},\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','e2d7ca9f1bd144119c40cc5d29d3a846'),('c52b9536af934afba04226aae9f530e9','获取部门列表','/s/listVisitDepartment.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"b8900cceee344ee6877615d1abc2a89f\"}','{\"result\":[{\"departmentId\":\"4bc0ec2d68a444e7a584b9f8d03cbc44\",\"departmentName\":\"后勤部\"},{\"departmentId\":\"5a20e0ea32b948c08c928995b26af64e\",\"departmentName\":\"业务部\"},{\"departmentId\":\"9e8d946ef94b4795bd9218795354e631\",\"departmentName\":\"总经办\"},{\"departmentId\":\"dc89587b44ff4652b44f81da12589175\",\"departmentName\":\"财务部\"}],\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','773bf9c8af0c4721b5e444fe21abcda1'),('c665f4585fc5447e99a5a1598a05cff7','获取当销售点前库存盘点记录','/s/listCurrentRepertoryRecord.action','POST','JSON','','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"pageNum\":\"1\",\"token\":\"1\"}','{\"result\":[{\"recordId\":\"8cc618af34f24beaa2bcfd28a1862460\",\"branchId\":\"0f8ad87fcb564f358d287c39749362d4\",\"myTeamId\":\"10001\",\"recordList\":[{\"recordId\":\"8cc618af34f24beaa2bcfd28a1862460\",\"standardName\":\"10kg/袋\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"recordType\":1,\"currentCount\":3000,\"standardId\":\"4e3007c4db5d483bb9245743fa5c08eb\",\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"recordReason\":\"正常处理\",\"goodsType\":\"中猪料\",\"standardCount\":1000},{\"recordId\":\"8cc618af34f24beaa2bcfd28a1862460\",\"standardName\":\"20kg/袋\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"recordType\":1,\"currentCount\":3000,\"standardId\":\"e0841a5ee98a410c9f1fe4a786a6d6f0\",\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"recordReason\":\"正常处理\",\"goodsType\":\"中猪料\",\"standardCount\":2000}],\"branchName\":\"总经办\",\"recordCode\":\"201710119708\",\"recordRemark\":\"\",\"operatorId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"operatorName\":\"张三\",\"createDate\":1507686659000},{\"recordId\":\"d587612e94374da68152d7eeae64be0d\",\"branchId\":\"0f8ad87fcb564f358d287c39749362d4\",\"myTeamId\":\"10001\",\"recordList\":[{\"recordId\":\"d587612e94374da68152d7eeae64be0d\",\"standardName\":\"10kg/袋\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"recordType\":1,\"currentCount\":3000,\"standardId\":\"4e3007c4db5d483bb9245743fa5c08eb\",\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"recordReason\":\"正常处理\",\"goodsType\":\"中猪料\",\"standardCount\":1000},{\"recordId\":\"d587612e94374da68152d7eeae64be0d\",\"standardName\":\"20kg/袋\",\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"recordType\":1,\"currentCount\":3000,\"standardId\":\"e0841a5ee98a410c9f1fe4a786a6d6f0\",\"goodsImage\":\"112\",\"goodsCode\":\"D110\",\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\",\"recordReason\":\"正常处理\",\"goodsType\":\"中猪料\",\"standardCount\":2000}],\"branchName\":\"总经办\",\"recordCode\":\"201710212551\",\"recordRemark\":\"\",\"operatorId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"operatorName\":\"张三\",\"createDate\":1508557818000}],\"pageCount\":1,\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','1bef32e052414c69a3deeddecf49d806'),('c773ee64b481484cb433b0b814194fa0','获取用户角色','/user_listPermissionModel.action','POST','JSON','系统预设账号\no\n角色账号(手机号)密码\n超级管理员13688888888dggadmin\n业务员13311112222dggadmin\n业务主管  13311113333dggadmin\n财务员 13511113333dggadmin\n财务主管 13511112222dggadmin\n后勤人员 13211112222dggadmin\n后勤主管 13211113333dggadmin\n\n\npermissionType(角色代码)\no\n业务员salesman\n业务主管  salesman_manager\n财务员 finance\n财务主管 finance_manager\n后勤人员 logistics_status \n后勤主管 logistics_manager\n跟单员 follower','{\"myTeamId\":\"10001\",\"userId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"token\":\"37e1151e4d394618baff366ab3f5ec2a\"}','{\"result\":[{\"permissionType\":\"logistics_manager\"},{\"permissionType\":\"logistics\"},{\"permissionType\":\"follower\"}],\"state\":1,\"token\":\"afc5f8d65cf440a1b58a5f2295361fa01507604201402\"}','f25ca51efb3540d7b6fff3db575b0f19'),('c99027475df5435ab5fd62633351b207','修改农户','/s/updateFarmer.action','POST','JSON','','{\"myTeamId\":\"10001\",\"farmerId\":\"0792f791ab85422d8dc1bc92494bb877\",\"farmerPhone\":\"11012011211\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"612b92a0c685478fbe226dccea7cf1f5\"}','{\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','7f3efac49cba4219a4e3c7ba93263a47'),('cb7bea4706e4418d9892dc682b60c8cc','编辑运费模板','/s/updateFreightTemp.action','POST','JSON','','{\"myTeamId\":\"10001\",\"freightId\":\"394e6ec3b3e646e4ac775abe470806cc\",\"increasePrice\":\"660\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"freightName\":\"大大卡车\",\"token\":\"1\"}','{\"result\":1,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','4a9a8d91d40f4b5bb3a37bc532a6b982'),('ccbe4ccfa2a640bfa4d7f9650b0f1b73','生成订单','/user_saveMyOrder.action','POST','JSON','订单状态	\n		\n待财务审核A(转账)		90\n待财务审核B(月结、到付)		91\n待跟单审核		92\n待发货		101\n已发货		102\n财务A轮审核不通过		105\n财务B轮审核不通过		106\n订单关闭		107\n交易成功		108\n申请退款等待审核		120\n退款审核通过		121\n买家已退货		122\n商家已收到退货		123\n\n付款状态		\n\n已付款		111\n未付款		112\n\n支付方式		\n		\n转账		10\n月结		20\n到付		30','{\"userAddress\":\"133\",\"myTeamId\":\"10001\",\"buyerMessage\":\"12112\",\"freight\":\"1\",\"goods\":\"[{\\\"goodsId\\\":\\\"bae0a50f935248cfa03a0e0cbffd2dda\\\",\\\"standardId\\\":\\\"8e6aabae569e44ca80db3115372aa1a4\\\",\\\"goodsNum\\\":\\\"5\\\"}]\",\"userId\":\"0bb4b24df33948cfb68e61c1d5c1c75d\",\"token\":\"1\",\"paymentType\":\"10\"}','{\"result\":\"580e6b11712d481ba38b307bf47b6966\",\"state\":1,\"token\":\"41ca5302c6ff4e85819cbaceff1ee9e11508383995465\"}','0fc8955db566432b935607c7d1f962d2'),('cfa3c18f01d242a0ab91d684493a45dc','获取当前登录用户的个人信息','/user_findMyInfo.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"f4d833f80512494abf54edda99895e19\"}','{\"result\":{\"myTeamId\":\"10001\",\"myTeamName\":\"青麦科技\",\"positionId\":\"67c9a3c744e84905b125707785354396\",\"positionName\":\"负责人\",\"teamDepartmentId\":\"9e8d946ef94b4795bd9218795354e631\",\"teamDepartmentName\":\"总经办\",\"userAddress\":\"\",\"userArea\":\"\",\"userIdentity\":\"000000000000000000\",\"userImg\":\"/upload/img/user/head_portrait/89d9317fb3834353bcf2a507bee2eb82/165b159a27544fba89533d5d22adae7c.jpg\",\"userName\":\"张三\",\"userPhone\":\"13688888888\"},\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','05a6b344fa244892856d6113fafa824f'),('cff91a59858c422fa6c4f709b89e3603','获取养殖信息详情（新）','/s/getUserBreedJson.action','POST','JSON','','{\"myTeamId\":\"10001\",\"breedId\":\"1e4787a807fe4946820f143c4b2a25d9\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"5d7e1339d9794e47849941451a55ac47\"}','{\"result\":{\"breedAge\":0,\"breedCategory\":\"\",\"breedId\":\"1e4787a807fe4946820f143c4b2a25d9\",\"breedScale\":0,\"breedType\":\"\",\"breedVariety\":\"\",\"competitiveBrand\":\"\",\"createDate\":1508400021000,\"emptyShedNum\":0,\"femaleNum\":0,\"json\":\"{\\\"母体数量\\\":\\\"22\\\",\\\"养殖类目\\\":\\\"猪\\\",\\\"养殖类型\\\":\\\"商品养殖\\\",\\\"养殖品种\\\":\\\"内三元\\\",\\\"公体数量\\\":\\\"12\\\"}\",\"livestockNum\":0,\"maleNum\":0,\"obstetricTableNum\":0,\"shedNum\":0,\"userPlaceId\":\"b76ddc7446fa4e108ecaacc4a1d16bc7\"},\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','2902131e007c427a85387dc11cf15898'),('create_record','客户建档','/s/saveCustomerRecord.action','POST','JSON','客户评级有(0~5)级\no\n客户类型有\n\"personal\"(个体户)\n\"cooperation\"(合作农户)\n\"cooperative\"(合作社)\n\"dealer\"(经销商)','{\"userAddress\":\"鹤山市\",\"userSex\":\"男\",\"myTeamId\":\"10001\",\"customerType\":\"personal\",\"userPhone\":\"13598765678\",\"userName\":\"jackson\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"token\":\"86f4c0ef403345ce970223e961be63cf\"}','{\"result\":\"94a397ea0eae4632994108c02fe3b762\",\"state\":1,\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\"}','398da1cd89974535809862c823150653'),('d0b7608f5aca4a6baf1b57677fe4d5df','获取部门下成员列表','/s/findDepartmentMember.action','POST','JSON','','{\"myTeamId\":\"10001\",\"teamDepartmentId\":\"4bc0ec2d68a444e7a584b9f8d03cbc44\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"76d6972235284f64903cbe6335aaadac\"}','{\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\",\"result\":[{\"memberId\":\"0420cb22c06b43a488c39967779eecec\",\"userName\":\"王五\",\"userPhone\":\"13211112222\",\"userSex\":\"男\",\"userImg\":\"\",\"myTeamId\":null,\"myTeamName\":\"青麦科技\",\"teamDepartmentId\":null,\"departmentName\":\"后勤部\",\"positionName\":\"后勤人员\",\"userIdentity\":\"101010101020202020\"},{\"memberId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"userName\":\"王舞欣\",\"userPhone\":\"13211113333\",\"userSex\":\"女\",\"userImg\":\"\",\"myTeamId\":null,\"myTeamName\":\"青麦科技\",\"teamDepartmentId\":null,\"departmentName\":\"后勤部\",\"positionName\":\"后勤主管\",\"userIdentity\":\"101010101020202020\"}]}','2aa8bd982bef40469246fbb09f74d916'),('d2e72fe6a0ba495fad4c2160f20ab73e','冻结客户','/s/updateCustomerFreeze.action','POST','JSON','','{\"myTeamId\":\"10001\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"3b2f4cbea4b24071834152cebb6f1d9f\"}','{\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','398da1cd89974535809862c823150653'),('d4b77a8966c74d4a9b7fad1e9905b6cd','添加收货地址','/user_addMyAddress.action','POST','JSON','','{\"userAddress\":\"283.029,78.29\",\"myTeamId\":\"10001\",\"userPhone\":\"13688885526\",\"userAddressDefault\":\"1\",\"userName\":\"张三\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"userArea\":\"鹤山市\",\"token\":\"1f33aa97d2274714b8ee2300a2b9cc3e\"}','{\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\",\"result\":null}','05a6b344fa244892856d6113fafa824f'),('d4c12774a2e34da6ae5108b1ed19e25c','添加经营单位','/s/saveManageUnit.action','POST','JSON','','{\"myTeamId\":\"10001\",\"manageType\":\"猪,鱼,\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"manageName\":\"鹤山经营部\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"fed24685d64e4d228c7dd5a1057d2432\"}','{\"result\":\"b45725e4bea3434f90720251711376b0\",\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','a5d007b995274e6d808e60c9d4e22584'),('d757445966794da48bd9fae543d6debb','获取部门下的成员列表','/s/listVisitMember.action','POST','JSON','','{\"myTeamId\":\"10001\",\"departmentId\":\"4bc0ec2d68a444e7a584b9f8d03cbc44\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"7c0e0557f736439eb892ade9cb579e57\"}','{\"result\":[{\"memberId\":\"0420cb22c06b43a488c39967779eecec\",\"userName\":\"王五\"},{\"memberId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"userName\":\"王舞欣\"}],\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','773bf9c8af0c4721b5e444fe21abcda1'),('d94c8d7250784df58360ab333fb2e4ed','验证短信验证码','/retrievePasswordVerify.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userPhone\":\"13597165115\",\"verify\":\"1356\"}','{\"state\":2,\"token\":null,\"result\":null}','03f3f8250a1d441aa092232ee6c91a4d'),('dd396d0d9dab416bb07bfc29b5b0e608','获取运费模板列表(商家)','/s/listFreightTemp.action','POST','JSON','','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"pageNum\":\"1\",\"token\":\"1\"}','{\"result\":[{\"startPrice\":40.0,\"startRange\":30.0,\"myTeamId\":\"10001\",\"freightId\":\"394e6ec3b3e646e4ac775abe470806cc\",\"increaseRange\":50.0,\"weightAllowance\":20.0,\"increasePrice\":60.0,\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"freightName\":\"大卡车\"},{\"startPrice\":600.0,\"startRange\":65.0,\"myTeamId\":\"10001\",\"freightId\":\"a9dbba21bdcb4100968e8bd000878bae\",\"increaseRange\":62.0,\"weightAllowance\":65.0,\"increasePrice\":60.0,\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"freightName\":\"小卡车\"}],\"pageCount\":1,\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','4a9a8d91d40f4b5bb3a37bc532a6b982'),('ddd54c231a964cb9ae4ed58da6e9a06b','发起激活','/register.action','POST','JSON','','{\"userPassword\":\"699c167824a5f8caf7f0d0893da73e75\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\"}','{\"result\":{\"myTeamId\":\"10001\",\"userImg\":\"123\",\"userPassword\":\"825682eafec59c2e1632828195133a52\",\"userStatus\":\"u_st_2\",\"roleId\":\"1001\",\"departmentId\":\"\",\"userPhone\":\"13677779999\",\"userName\":\"jackson\",\"userArea\":\"\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\",\"realName\":\"2\"},\"state\":1,\"token\":\"\"}','d68ae3cef71d47a8aa4ed8cf50724239'),('deaa839f56ce4323a46687a284f4502c','上传证明图片','/s/saveAssistImage.action','POST','JSON','','{\"myTeamId\":\"10001\",\"img\":\"图片\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"f55df7e2fc954688a53417a4a18156ab\"}','{\"result\":\"85bec1897c8e4abcb7faed0e1e3c88d9\",\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','86ff4b4396514203bab501fc6e7ae067'),('df2341d553fb4ca6aa2fbfcff7ee09d6','解冻客户','/s/updateCustomerUnfreeze.action','POST','JSON','','{\"myTeamId\":\"10001\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"0e8d4b6e691d45d1b41d654fb285f004\"}','{\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','398da1cd89974535809862c823150653'),('dff21b9976f64f9c9ed1fff39d9a9d1b','修改客户','/s/updateCustomer.action','POST','JSON','','{\"userSex\":\"女\",\"myTeamId\":\"10001\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"userName\":\"alisa\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"token\":\"559c82685ff84dd68be6e309ba884cb0\"}','{\"state\":1,\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\"}','398da1cd89974535809862c823150653'),('e382083c97824a95a707e7459b6df1e2','申请人获取建账申请列表','/s/listCustomerAccountByProposer.action','POST','JSON','','{\"myTeamId\":\"10001\",\"userId\":\"03ef5797bae2466699d5efc970a8962f\",\"token\":\"69da1a96ae58429d9e28c3196e6dc115\"}','{\"result\":[{\"checkerId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"checkerName\":\"李思思\",\"createDate\":1507737600000,\"customerId\":\"43a3f72f83d14b498e117f9be76e8d4f\",\"customerName\":\"jackson\",\"merchandiserId\":\"03ef5797bae2466699d5efc970a8962f\",\"merchandiserName\":\"李四\",\"proposerId\":\"03ef5797bae2466699d5efc970a8962f\",\"proposerName\":\"李四\",\"requestId\":\"320cd46e93004f12890dba46bf0d2a4d\",\"requestReason\":\"loginInfo\",\"requestStatus\":2},{\"checkerId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"checkerName\":\"李思思\",\"createDate\":1508342400000,\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"customerName\":\"alisa\",\"merchandiserId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"merchandiserName\":\"王舞欣\",\"proposerId\":\"03ef5797bae2466699d5efc970a8962f\",\"proposerName\":\"李四\",\"requestId\":\"7c2c30d5d1ef49289f10f21de4e1ed5e\",\"requestReason\":\"啊\",\"requestStatus\":1}],\"state\":1,\"token\":\"acbb4ca124d743479f8aa68af04c91561507604181998\"}','f298278523b449a7ac84f58f6a4fdd81'),('e8011104748b4c9ba593c6396b0f5d97','上传订单凭证','/user_saveOrderProof.action','POST','JSON','','{\"myTeamId\":\"10001\",\"img\":\"图片\",\"orderId\":\"580e6b11712d481ba38b307bf47b6966\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"405306ced237428b8401daedd6baed86\"}','{\"result\":\"/upload/img/user/order_proof/9f6bc79d769342f1b90ed0b532b870f2/359bb432377840cd9556b17bbe4724ef.jpg\",\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','2cc520f7d1f348a485bb59e12aa6aefb'),('eb5031f8711d446bb21b26afd81ca155','获取当前销售点库存申请列表','/s/listCurrentRepertoryApply.action','POST','JSON','开始时间 和 结束时间 必须同时填或同时不填\n\n申请状态(applyStatus)		\n待审核		10\n已通过(已发货)		11\n已签收		12','{\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"pageNum\":\"1\",\"token\":\"1\"}','{\"result\":[{\"acceptDate\":1508568923000,\"branchId\":\"0f3965187f1d4bbf963453b7a2ae0b20\",\"myTeamId\":\"10001\",\"approverId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"applyList\":[{\"applyId\":\"6f2688117af64bff81edd3994314c225\",\"standardName\":\"100g/袋\",\"goodsId\":\"bae0a50f935248cfa03a0e0cbffd2dda\",\"currentCount\":502,\"standardId\":\"8e6aabae569e44ca80db3115372aa1a4\",\"goodsImage\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/f4845d04353643989e87cb129e01670d.jpg\",\"goodsCode\":\"S119\",\"goodsName\":\"【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋\",\"goodsType\":\"兽药大礼包\",\"standardCount\":10}],\"branchName\":\"鹤山销售点\",\"proposerId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"approverName\":\"王舞欣\",\"applyId\":\"6f2688117af64bff81edd3994314c225\",\"proposerName\":\"李思思\",\"applyRemark\":\"备注\",\"applyCode\":\"201710214126\",\"applyStatus\":12,\"createDate\":1508568026000}],\"pageCount\":1,\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','3a9bb3d99734486ba7fe0ab5330eb869'),('eb7654c6d8a742df8ee395aa480b8471','获取客户详情','/s/getCustomer.action','POST','JSON','客户评级有(0~5)级\no\n客户类型有\n\"personal\"(个体户)\n\"cooperation\"(合作农户)\n\"cooperative\"(合作社)\n\"dealer\"(经销商)','{\"myTeamId\":\"10001\",\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"token\":\"5664ab7f2e2d417092960c85d75fba20\"}','{\"result\":{\"businessAddress\":\"\",\"creditRating\":0,\"customerId\":\"94a397ea0eae4632994108c02fe3b762\",\"customerType\":\"personal\",\"hadAccount\":0,\"station\":\"\",\"updateCount\":1,\"userAddress\":\"鹤山市\",\"userBirthday\":\"\",\"userCardBack\":\"\",\"userCardFront\":\"\",\"userCardHand\":\"\",\"userCreateDate\":1508316332000,\"userImg\":\"\",\"userName\":\"alisa\",\"userPhone\":\"13598765678\",\"userSex\":\"女\",\"userUpdateTime\":1508318292000},\"state\":1,\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\"}','398da1cd89974535809862c823150653'),('efb30bffe5f0486891168d78172cc3aa','根据手机号或用户名搜索用户','/s/findMemberByNameOrPhone.action','POST','JSON','手机号要输入完整才能搜索出结果，用户名支持模糊搜索','{\"myTeamId\":\"10001\",\"userName\":\"李\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"token\":\"150b8a28e8cb4719bc74289544ce6764\"}','{\"result\":[{\"departmentName\":\"业务部\",\"memberId\":\"03ef5797bae2466699d5efc970a8962f\",\"myTeamName\":\"青麦科技\",\"positionName\":\"业务员\",\"userImg\":\"\",\"userName\":\"李四\",\"userPhone\":\"13311112222\",\"userSex\":\"男\"},{\"departmentName\":\"业务部\",\"memberId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"myTeamName\":\"青麦科技\",\"positionName\":\"业务主管\",\"userImg\":\"\",\"userName\":\"李思思\",\"userPhone\":\"13311113333\",\"userSex\":\"女\"}],\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','2cc520f7d1f348a485bb59e12aa6aefb'),('effed0a8136448188cd3e23073f8562c','获取进仓单列表','/s/listRepertoryIncome.action','POST','JSON','','{\"branchId\":\"0f8ad87fcb564f358d287c39749362d4\",\"myTeamId\":\"10001\",\"pageSize\":\"10\",\"userId\":\"89d9317fb3834353bcf2a507bee2eb82\",\"pageNum\":\"1\",\"token\":\"1\"}','{\"result\":[{\"recordId\":\"d99e5e828ef142a39feda16a724c3119\",\"branchId\":\"0f8ad87fcb564f358d287c39749362d4\",\"myTeamId\":\"10001\",\"incomeList\":[{\"recordId\":\"d99e5e828ef142a39feda16a724c3119\",\"standardName\":\"100g/袋\",\"goodsId\":\"bae0a50f935248cfa03a0e0cbffd2dda\",\"currentCount\":502,\"standardId\":\"8e6aabae569e44ca80db3115372aa1a4\",\"goodsImage\":\"/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/f4845d04353643989e87cb129e01670d.jpg\",\"goodsCode\":\"S119\",\"goodsName\":\"【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋\",\"goodsType\":\"兽药大礼包\",\"standardCount\":256}],\"branchName\":\"总经办\",\"recordCode\":\"201710218860\",\"recordRemark\":\"\",\"operatorId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"operatorName\":\"王舞欣\",\"createDate\":1508569871000}],\"pageCount\":1,\"state\":1,\"token\":\"da8990b107b84cf980035927cce112721507599537351\"}','9b9ab57e6150419ba468cdfc82f22477'),('f18e2df131ca433fb9629dad194ac600','搜索商品','/user_findGoodsByKeyword.action','POST','JSON','排序方式有\no\n升序asc\n降序desc\n\n\n排序类型有\no\n商品价格goodsPrice\n商品销量goodsSales','{\"myTeamId\":\"10001\",\"orderBy\":\"goodsSales\",\"pageSize\":\"10\",\"keyword\":\"畅消\",\"userId\":\"d88e28c3a0e6429f9f1d03ad99fabc61\",\"pageNum\":\"1\",\"token\":\"dcaa8566984742e582666d1f4a9f4cdd\"}','{\"result\":[{\"goodsId\":\"f0c3df5bdb0a45aabf22464bb27dbb88\",\"goodsImages\":\"112\",\"goodsSales\":0,\"goodsPrice\":20.0,\"goodsName\":\"【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG\"}],\"pageCount\":1,\"state\":1,\"token\":\"b2df6b4677144c4188e915f7d87a10831508230750529\"}','6d186aa139c74f7185eb0b132905dee8'),('f673c263a8e34933bb7b1ea1e9c011e6','同意申请','/s/updateRepertoryApplyAccept.action','POST','JSON','','{\"applyId\":\"6f2688117af64bff81edd3994314c225\",\"myTeamId\":\"10001\",\"userId\":\"5a27d0f892cd48a482622f8b76fd239c\",\"token\":\"7908bfeb4a46477c960b11d18ad92353\"}','{\"state\":1,\"token\":\"afc5f8d65cf440a1b58a5f2295361fa01507604201402\"}','3a9bb3d99734486ba7fe0ab5330eb869'),('f830bdc2357242e991992b6a2f9f3476','获取图片','/s/getVisitIDCard.action','POST','JSON','','','','773bf9c8af0c4721b5e444fe21abcda1'),('fdfb3ca5b15b4ed3b93550f45d5ad710','获取建账申请详情','/s/getCustomerAccount.action','POST','JSON','','{\"myTeamId\":\"10001\",\"requestId\":\"320cd46e93004f12890dba46bf0d2a4d\",\"userId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"token\":\"6e04d06c7c0e4156943f011065747e86\"}','{\"result\":{\"checkerId\":\"9f6bc79d769342f1b90ed0b532b870f2\",\"checkerName\":\"李思思\",\"createDate\":1507737600000,\"customerId\":\"43a3f72f83d14b498e117f9be76e8d4f\",\"customerName\":\"jackson\",\"merchandiserId\":\"03ef5797bae2466699d5efc970a8962f\",\"merchandiserName\":\"李四\",\"proposerId\":\"03ef5797bae2466699d5efc970a8962f\",\"proposerName\":\"李四\",\"requestId\":\"320cd46e93004f12890dba46bf0d2a4d\",\"requestStatus\":2},\"state\":1,\"token\":\"c918451b778c44dc8ffcf7b7f6bb65621507604205889\"}','f298278523b449a7ac84f58f6a4fdd81');
/*!40000 ALTER TABLE `interface_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface_request`
--

DROP TABLE IF EXISTS `interface_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface_request` (
  `request_id` varchar(35) NOT NULL,
  `request_name` varchar(35) NOT NULL,
  `request_type` varchar(10) NOT NULL,
  `request_must` varchar(2) NOT NULL,
  `request_text` varchar(255) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `info_id` varchar(35) NOT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface_request`
--

LOCK TABLES `interface_request` WRITE;
/*!40000 ALTER TABLE `interface_request` DISABLE KEYS */;
INSERT INTO `interface_request` VALUES ('0023eba313774750b9eaf3d0c688245b','path','String','是','图片路径',3,'f830bdc2357242e991992b6a2f9f3476'),('02d9309c2ae04a2a91a085619e2e4acb','token','String','是','令牌',1,'4a4cfc3d2e9d467ea8ffc0077745238f'),('03153f65fc15441894659995ced145a5','customerId','String','是','客户Id',3,'75b48036547c4d5390172b21a4491e93'),('04b429784e8c406fb9bb45ae5d80ff1a','selectId','String','是','对应类目选项Id',3,'77030f6cf1bd4572b9718d6f109add9a'),('04ef1ee1671f4fa386f9782fff96020d','token','String','是','令牌',2,'6414f8e5d33f4a93a7793df1459a90cb'),('0628d044d416490098b4ca0025ed7dea','userId','String','是','当前登录用户Id',0,'3315be9003d7486db2ee1d4761a4455b'),('0651b32b71d44cd79466ad720d44084f','userId','String','是','当前登录用户Id',0,'af4194226ffb4608b0bd9771b1d90254'),('06c59d5b94ed436a8d70dd5fd066f477','pageSize','Integer','是','每页显示数量',4,'af4194226ffb4608b0bd9771b1d90254'),('082cd00a85d8440c9f3956406e15bb7d','myTeamId','String','是','企业码',2,'1b59b7d653454aedac39344693f7a027'),('08495212836344aa8c511f804e9248fb','deviceToken','String','是','友盟设备token',3,'ae90901e86b7472899c20756136e7cc8'),('0867472c8f1e4dbe88c3f6076b141f10','userId','String','是','当前登录用户Id',0,'c05bf841e4ee449a81bc7c011d06e970'),('08c1e65415aa4eb5965646cf3d21051d','merchandiserName','String','是','跟单员姓名',6,'b5a03ad641ba4dd7b3a8124d8bab42e5'),('091ec9bdd3bc44c0ad94bf9d71d5438c','typeId','String','是','类目Id',3,'6a8b2e211bdb4ab8a990af919abb5f2b'),('099adca32de9437889d2d82a07366565','myTeamId','String','是','企业码',2,'d757445966794da48bd9fae543d6debb'),('0b06b48743c84f5ca761c9681200dc46','userId','String','是','当前登录用户Id',0,'2c9a1b2c5e234a39b6363cf88ef3701b'),('0b2a7c3190f942f18eb4dc83904fab63','repertoryType','Integer','是','库存等级，一级库存为\"1\"，二级库存为\"2\"',4,'97b9990fc5124331b6f761cd267dc772'),('0c254edb2c95460a8846c9644f900291','pageSize','Integer','是','每页显示数量',5,'75b48036547c4d5390172b21a4491e93'),('0c9155c3e4344af0af70c1438f3d971a','token','String','是','令牌',1,'be6a4c3222e740f2b4ca5dc4265eb377'),('0d85dd91be6743719d4c4e695621973e','myTeamId','String','是','企业码',2,'7d13aacf67af4ba9abe1b9f6733a9919'),('0da1fa86ab0e46f392a2592c5b906316','imgId','String','是','图片Id',3,'6bba4f0169234ce1b1cacb2c0d1ffe23'),('0de128166a914212903b37fc622c90cd','customerId','String','是','客户Id',3,'df2341d553fb4ca6aa2fbfcff7ee09d6'),('0e1962000ae74f568ffc0523fac0c26a','userId','String','是','当前登录用户Id',0,'b438e782f0444b07b3ee397bc309bc7c'),('0ea6d7d4ee2e4a4e960d0788b88aa930','userId','String','是','当前登录用户Id',0,'7e995923923742a3bcf111287845011f'),('0f1e98c12230457a9155327d15937f9b','userId','String','是','当前登录用户Id',0,'72ffcee59d9140cca65868e7e95ead29'),('0f1f5af063d24375b37c154f035c3eeb','token','String','是','令牌',1,'9f3bef34a9ea46afb8fba1515490efaf'),('0f3a86fd67cf4f50ad54f6980a3dfbda','followDate','String','是','跟进时间',6,'5ea6c6c4ba9646ceaf6d876845f90430'),('0f8f232cdeaf43f2a1ad88f15c689203','station','String','否','从事岗位',11,'dff21b9976f64f9c9ed1fff39d9a9d1b'),('0feed5aae8cd403299529b5b9c874d78','token','String','是','令牌',1,'4009414df88f4c60a0f3854838c9e619'),('1057b48f31b54532b76689134f1bfd86','myTeamId','String','是','企业码',2,'c05bf841e4ee449a81bc7c011d06e970'),('11214813229744d09fd0f369364e2e33','token','String','是','令牌',1,'72ad114d06fe4812bae7dd4449b89971'),('116d00737e894b479172785dd3ae7e29','userPlaceType','String','否','场地类型',6,'56095eba55614987bf9945dd3d69566f'),('1201c777454b437e85876ab2cbe432f3','keyword','String','是','搜索关键字',3,'f18e2df131ca433fb9629dad194ac600'),('120c6a46067644c28ecf4df8ee41d656','customerId','String','是','客户Id',3,'7d13aacf67af4ba9abe1b9f6733a9919'),('1251c03abbe2470bb4c6704b869b64a5','token','String','是','令牌',1,'c52b9536af934afba04226aae9f530e9'),('13054c2eec34448b9d203535a513e8eb','myTeamId','String','是','企业码',2,'199830f70dcc47c2946b69656a3ca65d'),('133006f0ddf94117be1dd5a816a64729','token','String','是','令牌',1,'72ffcee59d9140cca65868e7e95ead29'),('1347f0c34c5e4079b46f5efc801a6218','userId','String','是','当前登录用户Id',0,'13a33a322fe844a7bcd481664b367f1c'),('136b7408cf634075b3b8f58798946e44','breedId','String','是','养殖信息Id',3,'2d9196ddb2024b9581bfcb510fb2cce5'),('1394036878bf46d98a529b151bd3e626','myTeamId','String','是','企业码',2,'3315be9003d7486db2ee1d4761a4455b'),('13ceef1e40da43d89528b9b46768bd3b','token','String','是','令牌',1,'6bba4f0169234ce1b1cacb2c0d1ffe23'),('14267979e5104c7ba1b5b9f43e602a45','customer','String','是','关联客户(json数组字符串)',5,'23e911701b1a49b58abf7b099e154c9c'),('14dca38ac39b49b09ec02f4542fc041e','myTeamId','String','是','企业码',2,'c52b9536af934afba04226aae9f530e9'),('14f84d9406054cf4a27d6b676827f793','token','String','是','令牌',1,'be58dab447ee4d84b517846e1bc1372c'),('150be2923aa04ba086e3b956e2bfae8f','token','String','是','令牌',1,'1dd677ec548443b08eb3d5611f17a3ae'),('153f7802571b46d88ff71b439f2e55a1','userId','String','是','当前登录用户Id',0,'cfa3c18f01d242a0ab91d684493a45dc'),('158c57f77c7f447d95837b088fc849d0','userBirthday','String','否','出生年月	出生年月	出生年月',5,'0d0b67f8b5e447efbbe49115c41f5bb7'),('15afdfb5f8e443ae97023e86338ae47f','standardId','String','是','规格Id',5,'b7ebc400c4244282b50cb53016719fa8'),('15ccbe92f17a4fc0b6c52cb168bceeb7','cardFront','File','是','正面照片',3,'6414f8e5d33f4a93a7793df1459a90cb'),('163aa160801047b9920e3d0c08a6d712','userPlaceId','String','是','场地Id',3,'b01576d116e743e398c4237c9c1b4bcb'),('18d5e583cb3c4acebaeab3787f9d662e','businessAddress','String','否','经营地址 客户类型为合作社时传输',10,'0d0b67f8b5e447efbbe49115c41f5bb7'),('19298225ed63478cb57038bb84c3a232','userPlaceId','String','是','场地Id',3,'7dd5837b04d5432391976e8824ce5896'),('1a4b00f808b6480093c43449d4aab6c4','customerId','String','是','客户Id',3,'4bdc5ca52ef749829ba4bf281f397be2'),('1a938f2c88a64d22a568a4f6c96434b8','userId','String','是','用户Id',0,'10ee376f64a7404d8f24c453401dc335'),('1a9a2e25da1445bfbc0c6560b6c9c52f','token','String','是','令牌',1,'cfa3c18f01d242a0ab91d684493a45dc'),('1acfd17697a840458d697d72c199ea09','myTeamId','String','是','企业码',2,'2ba65c8300dd4fa48aabfd849a5efb80'),('1afdeeb879954391acb56dc7d764fc93','token','String','是','',1,'68b03974db434ab3bdd09d04dead9d6b'),('1b366bed8c6a4bf3b8643c9ae39dd2b6','customerId','String','是','客户Id',3,'72ffcee59d9140cca65868e7e95ead29'),('1c83f676c44041cf92357f2e6f300636','token','String','是','令牌',1,'56095eba55614987bf9945dd3d69566f'),('1ca0d7da05b847b68f785f53a7e6f37c','userId','String','是','当前登录用户Id',0,'610442c7ecc34b46a419a919e2c78126'),('1cc087395fca4a108d8a7a3147a306b7','pageSize','String','是','每页显示数量',5,'489a8428ee114557a34ab2cbb8be70a2'),('1cf6f1254ae4448e8255239e308254fd','userId','String','是','当前登录用户Id',0,'ccbe4ccfa2a640bfa4d7f9650b0f1b73'),('1d8e14f1899a41eda4d75950f10414fa','userId','String','是','当前登录用户Id',0,'5ea6c6c4ba9646ceaf6d876845f90430'),('1e4388424f4c4637b70672bb4310a7e6','token','String','是','令牌',2,'10ee376f64a7404d8f24c453401dc335'),('1e613fe94dab4b6581763423ba20ba93','userName','String','是','协助者名称',10,'23e911701b1a49b58abf7b099e154c9c'),('1e89d2dbde8e47dca905d71d3e86f653','customerName','String','是','客户名称',4,'5ea6c6c4ba9646ceaf6d876845f90430'),('1f20578f31c148f7a2d3ed345f313848','pageNum','Integer','是','页数',4,'75b48036547c4d5390172b21a4491e93'),('1fa08df2b1684b75a55c2bc552fe78a6','myTeamId','String','是','企业码',2,'deaa839f56ce4323a46687a284f4502c'),('2088020bee204c3794c088704659da38','pageNum','Integer','是','页数',6,'f18e2df131ca433fb9629dad194ac600'),('20a2b834019f47088abd5529c69ff5d0','myTeamId','String','是','企业码',2,'b01576d116e743e398c4237c9c1b4bcb'),('20eac414c0934b20acf2b9f91fa75f70','token','String','是','令牌',1,'b8995f0262e64652ba85a136b3cb24c6'),('210d421aa14c435b849c2247dc2c50cf','userId','String','是','当前登录用户Id',0,'1b85812f0be9490a84657a03500b4008'),('21b16c72b8e34caf90a4bc5744ac1cbb','applyId','String','是','申请的Id',3,'93c6a85d73cc4b3f9071f60445ba0eb1'),('222a634f1e844327adfd0e5ed2cebedd','myTeamId','String','是','企业码',2,'d2e72fe6a0ba495fad4c2160f20ab73e'),('23ffb5652484481c873bddefdc7ba2be','pageSize','Integer','是','',5,'68b03974db434ab3bdd09d04dead9d6b'),('2434c809a0da42f49a0f5948264e1062','token','String','是','令牌',1,'45f3e927c45b4447b74d59a728e807b5'),('24961e53e52941d88ef03791955ae2be','userAddress','String','否','住址',6,'0d0b67f8b5e447efbbe49115c41f5bb7'),('25001432dfc24399aedc208e92e6bfd5','myTeamId','String','是','企业码',2,'2c54c4e68d0844b48b12f78af93783dc'),('2502c65382c64b8080620713881f402b','customerId','String','是','客户Id',3,'b438e782f0444b07b3ee397bc309bc7c'),('26acb7f0b6ed437b838c3684d11d94d8','token','String','是','令牌',1,'0d0b67f8b5e447efbbe49115c41f5bb7'),('26c08a21da5649dd84a59322f9850357','token','String','是','令牌',1,'365177c2935b4857aa6e39362cfb3694'),('26d289982fbc46c1879e1df59d16e0ea','pageNum','Integer','是','页数',3,'b501882d44af4ad7b8bdb9ae48149acc'),('27f14f267ce34e8bbcc96bf93327be35','myTeamId','String','是','企业码',2,'fdfb3ca5b15b4ed3b93550f45d5ad710'),('282d29c12e894e06a285c0a70a70285c','myTeamId','String','是','企业码',2,'c99027475df5435ab5fd62633351b207'),('2893cf52027a4f9e8fb0e33843244b6e','token','String','是','令牌',1,'68feadadea904d6fa18c17aec18c98a7'),('290a5897b647472187cb6bc51e91f7c4','token','String','是','令牌',1,'4bdc5ca52ef749829ba4bf281f397be2'),('29668108f0604a0781c902971adb9c3e','pageSize','Integer','是','每页显示数量',5,'4bdc5ca52ef749829ba4bf281f397be2'),('29bedd0ad5b34af38a7397d84fc9b7ea','merchandiserId','String','是','跟单员的用户Id',5,'b5a03ad641ba4dd7b3a8124d8bab42e5'),('29ecb2fa1b4b47aa9530dcfbc8a872c9','pageNum','String','是','页数',4,'489a8428ee114557a34ab2cbb8be70a2'),('2a5dc2db4d944eadbcd6320f9f179e1d','userId','String','是','当前登录用户Id',0,'49624057be4445559f93489bb2cccee4'),('2ac9ff1dc6b743a08a1a938485fd7fa4','token','String','是','令牌',1,'1b85812f0be9490a84657a03500b4008'),('2c9960400a5f40fa8dd1a1ee7e4e0849','myTeamId','String','是','企业码',2,'87ee0eceaa3348a99c72b16f6bb44afb'),('2d36fb4e624a41468cb4526a7b095b59','contacts','String','是','联系人',1,'7dc5d9e986904416a376065e7134bcd7'),('2d981bcadb2f4bc495d8733e6bf00764','userId','String','是','当前登录用户Id',0,'94a4b4adbeed48aca99267235d97781b'),('2dc7bdee04904c4eb53a155af2b945bc','customerId','String','是','客户Id',6,'23e911701b1a49b58abf7b099e154c9c'),('2dee907f83f74121af10897660d2100c','userId','String','是','当前登录用户Id',0,'5097f0bc6f10496f8783965acc53b8a5'),('2f0d0e354bee49cba161f3a4463bb157','myTeamId','String','是','企业码',2,'2dd479f0086942689837f2ca54852d34'),('2fe42c1fcc64403da2056ce163282d62','token','String','是','令牌',1,'7e995923923742a3bcf111287845011f'),('310c99ed5bb742948299a104e56fd0ab','myTeamId','String','是','企业码',2,'b438e782f0444b07b3ee397bc309bc7c'),('31400b2cb6024fe8a002726dc9450f2d','myTeamId','String','是','企业码',2,'6db79ab903874e559cf799c0c5194be5'),('32912f3e11294b10bfb94565addf167e','userId','String','是','当前登录用户Id',0,'199830f70dcc47c2946b69656a3ca65d'),('32c795bb75524fd0ae730647313be28e','customerId','String','是','客户Id',3,'689bc97709b949019ab4e381744e0639'),('333b0b0bf88049cd870c81bf0fb4fbd6','myTeamId','String','是','企业码',2,'f18e2df131ca433fb9629dad194ac600'),('339893181b8a460a97ea708c8edba4dc','customerType','String','是','客户类型',3,'97b9990fc5124331b6f761cd267dc772'),('33ac09a0de684f98810d77e0d00ee87c','userId','String','是','当前登录用户Id',0,'0d0b67f8b5e447efbbe49115c41f5bb7'),('3412ca151e2e4d77a440507346d11076','myTeamId','String','是','企业码',2,'77030f6cf1bd4572b9718d6f109add9a'),('34213e80fdc44196bd9b21b46958358e','myTeamId','String','是','企业码',2,'b5a03ad641ba4dd7b3a8124d8bab42e5'),('3504560ed3ec4a2db84ac5ff45f12ba9','customerType','String','是','客户类型',3,'c05bf841e4ee449a81bc7c011d06e970'),('3547acfd1d1941ba9e45467327bc09e3','myTeamId','String','是','企业码',1,'9a14b37330e54b38abadd056f18d10fe'),('355bd3c67ab24bd08bf64eb749d860e3','userId','String','是','当前登录用户Id',0,'701aae07c8d94171a5d4fe8cf0622511'),('3654422f078f42e892ef6acbb62c38d9','myTeamId','String','是','企业码',2,'7e995923923742a3bcf111287845011f'),('3658adf71ef447b0b72e8652e05c72e7','userAddressId','String','是','收货地址Id',3,'87ee0eceaa3348a99c72b16f6bb44afb'),('366acfe2571943148572016cc4a99140','userId','String','是','当前登录用户Id',0,'d2e72fe6a0ba495fad4c2160f20ab73e'),('3702b84bede647d1bd9db9084a15e34a','userPlaceId','String','是','场地Id或农户经验Id',3,'163325edc6ab4e32afb3b189bdfe68d2'),('3742f41178134eb39b5dd0f683933cf0','userId','String','是','当前登录用户Id',0,'fdfb3ca5b15b4ed3b93550f45d5ad710'),('37479692ab384e269e4bf44cd66376fd','img','String','是','图片',3,'be6a4c3222e740f2b4ca5dc4265eb377'),('397591fbe1c6449bb4818e76a62aa0d4','myTeamId','String','是','企业码',1,'d94c8d7250784df58360ab333fb2e4ed'),('3a3a13dabe2a4271bd10bade6398c571','userId','String','是','当前登录用户Id',0,'912a22a6fd734458ba1d56ae39b4cde9'),('3a62ae5c72e440a694b29d17362dcd85','myTeamId','String','是','企业码',1,'b501882d44af4ad7b8bdb9ae48149acc'),('3a635471f5044c08a41ff6cab9c85234','myTeamId','String','是','企业码',2,'7dd5837b04d5432391976e8824ce5896'),('3aff3969d3f6491caf001b2b022c1b2a','manageType','String','否','经营类目（多个用逗号\",\"分隔）',6,'d4c12774a2e34da6ae5108b1ed19e25c'),('3b67d3a4922341fdbd1bbed0cc2dd5a2','userSex','String','否','性别',7,'0d0b67f8b5e447efbbe49115c41f5bb7'),('3b8c02cd9eb440cfb78e6fcf22dd3b3e','myTeamId','String','是','企业码',2,'ccbe4ccfa2a640bfa4d7f9650b0f1b73'),('3c05338192554bf5970713e7a07c58d7','myTeamId','String','是','企业码',2,'2c9a1b2c5e234a39b6363cf88ef3701b'),('3c47c44949584e88b1b6a71f970090e7','myTeamId','String','是','企业码',2,'015b1e3ea6a24a65ba6bfbb9284d8f30'),('3c5c48318bfc4c08833bf52ba9a9ffdf','followContent','String','否','跟进内容',7,'5ea6c6c4ba9646ceaf6d876845f90430'),('3cd08c8215cb40f38527ce035344a4bc','userArea','String','是','收货地址',5,'d4b77a8966c74d4a9b7fad1e9905b6cd'),('3cedcfdb0ad34b10b49237e6cf20c8cc','userId','String','是','当前登录用户Id',0,'d4b77a8966c74d4a9b7fad1e9905b6cd'),('3cf4a462064d481eb218f69dc126bc8d','image','String','否','image(json数组字符串)',12,'23e911701b1a49b58abf7b099e154c9c'),('3db36d5edff64bc1b1a6e9def0ba58c7','token','String','是','令牌',1,'2c54c4e68d0844b48b12f78af93783dc'),('3eb3f35e749d4bc1bc8627699248a49a','pageSize','Integer','是','pageSize',4,'623c680edca6456b89f275ab8c614bf7'),('40539ce52a7c4f36aadd17136017ae79','myTeamId','String','是','企业码',2,'6a8b2e211bdb4ab8a990af919abb5f2b'),('40bf38cb46b640feb1aac3234181e03d','environment','String','否','场地环境',11,'2c54c4e68d0844b48b12f78af93783dc'),('41013c0586eb478e9657f8b9b8d7fb83','token','String','是','令牌',1,'6db79ab903874e559cf799c0c5194be5'),('41412a0eba324143af51b266d8bb4aeb','myTeamId','String','是','企业码',2,'5ccff2b760ee4d588a41228d565b9aad'),('4197754d6d9941e4a8345455e5913b83','assistTitle','String','是','申请标题',3,'23e911701b1a49b58abf7b099e154c9c'),('41ee233e8d654b78a010c550bf9440d7','myTeamId','String','是','企业码',1,'b6f3fb9478aa43398e96bd03823aa667'),('4304dc3a4d73425bb63a68a5bf363e30','pageNum','Integer','是','页数',4,'365177c2935b4857aa6e39362cfb3694'),('438dba98f7c84d25942812d49567bac8','myTeamId','String','是','企业码',2,'54b4dd7bb9004e6189725e2148944ae9'),('43d8440de20e4de6a7a61281971b48f8','requestReason','String','是','申请原因',9,'b5a03ad641ba4dd7b3a8124d8bab42e5'),('43dc3a22cf2c4675b4060303ce2fe688','goodsNum','String','是','购买数量',9,'ccbe4ccfa2a640bfa4d7f9650b0f1b73'),('446ea01ad45b48fc8852df0364aee637','myTeamId','String','是','企业码',2,'5ea6c6c4ba9646ceaf6d876845f90430'),('44a28e315d6e4b44975f1cd5575d7c4f','userAddress','String','是','收货地址',5,'ccbe4ccfa2a640bfa4d7f9650b0f1b73'),('44b51850d0d943c1b51ad689708bbb8f','customerId','String','是','客户Id',3,'dff21b9976f64f9c9ed1fff39d9a9d1b'),('44f817998e52444eb0d4c1696bc53667','token','String','是','令牌',1,'d4b77a8966c74d4a9b7fad1e9905b6cd'),('450a294d4e0745959810e7bb82a2e611','userId','String','是','当前登录用户Id',0,'2dd479f0086942689837f2ca54852d34'),('458148b991f44362baac06cd4f38df22','myTeamId','String','是','企业码',1,'10ee376f64a7404d8f24c453401dc335'),('45bef11329714dd1ba71da7d96a72997','token','String','是','令牌',1,'6c4e7a503eca4112b4a734d50f3e7812'),('460f41e14e0e42018296d0cb2204b987','userPhone','String','是','用户手机号',0,'4d3bd0c8d6cf4631908d3132b72c9aa0'),('46262895930443aaada1680e8121d83a','userName','String','是','收货人姓名',4,'d4b77a8966c74d4a9b7fad1e9905b6cd'),('46bcfda8a108482d83de849c64de6db2','userArea','String','是','收货地址',6,'1b85812f0be9490a84657a03500b4008'),('46c08eafcb0b4809ad6244844d8b15c3','token','String','是','令牌',1,'87ee0eceaa3348a99c72b16f6bb44afb'),('4756e1bf48b74db58f83345826df48b4','userPlaceType','String','否','场地类型',6,'2c54c4e68d0844b48b12f78af93783dc'),('4779f9f987da4445b68059f04a328931','userSex','String','否','性别',8,'dff21b9976f64f9c9ed1fff39d9a9d1b'),('47c912fed86c465d831441bc4eed0b97','creditRating','String','否','客户评级',8,'0d0b67f8b5e447efbbe49115c41f5bb7'),('481966f8fd1e4b58835ec1fa439acf36','myTeamId','String','是','企业码',2,'b8995f0262e64652ba85a136b3cb24c6'),('49b3c5d8a37b47358e9092d95119ac16','customerId','String','是','客户Id',3,'3919f61cc5bb4d459c52b0c98bc216da'),('49d7fa0050fb4428a0175a5610aaa0c5','standardId','String','是','规格Id',4,'54b4dd7bb9004e6189725e2148944ae9'),('4b11810b7cdd4c82b13e9ad4326acce0','userId','String','是','用户Id',0,'b501882d44af4ad7b8bdb9ae48149acc'),('4ca13fd1706446f7834d5a9f226d1248','myTeamId','String','是','企业码',2,'75b48036547c4d5390172b21a4491e93'),('4cb1f9f5830341bf9f07c6c3627ca2fe','myTeamId','String','是','企业码',2,'49a557aabb3641119a08803f8c08b8dd'),('4d1ed06b5c164b30b8f448fe9698637e','userId','String','是','当前登录用户Id',0,'c99027475df5435ab5fd62633351b207'),('4d292349cce04d7ebc4f244215b4a632','myTeamId','String','是','企业码',2,'322ff7ff769c41f6b1ab5e5d9c74570d'),('4de131c539b345869fcf9397e5fe51bb','pageNum','String','是','页数',4,'8b2bd88dc8cc4717b86bdbde6305b65d'),('4e65c843701b4eaeb39adbff1122ff9b','company','String','是','企业名称',0,'7dc5d9e986904416a376065e7134bcd7'),('4f6a51f24d4846cea743adf0abc0b5b2','myTeamId','String','是','企业码',2,'68feadadea904d6fa18c17aec18c98a7'),('502593cbc1ab4761bd172d4ffb326068','token','String','是','令牌',1,'6a8b2e211bdb4ab8a990af919abb5f2b'),('50784b0ab45b4452afda98ce90914e65','userPassword','String','是','用户登录密码',1,'4d3bd0c8d6cf4631908d3132b72c9aa0'),('50a6cd45c8a4492dbed7b24bafda8f5d','myTeamId','String','是','企业码',2,'6c4e7a503eca4112b4a734d50f3e7812'),('50dff1fdac10416dba058d69900486df','standardId','String','是','规格Id',5,'72ad114d06fe4812bae7dd4449b89971'),('514429e41180499ab851d620f6ce271f','myTeamId','String','是','企业码',2,'4bdc5ca52ef749829ba4bf281f397be2'),('51ee0e2a2aa247d2ad3809213e0cf2cc','myTeamId','String','是','企业码',2,'be6a4c3222e740f2b4ca5dc4265eb377'),('520c4ac6e66b47f099f178f40ed35420','userId','String','是','当前登录用户Id',0,'6bba4f0169234ce1b1cacb2c0d1ffe23'),('528ff368e44b4f629b168c74fc3123f8','myTeamId','String','是','企业码',2,'163325edc6ab4e32afb3b189bdfe68d2'),('52e512e9fbe841eda42d2d1587d733b2','myTeamId','String','是','企业码',2,'8b2bd88dc8cc4717b86bdbde6305b65d'),('52e61fd937e046afbd9ec93329464712','userAddress','String','是','经纬度',7,'1b85812f0be9490a84657a03500b4008'),('53b8e62eaa8b4e8f9c55c86dfe87751c','userOwnerNum','Integer','否','权属人数',7,'2c54c4e68d0844b48b12f78af93783dc'),('54b6b889df8e48e18a12bea262312c56','userId','String','是','当前登录用户Id',0,'d4c12774a2e34da6ae5108b1ed19e25c'),('54bddb1f1d6949cb8175d05b1ea59a39','manageId','String','是','经营单位Id',3,'5ccff2b760ee4d588a41228d565b9aad'),('54e6bd011e924c208d11e997b47465ca','userId','String','是','当前登录用户Id',0,'df2341d553fb4ca6aa2fbfcff7ee09d6'),('565c8564783b4e80b103f1a6be6b3c56','requestId','String','是','申请Id',3,'2ba65c8300dd4fa48aabfd849a5efb80'),('57153e50ca1d4b1ebe6c3a8f95a705fc','promoterId','String','是','业务员的用户Id',8,'4a4cfc3d2e9d467ea8ffc0077745238f'),('573b500a76224b458460f466ef5216ef','userId','String','是','当前登录用户Id',0,'cff91a59858c422fa6c4f709b89e3603'),('57d829caa2904f67bf50fe2898d02b1e','verify','String','是','验证码',2,'b6f3fb9478aa43398e96bd03823aa667'),('58a599dcf6864d6984ae693cd2100fe8','customerId','String','是','客户Id',3,'d4c12774a2e34da6ae5108b1ed19e25c'),('58ac9a4b601e4606b8a36e69f5c9eb04','userId','String','是','当前登录用户Id',0,'72ad114d06fe4812bae7dd4449b89971'),('5ac960a659604d1687e2078228682fd6','userPlaceId','String','否','场地Id',4,'be6a4c3222e740f2b4ca5dc4265eb377'),('5b0f66da3a414c73a882286cb64f033f','userId','String','是','当前登录用户Id',0,'4a4cfc3d2e9d467ea8ffc0077745238f'),('5b826295cda84a8fa215b3b9bc4a0072','token','String','是','令牌',1,'8b2bd88dc8cc4717b86bdbde6305b65d'),('5c3212b6060544af8a89a5c46a4c73a4','station','String','否','从事岗位 客户类型为合作社时传输',11,'0d0b67f8b5e447efbbe49115c41f5bb7'),('5c3a573dff1f4ff7996cf75ec9e41980','userId','String','是','当前登录用户Id',0,'22e156f92d97482b8be66da2d13a52c4'),('5e20e7dca3b2418bb5696b5998a7d5a5','userPlaceAcreage','Integer','否','占地面积',5,'56095eba55614987bf9945dd3d69566f'),('5ed3279048d14428ba30920463b944fd','userName','String','是','姓名',3,'0d0b67f8b5e447efbbe49115c41f5bb7'),('5ee7801975064d39abba70af5a008bb8','userPhone','String','是','用户手机号',0,'9a14b37330e54b38abadd056f18d10fe'),('5f83889ff5fd4aec8ccd0a23db43850f','myTeamId','String','是','企业码',2,'dff21b9976f64f9c9ed1fff39d9a9d1b'),('5fb2f83e37ac4b2b9aa10434860cfdb8','userId','String','是','当前登录用户Id',0,'37c6ab15d18643379e3a3685dcb37a2b'),('60b92c55ce9f47db8d9a605294bdc181','token','String','是','令牌',1,'3315be9003d7486db2ee1d4761a4455b'),('60cf205c613e4862aada12b5ddadaa0e','userId','String','是','用户Id',0,'ddd54c231a964cb9ae4ed58da6e9a06b'),('61743263c4fa40a3ae5cb2114dbf1e3c','farmerId','String','是','农户Id',3,'37c6ab15d18643379e3a3685dcb37a2b'),('6232e933baaa46268d8f5a351501d3c2','requestId','String','是','建账申请Id',3,'fdfb3ca5b15b4ed3b93550f45d5ad710'),('625be65c38de45b88907574bafab722d','creditRating','String','否','客户评级',9,'dff21b9976f64f9c9ed1fff39d9a9d1b'),('626f5563b155462f8e7b8ff3f94d0200','userId','String','是','当前登录用户Id',0,'9205c489f42f4634a8148de0200384b9'),('62fc520ceb9e4dc2b832d5278d908ae9','userId','String','是','当前登录用户Id',0,'365177c2935b4857aa6e39362cfb3694'),('63540d2516d9403382200e2fdb08fe50','token','String','是','令牌',1,'b01576d116e743e398c4237c9c1b4bcb'),('63c23e5252714fbab7c7efd055844982','userPlaceArea','String','否','场地位置',4,'2c54c4e68d0844b48b12f78af93783dc'),('63e264f8e6f841a5b6eb3c1b91abe00a','goodsNum','Integer','是','购买数量',4,'72ad114d06fe4812bae7dd4449b89971'),('64118a4634584e0eae5751c3be5c691b','customerType','String','否','客户类型(选填)',5,'4a4cfc3d2e9d467ea8ffc0077745238f'),('64a7fb341322401b8704142a5124fc17','customerId','String','是','客户Id',3,'eb7654c6d8a742df8ee395aa480b8471'),('64fc0dca604248f9b8796c7b675a0f2c','token','String','是','令牌',1,'701aae07c8d94171a5d4fe8cf0622511'),('6529d9dfac7a482d99c6014c45eb2402','userAddress','String','是','经纬度',6,'d4b77a8966c74d4a9b7fad1e9905b6cd'),('657a4c3ced3a4fc7947447b5698539d3','merchandiserId','String','是','跟单员Id',4,'b438e782f0444b07b3ee397bc309bc7c'),('65d3211655f64e769ab2cd998ddf7d6d','token','String','是','令牌',1,'49624057be4445559f93489bb2cccee4'),('6629191ccd6e45dcba0f11c925f1acad','pageSize','Integer','是','每页显示数量',4,'610442c7ecc34b46a419a919e2c78126'),('66f1dd355c45451788da407ce4918fed','myTeamId','String','是','企业码',2,'2d9196ddb2024b9581bfcb510fb2cce5'),('67bf1befacaf4375ab4cd5d5c0b592cc','myTeamId','String','是','企业码',2,'590cb636436a49f788f763689af707ed'),('682ffc84a39942a9bc342f8c2ff1f45b','token','String','是','令牌',1,'23e911701b1a49b58abf7b099e154c9c'),('68c0ccfcb6e64a59aab6df3d0c76cc4e','farmerName','String','是','农户姓名',4,'2c9a1b2c5e234a39b6363cf88ef3701b'),('68e81333a48048c7a66d58be31c842a5','myTeamId','String','是','企业码',2,'689bc97709b949019ab4e381744e0639'),('68ebf6fefe5e46fbad1cb37364771dfd','userId','String','是','当前登录用户Id',0,'dff21b9976f64f9c9ed1fff39d9a9d1b'),('694180aa45fc47748670084581854b30','myTeamId','String','是','企业码',2,'9f3bef34a9ea46afb8fba1515490efaf'),('696b698d5f87496fb25a01f02fb484fb','followResult','String','否','跟进结果',7,'09e37c8416f748f4b2d7fae1f8e670bd'),('697b6703a55c4cf7a07cd6f9099ee94f','userPhone','String','是','收货人联系电话',3,'d4b77a8966c74d4a9b7fad1e9905b6cd'),('69ae50b03e6e4ab7933a0ade8ad22b1d','token','String','是','令牌',1,'c99027475df5435ab5fd62633351b207'),('69d604f8fa284988875e251811aaae94','customerName','String','是','客户姓名',4,'b5a03ad641ba4dd7b3a8124d8bab42e5'),('6a0fc033137e42c893f5cc1ace3160cb','userPhone','String','是','用户手机号',0,'d94c8d7250784df58360ab333fb2e4ed'),('6a8a18a9e8554a69af6514f2728329f0','manageAcreage','String','否','经营面积',7,'d4c12774a2e34da6ae5108b1ed19e25c'),('6a9a33961d4349e681d043905d673d1e','myTeamId','String','是','企业码',2,'b7ebc400c4244282b50cb53016719fa8'),('6ad5c3bd7dd2420aa7a5401ed6265acb','manageId','String','是','经营单位Id',3,'be58dab447ee4d84b517846e1bc1372c'),('6c2f811f3d274a9590d380b0a68f1e77','myTeamId','String','是','企业码',2,'56095eba55614987bf9945dd3d69566f'),('6c41c1bb3c384cd4aaab755a4c115653','goodsNum','String','是','购买数量',4,'b7ebc400c4244282b50cb53016719fa8'),('6e1f1f78269649029a22c51bb2378be1','pageNum','Integer','是','页数',3,'4a4cfc3d2e9d467ea8ffc0077745238f'),('6e87133348c74c1c99a6e2542226cc42','myTeamId','String','是','企业码',2,'49624057be4445559f93489bb2cccee4'),('7102df405fe84fd58fb31c359e62393e','pageSize','String','是','每页商品数量',4,'322ff7ff769c41f6b1ab5e5d9c74570d'),('71a49fcf3adf4cbc99fc2c9bb8a56292','userAlreadyUse','Integer','否','使用情况',8,'2c54c4e68d0844b48b12f78af93783dc'),('72261b791cc340bba566f792ace2505a','userId','String','是','当前登录用户Id',0,'b7ebc400c4244282b50cb53016719fa8'),('727361d3d0ff4ac0926b75c8001f6ca6','promoter','String','是','json数组字符串',7,'4a4cfc3d2e9d467ea8ffc0077745238f'),('72da1215414342d5bc880c4c4fa68db4','verify','String','是','验证码',2,'d94c8d7250784df58360ab333fb2e4ed'),('74b369952f67416482ac6578423a3030','userId','String','是','当前登录用户Id',0,'54b4dd7bb9004e6189725e2148944ae9'),('758c3c9545e347468de065093b15ab38','userEmployeeNum','Integer','否','工人数量',9,'56095eba55614987bf9945dd3d69566f'),('75bd1fd428f044c5af05d55e9fe59c1f','pageNum','Integer','是','',4,'68b03974db434ab3bdd09d04dead9d6b'),('75d8405a34cc4f0d8ad33ee9f01ddfa3','pageSize','Integer','是','每页显示数量',4,'4a4cfc3d2e9d467ea8ffc0077745238f'),('776bcfa17d6c4f5faf2ed6406297d7ee','myTeamId','String','是','企业码',2,'4009414df88f4c60a0f3854838c9e619'),('787de9eb792a40b9a075b266252b3990','farmerPhone','String','是','联系电话',5,'2c9a1b2c5e234a39b6363cf88ef3701b'),('78b109714d024c168047a7dc4e9ce93a','userId','String','是','当前登录用户Id',0,'be58dab447ee4d84b517846e1bc1372c'),('78c3396c140d41cf96d4d38f99397825','farmerName','String','否','农户姓名',4,'c99027475df5435ab5fd62633351b207'),('7913e96e9b004a0db38814309a5ee708','customerId','String','是','客户Id或农户Id',3,'365177c2935b4857aa6e39362cfb3694'),('79b1927f369a4bb0879efcf996152d59','userPlaceId','String','否','场地Id',4,'b8e2d60dd0c64f49b9fe6bcb50bfe078'),('7aaf681f5b0b4c328a5439c003218456','userEmployeeNum','Integer','否','工人数量',9,'2c54c4e68d0844b48b12f78af93783dc'),('7addd4408b434419bfcf8715270cdee8','token','String','是','令牌',1,'322ff7ff769c41f6b1ab5e5d9c74570d'),('7ae9647b4bed407ba6932a429cee92b0','userId','String','是','用户Id',0,'6414f8e5d33f4a93a7793df1459a90cb'),('7af7005c9e6b470bae3abfa8549ce17b','assistId','String','否','申请的Id(选填)',4,'deaa839f56ce4323a46687a284f4502c'),('7b2f40615083416f839322811034da32','img','File','是','上传的图片',4,'7d13aacf67af4ba9abe1b9f6733a9919'),('7b5bd86f0ef9457b89f0a5f920284ff4','cardBack','File','是','正面照片',3,'b6625b81b5884825ad1c51072eb22d94'),('7be4b82383804793973c01bd0ac1a61a','token','String','是','令牌',1,'54b4dd7bb9004e6189725e2148944ae9'),('7c3f1f8f0de84940ac4fb364c525cc25','myTeamId','String','是','企业码',2,'489a8428ee114557a34ab2cbb8be70a2'),('7c4dbb6ad9ef434c91f42c30acfaef80','myTeamId','String','是','企业码',1,'b6625b81b5884825ad1c51072eb22d94'),('7d5309990b7043d7b4c2bfcd32b4f64d','myTeamId','String','是','企业码',2,'eb7654c6d8a742df8ee395aa480b8471'),('7e91bd07565f46d2aa5e364bf26ef871','token','String','是','令牌',1,'09e37c8416f748f4b2d7fae1f8e670bd'),('7e9e66de960046b988b5092aaa58d7ba','myTeamId','String','是','企业码',2,'94a4b4adbeed48aca99267235d97781b'),('7ea930cc29ea4fa0a3b912becc053ea6','manageAddress','String','否','地理位置',5,'be58dab447ee4d84b517846e1bc1372c'),('7fb3c5a951b04ae0a3682ad0e1760702','userAddressDefault','Integer','是','1为默认地址(0,1)',7,'d4b77a8966c74d4a9b7fad1e9905b6cd'),('7fd93c4b9b7543dc9284deff315332bd','token','String','是','令牌',1,'eb7654c6d8a742df8ee395aa480b8471'),('8026504a26ac483488220ee91f6d916f','userId','String','是','用户Id',0,'ada1e8b8ed284b0da83b56131202cd53'),('80b1e2ceec8a4511bf9d0fe74716f4f1','pageSize','String','是','每页显示数量',5,'49624057be4445559f93489bb2cccee4'),('8137bc32e7ac4f07a1d1697802b14fa6','userId','String','是','当前登录用户Id',0,'1dd677ec548443b08eb3d5611f17a3ae'),('817bfa2a0f6245fcb45456b5cbf01acc','token','String','是','令牌',2,'b501882d44af4ad7b8bdb9ae48149acc'),('819898d45b1c425f804a7c12ed79b608','myTeamId','String','是','企业码',1,'ada1e8b8ed284b0da83b56131202cd53'),('81b636733fca4045b85e749b470c8ddc','token','String','是','令牌',1,'610442c7ecc34b46a419a919e2c78126'),('820d360d14b54bd8bfe9b3c0783bd1b3','goodsId','String','是','商品Id',3,'b7ebc400c4244282b50cb53016719fa8'),('8236aabeacee4c559f2d875c8d8fe9df','token','String','是','令牌',1,'c773ee64b481484cb433b0b814194fa0'),('82a65d9507ea4bb38de0e2780049eac8','userId','String','是','当前登录用户Id',0,'c52b9536af934afba04226aae9f530e9'),('832b7065a6c04e1eaea2c375b17752e3','pageNum','Integer','是','页数',4,'163325edc6ab4e32afb3b189bdfe68d2'),('834a52f048ef44d295f425d8e648335c','goodsTypeId','String','是','',3,'68b03974db434ab3bdd09d04dead9d6b'),('847950cd7e8945b8a3ac33ae94ae1a9b','userId','String','是','当前登录用户Id',0,'4009414df88f4c60a0f3854838c9e619'),('84c65b4fc60942d7813fb1b75fed1033','pageNum','Integer','是','页数',4,'9f3bef34a9ea46afb8fba1515490efaf'),('85079f86a3474fc4972c3138a766fa50','userPlaceArea','String','否','场地位置',4,'56095eba55614987bf9945dd3d69566f'),('8553a94cbc954eefa9d15a3de8f0459b','token','String','是','令牌',1,'b7ebc400c4244282b50cb53016719fa8'),('86a0dea5462e4816942c6ee12d1c1115','token','String','是','令牌',1,'13a33a322fe844a7bcd481664b367f1c'),('87fcb59e3d2d4e559728a8a12bdb74a0','selectId','String','是','对应类目选项Id（首次请求的时候传空字符串 \"\"）',3,'af1379d79875405cbfba73d080e1cab2'),('884389443bf7473cb7d5a9f04c505557','token','String','是','令牌',1,'e382083c97824a95a707e7459b6df1e2'),('88814eda52344d83a34b46788228f672','userId','String','是','当前登录用户Id',0,'2d9196ddb2024b9581bfcb510fb2cce5'),('88851bfe0b464a9b9e5cd8d9ccf4c8ce','manageAddress','String','否','地理位置',5,'d4c12774a2e34da6ae5108b1ed19e25c'),('890d96ccb7504b2fa8541d70ddeeacbe','token','String','是','令牌',1,'fdfb3ca5b15b4ed3b93550f45d5ad710'),('8a54b31a98854b349d2fe2d37a16cd4d','userId','String','是','当前登录用户Id',0,'015b1e3ea6a24a65ba6bfbb9284d8f30'),('8a9d4a46fe58494d8b68f5b842020371','myTeamId','String','是','企业码',2,'701aae07c8d94171a5d4fe8cf0622511'),('8af6c2ea8f5e4cf3b8bb7f50166bf9f7','myTeamId','String','是','企业码',2,'6bba4f0169234ce1b1cacb2c0d1ffe23'),('8b0da2e99db64b53aeb1faf0b307d8e4','img','File','是','上传的图片',4,'689bc97709b949019ab4e381744e0639'),('8baf2b1fc1314534a6a582a6457f5ea2','userId','String','是','当前登录用户Id',0,'c773ee64b481484cb433b0b814194fa0'),('8d31117e97a141a4a9076542322a5a5f','pageNum','Integer','是','页数',4,'49624057be4445559f93489bb2cccee4'),('8d9af7cdaa0d459f9d5967e98d00ff9b','token','String','是','令牌',1,'c05bf841e4ee449a81bc7c011d06e970'),('8de81077796346eeb65c15c5615d61c7','pageSize','String','是','每页显示数量',5,'8b2bd88dc8cc4717b86bdbde6305b65d'),('8e03a848d6b9421da8d9cd3e673b4d3f','goodsId','String','是','商品Id',3,'54b4dd7bb9004e6189725e2148944ae9'),('8e39ba8990964c21847f277feb96c3c0','token','String','是','令牌',1,'b5a03ad641ba4dd7b3a8124d8bab42e5'),('8e52f16281034383a3dec5177ac21415','userId','String','是','当前登录用户Id',0,'09e37c8416f748f4b2d7fae1f8e670bd'),('8f1714137f2b4db2845b4de785f48801','myTeamId','String','是','企业码',2,'0d0b67f8b5e447efbbe49115c41f5bb7'),('8f99150ebd5f4618b613dce1f64fa813','userId','String','是','当前登录用户Id',0,'489a8428ee114557a34ab2cbb8be70a2'),('8ff549401d224f17a68596f9370c7cba','userAddressDefault','Integer','是','1为默认地址(0,1)',8,'1b85812f0be9490a84657a03500b4008'),('90365eb9810848549b3a2997f4efdad3','token','String','是','令牌',1,'689bc97709b949019ab4e381744e0639'),('906d4d86dec7476b9a85e9c412e6043c','myTeamId','String','是','企业码',2,'912a22a6fd734458ba1d56ae39b4cde9'),('90a519dca2a84ed187f56323c66317e9','customerName','String','是','客户姓名',7,'23e911701b1a49b58abf7b099e154c9c'),('90a679eb06744b0080e16c62f4f299ee','img','File','是','图片',3,'b8e2d60dd0c64f49b9fe6bcb50bfe078'),('90c815516e5849ea866457f32546a447','myTeamId','String','是','企业码',2,'4d3bd0c8d6cf4631908d3132b72c9aa0'),('9160ab2d83cd4cc58dd0c6e6d786611c','myTeamId','String','是','企业码',2,'9205c489f42f4634a8148de0200384b9'),('92203df9634a42e0931305a1558cd14a','myTeamId','String','是','企业码',2,'22e156f92d97482b8be66da2d13a52c4'),('92ee29bcb2254fed9b4e487670cb7cfc','token','String','是','令牌',2,'b6625b81b5884825ad1c51072eb22d94'),('9304e708716c4c6b908702421c035ece','checkerId','String','是','审批人的用户Id',7,'b5a03ad641ba4dd7b3a8124d8bab42e5'),('93914196b151420ba37d81a4d59fd0b2','followTitle','String','否','跟进标题',4,'09e37c8416f748f4b2d7fae1f8e670bd'),('948e69b5f2c641fe99a3204d8e4ca853','img','File','是','上传的图片',3,'deaa839f56ce4323a46687a284f4502c'),('949346a332e44f5fbb24c6120f486651','userId','String','是','用户Id',0,'b6625b81b5884825ad1c51072eb22d94'),('95766f76b2f744c385394f93fb35f617','userPassword','String','是','用户登录密码(md5)',1,'ddd54c231a964cb9ae4ed58da6e9a06b'),('9576f4c1f6c44788bb39e8561752c2b6','token','String','是','令牌',1,'199830f70dcc47c2946b69656a3ca65d'),('96660345b71a402e92c453e0e8e1e860','customerId','String','是','客户Id',3,'49624057be4445559f93489bb2cccee4'),('984b2c1d99b1438e8173c5ef8f464f55','followResult','String','否','跟进结果',8,'5ea6c6c4ba9646ceaf6d876845f90430'),('98e90d84feb846649fe93e837c10a206','userId','String','是','当前登录用户Id',0,'97b9990fc5124331b6f761cd267dc772'),('99162d3bc5a54496b58edef679a0eb14','token','String','是','令牌',1,'1219aa8936b24bd7ae26bdefc1b5165c'),('993a5283b3fc422da2cba8f12c663aff','myTeamId','String','是','企业码',2,'b8e2d60dd0c64f49b9fe6bcb50bfe078'),('9ab9edc31c2749f883be724f2cd55689','myTeamId','String','是','企业码',2,'d4b77a8966c74d4a9b7fad1e9905b6cd'),('9ad86927a968496b929a9bd31e6d36cb','myTeamId','String','是','企业码',2,'53f8cb30bc1747b3a1c9800aa377117b'),('9b73baf278954b888cb167fd2dfa4c2f','userPassword','String','是','用户登录密码(md5)',1,'ae90901e86b7472899c20756136e7cc8'),('9be94094215045a793a79cb11703a332','userPassword','String','是','用户登录密码(md5)',3,'ada1e8b8ed284b0da83b56131202cd53'),('9c66ad71a7304d6381a2160230a2f13d','cardHand','File','是','正面照片',3,'10ee376f64a7404d8f24c453401dc335'),('9c77c4fbfe6749e3bc72cfa7fe0b2ebe','myTeamId','String','是','企业码',2,'f830bdc2357242e991992b6a2f9f3476'),('9c9d68e3b6bf48f1824bb8945f25b7a8','userId','String','是','当前登录用户Id',0,'6c4e7a503eca4112b4a734d50f3e7812'),('9cad74ba2bb04171959f414bb6cc5384','token','String','是','令牌',1,'f830bdc2357242e991992b6a2f9f3476'),('9ce41fbe5304473f94c757a8a2240b6c','paymentType','String','是','支付方式',4,'ccbe4ccfa2a640bfa4d7f9650b0f1b73'),('9e841b0bd22a485c89d990f3c6edafcf','userId','String','是','当前登录用户Id',0,'b8995f0262e64652ba85a136b3cb24c6'),('9f09b5e6d6c0498da523cc91fead5711','userId','String','是','当前登录用户Id',0,'f830bdc2357242e991992b6a2f9f3476'),('9fa7c49e60a44599a867a81a8d776e93','departmentName','String','是','部门名称',11,'23e911701b1a49b58abf7b099e154c9c'),('9febaed8aa7947f7965c778755a42a17','pageNum','String','是','页数',3,'4009414df88f4c60a0f3854838c9e619'),('a017e572614b4d599a9161d4d9086a3c','standardId','String','是','规格Id',10,'ccbe4ccfa2a640bfa4d7f9650b0f1b73'),('a07e13f2790146a789ce512cab8fe5cb','phone','String','是','联系电话',2,'7dc5d9e986904416a376065e7134bcd7'),('a0befdc073a24474939c7050d5f02d3f','userId','String','是','当前登录用户Id',0,'49a557aabb3641119a08803f8c08b8dd'),('a15a2319369843c28d07ec20f2888a37','token','String','是','令牌',2,'ada1e8b8ed284b0da83b56131202cd53'),('a1e4d4a509ec45b1b19d8149b39572af','manageAcreage','String','否','经营面积',7,'be58dab447ee4d84b517846e1bc1372c'),('a2501e60e0834e21895e8b9a3102ccc7','myTeamId','String','是','企业码',2,'623c680edca6456b89f275ab8c614bf7'),('a2ec9afdd5334ebbb5ef150a596f5b09','token','String','是','令牌',1,'75b48036547c4d5390172b21a4491e93'),('a301a53762664c96973fb150230cd3f2','environment','String','否','场地环境的图片Id',11,'56095eba55614987bf9945dd3d69566f'),('a3068988885c44b89c658929d94a213f','userId','String','是','当前登录用户Id',0,'6a8b2e211bdb4ab8a990af919abb5f2b'),('a316ea1ccc704a1d9c0176244ff46610','userId','String','是','当前登录用户Id',0,'b5a03ad641ba4dd7b3a8124d8bab42e5'),('a3494fc5ad504816a2dfaa5f025046ac','myTeamId','String','是','企业码',2,'000186dbcd4b436081cefc9fd13f8846'),('a373936824174e9d8092b4efc72940b5','pageNum','Integer','是','页数',3,'623c680edca6456b89f275ab8c614bf7'),('a3d2d5cadab4485dbeebec59b3f9fa6e','token','String','是','令牌',1,'2ba65c8300dd4fa48aabfd849a5efb80'),('a4e4f08697084dfe88610a414d2b955e','token','String','是','令牌',1,'f18e2df131ca433fb9629dad194ac600'),('a61663b4f450479283fa2e00fa844262','manageName','String','否','单位名称',4,'be58dab447ee4d84b517846e1bc1372c'),('a699bccbf8494c86b0862ada5bbd5b9e','userId','String','是','当前登录用户Id',0,'7d13aacf67af4ba9abe1b9f6733a9919'),('a89f4959199c4f9b96ed203f65833c3e','myTeamId','String','是','企业码',2,'97b9990fc5124331b6f761cd267dc772'),('a9ba018204b143b1ad11d4c8e9ac625b','certificate','String','否','所属证明',10,'2c54c4e68d0844b48b12f78af93783dc'),('a9cc2fb72e004c0ba6c31bd766f7c66c','teamDepartmentId','String','是','部门Id',3,'53f8cb30bc1747b3a1c9800aa377117b'),('aa09b1ca43fb458e9c202d677c2980ef','userId','String','是','当前登录用户Id',0,'1b59b7d653454aedac39344693f7a027'),('ab3eb14b21cd476e9ef6ffb0fe5eb569','user','String','是','user(json数组字符串)',8,'23e911701b1a49b58abf7b099e154c9c'),('ac6896dd635d47e1a65ebb56838c964f','userId','String','是','当前登录用户Id',0,'af1379d79875405cbfba73d080e1cab2'),('ac89206524fe46cbb45be56de863e5eb','myTeamId','String','是','企业码',2,'13a33a322fe844a7bcd481664b367f1c'),('ad338ae43af44f3dbed4496465505bd4','pageNum','Integer','是','页数',4,'2dd479f0086942689837f2ca54852d34'),('ad366d45a78f41a19ea83f2106d9235f','myTeamId','String','是','企业码',1,'6414f8e5d33f4a93a7793df1459a90cb'),('ad7ea6aca25b4ff88b56d21ebae2bfb2','userId','String','是','当前登录用户Id',0,'77030f6cf1bd4572b9718d6f109add9a'),('addae5b8965042b4a37a18eae2d4e654','userPhone','String','是','用户手机号',0,'b6f3fb9478aa43398e96bd03823aa667'),('ae1e4f44eb664d0dad9418e4560b2bd8','userAlreadyUse','Integer','否','在养数量',8,'56095eba55614987bf9945dd3d69566f'),('ae2f20afc2c744149fc4e347ff693132','myTeamId','String','是','企业码',1,'b44cc2e23e6e4f2eb2761bf672b6fb0f'),('ae8378c88ae94cd3accb2f6b98e31826','token','String','是','令牌',1,'5ccff2b760ee4d588a41228d565b9aad'),('ae91cee7ec15416abc1c14f464bd8561','token','String','是','令牌',2,'93c6a85d73cc4b3f9071f60445ba0eb1'),('af4abb1e33c842dfbb8bee5893884552','userId','String','是','当前登录用户Id',0,'9f3bef34a9ea46afb8fba1515490efaf'),('afd389a1d1324446bd56909d66703557','customerType','String','是','客户类型',9,'0d0b67f8b5e447efbbe49115c41f5bb7'),('afebf72428fd4f5289506f95270a5a57','token','String','是','令牌',1,'37c6ab15d18643379e3a3685dcb37a2b'),('b027d5ba9fdb43d884c9b6b787d7b77a','userPhone','String','是','收货人联系电话',4,'1b85812f0be9490a84657a03500b4008'),('b0f78cbfbd454a0397b49eca8c9714d9','manageName','String','是','单位名称',4,'d4c12774a2e34da6ae5108b1ed19e25c'),('b0fedff9540640f79a9f963fd344539c','followId','String','是','跟进Id',3,'199830f70dcc47c2946b69656a3ca65d'),('b110e35ca268433281276e34f8ec0bcd','farmerPhone','String','否','联系电话		联系电话',5,'c99027475df5435ab5fd62633351b207'),('b13622fe80894832bbf6eda2b43ed32c','myTeamId','String','是','企业码',2,'09e37c8416f748f4b2d7fae1f8e670bd'),('b1a4a6ef354e41be9ed62a19cd681090','userId','String','是','当前登录用户Id',0,'b8e2d60dd0c64f49b9fe6bcb50bfe078'),('b1b5c1a097124eb4829c8a0fd4fc4da3','myTeamId','String','是','企业码',2,'1b85812f0be9490a84657a03500b4008'),('b1f14ca48ac0448db808af8337ad107e','token','String','是','令牌',1,'489a8428ee114557a34ab2cbb8be70a2'),('b2ee6822396f4fee885cb3759d5a3bdf','img','File','是','图片',3,'45f3e927c45b4447b74d59a728e807b5'),('b3a2f0aad4794a0ab7796994d20a4eb6','userId','String','是','用户Id',0,'93c6a85d73cc4b3f9071f60445ba0eb1'),('b3a5e2953c0a42459b1e2a54c4218623','token','String','是','令牌',1,'2d9196ddb2024b9581bfcb510fb2cce5'),('b431b282256741bc96b2220e79499405','customerId','String','是','客户Id',3,'2c9a1b2c5e234a39b6363cf88ef3701b'),('b45254a691d44157b4787aa530789dd5','departmentId','String','否','部门Id(选填)',3,'d757445966794da48bd9fae543d6debb'),('b459e7933b3f41d2a826df2ede9f907d','myTeamId','String','是','企业码',1,'93c6a85d73cc4b3f9071f60445ba0eb1'),('b487a0add3c14d7c82763d3c123ca6a7','userId','String','是','当前登录用户Id',0,'6db79ab903874e559cf799c0c5194be5'),('b4da154330c34fb8b0663a017b168d47','token','String','是','令牌',1,'9205c489f42f4634a8148de0200384b9'),('b4e3326f9e7348e0b2c4f411b12416af','requestId','String','是','申请Id',3,'49a557aabb3641119a08803f8c08b8dd'),('b64e302d43684160be05b75897d807f6','hadAccount','Integer','否','是否建账(选填)',6,'4a4cfc3d2e9d467ea8ffc0077745238f'),('b650fed4b84e4df5b2239dda468dace6','customerId','String','是','客户Id或农户Id',3,'56095eba55614987bf9945dd3d69566f'),('b705a817b5534515b749ed222c923c90','businessAddress','String','否','经营地址',10,'dff21b9976f64f9c9ed1fff39d9a9d1b'),('b723e132ea20439985643b14943a9ab8','userId','String','是','当前登录用户Id',0,'deaa839f56ce4323a46687a284f4502c'),('b7f7387d10424d8f88fb34ed15c1b456','myTeamId','String','是','企业码',2,'23e911701b1a49b58abf7b099e154c9c'),('b879b2af182f4cf6a66c92a60273d4d1','userId','String','是','当前登录用户Id',0,'e382083c97824a95a707e7459b6df1e2'),('ba10ff9c63cd4f73b44a64f0788c73e9','userPhone','String','是','用户手机号',0,'ae90901e86b7472899c20756136e7cc8'),('bab9f0a5e98b4185b98f6066d11a69e1','token','String','是','令牌',1,'3919f61cc5bb4d459c52b0c98bc216da'),('bae3af892c6f457d8ad172254ab0d7d1','userId','String','是','当前登录用户Id',0,'590cb636436a49f788f763689af707ed'),('bb315892b73043eb94dbd5944835d0fa','token','String','是','令牌',1,'163325edc6ab4e32afb3b189bdfe68d2'),('bbc7a6d27c2348498f9444d3558ba0fa','goods','String','是','json数组字符串',7,'ccbe4ccfa2a640bfa4d7f9650b0f1b73'),('bc57b88bf6104397bd5fe0fa9f099e48','customerId','String','是','客户Id',3,'d2e72fe6a0ba495fad4c2160f20ab73e'),('bce757a41b5641b995b6acb1f2ca6536','myTeamId','String','是','企业码',2,'1dd677ec548443b08eb3d5611f17a3ae'),('bcf663e9a75944a294c078450b721b66','userId','String','是','当前登录用户Id',0,'56095eba55614987bf9945dd3d69566f'),('bdc0b325cc1d4d71bb9ab7d4ebe62ba3','token','String','是','令牌',1,'2c9a1b2c5e234a39b6363cf88ef3701b'),('be4cf69cffc8418aa210429d7f0f02b2','goodsId','String','是','商品Id',8,'ccbe4ccfa2a640bfa4d7f9650b0f1b73'),('be513eb4d6c14a19abb60b54d5a4be10','token','String','是','令牌',1,'623c680edca6456b89f275ab8c614bf7'),('be92d81e461b4e78b920b70ac70c4c05','token','String','是','令牌',1,'cff91a59858c422fa6c4f709b89e3603'),('bebca63c86e94764b423d23c86e6bb37','userPlaceId','String','是','场地Id(农户经验Id)',3,'22e156f92d97482b8be66da2d13a52c4'),('bf2e0cfe0e8f4ea8b1ea602d17171c6f','myTeamId','String','是','企业码',2,'72ffcee59d9140cca65868e7e95ead29'),('bf943b8f13ea4a1999346b7e2b6a9f4b','breedId','String','是','养殖信息Id',3,'cff91a59858c422fa6c4f709b89e3603'),('bff9b89498fe4d1eb72ed1957a03be23','token','String','是','令牌',1,'000186dbcd4b436081cefc9fd13f8846'),('bffc28c9f25247c9b3c18313ce4192b7','pageSize','Integer','是','每页显示数量',5,'365177c2935b4857aa6e39362cfb3694'),('c020af8372e1467b9f8374e3dd7c0d37','pageNum','Integer','是','页数',3,'610442c7ecc34b46a419a919e2c78126'),('c02c303ab6c34afb9dd25f6dbf3afe1c','userId','String','是','当前登录用户Id',0,'3919f61cc5bb4d459c52b0c98bc216da'),('c05a930c3fe345b7b4d2c700dfe96392','path','String','是','图片路径',3,'015b1e3ea6a24a65ba6bfbb9284d8f30'),('c09558a5166f4d65973502ddc785812d','userId','String','是','当前登录用户Id',0,'53f8cb30bc1747b3a1c9800aa377117b'),('c0ae05b94f5f444fa2f29d760595168e','followDate','String','否','跟进时间',5,'09e37c8416f748f4b2d7fae1f8e670bd'),('c0c59058931a441b898c3ae30208c91c','pageNum','Integer','是','页数',4,'4bdc5ca52ef749829ba4bf281f397be2'),('c0ce0622a17a470ea1b3743f9bb34970','customerId','String','是','客户Id',3,'489a8428ee114557a34ab2cbb8be70a2'),('c0e9628164744f3bbae233a1c5c2e10a','userId','String','是','当前登录用户Id',0,'be6a4c3222e740f2b4ca5dc4265eb377'),('c106249532ea4df2b1d2bee1949756d3','pageSize','Integer','是','每页显示数量',5,'2dd479f0086942689837f2ca54852d34'),('c1c59a1231a740b0a0d62a18e2a59214','token','String','是','令牌',1,'5ea6c6c4ba9646ceaf6d876845f90430'),('c1dbd7976d3042ceaf8c6a128bfed464','manageId','String','是','经营单位Id',3,'8d5c6f7446634d8f85b759d6d3175a06'),('c20b071a5f1645a79cf12406785e19a6','userId','String','是','当前登录用户Id',0,'7dd5837b04d5432391976e8824ce5896'),('c21480e4ab4640c2b571076bbc457aed','assistReason','String','是','申请原因',4,'23e911701b1a49b58abf7b099e154c9c'),('c247ea4afab0411393b469a3652f814c','myTeamId','String','是','企业码',2,'610442c7ecc34b46a419a919e2c78126'),('c304e6ad79e0468e93ea300474584c83','myTeamId','String','是','企业码',2,'c773ee64b481484cb433b0b814194fa0'),('c34a4b5da3a44a9593431747ac69274c','token','String','是','令牌',1,'af1379d79875405cbfba73d080e1cab2'),('c3a3197fe9d84e8f82ab2f3a06c036e6','pageSize','Integer','是','每页显示数量',5,'163325edc6ab4e32afb3b189bdfe68d2'),('c3b292f2b4e34d088c6bd86dc9b9029b','userPlaceId','String','是','场地Id',3,'5097f0bc6f10496f8783965acc53b8a5'),('c3e6eef147504d558138bddf031859b8','pageSize','Integer','是','每页显示数量',4,'b501882d44af4ad7b8bdb9ae48149acc'),('c4e4de3f6a6d48bd844b87fc255d94be','userAddressId','String','是','收货地址Id',3,'1b85812f0be9490a84657a03500b4008'),('c678ff3f7c9c44cc837f1a2a17d8771a','myTeamId','String','是','企业码',2,'af1379d79875405cbfba73d080e1cab2'),('c6c3784d48cd4764994fabe01412b007','userId','String','是','当前登录用户Id',0,'68feadadea904d6fa18c17aec18c98a7'),('c6d838e198ab46b08b3b81479dc1ef3a','freight','String','是','运费',3,'ccbe4ccfa2a640bfa4d7f9650b0f1b73'),('c6efeea8d02d43bb8e889ff44d2bf7d7','buyerMessage','String','是','买家留言',6,'ccbe4ccfa2a640bfa4d7f9650b0f1b73'),('c85d432138804f6399c39d12152b6078','pageNum','Integer','是','页数',3,'af4194226ffb4608b0bd9771b1d90254'),('c89f77786585428b971161b429f26566','token','String','是','令牌',1,'dff21b9976f64f9c9ed1fff39d9a9d1b'),('c8d9baf9d3b94a8391d05efd6ffb833e','goodsId','String','是','商品Id',3,'72ad114d06fe4812bae7dd4449b89971'),('c912c4eb84dd4bf5833da5e00124f6b3','position','String','是','职位',3,'7dc5d9e986904416a376065e7134bcd7'),('c949e164d8c0468bae3566c4e73fb003','token','String','是','令牌',1,'5097f0bc6f10496f8783965acc53b8a5'),('cb44c8f3741b46cd84a47b4854819239','myTeamId','String','是','企业码',2,'3919f61cc5bb4d459c52b0c98bc216da'),('cba436572dff45ea9afcbe0d49f13cba','userId','String','是','当前登录用户Id',0,'d757445966794da48bd9fae543d6debb'),('cbb23239c27a4d96a5c442edfd55af48','myTeamId','String','是','企业码',2,'365177c2935b4857aa6e39362cfb3694'),('cbb6f2daefdf4347a31bd2f29e033831','myTeamId','String','是','企业码',2,'e382083c97824a95a707e7459b6df1e2'),('cd267d17a248442a8a57da20456fd519','token','String','是','令牌',1,'ccbe4ccfa2a640bfa4d7f9650b0f1b73'),('cd8f0e87fdac412ea9e670f3f9722e04','certificate','String','否','所属证明的图片Id',10,'56095eba55614987bf9945dd3d69566f'),('ce65bd763dfd4223b765df655a0efa7a','myTeamId','String','是','企业码',2,'df2341d553fb4ca6aa2fbfcff7ee09d6'),('ce7beb33a7ae4c7bab3b066bc9f45497','userId','Integer','是','当前登录用户Id',0,'f18e2df131ca433fb9629dad194ac600'),('ceb7f8c38db74385874e92c634bf1509','token','String','是','令牌',1,'7dd5837b04d5432391976e8824ce5896'),('cef6351497644d72b953d3b2028d25a5','userName','String','否','姓名',4,'dff21b9976f64f9c9ed1fff39d9a9d1b'),('cf00ea0f93934ce59e6538183709afb9','token','String','是','令牌',1,'94a4b4adbeed48aca99267235d97781b'),('cf897821b5d949688cd4005693e491b9','myTeamId','String','是','企业码',2,'45f3e927c45b4447b74d59a728e807b5'),('cfe5c5854c3844f0862d601bee7f557e','myTeamId','String','是','企业码',2,'72ad114d06fe4812bae7dd4449b89971'),('d11a7534ad8743539e11199d9b7767fc','userPhone','String','是','用户手机号',0,'b44cc2e23e6e4f2eb2761bf672b6fb0f'),('d151e7a989e54ce29a048389efc8f9a8','checkerName','String','是','审批人姓名',8,'b5a03ad641ba4dd7b3a8124d8bab42e5'),('d18cc3e146664f17b13b62d41043c4c6','breedId','String','是','养殖信息Id',3,'6db79ab903874e559cf799c0c5194be5'),('d266b7eec5964e68ba541d7158cd012d','userId','String','是','当前登录用户Id',0,'eb7654c6d8a742df8ee395aa480b8471'),('d2b0c88f84974de88e9b7e1cb490ab6d','userOwnerNum','Integer','否','权属人数',7,'56095eba55614987bf9945dd3d69566f'),('d2da24a5d3614539bd94fb9fd841adce','customerId','String','是','客户Id',3,'94a4b4adbeed48aca99267235d97781b'),('d3624cab5e0849068fe6fda2f4211e4e','userBirthday','String','否','出生年月',6,'dff21b9976f64f9c9ed1fff39d9a9d1b'),('d37fb9efd23642348dba4f7336a42586','userId','String','是','当前登录用户Id',0,'2c54c4e68d0844b48b12f78af93783dc'),('d3d6346272d94bee980232b7343dce55','token','String','是','令牌',1,'7d13aacf67af4ba9abe1b9f6733a9919'),('d3e583bf357449bcb4ea015f285231e3','myTeamId','String','是','企业码',2,'d4c12774a2e34da6ae5108b1ed19e25c'),('d3e8a9b2811844a287f6091433d30fce','token','String','是','令牌',1,'22e156f92d97482b8be66da2d13a52c4'),('d57011d2ac63404fbc3154c29526ff2a','customerId','String','是','客户的Id',3,'5ea6c6c4ba9646ceaf6d876845f90430'),('d5b75fd7933f462e99e86708c557e390','pageSize','Integer','是','每页商品数量',7,'f18e2df131ca433fb9629dad194ac600'),('d5c92fd7962447ab90a7127c6552c133','userId','String','是','当前登录用户Id',0,'76b40c145b294413878787e3ab3bb9ab'),('d61f7f2a0e754c91b62457a755f6210f','myTeamId','String','是','企业码',2,'cfa3c18f01d242a0ab91d684493a45dc'),('d62198a1a1224fb2a9c74b89e93e778c','myTeamId','String','是','企业码',2,'1219aa8936b24bd7ae26bdefc1b5165c'),('d634fa673fd846dd86dfc51bfdb9e48f','myTeamId','String','是','企业码',2,'5097f0bc6f10496f8783965acc53b8a5'),('d676d12e56684963a0a358c4a752116e','customerId','String','是','客户Id',3,'9f3bef34a9ea46afb8fba1515490efaf'),('d770fac7009e4701b9da07d8b32eac2b','customerId','String','是','客户Id或农户Id',3,'8b2bd88dc8cc4717b86bdbde6305b65d'),('d790985cba0b4f76841f8b991510ebf1','myTeamId','String','是','企业码',2,'8d5c6f7446634d8f85b759d6d3175a06'),('d803a50d45e24e0aba8aeda0b1e489e4','token','String','是','令牌',1,'d2e72fe6a0ba495fad4c2160f20ab73e'),('d847aec1d40341f08cf2b32714474f8f','userId','String','是','',0,'68b03974db434ab3bdd09d04dead9d6b'),('d87e90d3f71a4abc87983dae7053be49','customerId','String','是','客户Id',3,'b5a03ad641ba4dd7b3a8124d8bab42e5'),('d893847b07f7404e91ee48a38ffc68cc','farmerId','String','是','农户Id',3,'c99027475df5435ab5fd62633351b207'),('d8a04eea43014c3dbf2b54402819ca37','userPhone','String','是','联系电话',4,'0d0b67f8b5e447efbbe49115c41f5bb7'),('d8ad96e1273a4462bc7794955746dda4','followTitle','String','是','跟进标题',5,'5ea6c6c4ba9646ceaf6d876845f90430'),('d8cb2c7d8c1e429e95e851936dedfd82','goodsId','String','是','商品Id',3,'1b59b7d653454aedac39344693f7a027'),('d8cd23d837f74525916714b245007068','pageNum','String','是','页数',3,'322ff7ff769c41f6b1ab5e5d9c74570d'),('d90cc831e3f14e66b77a9a988649bec5','myTeamId','String','是','企业码',2,'76b40c145b294413878787e3ab3bb9ab'),('d9233384d7a64762a4a567942dd8ae3c','userId','String','是','当前登录用户Id',0,'322ff7ff769c41f6b1ab5e5d9c74570d'),('dac8d16852bf4bce8eef249207c8b9f9','userId','String','是','当前登录用户Id',0,'75b48036547c4d5390172b21a4491e93'),('db147e2ff87544d4b332368264253e89','userId','String','是','当前登录用户Id',0,'4bdc5ca52ef749829ba4bf281f397be2'),('dc16e175795f4ee3aed257c1c4503661','token','String','是','令牌',1,'77030f6cf1bd4572b9718d6f109add9a'),('dc59970f1143489e858197455db1909d','userId','String','是','当前登录用户Id',0,'8b2bd88dc8cc4717b86bdbde6305b65d'),('de4a28fb3efe42b1859c55168d526536','breedId','String','是','养殖信息Id',3,'1219aa8936b24bd7ae26bdefc1b5165c'),('de61134893954d689bc73259e181b88d','userId','String','是','当前登录用户Id',0,'000186dbcd4b436081cefc9fd13f8846'),('de7311aad4a24d16998c29539a49d7b2','userId','String','是','当前登录用户Id',0,'5ccff2b760ee4d588a41228d565b9aad'),('de858707c6c948f79bb53665a6492444','token','String','是','令牌',1,'8d5c6f7446634d8f85b759d6d3175a06'),('de947afd484c440194d6c853af32ad41','followContent','String','否','跟进内容',6,'09e37c8416f748f4b2d7fae1f8e670bd'),('de9b6df3677c4fc88b731b143dd912e3','userPlaceId','String','是','场地Id(农户经验Id)',2,'af4194226ffb4608b0bd9771b1d90254'),('dfe7504d17da49c89715c7f5d3e58be8','userName','String','是','收货人姓名',5,'1b85812f0be9490a84657a03500b4008'),('e00c8c6389ec4a298de1791d3638c81f','customerId','String','是','客户Id',3,'2dd479f0086942689837f2ca54852d34'),('e03304387cea4ea0b324edae09b0db5e','pageSize','String','是','每页显示数量',4,'7e995923923742a3bcf111287845011f'),('e0443f8df87443e09e7c46ee173cc5ac','myTeamId','String','是','企业码',2,'37c6ab15d18643379e3a3685dcb37a2b'),('e057f541a1c541b08872ee4931336747','token','String','是','令牌',1,'97b9990fc5124331b6f761cd267dc772'),('e06465ebdd004820bc80bdf388fd67a8','token','String','是','令牌',1,'d4c12774a2e34da6ae5108b1ed19e25c'),('e279ba708f65450e990b81fbe5935f33','assistId','String','是','申请的Id',3,'68feadadea904d6fa18c17aec18c98a7'),('e3400b8e33a6478896c912bd6fb4d381','token','String','是','令牌',1,'912a22a6fd734458ba1d56ae39b4cde9'),('e35bc0e8acf840b180cd56ba89f0c26a','token','String','是','令牌',1,'d757445966794da48bd9fae543d6debb'),('e3b2b42f9d0d4e31a1a0c59dec8b47dd','token','String','是','令牌',1,'b438e782f0444b07b3ee397bc309bc7c'),('e5aa5d596249446abfe82c2f01c89332','userId','String','是','当前登录用户Id',0,'23e911701b1a49b58abf7b099e154c9c'),('e5d75ac341164c7aa69259015f0d6bcf','token','String','是','令牌',1,'b8e2d60dd0c64f49b9fe6bcb50bfe078'),('e5fd2d77213643da9f5af290b015a727','userPlaceId','String','是','场地Id(农户经验Id)',2,'cff91a59858c422fa6c4f709b89e3603'),('e6d602fe9f294a369a80a775ac930a3e','userAddress','String','否','住址',7,'dff21b9976f64f9c9ed1fff39d9a9d1b'),('e6f0b0e97e044084a7b051ac71f80173','assistId','String','是','申请的Id',3,'1dd677ec548443b08eb3d5611f17a3ae'),('e812287dba6242668296bf0d2d989522','token','String','是','令牌',1,'015b1e3ea6a24a65ba6bfbb9284d8f30'),('e8d7bcd868314d14af5aaca36ecb5869','userId','String','是','当前登录用户Id',0,'163325edc6ab4e32afb3b189bdfe68d2'),('e9129552b6b34b27aa985a1dbe2adea3','token','String','是','令牌',1,'49a557aabb3641119a08803f8c08b8dd'),('e9c91dbe2194445f85b3453bd6f0dd58','orderBy','String','否','排序类型',4,'f18e2df131ca433fb9629dad194ac600'),('eb96459c96494e3eb70f61da2bb8d19a','userId','String','是','当前登录用户Id',0,'b01576d116e743e398c4237c9c1b4bcb'),('eb9edb7fe79a4315849c67de2f61ace2','json','String','是','养殖信息(json对象字符串)',4,'22e156f92d97482b8be66da2d13a52c4'),('ebaa714d0f6c4a2bbd976434203cd553','userId','String','是','当前登录用户Id',0,'623c680edca6456b89f275ab8c614bf7'),('ee1a8a1ade0f4768b5c215130ed99f47','pageSize','Integer','是','每页显示数量',5,'9f3bef34a9ea46afb8fba1515490efaf'),('ee5f5fd7c01644d0b8a959f2c3856561','img','File','是','上传的图片',4,'94a4b4adbeed48aca99267235d97781b'),('ee67dffbccfb487e8500290c1a9be599','token','String','是','令牌',1,'1b59b7d653454aedac39344693f7a027'),('f09e7eb9f81f4d6fbce924a34d92689f','token','String','是','令牌',1,'af4194226ffb4608b0bd9771b1d90254'),('f182854be0ae4405b45ffccadc1b1c9b','followId','String','是','跟进Id',3,'09e37c8416f748f4b2d7fae1f8e670bd'),('f2cdcf9906484e069076022e04fa1e71','myTeamId','String','是','企业码',2,'ae90901e86b7472899c20756136e7cc8'),('f3439cace6e04d3d9bad4d71daf0a8fc','userId','String','是','当前登录用户Id',0,'1219aa8936b24bd7ae26bdefc1b5165c'),('f3487b5858824f93b260fabc6fe98c45','pageSize','String','是','每页显示数量',4,'4009414df88f4c60a0f3854838c9e619'),('f3ec40e409304ca78b187382fcf50356','token','String','是','令牌',1,'590cb636436a49f788f763689af707ed'),('f42f82f15170406d82f8c3b2243dd816','userPlaceAcreage','Integer','否','占地面积',5,'2c54c4e68d0844b48b12f78af93783dc'),('f4d884f2f077491c889b3f57efa30370','imageId','String','否','图片Id',13,'23e911701b1a49b58abf7b099e154c9c'),('f56c964475e54317897a89c276fac47a','json','String','是','养殖信息(json对象字符串)',4,'6db79ab903874e559cf799c0c5194be5'),('f684a15e2a0b43e3902acd5cb8ada9b9','userId','String','是','当前登录用户Id',0,'2ba65c8300dd4fa48aabfd849a5efb80'),('f6906c5f8a7f47a18991df16428569ed','promoterId','String','是','业务员Id',4,'72ffcee59d9140cca65868e7e95ead29'),('f6b58cb23ddb4572a9bfb6d201a5ecf6','assistResult','String','是','协助结果',4,'68feadadea904d6fa18c17aec18c98a7'),('f6f75835a3584ebcad385558bff57f80','userId','String','是','当前登录用户Id',0,'45f3e927c45b4447b74d59a728e807b5'),('f7666fc964d74e2da37acbcc9b5913b3','token','String','是','令牌',1,'df2341d553fb4ca6aa2fbfcff7ee09d6'),('f9e09596c3f940d6aff6fb1f47f3e927','myTeamId','String','是','',2,'68b03974db434ab3bdd09d04dead9d6b'),('fa18e2c50d7349429a5df265c09c7459','userPlaceId','String','是','场地Id',3,'2c54c4e68d0844b48b12f78af93783dc'),('fa19e7dfccf342d6acba67dea3f3a0b2','userPhone','String','否','联系电话',5,'dff21b9976f64f9c9ed1fff39d9a9d1b'),('fa1ab94460bc4ae096a743bd13bb6d5f','myTeamId','String','是','企业码',2,'4a4cfc3d2e9d467ea8ffc0077745238f'),('fa71119158ea4fd38a0400e6ec2a80b5','token','String','是','令牌',1,'deaa839f56ce4323a46687a284f4502c'),('fa8106cae91440cfad6716f0cc600e89','manageType','String','否','经营类目（多个用逗号\",\"分隔）',6,'be58dab447ee4d84b517846e1bc1372c'),('fb04d4af59f34b9cb3aadafb1cbf3067','pageNum','String','是','页数',3,'7e995923923742a3bcf111287845011f'),('fbb215dcaf73429aacf3139c97879259','userId','String','是','当前登录用户Id',0,'87ee0eceaa3348a99c72b16f6bb44afb'),('fc9e208349f549cead9c3bb3eacf9a4a','followId','String','是','跟进Id',3,'13a33a322fe844a7bcd481664b367f1c'),('fce557f7a8ab43bda4070927bd8550e5','userId','String','是','当前登录用户Id',0,'689bc97709b949019ab4e381744e0639'),('fd0b702598794f688cf98426973755b9','token','String','是','令牌',1,'2dd479f0086942689837f2ca54852d34'),('fd0d673327ee45ecae84d506b6d0f86d','myTeamId','String','是','企业码',2,'be58dab447ee4d84b517846e1bc1372c'),('fd7eb120d8b14f0a83b373c951633fcb','userId','String','是','协助者用户Id',9,'23e911701b1a49b58abf7b099e154c9c'),('fdef5dc2b4f24be2a8f08132854ebefc','token','String','是','令牌',1,'53f8cb30bc1747b3a1c9800aa377117b'),('fe39cedc4fc84283b91115db046a0689','token','String','是','令牌',1,'76b40c145b294413878787e3ab3bb9ab'),('fec21e63a49f4c09a4bf0edd1c1abcf7','userId','String','是','当前登录用户Id',0,'8d5c6f7446634d8f85b759d6d3175a06'),('ff51ee2486e64ffdb8db8799045509d7','customerType','String','否','客户类型 (不传返回所有类型的客户)',5,'4009414df88f4c60a0f3854838c9e619'),('ffbc1b91644443c9b8347a1e51d97e9e','sort','String','否','排序方式',5,'f18e2df131ca433fb9629dad194ac600');
/*!40000 ALTER TABLE `interface_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface_response`
--

DROP TABLE IF EXISTS `interface_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface_response` (
  `response_id` varchar(35) NOT NULL,
  `response_name` varchar(35) NOT NULL,
  `response_type` varchar(10) NOT NULL,
  `response_text` varchar(255) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `info_id` varchar(35) NOT NULL,
  PRIMARY KEY (`response_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface_response`
--

LOCK TABLES `interface_response` WRITE;
/*!40000 ALTER TABLE `interface_response` DISABLE KEYS */;
INSERT INTO `interface_response` VALUES ('004d4a32d2be442b81c19b5500ddc997','userImg','String','用户头像',14,'623c680edca6456b89f275ab8c614bf7'),('016bc227d99f41fca14f9ec8832a77ec','token','String','下次请求的令牌',1,'c773ee64b481484cb433b0b814194fa0'),('02cb8618fe33438599599398b66d7334','result','String','申请的Id',2,'23e911701b1a49b58abf7b099e154c9c'),('02ec62e3af7d4907ba03180e837eae3d','state','Integer','1为成功，2为失败',0,'dff21b9976f64f9c9ed1fff39d9a9d1b'),('0312177c37444dda8e6eb78fe8890074','userName','String','联系人姓名',3,'3315be9003d7486db2ee1d4761a4455b'),('034aca785c0f4e5e91a61d6d341bfc72','rCloudToken','String','融云token',10,'ae90901e86b7472899c20756136e7cc8'),('039f30bfcde4420bb725eb018a6731f0','state','Integer','1为成功，0为失败',0,'1b85812f0be9490a84657a03500b4008'),('0400771f793c4f86b697c3cb2fc2d70f','state','String','1为成功，2为失败',0,'c05bf841e4ee449a81bc7c011d06e970'),('0441d38d158d4c4cafc196c3b12ab645','userPhone','String','手机号',7,'6c4e7a503eca4112b4a734d50f3e7812'),('04a7e4ea957e4c308e8bd01064a46b8f','myTeamId','String','企业码',6,'ae90901e86b7472899c20756136e7cc8'),('053a332d9ad94a5bb40d28c811d5df41','state','Integer','1为成功，2为失败',0,'76b40c145b294413878787e3ab3bb9ab'),('059441fd6e3942808a06f35246d33381','manageAcreage','Integer','经营面积',8,'4bdc5ca52ef749829ba4bf281f397be2'),('05cd94c92d06405580a77d097e493242','manageAcreage','Integer','经营面积',8,'75b48036547c4d5390172b21a4491e93'),('05f71dcff3514b5e8e1f4fd98bb661e9','followContent','String','跟进内容',8,'49624057be4445559f93489bb2cccee4'),('06b170222967423eb6226ed91b00ecf4','state','Integer','1为成功，2为失败',0,'eb7654c6d8a742df8ee395aa480b8471'),('06b1a2007aa841cfb91d29d301a7da8d','state','Integer','1为成功，2为失败',0,'4009414df88f4c60a0f3854838c9e619'),('0806b81bc582409980c4d39d089c07e2','teamDepartmentName','String','部门名称',4,'53f8cb30bc1747b3a1c9800aa377117b'),('08cfd9a9bade408aa04db5d68151804e','result','Array','json数组',2,'c05bf841e4ee449a81bc7c011d06e970'),('09279e2bb1af433eb1dc70805834e4f4','state','String','上传结果，1为成功，2为失败',0,'6414f8e5d33f4a93a7793df1459a90cb'),('092d39a2078940708200c782971c09c4','token','String','下次请求的令牌',1,'c05bf841e4ee449a81bc7c011d06e970'),('095bcf2bd6704b09957b7aaaabe79900','standardId','String','规格Id',19,'93c6a85d73cc4b3f9071f60445ba0eb1'),('096705b04e654b74ac84f6959d5c15f4','farmerName','String','农户姓名',5,'489a8428ee114557a34ab2cbb8be70a2'),('09a066158aea495ea2ca5add10fe482c','token','String','下次请求的令牌',1,'689bc97709b949019ab4e381744e0639'),('0a1267e9b3e5409eb396e2fbd9e7bd9d','manageAcreage','String','经营面积',7,'8d5c6f7446634d8f85b759d6d3175a06'),('0a1d8fcc2b6d4547bbdb4deb964da411','currentCount','Integer','总部当前库存',24,'b501882d44af4ad7b8bdb9ae48149acc'),('0a3cce269f2e4d8ea57ed97bace617ce','livestockNum','Integer','存栏数量',14,'cff91a59858c422fa6c4f709b89e3603'),('0ad7aa04b21b487bb698c1f2007c657b','userId','String','跟单员的用户Id',3,'c05bf841e4ee449a81bc7c011d06e970'),('0ad8371c421f4a58aeb30a708bc3b4a4','userName','String','姓名',7,'4009414df88f4c60a0f3854838c9e619'),('0b8a693d70354bc7a4d1f15af1105ee0','token','String','下次请求的令牌',1,'6a8b2e211bdb4ab8a990af919abb5f2b'),('0b9f0e2d9c7d4c04ae88fd10b21f5e57','token','String','下次请求的令牌',1,'4bdc5ca52ef749829ba4bf281f397be2'),('0c1cec3f07ce4314b847d6dc34dca598','state','Integer','1为成功，2为失败',0,'365177c2935b4857aa6e39362cfb3694'),('0c27092ecc624a9f86e25d97ac1f0446','token','String','下次请求的令牌',1,'701aae07c8d94171a5d4fe8cf0622511'),('0c759b61e31f4180bf9f339ef9bdf27c','customerId','String','客户的Id',5,'9f3bef34a9ea46afb8fba1515490efaf'),('0d3750bc049d4375ae6d905b348991e5','customerType','String','客户类型',3,'eb7654c6d8a742df8ee395aa480b8471'),('0dae2788def74b2ebba2bb6a8003f940','state','Integer','1为成功，2为失败',0,'8d5c6f7446634d8f85b759d6d3175a06'),('0db21bea91bf47a291934f327f4d18b9','result','Array','json数组',2,'eb7654c6d8a742df8ee395aa480b8471'),('0dfe9589f5ea424e9552cc8c5a59bb5f','departmentId','String','部门Id',3,'c52b9536af934afba04226aae9f530e9'),('0e04107383e24327a434120e74d716a0','userId','String','申请人的用户Id',7,'610442c7ecc34b46a419a919e2c78126'),('0e24fba57cfd430eae983beeba0672e8','updateCount','Integer','更新次数',14,'3919f61cc5bb4d459c52b0c98bc216da'),('0e2677020734459f800ae23d653b1744','token','String','下次请求的令牌',1,'5ccff2b760ee4d588a41228d565b9aad'),('0e46c656e1ef47a19d5a26447fcef8d8','token','String','下次请求的令牌',1,'d757445966794da48bd9fae543d6debb'),('0f074e1755bb43bd977f4038ea45a580','livestockNum','Integer','存栏数量',14,'2d9196ddb2024b9581bfcb510fb2cce5'),('0f292b72bad1411386cb2a24d4eed9a9','state','Integer','1为成功，2为失败',0,'3919f61cc5bb4d459c52b0c98bc216da'),('0f4581ed5d08476f810b8db7a53de6f7','breedAge','String','养殖年限',7,'cff91a59858c422fa6c4f709b89e3603'),('0f51ee15cab94038864216d25df2c039','userArea','String','用户地区',7,'4d3bd0c8d6cf4631908d3132b72c9aa0'),('0f628c02a6c44127a949cab5b36a02fc','result','Array','json数组',2,'000186dbcd4b436081cefc9fd13f8846'),('0f86a981903142d1853f4e7fdb20bc9a','userCardHand','String','手持身份证照片',18,'3919f61cc5bb4d459c52b0c98bc216da'),('0fb61d75264944e399674b5ad76e0a93','userAddressId','String','收货地址ID',7,'3315be9003d7486db2ee1d4761a4455b'),('0ff07167f94a43d6bd037f3f735f94b0','result','Array','json数组',2,'701aae07c8d94171a5d4fe8cf0622511'),('100ced9d49fc4b8f992a26a19bc4457a','result','Array','json数组',3,'8b2bd88dc8cc4717b86bdbde6305b65d'),('10638c33048546e4890b95dba412d6f5','userCreateDate','Timestamp','建档时间',13,'3919f61cc5bb4d459c52b0c98bc216da'),('1073c2710e6e4180a97cca4b9862b873','goodsImage','String','商品图片',22,'93c6a85d73cc4b3f9071f60445ba0eb1'),('109b583309e7492893cca7ac7dab7e71','token','String','下次请求的令牌',1,'eb7654c6d8a742df8ee395aa480b8471'),('10f6bced1517436a9fb8694333cd21cf','count','Integer','部门人数',6,'53f8cb30bc1747b3a1c9800aa377117b'),('12c783cce73b4170bce9c3de5d80a8a1','token','String','下次请求的令牌',1,'2dd479f0086942689837f2ca54852d34'),('12fdf3c4e9504d5d852702fbd3e85a75','assistReason','String','申请原因',5,'1dd677ec548443b08eb3d5611f17a3ae'),('135e9c19e8744e15a2e760b118e80d65','goodsPrice','String','商品价格',6,'68b03974db434ab3bdd09d04dead9d6b'),('136c2b70e9924674a34b041f3b8942bc','state','String','上传结果，1为成功，2为失败',0,'10ee376f64a7404d8f24c453401dc335'),('139c1a31dd6a43c7ad800c519826b6c0','customerName','String','客户姓名',6,'fdfb3ca5b15b4ed3b93550f45d5ad710'),('13c2b7b772b14973aa7dfe6d0724477f','state','Integer','1为成功，2为失败',0,'322ff7ff769c41f6b1ab5e5d9c74570d'),('144cdd3691264d0780c2d1ac5059b01f','applyRemark','String','备注',12,'93c6a85d73cc4b3f9071f60445ba0eb1'),('14f066aa5c294c8d9f568b4184ae0d93','userName','String','用户名',2,'4d3bd0c8d6cf4631908d3132b72c9aa0'),('150cdaf5d7ac4c60ab85fe98183faf8d','userImg','String','用户头像',15,'4009414df88f4c60a0f3854838c9e619'),('15264bdca4fc4863ae5d998638520864','state','Integer','1为成功，2为失败',0,'7d13aacf67af4ba9abe1b9f6733a9919'),('16324ea2767047f79b96d865622fa7c5','userName','String','申请人的姓名',8,'610442c7ecc34b46a419a919e2c78126'),('165e621bf0ce457caae9503c8902ffab','userName','String','姓名',5,'eb7654c6d8a742df8ee395aa480b8471'),('16dbf6a72f2d4843b2ef256e5c2b9a56','teamDepartmentName','String','部门名称',4,'000186dbcd4b436081cefc9fd13f8846'),('1786fda45c1b452585baf5bd52095189','token','String','下次请求的令牌',7,'ddd54c231a964cb9ae4ed58da6e9a06b'),('17ba0bf827c74ba0954cf4e0023131e9','assistReason','String','申请原因',6,'7e995923923742a3bcf111287845011f'),('188e00ece047464c98824a3a4888c678','state','Integer','1为成功，2为失败',0,'b01576d116e743e398c4237c9c1b4bcb'),('1896a5ee98b044c2bc9f8c8a08046819','userName','String','用户名称',4,'76b40c145b294413878787e3ab3bb9ab'),('18a5772d652346ceb5ea4fda63496589','pageCount','Integer','总页数',2,'7e995923923742a3bcf111287845011f'),('18c2918ea999431bb9ab50144d09334d','result','Object','json对象',2,'cff91a59858c422fa6c4f709b89e3603'),('18eaed8c77b64275b3da386e5855a688','userAddress','String','住址',10,'4009414df88f4c60a0f3854838c9e619'),('19490ac03a7d4175811e368f966d741d','merchandiserName','String','跟单员姓名',8,'590cb636436a49f788f763689af707ed'),('1955ee005b8c4de4b090b019c7de3443','result','String','json对象',2,'1b59b7d653454aedac39344693f7a027'),('19a56b959d0742c7838bc710c51aebf7','checkerId','String','审批人的用户Id',9,'fdfb3ca5b15b4ed3b93550f45d5ad710'),('1a003ca8fda04d7b84cc0daa9a5c4f1b','token','String','下次请求的令牌',1,'9f3bef34a9ea46afb8fba1515490efaf'),('1a3d3dc92fcf4b8d9fa86ae0b432ab15','applyStatus','String','申请的状态',5,'93c6a85d73cc4b3f9071f60445ba0eb1'),('1b03853afee74699a15203edff1490d5','userId','String','客户的用户Id(融云Id)',16,'4009414df88f4c60a0f3854838c9e619'),('1b2f018537ba47c09dd1bcbfc6cca391','result','String','建账申请的Id',2,'b5a03ad641ba4dd7b3a8124d8bab42e5'),('1b331c7a41ec44c5bdc64624dc37ab08','state','Integer','1为成功，2为失败',0,'2ba65c8300dd4fa48aabfd849a5efb80'),('1b6903c7221547238a12c6d4bb02c937','farmerName','String','农户姓名',5,'2dd479f0086942689837f2ca54852d34'),('1b6d48ee60384a0aace496c32f8509af','token','String','下次请求的令牌',1,'1b85812f0be9490a84657a03500b4008'),('1b7149ecb01a4c8485df27c26c95ee04','proposerId','String','申请人的用户Id',9,'b501882d44af4ad7b8bdb9ae48149acc'),('1b733e6f04484aa7b197c0457abced24','state','Integer','1为成功，0为失败',0,'09e37c8416f748f4b2d7fae1f8e670bd'),('1b96d0ec1ca944fe85d4e176fa34b510','proposerName','String','申请人的姓名',9,'93c6a85d73cc4b3f9071f60445ba0eb1'),('1baceb5783c9419eaf88fc7a9fc5a850','userImg','String','用户头像',6,'cfa3c18f01d242a0ab91d684493a45dc'),('1bd87a98900d445d8522ebf7aee077a1','proposerName','String','申请人的姓名',10,'b501882d44af4ad7b8bdb9ae48149acc'),('1c336f59c4dc4eb2b09769ebf7915737','environmentList','Array','场地环境(json数组)',14,'b01576d116e743e398c4237c9c1b4bcb'),('1c3eae9543374320a10aa950c822f50c','customerType','String','客户类型',5,'4009414df88f4c60a0f3854838c9e619'),('1c4ab524d8e6440f9218decc203ac723','followContent','String','跟进内容',8,'199830f70dcc47c2946b69656a3ca65d'),('1d5e63f8b19e4ed4a81125b6b78e9ce2','femaleNum','Integer','母体数量',8,'2d9196ddb2024b9581bfcb510fb2cce5'),('1d5e940d7ba54dfb8acd3332e90b753b','assistId','String','申请的Id',4,'7e995923923742a3bcf111287845011f'),('1dfa0db530a84572be82d729715598ca','imgId','String','图片Id',15,'8b2bd88dc8cc4717b86bdbde6305b65d'),('1e205204726d40ac8879eecdcaafa10e','token','String','下次请求的令牌',1,'3919f61cc5bb4d459c52b0c98bc216da'),('1e2104fd7ef84907925d79ffaffaabbd','userAddress','String','地址',5,'cfa3c18f01d242a0ab91d684493a45dc'),('1e7e6613f0ca4045994cf7db7a006a35','result','Array','json数组',2,'590cb636436a49f788f763689af707ed'),('1ec2e5c88da94575be2d5c291c583b78','businessAddress','String','经营地址',13,'4009414df88f4c60a0f3854838c9e619'),('1f08d2cdd09e40bf9f99b333dfc98ab6','state','Integer','1为成功，2为失败,3为已分配',0,'97b9990fc5124331b6f761cd267dc772'),('1f150f96e60143688dbf549fa8f123ab','result','Array','json数组',3,'365177c2935b4857aa6e39362cfb3694'),('1f3c8e0759864836a1313032c07957e8','userAddress','String','经纬度',6,'9205c489f42f4634a8148de0200384b9'),('1f990f370fae4cb193bf340581f5fc27','standards','String','json(数组)规格',9,'1b59b7d653454aedac39344693f7a027'),('1fb06744a2bb4ffc847fa01652963995','token','String','下次请求的令牌',1,'6c4e7a503eca4112b4a734d50f3e7812'),('1fbd044efe8849dfa33e7711bdebe414','state','Integer','1为成功，2为失败',0,'5097f0bc6f10496f8783965acc53b8a5'),('1fc925243c2941be903c3e920d6f3a18','imageList','Array','证明图片(json数组)',17,'1dd677ec548443b08eb3d5611f17a3ae'),('20431a30292e4146a0583174d4ec539b','state','Integer','1为成功，2为失败',0,'23e911701b1a49b58abf7b099e154c9c'),('20fcf64827fb4b92adb980946d03ae49','result','Array','json数组',3,'2dd479f0086942689837f2ca54852d34'),('2126987882d2453fbedd4a1cead4bb4f','userPlaceAcreage','Integer','占地面积',6,'b01576d116e743e398c4237c9c1b4bcb'),('21fa821a311d456dac102bf2ba9ffa1d','proposerName','String','申请人的姓名',4,'fdfb3ca5b15b4ed3b93550f45d5ad710'),('22928345513249778addfd8c18e17be0','manageName','String','单位名称',4,'8d5c6f7446634d8f85b759d6d3175a06'),('229525dd9c4b47efa552b0d5d93d4b68','userAlreadyUse','Integer','使用情况',9,'7dd5837b04d5432391976e8824ce5896'),('22b03afb27dd4510b4c96341d049d9e3','applyCode','String','申请单号',4,'93c6a85d73cc4b3f9071f60445ba0eb1'),('23782818d6044d63b4c43a76233e3a62','breedCategory','String','养殖类目',4,'cff91a59858c422fa6c4f709b89e3603'),('2438b3b39aa34f8caf4008d7200d7f70','state','Integer','1为成功，2为失败',0,'77030f6cf1bd4572b9718d6f109add9a'),('247cc46438bb4a138bc89be91871f5a4','customerName','String','客户姓名',6,'590cb636436a49f788f763689af707ed'),('2574ff6c6aa24eae9398af4b290ea02d','userPlaceId','String','场地Id',4,'365177c2935b4857aa6e39362cfb3694'),('25f011ae5854447582a0c1a9e3eeda91','state','Integer','1为成功，2为失败',0,'6db79ab903874e559cf799c0c5194be5'),('26393356f8244865851939df2924d750','state','Integer','1为成功，0为失败',0,'d757445966794da48bd9fae543d6debb'),('2676b8cab7d84d8aa3533be9b9c1af70','state','String','1为成功，2为失败',0,'54b4dd7bb9004e6189725e2148944ae9'),('26adc5bf1230454cbd26e7f3be52d28b','currentCount','Integer','总部当前库存',23,'93c6a85d73cc4b3f9071f60445ba0eb1'),('26c66c05850c4d7ead32c7cfc2e970fc','token','String','下次请求的令牌',1,'53f8cb30bc1747b3a1c9800aa377117b'),('2740d916117942dda2084bb44f2da341','token','String','下次请求的令牌',1,'d4c12774a2e34da6ae5108b1ed19e25c'),('278f8716135940358e95550f033b10ab','station','String','从事岗位',13,'623c680edca6456b89f275ab8c614bf7'),('27e09faca3bd4fab887d7a2707ae8587','environmentList','Array','场地环境(json数组)',14,'7dd5837b04d5432391976e8824ce5896'),('28591e5bde504ea9b6a50c6e9b8a9ec3','token','String','下次请求的令牌',1,'94a4b4adbeed48aca99267235d97781b'),('285ac28c31f74eae8654f07e1027bdd7','goodsId','String','商品Id',17,'b501882d44af4ad7b8bdb9ae48149acc'),('28f7e82940104ad5807a1888e8aa9095','result','String','图片路径',2,'689bc97709b949019ab4e381744e0639'),('291d84ebd8b94bc29b591c3edf1ddecb','typeName','String','类目名称',4,'af1379d79875405cbfba73d080e1cab2'),('2943560e9a18407b9f99aedfc15ba7dc','state','Integer','1为成功，0为失败',0,'000186dbcd4b436081cefc9fd13f8846'),('2979c74967864a4ea7daf1b1dfb616ea','state','Integer','1表示发送成功，2表示发送失败，3表示该账号未建账，4表示该账号已激活',0,'b44cc2e23e6e4f2eb2761bf672b6fb0f'),('2a32f86d54374a4b897305862a7697f0','manageId','String','经营单位Id',3,'8d5c6f7446634d8f85b759d6d3175a06'),('2a409ee1bbe243fca07a306d9fa1a5d6','departmentName','String','部门名称',15,'1dd677ec548443b08eb3d5611f17a3ae'),('2a697d41bc8444dbb68da48976758bb0','obstetricTableNum','Integer','产床数量',10,'2d9196ddb2024b9581bfcb510fb2cce5'),('2a83c9159e1446f4bc0d33f8fd6933e9','myTeamName','String','团队名称',5,'53f8cb30bc1747b3a1c9800aa377117b'),('2b314d25f96148118b2f4dd5c87f7608','goodsName','String','商品名称',5,'f18e2df131ca433fb9629dad194ac600'),('2b39f7f1531a4005b8e1b6083583fbe1','token','String','下次请求的令牌',1,'610442c7ecc34b46a419a919e2c78126'),('2b7bdf04241a4721b4e4aa3b6183499c','imgUrl','String','图片路径',13,'8b2bd88dc8cc4717b86bdbde6305b65d'),('2bbfbd998a6241b39b6db696af672484','competitiveBrand','String','竞争品牌',14,'163325edc6ab4e32afb3b189bdfe68d2'),('2c73ad9509a448ea85d320b8dab0ecfd','userSex','String','性别',10,'6c4e7a503eca4112b4a734d50f3e7812'),('2cb1c1555b184fb1a31b3afb787aca8a','token','String','下次请求的令牌',1,'5097f0bc6f10496f8783965acc53b8a5'),('2d17fef88ea84f718b5a26cdb67e0b7e','userBirthday','String','出生年月',7,'3919f61cc5bb4d459c52b0c98bc216da'),('2e42b1aec86649f7840356e614f8f3cd','pageCount','Integer','总页数',2,'163325edc6ab4e32afb3b189bdfe68d2'),('2e6684f931e842ec8b12e2cbf60b8ba7','userName','String','用户名',3,'cfa3c18f01d242a0ab91d684493a45dc'),('2e6b0eaec64a4cefa72dcf3daaf92974','customerName','String','客户名称',5,'199830f70dcc47c2946b69656a3ca65d'),('2e7f33bc64db4e239f09304de5b583ca','result','String','图片Id',2,'be6a4c3222e740f2b4ca5dc4265eb377'),('2ea8a63fd06241608d353266e97b07f7','goodsName','String','商品名称',5,'68b03974db434ab3bdd09d04dead9d6b'),('2ec967c2a1904a79b40e7f1287096368','requestReason','String','申请原因',11,'fdfb3ca5b15b4ed3b93550f45d5ad710'),('300b2fc2e58040aba9827c02a2000936','myTeamId','String','企业码',11,'cfa3c18f01d242a0ab91d684493a45dc'),('300bbd313cd44b748096ec8db8086f70','token','String','下次请求的令牌',1,'2ba65c8300dd4fa48aabfd849a5efb80'),('300e155965224f3fbf872232d5bfc104','breedId','String','养殖信息Id',3,'cff91a59858c422fa6c4f709b89e3603'),('303141d169184c6a931075d975d3d090','state','String','1为成功，0为失败',0,'cfa3c18f01d242a0ab91d684493a45dc'),('318bf6aed34d4d20823e2b9707d9b08c','pageCount','Integer','总页数',2,'68b03974db434ab3bdd09d04dead9d6b'),('328cd84dd73c4899a631268e32213619','state','Integer','1为成功，2为失败',0,'c773ee64b481484cb433b0b814194fa0'),('32a2bde7be5346e5941858b4f1a0df07','userPhone','String','联系电话',6,'3919f61cc5bb4d459c52b0c98bc216da'),('32e72c8cf2d04293871d292ef117ac50','imgId','String','图片Id',15,'365177c2935b4857aa6e39362cfb3694'),('333d00af64e94b78903819a98ed0e87a','imgUrl','String','图片路径',13,'b01576d116e743e398c4237c9c1b4bcb'),('344beca19fdc4d3980d73a4f04981961','token','String','下次请求的令牌',1,'b8e2d60dd0c64f49b9fe6bcb50bfe078'),('3454a3f75800458b9a4d84fef8e0544b','result','String','图片路径',2,'6414f8e5d33f4a93a7793df1459a90cb'),('345fdf9ce9b04e4598a655c00125e399','applyId','String','申请的Id',3,'93c6a85d73cc4b3f9071f60445ba0eb1'),('34a56ac7fc5f4938b4307948692abd88','assistId','String','申请的Id',4,'610442c7ecc34b46a419a919e2c78126'),('350698235f8a4af5aa34a5562d8ae6cd','goodsCode','String','商品编码',18,'b501882d44af4ad7b8bdb9ae48149acc'),('35162ef52049457db5214729d25eccb1','branchName','String','销售点名称',8,'b501882d44af4ad7b8bdb9ae48149acc'),('3525ce5cc8344f31a52da9108570252d','imgId','String','图片Id',15,'b01576d116e743e398c4237c9c1b4bcb'),('3539d12f20734432bfebf2b99e3c5276','approverId','String','审批人的用户Id',11,'b501882d44af4ad7b8bdb9ae48149acc'),('35b68c5d00ed4c219a9e1c2910a124c5','teamDepartmentId','String','部门Id',3,'000186dbcd4b436081cefc9fd13f8846'),('35f26c5dbf8d4862b74e12b538a5d5ce','goodsType','String','商品分类',25,'b501882d44af4ad7b8bdb9ae48149acc'),('35f764a4507c45a6ad0bcafe75be4bb9','json','String','养殖信息(json对象字符串)',5,'af4194226ffb4608b0bd9771b1d90254'),('366c08a97ead4563be184bf9a998ac5e','state','Integer','1为成功，0为失败',0,'9205c489f42f4634a8148de0200384b9'),('373f1edab623405daa73ef3e3c4db189','acceptDate','Timestamp','审核通过时间(时间戳)',14,'93c6a85d73cc4b3f9071f60445ba0eb1'),('37646e19e4eb4eb2879f834a13b9642c','shedNum','Integer','兰舍数量',12,'163325edc6ab4e32afb3b189bdfe68d2'),('37e0cf81e7604a99a5879201faee7e8d','goodsId','String','商品Id',4,'68b03974db434ab3bdd09d04dead9d6b'),('38d1fafb227b4819bd8fca8f32196496','userPhone','String','收货人联系电话',4,'3315be9003d7486db2ee1d4761a4455b'),('38ed27fb4de046f989e95c499a0ef01f','permissionType','String','角色代码',3,'c773ee64b481484cb433b0b814194fa0'),('38f2f1df143944c9a96fa5a561d8ca14','result','Array','json数组',3,'4009414df88f4c60a0f3854838c9e619'),('39c302674d99464395bd866531136e24','userName','String','用户名称',4,'c05bf841e4ee449a81bc7c011d06e970'),('3a01c99783b74930ae09d641e7863d6a','token','String','下次请求的令牌',1,'b6625b81b5884825ad1c51072eb22d94'),('3ae66dfe346f415ba5b0509e9fe5c572','state','Integer','1为成功，0为失败',0,'13a33a322fe844a7bcd481664b367f1c'),('3b591e74eeee4ca28ca17c505d60ca41','state','Integer','状态码：1表示发送成功，2表示发送失败，3找不到该用户，4表示用户未注册',0,'9a14b37330e54b38abadd056f18d10fe'),('3b7092a2fab0480da0fbc285c56b4fc2','userId','String','协助者用户Id',13,'1dd677ec548443b08eb3d5611f17a3ae'),('3b7c896575024a48bd91338e67559423','customerId','String','客户Id',5,'590cb636436a49f788f763689af707ed'),('3bd4a0728a974acd9b81e7d58b5f917b','checkerId','String','审批人的用户Id',9,'e382083c97824a95a707e7459b6df1e2'),('3c58ba5108264dfbb1d2009f152764c5','standardWeight','Float','规格重量',12,'322ff7ff769c41f6b1ab5e5d9c74570d'),('3cb7d89b413c4d34aefa81433e3e7102','result','Array','json数组',2,'623c680edca6456b89f275ab8c614bf7'),('3d45130da9b343b9b91eae774a4ea185','manageAddress','String','地理位置',6,'4bdc5ca52ef749829ba4bf281f397be2'),('3d49bc8fe0b749b3ae339496649ad8ec','businessAddress','String','经营地址',12,'623c680edca6456b89f275ab8c614bf7'),('3d5eba9a141c4d9ebb6084e7ceb396b6','infoId','String','信息Id',3,'77030f6cf1bd4572b9718d6f109add9a'),('3d6d8d63a2e94415bd0f53ed8b0b7719','state','Integer','1为成功，2为失败',0,'af4194226ffb4608b0bd9771b1d90254'),('3da5d2a9777a444aae3ad73154765b8a','result','Object','json对象',2,'199830f70dcc47c2946b69656a3ca65d'),('3e81e349035d49059af31dfa966e2921','state','Integer','1为成功，0为失败',0,'53f8cb30bc1747b3a1c9800aa377117b'),('3e8f464ba11841369ded1654edb1e2c1','checkerName','String','审批人姓名',10,'590cb636436a49f788f763689af707ed'),('3eba6f31c90b40ac9c4c19998db67925','userAddress','String','住址',8,'eb7654c6d8a742df8ee395aa480b8471'),('3ece4a3248fd4337ae6e24a05bc48037','userImg','String','头像图片路径',5,'c05bf841e4ee449a81bc7c011d06e970'),('3f94d5ddef5843f68d16e15b2417a531','state','Integer','返回1登录成功，2账号密码或企业码不对，3该账号未激活，4没有该账号信息,5融云token获取失败',0,'ae90901e86b7472899c20756136e7cc8'),('3ff32d8fd1294e7fbe1842e4a6142a58','customerId','String','客户Id',3,'623c680edca6456b89f275ab8c614bf7'),('40ab2f01c1474be5aa0f0cbe198f4fe5','userName','String','申请人的姓名',7,'1dd677ec548443b08eb3d5611f17a3ae'),('40ca22c8cd934bc69666937960cc0f4c','userId','String','业务员的用户Id',3,'b8995f0262e64652ba85a136b3cb24c6'),('40f53481b7704657b904624066e5776c','userArea','String','收货地址',5,'3315be9003d7486db2ee1d4761a4455b'),('41329c31b6114b718a18bbb0699acfc5','customerId','String','客户的Id',4,'199830f70dcc47c2946b69656a3ca65d'),('4231a158410a4444912b573fe69edb1c','userCardBack','String','身份证背面照片',17,'3919f61cc5bb4d459c52b0c98bc216da'),('42c5265497cb4d10b892163afa56829e','result','Array','json数组',2,'93c6a85d73cc4b3f9071f60445ba0eb1'),('43318eb7fdc845ca9227113eb6f95262','imgUrl','String','图片路径',16,'7dd5837b04d5432391976e8824ce5896'),('43eee5f5077f4b2997540490e0cb0366','state','Integer','1为成功，2为失败',0,'72ad114d06fe4812bae7dd4449b89971'),('44b2c63cbad94d95b3cdffbf0f41212f','token','String','下次请求的令牌',1,'2c9a1b2c5e234a39b6363cf88ef3701b'),('44dda69946d34c6fa4d3720e18598b8a','userPlaceArea','String','场地位置',5,'8b2bd88dc8cc4717b86bdbde6305b65d'),('44e1e67e08e94f42b44b9c216b12fd2d','maleNum','Integer','公体数量',10,'163325edc6ab4e32afb3b189bdfe68d2'),('44f34ac80cfe42679c28a72a8a2fe90d','customerId','String','客户Id',4,'4009414df88f4c60a0f3854838c9e619'),('45a800ed44cd427d8c6b7b5c5633f506','followTitle','String','跟进标题',6,'199830f70dcc47c2946b69656a3ca65d'),('45bea0d4e6d14fb2b3b5a1c6b0333599','state','Integer','1为成功，2为失败',0,'df2341d553fb4ca6aa2fbfcff7ee09d6'),('46f061b5936544dcbe8e9aeaa438496c','goodsType','String','商品分类',24,'93c6a85d73cc4b3f9071f60445ba0eb1'),('47e72b5295594d058b77874f98a8b2db','token','String','下次请求的令牌',1,'8d5c6f7446634d8f85b759d6d3175a06'),('4841a7f4dafa4ca684a103ae0f6f8c48','result','Array','json数组',3,'b501882d44af4ad7b8bdb9ae48149acc'),('4843b01a8b9f44028ce840936bef870f','token','String','下次请求的令牌',1,'68feadadea904d6fa18c17aec18c98a7'),('485d2cadf7134af2bf2938c84ca55a2b','breedAge','Integer','养殖年限',8,'163325edc6ab4e32afb3b189bdfe68d2'),('48a2991ef3f84ae5a053a40a4f1ad1e1','standardName','String','规格名称',9,'322ff7ff769c41f6b1ab5e5d9c74570d'),('495bcebccca240a7b929505ad01fa84d','checkerId','String','审批人的用户Id',9,'590cb636436a49f788f763689af707ed'),('495d624a2c234a409ce279807e35a799','userPlaceAcreage','Integer','占地面积',6,'8b2bd88dc8cc4717b86bdbde6305b65d'),('496a53e11b324de68c610fb2d0223eaf','token','String','下次请求的令牌',1,'163325edc6ab4e32afb3b189bdfe68d2'),('4a12bc7f0b6f435785d89792c5adb6ca','state','Integer','1为成功，0为失败',0,'45f3e927c45b4447b74d59a728e807b5'),('4a1f868d023841e7b1aab27c17794799','state','Integer','1为成功，2为失败',0,'af1379d79875405cbfba73d080e1cab2'),('4afaa340fb744d15976fef18ec3c0812','userEmployeeNum','Integer','工人数量',10,'b01576d116e743e398c4237c9c1b4bcb'),('4b50533541e648c79cd572d67b53abe0','state','String','1为成功，0为失败',0,'87ee0eceaa3348a99c72b16f6bb44afb'),('4ccb65d86e76440fbe4d49244d671e04','result','Object','json对象',2,'1dd677ec548443b08eb3d5611f17a3ae'),('4d155c45f5c34aa983e7e80f521cd3d3','userUpdateTime','Timestamp','最后更新时间',15,'3919f61cc5bb4d459c52b0c98bc216da'),('4d4d770783ef4b8ba8f35db7438a836f','result','Object','json对象',1,'b6f3fb9478aa43398e96bd03823aa667'),('4d574155f0804970b151c54fb22f078e','token','String','下次请求的令牌',1,'ccbe4ccfa2a640bfa4d7f9650b0f1b73'),('4e8a00db89b24d48a65ac02b9fddc80f','result','String','图片路径',2,'7d13aacf67af4ba9abe1b9f6733a9919'),('4ead0eb21042448299791ed03387b41a','result','String','图片Id',2,'b8e2d60dd0c64f49b9fe6bcb50bfe078'),('4eae5c07b58046c0b666f527dd38afaa','token','String','下次请求的令牌',1,'cfa3c18f01d242a0ab91d684493a45dc'),('4ef1c04d07fd4772837cac4452567bf9','userPhone','String','联系电话',7,'623c680edca6456b89f275ab8c614bf7'),('4f1c7e47db72418d8eb72f61d0c33969','pageCount','Integer','总页数',2,'49624057be4445559f93489bb2cccee4'),('4f6fcacf14e2426b8b6ba3287e9705a7','state','Integer','1为成功，2为失败',0,'d2e72fe6a0ba495fad4c2160f20ab73e'),('4fcaac14b59c46408b5018f098cc6767','state','Integer','1为成功，0为失败',0,'c52b9536af934afba04226aae9f530e9'),('503fb378ea3c477dbbb6e17cbb634521','userPhone','String','用户手机',4,'4d3bd0c8d6cf4631908d3132b72c9aa0'),('508f3197d2424d5189789dc9c16809bd','createDate','Timestamp','申请时间(时间戳)',9,'7e995923923742a3bcf111287845011f'),('510c43406daa401b9f6a4e4293604cd4','userBirthday','String','出生年月',9,'4009414df88f4c60a0f3854838c9e619'),('517281c48f51411d81dbb0ea15cfba80','positionName','String','工作职位',10,'cfa3c18f01d242a0ab91d684493a45dc'),('53dd1a0bfd4041ed8960def62d72629b','userOwnerNum','Integer','权属人数',8,'365177c2935b4857aa6e39362cfb3694'),('544ad51797424e0a86047b22143c5152','state','Integer','1为成功，0为失败',0,'d4b77a8966c74d4a9b7fad1e9905b6cd'),('5594f8ba0cf34a6eb1c0944edd56fd4c','result','Array','json数组',2,'6a8b2e211bdb4ab8a990af919abb5f2b'),('55d58a17524f4fc092696876719ae4a9','obstetricTableNum','Integer','产床数量',11,'163325edc6ab4e32afb3b189bdfe68d2'),('55fa1660661b4af0aaa9f4604d39e021','state','Integer','1为成功，0为失败',0,'912a22a6fd734458ba1d56ae39b4cde9'),('56ad828c09034888b69617ddb3176bd9','customerId','String','客户Id',5,'e382083c97824a95a707e7459b6df1e2'),('56b6da604fec42629196add142bd4032','followResult','String','跟进结果',8,'13a33a322fe844a7bcd481664b367f1c'),('56e1b182251f4d5f895f93c372810683','standardWeight','String','规格重量',14,'1b59b7d653454aedac39344693f7a027'),('572ab52c81d74a3e8b761f9182daadde','userImg','String','头像',5,'b8995f0262e64652ba85a136b3cb24c6'),('57457f32e50046ceb0da56bc8ed41d2d','token','String','下次请求的令牌',1,'912a22a6fd734458ba1d56ae39b4cde9'),('57470c2753da4f5293a52e030e8896a0','merchandiserId','String','跟单员的用户Id',7,'e382083c97824a95a707e7459b6df1e2'),('57c1435e8659427484e886fae7ca3505','userName','String','成员名称',4,'d757445966794da48bd9fae543d6debb'),('57e8e831178b4e26ae31927f1908e6cd','state','Integer','1为成功，0为失败',0,'3315be9003d7486db2ee1d4761a4455b'),('583dcd5c54bd4bad895e2cfe4f7060d6','imgId','String','图片Id',12,'7dd5837b04d5432391976e8824ce5896'),('589cc42836d040d1ae198e68d1a9945e','userCreateDate','Timestamp','建档时间 (时间戳)',13,'eb7654c6d8a742df8ee395aa480b8471'),('58c9023dfdf1416f99e152648f656580','state','Integer','1为成功，2为失败',0,'d4c12774a2e34da6ae5108b1ed19e25c'),('596c219b767047059dfd70a3d4f372fd','json','String','养殖信息(json对象字符串)',16,'2d9196ddb2024b9581bfcb510fb2cce5'),('5a83c036e887469c99a4ef2ac3d45d96','femaleNum','Integer','母体数量',9,'163325edc6ab4e32afb3b189bdfe68d2'),('5aa76c36005e481b83d11e8944cd3b61','state','Integer','等于1表示验证成功并返回以下数据，2表示验证失败，3找不到该用户',0,'d94c8d7250784df58360ab333fb2e4ed'),('5acf9609ad7544f7bd65771e6a1245e4','goodsAttr','String','商品品牌',5,'1b59b7d653454aedac39344693f7a027'),('5b5e203a50fe469ea1d13806c55d0674','assistId','String','申请的Id',3,'1dd677ec548443b08eb3d5611f17a3ae'),('5d49166255464124a66d22f1798c1a7a','userAlreadyUse','Integer','使用情况',9,'b01576d116e743e398c4237c9c1b4bcb'),('5dc9bee6375e4de4a3606d79ff7bf6c5','token','String','下次请求的令牌',1,'b8995f0262e64652ba85a136b3cb24c6'),('5ee2253305a840bf97b168d013175279','result','Array','json数组',3,'49624057be4445559f93489bb2cccee4'),('6055adb5c1234a9a90b7fdb11e5f3bc3','result','String','图片路径',2,'10ee376f64a7404d8f24c453401dc335'),('605d9ba42b46449eb3bd3724459f849a','pageCount','Integer','总页数',2,'365177c2935b4857aa6e39362cfb3694'),('60a3cce3db3c4f949b2ce4762dd0619d','goodsName','String','商品名称',5,'322ff7ff769c41f6b1ab5e5d9c74570d'),('60c98b06635d4afd9f24b93f7bc8bf1d','userCardHand','String','手持身份证照片',18,'eb7654c6d8a742df8ee395aa480b8471'),('61a33b8b919f42f7b733c1d3619ea20e','userName','String','姓名',6,'623c680edca6456b89f275ab8c614bf7'),('61b7fcda288c476580fbf8316bbf4524','followContent','String','跟进内容',7,'13a33a322fe844a7bcd481664b367f1c'),('62159db2935f4dec9d30e1c4ec539e13','','File','图片文件',0,'f830bdc2357242e991992b6a2f9f3476'),('6269ac0e0e8c4a86be5f1356500dfc27','state','Integer','1为成功，2为失败',0,'2c9a1b2c5e234a39b6363cf88ef3701b'),('62eca918450644939df746e6d377f404','token','String','下次请求的令牌',1,'72ad114d06fe4812bae7dd4449b89971'),('6346fc3f0fb14a31a6a82e3ada53ae4f','result','Array','json数组',3,'322ff7ff769c41f6b1ab5e5d9c74570d'),('63b01d459451433a81b05c6b40ed5bf9','followDate','Timestamp','跟进时间(时间戳)',8,'9f3bef34a9ea46afb8fba1515490efaf'),('64aad3cd4eaf4c3ba1677df646be4bf9','realName','String','1表示通过实名验证，2表示没有',9,'ddd54c231a964cb9ae4ed58da6e9a06b'),('651775eb9a6a43d2ba4f4154f5b1668f','customerName','String','客户名称',5,'13a33a322fe844a7bcd481664b367f1c'),('67345dbd21624a2ebb86c2dc83564fd9','result','Array','json数组',2,'e382083c97824a95a707e7459b6df1e2'),('67c9379a8fdb473eafecc5d2915a6abf','userImg','String','用户头像',3,'ddd54c231a964cb9ae4ed58da6e9a06b'),('67f573e8a809463880125378d3589e54','state','Integer','1为成功，2为失败',0,'6a8b2e211bdb4ab8a990af919abb5f2b'),('690344286f6c4198bbaa7e46a7e134f1','requestReason','String','申请原因',11,'590cb636436a49f788f763689af707ed'),('6911084ccec1454bb6bcf3599da20d1f','state','Integer','1为成功，0为失败',0,'9f3bef34a9ea46afb8fba1515490efaf'),('691219bbda1f49d292b9b77928557dd6','assistTitle','String','申请标题',5,'610442c7ecc34b46a419a919e2c78126'),('6948edda4ea84eed83e5a45e30bd8929','goodsPrice','String','商品价格',6,'f18e2df131ca433fb9629dad194ac600'),('69a44036f8e44e1da530f641248d437e','result','Array','json数组',3,'489a8428ee114557a34ab2cbb8be70a2'),('69db1c3f2ca94819a1fd661253b89ecd','competitiveBrand','String','竞争品牌',13,'2d9196ddb2024b9581bfcb510fb2cce5'),('69f83fdf8dea423c930528f8dee13982','standardCount','String','规格库存',13,'1b59b7d653454aedac39344693f7a027'),('6a4b3767e6c74b3f9b49fba1412b87b3','state','Integer','1为成功，2为失败',0,'4bdc5ca52ef749829ba4bf281f397be2'),('6aa14b82fa384fb2ab10f875f886e03f','count','Integer','部门人数',5,'000186dbcd4b436081cefc9fd13f8846'),('6abb3263280d4ec98ffe1138916a8cbf','imgUrl','String','图片路径',16,'8b2bd88dc8cc4717b86bdbde6305b65d'),('6bfec4c7fed540cabb1904319edf5009','userPlaceType','String','场地类型',7,'7dd5837b04d5432391976e8824ce5896'),('6c0f42846ebc4f09a9169e347c233e7b','state','Integer','1为成功，2为失败',0,'b438e782f0444b07b3ee397bc309bc7c'),('6c1d2f04526b45efa5128987d6578649','userName','String','协助者名称',14,'1dd677ec548443b08eb3d5611f17a3ae'),('6cd45cc8c9c0465f9b6693a5548e34fd','state','Integer','1为成功，2为失败',0,'be6a4c3222e740f2b4ca5dc4265eb377'),('6d6459b9f61545a3aa5bd356a18bbbbd','shedNum','Integer','兰舍数量',11,'cff91a59858c422fa6c4f709b89e3603'),('6dd776438cfe422abbecaf0e70557b2c','token','String','下次请求的令牌',1,'5ea6c6c4ba9646ceaf6d876845f90430'),('6f860d1c1f42423883a4e18eda79a611','token','String','下次请求的令牌',1,'f18e2df131ca433fb9629dad194ac600'),('6f9a0944013c4a4cad2940f96f2306a3','followResult','String','跟进结果',9,'49624057be4445559f93489bb2cccee4'),('6f9b9ec7e68e46cb8a6c918f4c07bdac','json','String','养殖信息(json对象字符串)',16,'cff91a59858c422fa6c4f709b89e3603'),('6ff8a732348349178b7b1dee0b0ad027','teamDepartmentName','String','所属部门',9,'cfa3c18f01d242a0ab91d684493a45dc'),('7028a00aac104994928819ac0da754c9','goodsImages','String','json(数组)商品图片',7,'1b59b7d653454aedac39344693f7a027'),('70603ffb89e246e68ce5460d32839e8b','imgUrl','String','图片路径',13,'365177c2935b4857aa6e39362cfb3694'),('7070ba20033f405f8209b153777c3e12','result','Array','json数组',3,'7e995923923742a3bcf111287845011f'),('70f8a5cbb3c047f7a830d1c4de3e4c3e','result','Object','json对象',2,'fdfb3ca5b15b4ed3b93550f45d5ad710'),('71601c53a1ac47629d92bdcea3cc889d','breedCategory','String','养殖类目',4,'2d9196ddb2024b9581bfcb510fb2cce5'),('725e83b59bf64f08b4149edc338461f8','userPlaceType','String','区域性质',7,'b01576d116e743e398c4237c9c1b4bcb'),('726a332655b4424faa0df9720216ac99','result','String','场地Id',2,'56095eba55614987bf9945dd3d69566f'),('72ab37259fc943988cd02edc40ae77c6','goodsTypeId','String','分类Id',3,'701aae07c8d94171a5d4fe8cf0622511'),('730fa11bdef74809b40cfa70e305f904','standardName','String','规格名称',11,'1b59b7d653454aedac39344693f7a027'),('7351326e3ed64442bc052dc85ae27234','result','Array','json数组',3,'4bdc5ca52ef749829ba4bf281f397be2'),('7391340a833e45b5bb31d23b2fa30fb4','competitiveBrand','String','竞争品牌',13,'cff91a59858c422fa6c4f709b89e3603'),('73e156f58bbd45efbd741d4797480edf','myTeamName','String','团队名称',4,'6c4e7a503eca4112b4a734d50f3e7812'),('7416bde173ae4d619e282f1c037ec226','userName','String','用户名',3,'b6f3fb9478aa43398e96bd03823aa667'),('74226040db4e4f3b9041cb5548b11a62','assistResult','String','协助结果',16,'1dd677ec548443b08eb3d5611f17a3ae'),('7423f7e6422a45bfb08369f4ff0dabc1','token','String','下次请求的令牌',1,'b501882d44af4ad7b8bdb9ae48149acc'),('743d7aed6e694f5fa5327fbd31370f87','emptyShedNum','Integer','空栏数量',12,'cff91a59858c422fa6c4f709b89e3603'),('745d9bd242a4418db7242d3de7ab58cf','goodsName','String','商品名称',18,'93c6a85d73cc4b3f9071f60445ba0eb1'),('74681dffca7e4f698283382e411ca1f8','station','String','从事岗位',14,'4009414df88f4c60a0f3854838c9e619'),('74ec17b243a3494982f8b88774e28799','myTeamId','String','企业码',5,'ddd54c231a964cb9ae4ed58da6e9a06b'),('74f73879db434d02a19bf36b355d8606','token','String','下次请求的令牌',1,'22e156f92d97482b8be66da2d13a52c4'),('7527096904ad46a2ab4d0149aba9ff41','state','Integer','1为成功，0为失败',0,'68b03974db434ab3bdd09d04dead9d6b'),('75278a97a8ed44448be4f79137aba11b','requestReason','String','申请原因',11,'e382083c97824a95a707e7459b6df1e2'),('753247fbe5ee485487cb8757bad50d65','femaleNum','Integer','母体数量',8,'cff91a59858c422fa6c4f709b89e3603'),('7538e0021bf741a3a5cfe29e63a82540','token','String','下次请求的令牌',1,'c99027475df5435ab5fd62633351b207'),('7561f7a529bf4af0a368dc8b31a3ddbe','goodsSales','String','商品销量',8,'68b03974db434ab3bdd09d04dead9d6b'),('75c19c3d65f445d4ad1ff58a4f54bcf9','token','String','下次请求的令牌',1,'97b9990fc5124331b6f761cd267dc772'),('76056e48053e4d8d80b4ab5eaa2e8025','state','Integer','1为成功，2为失败',0,'49a557aabb3641119a08803f8c08b8dd'),('761e526c6a4d4b41aefec82876be440a','token','String','下次请求的令牌',1,'df2341d553fb4ca6aa2fbfcff7ee09d6'),('76a31e3cde2446c999a5d502decfbdd4','userPlaceArea','String','场地位置',5,'365177c2935b4857aa6e39362cfb3694'),('76c12ae4237b401b80408857e866e61e','state','Integer','1为成功，2为失败',0,'2dd479f0086942689837f2ca54852d34'),('76f9129470cc46c399c374838ecb7df5','manageType','String','经营类目（用逗号\",\"分隔）',7,'75b48036547c4d5390172b21a4491e93'),('777770af1cd34fc495e9097a4448f014','token','String','下次请求的令牌',1,'49624057be4445559f93489bb2cccee4'),('781811e533d74af7abc7f9cd4b654d90','userList','Array','协助者(json数组)',12,'1dd677ec548443b08eb3d5611f17a3ae'),('78efaa6fbd5e4f45acae5e6bdad27777','breedScale','Integer','养殖规模',16,'163325edc6ab4e32afb3b189bdfe68d2'),('794adc877b8a49c69834fa7578a01898','state','Integer','1代表请求成功，2代表失败',0,'93c6a85d73cc4b3f9071f60445ba0eb1'),('7968d1e791b04ff2a34de599f115aff1','assistTitle','String','申请标题',5,'7e995923923742a3bcf111287845011f'),('79ae0bf46e2d4ca19673cac079976389','token','String','下次请求的令牌',1,'590cb636436a49f788f763689af707ed'),('79b33481103a41128cb405abe87faf12','updateCount','String','更新次数',14,'eb7654c6d8a742df8ee395aa480b8471'),('79ba7b13e5704c5f90b627950b5732f4','state','Integer','1为成功，2为失败',0,'94a4b4adbeed48aca99267235d97781b'),('7a2ce784bcb3426e92b9e54fe7da56d7','userImg','String','头像',9,'6c4e7a503eca4112b4a734d50f3e7812'),('7a5fdc2d242f4f959c0b19a963873b84','result','Array','json数组',3,'68b03974db434ab3bdd09d04dead9d6b'),('7aa3e9f3a32241af92f145b47e8d6f10','userBirthday','String','出生年月',8,'623c680edca6456b89f275ab8c614bf7'),('7be521fb79e84c4791fab26fb516229d','emptyShedNum','Integer','空栏数量',13,'163325edc6ab4e32afb3b189bdfe68d2'),('7c05872403a2475b9810b3b62c1cd5d7','token','String','下次请求的令牌',1,'000186dbcd4b436081cefc9fd13f8846'),('7c51f1ea53c442d1ac46e9c19d2109dd','state','Integer','1为成功，2为失败',0,'75b48036547c4d5390172b21a4491e93'),('7cbe87e4f30c4b77a4e8326aa377d213','pageCount','Integer','总页数',2,'610442c7ecc34b46a419a919e2c78126'),('7d1e395fc7dd4d6b95e8057e7309d293','approverId','String','审批人的用户Id',10,'93c6a85d73cc4b3f9071f60445ba0eb1'),('7d44e78d7d2a4dca97adcd97c44d09c4','userOwnerNum','Integer','权属人数',8,'b01576d116e743e398c4237c9c1b4bcb'),('7d90b27ba268474c91a6549940c70081','goodsName','String','商品名称',19,'b501882d44af4ad7b8bdb9ae48149acc'),('7dda7aea0b81495fba8c82e6e5ccf23f','token','String','下次请求的令牌',1,'e382083c97824a95a707e7459b6df1e2'),('7def1e577e2042509692f24627e17b3d','userId','String','申请人的用户Id',6,'1dd677ec548443b08eb3d5611f17a3ae'),('7e5481d89a204b5f9f81edf2f5f4823f','memberId','String','成员的用户Id',3,'d757445966794da48bd9fae543d6debb'),('7ea84a7349af4ae89b3d0c92b999b061','token','String','下次请求的令牌',1,'56095eba55614987bf9945dd3d69566f'),('7f08f2815c05404fbc9fe8c00d84be60','token','String','下次请求的令牌',1,'c52b9536af934afba04226aae9f530e9'),('7f10b63a239f49a6889b51d8b38ff9e1','token','String','下次请求的令牌',1,'1219aa8936b24bd7ae26bdefc1b5165c'),('7f29902daa524ed1b68bc9e1cf02b146','userName','String','用户名',3,'ae90901e86b7472899c20756136e7cc8'),('7f584095914e4f49898ab0352a2614fb','userPlaceId','String','场地Id',4,'b01576d116e743e398c4237c9c1b4bcb'),('7fed558ec54341aabd87b0a4fd4b1a95','roleId','String','角色Id 1001 为客户，1002 为超级管理员，1003 为普通商家',11,'ae90901e86b7472899c20756136e7cc8'),('8023dbbb08174ac1b7898819b68503a0','state','Integer','1为成功，0为失败',0,'1b59b7d653454aedac39344693f7a027'),('80242a605793438ab65849ed94990afe','token','String','下次请求的令牌',1,'7e995923923742a3bcf111287845011f'),('807000f71b1c4f9fb8c16cbe93d89308','memberId','String','用户Id(融云Id)',11,'6c4e7a503eca4112b4a734d50f3e7812'),('80750bedad37429ea2b16e0ab6b6484d','state','Integer','1为成功，2为失败',0,'7dd5837b04d5432391976e8824ce5896'),('80806881647749bc958ab5366e7336ff','maleNum','Integer','公体数量',9,'2d9196ddb2024b9581bfcb510fb2cce5'),('80aebec71e704a099b7a57863cb59026','result','Object','json对象',2,'2d9196ddb2024b9581bfcb510fb2cce5'),('80c524e0883d4864b96a943586076e43','imgId','String','图片Id',12,'b01576d116e743e398c4237c9c1b4bcb'),('80f4cedf0d7b46edb2df5c4421bac687','userPhone','String','联系电话',8,'4009414df88f4c60a0f3854838c9e619'),('815f652d7be049059dc0b96fbfe50293','token','String','下次请求的令牌',1,'77030f6cf1bd4572b9718d6f109add9a'),('81896ba9bb26479a8d90be42cf82222b','result','Array','json数组',3,'9f3bef34a9ea46afb8fba1515490efaf'),('821e5ecc00524941b341ea4314b5de6a','branchId','String','销售点Id',6,'93c6a85d73cc4b3f9071f60445ba0eb1'),('824876ffd6d6493880d16fa63629db57','goodsImage','String','商品图片',23,'b501882d44af4ad7b8bdb9ae48149acc'),('82a9a5aac6a64f5fba2b47738e88d874','myTeamId','String','企业码',5,'4d3bd0c8d6cf4631908d3132b72c9aa0'),('82b026eb1215403cbcb520ff8bbf5c28','pageCount','Integer','总页数',2,'489a8428ee114557a34ab2cbb8be70a2'),('830d76c2e501468db84d6b96fedea1cb','token','String','下次请求的令牌',1,'b438e782f0444b07b3ee397bc309bc7c'),('8347b6a8abdd489997216f01883cf5bc','state','Integer','1为成功，2为失败',0,'c99027475df5435ab5fd62633351b207'),('8368452d8c544568b6259a32bc3b3a7f','result','Array','json数组',2,'b8995f0262e64652ba85a136b3cb24c6'),('838cdb5cc4684f69ade0f053908b205e','teamDepartmentId','String','部门Id',3,'53f8cb30bc1747b3a1c9800aa377117b'),('83e587b1d8ab4b5e892fcd3cb56289ca','breedId','String','养殖信息Id',3,'2d9196ddb2024b9581bfcb510fb2cce5'),('844fda32786042ca8d3e1c35542e123d','imageId','String','图片Id',18,'1dd677ec548443b08eb3d5611f17a3ae'),('84b1dcec5f424fac8b09cf1be35091f5','roleId','String','角色Id 1001 为客户，1002 为超级管理员，1003 为普通商家',9,'4d3bd0c8d6cf4631908d3132b72c9aa0'),('84d133673f104a4fafd1514432e13b4e','createDate','Timestamp','申请时间(时间戳)',9,'610442c7ecc34b46a419a919e2c78126'),('852542696c5e4002b4d789486cecd2b8','followDate','Timestamp','跟进时间(时间戳)',7,'49624057be4445559f93489bb2cccee4'),('85ec15c7fb964c1d99a85ab2edb97c1a','userPlaceType','String','场地类型',7,'365177c2935b4857aa6e39362cfb3694'),('8600f2ae01bb4a72bf8714e241c7f506','result','Array','json数组',3,'75b48036547c4d5390172b21a4491e93'),('86273d6a74fa45a795acee7ced954e15','detailImages','String','json(数组)描述图片',8,'1b59b7d653454aedac39344693f7a027'),('868743975d1a43529f12b5696bf74eea','token','String','下次请求的令牌',1,'8b2bd88dc8cc4717b86bdbde6305b65d'),('86a0e287e4e44e7f8875fedaad0b3d3e','state','String','等于1表示验证成功并返回以下数据',0,'b6f3fb9478aa43398e96bd03823aa667'),('86cb361ad0f04d77b9dcb07d4b1b713e','state','Integer','1为成功，2为失败',0,'37c6ab15d18643379e3a3685dcb37a2b'),('87ca79145f2a478c81cac88554c98d35','userAddressId','String','收货地址ID',7,'9205c489f42f4634a8148de0200384b9'),('895d11aeada7450ebcd7c4dd42a2f02b','businessAddress','String','经营地址',11,'eb7654c6d8a742df8ee395aa480b8471'),('8a212e4c28ed43b1bfe239b6fd6633db','state','Integer','1为成功，2为失败',0,'5ccff2b760ee4d588a41228d565b9aad'),('8b88a60c7ee34632a27895cce9709df2','userPlaceArea','String','场地位置',5,'7dd5837b04d5432391976e8824ce5896'),('8cf78c1562a64e4fb6b3c69d58f8ab4b','imgUrl','String','图片路径',13,'7dd5837b04d5432391976e8824ce5896'),('8cf87a64157141fcb190111679470943','environmentList','Array','场地环境(json数组)',14,'365177c2935b4857aa6e39362cfb3694'),('8d1ef646169847759edbc3177f05ea56','goodsImages','String','商品图片',7,'68b03974db434ab3bdd09d04dead9d6b'),('8d3b9e6aad3e41369428130bc343fcc5','customerType','String','客户类型',4,'623c680edca6456b89f275ab8c614bf7'),('8d5d09e71cda486280f602e8771c126f','goodsNum','String','购买数量',6,'322ff7ff769c41f6b1ab5e5d9c74570d'),('8d5d3e58b70b408aa5e35dc17c217307','result','Array','json数组',2,'d757445966794da48bd9fae543d6debb'),('8dbaa82fe657402c8acbb4e4480d17b2','branchId','String','销售点Id',7,'b501882d44af4ad7b8bdb9ae48149acc'),('8f01dcba8c034442add8183f79b1bb68','state','Integer','1为成功，2为失败',0,'72ffcee59d9140cca65868e7e95ead29'),('8f097bcb65304c56bd061e02f77981b1','breedType','String','养殖类型',6,'cff91a59858c422fa6c4f709b89e3603'),('8f230448037a440abb2b247eb50455c9','customerType','String','客户类型',3,'3919f61cc5bb4d459c52b0c98bc216da'),('8fa9c82783764ff099fcce173698ea28','standardName','String','规格名称',21,'b501882d44af4ad7b8bdb9ae48149acc'),('8fb9f3eff7b94d7c918bbff1d53fc21f','userCardFront','String','身份证正面照片',16,'3919f61cc5bb4d459c52b0c98bc216da'),('901d9a9ec6d04ff38695b6e77f5fd534','state','Integer','1为成功，2为失败',0,'1dd677ec548443b08eb3d5611f17a3ae'),('902c884ca67044ca98fc28369e3d2bd7','userAlreadyUse','Integer','使用情况',9,'8b2bd88dc8cc4717b86bdbde6305b65d'),('90c224931a304a20a3649543b24253b0','token','String','下次请求的令牌',1,'72ffcee59d9140cca65868e7e95ead29'),('919ae54692d94305bafb02960ccbdde3','manageType','String','经营类目（用逗号\",\"分隔）',7,'4bdc5ca52ef749829ba4bf281f397be2'),('91dc8676608a4e5a84a070e26195f8e5','proposerId','String','申请人的用户Id',3,'590cb636436a49f788f763689af707ed'),('91e98063094747d283482d4128c97861','farmerId','String','农户Id',4,'2dd479f0086942689837f2ca54852d34'),('923c746c20684413877657cdc318467c','result','String','json数组',3,'af4194226ffb4608b0bd9771b1d90254'),('925b2f69418b4230ac3c6e78b917a99c','createDate','Timestamp','创建时间(时间戳)',13,'93c6a85d73cc4b3f9071f60445ba0eb1'),('9292711771ea4253bae8b08608a949f0','state','Integer','1为成功，2为失败，3为该账号已存在',0,'b5a03ad641ba4dd7b3a8124d8bab42e5'),('93b30756b9e349b8a5b058480f366ee3','approverName','String','审批人的姓名',12,'b501882d44af4ad7b8bdb9ae48149acc'),('942e2f77baee42c3b19495f06de87dea','manageName','String','单位名称',5,'4bdc5ca52ef749829ba4bf281f397be2'),('9431a43bc65443e6aec3987fbb604960','token','String','下次请求的令牌',1,'13a33a322fe844a7bcd481664b367f1c'),('9505d0c633ba420e8e706e1536a79ae2','infoName','String','信息名称',4,'77030f6cf1bd4572b9718d6f109add9a'),('95328a23ce534cb58a708334016d1575','token','String','下次请求的令牌',1,'3315be9003d7486db2ee1d4761a4455b'),('95c7d1e4f8f24e9490b43e97751724c6','standardName','String','规格名称',20,'93c6a85d73cc4b3f9071f60445ba0eb1'),('96048e34b26a4a87b1db4dc9a8568d0f','proposerName','String','申请人的姓名',4,'590cb636436a49f788f763689af707ed'),('966c05fe0a534f198cc370a9ecbc98cb','userImg','String','用户头像',3,'4d3bd0c8d6cf4631908d3132b72c9aa0'),('96978d76a4e84ccf9dc2fb625d3fa4e3','goodsName','String','商品名称',4,'1b59b7d653454aedac39344693f7a027'),('974bc593986640779716fce7a7efd34e','farmerPhone','String','联系电话',6,'489a8428ee114557a34ab2cbb8be70a2'),('974ff86d893b456196ac152a15f62b96','pageCount','Integer','总页数',2,'b501882d44af4ad7b8bdb9ae48149acc'),('98768cf7bb304ca4bc510e8b1f71d386','userOwnerNum','Integer','权属人数',8,'7dd5837b04d5432391976e8824ce5896'),('98d74d4b4ac6458d9f50584ab7d9550e','token','String','下次请求的令牌',1,'87ee0eceaa3348a99c72b16f6bb44afb'),('993f9322671542c8a618397e5a416bbc','pageCount','Integer','总页数',2,'8b2bd88dc8cc4717b86bdbde6305b65d'),('9969c6d083e2413b82a39773a0757dcb','token','String','下次请求的令牌',1,'199830f70dcc47c2946b69656a3ca65d'),('9972459dd9af473f81a6826980a241d7','result','Array','json数组',2,'912a22a6fd734458ba1d56ae39b4cde9'),('99f53ae0c46842dfb31b8a97ec75cc84','userAddress','String','住址',8,'3919f61cc5bb4d459c52b0c98bc216da'),('9a33a4c2804144a6876655629e5d60f6','memberId','String','成员的用户Id',3,'912a22a6fd734458ba1d56ae39b4cde9'),('9a3fe06eb0184f27bef42d59f8f71afd','manageAddress','String','地理位置',5,'8d5c6f7446634d8f85b759d6d3175a06'),('9aa8e64a67a64ccdb7f51b36a8ea8adc','standardPrice','Float','规格价格',10,'322ff7ff769c41f6b1ab5e5d9c74570d'),('9b1f8ccd13a3404c9fdafd99e7b19aa9','userPlaceAcreage','Integer','占地面积',6,'7dd5837b04d5432391976e8824ce5896'),('9b25756d1f654f51af6b50e51d64d021','result','Array','json数组',2,'c773ee64b481484cb433b0b814194fa0'),('9b9c74a603e74cce8bde47692cd667a6','departmentName','String','部门名称',3,'6c4e7a503eca4112b4a734d50f3e7812'),('9bcfe54e63ed43978624a87ab1ba71dd','farmerId','String','农户Id',4,'489a8428ee114557a34ab2cbb8be70a2'),('9c3eda4265d245729aa5f174c6bef022','token','String','下次请求的令牌',1,'6bba4f0169234ce1b1cacb2c0d1ffe23'),('9cb61ec8abe04c50a44c854c49e5c4fe','result','Array','json数组',2,'9205c489f42f4634a8148de0200384b9'),('9d115958ce6a4660aa2e75e42720bbdf','emptyShedNum','Integer','空栏数量',12,'2d9196ddb2024b9581bfcb510fb2cce5'),('9dff524a903e4a17be5652aa660efa82','myTeamName','String','企业名称',6,'4d3bd0c8d6cf4631908d3132b72c9aa0'),('9eb01274204c433ab0cb83fe4c7fd8db','userSex','String','性别',11,'4009414df88f4c60a0f3854838c9e619'),('9ec90ec6c3aa4f7584a90cf3677b8735','checkerName','String','审批人姓名',10,'e382083c97824a95a707e7459b6df1e2'),('9f05db16734b4dd8b2fb0fffd2858cfe','checkerName','String','审批人姓名',10,'fdfb3ca5b15b4ed3b93550f45d5ad710'),('9f8d101a857245249463093f711a8bcf','token','String','下次请求的令牌',1,'ae90901e86b7472899c20756136e7cc8'),('9f93d97af07b471e994d33ca2a2bb22f','result','Object','json对象',2,'13a33a322fe844a7bcd481664b367f1c'),('a0153466593d42429a33304e64251596','json','String','养殖信息(json对象字符串)',17,'163325edc6ab4e32afb3b189bdfe68d2'),('a2436edae033458ca610aa8144a22fd5','followContent','String','跟进内容',9,'9f3bef34a9ea46afb8fba1515490efaf'),('a267a082265741c69a5eaa495a758aeb','pageCount','Integer','总页数',2,'9f3bef34a9ea46afb8fba1515490efaf'),('a26ca9f99e0e43d8890b86c475d0492e','state','Integer','1为成功，0为失败',0,'199830f70dcc47c2946b69656a3ca65d'),('a297a387b1874ee1b83615ab8b3a1aa2','result','Array','json数组',3,'610442c7ecc34b46a419a919e2c78126'),('a3419d6c557741da88bdfa2f66db56bd','userEmployeeNum','Integer','工人数量',10,'8b2bd88dc8cc4717b86bdbde6305b65d'),('a3cac17945154e058edc686934c49905','proposerName','String','申请人的姓名',4,'e382083c97824a95a707e7459b6df1e2'),('a3cb64b0b86c42078488ba3bf8c2284d','applyList','Array','json数组',15,'93c6a85d73cc4b3f9071f60445ba0eb1'),('a4c9a7c1cf2b4823b537cd672ed92108','imgId','String','图片Id',12,'8b2bd88dc8cc4717b86bdbde6305b65d'),('a585031acdc64eb2af6083fd64d89279','state','String','上传结果，1为成功，2为失败',0,'b6625b81b5884825ad1c51072eb22d94'),('a5b551eb76474dbdb14c8e05c501400e','goodsTypeName','String','分类名称',4,'701aae07c8d94171a5d4fe8cf0622511'),('a60da4b6e1ec4af9b234b061022ec611','userAddressDefault','String','1为默认地址(0,1)',8,'3315be9003d7486db2ee1d4761a4455b'),('a6c24c551a7f49f5a469ef6482a33663','branchName','String','销售点名称',7,'93c6a85d73cc4b3f9071f60445ba0eb1'),('a70cf997de5842ef8a13cef32a4d7484','breedAge','Integer','养殖年限',7,'2d9196ddb2024b9581bfcb510fb2cce5'),('a7d7dab6d91a4b3d954585366b9ad64c','token','String','下次请求的令牌',1,'322ff7ff769c41f6b1ab5e5d9c74570d'),('a831b371188e4d9f9b3d7dab78000973','followId','String','跟进Id',3,'13a33a322fe844a7bcd481664b367f1c'),('a8a5d5ebd9f243bdb9a7ef6a294f5d27','state','Integer','1为成功，2为失败',0,'b7ebc400c4244282b50cb53016719fa8'),('a8efa5e1651e47529ee1facaa25be105','pageCount','Integer','总页数',2,'b01576d116e743e398c4237c9c1b4bcb'),('a90f10b3c00e466eac6f3afa72179617','breedVariety','String','养殖品种',6,'163325edc6ab4e32afb3b189bdfe68d2'),('a912c9f136bf4109b3649018f5f58557','state','Integer','1为成功，0为失败',0,'623c680edca6456b89f275ab8c614bf7'),('a94b3ac22ec24d11aa4378b5868b4bfb','manageType','String','经营类目（多个用逗号\",\"分隔）',6,'8d5c6f7446634d8f85b759d6d3175a06'),('aa7d343d2e704daea4ea9487a627680a','customerId','String','客户Id',10,'1dd677ec548443b08eb3d5611f17a3ae'),('aaca89472fc5449cb94fddc2c4612155','state','Integer','1为成功，2为失败',0,'56095eba55614987bf9945dd3d69566f'),('ab5f41e03d1f4d38b1b5b8603c8050e7','merchandiserId','String','跟单员的用户Id',7,'fdfb3ca5b15b4ed3b93550f45d5ad710'),('ab64a88140a5411ea9968248b239d966','userId','String','用户Id',1,'d94c8d7250784df58360ab333fb2e4ed'),('abd0bcb53a9b4958a1f71a168cf4e78f','result','Array','json数组',3,'f18e2df131ca433fb9629dad194ac600'),('abdd79112e37468d92327d39628404d8','manageAddress','String','地理位置',6,'75b48036547c4d5390172b21a4491e93'),('ac3eac445ab24d6889cd7db2e8435b9d','farmerPhone','String','联系电话',6,'2dd479f0086942689837f2ca54852d34'),('acafb7fd07ef47bc8d7838fe8810035b','proposerId','String','申请人的用户Id',3,'e382083c97824a95a707e7459b6df1e2'),('acbed33aa22446b8bc51222ef3439ec2','assistTitle','String','申请标题',4,'1dd677ec548443b08eb3d5611f17a3ae'),('ad6a77495f5046d9b3bdd3ccbd2c8a8c','breedVariety','String','养殖品种',5,'cff91a59858c422fa6c4f709b89e3603'),('adb61b42bfce4dd9934e65dc461df8e9','result','Array','json数组',2,'c52b9536af934afba04226aae9f530e9'),('adb993ad90d546ddb4661c163fea07dd','followResult','String','跟进结果',10,'9f3bef34a9ea46afb8fba1515490efaf'),('ae36cfd8bef24286adc1d980f002f1de','creditRating','Integer','客户评级',11,'623c680edca6456b89f275ab8c614bf7'),('ae78f4928c5647fa8731573162686aa2','state','Integer','1为成功，0为失败',0,'49624057be4445559f93489bb2cccee4'),('ae82af7912ae4f9e8ee7f6c8fec357ce','selectName','String','选项名称',4,'6a8b2e211bdb4ab8a990af919abb5f2b'),('ae85b07ab08341b2ad00a29d770888b3','userAddressDefault','Integer','1为默认地址(0,1)',8,'9205c489f42f4634a8148de0200384b9'),('aea81684a3364b31a073e27170379beb','followId','String','跟进Id',4,'9f3bef34a9ea46afb8fba1515490efaf'),('af44ed76f4f942f2896c2f4c4ab8231b','userId','String','用户Id',9,'ae90901e86b7472899c20756136e7cc8'),('af7d6aefa9564f4db6428a21546040d5','userArea','String','用户地区',6,'ddd54c231a964cb9ae4ed58da6e9a06b'),('b00c79969c7242a59c97cff202c81276','hadAccount','Integer','是否建账 (0为未建账,1为建账,2为账号被冻结)',4,'eb7654c6d8a742df8ee395aa480b8471'),('b0217ef281984a65bc1a08efa0d3a006','state','Integer','1为成功，2为失败',0,'fdfb3ca5b15b4ed3b93550f45d5ad710'),('b0674e10ca094bb885fb4c22b3ff50b6','token','String','下次请求的令牌',1,'b5a03ad641ba4dd7b3a8124d8bab42e5'),('b091885c8cda4ae7a693d50e13ef2e56','result','String','图片的Id',2,'deaa839f56ce4323a46687a284f4502c'),('b0965446e4b045f78b6882319c760de3','pageCount','Integer','总页数',2,'2dd479f0086942689837f2ca54852d34'),('b0a82d9dd4ce418592730535960edc93','state','Integer','1代表请求成功，2代表失败',0,'b501882d44af4ad7b8bdb9ae48149acc'),('b0fbd198c3354330bd4cbed58b8d04cf','standardCount','Integer','调整的数量',21,'93c6a85d73cc4b3f9071f60445ba0eb1'),('b1045d7295dd4f539014d83c044df662','imgUrl','String','图片路径',16,'b01576d116e743e398c4237c9c1b4bcb'),('b1c0aecdb6c242b68a41b01a66edaf4e','imgId','String','图片Id',12,'365177c2935b4857aa6e39362cfb3694'),('b1f123df80544c14912fe21c8e9db472','userIdentity','String','身份证号',8,'6c4e7a503eca4112b4a734d50f3e7812'),('b20316848b2d4c4b81cc36d39339c45c','infoType','String','填写类型',5,'77030f6cf1bd4572b9718d6f109add9a'),('b23e91e2b9db4f148fdc5d9ffcff9d60','token','String','下次请求的令牌',1,'93c6a85d73cc4b3f9071f60445ba0eb1'),('b393cb1874b349d3b0d4fc8e730945c3','applyList','Array','json数组',16,'b501882d44af4ad7b8bdb9ae48149acc'),('b3cac83fb7cc44ab817b3593d2ecd9c3','userPhone','String','用户手机',4,'ddd54c231a964cb9ae4ed58da6e9a06b'),('b3ed575e148f44919144866a92861041','token','String','下次请求的令牌',1,'68b03974db434ab3bdd09d04dead9d6b'),('b43a8546dbe14e0d90d673ce4ad0b06f','userPlaceId','String','场地Id',4,'7dd5837b04d5432391976e8824ce5896'),('b4524ca43f1341d496874fef74f2a0e9','state','Integer','等于1激活成功并返回以下数据',0,'ddd54c231a964cb9ae4ed58da6e9a06b'),('b495514483394e469da712d35dccd3bf','createDate','Timestamp','申请时间(时间戳)',8,'1dd677ec548443b08eb3d5611f17a3ae'),('b4f76ae7f4ea485f86c1a11edfa9ce92','followId','String','跟进Id',3,'199830f70dcc47c2946b69656a3ca65d'),('b5a1e43005e3491c94c6eb292b299d18','userSex','String','性别',9,'eb7654c6d8a742df8ee395aa480b8471'),('b5aa5cb6c8fe416bb071eea2967aac99','userEmployeeNum','Integer','工人数量',10,'365177c2935b4857aa6e39362cfb3694'),('b5b12174ddf14be58639e6e4ac0c7e8f','selectId','String','选项Id',3,'6a8b2e211bdb4ab8a990af919abb5f2b'),('b5df60e4075b4bd994447532d560f653','result','String','订单Id',2,'ccbe4ccfa2a640bfa4d7f9650b0f1b73'),('b5e28d1a595c439ca970ad5af89f9f70','state','String','1为成功，0为失败',0,'701aae07c8d94171a5d4fe8cf0622511'),('b70836d7bd404305a446e4fd388ff770','result','Array','json数组',2,'6c4e7a503eca4112b4a734d50f3e7812'),('b75df7161250423aa354e231d70acb50','result','String','json对象',2,'ae90901e86b7472899c20756136e7cc8'),('b78ea88d9ee149f99fc56cfcbc83cf28','token','String','下次请求的令牌',1,'6db79ab903874e559cf799c0c5194be5'),('b7c3b291b41f43a290d1ff8cef70b967','userId','String','审批人的用户Id',3,'76b40c145b294413878787e3ab3bb9ab'),('b810077db601492cb6049769e06d20d8','assistReason','String','申请原因',6,'610442c7ecc34b46a419a919e2c78126'),('b811ada405014ccda046b3d7b14d264b','standardId','String','规格Id',8,'322ff7ff769c41f6b1ab5e5d9c74570d'),('b87c8e873c0b4209897fbf49675b0033','userPlaceType','String','区域性质',7,'8b2bd88dc8cc4717b86bdbde6305b65d'),('b8817638ff9448adb6760865eb6cae8e','manageId','String','经营单位Id',4,'4bdc5ca52ef749829ba4bf281f397be2'),('b8edf7b46ad64b3fb02f944b302e326c','userName','String','联系人姓名',3,'9205c489f42f4634a8148de0200384b9'),('b91b2e07b8a6405395993f6857ccb472','userName','String','成员名称',4,'912a22a6fd734458ba1d56ae39b4cde9'),('b950f305835f426f9d5c7c00b8ca26d7','userImg','String','用户头像',19,'3919f61cc5bb4d459c52b0c98bc216da'),('b9c2320e18904cc3a98cb973f8e2366a','userPhone','String','用户手机号',4,'b6f3fb9478aa43398e96bd03823aa667'),('ba714144911a4e0da9dccbae28893e48','followDate','String','跟进时间(时间戳)',6,'13a33a322fe844a7bcd481664b367f1c'),('babaf5bb05474237a0872944ad0ee0cb','breedVariety','String','养殖品种',5,'2d9196ddb2024b9581bfcb510fb2cce5'),('badd5b9c684c4c7294fa61de43139e5e','pageCount','Integer','总页数',2,'4009414df88f4c60a0f3854838c9e619'),('bb1dd6ad6b164fe3aaaaa81e62a16f6a','applyRemark','String','备注',13,'b501882d44af4ad7b8bdb9ae48149acc'),('bb6a2a6670114abf819ac7f7b24b75ef','userAddress','String','经纬度',6,'3315be9003d7486db2ee1d4761a4455b'),('bb82c672707546e7991d0f2b8db2e009','token','String','下次请求的令牌',1,'6414f8e5d33f4a93a7793df1459a90cb'),('bbf508a2650b44ba8268421da809ebed','state','Integer','1为成功，2为失败',0,'22e156f92d97482b8be66da2d13a52c4'),('bc0d73c40d4c4618867045e47376cc4a','result','String','图片路径',2,'b6625b81b5884825ad1c51072eb22d94'),('bc25f7c0e638481386766c5196cfc991','userSex','String','性别',9,'3919f61cc5bb4d459c52b0c98bc216da'),('bc6d8cde406d44dd8f1677913cc1952c','token','String','下次请求的令牌',1,'9205c489f42f4634a8148de0200384b9'),('bd48291664ef4a4196ddbd4a7a0e3a2b','applyStatus','Integer','申请的状态',6,'b501882d44af4ad7b8bdb9ae48149acc'),('bd5afe6cd70d47bfb2e47d87e51dfc9e','state','Integer','1为成功，2为失败',0,'489a8428ee114557a34ab2cbb8be70a2'),('bd5b45f34d914d7eb12e948e8b18ce90','station','String','从事岗位',12,'eb7654c6d8a742df8ee395aa480b8471'),('bd72025a6a374dfda9445659920dc0af','standardPrice','String','规格价格',12,'1b59b7d653454aedac39344693f7a027'),('bef2dce54ac44f80aa550af5f02bd02b','state','Integer','1为成功，2为失败',0,'8b2bd88dc8cc4717b86bdbde6305b65d'),('c03c4fa1f4c04e1f9c5ef462b8b3a036','pageCount','Integer','总页数',2,'af4194226ffb4608b0bd9771b1d90254'),('c100338514c04f0db943c889ed594efd','creditRating','String','客户评级',12,'4009414df88f4c60a0f3854838c9e619'),('c11d9f3d69a942528541f24325acf8f1','applyId','String','申请的Id',4,'b501882d44af4ad7b8bdb9ae48149acc'),('c186409dfe0d4d9f8d963881eaddb8d5','result','Array','json数组',2,'76b40c145b294413878787e3ab3bb9ab'),('c1a9530aa4744f2180b099a60db963af','typeId','String','类目Id',3,'af1379d79875405cbfba73d080e1cab2'),('c1aedf0e7e0b4dafa63252b977c999d8','result','Array','json数组',2,'8d5c6f7446634d8f85b759d6d3175a06'),('c1ed12552f4f46eea9ff385f1d7ae8a9','businessAddress','String','经营地址',11,'3919f61cc5bb4d459c52b0c98bc216da'),('c2042a10ae1840449fbae69bfa9737af','followId','String','跟进Id',4,'49624057be4445559f93489bb2cccee4'),('c21fad95b4d145689d34133c0577a51a','userPhone','String','收货人联系电话',4,'9205c489f42f4634a8148de0200384b9'),('c2aa8422f78c4d98b16c4d879675da28','token','String','下次请求的令牌',1,'45f3e927c45b4447b74d59a728e807b5'),('c2d5d4719e664b9091408dc532c79497','userId','String','用户Id',8,'4d3bd0c8d6cf4631908d3132b72c9aa0'),('c38945631aa24318965d76b19d31b5c4','goodsImages','String','商品图片',7,'f18e2df131ca433fb9629dad194ac600'),('c489d958beeb4d4eb4ffe7aa58307ab1','state','Integer','1为成功，2为失败',0,'163325edc6ab4e32afb3b189bdfe68d2'),('c4986637a1ac4ca9aeed2adbe8065bc7','maleNum','Integer','公体数量',9,'cff91a59858c422fa6c4f709b89e3603'),('c570540a41cb4792a93c73c320a71637','token','String','下次请求的令牌',1,'489a8428ee114557a34ab2cbb8be70a2'),('c5a2af8685d94c8abeaf7cf8051e25ca','state','Integer','1为成功，2为失败',0,'2d9196ddb2024b9581bfcb510fb2cce5'),('c5e0bb5017ce4dd8923abf43adc7ef37','approverName','String','审批人的姓名',11,'93c6a85d73cc4b3f9071f60445ba0eb1'),('c69d4691b3e84158866bc43f85ba2e72','goodsCode','String','商品编码',17,'93c6a85d73cc4b3f9071f60445ba0eb1'),('c6c6c44d641346b58682bffb67a84e91','userAlreadyUse','Integer','使用情况',9,'365177c2935b4857aa6e39362cfb3694'),('c6d626ba4d5b430ab62d6c070b66bec9','state','Integer','1为成功，2为失败',0,'b8e2d60dd0c64f49b9fe6bcb50bfe078'),('c795ead14a624dfe8398a97ce1beaf2e','state','Integer','1为成功，2为失败',0,'deaa839f56ce4323a46687a284f4502c'),('c7abbbb947994b8a8bbf09514c9bc6bb','myTeamId','String','企业码',5,'b6f3fb9478aa43398e96bd03823aa667'),('c869a48ebfa648eb80d44c14836cb37f','userPhone','String','用户手机',5,'ae90901e86b7472899c20756136e7cc8'),('c8d25a06f3c04cec84ce08add1507e97','certificateList','Array','所属证明(json数组)',11,'7dd5837b04d5432391976e8824ce5896'),('c90b17c12fb64b109b949074fda1021a','hadAccount','Integer','是否建账',4,'3919f61cc5bb4d459c52b0c98bc216da'),('c90c63f711404301aff1c323403077b2','userPhone','String','用户手机号',4,'cfa3c18f01d242a0ab91d684493a45dc'),('c943a4e879af4cf9a70dc6214e93bee8','token','String','下次请求的令牌',1,'4009414df88f4c60a0f3854838c9e619'),('ca6078e9c58e442bbc56fe6038450cd6','state','Integer','返回1登录成功，2账号密码或企业码不对，3该账号未激活，4没有该账号信息',0,'4d3bd0c8d6cf4631908d3132b72c9aa0'),('cb22b587169a465a83dbc1c2f2f0858d','customerName','String','客户名称',6,'49624057be4445559f93489bb2cccee4'),('cbfe714f1fdf4db78b82064f74e37a5e','token','String','下次请求的令牌',1,'1dd677ec548443b08eb3d5611f17a3ae'),('cc60143ce9284cb7995d79d0fdc20e96','state','Integer','1为成功，2为失败',0,'6bba4f0169234ce1b1cacb2c0d1ffe23'),('ccfedcadd32646379cf29c8f65d894ba','station','String','从事岗位',12,'3919f61cc5bb4d459c52b0c98bc216da'),('ce18904796234438a2d5d9182dec7e89','standardId','String','规格Id',10,'1b59b7d653454aedac39344693f7a027'),('ce477590ddce48b19f3101ddd7d4ce01','customerName','String','客户名称',6,'9f3bef34a9ea46afb8fba1515490efaf'),('ceb554798fd74f069941b5228d950edb','token','String','下次请求的令牌',1,'d4b77a8966c74d4a9b7fad1e9905b6cd'),('ceba4ec219954e0f929ba3b72e3ba1e5','obstetricTableNum','Integer','产床数量',10,'cff91a59858c422fa6c4f709b89e3603'),('cf4c6e5db1a5471a9182050858c649d6','hadAccount','Integer','是否建账 (0为未建账,1为建账,2为账号被冻结)',6,'4009414df88f4c60a0f3854838c9e619'),('cf7b23b9bfe84a1ca6a914cf83427816','createDate','Timestamp','创建时间(时间戳)',14,'b501882d44af4ad7b8bdb9ae48149acc'),('d0a7d5e48c144267b118fbac3c29147c','result','String','农户Id',2,'2c9a1b2c5e234a39b6363cf88ef3701b'),('d0b0971804c94a2891ba50eeef65b0f6','userIdentity','String','身份证号',7,'cfa3c18f01d242a0ab91d684493a45dc'),('d0c6bc5d94f14e26923a23b7e2477dbb','result','Array','json数组',2,'af1379d79875405cbfba73d080e1cab2'),('d0f6f62db9a6495cb52a31ceae4f2482','applyCode','String','申请单号',5,'b501882d44af4ad7b8bdb9ae48149acc'),('d1e64ed0811e4c6ca17415de8591bf1a','token','String','下次请求的令牌',1,'09e37c8416f748f4b2d7fae1f8e670bd'),('d234920c2b5c4674a35e9522baedc9e7','standardCount','Integer','调整的数量',22,'b501882d44af4ad7b8bdb9ae48149acc'),('d255b9c8e53349898317700eb0f688cb','state','Integer','1为成功，2为失败',0,'68feadadea904d6fa18c17aec18c98a7'),('d28a61ee84ae406f8c27fc0637b2c695','token','String','下次请求的令牌',1,'76b40c145b294413878787e3ab3bb9ab'),('d39efa1445fc49ab87b41b6097ed0476','certificateList','Array','所属证明(json数组)',11,'365177c2935b4857aa6e39362cfb3694'),('d3c07f42156743fcb0dc6207db88b4c1','goodsTypePid','String','分类父Id(0为根分类)',5,'701aae07c8d94171a5d4fe8cf0622511'),('d3e7987fc5b648f888f7e4b3c0f7dd18','token','String','下次请求的令牌',1,'deaa839f56ce4323a46687a284f4502c'),('d4237fbf42834d5db8ddc3e93a4ac415','token','String','下次请求的令牌',1,'be6a4c3222e740f2b4ca5dc4265eb377'),('d469d99623d549bfa994356bcef3aeea','result','Array','json数组',2,'77030f6cf1bd4572b9718d6f109add9a'),('d49aee4ba8a94894b9e727eb02ef5df0','token','String','下次请求的令牌',1,'49a557aabb3641119a08803f8c08b8dd'),('d4ccde6d32bc42f59867d56887f71831','pageCount','Integer','总页数',2,'322ff7ff769c41f6b1ab5e5d9c74570d'),('d51c3329bcfd4d26af40755e5a069ba8','userId','String','用户Id',8,'ddd54c231a964cb9ae4ed58da6e9a06b'),('d5ce7a2398a64d31a37a7dec0235b724','token','String','下次请求的令牌',1,'fdfb3ca5b15b4ed3b93550f45d5ad710'),('d5d396e078c24e72abb282b0a811b040','state','Integer','1为成功，2为失败',0,'7e995923923742a3bcf111287845011f'),('d631282f11b24bd18c924aed0f26734d','customerName','String','客户姓名',11,'1dd677ec548443b08eb3d5611f17a3ae'),('d66a2ad6501c40858600e2249b49381a','result','String','头像地址',2,'45f3e927c45b4447b74d59a728e807b5'),('d68a4bf0fc3b43dba432ba588b23bf4b','state','Integer','1为成功，2为失败',0,'cff91a59858c422fa6c4f709b89e3603'),('d6cb47c89c394541a53927417a8172a8','userImg','String','头像',5,'76b40c145b294413878787e3ab3bb9ab'),('d70ad6d057a042eab94fb1863eeafb09','myTeamName','String','企业名称',7,'ae90901e86b7472899c20756136e7cc8'),('d7b7710bd96b47b4a426d0421259cfd7','followTitle','String','跟进标题',7,'9f3bef34a9ea46afb8fba1515490efaf'),('d807f4f5fdef489c824401dc6ae2e47a','token','String','下次请求的令牌',1,'623c680edca6456b89f275ab8c614bf7'),('d86e9c4ab73943358db49f174c9ff111','pageCount','Integer','总页数',2,'f18e2df131ca433fb9629dad194ac600'),('d93b3f1ce5704dacbf7c9ed8169a4fa2','breedScale','String','养殖规模',15,'2d9196ddb2024b9581bfcb510fb2cce5'),('d9d686ba6f6c4df9b8e271d0c2755b5b','state','Integer','1为成功，2为失败',0,'590cb636436a49f788f763689af707ed'),('da128c5cb25b4da791218f5bce25b12a','myTeamName','String','企业名称',8,'cfa3c18f01d242a0ab91d684493a45dc'),('da2c7b6c68c747c1a16e8c00244d5cfe','token','String','下次请求的令牌',1,'be58dab447ee4d84b517846e1bc1372c'),('da5db59e8b8e4888840aa66f5e607fa3','breedId','String','养殖信息Id',4,'af4194226ffb4608b0bd9771b1d90254'),('dad2969155fc4288a25801a33ca94ae6','breedScale','String','养殖规模',15,'cff91a59858c422fa6c4f709b89e3603'),('db78a7261b0a454e84fb4c9e5dabaf14','userId','String','申请人的用户Id',7,'7e995923923742a3bcf111287845011f'),('dc3f5d65b28d4ea5b22c218a5cd57df4','livestockNum','Integer','存栏数量',15,'163325edc6ab4e32afb3b189bdfe68d2'),('dcc77378526049a392055ec58b734481','token','String','令牌',2,'d94c8d7250784df58360ab333fb2e4ed'),('dcec4a1b863c4f029dbe248346e5fdb9','token','String','下次请求的令牌',1,'af4194226ffb4608b0bd9771b1d90254'),('dd64951a60c64b78902d254ef16ce832','state','Integer','1为成功，2为失败',0,'b8995f0262e64652ba85a136b3cb24c6'),('dde4fa42e8d544f2a86396e0867b605d','token','String','下次请求的令牌',1,'7dd5837b04d5432391976e8824ce5896'),('de920190f6094f9082fa1b5ad64a41bb','creditRating','Integer','客户评级',10,'3919f61cc5bb4d459c52b0c98bc216da'),('dfe4743f6443465fb824ad9102c194aa','state','Integer','1为成功，0为失败',0,'f18e2df131ca433fb9629dad194ac600'),('e099721e8ffc4ce49598e407b13edaf5','result','String','json对象',2,'cfa3c18f01d242a0ab91d684493a45dc'),('e0a11474d793446b8bb20ea4aabb338f','userPlaceAcreage','Integer','占地面积',6,'365177c2935b4857aa6e39362cfb3694'),('e0d3c814b5ff4afbb941ae7badd11150','imgUrl','String','图片路径',16,'365177c2935b4857aa6e39362cfb3694'),('e0e2803089bd4a19aa5302bf0464f854','state','Integer','1为成功，2为失败,3为库存不足,4为商品不存在',0,'ccbe4ccfa2a640bfa4d7f9650b0f1b73'),('e239cc22b3dc41a8b78b45cd4cb7e905','result','Array','json数组',3,'b01576d116e743e398c4237c9c1b4bcb'),('e2a063c20c28439f937b41c5489c082c','token','String','下次请求的令牌',1,'10ee376f64a7404d8f24c453401dc335'),('e2e8941c28d749b49aa810cb390744d3','breedType','String','养殖类型',7,'163325edc6ab4e32afb3b189bdfe68d2'),('e3c2b8c2201b4c0dbc4f4a09cfbd28d5','goodsId','String','商品Id',4,'322ff7ff769c41f6b1ab5e5d9c74570d'),('e3ea9e81619d47ecbf93703f8d418b62','customerId','String','客户Id',5,'fdfb3ca5b15b4ed3b93550f45d5ad710'),('e3f41f51b8db40e781c5386c705c4103','creditRating','Integer','客户评级',10,'eb7654c6d8a742df8ee395aa480b8471'),('e3fc4468e20848b8aac643be9334dd12','result','Object','json对象',2,'3315be9003d7486db2ee1d4761a4455b'),('e49c85a7d7574b659a3a63d1b4bf8e99','breedId','String','养殖信息Id',4,'163325edc6ab4e32afb3b189bdfe68d2'),('e4a88cb260b646f7bd5935efe02c46d3','state','Integer','1为成功，2为失败',0,'e382083c97824a95a707e7459b6df1e2'),('e55757fb092d475d85aaae211d3e088e','userSex','String','性别',10,'623c680edca6456b89f275ab8c614bf7'),('e5ed19a5e1b0401cb3ac61dc5fbf83dc','imgId','String','图片Id',15,'7dd5837b04d5432391976e8824ce5896'),('e6dce9e0a7434624a96e7589f22e16b9','result','Array','json数组',2,'3919f61cc5bb4d459c52b0c98bc216da'),('e6f3660e93a54e00add360455bc53af0','token','String','下次请求的令牌',1,'b7ebc400c4244282b50cb53016719fa8'),('e725cd0e8f5d4d4897aadc5c43480a7a','result','Object','json对象',1,'ddd54c231a964cb9ae4ed58da6e9a06b'),('e819a17cf1064e71ad1ae5e8253f654d','goodsId','String','商品Id',3,'1b59b7d653454aedac39344693f7a027'),('e821f520b8bf4b5580b963bf4b17d205','state','Integer','返回1表示录入成功',0,'7dc5d9e986904416a376065e7134bcd7'),('e8464394d7b6449eb055aa294b338ea2','result','Array','json数组',3,'7dd5837b04d5432391976e8824ce5896'),('e91763b4345540d0b5f54a3fdd90c093','result','String','跟进记录的Id',2,'5ea6c6c4ba9646ceaf6d876845f90430'),('e93521ba6b404ae7ae1cf3b6a63e3874','goodsImg','String','商品图片',7,'322ff7ff769c41f6b1ab5e5d9c74570d'),('e939d505adac4f89af0c77b606000fb2','result','String','图片路径',2,'94a4b4adbeed48aca99267235d97781b'),('e93c88e92ab44c338ff6f696b5def9a1','userPlaceArea','String','场地位置',5,'b01576d116e743e398c4237c9c1b4bcb'),('e94539b2a3524711bb8c5fcc15c8416f','userUpdateTime','Timestamp','最后更新时间 (时间戳)',15,'eb7654c6d8a742df8ee395aa480b8471'),('e97e453100f9414e8226468b60b4d3c5','result','String','养殖信息Id',2,'22e156f92d97482b8be66da2d13a52c4'),('e9c2b159f45e4c9ba643a6536d400e58','userPlaceId','String','场地Id',4,'8b2bd88dc8cc4717b86bdbde6305b65d'),('e9d48d010bf04f249b18a914a05a1964','result','Object','json对象',2,'53f8cb30bc1747b3a1c9800aa377117b'),('ea064ba67352491e84d316d260c40b4f','manageId','String','经营单位Id',4,'75b48036547c4d5390172b21a4491e93'),('eacb42468b08455581d86de1924c42b2','state','Integer','1为成功，0为失败',0,'6c4e7a503eca4112b4a734d50f3e7812'),('eb5d73cbd725425191c5cf185fa39f26','token','String','下次请求的令牌',1,'54b4dd7bb9004e6189725e2148944ae9'),('eb9bfd75770f4c08891efa792c937c2c','userBirthday','String','出生年月',7,'eb7654c6d8a742df8ee395aa480b8471'),('ec40a7cfd09e4cfca3fdcbc639f7979d','userCardBack','String','身份证背面照片',17,'eb7654c6d8a742df8ee395aa480b8471'),('ec8a214c959c4156b9eb7d9f97d85bb0','state','Integer','1为成功，2为失败',0,'689bc97709b949019ab4e381744e0639'),('edbc485e14c541a7b1ebcb6c8c8d258e','userImg','String','用户头像',4,'ae90901e86b7472899c20756136e7cc8'),('edd8c556d62c48ca9ce6a89408c5f644','state','Integer','1为成功，0为失败',0,'5ea6c6c4ba9646ceaf6d876845f90430'),('ee45ab9a82244c6d862b674b68aba826','token','String','下次请求的令牌',1,'b01576d116e743e398c4237c9c1b4bcb'),('ee64ef6d83364abf848456e14d2b6d08','token','String','下次请求的令牌',1,'23e911701b1a49b58abf7b099e154c9c'),('eec146f20c1a46c483a0bd245569ac9a','manageName','String','单位名称',5,'75b48036547c4d5390172b21a4491e93'),('eef72e922c4c47d98535e7ad46cb27fa','result','String','经营单位Id',2,'d4c12774a2e34da6ae5108b1ed19e25c'),('ef5060f75b104c3b9ae3993b028ab65f','result','Array','json数组',3,'163325edc6ab4e32afb3b189bdfe68d2'),('ef6507fffad6422ea62895bfe7769e8c','userName','String','用户名称',6,'6c4e7a503eca4112b4a734d50f3e7812'),('efbc75d261e64c50b5ce5f85e7d5ced9','state','Integer','1为成功，2为失败',0,'be58dab447ee4d84b517846e1bc1372c'),('efd937b72c844b0db5b57b0485824d19','followDate','Timestamp','跟进时间(时间戳)',7,'199830f70dcc47c2946b69656a3ca65d'),('f0013b09f5cc471b9800bbf80f87f1cd','userName','String','用户名称',4,'b8995f0262e64652ba85a136b3cb24c6'),('f0498c98320145d8b8dbc5e18a865b22','state','Integer','1为成功，2为失败',0,'1219aa8936b24bd7ae26bdefc1b5165c'),('f079d178455f46be975078d9818bf083','token','String','下次请求的令牌',1,'cff91a59858c422fa6c4f709b89e3603'),('f07f9be05c6748a0b957be24063f2c62','token','String','下次请求的令牌',1,'2d9196ddb2024b9581bfcb510fb2cce5'),('f165bc04e2c241a2912758bb85912a38','environmentList','Array','场地环境(json数组)',14,'8b2bd88dc8cc4717b86bdbde6305b65d'),('f1adf619327c4241a5f02222f19f13da','token','String','下次请求的令牌',1,'7d13aacf67af4ba9abe1b9f6733a9919'),('f1af066b76c14fc78d1ef3c2a8034c8c','token','String','下次请求的令牌',1,'37c6ab15d18643379e3a3685dcb37a2b'),('f21d0c09053a416da84e153608a6d250','acceptDate','Timestamp','审核通过时间(时间戳)',15,'b501882d44af4ad7b8bdb9ae48149acc'),('f23aeca779ef4dc1b7be90a8391fe091','standardCount','Integer','规格库存',11,'322ff7ff769c41f6b1ab5e5d9c74570d'),('f25c349727424a30a96ee320a2734fcf','token','String','下次请求的令牌',1,'af1379d79875405cbfba73d080e1cab2'),('f2c71d65a4d54418b7fd16f26cb970b2','customerName','String','客户姓名',6,'e382083c97824a95a707e7459b6df1e2'),('f374340bd1b348c98d3dce562b05a62c','merchandiserId','String','跟单员的用户Id',7,'590cb636436a49f788f763689af707ed'),('f37a70363884447fab8a1372d55febb7','merchandiserName','String','跟单员姓名',8,'e382083c97824a95a707e7459b6df1e2'),('f38d5325ed2c45ccbba0bb99316da488','token','String','下次请求的令牌',1,'365177c2935b4857aa6e39362cfb3694'),('f47e6ed7e4074848a566c0eeb28823fa','breedCategory','String','养殖类目',5,'163325edc6ab4e32afb3b189bdfe68d2'),('f4ce22c382934d2487058b528d042d2f','proposerId','String','申请人的用户Id',8,'93c6a85d73cc4b3f9071f60445ba0eb1'),('f4e9b3eaa5624ebeaf9c2ea4fd0676c4','token','String','下次请求的令牌',1,'75b48036547c4d5390172b21a4491e93'),('f512fe7734c74e6da2d02df9d2c01dec','merchandiserName','String','跟单员姓名',8,'fdfb3ca5b15b4ed3b93550f45d5ad710'),('f51f2b951d57409580c4e869cea1fa99','goodsSales','String','商品销量',8,'f18e2df131ca433fb9629dad194ac600'),('f52c7241acee4dd29c96b68230245603','state','Integer','1为成功，2为失败',0,'610442c7ecc34b46a419a919e2c78126'),('f63b15e209ae4f20b9ceaf455e5991bc','positionName','String','职位名称',5,'6c4e7a503eca4112b4a734d50f3e7812'),('f6b6252144db4bb8856b2062587a632a','certificateList','Array','所属证明(json数组)',11,'8b2bd88dc8cc4717b86bdbde6305b65d'),('f741e35469864ac9834f484850299b0c','pageCount','Integer','总页数',2,'75b48036547c4d5390172b21a4491e93'),('f743c17591b941d49a1eec2395e1651c','goodsId','String','商品Id',16,'93c6a85d73cc4b3f9071f60445ba0eb1'),('f78a1f503f954919be2c0770dce40c69','token','String','下次请求的令牌',1,'d2e72fe6a0ba495fad4c2160f20ab73e'),('f7fbe4bd2b484fb98a3737960d94e910','token','String','下次请求的令牌',1,'dff21b9976f64f9c9ed1fff39d9a9d1b'),('f862322f7efb40cb919886bd3243b747','followResult','String','跟进结果',9,'199830f70dcc47c2946b69656a3ca65d'),('f88c219add23473a896e12a1f9eb52a4','token','String','下次请求的令牌',1,'1b59b7d653454aedac39344693f7a027'),('f91ee625a8f34661ab4ef17d51c5020a','customerId','String','客户的Id',5,'49624057be4445559f93489bb2cccee4'),('f98321082cdf43e9ba11397d41c325ca','breedType','String','养殖类型',6,'2d9196ddb2024b9581bfcb510fb2cce5'),('fa0d34c8b4a14063a3ea4bb9b5dacde4','userArea','String','用户地区',8,'ae90901e86b7472899c20756136e7cc8'),('fa3883c0905e42cc92dfc026374724ce','userName','String','用户名',2,'ddd54c231a964cb9ae4ed58da6e9a06b'),('fa441ccaba534af7b3a2864a3471b10f','goodsId','String','商品Id',4,'f18e2df131ca433fb9629dad194ac600'),('fa50287cee5a4e40bcee3249dbd2782d','shedNum','Integer','兰舍数量',11,'2d9196ddb2024b9581bfcb510fb2cce5'),('fac6ed8fd4394245b70c308359edecb1','userName','String','姓名',5,'3919f61cc5bb4d459c52b0c98bc216da'),('fb5a4437e2f348c38d9d0dddb1969bd4','proposerId','String','申请人的用户Id',3,'fdfb3ca5b15b4ed3b93550f45d5ad710'),('fb96811d63654dac9de5007bc4484930','userOwnerNum','Integer','权属人数',8,'8b2bd88dc8cc4717b86bdbde6305b65d'),('fbe73f92418f4a6baf91a3ad65f32ced','departmentName','String','部门名称',4,'c52b9536af934afba04226aae9f530e9'),('fbf045dd04674833a532085b037d5718','imagePath','String','图片路径',19,'1dd677ec548443b08eb3d5611f17a3ae'),('fc8cdefcd1054283b2fc6616c2add9d1','userEmployeeNum','Integer','工人数量',10,'7dd5837b04d5432391976e8824ce5896'),('fca405943d9745988178fcb4f09e3621','','File','图片文件',0,'015b1e3ea6a24a65ba6bfbb9284d8f30'),('fcf83c3c111e4a92a8ca9ccf72f348ba','goodsSales','String','商品销量',6,'1b59b7d653454aedac39344693f7a027'),('fd10d963295d431a812a1d082e454a4b','customerId','String','客户的Id',4,'13a33a322fe844a7bcd481664b367f1c'),('fdc618a0cd9a4631bbe793afa22315d6','result','Object','json对象',1,'4d3bd0c8d6cf4631908d3132b72c9aa0'),('fdd9d0b9e6d64038a79e1ab01e75860e','createDate','String','成立时间',7,'53f8cb30bc1747b3a1c9800aa377117b'),('fddd03c923004a06a4ca68cb63aed2aa','userArea','String','收货地址',5,'9205c489f42f4634a8148de0200384b9'),('fe04a31439fa477fa2df1ff6aa9726e3','standardId','String','规格Id',20,'b501882d44af4ad7b8bdb9ae48149acc'),('fe142ae47b874e4da22a8268e9f29cb4','userAddress','String','住址',9,'623c680edca6456b89f275ab8c614bf7'),('fe2fdf99d5354d4a9eb2d58a116aa2a9','userName','String','申请人的姓名',8,'7e995923923742a3bcf111287845011f'),('fe4792c63ca4447bb3f5cd388216d45d','userPhone','String','联系电话',6,'eb7654c6d8a742df8ee395aa480b8471'),('fe6d28e6e92f4eb986eb06949e5da7b8','userCardFront','String','身份证正面照片',16,'eb7654c6d8a742df8ee395aa480b8471'),('fef5d9d783ed46799d3e5c8ca8642e1e','pageCount','Integer','总页数',2,'4bdc5ca52ef749829ba4bf281f397be2'),('ff3734d352cf4a9e98a42eee578c0acc','certificateList','Array','所属证明(json数组)',11,'b01576d116e743e398c4237c9c1b4bcb'),('ff68f92f4cf24a7a90314c282c312c73','pageCount','Integer','总页数',2,'7dd5837b04d5432391976e8824ce5896'),('ff7567c05a70470891d5d4a6808ecb8c','hadAccount','String','是否建账',5,'623c680edca6456b89f275ab8c614bf7'),('ff81b2669a6b43a6abadf8e85627a32d','customerList','Array','关联客户(json数组)',9,'1dd677ec548443b08eb3d5611f17a3ae'),('ffadd8b1306a4046bcbbc7460d17792b','userId','String','用户Id',2,'b6f3fb9478aa43398e96bd03823aa667');
/*!40000 ALTER TABLE `interface_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface_type`
--

DROP TABLE IF EXISTS `interface_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface_type` (
  `type_id` varchar(35) NOT NULL,
  `type_name` varchar(20) NOT NULL,
  `type_pid` varchar(35) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface_type`
--

LOCK TABLES `interface_type` WRITE;
/*!40000 ALTER TABLE `interface_type` DISABLE KEYS */;
INSERT INTO `interface_type` VALUES ('03dc37ee099a48a2b8447ccf69feb8b6','空','05a6b344fa244892856d6113fafa824f'),('03f3f8250a1d441aa092232ee6c91a4d','找回密码','0'),('05a6b344fa244892856d6113fafa824f','个人信息接口','0'),('0c01b3b3f8fa411e8517cad371565a10','空','f298278523b449a7ac84f58f6a4fdd81'),('0d874e514ee744cc8ddeb7c884638d7c','空','dd09b6031b224185b5b582c4e17a57f5'),('0fc8955db566432b935607c7d1f962d2','客户订单','7fd1cbfa517d47758a14d6afc6e746bc'),('150f8cddbb054f8f97e109abd55952e5','空','5c2afd4bfc0c4ec49a30b000e20a3c0b'),('1bef32e052414c69a3deeddecf49d806','库存盘点','f0eb80ad83fd4c728fe53df01c20e000'),('1ee0cd0050b340faa89062b87e64ea0f','跟单订单(跟单)','7fd1cbfa517d47758a14d6afc6e746bc'),('2644cd922f4f44d7bb65ddfa609452e2','空','3a9bb3d99734486ba7fe0ab5330eb869'),('2902131e007c427a85387dc11cf15898','养殖信息(新)','3bca2ae92c2d42ed8bb6418f0e7429de'),('2aa8bd982bef40469246fbb09f74d916','团队接口','0'),('2ac5d668d40a45178887cb7bb9bbb286','客户跟进','3bca2ae92c2d42ed8bb6418f0e7429de'),('2cc520f7d1f348a485bb59e12aa6aefb','订单凭证','7fd1cbfa517d47758a14d6afc6e746bc'),('2f696965265c4bfeb2b4f3059ef10ccb','空','86ff4b4396514203bab501fc6e7ae067'),('32759ecf7ca445b0beaba0dbafe9d999','空','e2d7ca9f1bd144119c40cc5d29d3a846'),('3581f274f4894c8dbd1c9cb1db5b2b79','空','2ac5d668d40a45178887cb7bb9bbb286'),('371507148b4e4ba2bc43edbe5882b7e5','空','c1de32d994b74d2983bc184adf941cfb'),('398da1cd89974535809862c823150653','客户信息','3bca2ae92c2d42ed8bb6418f0e7429de'),('3a9bb3d99734486ba7fe0ab5330eb869','申请库存','f0eb80ad83fd4c728fe53df01c20e000'),('3bca2ae92c2d42ed8bb6418f0e7429de','客户接口','0'),('3c4e1fe89d764ba193d065f8fb962c91','业务订单(业务)','7fd1cbfa517d47758a14d6afc6e746bc'),('41a4500ffb844519a37664a515367446','空','2aa8bd982bef40469246fbb09f74d916'),('4a9a8d91d40f4b5bb3a37bc532a6b982','运费模板','dd09b6031b224185b5b582c4e17a57f5'),('4e87d6c7dbef4464a3920bd55155d05c','空','a5d007b995274e6d808e60c9d4e22584'),('57f511a6a44741cdb1046e5f43ff2e48','业务订单(业务管理)','7fd1cbfa517d47758a14d6afc6e746bc'),('5c2afd4bfc0c4ec49a30b000e20a3c0b','财务订单(财务)','7fd1cbfa517d47758a14d6afc6e746bc'),('5dccffb8db924ca68f98d25cd5f02afa','空','f0eb80ad83fd4c728fe53df01c20e000'),('6394b49eef75466a9208744b19608ffb','空','2cc520f7d1f348a485bb59e12aa6aefb'),('65632fbe79f645778734bde6fc6b45bf','空','c652ad76506748a7b0be357066aac0e5'),('6c3319b0e22f45a2acac0de19f9833ad','空','0fc8955db566432b935607c7d1f962d2'),('6d186aa139c74f7185eb0b132905dee8','商品浏览','c14649ca222243b9b047f04205a3b9a3'),('6fe49ce5c593478cb82ffdff503e4c7c','空','7fd1cbfa517d47758a14d6afc6e746bc'),('7337e6e76a644066854e16b2c329cfdf','查看库存','f0eb80ad83fd4c728fe53df01c20e000'),('73b7830f543846fca45a7d7607fd465c','空','e4bd837de42f4c3fac48be13d6ad0b40'),('76f3f8a5877a4b928e44ec26de785784','空','1ee0cd0050b340faa89062b87e64ea0f'),('773bf9c8af0c4721b5e444fe21abcda1','客户资源','0'),('7ab646ad7a154ea3a5fb4543bac2b323','空','773bf9c8af0c4721b5e444fe21abcda1'),('7ea1cb8b88544407a8043d6540ed19e5','空','7337e6e76a644066854e16b2c329cfdf'),('7f3efac49cba4219a4e3c7ba93263a47','农户信息','3bca2ae92c2d42ed8bb6418f0e7429de'),('7fd1cbfa517d47758a14d6afc6e746bc','订单接口','0'),('831ab9b5c9124b9d850c91d9fa0891ea','组织管理接口','0'),('86ff4b4396514203bab501fc6e7ae067','申请协助','3bca2ae92c2d42ed8bb6418f0e7429de'),('90503474f1774c899c88346d28ccfbb0','空','eefbd994ad47489e813c86ab99bad073'),('93ea50b475894780b805d440576e8729','空','03f3f8250a1d441aa092232ee6c91a4d'),('9b9ab57e6150419ba468cdfc82f22477','库存进仓','f0eb80ad83fd4c728fe53df01c20e000'),('9e36f2812b1c4370be4371d9799047e4','空','f25ca51efb3540d7b6fff3db575b0f19'),('a019dee843b7499bbb300043a055e9ec','空','e8d1b8996f89483589013a0669deca7a'),('a4768ccf06e3405e9f0e018a7ae071c0','空','398da1cd89974535809862c823150653'),('a5d007b995274e6d808e60c9d4e22584','经营单位','3bca2ae92c2d42ed8bb6418f0e7429de'),('add96eaf1e454f459894b442e061691a','空','c6a2b85d8be242c194af42841387059a'),('af6f00b6fd6941518cc5928f119f2397','空','4a9a8d91d40f4b5bb3a37bc532a6b982'),('c14649ca222243b9b047f04205a3b9a3','客户商城接口','0'),('c1de32d994b74d2983bc184adf941cfb','财务订单(财务管理)','7fd1cbfa517d47758a14d6afc6e746bc'),('c3a1cd81b2954274b7cbd94c22b8349c','空','3bca2ae92c2d42ed8bb6418f0e7429de'),('c652ad76506748a7b0be357066aac0e5','购物车','c14649ca222243b9b047f04205a3b9a3'),('c6a2b85d8be242c194af42841387059a','销售点','dd09b6031b224185b5b582c4e17a57f5'),('c7eff67cae0447aa8ad4f651f0ba0890','空','3c4e1fe89d764ba193d065f8fb962c91'),('c87afae7685d4338a47e7a38ecc85339','申请体验','0'),('ce4727c034bf46a3a562a3ae584731a9','空','1bef32e052414c69a3deeddecf49d806'),('d3301dbb633b4219ad56ddcd013ebf79','空','acd84d23bae8414f8ad196fe085924c2'),('d68ae3cef71d47a8aa4ed8cf50724239','登陆激活','0'),('dd09b6031b224185b5b582c4e17a57f5','商家商城接口','0'),('e054b23df2324ee183075741a9e7e770','空','7f3efac49cba4219a4e3c7ba93263a47'),('e16795f621be4998996c42a662a8f264','空','d68ae3cef71d47a8aa4ed8cf50724239'),('e1d1fad2cc4c48a4afc9bb98f2cce0da','空','831ab9b5c9124b9d850c91d9fa0891ea'),('e2d7ca9f1bd144119c40cc5d29d3a846','商品编辑','dd09b6031b224185b5b582c4e17a57f5'),('e4bd837de42f4c3fac48be13d6ad0b40','通用申请接口','0'),('e8d1b8996f89483589013a0669deca7a','场地信息','3bca2ae92c2d42ed8bb6418f0e7429de'),('e92cd5f3857c4f448cfc778bbe1e703f','空','9b9ab57e6150419ba468cdfc82f22477'),('eaffb51e459f47ada711932dcbdc362d','空','57f511a6a44741cdb1046e5f43ff2e48'),('eec850200f7e48f5b07b7d9d39b8b5c1','空','c14649ca222243b9b047f04205a3b9a3'),('ef167662457c4929b647d2ed1bbfd2db','空','2902131e007c427a85387dc11cf15898'),('f0a611e016f34f469e7ae8b1d90b3714','空','c87afae7685d4338a47e7a38ecc85339'),('f0eb80ad83fd4c728fe53df01c20e000','库存接口','0'),('f25ca51efb3540d7b6fff3db575b0f19','权限角色接口','0'),('f298278523b449a7ac84f58f6a4fdd81','客户建账','3bca2ae92c2d42ed8bb6418f0e7429de'),('f7666f4c8a45484cade9164fa2e13995','空','6d186aa139c74f7185eb0b132905dee8');
/*!40000 ALTER TABLE `interface_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface_update`
--

DROP TABLE IF EXISTS `interface_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface_update` (
  `update_id` varchar(35) NOT NULL,
  `update_date` datetime NOT NULL,
  `update_text` varchar(255) NOT NULL,
  `info_id` varchar(35) NOT NULL,
  `info_name` varchar(20) NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface_update`
--

LOCK TABLES `interface_update` WRITE;
/*!40000 ALTER TABLE `interface_update` DISABLE KEYS */;
INSERT INTO `interface_update` VALUES ('002b5cdb3f8b40f9a16529b2c8530e81','2017-10-19 15:04:01','新增接口','2c54c4e68d0844b48b12f78af93783dc','修改场地'),('01a5076f35594b99b28f41ae3cdeb4e5','2017-10-19 18:38:51','新增接口','7e995923923742a3bcf111287845011f','协助者获取协助列表'),('02192b676e504cda825701b70b7c2968','2017-10-16 18:09:22','新增接口','ae90901e86b7472899c20756136e7cc8','用户登录'),('0391196da66e4e43b5391be0ce29dd41','2017-10-19 10:31:08','新增接口','b5a03ad641ba4dd7b3a8124d8bab42e5','申请客户建账'),('0517662bc2fe47b3bddafffbb90aabee','2017-10-20 16:50:35','新增接口','f830bdc2357242e991992b6a2f9f3476','获取图片'),('07f9c085baa34fc2aff49b25244a3376','2017-10-19 15:38:10','新增接口','af1379d79875405cbfba73d080e1cab2','获取类目'),('08af0188ad154c1c9731c7389e3e1e8d','2017-10-19 17:08:25','新增接口','37c6ab15d18643379e3a3685dcb37a2b','删除农户'),('09c89f7074cb40a39e7efedcaf7c6b85','2017-10-19 17:14:18','新增接口','fdfb3ca5b15b4ed3b93550f45d5ad710','获取建账申请详情'),('09e180d055e34b8da1a8a018788f584d','2017-10-21 08:58:39','新增接口','b501882d44af4ad7b8bdb9ae48149acc','申请人获取库存申请列表'),('0b29faa1ad7a4a62acb02ba1c344ca36','2017-10-19 17:39:45','新增接口','5ccff2b760ee4d588a41228d565b9aad','删除经营单位'),('0bb308ebb1f446af9e715a143b646a38','2017-10-19 18:43:13','新增接口','1dd677ec548443b08eb3d5611f17a3ae','获取申请详情'),('10210bbedcac429cb4d6d29a8dff3ac1','2017-10-19 11:07:32','新增接口','2ba65c8300dd4fa48aabfd849a5efb80','同意客户建账'),('125343e7600f472a92a5f4d6fd62115b','2017-10-18 18:03:23','新增接口','689bc97709b949019ab4e381744e0639','上传身份证正面照片'),('146388bd871d4fd080ee3bda5e4ebfa4','2017-10-17 17:53:28','更新 角色Id 说明','ae90901e86b7472899c20756136e7cc8','用户登录'),('182b1f5b2b1b470ea0d7ecfdc0d488fd','2017-10-18 15:19:12','新增接口','b7ebc400c4244282b50cb53016719fa8','添加商品到购物车'),('19c8ac06e0bf49c199f67470b5f909ea','2017-10-19 11:02:42','新增接口','49a557aabb3641119a08803f8c08b8dd','拒绝客户建账'),('19cd8ffdf62445cfa022d45d69391dd0','2017-10-18 10:11:46','新增接口','3315be9003d7486db2ee1d4761a4455b','获取默认收货地址'),('20a3c717a9c6421c9026144acbf1b6bd','2017-10-20 18:10:05','新增接口','000186dbcd4b436081cefc9fd13f8846','获取部门列表'),('20f64ee2018342588e030760d4f2e810','2017-10-19 14:57:46','新增接口','be6a4c3222e740f2b4ca5dc4265eb377','上传场地环境图片'),('213b2c3598ea40ac95aeed960281926b','2017-10-17 17:36:06','新增接口','6414f8e5d33f4a93a7793df1459a90cb','上传身份证正面照'),('2373e977fae4417e86a22574a0c04649','2017-10-18 10:16:57','新增接口','87ee0eceaa3348a99c72b16f6bb44afb','删除指定收货地址'),('2bc5a1efb25f4b29ad9de6ed22dd6ba3','2017-10-16 18:21:25','新增接口','b44cc2e23e6e4f2eb2761bf672b6fb0f','获取验证码'),('2d803a61290849648b7128e6699bf467','2017-10-19 17:53:13','新增接口','9f3bef34a9ea46afb8fba1515490efaf','获取跟进列表'),('350cfc27c4ad4dd497ebca10ee7099e9','2017-10-19 10:11:12','新增接口','b438e782f0444b07b3ee397bc309bc7c','跟单员移交客户'),('38a26e5b07e34468b6206bc3f141e06b','2017-10-19 09:21:29','新增接口','c05bf841e4ee449a81bc7c011d06e970','获取跟单员列表'),('38b1b47088004b05897abaa16a22f84b','2017-10-19 16:02:31','新增接口','22e156f92d97482b8be66da2d13a52c4','添加养殖信息（新）'),('3aa0b7fafabb45a18f8fb21567d775cd','2017-10-19 16:49:13','新增接口','2c9a1b2c5e234a39b6363cf88ef3701b','添加农户'),('3f8d454899564685950ab37f43eb654c','2017-10-19 17:56:07','新增接口','09e37c8416f748f4b2d7fae1f8e670bd','更新跟进信息'),('407ee8e3a34e4d86a9d4ece8f9557480','2017-10-20 17:46:31','新增接口','75b48036547c4d5390172b21a4491e93','获取经营单位列表'),('4272f8e249754a48baade6c5ec8cb056','2017-10-19 18:25:11','新增接口','610442c7ecc34b46a419a919e2c78126','申请者获取协助列表'),('44c0448cb45b47f6bad04a456245002e','2017-10-19 15:46:49','新增接口','77030f6cf1bd4572b9718d6f109add9a','获取输入信息列表'),('45acb725bfed45d89f6e2fa0c71a4fa5','2017-10-18 15:48:16','新增接口','54b4dd7bb9004e6189725e2148944ae9','删除购物车商品'),('48188bb9290141358ef329c3b996c1f3','2017-10-17 18:06:24','修改 cardFront 参数类型','6414f8e5d33f4a93a7793df1459a90cb','上传身份证正面照'),('4c1466ef9a0444f6aa75f44b1ee9a9be','2017-10-20 17:10:10','新增接口','b01576d116e743e398c4237c9c1b4bcb','获取场地详情'),('4cf5df88f7b84b1898992708eb2e8ceb','2017-10-18 15:37:45','新增接口','72ad114d06fe4812bae7dd4449b89971','修改购物车商品'),('4f4d522f0d804e01b3ecbe6b5159ed18','2017-10-19 11:39:37','新增接口','d2e72fe6a0ba495fad4c2160f20ab73e','冻结客户'),('4fcd6150df6c43888dada8c7c0796f22','2017-10-16 16:24:02','新增接口','d94c8d7250784df58360ab333fb2e4ed','验证短信验证码'),('505734a4532542a0adfa7fd6e19dc068','2017-10-19 17:30:58','新增接口','4bdc5ca52ef749829ba4bf281f397be2','获取经营单位列表'),('53b4667049154f598507660e1a9f1ba2','2017-10-19 10:52:02','新增接口','590cb636436a49f788f763689af707ed','审批员获取建账申请列表'),('559823b6828e49f292f5efd202684dd2','2017-10-19 16:25:42','新增接口','6db79ab903874e559cf799c0c5194be5','修改养殖信息（新）'),('5648a6585ffc4a54beacbb8c2d5a3b2d','2017-10-16 15:33:05','新增接口','9a14b37330e54b38abadd056f18d10fe','获取验证码'),('56e997d9bef04245b384a74cde1398c2','2017-10-19 17:37:54','新增接口','8d5c6f7446634d8f85b759d6d3175a06','获取经营单位详情'),('59393e3f4f2b4b66912c174f453ab498','2017-10-19 18:34:47','','68feadadea904d6fa18c17aec18c98a7','协助者更新协助结果'),('5c69623e25204c26a0efe6c9a6159f8b','2017-10-19 15:12:44','新增接口','b8e2d60dd0c64f49b9fe6bcb50bfe078','上传场地证明图片'),('5d5274ceb5114f598f634be68ce0d07c','2017-10-19 14:41:51','新增接口','365177c2935b4857aa6e39362cfb3694','获取场地列表'),('607e73a16d2340d38f4736a91c56eef4','2017-10-18 14:36:42','','cfa3c18f01d242a0ab91d684493a45dc','获取当前登录用户的个人信息'),('60b039ace1bb472f9b1b27b9b8e3794b','2017-10-19 18:33:52','新增接口','68feadadea904d6fa18c17aec18c98a7','协助者更新协助结果'),('61435374bff948f4badd93e83421ba5d','2017-10-21 09:06:57','新增接口','93c6a85d73cc4b3f9071f60445ba0eb1','获取库存审批详情'),('614955e482e045fca37f3bfaef446709','2017-10-19 16:40:31','新增接口','1219aa8936b24bd7ae26bdefc1b5165c','删除养殖信息'),('68081f75c3b148dfa61d50b200cfa18c','2017-10-18 09:11:42','新增接口','d4b77a8966c74d4a9b7fad1e9905b6cd','添加收货地址'),('6a5c8b733c2f44e593ef5e66d84c0279','2017-10-20 16:13:46','新增接口','623c680edca6456b89f275ab8c614bf7','获取当前部门下的客户列表'),('6dea057967ff4568b31f37075e691fb0','2017-10-20 17:52:23','新增接口','49624057be4445559f93489bb2cccee4','获取跟进列表'),('6e2a9d5fac09498ea6a6f241909bac29','2017-10-18 17:54:34','新增接口','6c4e7a503eca4112b4a734d50f3e7812','获取团队内所有成员'),('715ccfc4c9c04d48a71c5071fdef5db8','2017-10-17 16:59:31','新增接口','ddd54c231a964cb9ae4ed58da6e9a06b','发起激活'),('74ea26117133434bb3cea2dd1e712317','2017-10-18 09:51:58','新增接口','1b85812f0be9490a84657a03500b4008','更新指定收货地址'),('755d865a091d448285fb839ec1b7d282','2017-10-20 15:56:47','新增接口','912a22a6fd734458ba1d56ae39b4cde9','获取当前部门下的成员列表'),('76ab5e81981347b19ed063310a34926b','2017-10-20 18:15:00','新增接口','53f8cb30bc1747b3a1c9800aa377117b','获取部门详情'),('7787cb2691f84424aa67c74309f09cc2','2017-10-19 18:14:04','新增接口','deaa839f56ce4323a46687a284f4502c','上传证明图片'),('79911db073064f1a9ed1b48b554d59ae','2017-10-19 15:29:15','新增接口','5097f0bc6f10496f8783965acc53b8a5','删除场地'),('7ae91da85ec941c1be8f484f3b36461e','2017-10-20 15:39:04','新增接口','c52b9536af934afba04226aae9f530e9','获取部门列表'),('7bbeb5948b7647c590c95bcded894fdf','2017-10-16 17:54:23','新增接口','ada1e8b8ed284b0da83b56131202cd53','修改密码'),('7bd245360b5f492c9701b82a6e5ed016','2017-10-17 17:38:10','新增接口','b6625b81b5884825ad1c51072eb22d94','上传身份证背面照'),('7e91eb1180a64d5cb5e1e2f4b39d9f1e','2017-10-18 11:05:15','新增接口','701aae07c8d94171a5d4fe8cf0622511','查找商品分类'),('810f54015ca04a3b8f6ceafaa888db5a','2017-10-19 09:57:26','新增接口','b8995f0262e64652ba85a136b3cb24c6','获取业务员列表'),('820b0b7bd77642d1b2e56083d534670a','2017-10-19 16:26:40','','22e156f92d97482b8be66da2d13a52c4','添加养殖信息（新）'),('85a4a92431e64206a3e3f6772653cad7','2017-10-19 16:34:53','新增接口','cff91a59858c422fa6c4f709b89e3603','获取养殖信息详情（新）'),('88e8da6b1b6b4f2ca931748c2899b062','2017-10-20 17:55:02','新增接口','13a33a322fe844a7bcd481664b367f1c','获取跟进详情'),('8a492d9a0deb4e3fafbd8c6b794263b5','2017-10-18 11:54:53','新增接口','f18e2df131ca433fb9629dad194ac600','搜索商品'),('8e4ae24649964b09b3ebc4fb50467dd8','2017-10-18 18:07:51','新增接口','94a4b4adbeed48aca99267235d97781b','上传手持身份证照片'),('905d42aba5074b4daba8247a51bc2629','2017-10-20 16:49:26','新增接口','3919f61cc5bb4d459c52b0c98bc216da','获取客户详情'),('94d3cbfc31d7493f8081d7bc47cbae27','2017-10-18 16:53:00','新增接口','0d0b67f8b5e447efbbe49115c41f5bb7','客户建档'),('9a22b085f12e4d11afb19d332cf0cb04','2017-10-18 11:44:42','','1b59b7d653454aedac39344693f7a027','查看商品详情'),('9a898876361c42cbb153ab2c27ddb8d8','2017-10-20 17:42:09','新增接口','2dd479f0086942689837f2ca54852d34','获取农户列表'),('9bb1f1c6c41a47f7979b6f0855b97dc8','2017-10-17 18:06:46','修改 cardFront 参数类型','6414f8e5d33f4a93a7793df1459a90cb','上传身份证正面照'),('9ee74156e6c447639eb87903c4a55cb7','2017-10-19 18:00:42','新增接口','199830f70dcc47c2946b69656a3ca65d','获取跟进详情'),('9f53c76cf4c045228fecfb8750735637','2017-10-19 12:01:05','新增接口','56095eba55614987bf9945dd3d69566f','添加场地'),('9f92ad872e154376bcb8b37f4442ee65','2017-10-19 17:35:10','新增接口','be58dab447ee4d84b517846e1bc1372c','修改经营单位'),('a158ec071f504f1d94a4ce132fe2daf0','2017-10-20 16:34:01','新增接口','4a4cfc3d2e9d467ea8ffc0077745238f','获取成员的客户列表'),('a1d6ea8a149945738bcc52046796e32d','2017-10-18 18:05:54','新增接口','7d13aacf67af4ba9abe1b9f6733a9919','上传身份证背面照片'),('a4d433b719374b2a9ad57042bfac8842','2017-10-19 10:22:13','新增接口','76b40c145b294413878787e3ab3bb9ab','获取审批人列表'),('a5e2b22315174f3289ae7f4208d09306','2017-10-16 18:27:45','新增接口','b6f3fb9478aa43398e96bd03823aa667','验证短信验证码'),('a7f786bce6c440edabc38e47894162d8','2017-10-18 17:30:28','新增接口','eb7654c6d8a742df8ee395aa480b8471','获取客户详情'),('ae88252a8e2447ce9c75ca42895f8b08','2017-10-19 15:42:24','新增接口','6a8b2e211bdb4ab8a990af919abb5f2b','获取类目选项'),('af8613cdd4d64c4ab6a6961a0e7f883d','2017-10-19 18:21:20','新增接口','23e911701b1a49b58abf7b099e154c9c','添加协助申请'),('b0a92814accc4fd487933927e55e8a83','2017-10-18 15:30:35','新增接口','322ff7ff769c41f6b1ab5e5d9c74570d','获取购物车商品列表'),('b361b752b09f4cf98970068e6736057a','2017-10-17 18:03:31','新增接口','45f3e927c45b4447b74d59a728e807b5','头像上传'),('b45749d07dbe400282b4a533ebba27df','2017-10-17 18:07:01','修改 cardBack 参数类型','b6625b81b5884825ad1c51072eb22d94','上传身份证背面照'),('b8d7b99bcc2f4e59b7bbf301af910d91','2017-10-19 16:12:01','新增接口','af4194226ffb4608b0bd9771b1d90254','获取养殖信息列表（新）'),('b9f7c9fe40ed413bb53a2c59a97be475','2017-10-20 17:28:08','新增接口','2d9196ddb2024b9581bfcb510fb2cce5','获取养殖信息详情'),('bb400abe807842bc9d1bf0e636430e01','2017-10-17 18:11:53','新增接口','cfa3c18f01d242a0ab91d684493a45dc','获取当前登录用户的个人信息'),('bbbf4cebb8364fd4814f86e83c98a977','2017-10-17 18:06:01','修改 cardHand 参数类型','10ee376f64a7404d8f24c453401dc335','上传手持身份证照'),('bced0e351ce0459c8e8939488661916d','2017-10-18 10:32:00','新增接口','c773ee64b481484cb433b0b814194fa0','获取用户角色'),('c163c6dce63944e986489ad8a375606d','2017-10-19 09:11:56','新增接口','97b9990fc5124331b6f761cd267dc772','分配库存等级'),('c2c5ecbb058c4f2d97475e38d16abf33','2017-10-18 14:35:46','添加   身份证号、企业名称、所属部门、工作职位、企业码   参数','cfa3c18f01d242a0ab91d684493a45dc','获取当前登录用户的个人信息'),('c351d5e91ec14061a44974e11d22cd40','2017-10-19 16:57:45','新增接口','489a8428ee114557a34ab2cbb8be70a2','获取农户列表'),('c59762a729bc46e3a32268a99a318057','2017-10-19 17:00:19','新增接口','c99027475df5435ab5fd62633351b207','修改农户'),('c6781417d01a45058d6ebdfcdfdc4138','2017-10-17 17:49:25','新增接口','4d3bd0c8d6cf4631908d3132b72c9aa0','用户登录(浏览器)'),('c7a5ff77306a4a60b2994dca243395c6','2017-10-19 17:26:06','新增接口','d4c12774a2e34da6ae5108b1ed19e25c','添加经营单位'),('c8b86088255b42f68aed56543a58d0e4','2017-10-18 11:44:08','新增接口','1b59b7d653454aedac39344693f7a027','查看商品详情'),('caf6752fee494b75ad4f00421d4838f7','2017-10-18 11:45:22','','1b59b7d653454aedac39344693f7a027','查看商品详情'),('cd2dd56f552f43198ce0ea11c5e12101','2017-10-16 18:00:28','新增接口','7dc5d9e986904416a376065e7134bcd7','提交体验申请'),('cd35e97f51dd4d2999ce26e96b6baf65','2017-10-19 11:45:07','新增接口','df2341d553fb4ca6aa2fbfcff7ee09d6','解冻客户'),('cdd452ea9503400ba6a1b028832313e5','2017-10-19 10:38:56','新增接口','e382083c97824a95a707e7459b6df1e2','申请人获取建账申请列表'),('d0832bab8f7e45d7a990d3d340600b1d','2017-10-19 15:26:12','新增接口','6bba4f0169234ce1b1cacb2c0d1ffe23','删除场地环境、证明图片'),('d0d01a8026504d2ea61b57123f7c924c','2017-10-18 17:18:57','新增接口','dff21b9976f64f9c9ed1fff39d9a9d1b','修改客户'),('d5fe18b8019e4cb6bdbc09bcdad922da','2017-10-19 11:24:43','新增接口','72ffcee59d9140cca65868e7e95ead29','业务员移交客户'),('d7dd104b3c184465aa15dfccb8d043a6','2017-10-17 17:40:56','新增接口','10ee376f64a7404d8f24c453401dc335','上传手持身份证照'),('d7f2a790a64a494c9ad57daf40bbba05','2017-10-18 17:09:33','新增接口','4009414df88f4c60a0f3854838c9e619','获取客户列表'),('d9713f2e467745ebbc2b116b3981f3fb','2017-10-19 17:49:06','新增接口','5ea6c6c4ba9646ceaf6d876845f90430','添加客户跟进'),('dd9ae96a63ef4fcabf0a54af89988514','2017-10-20 15:54:37','新增接口','d757445966794da48bd9fae543d6debb','获取部门下的成员列表'),('e0475a5efe08453fa1d37cfb128dc6b9','2017-10-24 11:25:36','','ccbe4ccfa2a640bfa4d7f9650b0f1b73','生成订单'),('e86bba58676247e29dc01735b97dca4d','2017-10-18 11:12:52','新增接口','68b03974db434ab3bdd09d04dead9d6b','查找分类下的商品'),('e872de02df70430ca1b10ae5a39d488b','2017-10-20 17:20:55','新增接口','163325edc6ab4e32afb3b189bdfe68d2','获取养殖信息列表'),('e931af77f228499ea00cbb141bdf12e2','2017-10-18 18:09:06','新增接口','015b1e3ea6a24a65ba6bfbb9284d8f30','获取图片'),('ec4bf1dfdbff4a85855c218d628a5cf1','2017-10-18 09:44:46','新增接口','9205c489f42f4634a8148de0200384b9','获取收货地址'),('ec4c5fe7fb2a40fbac90c5fb78ef77c1','2017-10-19 15:18:12','新增接口','7dd5837b04d5432391976e8824ce5896','获取场地详情'),('f52654fa2ecb4c11b0db7e0415992626','2017-10-20 17:01:49','新增接口','8b2bd88dc8cc4717b86bdbde6305b65d','获取场地列表');
/*!40000 ALTER TABLE `interface_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manage_unit`
--

DROP TABLE IF EXISTS `manage_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manage_unit` (
  `manage_id` varchar(35) NOT NULL,
  `customer_id` varchar(35) NOT NULL DEFAULT '',
  `manage_name` varchar(20) NOT NULL DEFAULT '',
  `manage_type` varchar(200) DEFAULT NULL,
  `manage_address` varchar(50) NOT NULL DEFAULT '',
  `manage_acreage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`manage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manage_unit`
--

LOCK TABLES `manage_unit` WRITE;
/*!40000 ALTER TABLE `manage_unit` DISABLE KEYS */;
INSERT INTO `manage_unit` VALUES ('259e99cfbc5a41c8ae99fc47bea55ba5','22fbd2f300f5415785f1d97969e51e5a','西瓜零售','水果','江门鹤山',100),('f2e69fb129e640a082a8eb4730aa3ab9','94a397ea0eae4632994108c02fe3b762','鹤山经营部','猪,鱼','',0);
/*!40000 ALTER TABLE `manage_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(20) NOT NULL DEFAULT '',
  `menu_url` varchar(100) NOT NULL DEFAULT '',
  `menu_pid` int(11) NOT NULL DEFAULT '0',
  `menu_icon` varchar(15) NOT NULL DEFAULT '',
  `menu_isHeader` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `delete_date` datetime DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'我的客户','/pages/customer/group.jsp',0,'',0,1,0,NULL),(2,'商城','',0,'',0,2,0,NULL),(3,'类目管理','/pages/mall/type/type.jsp',2,'',0,1,0,NULL),(4,'我的好友','/pages/friend/friend.jsp',0,'',0,1,0,NULL),(5,'添加商品','/pages/mall/goods/typeSelect.jsp',2,'',0,1,0,NULL),(6,'图片上传','/pages/mall/img.jsp',2,'',0,1,0,NULL),(7,'我的团队','/pages/team/team.jsp',0,'',0,1,0,NULL),(8,'系统菜单','',0,'',0,2,0,NULL),(9,'数据字典','/pages/dictionary/dictionary.jsp',8,'',0,1,0,NULL),(10,'商品管理','/pages/mall/goods/goodsManage.jsp',2,'',0,1,0,NULL),(11,'权限管理','/pages/permission/permission.jsp',8,'',0,1,0,NULL),(12,'角色管理','/pages/role/role.jsp',8,'',0,1,0,NULL),(13,'团队管理','/pages/team/nx-team.jsp',0,'',0,1,0,NULL),(14,'用户权限管理','/pages/permission/qm-permission.jsp',8,'',0,1,0,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_order`
--

DROP TABLE IF EXISTS `my_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_order` (
  `order_id` varchar(35) NOT NULL,
  `order_status` tinyint(4) NOT NULL DEFAULT '0',
  `order_status_before` tinyint(4) DEFAULT NULL,
  `user_id` varchar(35) NOT NULL DEFAULT '',
  `user_name` varchar(20) NOT NULL,
  `seller_message` varchar(150) NOT NULL DEFAULT '',
  `buyer_message` varchar(150) NOT NULL DEFAULT '',
  `refund_message` varchar(150) DEFAULT NULL,
  `freight` float NOT NULL DEFAULT '0',
  `payment_type` tinyint(4) NOT NULL DEFAULT '0',
  `payment_status` tinyint(4) NOT NULL DEFAULT '0',
  `shopping_address` varchar(150) NOT NULL DEFAULT '',
  `logistics_status` text,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `refund_date` datetime DEFAULT NULL,
  `finish_date` datetime DEFAULT NULL,
  `order_number` varchar(35) NOT NULL,
  `my_team_id` varchar(35) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_order`
--

LOCK TABLES `my_order` WRITE;
/*!40000 ALTER TABLE `my_order` DISABLE KEYS */;
INSERT INTO `my_order` VALUES ('1ee46bbd9f9b4462b2256aac46f0d3e1',107,108,'0bb4b24df33948cfb68e61c1d5c1c75d','alisa','','','不想买了',1,10,111,'','','2017-10-24 18:28:11',NULL,'2017-10-25 09:51:34','69741360','10001'),('40649b0e97864417915fcc8cadcd331f',105,NULL,'0bb4b24df33948cfb68e61c1d5c1c75d','alisa','','',NULL,1,10,112,'','','2017-10-25 17:17:54',NULL,NULL,'69548985','10001'),('86ecddac993a4220961f805ac6c0d26c',92,NULL,'0bb4b24df33948cfb68e61c1d5c1c75d','alisa','','',NULL,1,20,112,'','','2017-10-25 17:22:54',NULL,NULL,'70126108','10001');
/*!40000 ALTER TABLE `my_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_order_list`
--

DROP TABLE IF EXISTS `my_order_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_order_list` (
  `order_id` varchar(35) NOT NULL DEFAULT '',
  `standard_id` varchar(35) NOT NULL DEFAULT '',
  `goods_name` varchar(60) NOT NULL DEFAULT '',
  `goods_price` float NOT NULL DEFAULT '0',
  `goods_image` text,
  `goods_describe` text,
  `standard_name` varchar(20) NOT NULL DEFAULT '',
  `buy_num` int(11) NOT NULL DEFAULT '0',
  `refund_num` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_order_list`
--

LOCK TABLES `my_order_list` WRITE;
/*!40000 ALTER TABLE `my_order_list` DISABLE KEYS */;
INSERT INTO `my_order_list` VALUES ('1ee46bbd9f9b4462b2256aac46f0d3e1','8e6aabae569e44ca80db3115372aa1a4','【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋',20,'35aa7507390f4ead9d64dc55cc2aa768|4ece06b76d3f42718722e37a92b44d0c|4fb2d3accff24ba4a9dec5d2a38e5b25|716e780e379142a5812587a4ba11387e|eedad265f3624c0eb2c6f9ac890989aa|','4fb2d3accff24ba4a9dec5d2a38e5b25|7bc2d9bfafc744c8a6ecabfb7c6e9ce2|7ea010df01dd4e88847daf5c3e3a5002|cb4e6691e9dc46b980576492cc5567d3|eedad265f3624c0eb2c6f9ac890989aa|','100g/袋',5,5),('40649b0e97864417915fcc8cadcd331f','8e6aabae569e44ca80db3115372aa1a4','【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋',20,'35aa7507390f4ead9d64dc55cc2aa768|4ece06b76d3f42718722e37a92b44d0c|4fb2d3accff24ba4a9dec5d2a38e5b25|716e780e379142a5812587a4ba11387e|eedad265f3624c0eb2c6f9ac890989aa|','4fb2d3accff24ba4a9dec5d2a38e5b25|7bc2d9bfafc744c8a6ecabfb7c6e9ce2|7ea010df01dd4e88847daf5c3e3a5002|cb4e6691e9dc46b980576492cc5567d3|eedad265f3624c0eb2c6f9ac890989aa|','100g/袋',5,0),('86ecddac993a4220961f805ac6c0d26c','8e6aabae569e44ca80db3115372aa1a4','【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋',20,'35aa7507390f4ead9d64dc55cc2aa768|4ece06b76d3f42718722e37a92b44d0c|4fb2d3accff24ba4a9dec5d2a38e5b25|716e780e379142a5812587a4ba11387e|eedad265f3624c0eb2c6f9ac890989aa|','4fb2d3accff24ba4a9dec5d2a38e5b25|7bc2d9bfafc744c8a6ecabfb7c6e9ce2|7ea010df01dd4e88847daf5c3e3a5002|cb4e6691e9dc46b980576492cc5567d3|eedad265f3624c0eb2c6f9ac890989aa|','100g/袋',5,0);
/*!40000 ALTER TABLE `my_order_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_order_proof`
--

DROP TABLE IF EXISTS `my_order_proof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_order_proof` (
  `proof_id` varchar(35) NOT NULL,
  `proof_url` varchar(255) NOT NULL,
  `order_id` varchar(35) NOT NULL,
  PRIMARY KEY (`proof_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_order_proof`
--

LOCK TABLES `my_order_proof` WRITE;
/*!40000 ALTER TABLE `my_order_proof` DISABLE KEYS */;
INSERT INTO `my_order_proof` VALUES ('62c14ac6a6194918a93c6bb1071810b6','/upload/img/user/order_proof/9f6bc79d769342f1b90ed0b532b870f2/f78c35af613744a182c01acb000adbab.jpg','1ee46bbd9f9b4462b2256aac46f0d3e1'),('717e556a29ce46b1a405ef832f89d460','/upload/img/user/order_proof/9f6bc79d769342f1b90ed0b532b870f2/e9d28eecc4714c9b8e34990496651f79.jpg','40649b0e97864417915fcc8cadcd331f');
/*!40000 ALTER TABLE `my_order_proof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_team`
--

DROP TABLE IF EXISTS `my_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_team` (
  `my_team_id` varchar(35) NOT NULL,
  `my_team_name` varchar(20) NOT NULL DEFAULT '',
  `my_team_create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `my_team_area` varchar(100) NOT NULL DEFAULT '',
  `my_team_address` varchar(100) NOT NULL DEFAULT '',
  `my_team_member_number` int(11) NOT NULL DEFAULT '0',
  `my_team_sort` tinyint(4) NOT NULL DEFAULT '1',
  `my_team_type` varchar(20) NOT NULL DEFAULT '',
  `my_team_pid` varchar(35) NOT NULL DEFAULT '0',
  `lat_lng` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`my_team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_team`
--

LOCK TABLES `my_team` WRITE;
/*!40000 ALTER TABLE `my_team` DISABLE KEYS */;
INSERT INTO `my_team` VALUES ('10001','青麦科技','2017-10-10 00:00:00','鹤山市文化路181号','广东省江门市鹤山市楼冲村委会',0,1,'','0','22.770089,112.983026');
/*!40000 ALTER TABLE `my_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent_dictionary`
--

DROP TABLE IF EXISTS `parent_dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent_dictionary` (
  `par_dict_id` varchar(35) NOT NULL,
  `par_dict_name` varchar(50) NOT NULL DEFAULT '',
  `par_dict_create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sort` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`par_dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_dictionary`
--

LOCK TABLES `parent_dictionary` WRITE;
/*!40000 ALTER TABLE `parent_dictionary` DISABLE KEYS */;
INSERT INTO `parent_dictionary` VALUES ('297ebc9fd0f640fca9f04c8fc067414e','填写类型','2017-05-17 15:51:15',''),('58c359e4f354459aa2d9692a50ca3e19','是否必填','2017-05-17 15:51:15',''),('60da30408feb45b78a6340e45427a77d','用户性别','2017-06-17 09:06:06',''),('7358aa8f92bd43dfb8e9472a7a4c74f5','订单状态','2017-05-17 15:51:15',''),('7c91ff9e7e3b47a7ba42b4d4ea78ab5a','付款方式','2017-05-17 15:51:15',''),('8a17ada2ba50486db550935f4ca90780','好友状态','2017-06-16 17:05:28',''),('9fb5903640b340b795bc68481f1b48e3','客户分组','2017-05-17 15:51:15',''),('b3a5fa19c94d4a18b5b6c75ce8d3c828','图片类型','2017-05-17 15:51:15',''),('ca970ab6c3d847b0b14cc6cd64ea253c','用户状态','2017-05-17 15:51:15','');
/*!40000 ALTER TABLE `parent_dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `permission_id` varchar(35) NOT NULL,
  `permission_name` varchar(20) NOT NULL DEFAULT '',
  `permission_url` varchar(100) NOT NULL DEFAULT '',
  `permission_pid` varchar(35) NOT NULL DEFAULT '',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES ('0019a7d08baa4435b3b8cbb1782d607b','添加场地','/s/saveUserPlace.action','f504a83780ee405bb2bf2846c8185b68'),('0042344cca67495b86db8b577dc24176','获取场地详情','/s/getUserPlace.action','f504a83780ee405bb2bf2846c8185b68'),('00a6ba84fcc94e6a81e92507e467ae63','获取成员详细信息','/s/findMemberInfo.action','290c49508d5242a995eef8697258866e'),('00a7c307aaea43a49afca925477df809','获取场地详情','/s/getVisitUserPlace.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('0216be55f13e4808bc56489bb236d19f','获取农户列表','/s/listFarmer.action','48ad23d3663742709b0fd02566c5bce1'),('022f797ea95a406c9b332114adc8547a','上传身份证背面照片','/s/insertCardBack.action','290c49508d5242a995eef8697258866e'),('02b05ed50b9744829b9a94683d75b926','发起人获取申请列表','/s/listCommonApplyByProposer.action','180a88d962b5473688557fc6c31f6a5b'),('0586216edb504e18a672497debf365c2','编辑运费模板','/s/updateFreightTemp.action','81e21c825dbd41f3812fcad7e22b767f'),('07b17ceb6d324416b968a74ce715bccc','获取部门下成员列表','/s/findDepartmentMember.action','c6e68494eb1c4e71abbd441e18ed7c4d'),('0d5cb8e7b6534e86b4224e56a8d8ff24','减少一级库存','/s/updateRepertorySubFirst.action','cdcdefebac994aed81a9d07f30255c43'),('0fc36c021f4340919dec479de48445cc','获取申请详情','/s/getCustomerAssist.action','3890b7d139cf4ed6a23bc8800a62b8a8'),('0fe2c03ab49b472abfb8a8b372fc3cb9','删除养殖信息','/s/removeUserBreed.action','80a907d42ed94b208c99751ec532fb47'),('107656762e6a4ab1bbc481020e0a231e','分配销售点商品','/s/updateBranchGoods.action','6d378d07a74a40a4932a3116b1e05172'),('136ff3eab4d7402199359f10ba375ba9','修改客户','/s/updateCustomer.action','9431640a423a4c44a078b11f67f9c47e'),('14b69b41768d428cad8f466019d6d426','跟单确认收到退货','/s/updateRefundReceive.action','e15672bda5ac4ae1bc712ce209ca35b4'),('18053369bf3f4db2a847f74ecccbda0e','获取所有商品列表','/s/listGoods.action','6d378d07a74a40a4932a3116b1e05172'),('180a88d962b5473688557fc6c31f6a5b','通用申请-通用申请','','0'),('201ccdd96be04a3897747c7c2ba52070','减少二级库存','/s/updateRepertorySubSecond.action','cdcdefebac994aed81a9d07f30255c43'),('25787f3af83a42c189e2dd2dc87f710f','根据手机号或用户名搜索用户','/s/findMemberByNameOrPhone.action','c6e68494eb1c4e71abbd441e18ed7c4d'),('26994a4b6526462c86cebe80fa022724','财务A轮审核通过','/s/updateFinancePassA.action','a9a3ef3eece0484b9c30f49703780c09'),('26c2312d07914617b5b435e7fe6b7f2c','删除农户','/s/removeFarmer.action','48ad23d3663742709b0fd02566c5bce1'),('2714cdbd1e274a51a694f5efa8af8856','获取团队部门及成员','/s/listDepartmentAndMember.action','c6e68494eb1c4e71abbd441e18ed7c4d'),('290c49508d5242a995eef8697258866e','组织管理-组织管理','','0'),('2a5b73afb4d043da97b9804a90580387','添加图片到图片空间','/s/uploadToImgSpace.action','8499740c4d72458ebf7dd159369ea12a'),('2b6bbbc390dc46098a7a4796a1b4f259','添加运费模板','/s/saveFreightTemp.action','81e21c825dbd41f3812fcad7e22b767f'),('2b7ccc2a1af9411d8d55a58aeca1afc5','获取场地列表','/s/listVisitUserPlace.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('2cade59526764f368e76011d46329bc2','添加部门','/s/addDepartment.action','290c49508d5242a995eef8697258866e'),('2d2b7f2c4b1b4e9dbac91dc375348ba4','根据订单号获取订单列表','/s/listSalesOrderByOrderNumber.action','e15672bda5ac4ae1bc712ce209ca35b4'),('2dbbf3994e60476384f60f5e1309cc4a','获取成员详情','/s/getDepartmentMember.action','c6e68494eb1c4e71abbd441e18ed7c4d'),('2e9323ed3f1642d5811594c27c8c62a7','上传身份证正面照片','/s/insertCardFront.action','290c49508d5242a995eef8697258866e'),('2ef042915877480ba9c19a069bfc2731','获取商品描述','/s/findGoodsDescribe.action','8499740c4d72458ebf7dd159369ea12a'),('2fe4f35574944bd8bd1efa20bbc10d91','添加商品','/s/goodsRelease.action','8499740c4d72458ebf7dd159369ea12a'),('30ee89b8b7944cb49fb7f2ddba7e7df1','上传场地环境图片','/s/uploadPlaceEnvironment.action','f504a83780ee405bb2bf2846c8185b68'),('33725961ee8b4c699658323f418facd3','跟单员移交客户','/s/updateCustomerToMerchandiser.action','9431640a423a4c44a078b11f67f9c47e'),('34c3494f08f8417194c2b624675f768b','解冻客户','/s/updateCustomerUnfreeze.action','9431640a423a4c44a078b11f67f9c47e'),('3890b7d139cf4ed6a23bc8800a62b8a8','客户-申请协助','','0'),('3aa27d074ce54338997b69c6b78d5c21','修改经营单位','/s/updateManageUnit.action','93af34d839e24e59943724ad6f568e3c'),('3c16bc6a83c34cb1bbdbace057e43e75','确认签收','/s/updateRepertoryApplyFinish.action','4992632ef68d4fca88b118e5a5d5f943'),('42a46e72135449b0b5c9bb44371b7e6d','获取库存分配记录','/s/listRepertoryRecord.action','cdcdefebac994aed81a9d07f30255c43'),('42de550b68e94dbf9744d561a542fa6d','获取审批人列表','/s/listAccountChecker.action','c86cb881c60b46e0bbcaff33e6759324'),('42f0a5cd03054109a93538d6e700cadf','获取跟单员列表','/s/listMerchandiser.action','c86cb881c60b46e0bbcaff33e6759324'),('448ea6a49825449cb4c8245d3d79e780','上传身份证正面照片','/s/saveFrontImage.action','9431640a423a4c44a078b11f67f9c47e'),('48ad23d3663742709b0fd02566c5bce1','客户-农户信息','','0'),('4992632ef68d4fca88b118e5a5d5f943','库存-申请库存','','0'),('4af4bbab4da94dbea01542dee230c1d6','删除商品','/s/deleteGoods.action','8499740c4d72458ebf7dd159369ea12a'),('5293a87b01c744698034f3fc94e5e7fb','获取部门详情','/s/findDepartmentInfo.action','290c49508d5242a995eef8697258866e'),('534b4db496bf4ed8a26185bf12cea818','获取经营单位列表','/s/listVisitManageUnit.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('5557c7682e05401aa8fbad5d197b375c','获取部门列表','/s/findDepartmentList.action','290c49508d5242a995eef8697258866e'),('560f4c55faa147ccb0a94b9ebdb3be67','上传申请用图片','/s/saveCommonApplyImage.action','180a88d962b5473688557fc6c31f6a5b'),('5860b406edb84e4eba460ca871b2476d','获取职位列表','/s/findPositionList.action','290c49508d5242a995eef8697258866e'),('5899d077d5ad41e3b90a6fde42326bc9','获取建账申请','/s/getCustomerAccount.action','c86cb881c60b46e0bbcaff33e6759324'),('5a418ffc4208480e9a3f6a05f5d38959','获取部门下成员列表','/s/findMemberList.action','290c49508d5242a995eef8697258866e'),('5eade54e69aa4d809917eb2024f1bd19','库存-查看库存','','0'),('5ef8f0c163c64944a3b077e2d8ccfe6c','拒绝客户建账','/s/updateCustomerAccountRefuse.action','c86cb881c60b46e0bbcaff33e6759324'),('5f6395f1b6e64b01993eba581514d2b9','获取部门下的成员列表','/s/listVisitMember.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('5f76889ef85a4af68d9b2ea9d864661d','获取部门列表','/s/listTeamDepartment.action','c6e68494eb1c4e71abbd441e18ed7c4d'),('5fd5b78447bd4e8db65e0dfb3c198e1d','获取类目','/s/listBreedType.action','80a907d42ed94b208c99751ec532fb47'),('60385f4df1384b33aac6f0a3993b9e4c','删除运费模板','/s/removeFreightTemp.action','81e21c825dbd41f3812fcad7e22b767f'),('648610cb5a47420f8d8155b7ceaeebe5','查找商品所属类目','/s/findTypeAndParents.action','8499740c4d72458ebf7dd159369ea12a'),('653973d62b10474dbd056dc79c25f517','获取跟进详情','/s/getVisitCustomerFollow.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('666cd9d8496a41cf9c009f6e29c152bc','获取跟进列表','/s/listVisitCustomerFollow.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('673fb85726a94e49b9d6c53751fe2a21','获取图片空间图片','/s/findImages.action','8499740c4d72458ebf7dd159369ea12a'),('6890e92508e0444088a3223551bebdf3','获取养殖信息列表（新）','/s/listUserBreedJson.action','80a907d42ed94b208c99751ec532fb47'),('6a673815aa654215a20fe0ed189653a2','添加养殖信息（新）','/s/saveUserBreedJson.action','80a907d42ed94b208c99751ec532fb47'),('6a7bc156dc0349db92753c41323b4f85','获取身份证图片','/s/getCardImage.action','290c49508d5242a995eef8697258866e'),('6b2a2dd116b14b2f8474573ad7e6c848','审批员获取建账申请列表','/s/listCustomerAccountByChecker.action','c86cb881c60b46e0bbcaff33e6759324'),('6b616a89824e424b917478815d4326ec','获取商品列表','/s/findGoodsList.action','8499740c4d72458ebf7dd159369ea12a'),('6d378d07a74a40a4932a3116b1e05172','商城-销售点','','0'),('707d9bfcdd6b4cdaaf2463500e772850','财务A轮审核不通过','/s/updateFinanceFailA.action','a9a3ef3eece0484b9c30f49703780c09'),('7590e3fa637f4314aa100fdd05c757cf','业务员移交客户','/s/updateCustomerToPromoter.action','9431640a423a4c44a078b11f67f9c47e'),('77eb3a58491b468fae49af4d3abcb6a3','发起通用申请','/s/saveCommonApply.action','180a88d962b5473688557fc6c31f6a5b'),('78b8b104904a46a0b007112f09e7a5a3','跟单同意退款','/s/updateRefundPass.action','e15672bda5ac4ae1bc712ce209ca35b4'),('796d88dc9b934104a9823254991f08a8','财务退款','/s/updateRefundMoney.action','a9a3ef3eece0484b9c30f49703780c09'),('79d8bfa769864a32910e9eae1c507133','添加协助申请','/s/saveCustomerAssist.action','3890b7d139cf4ed6a23bc8800a62b8a8'),('7c055fd3abbd44728f970e10fc73ad84','获取图片','/s/getVisitIDCard.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('7ce1464db3d74492abeba4db1b6aca3f','查看一级库存','/s/listRepertoryFirst.action','5eade54e69aa4d809917eb2024f1bd19'),('7ff74698b2b04ca2b6494ab770d0857d','获取输入信息列表','/s/listBreedInfo.action','80a907d42ed94b208c99751ec532fb47'),('80a907d42ed94b208c99751ec532fb47','客户-养殖信息','','0'),('81c886a40cd4426fb01923bc240e61d8','分配库存等级','/s/saveRepertoryLevel.action','9431640a423a4c44a078b11f67f9c47e'),('81e21c825dbd41f3812fcad7e22b767f','商城-运费模板','','0'),('844e653300004df0835e9f34805d8e29','获取图片','/s/getCustomerIDCard.action','9431640a423a4c44a078b11f67f9c47e'),('8499740c4d72458ebf7dd159369ea12a','商城-商品编辑','','0'),('86830056701847b6b7958ab76bf1d8c0','财务B轮审核通过','/s/updateFinancePassB.action','a9a3ef3eece0484b9c30f49703780c09'),('8aa9e9aa751f45a9972ef60dc2f98cd4','获取销售点详情','/s/getBranch.action','6d378d07a74a40a4932a3116b1e05172'),('8cab39dd93ef4d009b91e4c74afd6f25','删除场地环境、证明图片','/s/removePlaceImage.action','f504a83780ee405bb2bf2846c8185b68'),('8e2267fb35b846d3b65d8b36a84047ba','删除部门成员','/s/updateDepartment.action','290c49508d5242a995eef8697258866e'),('8ee3ab9a4d56493fba30ebb4091834a6','添加农户','/s/saveFarmer.action','48ad23d3663742709b0fd02566c5bce1'),('8f9f3a18414e4fba9d1fecb27735d5b3','获取审批人列表','/s/listRepertoryChecker.action','4992632ef68d4fca88b118e5a5d5f943'),('8fe811b567fd4455900cc0c90329c3ad','拒绝申请','/s/updateCommonApplyRefuse.action','180a88d962b5473688557fc6c31f6a5b'),('92c603084fb84368b9c388d092abcc00','获取类目选项','/s/listBreedSelect.action','80a907d42ed94b208c99751ec532fb47'),('93af34d839e24e59943724ad6f568e3c','客户-经营单位','','0'),('93d794371bed4bbe9078d956161eb75d','获取场地列表','/s/listUserPlace.action','f504a83780ee405bb2bf2846c8185b68'),('9431640a423a4c44a078b11f67f9c47e','客户-客户信息','','0'),('94926b1491044120a6afb6f124c4ad70','获取经营单位详情','/s/getManageUnit.action','93af34d839e24e59943724ad6f568e3c'),('966f3438db0543759a2ddd3d16d70b21','查看销售点库存','/s/listBranchGoods.action','5eade54e69aa4d809917eb2024f1bd19'),('98a37be8c86a487397bd05292176ba21','获取商品详情','/s/findGoodsInfo.action','8499740c4d72458ebf7dd159369ea12a'),('9ac7fc56b31c4ab39f81e6a9242079bc','删除部门','/s/deleteDepartment.action','290c49508d5242a995eef8697258866e'),('a0595a0ff6104ca887df9a1a6b21fb1f','获取销售点商品列表','/s/listBranchGoods.action','6d378d07a74a40a4932a3116b1e05172'),('a0cf0557aef74a54975d8554fe73bc2d','修改商品','/s/updateGoods.action','8499740c4d72458ebf7dd159369ea12a'),('a15744ad321a4ad3b2310b7854071f04','发起申请','/s/saveRepertoryApply.action','4992632ef68d4fca88b118e5a5d5f943'),('a3ffabc02fa4411095948ecb5f78594e','删除场地','/s/removeUserPlace.action','f504a83780ee405bb2bf2846c8185b68'),('a57f3a10735d4af2ae8a7dfbf2bbed08','登录后台系统','/s/login.action','290c49508d5242a995eef8697258866e'),('a5c20cefc4d048dab099081de30bcdb6','审批人获取申请列表','/s/listCommonApplyByApprove.action','180a88d962b5473688557fc6c31f6a5b'),('a631dc8930454ba78c1eb9b40a4685b7','更新部门信息','/s/updateDepartment.action','290c49508d5242a995eef8697258866e'),('a7b35ea834b84ced895af372ab72e5cb','筛选订单','/s/listSalesOrderSelective.action','e15672bda5ac4ae1bc712ce209ca35b4'),('a9a3ef3eece0484b9c30f49703780c09','商城-财务订单','','0'),('abd203fcb5284217b6903e9d0ab577af','获取部门详情','/s/findDepartmentDetail.action','c6e68494eb1c4e71abbd441e18ed7c4d'),('acb6399fc6a84da78d35b698446b1528','添加养殖信息','/s/saveUserBreed.action','80a907d42ed94b208c99751ec532fb47'),('account_check','同意客户建账','/s/updateCustomerAccountAccept.action','c86cb881c60b46e0bbcaff33e6759324'),('b277b9aef08d4710bebff69b42af7812','获取养殖信息列表','/s/listUserBreed.action','80a907d42ed94b208c99751ec532fb47'),('b2b91eaffb9a437cb8cd7de3e919b95d','更新成员信息','/s/updateMember.action','290c49508d5242a995eef8697258866e'),('b3128894fa2248b2a56c4f3a0eb3ffcc','上传证明图片','/s/saveAssistImage.action','3890b7d139cf4ed6a23bc8800a62b8a8'),('b40a500c505043e9863491a06bf44200','获取部门名称和部门下的成员总数','/s/findTeamAndMemberCount.action','290c49508d5242a995eef8697258866e'),('b53602691de140d789c443cba7ce811d','冻结客户','/s/updateCustomerFreeze.action','9431640a423a4c44a078b11f67f9c47e'),('b670872c2d144485be38bb53e6317df2','添加部门成员','/s/addMember.action','290c49508d5242a995eef8697258866e'),('b70d9ab8d4f94066bc602fc5d8de13c5','添加经营单位','/s/saveManageUnit.action','93af34d839e24e59943724ad6f568e3c'),('b8e9a9ea5aea480fa6ca5d6cf6819bc5','协助者更新协助结果','/s/updateCustomerAssistResult.action','3890b7d139cf4ed6a23bc8800a62b8a8'),('b9c20f29ae8c460d879d118fc0484af1','获取当前在任职位的总人数','/s/countPositionMember.action','290c49508d5242a995eef8697258866e'),('bb0e57ebf6ab49a28c0d64d6eb87403e','增加二级库存','/s/updateRepertoryAddSecond.action','cdcdefebac994aed81a9d07f30255c43'),('bb6d3dacaf564319b4a48bb8ca1f57b5','获取销售点列表','/s/listBranch.action','6d378d07a74a40a4932a3116b1e05172'),('bbc60c2218f343399ebe4643dde4e1c4','申请客户建账','/s/saveCustomerAccount.action','c86cb881c60b46e0bbcaff33e6759324'),('bd5a86235b164c079482dd3788e3e618','根据订单号获取订单列表','/s/listFinanceOrderByOrderNumber.action','a9a3ef3eece0484b9c30f49703780c09'),('be864d411c3c40db8af7b237327afab3','添加客户跟进','/s/saveCustomerFollow.action','f204db18f3b04239b9f59936e558bdaa'),('c0a782a179fc430fb621464587014c01','筛选订单','/s/listFinanceOrderSelective.action','a9a3ef3eece0484b9c30f49703780c09'),('c292f78dc5e14ef49e908318e1c0ff16','搜索商品','/s/findGoodsListByKeyword.action','8499740c4d72458ebf7dd159369ea12a'),('c39c8ae939e341929fb186f309ab1bda','获取销售点列表','/s/listBranch.action','5eade54e69aa4d809917eb2024f1bd19'),('c6e68494eb1c4e71abbd441e18ed7c4d','团队-团队','','0'),('c725f983360c49bcb6eab24872be905e','获取部门下的成员列表','/s/findMemberList.action','180a88d962b5473688557fc6c31f6a5b'),('c86cb881c60b46e0bbcaff33e6759324','客户-客户建账','','0'),('ca56319400c6444799b8a15a81f88d67','查找商品类目','/s/findGoodsTypeByPid.action','8499740c4d72458ebf7dd159369ea12a'),('cb5aa6ebe92c4ceb8a722ac9afde57ae','客户资源-客户资源','','0'),('cbe84fc9eee84bdf8559ca510be3970a','确认发货','/s/updateDelivered.action','e15672bda5ac4ae1bc712ce209ca35b4'),('cbeab887b9a549179c4208ee390a7e2c','获取成员的客户列表','/s/listVisitCustomer.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('cd7a6b8c1a7f4b5fade2073309a43ac2','审批人获取库存审批列表','/s/listRepertoryApplyByApprover.action','4992632ef68d4fca88b118e5a5d5f943'),('cdcdefebac994aed81a9d07f30255c43','库存-库存分配','','0'),('cf02c0af7a9b44c289bca1094da9de9c','编辑销售点','/s/updateBranch.action','6d378d07a74a40a4932a3116b1e05172'),('create_record','客户建档','/s/saveCustomerRecord.action','9431640a423a4c44a078b11f67f9c47e'),('d00ed5b5c6894542993dba803cd47ca3','同意申请','/s/updateCommonApplyAccept.action','180a88d962b5473688557fc6c31f6a5b'),('d505f9acf0594c529c08def373c3d46d','删除销售点','/s/removeBranch.action','6d378d07a74a40a4932a3116b1e05172'),('d5e3821c4dc64fc6b3d6417b79458bb6','添加销售点','/s/addBranch.action','6d378d07a74a40a4932a3116b1e05172'),('d7b7c64b8834428f84c5997b123ce472','获取客户详情','/s/getVisitCustomer.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('d816e46176734cc78a910cb747ba327a','协助者获取协助列表','/s/listCustomerAssistByHelper.action','3890b7d139cf4ed6a23bc8800a62b8a8'),('ded06cf4495141e09d56154d1f4fe7c2','申请者获取协助列表','/s/listCustomerAssistByProposer.action','3890b7d139cf4ed6a23bc8800a62b8a8'),('dfd979c8ea75436db9ed48521699bac6','获取库存申请列表','/s/listRepertoryApplyByProposer.action','4992632ef68d4fca88b118e5a5d5f943'),('e15672bda5ac4ae1bc712ce209ca35b4','商城-业务订单','','0'),('e23958cc985c420b936c691228a96014','修改农户','/s/updateFarmer.action','48ad23d3663742709b0fd02566c5bce1'),('e3ec413039f346729b69272adee8de18','查看当前销售点库存','/s/getRepertory.action','5eade54e69aa4d809917eb2024f1bd19'),('e3fb84075cb34af7b79c4bc4e9745f25','上传身份证背面照片','/s/saveBackImage.action','9431640a423a4c44a078b11f67f9c47e'),('e5bc1dea892844abbab064e710f6f661','更新跟进信息','/s/updateCustomerFollow.action','f204db18f3b04239b9f59936e558bdaa'),('e5cc2a90e0c0471e87f8c8b453718e71','申请人获取建账申请列表','/s/listCustomerAccountByProposer.action','c86cb881c60b46e0bbcaff33e6759324'),('e9a17f1561204e96a773b0b2bec38fec','获取运费模板列表(商家)','/s/listFreightTemp.action','81e21c825dbd41f3812fcad7e22b767f'),('ecec38b832394c518205ec9d713fcb4b','获取跟进列表','/s/listCustomerFollow.action','f204db18f3b04239b9f59936e558bdaa'),('f07b5a3a1675482697e13c4635d58088','获取客户列表','/s/listCustomer.action','9431640a423a4c44a078b11f67f9c47e'),('f204db18f3b04239b9f59936e558bdaa','客户-客户跟进','','0'),('f278b817feee4bafa48ec603685da8bd','修改场地','/s/updateUserPlace.action','f504a83780ee405bb2bf2846c8185b68'),('f448faef79c04aa2ba59d8621b8afd2c','获取经营单位列表','/s/listManageUnit.action','93af34d839e24e59943724ad6f568e3c'),('f504a83780ee405bb2bf2846c8185b68','客户-场地信息','','0'),('f520fda390c548ddba49850bfb323444','上传手持身份证照片','/s/saveHandImage.action','9431640a423a4c44a078b11f67f9c47e'),('f5ab4a4b9893413eb3fca5d4f07f3d16','获取客户详情','/s/getCustomer.action','9431640a423a4c44a078b11f67f9c47e'),('f5d900c6b34f4b52a5a3d38cb8b814e9','修改养殖信息（新）','/s/updateUserBreedJson.action','80a907d42ed94b208c99751ec532fb47'),('f5e4507587f84ddcbac854d7234b9088','获取部门列表','/s/listVisitDepartment.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('f8bc6c1c0b414d1688396bf04d504601','获取部门列表','/s/findDepartmentList.action','180a88d962b5473688557fc6c31f6a5b'),('f9ceed5905d64f1ea738fd132c09d006','修改养殖信息','/s/updateUserBreed.action','80a907d42ed94b208c99751ec532fb47'),('f9e1da642c334ce0883307d5d2649abf','获取养殖信息列表','/s/listVisitUserBreed.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('fa71adc229df4b0bad193db427bf4190','删除经营单位','/s/removeManageUnit.action','93af34d839e24e59943724ad6f568e3c'),('fbeb67f477d04c7bab374bc4789b3a4a','财务B轮审核不通过','/s/updateFinanceFailB.action','a9a3ef3eece0484b9c30f49703780c09'),('fbf2f0d7f79c4d13ada020d1583acb79','增加一级库存','/s/updateRepertoryAddFirst.action','cdcdefebac994aed81a9d07f30255c43'),('fd72d1bc68504736811c53bdcda300ff','上传场地证明图片','/s/uploadPlaceCertificate.action','f504a83780ee405bb2bf2846c8185b68'),('fda16981c2fd44c59d05a61711e58545','获取跟进详情','/s/getCustomerFollow.action','f204db18f3b04239b9f59936e558bdaa'),('fda6950108a14b098a652093b4482efe','获取农户列表','/s/listVisitFarmer.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('follow','跟单审核通过','/s/updateSalesmanPass.action','e15672bda5ac4ae1bc712ce209ca35b4'),('repertory_check','同意申请','/s/updateRepertoryApplyAccept.action','4992632ef68d4fca88b118e5a5d5f943');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_image`
--

DROP TABLE IF EXISTS `place_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place_image` (
  `img_id` varchar(35) NOT NULL,
  `img_type` tinyint(4) NOT NULL DEFAULT '0',
  `img_url` text,
  `user_place_id` varchar(35) NOT NULL DEFAULT '',
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_image`
--

LOCK TABLES `place_image` WRITE;
/*!40000 ALTER TABLE `place_image` DISABLE KEYS */;
INSERT INTO `place_image` VALUES ('192d4362a6554e9a9f2008ab23d110de',1,'/upload/img/user/place/\\d0828d61fae1406299deb0fa9a142b06.jpg','daab4edac0fa48d5b62f6c241f5dd590'),('1a0fb2f7ce944982a4be521d200f1279',2,'/upload/img/user/place/\\61d878e5c46d4720a84d00e0a262cf46.jpg','221f72d9b8ab494aa38a6b3e4587e374'),('3cee73f9492842b9bea155184d1409ae',1,'/upload/img/user/place/\\ad939c4623b8464ea4fad0b9b6fca48c.jpg','daab4edac0fa48d5b62f6c241f5dd590'),('62311762a7354b2ba2b4e60166ace177',1,'/upload/img/user/place/\\7d014dfb8a20412882dfd75243652a77.jpg','daab4edac0fa48d5b62f6c241f5dd590'),('7ee13dba37994d4bad65e45e4d411b43',1,'/upload/img/user/place/\\1a17cbeec8ab4b64b3f8c83c0e36c6fa.jpg','daab4edac0fa48d5b62f6c241f5dd590'),('87f79a330a26475c8089222e41a9f0e1',2,'/upload/img/user/place/\\c8aafaefb66440478746dce2a08f7135.jpg','221f72d9b8ab494aa38a6b3e4587e374'),('8c43338bdfb942bd80725066b54d215a',1,'/upload/img/user/place/\\995504a614ea461f9023d9450ffacdcc.jpg','daab4edac0fa48d5b62f6c241f5dd590'),('9b69ca40c0ae45ebb050e78979f2bc55',2,'/upload/img/user/place/\\4e0eca51d9f84dc1b1ee91c3eac8f910.jpg','221f72d9b8ab494aa38a6b3e4587e374'),('a7d769630b15458787a4b006bdba8924',2,'/upload/img/user/place/\\752df4a981b94ff9bc301bb5127e5728.jpg','221f72d9b8ab494aa38a6b3e4587e374'),('c210c3a3b7a74f349e5e9cd0a9c7f65f',1,'/upload/img/user/place/\\3d7cfa43aa684985beefad33e36b5d5e.jpg','daab4edac0fa48d5b62f6c241f5dd590'),('d9d76ffd92dc4114b940e5d15b10af2e',2,'/upload/img/user/place/\\94847846044b4cf0b07a81618dd83bae.jpg','221f72d9b8ab494aa38a6b3e4587e374'),('e9d4423fbf324554852bcb4e0e701909',2,'/upload/img/user/place/\\5fd7f2efab41410d86bf6f1b71572554.jpg','221f72d9b8ab494aa38a6b3e4587e374'),('f5478db642fa498ab0c53490ea540ca6',1,'/upload/img/user/place/\\21b71bb30dff4f0485d97ccaa608d0cc.jpg','daab4edac0fa48d5b62f6c241f5dd590'),('fc0f459279b648438eeeefaaf1ed73cf',1,'/upload/img/user/place/\\026c8e7d4db94d71afe13fbd0ab41523.jpg','daab4edac0fa48d5b62f6c241f5dd590');
/*!40000 ALTER TABLE `place_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_permission_re`
--

DROP TABLE IF EXISTS `position_permission_re`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_permission_re` (
  `position_id` varchar(35) NOT NULL DEFAULT '',
  `qm_permission_id` varchar(35) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_permission_re`
--

LOCK TABLES `position_permission_re` WRITE;
/*!40000 ALTER TABLE `position_permission_re` DISABLE KEYS */;
INSERT INTO `position_permission_re` VALUES ('ecc6efd7b0904b2e9ca069342ade21eb','2fcb97571ccd47fb9f2c15e5a7b6494d'),('ecc6efd7b0904b2e9ca069342ade21eb','f83b0e6783c04442b557533f37fc2681'),('74e75f325887434e9fb846509ec74c32','86dea1b0066341bab34197ebc5c0b40d'),('74e75f325887434e9fb846509ec74c32','2fcb97571ccd47fb9f2c15e5a7b6494d'),('74e75f325887434e9fb846509ec74c32','f83b0e6783c04442b557533f37fc2681'),('b07d5450f6ae448b88db7dfcdf0d1dc7','a9f8a72b6b8548049569d81db3a56c36'),('b07d5450f6ae448b88db7dfcdf0d1dc7','f83b0e6783c04442b557533f37fc2681'),('6bc47243d1a24b4ca1b2ede9cedc3374','e5fef6399c204309b2c8c51d5b2643fa'),('6bc47243d1a24b4ca1b2ede9cedc3374','a9f8a72b6b8548049569d81db3a56c36'),('6bc47243d1a24b4ca1b2ede9cedc3374','f83b0e6783c04442b557533f37fc2681'),('93bb14244c9644df9eb966f257ac0795','f21e6ceb9d334c39b668887f61026e97'),('3269998df292491889173c0e00259221','5972db999d234125a0685f4f3c82d47e'),('3269998df292491889173c0e00259221','f21e6ceb9d334c39b668887f61026e97'),('2a127fcd70fd40988508dacadaa5f0d0','a9f8a72b6b8548049569d81db3a56c36');
/*!40000 ALTER TABLE `position_permission_re` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_message`
--

DROP TABLE IF EXISTS `push_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `push_message` (
  `msg_id` varchar(35) NOT NULL,
  `msg_title` varchar(100) NOT NULL,
  `msg_text` varchar(255) NOT NULL,
  `msg_ticker` varchar(100) NOT NULL,
  `msg_type` tinyint(4) NOT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_message`
--

LOCK TABLES `push_message` WRITE;
/*!40000 ALTER TABLE `push_message` DISABLE KEYS */;
INSERT INTO `push_message` VALUES ('apply_new','收到新的申请','b','t',10),('apply_pass','申请通过','b','t',10),('apply_refuse','申请被否','b','t',10),('customer_new','收到客户建账申请','b','t',30),('customer_pass','建账申请通过','b','t',30),('customer_refuse','建账申请不通过','b','t',30),('order_finance_new','财务收到新订单审核','b','t',20),('order_finance_pass','财务审核通过','b','t',20),('order_finance_refuse','财务审核不通过','b','t',20),('order_sales_new','业务收到新订单审核','b','t',20),('order_sales_pass','业务审核通过','b','t',20),('order_sales_refuse','业务审核不通过','b','t',20),('repertory_new','收到库存申请','b','t',40),('repertory_pass','库存申请通过','b','t',40),('repertory_refuse','库存申请不通过','b','t',40);
/*!40000 ALTER TABLE `push_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm_branch`
--

DROP TABLE IF EXISTS `qm_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qm_branch` (
  `branch_id` varchar(35) NOT NULL,
  `branch_name` varchar(20) NOT NULL DEFAULT '',
  `department_id` varchar(35) NOT NULL DEFAULT '',
  `my_team_id` varchar(35) NOT NULL DEFAULT '',
  `department_name` varchar(20) NOT NULL DEFAULT '',
  `user_id` varchar(35) NOT NULL DEFAULT '',
  `user_name` varchar(20) NOT NULL DEFAULT '',
  `user_phone` varchar(20) NOT NULL DEFAULT '',
  `branch_area` varchar(50) NOT NULL DEFAULT '',
  `lat_lng` varchar(30) NOT NULL DEFAULT '',
  `branch_type` tinyint(4) NOT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm_branch`
--

LOCK TABLES `qm_branch` WRITE;
/*!40000 ALTER TABLE `qm_branch` DISABLE KEYS */;
INSERT INTO `qm_branch` VALUES ('0f8ad87fcb564f358d287c39749362d4','总经办','9e8d946ef94b4795bd9218795354e631','10001','总经办','89d9317fb3834353bcf2a507bee2eb82','张三','13688888888','江门市科学馆','22.58945,113.094063',1),('9c5ef58ed0034a1c8dd885369ac3b97c','鹤山销售点','5a20e0ea32b948c08c928995b26af64e','10001','业务部','9f6bc79d769342f1b90ed0b532b870f2','李思思','13311113333','江门市科学馆','22.58945,113.094063',2);
/*!40000 ALTER TABLE `qm_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm_branch_goods`
--

DROP TABLE IF EXISTS `qm_branch_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qm_branch_goods` (
  `branch_id` varchar(35) NOT NULL DEFAULT '',
  `goods_id` varchar(35) NOT NULL DEFAULT '',
  `standard_id` varchar(35) NOT NULL,
  `standard_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm_branch_goods`
--

LOCK TABLES `qm_branch_goods` WRITE;
/*!40000 ALTER TABLE `qm_branch_goods` DISABLE KEYS */;
INSERT INTO `qm_branch_goods` VALUES ('9e8d946ef94b4795bd9218795354e631','f0c3df5bdb0a45aabf22464bb27dbb88','4e3007c4db5d483bb9245743fa5c08eb',9600),('9e8d946ef94b4795bd9218795354e631','f0c3df5bdb0a45aabf22464bb27dbb88','e0841a5ee98a410c9f1fe4a786a6d6f0',10400),('0f3965187f1d4bbf963453b7a2ae0b20','f0c3df5bdb0a45aabf22464bb27dbb88','4e3007c4db5d483bb9245743fa5c08eb',400),('0f3965187f1d4bbf963453b7a2ae0b20','f0c3df5bdb0a45aabf22464bb27dbb88','e0841a5ee98a410c9f1fe4a786a6d6f0',600),('0f8ad87fcb564f358d287c39749362d4','f0c3df5bdb0a45aabf22464bb27dbb88','4e3007c4db5d483bb9245743fa5c08eb',3000),('0f8ad87fcb564f358d287c39749362d4','f0c3df5bdb0a45aabf22464bb27dbb88','e0841a5ee98a410c9f1fe4a786a6d6f0',3000),('9c5ef58ed0034a1c8dd885369ac3b97c','bae0a50f935248cfa03a0e0cbffd2dda','8e6aabae569e44ca80db3115372aa1a4',128),('0f8ad87fcb564f358d287c39749362d4','bae0a50f935248cfa03a0e0cbffd2dda','8e6aabae569e44ca80db3115372aa1a4',502),('0f3965187f1d4bbf963453b7a2ae0b20','bae0a50f935248cfa03a0e0cbffd2dda','8e6aabae569e44ca80db3115372aa1a4',10);
/*!40000 ALTER TABLE `qm_branch_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm_experience`
--

DROP TABLE IF EXISTS `qm_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qm_experience` (
  `experience_id` varchar(35) NOT NULL,
  `company` varchar(20) NOT NULL DEFAULT '',
  `contacts` varchar(20) NOT NULL DEFAULT '',
  `phone` varchar(12) NOT NULL DEFAULT '',
  `position` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`experience_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm_experience`
--

LOCK TABLES `qm_experience` WRITE;
/*!40000 ALTER TABLE `qm_experience` DISABLE KEYS */;
INSERT INTO `qm_experience` VALUES ('21103c2536724e89a39fd16fed9c7c93','青麦科技','张三','13688888888','经理'),('d9a49a534aee42f4a101bc76979a5692','农销云','zz','13678915326','员工');
/*!40000 ALTER TABLE `qm_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm_permission`
--

DROP TABLE IF EXISTS `qm_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qm_permission` (
  `qm_permission_id` varchar(35) NOT NULL,
  `qm_permission_name` varchar(20) NOT NULL DEFAULT '',
  `qm_permission_describe` varchar(100) NOT NULL DEFAULT '',
  `qm_permission_pid` varchar(35) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '1',
  `qm_permission_type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`qm_permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm_permission`
--

LOCK TABLES `qm_permission` WRITE;
/*!40000 ALTER TABLE `qm_permission` DISABLE KEYS */;
INSERT INTO `qm_permission` VALUES ('2fcb97571ccd47fb9f2c15e5a7b6494d','业务员','','salesman',0,0),('5972db999d234125a0685f4f3c82d47e','财务主管','','finance_manager',0,0),('86dea1b0066341bab34197ebc5c0b40d','业务主管','','salesman_manager',0,0),('a9f8a72b6b8548049569d81db3a56c36','后勤人员','','logistics',0,0),('e5fef6399c204309b2c8c51d5b2643fa','后勤主管','','logistics_manager',0,0),('f21e6ceb9d334c39b668887f61026e97','财务员','','finance',0,0),('f83b0e6783c04442b557533f37fc2681','跟单员','','follower',0,0);
/*!40000 ALTER TABLE `qm_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm_permission_re`
--

DROP TABLE IF EXISTS `qm_permission_re`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qm_permission_re` (
  `permission_id` varchar(35) NOT NULL,
  `qm_permission_id` varchar(35) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm_permission_re`
--

LOCK TABLES `qm_permission_re` WRITE;
/*!40000 ALTER TABLE `qm_permission_re` DISABLE KEYS */;
INSERT INTO `qm_permission_re` VALUES ('4992632ef68d4fca88b118e5a5d5f943','e5fef6399c204309b2c8c51d5b2643fa'),('repertory_check','e5fef6399c204309b2c8c51d5b2643fa'),('cd7a6b8c1a7f4b5fade2073309a43ac2','e5fef6399c204309b2c8c51d5b2643fa'),('e15672bda5ac4ae1bc712ce209ca35b4','f83b0e6783c04442b557533f37fc2681'),('2d2b7f2c4b1b4e9dbac91dc375348ba4','f83b0e6783c04442b557533f37fc2681'),('cbe84fc9eee84bdf8559ca510be3970a','f83b0e6783c04442b557533f37fc2681'),('a7b35ea834b84ced895af372ab72e5cb','f83b0e6783c04442b557533f37fc2681'),('78b8b104904a46a0b007112f09e7a5a3','f83b0e6783c04442b557533f37fc2681'),('follow','f83b0e6783c04442b557533f37fc2681'),('14b69b41768d428cad8f466019d6d426','f83b0e6783c04442b557533f37fc2681'),('c86cb881c60b46e0bbcaff33e6759324','86dea1b0066341bab34197ebc5c0b40d'),('account_check','86dea1b0066341bab34197ebc5c0b40d'),('6b2a2dd116b14b2f8474573ad7e6c848','86dea1b0066341bab34197ebc5c0b40d'),('5ef8f0c163c64944a3b077e2d8ccfe6c','86dea1b0066341bab34197ebc5c0b40d'),('9431640a423a4c44a078b11f67f9c47e','2fcb97571ccd47fb9f2c15e5a7b6494d'),('7590e3fa637f4314aa100fdd05c757cf','2fcb97571ccd47fb9f2c15e5a7b6494d'),('create_record','2fcb97571ccd47fb9f2c15e5a7b6494d'),('f07b5a3a1675482697e13c4635d58088','2fcb97571ccd47fb9f2c15e5a7b6494d'),('f5ab4a4b9893413eb3fca5d4f07f3d16','2fcb97571ccd47fb9f2c15e5a7b6494d');
/*!40000 ALTER TABLE `qm_permission_re` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm_permission_type`
--

DROP TABLE IF EXISTS `qm_permission_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qm_permission_type` (
  `qm_permission_type_id` varchar(35) NOT NULL,
  `qm_permission_type_name` varchar(35) NOT NULL DEFAULT '',
  PRIMARY KEY (`qm_permission_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm_permission_type`
--

LOCK TABLES `qm_permission_type` WRITE;
/*!40000 ALTER TABLE `qm_permission_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm_permission_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `qm_permission_view`
--

DROP TABLE IF EXISTS `qm_permission_view`;
/*!50001 DROP VIEW IF EXISTS `qm_permission_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `qm_permission_view` AS SELECT 
 1 AS `user_id`,
 1 AS `user_name`,
 1 AS `my_team_id`,
 1 AS `qm_permission_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `repertory_apply`
--

DROP TABLE IF EXISTS `repertory_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repertory_apply` (
  `apply_id` varchar(35) NOT NULL,
  `branch_id` varchar(35) NOT NULL,
  `my_team_id` varchar(35) NOT NULL,
  `branch_name` varchar(35) NOT NULL,
  `create_date` datetime NOT NULL,
  `accept_date` datetime DEFAULT NULL,
  `proposer_id` varchar(35) NOT NULL,
  `proposer_name` varchar(20) NOT NULL,
  `approver_id` varchar(35) DEFAULT NULL,
  `approver_name` varchar(20) NOT NULL,
  `apply_status` tinyint(4) NOT NULL,
  `apply_remark` varchar(255) NOT NULL,
  `apply_code` varchar(35) NOT NULL,
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repertory_apply`
--

LOCK TABLES `repertory_apply` WRITE;
/*!40000 ALTER TABLE `repertory_apply` DISABLE KEYS */;
INSERT INTO `repertory_apply` VALUES ('6f2688117af64bff81edd3994314c225','0f3965187f1d4bbf963453b7a2ae0b20','10001','鹤山销售点','2017-10-21 14:40:26','2017-10-21 14:55:23','9f6bc79d769342f1b90ed0b532b870f2','李思思','5a27d0f892cd48a482622f8b76fd239c','王舞欣',12,'备注','201710214126');
/*!40000 ALTER TABLE `repertory_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repertory_apply_list`
--

DROP TABLE IF EXISTS `repertory_apply_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repertory_apply_list` (
  `apply_id` varchar(35) NOT NULL,
  `goods_id` varchar(35) NOT NULL,
  `goods_name` varchar(60) NOT NULL,
  `standard_id` varchar(35) NOT NULL,
  `standard_name` varchar(20) NOT NULL,
  `standard_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repertory_apply_list`
--

LOCK TABLES `repertory_apply_list` WRITE;
/*!40000 ALTER TABLE `repertory_apply_list` DISABLE KEYS */;
INSERT INTO `repertory_apply_list` VALUES ('6f2688117af64bff81edd3994314c225','bae0a50f935248cfa03a0e0cbffd2dda','【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋','8e6aabae569e44ca80db3115372aa1a4','100g/袋',10);
/*!40000 ALTER TABLE `repertory_apply_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repertory_income`
--

DROP TABLE IF EXISTS `repertory_income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repertory_income` (
  `record_id` varchar(35) NOT NULL,
  `record_code` varchar(35) NOT NULL,
  `my_team_id` varchar(35) NOT NULL,
  `branch_id` varchar(35) NOT NULL,
  `branch_name` varchar(35) NOT NULL,
  `operator_id` varchar(35) NOT NULL,
  `operator_name` varchar(20) NOT NULL,
  `create_date` datetime NOT NULL,
  `record_remark` varchar(255) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repertory_income`
--

LOCK TABLES `repertory_income` WRITE;
/*!40000 ALTER TABLE `repertory_income` DISABLE KEYS */;
INSERT INTO `repertory_income` VALUES ('d99e5e828ef142a39feda16a724c3119','201710218860','10001','0f8ad87fcb564f358d287c39749362d4','总经办','5a27d0f892cd48a482622f8b76fd239c','王舞欣','2017-10-21 15:11:11','');
/*!40000 ALTER TABLE `repertory_income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repertory_income_list`
--

DROP TABLE IF EXISTS `repertory_income_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repertory_income_list` (
  `record_id` varchar(35) NOT NULL,
  `goods_id` varchar(35) NOT NULL,
  `goods_name` varchar(60) NOT NULL,
  `standard_id` varchar(35) NOT NULL,
  `standard_name` varchar(20) NOT NULL,
  `standard_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repertory_income_list`
--

LOCK TABLES `repertory_income_list` WRITE;
/*!40000 ALTER TABLE `repertory_income_list` DISABLE KEYS */;
INSERT INTO `repertory_income_list` VALUES ('d99e5e828ef142a39feda16a724c3119','bae0a50f935248cfa03a0e0cbffd2dda','【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋','8e6aabae569e44ca80db3115372aa1a4','100g/袋',256);
/*!40000 ALTER TABLE `repertory_income_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repertory_record`
--

DROP TABLE IF EXISTS `repertory_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repertory_record` (
  `record_id` varchar(35) NOT NULL,
  `record_code` varchar(35) NOT NULL,
  `my_team_id` varchar(35) NOT NULL,
  `branch_id` varchar(35) NOT NULL,
  `branch_name` varchar(35) NOT NULL,
  `operator_id` varchar(35) NOT NULL,
  `operator_name` varchar(20) NOT NULL,
  `create_date` datetime NOT NULL,
  `record_remark` varchar(255) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repertory_record`
--

LOCK TABLES `repertory_record` WRITE;
/*!40000 ALTER TABLE `repertory_record` DISABLE KEYS */;
INSERT INTO `repertory_record` VALUES ('1044c4a90b5e4c76b59fe2770212a849','201710111915','10001','f9797f0b4ecc4808b1d93dca667ea175','江门销售点','89d9317fb3834353bcf2a507bee2eb82','张三','2017-10-11 08:59:03',''),('8cc618af34f24beaa2bcfd28a1862460','201710119708','10001','0f8ad87fcb564f358d287c39749362d4','总经办','89d9317fb3834353bcf2a507bee2eb82','张三','2017-10-11 09:50:59',''),('d587612e94374da68152d7eeae64be0d','201710212551','10001','0f8ad87fcb564f358d287c39749362d4','总经办','89d9317fb3834353bcf2a507bee2eb82','张三','2017-10-21 11:50:18','');
/*!40000 ALTER TABLE `repertory_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repertory_record_list`
--

DROP TABLE IF EXISTS `repertory_record_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repertory_record_list` (
  `record_id` varchar(35) NOT NULL,
  `record_type` tinyint(4) NOT NULL,
  `record_reason` varchar(20) NOT NULL,
  `goods_id` varchar(35) NOT NULL,
  `goods_name` varchar(60) NOT NULL,
  `standard_id` varchar(35) NOT NULL,
  `standard_name` varchar(20) NOT NULL,
  `standard_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repertory_record_list`
--

LOCK TABLES `repertory_record_list` WRITE;
/*!40000 ALTER TABLE `repertory_record_list` DISABLE KEYS */;
INSERT INTO `repertory_record_list` VALUES ('6b4b8ea15f0d4f50bf47b10bd1741f17',1,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','4e3007c4db5d483bb9245743fa5c08eb','10kg/袋',100),('6b4b8ea15f0d4f50bf47b10bd1741f17',1,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','e0841a5ee98a410c9f1fe4a786a6d6f0','20kg/袋',200),('44b6befcb01c4a2692a7439283931c44',1,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','4e3007c4db5d483bb9245743fa5c08eb','10kg/袋',100),('44b6befcb01c4a2692a7439283931c44',1,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','e0841a5ee98a410c9f1fe4a786a6d6f0','20kg/袋',200),('2ab7fde0b7984f1a83578a4bde08fd0f',2,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','4e3007c4db5d483bb9245743fa5c08eb','10kg/袋',100),('2ab7fde0b7984f1a83578a4bde08fd0f',1,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','e0841a5ee98a410c9f1fe4a786a6d6f0','20kg/袋',200),('1044c4a90b5e4c76b59fe2770212a849',1,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','4e3007c4db5d483bb9245743fa5c08eb','10kg/袋',100),('1044c4a90b5e4c76b59fe2770212a849',2,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','e0841a5ee98a410c9f1fe4a786a6d6f0','20kg/袋',200),('8cc618af34f24beaa2bcfd28a1862460',1,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','4e3007c4db5d483bb9245743fa5c08eb','10kg/袋',1000),('8cc618af34f24beaa2bcfd28a1862460',1,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','e0841a5ee98a410c9f1fe4a786a6d6f0','20kg/袋',2000),('d587612e94374da68152d7eeae64be0d',1,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','4e3007c4db5d483bb9245743fa5c08eb','10kg/袋',1000),('d587612e94374da68152d7eeae64be0d',1,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','e0841a5ee98a410c9f1fe4a786a6d6f0','20kg/袋',2000);
/*!40000 ALTER TABLE `repertory_record_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL DEFAULT '',
  `role_text` varchar(50) NOT NULL DEFAULT '',
  `role_create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `delete_date` date DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1001,'普通用户','没有后台权限','2017-05-17 15:46:24',0,NULL),(1002,'超级管理员','拥有所有权限','2017-05-17 15:46:24',0,NULL),(1003,'默认角色','没有权限','2017-05-17 15:46:24',0,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_address`
--

DROP TABLE IF EXISTS `shopping_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_address` (
  `user_address_id` varchar(35) NOT NULL,
  `user_id` varchar(35) NOT NULL DEFAULT '',
  `user_address_text` varchar(50) NOT NULL DEFAULT '',
  `user_address_area` varchar(50) NOT NULL DEFAULT '',
  `user_address_name` varchar(20) NOT NULL DEFAULT '',
  `user_address_phone` varchar(20) NOT NULL DEFAULT '',
  `user_address_default` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_address_id`),
  KEY `FK_address_user_RE` (`user_id`),
  CONSTRAINT `FK_address_user_RE` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_address`
--

LOCK TABLES `shopping_address` WRITE;
/*!40000 ALTER TABLE `shopping_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_cart` (
  `user_id` varchar(35) NOT NULL DEFAULT '',
  `goods_id` varchar(35) NOT NULL DEFAULT '',
  `standard_id` varchar(35) NOT NULL DEFAULT '',
  `goods_num` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES ('89d9317fb3834353bcf2a507bee2eb82','22a91981f71a43e7a8c34472bc7cc1c6','1f9b286b836c4175ab09a9b02cacbb7d',4,'2017-08-28 16:42:53'),('d88e28c3a0e6429f9f1d03ad99fabc61','f0c3df5bdb0a45aabf22464bb27dbb88','standardId',10,'2017-10-18 15:14:11');
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_breed_type`
--

DROP TABLE IF EXISTS `sys_breed_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_breed_type` (
  `type_id` varchar(35) NOT NULL,
  `type_name` varchar(20) NOT NULL,
  `select_id` varchar(35) NOT NULL DEFAULT '',
  `select_name` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_breed_type`
--

LOCK TABLES `sys_breed_type` WRITE;
/*!40000 ALTER TABLE `sys_breed_type` DISABLE KEYS */;
INSERT INTO `sys_breed_type` VALUES ('16241d03373a4842bf292eb3c4bffd83','养殖品种','8f3b8f7239874d98849a2ade075a8b31','猪'),('191a2e15d08e4cb586f0d282f77ffc14','养殖类型','47ad9cdf9a5a45c9b0c984544a7b238f','内三元'),('65053460a17a450f91b8c26b3ae3e751','养殖类目','','');
/*!40000 ALTER TABLE `sys_breed_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_breed_type_info`
--

DROP TABLE IF EXISTS `sys_breed_type_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_breed_type_info` (
  `info_id` varchar(35) NOT NULL,
  `info_name` varchar(20) NOT NULL,
  `info_type` varchar(35) NOT NULL,
  `select_id` varchar(35) NOT NULL DEFAULT '',
  `select_name` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_breed_type_info`
--

LOCK TABLES `sys_breed_type_info` WRITE;
/*!40000 ALTER TABLE `sys_breed_type_info` DISABLE KEYS */;
INSERT INTO `sys_breed_type_info` VALUES ('26332909988545ed803b11eb7ebf062f','公体数量','text','76b0bdb9dfb74d1ca0e6c8021b33647a','商品养殖'),('85856526c78345009300d9f1eb5c7246','母体数量','text','76b0bdb9dfb74d1ca0e6c8021b33647a','商品养殖');
/*!40000 ALTER TABLE `sys_breed_type_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_breed_type_select`
--

DROP TABLE IF EXISTS `sys_breed_type_select`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_breed_type_select` (
  `select_id` varchar(35) NOT NULL,
  `select_name` varchar(20) NOT NULL,
  `type_id` varchar(35) NOT NULL,
  `type_name` varchar(20) NOT NULL,
  PRIMARY KEY (`select_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_breed_type_select`
--

LOCK TABLES `sys_breed_type_select` WRITE;
/*!40000 ALTER TABLE `sys_breed_type_select` DISABLE KEYS */;
INSERT INTO `sys_breed_type_select` VALUES ('3c08620d09ba4205899991303f2f5803','鱼','65053460a17a450f91b8c26b3ae3e751','养殖类目'),('47ad9cdf9a5a45c9b0c984544a7b238f','内三元','16241d03373a4842bf292eb3c4bffd83','养殖品种'),('5df461683de641bcab4d5ab7ad016741','虾','65053460a17a450f91b8c26b3ae3e751','养殖类目'),('76b0bdb9dfb74d1ca0e6c8021b33647a','商品养殖','191a2e15d08e4cb586f0d282f77ffc14','养殖类型'),('7c9d4b090f5445818a80c3c230341f5c','种苗繁殖','191a2e15d08e4cb586f0d282f77ffc14','养殖类型'),('8f3b8f7239874d98849a2ade075a8b31','猪','65053460a17a450f91b8c26b3ae3e751','养殖类目'),('a46902a969bc4317a4b946b0d10e2c27','自繁自养','191a2e15d08e4cb586f0d282f77ffc14','养殖类型'),('adbdfbe4949840368588dcf55a63e679','外三元','16241d03373a4842bf292eb3c4bffd83','养殖品种');
/*!40000 ALTER TABLE `sys_breed_type_select` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_customer`
--

DROP TABLE IF EXISTS `sys_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_customer` (
  `customer_id` varchar(35) NOT NULL,
  `customer_sex` varchar(5) NOT NULL DEFAULT '',
  `customer_name` varchar(20) NOT NULL DEFAULT '',
  `customer_phone` varchar(20) NOT NULL DEFAULT '',
  `customer_identity` varchar(18) NOT NULL DEFAULT '',
  `team_id` varchar(35) NOT NULL DEFAULT '',
  `team_name` varchar(20) NOT NULL DEFAULT '',
  `team_create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `team_area` varchar(50) NOT NULL DEFAULT '',
  `team_address` varchar(50) NOT NULL DEFAULT '',
  `department_id` varchar(35) NOT NULL,
  `department_name` varchar(20) NOT NULL,
  `department_type` varchar(20) NOT NULL,
  `position_id` varchar(35) NOT NULL,
  `position_name` varchar(10) NOT NULL,
  `user_id` varchar(35) NOT NULL,
  `had_account` tinyint(4) NOT NULL,
  `role_id` int(11) NOT NULL,
  `lat_lng` varchar(30) NOT NULL,
  `branch_type` tinyint(4) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_customer`
--

LOCK TABLES `sys_customer` WRITE;
/*!40000 ALTER TABLE `sys_customer` DISABLE KEYS */;
INSERT INTO `sys_customer` VALUES ('ba5482eb62b74bdb9db459acc4994656','女','芳芳','13355667788','313','10000','中国电信','2017-09-20 00:00:00','华美洗车','广东省江门市鹤山市鹤山汽车总站','92da6064f89047cb84406c8859fc407d','总经办','manager','46f4d1bb405c4d95bffcf115c1a79e02','负责人','5198012fab4d45be806393acaded43ae',1,1002,'22.755718,112.970431',1),('ed171aa03273455782765cc88c035d18','男','张三','13688888888','000000000000000000','10001','青麦科技','2017-10-10 00:00:00','鹤山市文化路181号','广东省江门市鹤山市楼冲村委会','9e8d946ef94b4795bd9218795354e631','总经办','manager','67c9a3c744e84905b125707785354396','负责人','5198012fab4d45be806393acaded43ae',1,1002,'22.770089,112.983026',1);
/*!40000 ALTER TABLE `sys_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_customer_account`
--

DROP TABLE IF EXISTS `sys_customer_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_customer_account` (
  `account_id` varchar(35) NOT NULL,
  `account_status` tinyint(4) NOT NULL,
  `user_id` varchar(35) NOT NULL,
  `user_name` varchar(35) NOT NULL,
  `customer_id` varchar(35) NOT NULL,
  `customer_name` varchar(35) NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_customer_account`
--

LOCK TABLES `sys_customer_account` WRITE;
/*!40000 ALTER TABLE `sys_customer_account` DISABLE KEYS */;
INSERT INTO `sys_customer_account` VALUES ('1c3d2e36ebf84a17a95d915df4eac7ae',12,'5198012fab4d45be806393acaded43ae','五五','ed3820d0e989469a88b9b7f36ed1d7e8','五五'),('330d4d2b8e0e4554b850bfc001dd9a51',11,'5198012fab4d45be806393acaded43ae','五五','ed171aa03273455782765cc88c035d18','张三'),('35ea769ed4e943a09d1957059ae6b946',12,'5198012fab4d45be806393acaded43ae','五五','f027d5c2750648779483b0b1d8389d5c','六六'),('5fdd009c4c854f709d7643cc892574dc',12,'5198012fab4d45be806393acaded43ae','五五','ed3820d0e989469a88b9b7f36ed1d7e8','五五'),('73b74dbb2efb4fc6983a7237baee3f90',11,'5198012fab4d45be806393acaded43ae','花花','9a5fcadc7fc643bb8e181598a2fd2833','五五'),('7e040e1de5c54d5ebc7c9c776570e282',12,'5198012fab4d45be806393acaded43ae','五五','ed3820d0e989469a88b9b7f36ed1d7e8','五五'),('80728f47af1e40c9948d5bc40c462c64',12,'5198012fab4d45be806393acaded43ae','五五','ed3820d0e989469a88b9b7f36ed1d7e8','五五'),('a0f7c2b189ce46e6ab097e9faafb25f9',11,'5198012fab4d45be806393acaded43ae','五五','ba5482eb62b74bdb9db459acc4994656','芳芳'),('a1b808ce03d54ad09fcf41207fb5f074',12,'5198012fab4d45be806393acaded43ae','五五','f027d5c2750648779483b0b1d8389d5c','六六'),('c2437b3f240f425dacc728bdb57195e9',12,'5198012fab4d45be806393acaded43ae','五五','ed3820d0e989469a88b9b7f36ed1d7e8','五五'),('db27c07994f94deab879e17db586de94',12,'5198012fab4d45be806393acaded43ae','五五','ed3820d0e989469a88b9b7f36ed1d7e8','五五'),('dec85fda13fe4e568fa457423a823e0d',11,'5198012fab4d45be806393acaded43ae','五五','f027d5c2750648779483b0b1d8389d5c','六六'),('f089b99cefc24c2abe742941ff14d335',11,'5198012fab4d45be806393acaded43ae','五五','ed171aa03273455782765cc88c035d18','张三'),('f14887a6e5804024b57c6d497ddabcc5',12,'5198012fab4d45be806393acaded43ae','五五','f027d5c2750648779483b0b1d8389d5c','六六'),('ff4f0dff098a42f4983cd594c2faed6a',12,'5198012fab4d45be806393acaded43ae','五五','f027d5c2750648779483b0b1d8389d5c','六六');
/*!40000 ALTER TABLE `sys_customer_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission`
--

DROP TABLE IF EXISTS `sys_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_permission` (
  `permission_id` varchar(35) NOT NULL,
  `permission_name` varchar(20) NOT NULL,
  `permission_url` varchar(255) NOT NULL DEFAULT '',
  `permission_text` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permission`
--

LOCK TABLES `sys_permission` WRITE;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;
INSERT INTO `sys_permission` VALUES ('044bad83cb2f46ed8f0ee8d4cbb974a8','获取接口分类列表(树形结构)','/interface/type/tree.action','获取接口分类列表(树形结构)'),('04524cd9bb014ad2a5ac2488df842f26','获取用户列表','/user/list.action','获取管理系统用户列表'),('04bb46e5de5e4bd1b7e46650b3fd3c4a','修改用户','/user/update.action','修改管理系统用户'),('09dba6832eda4dca9a07952f0891a834','添加类目信息','/breed/info/save.action','添加类目信息'),('0b4bb4ec8d1f4d23b4cb2b286966b667','修改青麦权限','/qm/permission/update.action','修改青麦权限'),('0ede55e3b2d148e186b09f5419efe0e8','添加权限','/permission/save.action','添加权限'),('0f22a5546a794b998d42b1e994c92101','添加商品类目','/goods/type/save.action','添加商品类目'),('0ff252aca946493d817259a0af9f81e2','删除接口分类','/interface/type/remove.action','删除接口分类'),('10bcdfb847fa4592a36766400c0e059c','获取类目选项详情','/breed/select/get.action','获取类目选项详情'),('13de6d6db252417f8270467485c535f8','获取角色详情','/role/get.action','获取角色详情'),('151c37db08994e17aeba2a4352de7331','添加类目选项','/breed/select/save.action','添加类目选项'),('1eddcf39eb1d40d6a5d15e768aba15bb','获取青麦权限列表(树形结构)','/qm/permission/tree.action','获取青麦权限列表(树形结构)'),('210a54b2904e4288b9c0e09fc37a8c53','删除接口','/interface/remove.action','删除接口'),('2136a7b67d4444b8b971af61c3f8dbb7','拒绝建账申请','/customer/account/updateRefuse.action','拒绝建账申请'),('21d758848934417098f06712f4576962','分配用户角色','/user/updateRole.action','为管理系统用户分配角色'),('277bac6e1e694749a0de6f94cda592ee','获取商品类目列表','/goods/type/list.action','获取商品类目列表'),('278d36a20f86418f83ff10ecb936c842','获取青麦权限详情','/qm/permission/get.action','获取青麦权限详情'),('2bd2494fa32d4e13a354999caf95b7c9','获取商品类目详情','/goods/type/get.action','获取商品类目详情'),('2d31649e17534dbd8137a9816dfee898','添加接口','/interface/save.action','添加接口'),('2ea5d11f82fb4acc93984c03c43771ac','获取青麦角色详情','/qm/role/get.action','获取青麦角色详情'),('3545d403b9fa49eeb96daddaf6893d53','获取用户详情','/user/get.action','获取管理系统用户详情'),('36134642493444f2b0e9688d77120957','添加养殖类目','/breed/save.action','添加养殖类目'),('3c7d7535d81544cf90daf2e04a625330','修改角色','/role/update.action','修改角色'),('3cd516b590f44486afa0548a711a3eff','修改客户','/customer/update.action','修改客户'),('3d6857b2144d48ebaf2f9da9983502f1','获取养殖类目列表','/breed/list.action','获取养殖类目列表'),('403a0055ac324b8cafe6dc163c4d3562','获取接口列表(树形结构)','/interface/tree.action','获取接口列表(树形结构)'),('41a347632e6040ea9e63fc403356d1b9','修改养殖类目','/breed/update.action','修改养殖类目'),('44c9a70bf90048368f6c3488f5e9328f','删除客户','/customer/remove.action','删除客户'),('47f1899e2b1c43b3873e2db979491467','添加青麦角色','/qm/role/save.action','添加青麦角色'),('540fece018e04e23ad9963f5e8a23aa8','修改权限','/permission/update.action','修改权限'),('5e88a0848713449fa3997081ba814093','获取类目选项列表','/breed/select/list.action','获取类目选项列表'),('6a1336ac0c5b48e7b1076b931935d774','添加客户','/customer/save.action','添加客户'),('6c5715c8d8e94ee2a295147e92c91b54','修改密码','/password/update.action','修改当前用户密码'),('715ecfda0de74adf941b58f58eaf832f','删除用户','/user/remove.action','删除管理系统用户'),('7506f51b41f84328919da28fb0fa4a4f','获取类目信息列表','/breed/info/list.action','获取类目信息列表'),('7642bccc89104053acec00b62d4bb096','修改类目选项','/breed/select/update.action','修改类目选项'),('798a71a5729841f4a5b40b8187868df3','添加青麦权限','/qm/permission/save.action','添加青麦权限'),('803249bf57924ae6b784b1a758e5c765','获取客户详情','/customer/get.action','获取客户详情'),('886c3a890fd94afd87fd9b690100a5be','添加用户','/user/save.action','添加管理系统用户'),('90452e97a07e4ed6a6a2d8df9505efd1','获取客户列表','/customer/list.action','获取客户列表'),('9b05e2cac7bd495ebd578e43b1b384c9','同意建账申请','/customer/account/updateAccept.action','同意建账申请'),('9e90f2deb652440ca2ec4333bdcc004a','获取青麦角色列表','/qm/role/list.action','获取青麦角色列表'),('a43291ff2a434a0b96f4fdc8115d167c','修改接口','/interface/update.action','修改接口'),('a565948333dd43fabb115496a43b9c63','删除青麦角色','/qm/role/remove.action','删除青麦角色'),('a5749f039cdd4476aab367d5bd596db3','删除类目选项','/breed/select/remove.action','删除类目选项'),('a64499ca1a5c4504acb5bc46e39ef4c4','修改接口分类','/interface/type/update.action','修改接口分类'),('a6898173858242e18b339c08ad992a3e','发起建账申请','/customer/account/save.action','发起建账申请'),('aab8329b4413492aa886323b16dbff9d','申请人获取建账申请列表','/customer/account/listByProposer.action','申请人获取建账申请列表'),('ab4b5469c96c4175a84be1820dfc6810','为角色分配权限','/role/updatePermission.action','为角色分配权限'),('aea0e457dba5454d8329a2e74d95f9cd','删除商品类目','/goods/type/remove.action','删除商品类目'),('b428a4563f234a5fbb1e546b16e481c8','获取角色列表','/role/list.action','获取角色列表'),('bc7c10d04e6b405cb20b1cdd8329f012','修改商品类目','/goods/type/update.action','修改商品类目'),('bcf583cf00354675ac746bb3d7f7941e','审批人获取建账申请列表','/customer/account/listByApprove.action','审批人获取建账申请列表'),('c144e6c34274474ab6cd220b46ef57a5','删除角色','/role/remove.action','删除角色'),('c3f4d51ab8274a66bcc6859c4bf65467','获取接口信息','/interface/get.action','获取接口信息'),('d4ed8ffd0194493cb3e1c49068e1eb0f','为青麦角色分配权限','/qm/role/updatePermission.action','为青麦角色分配权限'),('d61edaa550b44f3b87a4951d1b27c571','添加接口分类','/interface/type/save.action','添加接口分类'),('dd746f116bf14d578ae316b191c10155','删除权限','/permission/remove.action','删除权限'),('df66c381adc948b18d4a17776917585a','获取养殖类目详情','/breed/get.action','获取养殖类目详情'),('e68e8531cc5f4c8fb6d2fb2e5df01d16','获取类目信息详情','/breed/info/get.action','获取类目信息详情'),('eaa70bbc95464dc2b58217989559bf6c','删除养殖类目','/breed/remove.action','删除养殖类目'),('eb6d52bebc0340f6aa3812b3179a0b52','删除青麦权限','/qm/permission/remove.action','删除青麦权限'),('ebfad1d662f34157bdae30bfa2ba711a','获取商品类目列表(树形结构)','/goods/type/tree.action','获取商品类目列表(树形结构)'),('ec7fd292e2184537b93982d09fc60f95','获取权限详情','/permission/get.action','获取权限详情'),('f0141be7c4ab49cb89cd36476b67e59c','获取权限列表','/permission/list.action','获取权限列表'),('f52f610ab0ea42979d891822b47cf9a5','修改青麦角色','/qm/role/update.action','修改青麦角色'),('f5d8cc6501124f5db96430de86a9bf58','修改类目信息','/breed/info/update.action','修改类目信息'),('f620697b12354014a0de6014be601381','添加角色','/role/save.action','添加角色'),('f6a0e211c2184a088995ec1a6c0be9f4','获取青麦权限列表','/qm/permission/list.action','获取青麦权限列表'),('f73794cf8413437c935b36c33de7a67c','获取接口更新列表','/interface/log/list.action','获取接口更新列表'),('f8fb9d12ba8d4b3c974fd468c8b293f1','删除类目信息','/breed/info/remove.action','删除类目信息');
/*!40000 ALTER TABLE `sys_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` varchar(35) NOT NULL,
  `role_name` varchar(20) NOT NULL,
  `role_text` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('20559d8161f04e9891923110e13b432b','前端开发','拥有查看接口的权限'),('b03407084ffe4f05b04d80992e5a7362','游客','没有任何权限'),('super','超级管理员','拥有所有权限');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_permission_re`
--

DROP TABLE IF EXISTS `sys_role_permission_re`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_permission_re` (
  `role_id` varchar(35) NOT NULL,
  `permission_id` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_permission_re`
--

LOCK TABLES `sys_role_permission_re` WRITE;
/*!40000 ALTER TABLE `sys_role_permission_re` DISABLE KEYS */;
INSERT INTO `sys_role_permission_re` VALUES ('b03407084ffe4f05b04d80992e5a7362','8821044b28b040e5972167e53704da9e'),('super','df66c381adc948b18d4a17776917585a'),('super','e68e8531cc5f4c8fb6d2fb2e5df01d16'),('super','7506f51b41f84328919da28fb0fa4a4f'),('super','f8fb9d12ba8d4b3c974fd468c8b293f1'),('super','09dba6832eda4dca9a07952f0891a834'),('super','f5d8cc6501124f5db96430de86a9bf58'),('super','3d6857b2144d48ebaf2f9da9983502f1'),('super','eaa70bbc95464dc2b58217989559bf6c'),('super','36134642493444f2b0e9688d77120957'),('super','10bcdfb847fa4592a36766400c0e059c'),('super','5e88a0848713449fa3997081ba814093'),('super','a5749f039cdd4476aab367d5bd596db3'),('super','151c37db08994e17aeba2a4352de7331'),('super','7642bccc89104053acec00b62d4bb096'),('super','41a347632e6040ea9e63fc403356d1b9'),('super','bcf583cf00354675ac746bb3d7f7941e'),('super','aab8329b4413492aa886323b16dbff9d'),('super','a6898173858242e18b339c08ad992a3e'),('super','9b05e2cac7bd495ebd578e43b1b384c9'),('super','2136a7b67d4444b8b971af61c3f8dbb7'),('super','803249bf57924ae6b784b1a758e5c765'),('super','90452e97a07e4ed6a6a2d8df9505efd1'),('super','44c9a70bf90048368f6c3488f5e9328f'),('super','6a1336ac0c5b48e7b1076b931935d774'),('super','3cd516b590f44486afa0548a711a3eff'),('super','2bd2494fa32d4e13a354999caf95b7c9'),('super','277bac6e1e694749a0de6f94cda592ee'),('super','aea0e457dba5454d8329a2e74d95f9cd'),('super','0f22a5546a794b998d42b1e994c92101'),('super','ebfad1d662f34157bdae30bfa2ba711a'),('super','bc7c10d04e6b405cb20b1cdd8329f012'),('super','c3f4d51ab8274a66bcc6859c4bf65467'),('super','f73794cf8413437c935b36c33de7a67c'),('super','210a54b2904e4288b9c0e09fc37a8c53'),('super','2d31649e17534dbd8137a9816dfee898'),('super','403a0055ac324b8cafe6dc163c4d3562'),('super','0ff252aca946493d817259a0af9f81e2'),('super','d61edaa550b44f3b87a4951d1b27c571'),('super','044bad83cb2f46ed8f0ee8d4cbb974a8'),('super','a64499ca1a5c4504acb5bc46e39ef4c4'),('super','a43291ff2a434a0b96f4fdc8115d167c'),('super','6c5715c8d8e94ee2a295147e92c91b54'),('super','ec7fd292e2184537b93982d09fc60f95'),('super','f0141be7c4ab49cb89cd36476b67e59c'),('super','dd746f116bf14d578ae316b191c10155'),('super','0ede55e3b2d148e186b09f5419efe0e8'),('super','540fece018e04e23ad9963f5e8a23aa8'),('super','278d36a20f86418f83ff10ecb936c842'),('super','f6a0e211c2184a088995ec1a6c0be9f4'),('super','eb6d52bebc0340f6aa3812b3179a0b52'),('super','798a71a5729841f4a5b40b8187868df3'),('super','1eddcf39eb1d40d6a5d15e768aba15bb'),('super','0b4bb4ec8d1f4d23b4cb2b286966b667'),('super','2ea5d11f82fb4acc93984c03c43771ac'),('super','9e90f2deb652440ca2ec4333bdcc004a'),('super','a565948333dd43fabb115496a43b9c63'),('super','47f1899e2b1c43b3873e2db979491467'),('super','f52f610ab0ea42979d891822b47cf9a5'),('super','d4ed8ffd0194493cb3e1c49068e1eb0f'),('super','13de6d6db252417f8270467485c535f8'),('super','b428a4563f234a5fbb1e546b16e481c8'),('super','c144e6c34274474ab6cd220b46ef57a5'),('super','f620697b12354014a0de6014be601381'),('super','3c7d7535d81544cf90daf2e04a625330'),('super','ab4b5469c96c4175a84be1820dfc6810'),('super','3545d403b9fa49eeb96daddaf6893d53'),('super','04524cd9bb014ad2a5ac2488df842f26'),('super','715ecfda0de74adf941b58f58eaf832f'),('super','886c3a890fd94afd87fd9b690100a5be'),('super','04bb46e5de5e4bd1b7e46650b3fd3c4a'),('super','21d758848934417098f06712f4576962'),('20559d8161f04e9891923110e13b432b','c3f4d51ab8274a66bcc6859c4bf65467'),('20559d8161f04e9891923110e13b432b','f73794cf8413437c935b36c33de7a67c'),('20559d8161f04e9891923110e13b432b','403a0055ac324b8cafe6dc163c4d3562'),('20559d8161f04e9891923110e13b432b','044bad83cb2f46ed8f0ee8d4cbb974a8');
/*!40000 ALTER TABLE `sys_role_permission_re` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` varchar(35) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_password` varchar(32) DEFAULT NULL,
  `user_phone` varchar(20) NOT NULL,
  `token` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('11188c31581248d38276abb32fadc026','程序猿','028e3d0cd6cfd733ef80f9add34e39a8','13767899876','744aa63bb5564505835b38861a84868a1508548812273'),('5198012fab4d45be806393acaded43ae','五五','028e3d0cd6cfd733ef80f9add34e39a8','13677889900','7fe99fc8a21945d99bbcbb5a82f325311505357479166'),('69d7651031804f25bafb71b7d0d67562','三三','028e3d0cd6cfd733ef80f9add34e39a8','13733336666','676595dbfd0c494e855dd82a2358b6ff1505360551486');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role_re`
--

DROP TABLE IF EXISTS `sys_user_role_re`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role_re` (
  `role_id` varchar(35) NOT NULL,
  `user_id` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role_re`
--

LOCK TABLES `sys_user_role_re` WRITE;
/*!40000 ALTER TABLE `sys_user_role_re` DISABLE KEYS */;
INSERT INTO `sys_user_role_re` VALUES ('b03407084ffe4f05b04d80992e5a7362','69d7651031804f25bafb71b7d0d67562'),('super','5198012fab4d45be806393acaded43ae'),('20559d8161f04e9891923110e13b432b','11188c31581248d38276abb32fadc026');
/*!40000 ALTER TABLE `sys_user_role_re` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_department`
--

DROP TABLE IF EXISTS `team_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_department` (
  `team_department_id` varchar(35) NOT NULL,
  `team_department_name` varchar(20) NOT NULL DEFAULT '',
  `department_type` varchar(20) NOT NULL DEFAULT '',
  `department_text` text,
  `department_pid` varchar(35) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `my_team_id` varchar(35) NOT NULL DEFAULT '',
  PRIMARY KEY (`team_department_id`),
  KEY `FK_team_department_re` (`my_team_id`),
  CONSTRAINT `FK_team_department_re` FOREIGN KEY (`my_team_id`) REFERENCES `my_team` (`my_team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_department`
--

LOCK TABLES `team_department` WRITE;
/*!40000 ALTER TABLE `team_department` DISABLE KEYS */;
INSERT INTO `team_department` VALUES ('4bc0ec2d68a444e7a584b9f8d03cbc44','后勤部','',NULL,'0','2017-10-10 00:00:00','10001'),('5a20e0ea32b948c08c928995b26af64e','业务部','',NULL,'0','2017-10-04 00:00:00','10001'),('9e8d946ef94b4795bd9218795354e631','总经办','manager',NULL,'0','2017-10-10 09:36:10','10001'),('dc89587b44ff4652b44f81da12589175','财务部','',NULL,'0','2017-10-10 00:00:00','10001'),('e6ab7ff31bc641749b458c59ac8204ac','测试部','',NULL,'0','2017-12-12 00:00:00','10001');
/*!40000 ALTER TABLE `team_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` varchar(35) NOT NULL,
  `my_team_id` varchar(35) NOT NULL DEFAULT '',
  `team_department_id` varchar(35) NOT NULL DEFAULT '',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(20) NOT NULL DEFAULT '',
  `user_password` varchar(50) NOT NULL DEFAULT '',
  `user_sex` varchar(10) NOT NULL DEFAULT '',
  `user_phone` varchar(20) NOT NULL DEFAULT '',
  `user_birthday` date DEFAULT NULL,
  `user_address` varchar(50) NOT NULL DEFAULT '',
  `user_area` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_last_login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_status` varchar(10) NOT NULL DEFAULT '',
  `user_qq` varchar(20) NOT NULL DEFAULT '',
  `uesr_wechat` varchar(20) NOT NULL DEFAULT '',
  `user_img` varchar(150) NOT NULL DEFAULT '',
  `user_nickname` varchar(30) NOT NULL DEFAULT '',
  `token` varchar(50) NOT NULL DEFAULT '',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `delete_date` datetime DEFAULT NULL,
  `user_identity` varchar(18) NOT NULL DEFAULT '',
  `lng_and_lat` varchar(30) NOT NULL DEFAULT '',
  `user_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_card_front` text,
  `user_card_back` text,
  `user_card_hand` text,
  `position_id` varchar(35) NOT NULL DEFAULT '',
  `real_name` tinyint(4) NOT NULL DEFAULT '2',
  `umeng_device_token` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_phone` (`user_phone`),
  KEY `FK_user_role_re` (`role_id`),
  KEY `FK_user_team_re` (`my_team_id`),
  KEY `FK_user_department_re` (`team_department_id`),
  CONSTRAINT `FK_user_role_re` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('03ef5797bae2466699d5efc970a8962f','10001','5a20e0ea32b948c08c928995b26af64e',1003,'李四','825682eafec59c2e1632828195133a52','男','13311112222',NULL,'','','','2017-10-10 10:41:36','2017-10-10 11:06:22','u_st_2','','','','','acbb4ca124d743479f8aa68af04c91561507604181998',0,NULL,'101010101010101010','','2017-10-10 10:41:36','','',NULL,'ecc6efd7b0904b2e9ca069342ade21eb',2,''),('0420cb22c06b43a488c39967779eecec','10001','4bc0ec2d68a444e7a584b9f8d03cbc44',1003,'王五','825682eafec59c2e1632828195133a52','男','13211112222',NULL,'','','','2017-10-10 10:44:30','2017-10-10 10:44:30','u_st_2','','','','','619a3ebdb0c941958dfade8850c0600f1507604189530',0,NULL,'101010101020202020','','2017-10-10 10:44:30','','',NULL,'b07d5450f6ae448b88db7dfcdf0d1dc7',2,''),('0bb4b24df33948cfb68e61c1d5c1c75d','10001','',1001,'alisa','825682eafec59c2e1632828195133a52','女','13598765678','2017-10-23','鹤山市','','','2017-10-18 16:45:32','2017-10-19 11:59:39','u_st_2','','','','','41ca5302c6ff4e85819cbaceff1ee9e11508383995465',0,NULL,'','','2017-10-18 16:45:32','/WEB-INF/upload/img/id_card/d88e28c3a0e6429f9f1d03ad99fabc61/2ad8e7e9db1048d9993ae44061027219.jpg','/WEB-INF/upload/img/id_card/d88e28c3a0e6429f9f1d03ad99fabc61/d2853b0c5a6a4dbcb0eceb0a4c2febba.jpg','/WEB-INF/upload/img/id_card/d88e28c3a0e6429f9f1d03ad99fabc61/07308795030843e88749b0a31932a543.jpg','',2,'f3c05c74278745eab12d42105b73fe1f'),('528832fa9cc54d0290f6ee2922b27256','10001','dc89587b44ff4652b44f81da12589175',1003,'赵柳燕','825682eafec59c2e1632828195133a52','女','13511113333',NULL,'','','','2017-10-10 10:47:40','2017-10-10 10:47:40','u_st_2','','','','','0192d7c13cee431db91ff50befa70dd81507604195354',0,NULL,'101010101020202020','','2017-10-10 10:47:40','','',NULL,'93bb14244c9644df9eb966f257ac0795',2,''),('5a27d0f892cd48a482622f8b76fd239c','10001','4bc0ec2d68a444e7a584b9f8d03cbc44',1003,'王舞欣','825682eafec59c2e1632828195133a52','女','13211113333',NULL,'','','','2017-10-10 10:45:43','2017-10-10 10:45:43','u_st_2','','','','','afc5f8d65cf440a1b58a5f2295361fa01507604201402',0,NULL,'101010101020202020','','2017-10-10 10:45:43','','',NULL,'6bc47243d1a24b4ca1b2ede9cedc3374',2,''),('89d9317fb3834353bcf2a507bee2eb82','10001','9e8d946ef94b4795bd9218795354e631',1002,'张三','825682eafec59c2e1632828195133a52','男','13688888888',NULL,'','','','2017-10-10 09:36:10','2017-10-16 18:17:42','u_st_2','','','/upload/img/user/head_portrait/89d9317fb3834353bcf2a507bee2eb82/d879affae9c746619040c2b069df4e51.jpg','','da8990b107b84cf980035927cce112721507599537351',0,NULL,'000000000000000000','','2017-10-10 09:36:10','/WEB-INF/upload/img/id_card/f463f02d0fb346939a5d61921c0ae03e.jpg',NULL,NULL,'67c9a3c744e84905b125707785354396',2,'958a3de8193e41e1adda3e1fe923fefe'),('9f6bc79d769342f1b90ed0b532b870f2','10001','5a20e0ea32b948c08c928995b26af64e',1003,'李思思','825682eafec59c2e1632828195133a52','女','13311113333',NULL,'','','','2017-10-10 10:42:00','2017-10-10 10:42:00','u_st_2','','','','','c918451b778c44dc8ffcf7b7f6bb65621507604205889',0,NULL,'101010101010101010','','2017-10-10 10:42:00','','',NULL,'74e75f325887434e9fb846509ec74c32',2,''),('bed87f05893440698bf6d01028ea7c6a','10001','dc89587b44ff4652b44f81da12589175',1003,'赵六','825682eafec59c2e1632828195133a52','男','13511112222',NULL,'','','','2017-10-10 10:47:04','2017-10-10 10:47:04','u_st_2','','','','','f3ca7be273dc4184b8361755138eacf81507604211063',0,NULL,'101010101020202020','','2017-10-10 10:47:04','','',NULL,'3269998df292491889173c0e00259221',2,''),('d88e28c3a0e6429f9f1d03ad99fabc61','10001','',1001,'jackson','825682eafec59c2e1632828195133a52','男','13677779999','2017-10-06','','','','2017-10-12 14:51:10','2017-10-12 14:51:09','u_st_2','','','123','','b2df6b4677144c4188e915f7d87a10831508230750529',0,NULL,'','','2017-10-12 14:51:09','','','','',2,'');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_breed`
--

DROP TABLE IF EXISTS `user_breed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_breed` (
  `breed_id` varchar(35) NOT NULL,
  `breed_category` varchar(30) NOT NULL DEFAULT '',
  `breed_variety` varchar(30) NOT NULL DEFAULT '',
  `breed_type` varchar(30) NOT NULL DEFAULT '',
  `male_num` int(11) NOT NULL DEFAULT '0',
  `female_num` int(11) NOT NULL DEFAULT '0',
  `obstetric_table_num` int(11) NOT NULL DEFAULT '0',
  `shed_num` int(11) NOT NULL DEFAULT '0',
  `empty_shed_num` int(11) NOT NULL DEFAULT '0',
  `competitive_brand` varchar(50) NOT NULL DEFAULT '',
  `livestock_num` int(11) NOT NULL DEFAULT '0',
  `user_place_id` varchar(35) NOT NULL,
  `breed_age` int(11) NOT NULL DEFAULT '0',
  `breed_scale` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `json` text,
  PRIMARY KEY (`breed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_breed`
--

LOCK TABLES `user_breed` WRITE;
/*!40000 ALTER TABLE `user_breed` DISABLE KEYS */;
INSERT INTO `user_breed` VALUES ('b58ea1b0a12e47fc8f8fb03b8e878e9a','','','',0,0,0,0,0,'',0,'daab4edac0fa48d5b62f6c241f5dd590',0,0,'2017-10-20 17:16:41','{\"母体数量\":\"45\",\"养殖类目\":\"猪\",\"养殖类型\":\"商品养殖\",\"养殖品种\":\"内三元\",\"公体数量\":\"12\"}'),('b63090aba076401ba18b76b26b8346a8','','','',0,0,0,0,0,'',0,'b76ddc7446fa4e108ecaacc4a1d16bc7',0,0,'2017-10-20 17:13:41','{\"母体数量\":\"45\",\"养殖类目\":\"猪\",\"养殖类型\":\"商品养殖\",\"养殖品种\":\"内三元\",\"公体数量\":\"12\"}');
/*!40000 ALTER TABLE `user_breed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_breed_type_history`
--

DROP TABLE IF EXISTS `user_breed_type_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_breed_type_history` (
  `user_breed_type_id` varchar(35) NOT NULL,
  `user_place_id` varchar(35) NOT NULL DEFAULT '',
  `user_breed_type` varchar(20) NOT NULL DEFAULT '',
  `user_breed_variety` varchar(20) NOT NULL DEFAULT '',
  `user_breed_num` varchar(20) NOT NULL DEFAULT '',
  `user_sell_num` varchar(20) NOT NULL DEFAULT '',
  `user_breed_style` varchar(20) NOT NULL DEFAULT '',
  `user_fodder_type` varchar(20) NOT NULL DEFAULT '',
  `user_fodder_style` varchar(20) NOT NULL DEFAULT '',
  `user_fodder_num` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `delete_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_breed_type_history`
--

LOCK TABLES `user_breed_type_history` WRITE;
/*!40000 ALTER TABLE `user_breed_type_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_breed_type_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_department_customer_re`
--

DROP TABLE IF EXISTS `user_department_customer_re`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_department_customer_re` (
  `member_id` varchar(35) NOT NULL,
  `department_id` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_department_customer_re`
--

LOCK TABLES `user_department_customer_re` WRITE;
/*!40000 ALTER TABLE `user_department_customer_re` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_department_customer_re` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_devices`
--

DROP TABLE IF EXISTS `user_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_devices` (
  `user_device_id` varchar(35) NOT NULL,
  `user_id` varchar(35) NOT NULL DEFAULT '',
  `user_device_name` varchar(20) NOT NULL DEFAULT '',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `delete_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_device_id`),
  KEY `FK_user_device_re` (`user_id`),
  CONSTRAINT `FK_user_device_re` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_devices`
--

LOCK TABLES `user_devices` WRITE;
/*!40000 ALTER TABLE `user_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_history`
--

DROP TABLE IF EXISTS `user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_history` (
  `user_id` varchar(35) NOT NULL,
  `my_team_id` varchar(35) NOT NULL DEFAULT '',
  `team_department_id` varchar(35) NOT NULL DEFAULT '',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(20) NOT NULL DEFAULT '',
  `user_password` varchar(50) NOT NULL DEFAULT '',
  `user_sex` varchar(10) NOT NULL DEFAULT '',
  `user_phone` varchar(20) NOT NULL DEFAULT '',
  `user_birthday` date DEFAULT NULL,
  `user_address` varchar(50) NOT NULL DEFAULT '',
  `user_area` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_last_login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_status` varchar(10) NOT NULL DEFAULT '',
  `user_qq` varchar(20) NOT NULL DEFAULT '',
  `uesr_wechat` varchar(20) NOT NULL DEFAULT '',
  `user_img` varchar(150) NOT NULL DEFAULT '',
  `user_nickname` varchar(30) NOT NULL DEFAULT '',
  `token` varchar(50) NOT NULL DEFAULT '',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `delete_date` datetime DEFAULT NULL,
  `user_identity` varchar(18) NOT NULL DEFAULT '',
  `lng_and_lat` varchar(30) NOT NULL DEFAULT '',
  `user_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_card_front` text,
  `user_card_back` text,
  `user_card_hand` text,
  `position_id` varchar(35) NOT NULL DEFAULT '',
  `real_name` tinyint(4) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_history`
--

LOCK TABLES `user_history` WRITE;
/*!40000 ALTER TABLE `user_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_menu_re`
--

DROP TABLE IF EXISTS `user_menu_re`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_menu_re` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `FK_user_menu_re2` (`menu_id`),
  CONSTRAINT `FK_user_menu_re` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `FK_user_menu_re2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_menu_re`
--

LOCK TABLES `user_menu_re` WRITE;
/*!40000 ALTER TABLE `user_menu_re` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_menu_re` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_place`
--

DROP TABLE IF EXISTS `user_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_place` (
  `user_place_id` varchar(35) NOT NULL,
  `customer_id` varchar(35) NOT NULL DEFAULT '',
  `user_place_name` varchar(20) NOT NULL DEFAULT '',
  `user_place_acreage` int(11) NOT NULL DEFAULT '0',
  `user_employee_num` int(11) NOT NULL DEFAULT '0',
  `user_owner_num` int(11) NOT NULL DEFAULT '0',
  `user_already_use` int(11) NOT NULL DEFAULT '0',
  `user_place_address` varchar(50) NOT NULL DEFAULT '',
  `user_place_area` varchar(50) NOT NULL DEFAULT '',
  `user_place_type` varchar(15) NOT NULL DEFAULT '',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `delete_date` date DEFAULT NULL,
  PRIMARY KEY (`user_place_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_place`
--

LOCK TABLES `user_place` WRITE;
/*!40000 ALTER TABLE `user_place` DISABLE KEYS */;
INSERT INTO `user_place` VALUES ('15ad769bd47247819382abd672f95ff2','94a397ea0eae4632994108c02fe3b762','',142,0,0,0,'','鹤山','','2017-10-24 16:32:41',0,NULL),('824f02443d894e0f89c68485735839c6','94a397ea0eae4632994108c02fe3b762','',142,0,0,0,'','鹤山','','2017-10-24 16:32:35',0,NULL),('a23509182091476f9aca3a79f2ade728','94a397ea0eae4632994108c02fe3b762','',142,0,0,0,'','鹤山','','2017-10-24 16:32:44',0,NULL),('daab4edac0fa48d5b62f6c241f5dd590','94a397ea0eae4632994108c02fe3b762','',142,0,0,0,'','鹤山','','2017-10-20 16:56:20',0,NULL),('e8f1473529b045c99b7ae7609dff5ef0','94a397ea0eae4632994108c02fe3b762','',142,0,0,0,'','鹤山','','2017-10-24 16:32:38',0,NULL);
/*!40000 ALTER TABLE `user_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_place_hardware`
--

DROP TABLE IF EXISTS `user_place_hardware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_place_hardware` (
  `user_hardware_id` varchar(35) NOT NULL,
  `user_place_id` varchar(35) NOT NULL DEFAULT '',
  `user_hardware_name` varchar(20) NOT NULL DEFAULT '',
  `user_hardware_num` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `delete_date` date DEFAULT NULL,
  PRIMARY KEY (`user_hardware_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_place_hardware`
--

LOCK TABLES `user_place_hardware` WRITE;
/*!40000 ALTER TABLE `user_place_hardware` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_place_hardware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_place_hardware_history`
--

DROP TABLE IF EXISTS `user_place_hardware_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_place_hardware_history` (
  `user_hardware_id` varchar(35) NOT NULL,
  `user_place_id` varchar(35) NOT NULL DEFAULT '',
  `user_hardware_name` varchar(20) NOT NULL DEFAULT '',
  `user_hardware_num` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `delete_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_place_hardware_history`
--

LOCK TABLES `user_place_hardware_history` WRITE;
/*!40000 ALTER TABLE `user_place_hardware_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_place_hardware_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_place_history`
--

DROP TABLE IF EXISTS `user_place_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_place_history` (
  `user_place_id` varchar(35) NOT NULL,
  `customer_id` varchar(35) NOT NULL DEFAULT '',
  `user_place_name` varchar(20) NOT NULL DEFAULT '',
  `user_place_acreage` int(11) NOT NULL DEFAULT '0',
  `user_employee_num` int(11) NOT NULL DEFAULT '0',
  `user_place_address` varchar(50) NOT NULL DEFAULT '',
  `user_place_area` varchar(50) NOT NULL DEFAULT '',
  `user_place_type` varchar(15) NOT NULL DEFAULT '',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `delete_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_place_history`
--

LOCK TABLES `user_place_history` WRITE;
/*!40000 ALTER TABLE `user_place_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_place_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_qm_permission_re`
--

DROP TABLE IF EXISTS `user_qm_permission_re`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_qm_permission_re` (
  `user_id` varchar(35) NOT NULL,
  `qm_permission_id` varchar(35) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_qm_permission_re`
--

LOCK TABLES `user_qm_permission_re` WRITE;
/*!40000 ALTER TABLE `user_qm_permission_re` DISABLE KEYS */;
INSERT INTO `user_qm_permission_re` VALUES ('528832fa9cc54d0290f6ee2922b27256','f83b0e6783c04442b557533f37fc2681');
/*!40000 ALTER TABLE `user_qm_permission_re` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_record`
--

DROP TABLE IF EXISTS `user_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_record` (
  `user_id` varchar(35) NOT NULL,
  `my_team_id` varchar(35) NOT NULL DEFAULT '',
  `team_department_id` varchar(35) NOT NULL DEFAULT '',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(20) NOT NULL DEFAULT '',
  `user_password` varchar(50) NOT NULL DEFAULT '',
  `user_sex` varchar(10) NOT NULL DEFAULT '',
  `user_phone` varchar(20) NOT NULL DEFAULT '',
  `user_birthday` date DEFAULT NULL,
  `user_address` varchar(50) NOT NULL DEFAULT '',
  `user_area` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_last_login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_status` varchar(10) NOT NULL DEFAULT '',
  `user_qq` varchar(20) NOT NULL DEFAULT '',
  `uesr_wechat` varchar(20) NOT NULL DEFAULT '',
  `user_img` varchar(150) NOT NULL DEFAULT '',
  `user_nickname` varchar(30) NOT NULL DEFAULT '',
  `token` varchar(50) NOT NULL DEFAULT '',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `delete_date` datetime DEFAULT NULL,
  `user_identity` varchar(18) NOT NULL DEFAULT '',
  `lng_and_lat` varchar(30) NOT NULL DEFAULT '',
  `user_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_card_front` text,
  `user_card_back` text,
  `user_card_hand` text,
  `position_id` varchar(35) NOT NULL DEFAULT '',
  `real_name` tinyint(4) NOT NULL DEFAULT '2',
  `umeng_device_token` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_record`
--

LOCK TABLES `user_record` WRITE;
/*!40000 ALTER TABLE `user_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_view`
--

DROP TABLE IF EXISTS `user_view`;
/*!50001 DROP VIEW IF EXISTS `user_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_view` AS SELECT 
 1 AS `user_id`,
 1 AS `my_team_id`,
 1 AS `team_department_id`,
 1 AS `role_id`,
 1 AS `user_name`,
 1 AS `user_password`,
 1 AS `user_sex`,
 1 AS `user_phone`,
 1 AS `user_birthday`,
 1 AS `user_address`,
 1 AS `user_area`,
 1 AS `user_email`,
 1 AS `user_create_date`,
 1 AS `user_last_login_time`,
 1 AS `user_status`,
 1 AS `user_qq`,
 1 AS `uesr_wechat`,
 1 AS `user_img`,
 1 AS `user_nickname`,
 1 AS `token`,
 1 AS `is_deleted`,
 1 AS `delete_date`,
 1 AS `user_identity`,
 1 AS `lng_and_lat`,
 1 AS `user_update_time`,
 1 AS `user_card_front`,
 1 AS `user_card_back`,
 1 AS `user_card_hand`,
 1 AS `position_id`,
 1 AS `real_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `qm_permission_view`
--

/*!50001 DROP VIEW IF EXISTS `qm_permission_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`yf`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `qm_permission_view` AS select `u`.`user_id` AS `user_id`,`u`.`user_name` AS `user_name`,`u`.`my_team_id` AS `my_team_id`,`uqpr`.`qm_permission_id` AS `qm_permission_id` from (`user` `u` join `user_qm_permission_re` `uqpr` on((`uqpr`.`user_id` = `u`.`user_id`))) union select `u`.`user_id` AS `user_id`,`u`.`user_name` AS `user_name`,`u`.`my_team_id` AS `my_team_id`,`ppr`.`qm_permission_id` AS `qm_permission_id` from (`user` `u` join `position_permission_re` `ppr` on((`ppr`.`position_id` = `u`.`position_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_view`
--

/*!50001 DROP VIEW IF EXISTS `user_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`yf`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_view` AS select `user`.`user_id` AS `user_id`,`user`.`my_team_id` AS `my_team_id`,`user`.`team_department_id` AS `team_department_id`,`user`.`role_id` AS `role_id`,`user`.`user_name` AS `user_name`,`user`.`user_password` AS `user_password`,`user`.`user_sex` AS `user_sex`,`user`.`user_phone` AS `user_phone`,`user`.`user_birthday` AS `user_birthday`,`user`.`user_address` AS `user_address`,`user`.`user_area` AS `user_area`,`user`.`user_email` AS `user_email`,`user`.`user_create_date` AS `user_create_date`,`user`.`user_last_login_time` AS `user_last_login_time`,`user`.`user_status` AS `user_status`,`user`.`user_qq` AS `user_qq`,`user`.`uesr_wechat` AS `uesr_wechat`,`user`.`user_img` AS `user_img`,`user`.`user_nickname` AS `user_nickname`,`user`.`token` AS `token`,`user`.`is_deleted` AS `is_deleted`,`user`.`delete_date` AS `delete_date`,`user`.`user_identity` AS `user_identity`,`user`.`lng_and_lat` AS `lng_and_lat`,`user`.`user_update_time` AS `user_update_time`,`user`.`user_card_front` AS `user_card_front`,`user`.`user_card_back` AS `user_card_back`,`user`.`user_card_hand` AS `user_card_hand`,`user`.`position_id` AS `position_id`,`user`.`real_name` AS `real_name` from `user` union select `user_record`.`user_id` AS `user_id`,`user_record`.`my_team_id` AS `my_team_id`,`user_record`.`team_department_id` AS `team_department_id`,`user_record`.`role_id` AS `role_id`,`user_record`.`user_name` AS `user_name`,`user_record`.`user_password` AS `user_password`,`user_record`.`user_sex` AS `user_sex`,`user_record`.`user_phone` AS `user_phone`,`user_record`.`user_birthday` AS `user_birthday`,`user_record`.`user_address` AS `user_address`,`user_record`.`user_area` AS `user_area`,`user_record`.`user_email` AS `user_email`,`user_record`.`user_create_date` AS `user_create_date`,`user_record`.`user_last_login_time` AS `user_last_login_time`,`user_record`.`user_status` AS `user_status`,`user_record`.`user_qq` AS `user_qq`,`user_record`.`uesr_wechat` AS `uesr_wechat`,`user_record`.`user_img` AS `user_img`,`user_record`.`user_nickname` AS `user_nickname`,`user_record`.`token` AS `token`,`user_record`.`is_deleted` AS `is_deleted`,`user_record`.`delete_date` AS `delete_date`,`user_record`.`user_identity` AS `user_identity`,`user_record`.`lng_and_lat` AS `lng_and_lat`,`user_record`.`user_update_time` AS `user_update_time`,`user_record`.`user_card_front` AS `user_card_front`,`user_record`.`user_card_back` AS `user_card_back`,`user_record`.`user_card_hand` AS `user_card_hand`,`user_record`.`position_id` AS `position_id`,`user_record`.`real_name` AS `real_name` from `user_record` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-27 18:06:00
