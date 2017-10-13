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
INSERT INTO `common_apply` VALUES ('2c4dd862aa2f4ab1bb4a03590582f210','请假申请','89d9317fb3834353bcf2a507bee2eb82','张三','2017-08-30','2017-08-31','2017-09-04 16:14:30',12,'累');
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
INSERT INTO `common_apply_approve` VALUES ('2c4dd862aa2f4ab1bb4a03590582f210','89d9317fb3834353bcf2a507bee2eb84','王五',21,1,NULL),('2c4dd862aa2f4ab1bb4a03590582f210','41370f132bd44bca943e2fe5dd9862ab','赵六',22,2,NULL);
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
INSERT INTO `customer` VALUES ('4107014698214cc4b4e83a253c9dd332','personal','0e9382da6acc486a9d3d2e0d453ae4f8','03ef5797bae2466699d5efc970a8962f','','10001','','',0,0,NULL,0),('43a3f72f83d14b498e117f9be76e8d4f','dealer','d88e28c3a0e6429f9f1d03ad99fabc61','03ef5797bae2466699d5efc970a8962f','','10001','','',0,1,'2017-10-12 15:57:12',1),('8db19a60714e4ac1a9c8cfe51093f8f4','dealer','418c85d20fcd40e6b56eee3d54529b2b','03ef5797bae2466699d5efc970a8962f','','10001','','',0,0,NULL,0),('b8de52fef23b42148d1afade0923badd','personal','688642d3858d4bab869aff28fa2de52d','03ef5797bae2466699d5efc970a8962f','','10001','','',0,0,NULL,0);
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
INSERT INTO `customer_account_request` VALUES ('320cd46e93004f12890dba46bf0d2a4d','03ef5797bae2466699d5efc970a8962f','李四','43a3f72f83d14b498e117f9be76e8d4f','jackson','03ef5797bae2466699d5efc970a8962f','李四','9f6bc79d769342f1b90ed0b532b870f2','李思思',2,'2017-10-12 15:37:28','loginInfo'),('929ca76f1b1e43ef8d6fba1ac86a0066','89d9317fb3834353bcf2a507bee2eb82','张三','21e7e3bcab354cfc8aae9ed21162d5a6','三三','89d9317fb3834353bcf2a507bee2eb82','张三','89d9317fb3834353bcf2a507bee2eb82','张三',1,'2017-09-20 17:17:07','loginInfo'),('e0fc8ae5811648b89732d9fdf87d664f','89d9317fb3834353bcf2a507bee2eb82','张三','c1e0c28313ee42a38e06e25233619369','三三','89d9317fb3834353bcf2a507bee2eb82','张三','89d9317fb3834353bcf2a507bee2eb82','张三',2,'2017-09-20 17:20:44','loginInfo');
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
INSERT INTO `customer_assist` VALUES ('20a0d03c621b4ffcbd06b25f970e4e8e','搞不定','太难搞','89d9317fb3834353bcf2a507bee2eb82','张三','2017-09-11 16:22:19');
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
INSERT INTO `customer_assist_customer` VALUES ('20a0d03c621b4ffcbd06b25f970e4e8e','1ddd3d18c22a4c129c2517d50e69a400','三三');
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
INSERT INTO `customer_assist_image` VALUES ('698a60e791324ea8bfce26029108b110','/upload/img/user/assist/89d9317fb3834353bcf2a507bee2eb82/698a60e791324ea8bfce26029108b110.jpg','20a0d03c621b4ffcbd06b25f970e4e8e');
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
INSERT INTO `customer_assist_user` VALUES ('20a0d03c621b4ffcbd06b25f970e4e8e','自己解决','89d9317fb3834353bcf2a507bee2eb83','李四','财务部');
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
INSERT INTO `customer_follow` VALUES ('6ab57a2bde64458a9cf19c16226a45e6','标题','2017-07-07 00:00:00',NULL,NULL,'43a3f72f83d14b498e117f9be76e8d4f','jackson','03ef5797bae2466699d5efc970a8962f','李四');
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
INSERT INTO `department_position` VALUES ('3269998df292491889173c0e00259221','财务主管','dc89587b44ff4652b44f81da12589175'),('67c9a3c744e84905b125707785354396','负责人','9e8d946ef94b4795bd9218795354e631'),('6bc47243d1a24b4ca1b2ede9cedc3374','后勤主管','4bc0ec2d68a444e7a584b9f8d03cbc44'),('74e75f325887434e9fb846509ec74c32','业务主管','5a20e0ea32b948c08c928995b26af64e'),('93bb14244c9644df9eb966f257ac0795','财务员','dc89587b44ff4652b44f81da12589175'),('b07d5450f6ae448b88db7dfcdf0d1dc7','后勤人员','4bc0ec2d68a444e7a584b9f8d03cbc44'),('ecc6efd7b0904b2e9ca069342ade21eb','业务员','5a20e0ea32b948c08c928995b26af64e');
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
INSERT INTO `goods_image` VALUES ('f0c3df5bdb0a45aabf22464bb27dbb88','f0c3df5bdb0a45aabf22464bb27dbb88','',1),('bae0a50f935248cfa03a0e0cbffd2dda','35aa7507390f4ead9d64dc55cc2aa768','0',1),('bae0a50f935248cfa03a0e0cbffd2dda','4ece06b76d3f42718722e37a92b44d0c','1',2),('bae0a50f935248cfa03a0e0cbffd2dda','4fb2d3accff24ba4a9dec5d2a38e5b25','2',2),('bae0a50f935248cfa03a0e0cbffd2dda','716e780e379142a5812587a4ba11387e','3',2),('bae0a50f935248cfa03a0e0cbffd2dda','eedad265f3624c0eb2c6f9ac890989aa','4',2);
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
INSERT INTO `goods_standard` VALUES ('4e3007c4db5d483bb9245743fa5c08eb','f0c3df5bdb0a45aabf22464bb27dbb88','10kg/袋',20,100,10),('8e6aabae569e44ca80db3115372aa1a4','bae0a50f935248cfa03a0e0cbffd2dda','100g/袋',20,0,100),('e0841a5ee98a410c9f1fe4a786a6d6f0','f0c3df5bdb0a45aabf22464bb27dbb88','20kg/袋',35,200,20);
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
INSERT INTO `goodsinfo` VALUES ('bae0a50f935248cfa03a0e0cbffd2dda','945ecca898284c2187ef6a5475a1363e','10001','','【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋',0,0,'品牌?哼哼动保','4fb2d3accff24ba4a9dec5d2a38e5b25|7bc2d9bfafc744c8a6ecabfb7c6e9ce2|7ea010df01dd4e88847daf5c3e3a5002|cb4e6691e9dc46b980576492cc5567d3|eedad265f3624c0eb2c6f9ac890989aa|',NULL,0,0,'2017-10-13 14:47:49',0,NULL,'S119'),('f0c3df5bdb0a45aabf22464bb27dbb88','0b49ef854bb74ff9b9317132dba053d7','10001','','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG',0,0,'品牌?新希望六和','5ada385a15c34d528fb4753ec812a2b8|01771457c0394a52850e56a51fda441b|34c27519accb42629a8b647e41ca6367|31829c1f43904335a90198334f88944e|1e5ef815eaff48b9b3385274ff3263cd|f1749cdb61ed4f5db8b985a65bd8ae09|ef013d42d1044051b61d60132f058009|94026251c2f94cf2be879faafcde2a84|1927ecc494284fed96d8df5745318491|',NULL,0,0,'2017-10-10 14:36:32',0,NULL,'D110');
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
INSERT INTO `image_space` VALUES ('35aa7507390f4ead9d64dc55cc2aa768','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/f4845d04353643989e87cb129e01670d.jpg'),('4ece06b76d3f42718722e37a92b44d0c','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/68ddd98e90124766a2847a338fe8c1d9.jpg'),('4fb2d3accff24ba4a9dec5d2a38e5b25','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/4bcc8080c171406c846d5fecbbf4ca7b.jpg'),('716e780e379142a5812587a4ba11387e','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/bc7d6b41762f43c89138dde1afedcf17.jpg'),('7bc2d9bfafc744c8a6ecabfb7c6e9ce2','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/59656c7010a24bcbb98074b9eb044b2c.jpg'),('7ea010df01dd4e88847daf5c3e3a5002','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/159bbb9842d549b4b7fceefad2921cfb.jpg'),('cb4e6691e9dc46b980576492cc5567d3','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/68d122f29bb6467e8e3185998dc102c5.jpg'),('eedad265f3624c0eb2c6f9ac890989aa','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/c9f81702668c4a03ba920c2bdd3ec88b.jpg'),('f0c3df5bdb0a45aabf22464bb27dbb88','10001','112'),('fdce86cccb6440c2abd153e50604fa24','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/ac77e073ed7546fe8767e91535de0115.jpg');
/*!40000 ALTER TABLE `image_space` ENABLE KEYS */;
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
INSERT INTO `manage_unit` VALUES ('259e99cfbc5a41c8ae99fc47bea55ba5','22fbd2f300f5415785f1d97969e51e5a','西瓜零售','水果','江门鹤山',100);
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
INSERT INTO `permission` VALUES ('0019a7d08baa4435b3b8cbb1782d607b','添加场地','/s/saveUserPlace.action','f504a83780ee405bb2bf2846c8185b68'),('0042344cca67495b86db8b577dc24176','获取场地详情','/s/getUserPlace.action','f504a83780ee405bb2bf2846c8185b68'),('00a6ba84fcc94e6a81e92507e467ae63','获取成员详细信息','/s/findMemberInfo.action','290c49508d5242a995eef8697258866e'),('00a7c307aaea43a49afca925477df809','获取场地详情','/s/getVisitUserPlace.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('0216be55f13e4808bc56489bb236d19f','获取农户列表','/s/listFarmer.action','48ad23d3663742709b0fd02566c5bce1'),('022f797ea95a406c9b332114adc8547a','上传身份证背面照片','/s/insertCardBack.action','290c49508d5242a995eef8697258866e'),('02b05ed50b9744829b9a94683d75b926','发起人获取申请列表','/s/listCommonApplyByProposer.action','180a88d962b5473688557fc6c31f6a5b'),('0586216edb504e18a672497debf365c2','编辑运费模板','/s/updateFreightTemp.action','81e21c825dbd41f3812fcad7e22b767f'),('07b17ceb6d324416b968a74ce715bccc','获取部门下成员列表','/s/findDepartmentMember.action','c6e68494eb1c4e71abbd441e18ed7c4d'),('0d5cb8e7b6534e86b4224e56a8d8ff24','减少一级库存','/s/updateRepertorySubFirst.action','cdcdefebac994aed81a9d07f30255c43'),('0fc36c021f4340919dec479de48445cc','获取申请详情','/s/getCustomerAssist.action','3890b7d139cf4ed6a23bc8800a62b8a8'),('0fe2c03ab49b472abfb8a8b372fc3cb9','删除养殖信息','/s/removeUserBreed.action','80a907d42ed94b208c99751ec532fb47'),('107656762e6a4ab1bbc481020e0a231e','分配销售点商品','/s/updateBranchGoods.action','6d378d07a74a40a4932a3116b1e05172'),('136ff3eab4d7402199359f10ba375ba9','修改客户','/s/updateCustomer.action','9431640a423a4c44a078b11f67f9c47e'),('14b69b41768d428cad8f466019d6d426','跟单确认收到退货','/s/updateRefundReceive.action','e15672bda5ac4ae1bc712ce209ca35b4'),('15617cf67c3d4e3093492cd52500f691','客户建档','/s/saveCustomerRecord.action','9431640a423a4c44a078b11f67f9c47e'),('18053369bf3f4db2a847f74ecccbda0e','获取所有商品列表','/s/listGoods.action','6d378d07a74a40a4932a3116b1e05172'),('180a88d962b5473688557fc6c31f6a5b','通用申请-通用申请','','0'),('201ccdd96be04a3897747c7c2ba52070','减少二级库存','/s/updateRepertorySubSecond.action','cdcdefebac994aed81a9d07f30255c43'),('25787f3af83a42c189e2dd2dc87f710f','根据手机号或用户名搜索用户','/s/findMemberByNameOrPhone.action','c6e68494eb1c4e71abbd441e18ed7c4d'),('26994a4b6526462c86cebe80fa022724','财务A轮审核通过','/s/updateFinancePassA.action','a9a3ef3eece0484b9c30f49703780c09'),('26c2312d07914617b5b435e7fe6b7f2c','删除农户','/s/removeFarmer.action','48ad23d3663742709b0fd02566c5bce1'),('2714cdbd1e274a51a694f5efa8af8856','获取团队部门及成员','/s/listDepartmentAndMember.action','c6e68494eb1c4e71abbd441e18ed7c4d'),('290c49508d5242a995eef8697258866e','组织管理-组织管理','','0'),('2a5b73afb4d043da97b9804a90580387','添加图片到图片空间','/s/uploadToImgSpace.action','8499740c4d72458ebf7dd159369ea12a'),('2b6bbbc390dc46098a7a4796a1b4f259','添加运费模板','/s/saveFreightTemp.action','81e21c825dbd41f3812fcad7e22b767f'),('2b7ccc2a1af9411d8d55a58aeca1afc5','获取场地列表','/s/listVisitUserPlace.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('2cade59526764f368e76011d46329bc2','添加部门','/s/addDepartment.action','290c49508d5242a995eef8697258866e'),('2d2b7f2c4b1b4e9dbac91dc375348ba4','根据订单号获取订单列表','/s/listSalesOrderByOrderNumber.action','e15672bda5ac4ae1bc712ce209ca35b4'),('2dbbf3994e60476384f60f5e1309cc4a','获取成员详情','/s/getDepartmentMember.action','c6e68494eb1c4e71abbd441e18ed7c4d'),('2e9323ed3f1642d5811594c27c8c62a7','上传身份证正面照片','/s/insertCardFront.action','290c49508d5242a995eef8697258866e'),('2ef042915877480ba9c19a069bfc2731','获取商品描述','/s/findGoodsDescribe.action','8499740c4d72458ebf7dd159369ea12a'),('2fe4f35574944bd8bd1efa20bbc10d91','添加商品','/s/goodsRelease.action','8499740c4d72458ebf7dd159369ea12a'),('30ee89b8b7944cb49fb7f2ddba7e7df1','上传场地环境图片','/s/uploadPlaceEnvironment.action','f504a83780ee405bb2bf2846c8185b68'),('33725961ee8b4c699658323f418facd3','跟单员移交客户','/s/updateCustomerToMerchandiser.action','9431640a423a4c44a078b11f67f9c47e'),('34c3494f08f8417194c2b624675f768b','解冻客户','/s/updateCustomerUnfreeze.action','9431640a423a4c44a078b11f67f9c47e'),('3890b7d139cf4ed6a23bc8800a62b8a8','客户-申请协助','','0'),('3aa27d074ce54338997b69c6b78d5c21','修改经营单位','/s/updateManageUnit.action','93af34d839e24e59943724ad6f568e3c'),('3c16bc6a83c34cb1bbdbace057e43e75','确认签收','/s/updateRepertoryApplyFinish.action','4992632ef68d4fca88b118e5a5d5f943'),('42a46e72135449b0b5c9bb44371b7e6d','获取库存分配记录','/s/listRepertoryRecord.action','cdcdefebac994aed81a9d07f30255c43'),('42de550b68e94dbf9744d561a542fa6d','获取审批人列表','/s/listAccountChecker.action','c86cb881c60b46e0bbcaff33e6759324'),('42f0a5cd03054109a93538d6e700cadf','获取跟单员列表','/s/listMerchandiser.action','c86cb881c60b46e0bbcaff33e6759324'),('448ea6a49825449cb4c8245d3d79e780','上传身份证正面照片','/s/saveFrontImage.action','9431640a423a4c44a078b11f67f9c47e'),('48ad23d3663742709b0fd02566c5bce1','客户-农户信息','','0'),('4992632ef68d4fca88b118e5a5d5f943','库存-申请库存','','0'),('4af4bbab4da94dbea01542dee230c1d6','删除商品','/s/deleteGoods.action','8499740c4d72458ebf7dd159369ea12a'),('5293a87b01c744698034f3fc94e5e7fb','获取部门详情','/s/findDepartmentInfo.action','290c49508d5242a995eef8697258866e'),('534b4db496bf4ed8a26185bf12cea818','获取经营单位列表','/s/listVisitManageUnit.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('5557c7682e05401aa8fbad5d197b375c','获取部门列表','/s/findDepartmentList.action','290c49508d5242a995eef8697258866e'),('560f4c55faa147ccb0a94b9ebdb3be67','上传申请用图片','/s/saveCommonApplyImage.action','180a88d962b5473688557fc6c31f6a5b'),('5860b406edb84e4eba460ca871b2476d','获取职位列表','/s/findPositionList.action','290c49508d5242a995eef8697258866e'),('5899d077d5ad41e3b90a6fde42326bc9','获取建账申请','/s/getCustomerAccount.action','c86cb881c60b46e0bbcaff33e6759324'),('5a418ffc4208480e9a3f6a05f5d38959','获取部门下成员列表','/s/findMemberList.action','290c49508d5242a995eef8697258866e'),('5eade54e69aa4d809917eb2024f1bd19','库存-查看库存','','0'),('5ef8f0c163c64944a3b077e2d8ccfe6c','拒绝客户建账','/s/updateCustomerAccountRefuse.action','c86cb881c60b46e0bbcaff33e6759324'),('5f6395f1b6e64b01993eba581514d2b9','获取部门下的成员列表','/s/listVisitMember.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('5f76889ef85a4af68d9b2ea9d864661d','获取部门列表','/s/listTeamDepartment.action','c6e68494eb1c4e71abbd441e18ed7c4d'),('5fd5b78447bd4e8db65e0dfb3c198e1d','获取类目','/s/listBreedType.action','80a907d42ed94b208c99751ec532fb47'),('60385f4df1384b33aac6f0a3993b9e4c','删除运费模板','/s/removeFreightTemp.action','81e21c825dbd41f3812fcad7e22b767f'),('648610cb5a47420f8d8155b7ceaeebe5','查找商品所属类目','/s/findTypeAndParents.action','8499740c4d72458ebf7dd159369ea12a'),('653973d62b10474dbd056dc79c25f517','获取跟进详情','/s/getVisitCustomerFollow.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('666cd9d8496a41cf9c009f6e29c152bc','获取跟进列表','/s/listVisitCustomerFollow.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('673fb85726a94e49b9d6c53751fe2a21','获取图片空间图片','/s/findImages.action','8499740c4d72458ebf7dd159369ea12a'),('6890e92508e0444088a3223551bebdf3','获取养殖信息列表（新）','/s/listUserBreedJson.action','80a907d42ed94b208c99751ec532fb47'),('6a673815aa654215a20fe0ed189653a2','添加养殖信息（新）','/s/saveUserBreedJson.action','80a907d42ed94b208c99751ec532fb47'),('6a7bc156dc0349db92753c41323b4f85','获取身份证图片','/s/getCardImage.action','290c49508d5242a995eef8697258866e'),('6b2a2dd116b14b2f8474573ad7e6c848','审批员获取建账申请列表','/s/listCustomerAccountByChecker.action','c86cb881c60b46e0bbcaff33e6759324'),('6b616a89824e424b917478815d4326ec','获取商品列表','/s/findGoodsList.action','8499740c4d72458ebf7dd159369ea12a'),('6d378d07a74a40a4932a3116b1e05172','商城-销售点','','0'),('707d9bfcdd6b4cdaaf2463500e772850','财务A轮审核不通过','/s/updateFinanceFailA.action','a9a3ef3eece0484b9c30f49703780c09'),('7590e3fa637f4314aa100fdd05c757cf','业务员移交客户','/s/updateCustomerToPromoter.action','9431640a423a4c44a078b11f67f9c47e'),('77eb3a58491b468fae49af4d3abcb6a3','发起通用申请','/s/saveCommonApply.action','180a88d962b5473688557fc6c31f6a5b'),('78b8b104904a46a0b007112f09e7a5a3','跟单同意退款','/s/updateRefundPass.action','e15672bda5ac4ae1bc712ce209ca35b4'),('796d88dc9b934104a9823254991f08a8','财务退款','/s/updateRefundMoney.action','a9a3ef3eece0484b9c30f49703780c09'),('79d8bfa769864a32910e9eae1c507133','添加协助申请','/s/saveCustomerAssist.action','3890b7d139cf4ed6a23bc8800a62b8a8'),('7c055fd3abbd44728f970e10fc73ad84','获取图片','/s/getVisitIDCard.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('7ce1464db3d74492abeba4db1b6aca3f','查看一级库存','/s/listRepertoryFirst.action','5eade54e69aa4d809917eb2024f1bd19'),('7ff74698b2b04ca2b6494ab770d0857d','获取输入信息列表','/s/listBreedInfo.action','80a907d42ed94b208c99751ec532fb47'),('80a907d42ed94b208c99751ec532fb47','客户-养殖信息','','0'),('81c886a40cd4426fb01923bc240e61d8','分配库存等级','/s/saveRepertoryLevel.action','9431640a423a4c44a078b11f67f9c47e'),('81e21c825dbd41f3812fcad7e22b767f','商城-运费模板','','0'),('844e653300004df0835e9f34805d8e29','获取图片','/s/getCustomerIDCard.action','9431640a423a4c44a078b11f67f9c47e'),('8499740c4d72458ebf7dd159369ea12a','商城-商品编辑','','0'),('86830056701847b6b7958ab76bf1d8c0','财务B轮审核通过','/s/updateFinancePassB.action','a9a3ef3eece0484b9c30f49703780c09'),('8aa9e9aa751f45a9972ef60dc2f98cd4','获取销售点详情','/s/getBranch.action','6d378d07a74a40a4932a3116b1e05172'),('8cab39dd93ef4d009b91e4c74afd6f25','删除场地环境、证明图片','/s/removePlaceImage.action','f504a83780ee405bb2bf2846c8185b68'),('8e2267fb35b846d3b65d8b36a84047ba','删除部门成员','/s/updateDepartment.action','290c49508d5242a995eef8697258866e'),('8ee3ab9a4d56493fba30ebb4091834a6','添加农户','/s/saveFarmer.action','48ad23d3663742709b0fd02566c5bce1'),('8f9f3a18414e4fba9d1fecb27735d5b3','获取审批人列表','/s/listRepertoryChecker.action','4992632ef68d4fca88b118e5a5d5f943'),('8fe811b567fd4455900cc0c90329c3ad','拒绝申请','/s/updateCommonApplyRefuse.action','180a88d962b5473688557fc6c31f6a5b'),('92c603084fb84368b9c388d092abcc00','获取类目选项','/s/listBreedSelect.action','80a907d42ed94b208c99751ec532fb47'),('93af34d839e24e59943724ad6f568e3c','客户-经营单位','','0'),('93d794371bed4bbe9078d956161eb75d','获取场地列表','/s/listUserPlace.action','f504a83780ee405bb2bf2846c8185b68'),('9431640a423a4c44a078b11f67f9c47e','客户-客户信息','','0'),('94926b1491044120a6afb6f124c4ad70','获取经营单位详情','/s/getManageUnit.action','93af34d839e24e59943724ad6f568e3c'),('966f3438db0543759a2ddd3d16d70b21','查看销售点库存','/s/listBranchGoods.action','5eade54e69aa4d809917eb2024f1bd19'),('98a37be8c86a487397bd05292176ba21','获取商品详情','/s/findGoodsInfo.action','8499740c4d72458ebf7dd159369ea12a'),('9ac7fc56b31c4ab39f81e6a9242079bc','删除部门','/s/deleteDepartment.action','290c49508d5242a995eef8697258866e'),('a0595a0ff6104ca887df9a1a6b21fb1f','获取销售点商品列表','/s/listBranchGoods.action','6d378d07a74a40a4932a3116b1e05172'),('a0cf0557aef74a54975d8554fe73bc2d','修改商品','/s/updateGoods.action','8499740c4d72458ebf7dd159369ea12a'),('a15744ad321a4ad3b2310b7854071f04','发起申请','/s/saveRepertoryApply.action','4992632ef68d4fca88b118e5a5d5f943'),('a3ffabc02fa4411095948ecb5f78594e','删除场地','/s/removeUserPlace.action','f504a83780ee405bb2bf2846c8185b68'),('a57f3a10735d4af2ae8a7dfbf2bbed08','登录后台系统','/s/login.action','290c49508d5242a995eef8697258866e'),('a5c20cefc4d048dab099081de30bcdb6','审批人获取申请列表','/s/listCommonApplyByApprove.action','180a88d962b5473688557fc6c31f6a5b'),('a631dc8930454ba78c1eb9b40a4685b7','更新部门信息','/s/updateDepartment.action','290c49508d5242a995eef8697258866e'),('a7b35ea834b84ced895af372ab72e5cb','筛选订单','/s/listSalesOrderSelective.action','e15672bda5ac4ae1bc712ce209ca35b4'),('a9a3ef3eece0484b9c30f49703780c09','商城-财务订单','','0'),('abd203fcb5284217b6903e9d0ab577af','获取部门详情','/s/findDepartmentDetail.action','c6e68494eb1c4e71abbd441e18ed7c4d'),('acb6399fc6a84da78d35b698446b1528','添加养殖信息','/s/saveUserBreed.action','80a907d42ed94b208c99751ec532fb47'),('account_check','同意客户建账','/s/updateCustomerAccountAccept.action','c86cb881c60b46e0bbcaff33e6759324'),('b277b9aef08d4710bebff69b42af7812','获取养殖信息列表','/s/listUserBreed.action','80a907d42ed94b208c99751ec532fb47'),('b2b91eaffb9a437cb8cd7de3e919b95d','更新成员信息','/s/updateMember.action','290c49508d5242a995eef8697258866e'),('b3128894fa2248b2a56c4f3a0eb3ffcc','上传证明图片','/s/saveAssistImage.action','3890b7d139cf4ed6a23bc8800a62b8a8'),('b40a500c505043e9863491a06bf44200','获取部门名称和部门下的成员总数','/s/findTeamAndMemberCount.action','290c49508d5242a995eef8697258866e'),('b53602691de140d789c443cba7ce811d','冻结客户','/s/updateCustomerFreeze.action','9431640a423a4c44a078b11f67f9c47e'),('b670872c2d144485be38bb53e6317df2','添加部门成员','/s/addMember.action','290c49508d5242a995eef8697258866e'),('b70d9ab8d4f94066bc602fc5d8de13c5','添加经营单位','/s/saveManageUnit.action','93af34d839e24e59943724ad6f568e3c'),('b8e9a9ea5aea480fa6ca5d6cf6819bc5','协助者更新协助结果','/s/updateCustomerAssistResult.action','3890b7d139cf4ed6a23bc8800a62b8a8'),('b9c20f29ae8c460d879d118fc0484af1','获取当前在任职位的总人数','/s/countPositionMember.action','290c49508d5242a995eef8697258866e'),('bb0e57ebf6ab49a28c0d64d6eb87403e','增加二级库存','/s/updateRepertoryAddSecond.action','cdcdefebac994aed81a9d07f30255c43'),('bb6d3dacaf564319b4a48bb8ca1f57b5','获取销售点列表','/s/listBranch.action','6d378d07a74a40a4932a3116b1e05172'),('bbc60c2218f343399ebe4643dde4e1c4','申请客户建账','/s/saveCustomerAccount.action','c86cb881c60b46e0bbcaff33e6759324'),('bd5a86235b164c079482dd3788e3e618','根据订单号获取订单列表','/s/listFinanceOrderByOrderNumber.action','a9a3ef3eece0484b9c30f49703780c09'),('be864d411c3c40db8af7b237327afab3','添加客户跟进','/s/saveCustomerFollow.action','f204db18f3b04239b9f59936e558bdaa'),('c0a782a179fc430fb621464587014c01','筛选订单','/s/listFinanceOrderSelective.action','a9a3ef3eece0484b9c30f49703780c09'),('c292f78dc5e14ef49e908318e1c0ff16','搜索商品','/s/findGoodsListByKeyword.action','8499740c4d72458ebf7dd159369ea12a'),('c39c8ae939e341929fb186f309ab1bda','获取销售点列表','/s/listBranch.action','5eade54e69aa4d809917eb2024f1bd19'),('c6e68494eb1c4e71abbd441e18ed7c4d','团队-团队','','0'),('c725f983360c49bcb6eab24872be905e','获取部门下的成员列表','/s/findMemberList.action','180a88d962b5473688557fc6c31f6a5b'),('c86cb881c60b46e0bbcaff33e6759324','客户-客户建账','','0'),('ca56319400c6444799b8a15a81f88d67','查找商品类目','/s/findGoodsTypeByPid.action','8499740c4d72458ebf7dd159369ea12a'),('cb5aa6ebe92c4ceb8a722ac9afde57ae','客户资源-客户资源','','0'),('cbe84fc9eee84bdf8559ca510be3970a','确认发货','/s/updateDelivered.action','e15672bda5ac4ae1bc712ce209ca35b4'),('cbeab887b9a549179c4208ee390a7e2c','获取成员的客户列表','/s/listVisitCustomer.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('cd7a6b8c1a7f4b5fade2073309a43ac2','审批人获取库存审批列表','/s/listRepertoryApplyByApprover.action','4992632ef68d4fca88b118e5a5d5f943'),('cdcdefebac994aed81a9d07f30255c43','库存-库存分配','','0'),('cf02c0af7a9b44c289bca1094da9de9c','编辑销售点','/s/updateBranch.action','6d378d07a74a40a4932a3116b1e05172'),('d00ed5b5c6894542993dba803cd47ca3','同意申请','/s/updateCommonApplyAccept.action','180a88d962b5473688557fc6c31f6a5b'),('d505f9acf0594c529c08def373c3d46d','删除销售点','/s/removeBranch.action','6d378d07a74a40a4932a3116b1e05172'),('d5e3821c4dc64fc6b3d6417b79458bb6','添加销售点','/s/addBranch.action','6d378d07a74a40a4932a3116b1e05172'),('d7b7c64b8834428f84c5997b123ce472','获取客户详情','/s/getVisitCustomer.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('d816e46176734cc78a910cb747ba327a','协助者获取协助列表','/s/listCustomerAssistByHelper.action','3890b7d139cf4ed6a23bc8800a62b8a8'),('ded06cf4495141e09d56154d1f4fe7c2','申请者获取协助列表','/s/listCustomerAssistByProposer.action','3890b7d139cf4ed6a23bc8800a62b8a8'),('dfd979c8ea75436db9ed48521699bac6','获取库存申请列表','/s/listRepertoryApplyByProposer.action','4992632ef68d4fca88b118e5a5d5f943'),('e15672bda5ac4ae1bc712ce209ca35b4','商城-业务订单','','0'),('e23958cc985c420b936c691228a96014','修改农户','/s/updateFarmer.action','48ad23d3663742709b0fd02566c5bce1'),('e3ec413039f346729b69272adee8de18','查看当前销售点库存','/s/getRepertory.action','5eade54e69aa4d809917eb2024f1bd19'),('e3fb84075cb34af7b79c4bc4e9745f25','上传身份证背面照片','/s/saveBackImage.action','9431640a423a4c44a078b11f67f9c47e'),('e5bc1dea892844abbab064e710f6f661','更新跟进信息','/s/updateCustomerFollow.action','f204db18f3b04239b9f59936e558bdaa'),('e5cc2a90e0c0471e87f8c8b453718e71','申请人获取建账申请列表','/s/listCustomerAccountByProposer.action','c86cb881c60b46e0bbcaff33e6759324'),('e9a17f1561204e96a773b0b2bec38fec','获取运费模板列表(商家)','/s/listFreightTemp.action','81e21c825dbd41f3812fcad7e22b767f'),('ecec38b832394c518205ec9d713fcb4b','获取跟进列表','/s/listCustomerFollow.action','f204db18f3b04239b9f59936e558bdaa'),('f07b5a3a1675482697e13c4635d58088','获取客户列表','/s/listCustomer.action','9431640a423a4c44a078b11f67f9c47e'),('f204db18f3b04239b9f59936e558bdaa','客户-客户跟进','','0'),('f278b817feee4bafa48ec603685da8bd','修改场地','/s/updateUserPlace.action','f504a83780ee405bb2bf2846c8185b68'),('f448faef79c04aa2ba59d8621b8afd2c','获取经营单位列表','/s/listManageUnit.action','93af34d839e24e59943724ad6f568e3c'),('f504a83780ee405bb2bf2846c8185b68','客户-场地信息','','0'),('f520fda390c548ddba49850bfb323444','上传手持身份证照片','/s/saveHandImage.action','9431640a423a4c44a078b11f67f9c47e'),('f5ab4a4b9893413eb3fca5d4f07f3d16','获取客户详情','/s/getCustomer.action','9431640a423a4c44a078b11f67f9c47e'),('f5d900c6b34f4b52a5a3d38cb8b814e9','修改养殖信息（新）','/s/updateUserBreedJson.action','80a907d42ed94b208c99751ec532fb47'),('f5e4507587f84ddcbac854d7234b9088','获取部门列表','/s/listVisitDepartment.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('f8bc6c1c0b414d1688396bf04d504601','获取部门列表','/s/findDepartmentList.action','180a88d962b5473688557fc6c31f6a5b'),('f9ceed5905d64f1ea738fd132c09d006','修改养殖信息','/s/updateUserBreed.action','80a907d42ed94b208c99751ec532fb47'),('f9e1da642c334ce0883307d5d2649abf','获取养殖信息列表','/s/listVisitUserBreed.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('fa71adc229df4b0bad193db427bf4190','删除经营单位','/s/removeManageUnit.action','93af34d839e24e59943724ad6f568e3c'),('fbeb67f477d04c7bab374bc4789b3a4a','财务B轮审核不通过','/s/updateFinanceFailB.action','a9a3ef3eece0484b9c30f49703780c09'),('fbf2f0d7f79c4d13ada020d1583acb79','增加一级库存','/s/updateRepertoryAddFirst.action','cdcdefebac994aed81a9d07f30255c43'),('fd72d1bc68504736811c53bdcda300ff','上传场地证明图片','/s/uploadPlaceCertificate.action','f504a83780ee405bb2bf2846c8185b68'),('fda16981c2fd44c59d05a61711e58545','获取跟进详情','/s/getCustomerFollow.action','f204db18f3b04239b9f59936e558bdaa'),('fda6950108a14b098a652093b4482efe','获取农户列表','/s/listVisitFarmer.action','cb5aa6ebe92c4ceb8a722ac9afde57ae'),('follow','跟单审核通过','/s/updateSalesmanPass.action','e15672bda5ac4ae1bc712ce209ca35b4'),('repertory_check','同意申请','/s/updateRepertoryApplyAccept.action','4992632ef68d4fca88b118e5a5d5f943');
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
INSERT INTO `position_permission_re` VALUES ('ecc6efd7b0904b2e9ca069342ade21eb','2fcb97571ccd47fb9f2c15e5a7b6494d'),('ecc6efd7b0904b2e9ca069342ade21eb','f83b0e6783c04442b557533f37fc2681'),('74e75f325887434e9fb846509ec74c32','86dea1b0066341bab34197ebc5c0b40d'),('74e75f325887434e9fb846509ec74c32','2fcb97571ccd47fb9f2c15e5a7b6494d'),('74e75f325887434e9fb846509ec74c32','f83b0e6783c04442b557533f37fc2681'),('b07d5450f6ae448b88db7dfcdf0d1dc7','a9f8a72b6b8548049569d81db3a56c36'),('b07d5450f6ae448b88db7dfcdf0d1dc7','f83b0e6783c04442b557533f37fc2681'),('6bc47243d1a24b4ca1b2ede9cedc3374','e5fef6399c204309b2c8c51d5b2643fa'),('6bc47243d1a24b4ca1b2ede9cedc3374','a9f8a72b6b8548049569d81db3a56c36'),('6bc47243d1a24b4ca1b2ede9cedc3374','f83b0e6783c04442b557533f37fc2681'),('93bb14244c9644df9eb966f257ac0795','f21e6ceb9d334c39b668887f61026e97'),('3269998df292491889173c0e00259221','5972db999d234125a0685f4f3c82d47e'),('3269998df292491889173c0e00259221','f21e6ceb9d334c39b668887f61026e97');
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
INSERT INTO `qm_branch_goods` VALUES ('9e8d946ef94b4795bd9218795354e631','f0c3df5bdb0a45aabf22464bb27dbb88','4e3007c4db5d483bb9245743fa5c08eb',8600),('9e8d946ef94b4795bd9218795354e631','f0c3df5bdb0a45aabf22464bb27dbb88','e0841a5ee98a410c9f1fe4a786a6d6f0',8400),('0f3965187f1d4bbf963453b7a2ae0b20','f0c3df5bdb0a45aabf22464bb27dbb88','4e3007c4db5d483bb9245743fa5c08eb',400),('0f3965187f1d4bbf963453b7a2ae0b20','f0c3df5bdb0a45aabf22464bb27dbb88','e0841a5ee98a410c9f1fe4a786a6d6f0',600),('0f8ad87fcb564f358d287c39749362d4','f0c3df5bdb0a45aabf22464bb27dbb88','4e3007c4db5d483bb9245743fa5c08eb',3000),('0f8ad87fcb564f358d287c39749362d4','f0c3df5bdb0a45aabf22464bb27dbb88','e0841a5ee98a410c9f1fe4a786a6d6f0',3000),('9c5ef58ed0034a1c8dd885369ac3b97c','bae0a50f935248cfa03a0e0cbffd2dda','8e6aabae569e44ca80db3115372aa1a4',128),('0f8ad87fcb564f358d287c39749362d4','bae0a50f935248cfa03a0e0cbffd2dda','8e6aabae569e44ca80db3115372aa1a4',256);
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
INSERT INTO `qm_experience` VALUES ('d9a49a534aee42f4a101bc76979a5692','农销云','zz','13678915326','员工');
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
INSERT INTO `qm_permission_re` VALUES ('4992632ef68d4fca88b118e5a5d5f943','e5fef6399c204309b2c8c51d5b2643fa'),('repertory_check','e5fef6399c204309b2c8c51d5b2643fa'),('cd7a6b8c1a7f4b5fade2073309a43ac2','e5fef6399c204309b2c8c51d5b2643fa'),('e15672bda5ac4ae1bc712ce209ca35b4','f83b0e6783c04442b557533f37fc2681'),('2d2b7f2c4b1b4e9dbac91dc375348ba4','f83b0e6783c04442b557533f37fc2681'),('cbe84fc9eee84bdf8559ca510be3970a','f83b0e6783c04442b557533f37fc2681'),('a7b35ea834b84ced895af372ab72e5cb','f83b0e6783c04442b557533f37fc2681'),('78b8b104904a46a0b007112f09e7a5a3','f83b0e6783c04442b557533f37fc2681'),('follow','f83b0e6783c04442b557533f37fc2681'),('14b69b41768d428cad8f466019d6d426','f83b0e6783c04442b557533f37fc2681'),('c86cb881c60b46e0bbcaff33e6759324','86dea1b0066341bab34197ebc5c0b40d'),('account_check','86dea1b0066341bab34197ebc5c0b40d'),('6b2a2dd116b14b2f8474573ad7e6c848','86dea1b0066341bab34197ebc5c0b40d'),('5ef8f0c163c64944a3b077e2d8ccfe6c','86dea1b0066341bab34197ebc5c0b40d');
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
INSERT INTO `repertory_apply` VALUES ('8097616c247b4cc2b0b3862f627e7445','0f3965187f1d4bbf963453b7a2ae0b20','10001','鹤山销售点','2017-10-11 15:35:30',NULL,'9f6bc79d769342f1b90ed0b532b870f2','李思思','5a27d0f892cd48a482622f8b76fd239c','王舞欣',12,'备注',''),('9e1d7ab46f3c41a382413059ab615f4f','0f3965187f1d4bbf963453b7a2ae0b20','10001','鹤山销售点','2017-10-11 17:02:46','2017-10-11 17:02:59','9f6bc79d769342f1b90ed0b532b870f2','李思思','5a27d0f892cd48a482622f8b76fd239c','王舞欣',12,'备注',''),('dac29c84ff574042add0305a2ce1e1ef','0f3965187f1d4bbf963453b7a2ae0b20','10001','鹤山销售点','2017-10-13 16:04:22',NULL,'9f6bc79d769342f1b90ed0b532b870f2','李思思','5a27d0f892cd48a482622f8b76fd239c','王舞欣',10,'备注','201710135952');
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
INSERT INTO `repertory_apply_list` VALUES ('8097616c247b4cc2b0b3862f627e7445','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','4e3007c4db5d483bb9245743fa5c08eb','10kg/袋',200),('8097616c247b4cc2b0b3862f627e7445','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','e0841a5ee98a410c9f1fe4a786a6d6f0','20kg/袋',300),('9e1d7ab46f3c41a382413059ab615f4f','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','4e3007c4db5d483bb9245743fa5c08eb','10kg/袋',200),('9e1d7ab46f3c41a382413059ab615f4f','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','e0841a5ee98a410c9f1fe4a786a6d6f0','20kg/袋',300),('dac29c84ff574042add0305a2ce1e1ef','bae0a50f935248cfa03a0e0cbffd2dda','【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋','8e6aabae569e44ca80db3115372aa1a4','100g/袋',10);
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
INSERT INTO `repertory_income` VALUES ('4250df53561149a18c63c70d0b6262da','201710137830','10001','9e8d946ef94b4795bd9218795354e631','总经办','5a27d0f892cd48a482622f8b76fd239c','王舞欣','2017-10-13 11:48:49',''),('4b9cb81d75854f97843fcc520dea3808','201710138119','10001','0f8ad87fcb564f358d287c39749362d4','总经办','5a27d0f892cd48a482622f8b76fd239c','王舞欣','2017-10-13 14:56:27',''),('4e5a325cf3fa4adcbe4f0426a61951a3','201710132609','10001','9c5ef58ed0034a1c8dd885369ac3b97c','鹤山销售点','5a27d0f892cd48a482622f8b76fd239c','王舞欣','2017-10-13 14:53:38',''),('633089714bb74918a63377e4594dd7b6','201710136069','10001','0f8ad87fcb564f358d287c39749362d4','总经办','5a27d0f892cd48a482622f8b76fd239c','王舞欣','2017-10-13 11:49:14',''),('7d5b4d1ec70e40858db750ee5eb9707c','201710117459','10001','9e8d946ef94b4795bd9218795354e631','总经办','5a27d0f892cd48a482622f8b76fd239c','王舞欣','2017-10-11 11:59:16',''),('95601e1a99d44f4cb80c28a6ce8c1d6d','201710114704','10001','1','1','5a27d0f892cd48a482622f8b76fd239c','王舞欣','2017-10-11 11:58:01',''),('a6fda78a514c4422b9c6cba43ef3177b','201710110259','10001','9e8d946ef94b4795bd9218795354e631','总经办','5a27d0f892cd48a482622f8b76fd239c','王舞欣','2017-10-11 11:59:22','');
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
INSERT INTO `repertory_income_list` VALUES ('95601e1a99d44f4cb80c28a6ce8c1d6d','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','4e3007c4db5d483bb9245743fa5c08eb','10kg/袋',3000),('95601e1a99d44f4cb80c28a6ce8c1d6d','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','e0841a5ee98a410c9f1fe4a786a6d6f0','20kg/袋',3000),('7d5b4d1ec70e40858db750ee5eb9707c','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','4e3007c4db5d483bb9245743fa5c08eb','10kg/袋',3000),('7d5b4d1ec70e40858db750ee5eb9707c','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','e0841a5ee98a410c9f1fe4a786a6d6f0','20kg/袋',3000),('a6fda78a514c4422b9c6cba43ef3177b','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','4e3007c4db5d483bb9245743fa5c08eb','10kg/袋',3000),('a6fda78a514c4422b9c6cba43ef3177b','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','e0841a5ee98a410c9f1fe4a786a6d6f0','20kg/袋',3000),('4250df53561149a18c63c70d0b6262da','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','4e3007c4db5d483bb9245743fa5c08eb','10kg/袋',3000),('4250df53561149a18c63c70d0b6262da','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','e0841a5ee98a410c9f1fe4a786a6d6f0','20kg/袋',3000),('633089714bb74918a63377e4594dd7b6','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','4e3007c4db5d483bb9245743fa5c08eb','10kg/袋',3000),('633089714bb74918a63377e4594dd7b6','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','e0841a5ee98a410c9f1fe4a786a6d6f0','20kg/袋',3000),('4e5a325cf3fa4adcbe4f0426a61951a3','bae0a50f935248cfa03a0e0cbffd2dda','【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋','8e6aabae569e44ca80db3115372aa1a4','100g/袋',128),('4b9cb81d75854f97843fcc520dea3808','bae0a50f935248cfa03a0e0cbffd2dda','【哼哼动保】10%酸化阿莫西林可溶性粉 100g/袋','8e6aabae569e44ca80db3115372aa1a4','100g/袋',256);
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
INSERT INTO `repertory_record` VALUES ('1044c4a90b5e4c76b59fe2770212a849','201710111915','10001','f9797f0b4ecc4808b1d93dca667ea175','江门销售点','89d9317fb3834353bcf2a507bee2eb82','张三','2017-10-11 08:59:03',''),('8cc618af34f24beaa2bcfd28a1862460','201710119708','10001','9e8d946ef94b4795bd9218795354e631','总经办','89d9317fb3834353bcf2a507bee2eb82','张三','2017-10-11 09:50:59','');
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
INSERT INTO `repertory_record_list` VALUES ('6b4b8ea15f0d4f50bf47b10bd1741f17',1,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','4e3007c4db5d483bb9245743fa5c08eb','10kg/袋',100),('6b4b8ea15f0d4f50bf47b10bd1741f17',1,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','e0841a5ee98a410c9f1fe4a786a6d6f0','20kg/袋',200),('44b6befcb01c4a2692a7439283931c44',1,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','4e3007c4db5d483bb9245743fa5c08eb','10kg/袋',100),('44b6befcb01c4a2692a7439283931c44',1,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','e0841a5ee98a410c9f1fe4a786a6d6f0','20kg/袋',200),('2ab7fde0b7984f1a83578a4bde08fd0f',2,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','4e3007c4db5d483bb9245743fa5c08eb','10kg/袋',100),('2ab7fde0b7984f1a83578a4bde08fd0f',1,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','e0841a5ee98a410c9f1fe4a786a6d6f0','20kg/袋',200),('1044c4a90b5e4c76b59fe2770212a849',1,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','4e3007c4db5d483bb9245743fa5c08eb','10kg/袋',100),('1044c4a90b5e4c76b59fe2770212a849',2,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','e0841a5ee98a410c9f1fe4a786a6d6f0','20kg/袋',200),('8cc618af34f24beaa2bcfd28a1862460',1,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','4e3007c4db5d483bb9245743fa5c08eb','10kg/袋',1000),('8cc618af34f24beaa2bcfd28a1862460',1,'正常处理','f0c3df5bdb0a45aabf22464bb27dbb88','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','e0841a5ee98a410c9f1fe4a786a6d6f0','20kg/袋',2000);
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
INSERT INTO `shopping_cart` VALUES ('89d9317fb3834353bcf2a507bee2eb82','22a91981f71a43e7a8c34472bc7cc1c6','1f9b286b836c4175ab09a9b02cacbb7d',4,'2017-08-28 16:42:53');
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
INSERT INTO `sys_permission` VALUES ('04524cd9bb014ad2a5ac2488df842f26','获取用户列表','/user/list.action','获取管理系统用户列表'),('04bb46e5de5e4bd1b7e46650b3fd3c4a','修改用户','/user/update.action','修改管理系统用户'),('09dba6832eda4dca9a07952f0891a834','添加类目信息','/breed/info/save.action','添加类目信息'),('0b4bb4ec8d1f4d23b4cb2b286966b667','修改青麦权限','/qm/permission/update.action','修改青麦权限'),('0ede55e3b2d148e186b09f5419efe0e8','添加权限','/permission/save.action','添加权限'),('0f22a5546a794b998d42b1e994c92101','添加商品类目','/goods/type/save.action','添加商品类目'),('10bcdfb847fa4592a36766400c0e059c','获取类目选项详情','/breed/select/get.action','获取类目选项详情'),('13de6d6db252417f8270467485c535f8','获取角色详情','/role/get.action','获取角色详情'),('151c37db08994e17aeba2a4352de7331','添加类目选项','/breed/select/save.action','添加类目选项'),('1eddcf39eb1d40d6a5d15e768aba15bb','获取青麦权限列表(树形结构)','/qm/permission/tree.action','获取青麦权限列表(树形结构)'),('2136a7b67d4444b8b971af61c3f8dbb7','拒绝建账申请','/customer/account/updateRefuse.action','拒绝建账申请'),('21d758848934417098f06712f4576962','分配用户角色','/user/updateRole.action','为管理系统用户分配角色'),('277bac6e1e694749a0de6f94cda592ee','获取商品类目列表','/goods/type/list.action','获取商品类目列表'),('278d36a20f86418f83ff10ecb936c842','获取青麦权限详情','/qm/permission/get.action','获取青麦权限详情'),('2bd2494fa32d4e13a354999caf95b7c9','获取商品类目详情','/goods/type/get.action','获取商品类目详情'),('2ea5d11f82fb4acc93984c03c43771ac','获取青麦角色详情','/qm/role/get.action','获取青麦角色详情'),('3545d403b9fa49eeb96daddaf6893d53','获取用户详情','/user/get.action','获取管理系统用户详情'),('36134642493444f2b0e9688d77120957','添加养殖类目','/breed/save.action','添加养殖类目'),('3c7d7535d81544cf90daf2e04a625330','修改角色','/role/update.action','修改角色'),('3cd516b590f44486afa0548a711a3eff','修改客户','/customer/update.action','修改客户'),('3d6857b2144d48ebaf2f9da9983502f1','获取养殖类目列表','/breed/list.action','获取养殖类目列表'),('41a347632e6040ea9e63fc403356d1b9','修改养殖类目','/breed/update.action','修改养殖类目'),('44c9a70bf90048368f6c3488f5e9328f','删除客户','/customer/remove.action','删除客户'),('47f1899e2b1c43b3873e2db979491467','添加青麦角色','/qm/role/save.action','添加青麦角色'),('540fece018e04e23ad9963f5e8a23aa8','修改权限','/permission/update.action','修改权限'),('5e88a0848713449fa3997081ba814093','获取类目选项列表','/breed/select/list.action','获取类目选项列表'),('6a1336ac0c5b48e7b1076b931935d774','添加客户','/customer/save.action','添加客户'),('6c5715c8d8e94ee2a295147e92c91b54','修改密码','/password/update.action','修改当前用户密码'),('715ecfda0de74adf941b58f58eaf832f','删除用户','/user/remove.action','删除管理系统用户'),('7506f51b41f84328919da28fb0fa4a4f','获取类目信息列表','/breed/info/list.action','获取类目信息列表'),('7642bccc89104053acec00b62d4bb096','修改类目选项','/breed/select/update.action','修改类目选项'),('798a71a5729841f4a5b40b8187868df3','添加青麦权限','/qm/permission/save.action','添加青麦权限'),('803249bf57924ae6b784b1a758e5c765','获取客户详情','/customer/get.action','获取客户详情'),('886c3a890fd94afd87fd9b690100a5be','添加用户','/user/save.action','添加管理系统用户'),('90452e97a07e4ed6a6a2d8df9505efd1','获取客户列表','/customer/list.action','获取客户列表'),('9b05e2cac7bd495ebd578e43b1b384c9','同意建账申请','/customer/account/updateAccept.action','同意建账申请'),('9e90f2deb652440ca2ec4333bdcc004a','获取青麦角色列表','/qm/role/list.action','获取青麦角色列表'),('a565948333dd43fabb115496a43b9c63','删除青麦角色','/qm/role/remove.action','删除青麦角色'),('a5749f039cdd4476aab367d5bd596db3','删除类目选项','/breed/select/remove.action','删除类目选项'),('a6898173858242e18b339c08ad992a3e','发起建账申请','/customer/account/save.action','发起建账申请'),('aab8329b4413492aa886323b16dbff9d','申请人获取建账申请列表','/customer/account/listByProposer.action','申请人获取建账申请列表'),('ab4b5469c96c4175a84be1820dfc6810','为角色分配权限','/role/updatePermission.action','为角色分配权限'),('aea0e457dba5454d8329a2e74d95f9cd','删除商品类目','/goods/type/remove.action','删除商品类目'),('b428a4563f234a5fbb1e546b16e481c8','获取角色列表','/role/list.action','获取角色列表'),('bc7c10d04e6b405cb20b1cdd8329f012','修改商品类目','/goods/type/update.action','修改商品类目'),('bcf583cf00354675ac746bb3d7f7941e','审批人获取建账申请列表','/customer/account/listByApprove.action','审批人获取建账申请列表'),('c144e6c34274474ab6cd220b46ef57a5','删除角色','/role/remove.action','删除角色'),('d4ed8ffd0194493cb3e1c49068e1eb0f','为青麦角色分配权限','/qm/role/updatePermission.action','为青麦角色分配权限'),('dd746f116bf14d578ae316b191c10155','删除权限','/permission/remove.action','删除权限'),('df66c381adc948b18d4a17776917585a','获取养殖类目详情','/breed/get.action','获取养殖类目详情'),('e68e8531cc5f4c8fb6d2fb2e5df01d16','获取类目信息详情','/breed/info/get.action','获取类目信息详情'),('eaa70bbc95464dc2b58217989559bf6c','删除养殖类目','/breed/remove.action','删除养殖类目'),('eb6d52bebc0340f6aa3812b3179a0b52','删除青麦权限','/qm/permission/remove.action','删除青麦权限'),('ebfad1d662f34157bdae30bfa2ba711a','获取商品类目列表(树形结构)','/goods/type/tree.action','获取商品类目列表(树形结构)'),('ec7fd292e2184537b93982d09fc60f95','获取权限详情','/permission/get.action','获取权限详情'),('f0141be7c4ab49cb89cd36476b67e59c','获取权限列表','/permission/list.action','获取权限列表'),('f52f610ab0ea42979d891822b47cf9a5','修改青麦角色','/qm/role/update.action','修改青麦角色'),('f5d8cc6501124f5db96430de86a9bf58','修改类目信息','/breed/info/update.action','修改类目信息'),('f620697b12354014a0de6014be601381','添加角色','/role/save.action','添加角色'),('f6a0e211c2184a088995ec1a6c0be9f4','获取青麦权限列表','/qm/permission/list.action','获取青麦权限列表'),('f8fb9d12ba8d4b3c974fd468c8b293f1','删除类目信息','/breed/info/remove.action','删除类目信息');
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
INSERT INTO `sys_role` VALUES ('b03407084ffe4f05b04d80992e5a7362','游客','没有任何权限'),('super','超级管理员','拥有所有权限');
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
INSERT INTO `sys_role_permission_re` VALUES ('b03407084ffe4f05b04d80992e5a7362','8821044b28b040e5972167e53704da9e'),('super','df66c381adc948b18d4a17776917585a'),('super','e68e8531cc5f4c8fb6d2fb2e5df01d16'),('super','7506f51b41f84328919da28fb0fa4a4f'),('super','f8fb9d12ba8d4b3c974fd468c8b293f1'),('super','09dba6832eda4dca9a07952f0891a834'),('super','f5d8cc6501124f5db96430de86a9bf58'),('super','3d6857b2144d48ebaf2f9da9983502f1'),('super','eaa70bbc95464dc2b58217989559bf6c'),('super','36134642493444f2b0e9688d77120957'),('super','10bcdfb847fa4592a36766400c0e059c'),('super','5e88a0848713449fa3997081ba814093'),('super','a5749f039cdd4476aab367d5bd596db3'),('super','151c37db08994e17aeba2a4352de7331'),('super','7642bccc89104053acec00b62d4bb096'),('super','41a347632e6040ea9e63fc403356d1b9'),('super','bcf583cf00354675ac746bb3d7f7941e'),('super','aab8329b4413492aa886323b16dbff9d'),('super','a6898173858242e18b339c08ad992a3e'),('super','9b05e2cac7bd495ebd578e43b1b384c9'),('super','2136a7b67d4444b8b971af61c3f8dbb7'),('super','803249bf57924ae6b784b1a758e5c765'),('super','90452e97a07e4ed6a6a2d8df9505efd1'),('super','44c9a70bf90048368f6c3488f5e9328f'),('super','6a1336ac0c5b48e7b1076b931935d774'),('super','3cd516b590f44486afa0548a711a3eff'),('super','2bd2494fa32d4e13a354999caf95b7c9'),('super','277bac6e1e694749a0de6f94cda592ee'),('super','aea0e457dba5454d8329a2e74d95f9cd'),('super','0f22a5546a794b998d42b1e994c92101'),('super','ebfad1d662f34157bdae30bfa2ba711a'),('super','bc7c10d04e6b405cb20b1cdd8329f012'),('super','6c5715c8d8e94ee2a295147e92c91b54'),('super','ec7fd292e2184537b93982d09fc60f95'),('super','f0141be7c4ab49cb89cd36476b67e59c'),('super','dd746f116bf14d578ae316b191c10155'),('super','0ede55e3b2d148e186b09f5419efe0e8'),('super','540fece018e04e23ad9963f5e8a23aa8'),('super','278d36a20f86418f83ff10ecb936c842'),('super','f6a0e211c2184a088995ec1a6c0be9f4'),('super','eb6d52bebc0340f6aa3812b3179a0b52'),('super','798a71a5729841f4a5b40b8187868df3'),('super','1eddcf39eb1d40d6a5d15e768aba15bb'),('super','0b4bb4ec8d1f4d23b4cb2b286966b667'),('super','2ea5d11f82fb4acc93984c03c43771ac'),('super','9e90f2deb652440ca2ec4333bdcc004a'),('super','a565948333dd43fabb115496a43b9c63'),('super','47f1899e2b1c43b3873e2db979491467'),('super','f52f610ab0ea42979d891822b47cf9a5'),('super','d4ed8ffd0194493cb3e1c49068e1eb0f'),('super','13de6d6db252417f8270467485c535f8'),('super','b428a4563f234a5fbb1e546b16e481c8'),('super','c144e6c34274474ab6cd220b46ef57a5'),('super','f620697b12354014a0de6014be601381'),('super','3c7d7535d81544cf90daf2e04a625330'),('super','ab4b5469c96c4175a84be1820dfc6810'),('super','3545d403b9fa49eeb96daddaf6893d53'),('super','04524cd9bb014ad2a5ac2488df842f26'),('super','715ecfda0de74adf941b58f58eaf832f'),('super','886c3a890fd94afd87fd9b690100a5be'),('super','04bb46e5de5e4bd1b7e46650b3fd3c4a'),('super','21d758848934417098f06712f4576962');
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
INSERT INTO `sys_user` VALUES ('5198012fab4d45be806393acaded43ae','五五','028e3d0cd6cfd733ef80f9add34e39a8','13677889900','7fe99fc8a21945d99bbcbb5a82f325311505357479166'),('69d7651031804f25bafb71b7d0d67562','三三','028e3d0cd6cfd733ef80f9add34e39a8','13733336666','676595dbfd0c494e855dd82a2358b6ff1505360551486');
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
INSERT INTO `sys_user_role_re` VALUES ('b03407084ffe4f05b04d80992e5a7362','69d7651031804f25bafb71b7d0d67562'),('super','5198012fab4d45be806393acaded43ae');
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
INSERT INTO `team_department` VALUES ('4bc0ec2d68a444e7a584b9f8d03cbc44','后勤部','',NULL,'0','2017-10-10 00:00:00','10001'),('5a20e0ea32b948c08c928995b26af64e','业务部','',NULL,'0','2017-10-04 00:00:00','10001'),('9e8d946ef94b4795bd9218795354e631','总经办','manager',NULL,'0','2017-10-10 09:36:10','10001'),('dc89587b44ff4652b44f81da12589175','财务部','',NULL,'0','2017-10-10 00:00:00','10001');
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
INSERT INTO `user` VALUES ('03ef5797bae2466699d5efc970a8962f','10001','5a20e0ea32b948c08c928995b26af64e',1003,'李四','825682eafec59c2e1632828195133a52','男','13311112222',NULL,'','','','2017-10-10 10:41:36','2017-10-10 11:06:22','u_st_2','','','','','acbb4ca124d743479f8aa68af04c91561507604181998',0,NULL,'101010101010101010','','2017-10-10 10:41:36','','',NULL,'ecc6efd7b0904b2e9ca069342ade21eb',2,''),('0420cb22c06b43a488c39967779eecec','10001','4bc0ec2d68a444e7a584b9f8d03cbc44',1003,'王五','825682eafec59c2e1632828195133a52','男','13211112222',NULL,'','','','2017-10-10 10:44:30','2017-10-10 10:44:30','u_st_2','','','','','619a3ebdb0c941958dfade8850c0600f1507604189530',0,NULL,'101010101020202020','','2017-10-10 10:44:30','','',NULL,'b07d5450f6ae448b88db7dfcdf0d1dc7',2,''),('528832fa9cc54d0290f6ee2922b27256','10001','dc89587b44ff4652b44f81da12589175',1003,'赵柳燕','825682eafec59c2e1632828195133a52','女','13511113333',NULL,'','','','2017-10-10 10:47:40','2017-10-10 10:47:40','u_st_2','','','','','0192d7c13cee431db91ff50befa70dd81507604195354',0,NULL,'101010101020202020','','2017-10-10 10:47:40','','',NULL,'93bb14244c9644df9eb966f257ac0795',2,''),('5a27d0f892cd48a482622f8b76fd239c','10001','4bc0ec2d68a444e7a584b9f8d03cbc44',1003,'王舞欣','825682eafec59c2e1632828195133a52','女','13211113333',NULL,'','','','2017-10-10 10:45:43','2017-10-10 10:45:43','u_st_2','','','','','afc5f8d65cf440a1b58a5f2295361fa01507604201402',0,NULL,'101010101020202020','','2017-10-10 10:45:43','','',NULL,'6bc47243d1a24b4ca1b2ede9cedc3374',2,''),('89d9317fb3834353bcf2a507bee2eb82','10001','9e8d946ef94b4795bd9218795354e631',1002,'张三','825682eafec59c2e1632828195133a52','男','13688888888',NULL,'','','','2017-10-10 09:36:10','2017-10-10 11:06:07','u_st_2','','','','','da8990b107b84cf980035927cce112721507599537351',0,NULL,'000000000000000000','','2017-10-10 09:36:10',NULL,NULL,NULL,'67c9a3c744e84905b125707785354396',2,''),('9f6bc79d769342f1b90ed0b532b870f2','10001','5a20e0ea32b948c08c928995b26af64e',1003,'李思思','825682eafec59c2e1632828195133a52','女','13311113333',NULL,'','','','2017-10-10 10:42:00','2017-10-10 10:42:00','u_st_2','','','','','c918451b778c44dc8ffcf7b7f6bb65621507604205889',0,NULL,'101010101010101010','','2017-10-10 10:42:00','','',NULL,'74e75f325887434e9fb846509ec74c32',2,''),('bed87f05893440698bf6d01028ea7c6a','10001','dc89587b44ff4652b44f81da12589175',1003,'赵六','825682eafec59c2e1632828195133a52','男','13511112222',NULL,'','','','2017-10-10 10:47:04','2017-10-10 10:47:04','u_st_2','','','','','f3ca7be273dc4184b8361755138eacf81507604211063',0,NULL,'101010101020202020','','2017-10-10 10:47:04','','',NULL,'3269998df292491889173c0e00259221',2,''),('d88e28c3a0e6429f9f1d03ad99fabc61','10001','',1001,'jackson','','男','13677779999','2017-10-06','','','','2017-10-12 14:51:10','2017-10-12 14:51:09','u_st_0','','','123','','',0,NULL,'','','2017-10-12 14:51:09','','','','',2,'');
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
INSERT INTO `user_record` VALUES ('688642d3858d4bab869aff28fa2de52d','10001','',1001,'jackson','','','13677779999',NULL,'','','','2017-10-12 15:07:29','2017-10-12 15:07:28','u_st_0','','','','','',0,NULL,'','','2017-10-12 15:07:28','','','','',2,''),('0e9382da6acc486a9d3d2e0d453ae4f8','10001','',1001,'经销商','','','13254547481',NULL,'','','','2017-10-13 09:00:59','2017-10-13 09:00:58','u_st_0','','','','','',0,NULL,'','','2017-10-13 09:00:58','','','','',2,'');
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

-- Dump completed on 2017-10-13 18:39:13
