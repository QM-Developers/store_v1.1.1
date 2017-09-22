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
INSERT INTO `customer` VALUES ('c1e0c28313ee42a38e06e25233619369','cooperation','b970431e6dc543a285ca4fedcd64cb3a','89d9317fb3834353bcf2a507bee2eb83','','10001','','',0,1,'2017-09-20 17:34:20',3);
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
INSERT INTO `customer_account_request` VALUES ('929ca76f1b1e43ef8d6fba1ac86a0066','89d9317fb3834353bcf2a507bee2eb82','张三','21e7e3bcab354cfc8aae9ed21162d5a6','三三','89d9317fb3834353bcf2a507bee2eb82','张三','89d9317fb3834353bcf2a507bee2eb82','张三',1,'2017-09-20 17:17:07','loginInfo'),('e0fc8ae5811648b89732d9fdf87d664f','89d9317fb3834353bcf2a507bee2eb82','张三','c1e0c28313ee42a38e06e25233619369','三三','89d9317fb3834353bcf2a507bee2eb82','张三','89d9317fb3834353bcf2a507bee2eb82','张三',2,'2017-09-20 17:20:44','loginInfo');
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
INSERT INTO `customer_follow` VALUES ('8585b717d27340d186a3424f251e33b0','2017-07-07 00:00:00','content','result','1ddd3d18c22a4c129c2517d50e69a400','三三','89d9317fb3834353bcf2a507bee2eb82','张三');
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
INSERT INTO `department_position` VALUES ('0639017716fc4f9a8e4174ad511e835d','负责人','624455c24e9744e8a3d6ef801b935d11'),('10ee280645824abb8fefa03d098c5652','负责人','47f0a0a4c639488b8772c4e51219ad02'),('2efe486f522e4460a61093996f95a282','负责人','4bb875fc900047bca61c4b1f15ecc78f'),('46f4d1bb405c4d95bffcf115c1a79e02','负责人','92da6064f89047cb84406c8859fc407d'),('4ab78dfe8e8b4d4295355f41357d2b96','成员','47f0a0a4c639488b8772c4e51219ad02'),('4ae60c74c30143feb898d721a1299dd7','负责人','6256feb92d844cd5951d7cfe01d922ed'),('6192971fdd4d47d2b4ce77a3723a311b','负责人','27a9c57b4c69441aa569ef4ae1a9ef7c'),('6d163a17a8b842dd98de4b059b893664','成员','6256feb92d844cd5951d7cfe01d922ed'),('6d163a17a8b842dd98de4b059b893666','负责人','27a9c57b4c69441aa569ef4ae1a9ef7d'),('da1f6e509bdb43cd93e2bb4c7cbaa0e5','成员','27a9c57b4c69441aa569ef4ae1a9ef7c');
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
INSERT INTO `goods_image` VALUES ('9c3ed28bb39e4b079f548e69a3681cba','7f919e4356a44fe8a199dde18d561cbc','0',1),('9c3ed28bb39e4b079f548e69a3681cba','bc13439ff4384bcab77d93911ce783f6','1',2),('22a91981f71a43e7a8c34472bc7cc1c6','7f919e4356a44fe8a199dde18d561cbc','0',1),('22a91981f71a43e7a8c34472bc7cc1c6','bc13439ff4384bcab77d93911ce783f6','1',2),('d94c07686d0b4483bccd3c0066c46c1f','7f919e4356a44fe8a199dde18d561cbc','0',1),('d94c07686d0b4483bccd3c0066c46c1f','bc13439ff4384bcab77d93911ce783f6','1',2),('457c81e4dda3487187bab10eda5355ed','7f919e4356a44fe8a199dde18d561cbc','0',1),('457c81e4dda3487187bab10eda5355ed','bc13439ff4384bcab77d93911ce783f6','1',2),('534d6156325a4c1a89510ddc0b5bcbeb','7f919e4356a44fe8a199dde18d561cbc','0',1),('534d6156325a4c1a89510ddc0b5bcbeb','bc13439ff4384bcab77d93911ce783f6','1',2),('91a39e42fb614f13bfca0d419f8f3f5c','7f919e4356a44fe8a199dde18d561cbc','0',1),('91a39e42fb614f13bfca0d419f8f3f5c','bc13439ff4384bcab77d93911ce783f6','1',2),('d661c8d99dc74f2ab32419a96e156833','7f919e4356a44fe8a199dde18d561cbc','0',1),('d661c8d99dc74f2ab32419a96e156833','bc13439ff4384bcab77d93911ce783f6','1',2),('e4d8553d166045d792f37f8f837b4024','7f919e4356a44fe8a199dde18d561cbc','0',1),('e4d8553d166045d792f37f8f837b4024','bc13439ff4384bcab77d93911ce783f6','1',2),('f8b24567adfc48cf82f617822a63c628','7f919e4356a44fe8a199dde18d561cbc','0',1),('f8b24567adfc48cf82f617822a63c628','bc13439ff4384bcab77d93911ce783f6','1',2),('db073ab0dc5c4b719deaa1b8705327d2','7f919e4356a44fe8a199dde18d561cbc','0',1),('db073ab0dc5c4b719deaa1b8705327d2','bc13439ff4384bcab77d93911ce783f6','1',2),('01402a4e26d14f1dbe5135ef69b6b385','7f919e4356a44fe8a199dde18d561cbc','0',1),('01402a4e26d14f1dbe5135ef69b6b385','bc13439ff4384bcab77d93911ce783f6','1',2),('01402a4e26d14f1dbe5135ef69b6b385','bc13439ff4384bcab77d93911ce783f6','2',2),('01402a4e26d14f1dbe5135ef69b6b385','df85119137904e93895d8c76e06b1924','3',2),('211de7c120a94e8d923a1032e363275e','7f919e4356a44fe8a199dde18d561cbc','0',1),('211de7c120a94e8d923a1032e363275e','bc13439ff4384bcab77d93911ce783f6','1',2),('211de7c120a94e8d923a1032e363275e','df85119137904e93895d8c76e06b1924','2',2),('211de7c120a94e8d923a1032e363275e','7f919e4356a44fe8a199dde18d561cbc','3',2),('211de7c120a94e8d923a1032e363275e','bc13439ff4384bcab77d93911ce783f6','4',2);
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
INSERT INTO `goods_standard` VALUES ('0b4bff177fa145098f83aef5422377db','d661c8d99dc74f2ab32419a96e156833','23',2,3,41),('1f9b286b836c4175ab09a9b02cacbb7d','22a91981f71a43e7a8c34472bc7cc1c6','小包',5,47,30),('41beb4180ebe42a3bef04a85d32df9bb','d94c07686d0b4483bccd3c0066c46c1f','23',2,5,41),('44a91ec5692442d28ac752b066cafa03','22a91981f71a43e7a8c34472bc7cc1c6','大包',10,100,60),('5f4810d815ff4042a0fe80e11b74313f','e4d8553d166045d792f37f8f837b4024','23',2,5,41),('7b073f443ad7449f931fc01d11517dac','211de7c120a94e8d923a1032e363275e','23',2,11,41),('9190f4574805419187a8029042803617','9c3ed28bb39e4b079f548e69a3681cba','大包',10,95,60),('91bf66bdc4dd424f90a7e22295695881','534d6156325a4c1a89510ddc0b5bcbeb','23',2,5,41),('9382b49b2d864760bda8cb2e66891259','f8b24567adfc48cf82f617822a63c628','23',2,5,41),('97be34802bda49f6b4ee2c200ee3a16a','9c3ed28bb39e4b079f548e69a3681cba','小包',5,200,30),('9df9355a73de40d594826f745cf345ab','457c81e4dda3487187bab10eda5355ed','23',2,5,41),('ac36dcfd049a4748936617a0e8f083b2','91a39e42fb614f13bfca0d419f8f3f5c','23',2,5,41),('ea59e23aa08d4a9c8856c6d825634e18','db073ab0dc5c4b719deaa1b8705327d2','23',2,5,41),('f46b125006204687b18ca8f7ecbee87e','01402a4e26d14f1dbe5135ef69b6b385','23',2,5,41);
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
  `delete_date` datetime DEFAULT NULL,
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
INSERT INTO `goodsinfo` VALUES ('01402a4e26d14f1dbe5135ef69b6b385','1fb7c7f35d5d495d8f37a26ef73701d5','10001','','【畅消】4%中猪预混料 长势快 后劲强 适用于30~90KG',0,0,'品牌?新希望六和','bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|',NULL,0,0,'2017-08-11 09:51:03',0,NULL),('211de7c120a94e8d923a1032e363275e','1fb7c7f35d5d495d8f37a26ef73701d5','10001','','【畅1消】4%中猪预混料 长势快 后劲强 适用于30~90KG',0,0,'品牌?新希望六和','bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|',NULL,0,0,'2017-08-11 09:51:02',0,NULL),('22a91981f71a43e7a8c34472bc7cc1c6','0b49ef854bb74ff9b9317132dba053d7','10001','','倍润828B,20%生长育肥猪浓缩饲料 使用阶段：60kg-出栏',0,0,'品牌?倍润','7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|',NULL,0,0,'2017-07-18 14:22:21',0,NULL),('457c81e4dda3487187bab10eda5355ed','1fb7c7f35d5d495d8f37a26ef73701d5','10001','','【畅消】4%中猪预混料 长势快 后劲强 适用于30~90KG',0,0,'品牌?新希望六和','bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|',NULL,0,0,'2017-08-11 09:51:02',0,NULL),('534d6156325a4c1a89510ddc0b5bcbeb','1fb7c7f35d5d495d8f37a26ef73701d5','10001','','【畅消】4%中猪预混料 长势快 后劲强 适用于30~90KG',0,0,'品牌?新希望六和','bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|',NULL,0,0,'2017-08-11 09:51:02',0,NULL),('91a39e42fb614f13bfca0d419f8f3f5c','1fb7c7f35d5d495d8f37a26ef73701d5','10001','','【畅消】4%中猪预混料 长势快 后劲强 适用于30~90KG',0,0,'品牌?新希望六和','bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|',NULL,0,0,'2017-08-11 09:51:02',0,NULL),('9c3ed28bb39e4b079f548e69a3681cba','0b49ef854bb74ff9b9317132dba053d7','10001','','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG',0,0,'品牌?新希望六和','7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|',NULL,0,0,'2017-07-18 14:21:26',0,NULL),('d661c8d99dc74f2ab32419a96e156833','1fb7c7f35d5d495d8f37a26ef73701d5','10001','','【畅消】4%中猪预混料 长势快 后劲强 适用于30~90KG',0,0,'品牌?新希望六和','bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|',NULL,0,0,'2017-08-11 09:51:03',0,NULL),('d94c07686d0b4483bccd3c0066c46c1f','1fb7c7f35d5d495d8f37a26ef73701d5','10001','','【畅消】4%中猪预混料 长势快 后劲强 适用于30~90KG',0,0,'品牌?新希望六和','bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|',NULL,0,0,'2017-08-11 09:51:02',0,NULL),('db073ab0dc5c4b719deaa1b8705327d2','1fb7c7f35d5d495d8f37a26ef73701d5','10001','','【畅消】4%中猪预混料 长势快 后劲强 适用于30~90KG',0,0,'品牌?新希望六和','bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|',NULL,0,0,'2017-08-11 09:51:03',0,NULL),('e4d8553d166045d792f37f8f837b4024','1fb7c7f35d5d495d8f37a26ef73701d5','10001','','【畅消】4%中猪预混料 长势快 后劲强 适用于30~90KG',0,0,'品牌?新希望六和','bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|',NULL,0,0,'2017-08-11 09:51:03',0,NULL),('f8b24567adfc48cf82f617822a63c628','1fb7c7f35d5d495d8f37a26ef73701d5','10001','','【畅消】4%中猪预混料 长势快 后劲强 适用于30~90KG',0,0,'品牌?新希望六和','bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|',NULL,0,0,'2017-08-11 09:51:03',0,NULL);
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
INSERT INTO `image_space` VALUES ('7f919e4356a44fe8a199dde18d561cbc','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/a22f4e8ce09c43d58b1690058e439d80.jpg'),('bc13439ff4384bcab77d93911ce783f6','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/c61467dcc89848c2aab2c13f1aa0fdce.jpg'),('df85119137904e93895d8c76e06b1924','10001','/upload/img/user/space/89d9317fb3834353bcf2a507bee2eb82/a174c63eb79e40dd9044e95f68283abe.png');
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
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_order`
--

LOCK TABLES `my_order` WRITE;
/*!40000 ALTER TABLE `my_order` DISABLE KEYS */;
INSERT INTO `my_order` VALUES ('05e2245e9add45a9913a7b5a0d8f13ac',100,NULL,'89d9317fb3834353bcf2a507bee2eb82','张三','','',NULL,1,10,112,'1','','2017-09-21 16:14:06',NULL,NULL,'69741360'),('2068d11cf4944fce8b38eb3cca9410bf',100,NULL,'3440e2c15478425298edb4c396c786d4','三三','','',NULL,1,10,112,'1','','2017-08-29 15:33:41',NULL,NULL,''),('bc067d54b30447799c8f2d45d0bd0ddd',100,NULL,'89d9317fb3834353bcf2a507bee2eb82','张三','','',NULL,1,10,112,'1','','2017-09-21 15:21:11',NULL,NULL,'36177331');
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
INSERT INTO `my_order_list` VALUES ('2068d11cf4944fce8b38eb3cca9410bf','1f9b286b836c4175ab09a9b02cacbb7d','倍润828B,20%生长育肥猪浓缩饲料 使用阶段：60kg-出栏',5,'7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|','7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|','小包',3,0),('2068d11cf4944fce8b38eb3cca9410bf','9190f4574805419187a8029042803617','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG',10,'7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|','7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|','大包',30,0),('12794be14f4e41a0a95ccd18d333fde2','1f9b286b836c4175ab09a9b02cacbb7d','倍润828B,20%生长育肥猪浓缩饲料 使用阶段：60kg-出栏',5,'7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|','7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|','小包',30,0),('12794be14f4e41a0a95ccd18d333fde2','44a91ec5692442d28ac752b066cafa03','倍润828B,20%生长育肥猪浓缩饲料 使用阶段：60kg-出栏',10,'7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|','7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|','大包',50,0),('ceec28042d61435389b17967a92533cc','1f9b286b836c4175ab09a9b02cacbb7d','倍润828B,20%生长育肥猪浓缩饲料 使用阶段：60kg-出栏',5,'7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|','7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|','小包',30,0),('ceec28042d61435389b17967a92533cc','44a91ec5692442d28ac752b066cafa03','倍润828B,20%生长育肥猪浓缩饲料 使用阶段：60kg-出栏',10,'7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|','7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|','大包',50,0),('bc067d54b30447799c8f2d45d0bd0ddd','1f9b286b836c4175ab09a9b02cacbb7d','倍润828B,20%生长育肥猪浓缩饲料 使用阶段：60kg-出栏',5,'7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|','7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|','小包',30,0),('bc067d54b30447799c8f2d45d0bd0ddd','44a91ec5692442d28ac752b066cafa03','倍润828B,20%生长育肥猪浓缩饲料 使用阶段：60kg-出栏',10,'7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|','7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|','大包',50,0),('05e2245e9add45a9913a7b5a0d8f13ac','1f9b286b836c4175ab09a9b02cacbb7d','倍润828B,20%生长育肥猪浓缩饲料 使用阶段：60kg-出栏',5,'7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|','7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|','小包',30,0),('05e2245e9add45a9913a7b5a0d8f13ac','44a91ec5692442d28ac752b066cafa03','倍润828B,20%生长育肥猪浓缩饲料 使用阶段：60kg-出栏',10,'7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|','7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|','大包',50,0);
/*!40000 ALTER TABLE `my_order_list` ENABLE KEYS */;
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
INSERT INTO `my_team` VALUES ('10000','中国电信','2017-09-20 00:00:00','华美洗车','广东省江门市鹤山市鹤山汽车总站',0,1,'','0','22.755718,112.970431'),('10001','青麦科技','2017-06-14 10:38:11','','',0,1,'','0','39.939224,116.427612'),('10010','中国联通','2017-09-14 00:00:00','','',0,1,'','0',''),('10086','中国移动通信','2017-01-10 00:00:00','','',0,1,'','0','');
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
  `sort` varchar(2) NOT NULL DEFAULT '',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `delete_date` date DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES ('02c7c19e61854187843ac48e15ca95c5','获取商品描述','/s/findGoodsDescribe','54c4898239e043919e819adfdfbdd81d','',0,NULL),('05bd0a87ad674dc8b1b56938a7435695','财务B轮审核通过','/s/updateFinancePassB','7469ac7aa0c74a89968d796402c0a9d5','',0,NULL),('076c74f7c6dc498fb60a06794149f4c9','登陆','/s/login','e18deaf2c23f457286835b6fd75ba66c','',0,NULL),('08c881676ac840e893de288377790332','添加农户','/s/saveFarmer','1e9e6431f6424cf79975a6b03c0aa9a8','',0,NULL),('08f613c3481147b49b9ea7623a9513c8','获取运费模板列表','/s/listFreightTemp','e4fe8b6bed394dd790c12e2184e4f969','',0,NULL),('0ec459ad4cfd4d2b8ec0f713d9cc1d06','查看销售点库存','/s/listBranchGoods','70a87b2252074e48a10afa6e3577f891','',0,NULL),('1142af8e601041f19e5cf37d0b01f84c','获取部门列表','/s/findDepartmentList','3a7e0fe4a7c944ed8ee1742f057f5a9a','',0,NULL),('122072cf9cbd4835b4f823440956f861','上传身份证正面照片','/s/saveFrontImage','a88eea4db94b42b7bb2a59ffc2ff2074','',0,NULL),('13c67aad6d0a47ada52d000acc79cff9','发起申请','/s/saveRepertoryApply','8d12acdc34b747b2a7a2c1abfc9efb70','',0,NULL),('146a65d3dbbc4415b2a3fac695fae47f','审批人获取申请列表','/s/listCommonApplyByApprove','95477a89ef91482aae80313e2313f0b6','',0,NULL),('153b7377619b437e95a183781ed6d0f7','获取部门职位列表','/s/findPositionList','e18deaf2c23f457286835b6fd75ba66c','',0,NULL),('15a91680b96b41cdab567c6080bdcdf8','申请客户建账','/s/saveCustomerAccount','a88eea4db94b42b7bb2a59ffc2ff2074','',0,NULL),('1938053cc6a94ed381d0040dfe28627b','获取商品类型以及父类型','/s/findTypeAndParents','54c4898239e043919e819adfdfbdd81d','',0,NULL),('1c81c18a11e347bb82a4210d83388108','业务筛选订单','/s/listSalesOrderSelective','7469ac7aa0c74a89968d796402c0a9d5','',0,NULL),('1d311b85af5847049922c284bc9fedc3','更新销售点商品','/s/updateBranchGoods','c91dcea97f3f4130b11f47f9d84788b8','',0,NULL),('1e9e6431f6424cf79975a6b03c0aa9a8','农户','','0','',0,NULL),('219f41ed79fb4cb2a23f6daf7b1b171e','修改经营单位','/s/updateManageUnit','4fc3de5e194e457488870efd998deb36','',0,NULL),('21e0c6287c9b49ef8e581009d81ab0e8','更新运费模板','/s/updateFreightTemp','e4fe8b6bed394dd790c12e2184e4f969','',0,NULL),('24ccc3048fe744789bb125b95153b79b','获取客户列表','/s/listCustomer','a88eea4db94b42b7bb2a59ffc2ff2074','',0,NULL),('25a843ae72504e168dc9c8cc76107e18','拒绝客户建账','/s/updateCustomerAccountRefuse','a88eea4db94b42b7bb2a59ffc2ff2074','',0,NULL),('2c04b12f15424c0b8ca317fcf7ca7cc0','更新农户信息','/s/updateFarmer','1e9e6431f6424cf79975a6b03c0aa9a8','',0,NULL),('2cba97b7a1af4378a8d118590a7b41eb','获取商品列表','/s/findGoodsList','54c4898239e043919e819adfdfbdd81d','',0,NULL),('2d8b7cefba6444af8306362f2787846b','查看当前销售点库存','/s/getRepertory','70a87b2252074e48a10afa6e3577f891','',0,NULL),('31b01bae917044c8a7d7a591ebded180','添加经营单位','/s/saveManageUnit','4fc3de5e194e457488870efd998deb36','',0,NULL),('3348e9e038144116ae8713b25712ba00','删除销售点','/s/removeBranch','c91dcea97f3f4130b11f47f9d84788b8','',0,NULL),('33ca9ebc63e741b9816b2b49d87efa37','获取部门列表','/s/findDepartmentList','e18deaf2c23f457286835b6fd75ba66c','',0,NULL),('37b75019c544434bb925743aff357c8d','获取审批人列表','/s/listAccountChecker','a88eea4db94b42b7bb2a59ffc2ff2074','',0,NULL),('394fb0362b5f458db198a9b4b33c469d','跟单确认收到退货','/s/updateRefundReceive','7469ac7aa0c74a89968d796402c0a9d5','',0,NULL),('3a7e0fe4a7c944ed8ee1742f057f5a9a','团队','','0','',0,NULL),('3fd9aea9afcd41d58051bf7fd7f2e204','审批员获取建账申请列表','/s/listCustomerAccountByChecker','a88eea4db94b42b7bb2a59ffc2ff2074','',0,NULL),('3fff301f20f44e7a9c0bef58a777e9af','增加二级库存','/s/updateRepertoryAddSecond','e4d97a70e3d1441093b31357a3af57b9','',0,NULL),('41cd2800ac544673ad44f123d0866c41','获取部门详情','/s/findDepartmentDetail','3a7e0fe4a7c944ed8ee1742f057f5a9a','',0,NULL),('433182acda894bfabb6c79ed264fd5c4','更新销售点','/s/updateBranch','c91dcea97f3f4130b11f47f9d84788b8','',0,NULL),('4459908b141048709ae5db0036ca936e','财务B轮审核不通过','/s/updateFinanceFailB','7469ac7aa0c74a89968d796402c0a9d5','',0,NULL),('45d01c64046443f6a08109192fe7559f','财务A轮审核通过','/s/updateFinancePassA','7469ac7aa0c74a89968d796402c0a9d5','',0,NULL),('45ef3edb1bb54d8b8b87b1c09af41c93','申请人获取建账申请列表','/s/listCustomerAccountByProposer','a88eea4db94b42b7bb2a59ffc2ff2074','',0,NULL),('482c81895dfa4c03be448da794d78506','财务退款','/s/updateRefundMoney','7469ac7aa0c74a89968d796402c0a9d5','',0,NULL),('4bbe7f8d00264230a8115af9e762a694','删除商品','/s/deleteGoods','54c4898239e043919e819adfdfbdd81d','',0,NULL),('4f9efdd95b494aa8ba2bd29f5189278a','获取建账申请','/s/getCustomerAccount','a88eea4db94b42b7bb2a59ffc2ff2074','',0,NULL),('4fc3de5e194e457488870efd998deb36','经营单位','','0','',0,NULL),('54c4898239e043919e819adfdfbdd81d','商品','','0','',0,NULL),('56ad3c799d5b4424b83264cdc5b99146','获取跟单员列表','/s/listMerchandiser','a88eea4db94b42b7bb2a59ffc2ff2074','',0,NULL),('56d2230ccf224f219a5ebb35b7ae3164','上传手持身份证照片','/s/saveHandImage','a88eea4db94b42b7bb2a59ffc2ff2074','',0,NULL),('577c2b892e034fdca401be8cfc160d02','根据商品名关键字查找商品','/s/findGoodsListByKeyword','54c4898239e043919e819adfdfbdd81d','',0,NULL),('5a039deae71d4041bdfdb853e548394f','获取商品规格','/s/findTypeAttr','54c4898239e043919e819adfdfbdd81d','',0,NULL),('60f59f2082b645edb5d2e9086e1a850f','获取销售点商品列表','/s/listBranchGoods','c91dcea97f3f4130b11f47f9d84788b8','',0,NULL),('6313ff4495484bd381fe0ad40932812f','获取客户详情','/s/getCustomer','a88eea4db94b42b7bb2a59ffc2ff2074','',0,NULL),('683157b8a7914ed3813a2f5c1884a932','上传身份证正面照片','/s/insertCardFront','e18deaf2c23f457286835b6fd75ba66c','',0,NULL),('6a03b67c2f6a4104af26f4fe798ec6c8','同意申请','/s/updateRepertoryApplyAccept','8d12acdc34b747b2a7a2c1abfc9efb70','',0,NULL),('6b9df2db99164265b7f7d71d9438f375','获取养殖信息列表','/s/listUserBreed','7f1ff8d57f28492e8945b251967a3fdf','',0,NULL),('6ee451eafa964183836ab549c78e9897','获取部门内成员','/s/findDepartmentMember','3a7e0fe4a7c944ed8ee1742f057f5a9a','',0,NULL),('6f80f4551a174952919c53805c5f9fc9','财务筛选订单','/s/listFinanceOrderSelective','7469ac7aa0c74a89968d796402c0a9d5','',0,NULL),('6fcfb0514fb940769b5a834374863a96','删除经营单位','/s/removeManageUnit','4fc3de5e194e457488870efd998deb36','',0,NULL),('70a87b2252074e48a10afa6e3577f891','库存查看','','0','',0,NULL),('7110e366063b48bfaa6096034809b03c','获取审批人列表','/s/listRepertoryChecker','8d12acdc34b747b2a7a2c1abfc9efb70','',0,NULL),('7155744f3b0e41dab09df4c721632e5c','获取职位成员总数','/s/countPositionMember','e18deaf2c23f457286835b6fd75ba66c','',0,NULL),('73f7232eff214b08b5f4cbf6d29a7705','获取销售点列表','/s/listBranch','c91dcea97f3f4130b11f47f9d84788b8','',0,NULL),('7469ac7aa0c74a89968d796402c0a9d5','业务订单','','0','',0,NULL),('76195ed31cb740aba94ca5af1f8c4f45','删除运费模板','/s/removeFreightTemp','e4fe8b6bed394dd790c12e2184e4f969','',0,NULL),('77bb86217c3a43e384b379c1a6f34ded','获取身份证图片','/s/getCustomerIDCard','a88eea4db94b42b7bb2a59ffc2ff2074','',0,NULL),('7c6e4394a95746a8a42840e528194569','添加申请','/s/saveCommonApply','95477a89ef91482aae80313e2313f0b6','',0,NULL),('7d636d6ecd9b4b58a460a75109628f27','上传身份证背面照片','/s/saveBackImage','a88eea4db94b42b7bb2a59ffc2ff2074','',0,NULL),('7db3cfb7a5674b4a957db5b215e36c39','添加部门','/s/addDepartment','e18deaf2c23f457286835b6fd75ba66c','',0,NULL),('7f1ff8d57f28492e8945b251967a3fdf','养殖信息','','0','',0,NULL),('8403ee20944548f59d47819d30e91498','获取商品列表','/s/listGoods','c91dcea97f3f4130b11f47f9d84788b8','',0,NULL),('8b960ec62c444b8f96ffd3469cff4cc6','添加运费模板','/s/saveFreightTemp','e4fe8b6bed394dd790c12e2184e4f969','',0,NULL),('8d12acdc34b747b2a7a2c1abfc9efb70','用户场地','','0','',0,NULL),('8e6c5abb57f1435e82bcb7451d3d4f6c','确认发货','/s/updateDelivered','7469ac7aa0c74a89968d796402c0a9d5','',0,NULL),('8e8b4526eb77480583b350050697e61b','更新成员信息','/s/updateMember','e18deaf2c23f457286835b6fd75ba66c','',0,NULL),('92595c902f664dc88d008c19ab6b17a9','新建客户档案','/s/saveCustomerRecord','a88eea4db94b42b7bb2a59ffc2ff2074','',0,NULL),('928eb54955b744cda2771fdd30b9693f','获取商品详情','/s/findGoodsInfo','54c4898239e043919e819adfdfbdd81d','',0,NULL),('93201a63bf1e4b92966e0985aca260bb','上传图片到图片空间','/s/uploadToImgSpace','54c4898239e043919e819adfdfbdd81d','',0,NULL),('94eb7453504148ecbfac581ae80260cf','分配库存等级','/s/saveRepertoryLevel','a88eea4db94b42b7bb2a59ffc2ff2074','',0,NULL),('95477a89ef91482aae80313e2313f0b6','通用申请/审批','','0','',0,NULL),('959d021e07d14267acaef08d0a0a6cd0','获取身份证图片','/s/getCardImage','e18deaf2c23f457286835b6fd75ba66c','',0,NULL),('96a234391ed740888cf268f5de4885c5','删除场地环境、证明图片','/s/removePlaceImage','8d12acdc34b747b2a7a2c1abfc9efb70','',0,NULL),('99604bc1d3ad4a7ebadd0fb41e2619f7','审批人同意申请','/s/updateCommonApplyAccept','95477a89ef91482aae80313e2313f0b6','',0,NULL),('9a56dddf861e4642ad74dafb45d9bc86','减少二级库存','/s/updateRepertorySubSecond','e4d97a70e3d1441093b31357a3af57b9','',0,NULL),('9af33fa9baa5451e967d514a45887bc4','财务A轮审核不通过','/s/updateFinanceFailA','7469ac7aa0c74a89968d796402c0a9d5','',0,NULL),('9b534bfa678a425c92f8988ace46a6fa','获取场地详情','/s/getUserPlace','8d12acdc34b747b2a7a2c1abfc9efb70','',0,NULL),('9b7b4b67bcd54a7895095d2bfed5db7d','跟单同意退款','/s/updateRefundPass','7469ac7aa0c74a89968d796402c0a9d5','',0,NULL),('9cb2e9554b3f4176bbf35e938b6abfcc','获取销售点列表','/s/listBranch','70a87b2252074e48a10afa6e3577f891','',0,NULL),('9dcb7331a3a24595bf8b17027ab48116','获取成员详细信息','/s/findMemberInfo','e18deaf2c23f457286835b6fd75ba66c','',0,NULL),('9e99d0c2e0594ea5ac54c783b4388367','删除养殖信息','/s/removeUserBreed','7f1ff8d57f28492e8945b251967a3fdf','',0,NULL),('a080fabe1426404b8d08f41a6c409b28','更新部门信息','/s/updateDepartment','e18deaf2c23f457286835b6fd75ba66c','',0,NULL),('a27a4987061b439b8a4bfc3ed249a8bf','搜索成员','/s/findMemberByNameOrPhone','3a7e0fe4a7c944ed8ee1742f057f5a9a','',0,NULL),('a67d3844445748d0bffda191572110be','申请人获取申请列表','/s/listCommonApplyByProposer','95477a89ef91482aae80313e2313f0b6','',0,NULL),('a74002e033b5426993ca81097eaa94ce','跟单审核通过','/s/updateSalesmanPass','7469ac7aa0c74a89968d796402c0a9d5','',0,NULL),('a88eea4db94b42b7bb2a59ffc2ff2074','客户','','0','',0,NULL),('ab4ce400493343e99b2da85767e5151e','确认签收','/s/updateRepertoryApplyFinish','8d12acdc34b747b2a7a2c1abfc9efb70','',0,NULL),('ab4f1eb593cf45ddbd13e036908d6569','查看一级库存','/s/listRepertoryFirst','70a87b2252074e48a10afa6e3577f891','',0,NULL),('b0b06455b6b14b70a669e9e0418fe0e5','获取部门下成员列表','/s/findMemberList','e18deaf2c23f457286835b6fd75ba66c','',0,NULL),('b0bffbe890084688a6509763efd48b80','修改养殖信息','/s/updateUserBreed','7f1ff8d57f28492e8945b251967a3fdf','',0,NULL),('b422e435961042f88fd0c5b6937ec3ef','上传场地环境图片','/s/uploadPlaceEnvironment','8d12acdc34b747b2a7a2c1abfc9efb70','',0,NULL),('b4ea830b0a5047efa0e763ec03f45cf9','获取农户列表','/s/listFarmer','1e9e6431f6424cf79975a6b03c0aa9a8','',0,NULL),('b52e6463880148c2bc6a9a138e1f113e','减少一级库存','/s/updateRepertorySubFirst','e4d97a70e3d1441093b31357a3af57b9','',0,NULL),('b751967d6cdc4662b74e7710b712c941','上传身份证背面照片','/s/insertCardBack','e18deaf2c23f457286835b6fd75ba66c','',0,NULL),('bb6f5955641c45d1b701a78e251a9707','审批人拒绝申请','/s/updateCommonApplyRefuse','95477a89ef91482aae80313e2313f0b6','',0,NULL),('bc312d5ab94547cfa44eefe5f55114be','添加销售点','/s/addBranch','c91dcea97f3f4130b11f47f9d84788b8','',0,NULL),('bca1e341ef57443698087ff4d159df0a','添加养殖信息','/s/saveUserBreed','7f1ff8d57f28492e8945b251967a3fdf','',0,NULL),('c4c779c0160d4795832de2389197372d','修改客户','/s/updateCustomer','a88eea4db94b42b7bb2a59ffc2ff2074','',0,NULL),('c53a84e3214b47f881a8bebcd548d407','上传场地证明图片','/s/uploadPlaceCertificate','8d12acdc34b747b2a7a2c1abfc9efb70','',0,NULL),('c91dcea97f3f4130b11f47f9d84788b8','销售点','','0','',0,NULL),('d0e15685a635424798c5b98e7d5ea520','获取库存申请列表','/s/listRepertoryApplyByProposer','8d12acdc34b747b2a7a2c1abfc9efb70','',0,NULL),('d3657aced44a41fcbfb603db880203d0','增加一级库存','/s/updateRepertoryAddFirst','e4d97a70e3d1441093b31357a3af57b9','',0,NULL),('d81ab32efffd4267b952139403cf078b','同意客户建账','/s/updateCustomerAccountAccept','a88eea4db94b42b7bb2a59ffc2ff2074','',0,NULL),('d98a5a91cc76455d9eea493bac6aa780','发布商品','/s/goodsRelease','54c4898239e043919e819adfdfbdd81d','',0,NULL),('de70b36a986f40319456164ed7bf5c2d','获取部门以及部门下成员总数','/s/findTeamAndMemberCount','e18deaf2c23f457286835b6fd75ba66c','',0,NULL),('e06a2d2f59364da3b66e450967e11703','获取库存分配记录','/s/listRepertoryRecord','e4d97a70e3d1441093b31357a3af57b9','',0,NULL),('e18deaf2c23f457286835b6fd75ba66c','组织管理','','0','',0,NULL),('e27b9263fd6843d5b6eba607f2334bda','从图片空间获取图片','/s/findImages','54c4898239e043919e819adfdfbdd81d','',0,NULL),('e2acf493144146d3bbb1863836e1386b','获取经营单位列表','/s/listManageUnit','4fc3de5e194e457488870efd998deb36','',0,NULL),('e4d97a70e3d1441093b31357a3af57b9','库存分配','','0','',0,NULL),('e4fe8b6bed394dd790c12e2184e4f969','运费模板','','0','',0,NULL),('e619edbecce3461a8f0fc714fd693ce7','添加申请图片','/s/saveCommonApplyImage','95477a89ef91482aae80313e2313f0b6','',0,NULL),('e84cc09bf9b04912a94d9ebfa51416f3','获取库存审批列表','/s/listRepertoryApplyByApprover','8d12acdc34b747b2a7a2c1abfc9efb70','',0,NULL),('f1fa6a93bfca43e48c932fecce2e1931','添加部门成员','/s/addMember','e18deaf2c23f457286835b6fd75ba66c','',0,NULL),('f23552f1de9d4628be21389e14a34468','获取部门详情','/s/findDepartmentInfo','e18deaf2c23f457286835b6fd75ba66c','',0,NULL),('f941b151f77648fd964c6d760ee1ef03','删除农户','/s/removeFarmer','1e9e6431f6424cf79975a6b03c0aa9a8','',0,NULL),('fc4fd57a5d5b4d4e9a3d66c335a907d8','获取销售点详情','/s/getBranch','c91dcea97f3f4130b11f47f9d84788b8','',0,NULL),('fdfec77226ac4eeaabab5e7db3ce797a','更新商品','/s/updateGoods','54c4898239e043919e819adfdfbdd81d','',0,NULL);
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
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm_branch`
--

LOCK TABLES `qm_branch` WRITE;
/*!40000 ALTER TABLE `qm_branch` DISABLE KEYS */;
INSERT INTO `qm_branch` VALUES ('c1ac8fadcd8d4806a35518be39703393','广州销售点','27a9c57b4c69441aa569ef4ae1a9ef7d','10001','财务部','89d9317fb3834353bcf2a507bee2eb83','李四','13699999999','广州市交通技师学院','23.236034,113.351232');
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
INSERT INTO `qm_branch_goods` VALUES ('c1ac8fadcd8d4806a35518be39703393','22a91981f71a43e7a8c34472bc7cc1c6','1f9b286b836c4175ab09a9b02cacbb7d',502),('c1ac8fadcd8d4806a35518be39703393','9c3ed28bb39e4b079f548e69a3681cba','9190f4574805419187a8029042803617',520);
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
INSERT INTO `qm_permission` VALUES ('01816190a0f94939aec1a866d0733d67','申请/审批','','0',1,NULL),('149bd9942355443b91d18e5d7315d863','建账申请','','9d5c748f6a9a419dbf27fb7901a62462',1,NULL),('1c74784ec1994ff6a2600d0dcc53a3f6','查看部门详情','','b4cf7855ec9a4c6bb8e19469dac0a4ef',1,NULL),('1ed6075829284ee78211c183733a8ce9','查看商品','','f38a21478f7044bd82074fd96263e8dd',1,NULL),('22663eb693304f60b0efb8fb3789263e','查看销售点详情','','f38a21478f7044bd82074fd96263e8dd',1,NULL),('2ded886b3810438e8fb3a89844df10a2','查看成员名片','','b4cf7855ec9a4c6bb8e19469dac0a4ef',1,NULL),('35796ead7b264db88a11d34298f1bcf0','添加运费模板','','f38a21478f7044bd82074fd96263e8dd',1,NULL),('365a565cc7fb47cda068b50bbb84d3f4','删除销售点','','f38a21478f7044bd82074fd96263e8dd',1,NULL),('3df3d136992049c6808983119e35f3f8','移交客户','','9d5c748f6a9a419dbf27fb7901a62462',1,NULL),('3e36f999ab6247848db16ca20e6c5910','添加成员','','7841585bf0b84c7cb6d59db36f10924c',1,NULL),('45e2b786f3f6421ea0c30f2d6df65418','申请业务帮助','','9d5c748f6a9a419dbf27fb7901a62462',1,NULL),('4b972967a39446c49190e16d170143a6','查看客户资料','','9d5c748f6a9a419dbf27fb7901a62462',1,NULL),('52650715529a4400b15166efd1bfda79','编辑客户资料','','9d5c748f6a9a419dbf27fb7901a62462',1,NULL),('54597ff135304b508438d05f828c427c','编辑销售点','','f38a21478f7044bd82074fd96263e8dd',1,NULL),('5599ac3b81bd46fc9222694757693497','删除运费模板','','f38a21478f7044bd82074fd96263e8dd',1,NULL),('56320ed095d84dab831cf8434e8ab4b9','编辑运费模板','','f38a21478f7044bd82074fd96263e8dd',1,NULL),('5923178c2e464581a07e4deb6fff863c','拜访记录','','9d5c748f6a9a419dbf27fb7901a62462',1,NULL),('5d78364d6e88419eb8ce0ed850f0e9d5','客户建档','','9d5c748f6a9a419dbf27fb7901a62462',1,NULL),('677032b05bca4092992c4e40c1d47d44','审批建账申请','','9d5c748f6a9a419dbf27fb7901a62462',1,NULL),('701e688aefe5430693ebe7aa5e32228b','订单','','0',1,NULL),('717225a898044fbb8e44175dc0c19d0b','删除部门','','7841585bf0b84c7cb6d59db36f10924c',1,NULL),('77db1a86e6f6495e8a2ca69144c7fa2a','申请调货','','fde34080cb0842338f98df72ea979e97',1,NULL),('7841585bf0b84c7cb6d59db36f10924c','组织管理','','0',1,NULL),('7bd549e0ca494f2387ef1a89f694cf06','添加部门/职位','','7841585bf0b84c7cb6d59db36f10924c',1,NULL),('817b6e5f34bc41c5b5e6aab8c8eb53f2','冻结客户账号','','9d5c748f6a9a419dbf27fb7901a62462',1,NULL),('83df51b1b6324fe5aa86458bf009955c','编辑成员资料','','7841585bf0b84c7cb6d59db36f10924c',1,NULL),('8737fe4c082e47fe82cbb0e0dcccfc32','激活账号','','7841585bf0b84c7cb6d59db36f10924c',1,NULL),('889716e1a2784416a9b924131338c83b','审批权','','01816190a0f94939aec1a866d0733d67',1,NULL),('8e2a86f8e8e84616a739dd2608cbac08','设置成员的个人权限','','7841585bf0b84c7cb6d59db36f10924c',1,NULL),('98b29709f24d4eb8a07177bf12b0ab0f','激活客户账号','','9d5c748f6a9a419dbf27fb7901a62462',1,NULL),('9d5c748f6a9a419dbf27fb7901a62462','客户','','0',1,NULL),('b406b06df0464de3b43eb6bac20f6020','冻结账号','','7841585bf0b84c7cb6d59db36f10924c',1,NULL),('b4cf7855ec9a4c6bb8e19469dac0a4ef','团队','','0',1,NULL),('b9c9f7a0b24e4b218627db8d7adb2402','业务订单管理','','701e688aefe5430693ebe7aa5e32228b',1,NULL),('bfc0df746d514d69b73a058d2c4e3c03','查看当前库存详情','','fde34080cb0842338f98df72ea979e97',1,NULL),('c69fc0a069184e38b481db5a67a712cb','查看运费模板详情','','f38a21478f7044bd82074fd96263e8dd',1,NULL),('c7855331667a49aabc3b65d572fcb879','添加销售点','','f38a21478f7044bd82074fd96263e8dd',1,NULL),('ca44615670aa417095083b04324a9362','财务订单管理','','701e688aefe5430693ebe7aa5e32228b',1,NULL),('d171e393b87d4ea4b47fa1ae84133b5f','查看成员详情','','7841585bf0b84c7cb6d59db36f10924c',1,NULL),('d187528d9576470990d7ee4a064a0032','查看所有库存详情','','fde34080cb0842338f98df72ea979e97',1,NULL),('d3acb9eb3418467c96693de55f7cee07','调货审批','','fde34080cb0842338f98df72ea979e97',1,NULL),('d5a4e5dea5474aefaf3a2c267c09db42','申请权','','01816190a0f94939aec1a866d0733d67',1,NULL),('d831fed38df849bf948e9bfc44398efc','分配使用权','','7841585bf0b84c7cb6d59db36f10924c',1,NULL),('db3131e947eb4de382493f9d5197705b','编辑部门/职位','','7841585bf0b84c7cb6d59db36f10924c',1,NULL),('dba9e35f02844c1e892fa73cf62d3f82','查看部门/职位权','','7841585bf0b84c7cb6d59db36f10924c',1,NULL),('f38a21478f7044bd82074fd96263e8dd','商城','','0',1,NULL),('f5c9249b46f641da873a40052e7cfeec','组织管理登陆','','7841585bf0b84c7cb6d59db36f10924c',1,NULL),('f9056a7577714b6086663308941a81a0','编辑商品资料','','f38a21478f7044bd82074fd96263e8dd',1,NULL),('fde34080cb0842338f98df72ea979e97','库存','','0',1,NULL);
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
INSERT INTO `qm_permission_re` VALUES ('7c6e4394a95746a8a42840e528194569','d5a4e5dea5474aefaf3a2c267c09db42'),('a67d3844445748d0bffda191572110be','d5a4e5dea5474aefaf3a2c267c09db42'),('e619edbecce3461a8f0fc714fd693ce7','d5a4e5dea5474aefaf3a2c267c09db42'),('146a65d3dbbc4415b2a3fac695fae47f','889716e1a2784416a9b924131338c83b'),('99604bc1d3ad4a7ebadd0fb41e2619f7','889716e1a2784416a9b924131338c83b'),('bb6f5955641c45d1b701a78e251a9707','889716e1a2784416a9b924131338c83b'),('1c81c18a11e347bb82a4210d83388108','b9c9f7a0b24e4b218627db8d7adb2402'),('394fb0362b5f458db198a9b4b33c469d','b9c9f7a0b24e4b218627db8d7adb2402'),('8e6c5abb57f1435e82bcb7451d3d4f6c','b9c9f7a0b24e4b218627db8d7adb2402'),('9b7b4b67bcd54a7895095d2bfed5db7d','b9c9f7a0b24e4b218627db8d7adb2402'),('a74002e033b5426993ca81097eaa94ce','b9c9f7a0b24e4b218627db8d7adb2402'),('05bd0a87ad674dc8b1b56938a7435695','ca44615670aa417095083b04324a9362'),('4459908b141048709ae5db0036ca936e','ca44615670aa417095083b04324a9362'),('45d01c64046443f6a08109192fe7559f','ca44615670aa417095083b04324a9362'),('482c81895dfa4c03be448da794d78506','ca44615670aa417095083b04324a9362'),('6f80f4551a174952919c53805c5f9fc9','ca44615670aa417095083b04324a9362'),('9af33fa9baa5451e967d514a45887bc4','ca44615670aa417095083b04324a9362'),('076c74f7c6dc498fb60a06794149f4c9','e18deaf2c23f457286835b6fd75ba66c'),('de70b36a986f40319456164ed7bf5c2d','f5c9249b46f641da873a40052e7cfeec'),('683157b8a7914ed3813a2f5c1884a932','e18deaf2c23f457286835b6fd75ba66c'),('8e8b4526eb77480583b350050697e61b','e18deaf2c23f457286835b6fd75ba66c'),('959d021e07d14267acaef08d0a0a6cd0','e18deaf2c23f457286835b6fd75ba66c'),('9dcb7331a3a24595bf8b17027ab48116','e18deaf2c23f457286835b6fd75ba66c'),('b0b06455b6b14b70a669e9e0418fe0e5','e18deaf2c23f457286835b6fd75ba66c'),('b751967d6cdc4662b74e7710b712c941','e18deaf2c23f457286835b6fd75ba66c'),('f1fa6a93bfca43e48c932fecce2e1931','e18deaf2c23f457286835b6fd75ba66c'),('153b7377619b437e95a183781ed6d0f7','7bd549e0ca494f2387ef1a89f694cf06'),('33ca9ebc63e741b9816b2b49d87efa37','7bd549e0ca494f2387ef1a89f694cf06'),('7155744f3b0e41dab09df4c721632e5c','7bd549e0ca494f2387ef1a89f694cf06'),('7db3cfb7a5674b4a957db5b215e36c39','7bd549e0ca494f2387ef1a89f694cf06'),('a080fabe1426404b8d08f41a6c409b28','7bd549e0ca494f2387ef1a89f694cf06'),('f23552f1de9d4628be21389e14a34468','7bd549e0ca494f2387ef1a89f694cf06'),('15a91680b96b41cdab567c6080bdcdf8','a88eea4db94b42b7bb2a59ffc2ff2074'),('37b75019c544434bb925743aff357c8d','a88eea4db94b42b7bb2a59ffc2ff2074'),('56ad3c799d5b4424b83264cdc5b99146','a88eea4db94b42b7bb2a59ffc2ff2074'),('24ccc3048fe744789bb125b95153b79b','4b972967a39446c49190e16d170143a6'),('6313ff4495484bd381fe0ad40932812f','4b972967a39446c49190e16d170143a6'),('77bb86217c3a43e384b379c1a6f34ded','4b972967a39446c49190e16d170143a6'),('c4c779c0160d4795832de2389197372d','a88eea4db94b42b7bb2a59ffc2ff2074'),('122072cf9cbd4835b4f823440956f861','5d78364d6e88419eb8ce0ed850f0e9d5'),('56d2230ccf224f219a5ebb35b7ae3164','5d78364d6e88419eb8ce0ed850f0e9d5'),('7d636d6ecd9b4b58a460a75109628f27','5d78364d6e88419eb8ce0ed850f0e9d5'),('92595c902f664dc88d008c19ab6b17a9','5d78364d6e88419eb8ce0ed850f0e9d5'),('3fd9aea9afcd41d58051bf7fd7f2e204','a88eea4db94b42b7bb2a59ffc2ff2074'),('d81ab32efffd4267b952139403cf078b','a88eea4db94b42b7bb2a59ffc2ff2074'),('1142af8e601041f19e5cf37d0b01f84c','3a7e0fe4a7c944ed8ee1742f057f5a9a'),('41cd2800ac544673ad44f123d0866c41','3a7e0fe4a7c944ed8ee1742f057f5a9a'),('6ee451eafa964183836ab549c78e9897','2ded886b3810438e8fb3a89844df10a2'),('a27a4987061b439b8a4bfc3ed249a8bf','2ded886b3810438e8fb3a89844df10a2'),('02c7c19e61854187843ac48e15ca95c5','1ed6075829284ee78211c183733a8ce9'),('1938053cc6a94ed381d0040dfe28627b','1ed6075829284ee78211c183733a8ce9'),('2cba97b7a1af4378a8d118590a7b41eb','1ed6075829284ee78211c183733a8ce9'),('577c2b892e034fdca401be8cfc160d02','1ed6075829284ee78211c183733a8ce9'),('5a039deae71d4041bdfdb853e548394f','1ed6075829284ee78211c183733a8ce9'),('928eb54955b744cda2771fdd30b9693f','1ed6075829284ee78211c183733a8ce9'),('e27b9263fd6843d5b6eba607f2334bda','1ed6075829284ee78211c183733a8ce9'),('60f59f2082b645edb5d2e9086e1a850f','c91dcea97f3f4130b11f47f9d84788b8'),('73f7232eff214b08b5f4cbf6d29a7705','c91dcea97f3f4130b11f47f9d84788b8'),('fc4fd57a5d5b4d4e9a3d66c335a907d8','c91dcea97f3f4130b11f47f9d84788b8'),('8b960ec62c444b8f96ffd3469cff4cc6','35796ead7b264db88a11d34298f1bcf0'),('3348e9e038144116ae8713b25712ba00','365a565cc7fb47cda068b50bbb84d3f4'),('433182acda894bfabb6c79ed264fd5c4','54597ff135304b508438d05f828c427c'),('76195ed31cb740aba94ca5af1f8c4f45','5599ac3b81bd46fc9222694757693497'),('21e0c6287c9b49ef8e581009d81ab0e8','56320ed095d84dab831cf8434e8ab4b9'),('08f613c3481147b49b9ea7623a9513c8','08f613c3481147b49b9ea7623a9513c8'),('bc312d5ab94547cfa44eefe5f55114be','c7855331667a49aabc3b65d572fcb879'),('fdfec77226ac4eeaabab5e7db3ce797a','f9056a7577714b6086663308941a81a0');
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
  `proposer_id` varchar(35) NOT NULL,
  `proposer_name` varchar(20) NOT NULL,
  `approver_id` varchar(35) DEFAULT NULL,
  `approver_name` varchar(20) NOT NULL,
  `apply_status` tinyint(4) NOT NULL,
  `apply_remark` varchar(255) NOT NULL,
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repertory_apply`
--

LOCK TABLES `repertory_apply` WRITE;
/*!40000 ALTER TABLE `repertory_apply` DISABLE KEYS */;
INSERT INTO `repertory_apply` VALUES ('022564f8573f4a97a0840a976dae2e31','c1ac8fadcd8d4806a35518be39703393','10001','广州销售点','2017-08-26 15:11:00','89d9317fb3834353bcf2a507bee2eb83','李四','89d9317fb3834353bcf2a507bee2eb82','张三',12,'备注'),('470b578ffab04316a6ba78ab25c6d0f3','c1ac8fadcd8d4806a35518be39703393','10001','广州销售点','2017-08-26 15:09:33','1','1','1','1',10,'备注');
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
INSERT INTO `repertory_apply_list` VALUES ('470b578ffab04316a6ba78ab25c6d0f3','22a91981f71a43e7a8c34472bc7cc1c6','倍润828B,20%生长育肥猪浓缩饲料 使用阶段：60kg-出栏','1f9b286b836c4175ab09a9b02cacbb7d','小包',10),('470b578ffab04316a6ba78ab25c6d0f3','9c3ed28bb39e4b079f548e69a3681cba','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','9190f4574805419187a8029042803617','大包',5),('022564f8573f4a97a0840a976dae2e31','22a91981f71a43e7a8c34472bc7cc1c6','倍润828B,20%生长育肥猪浓缩饲料 使用阶段：60kg-出栏','1f9b286b836c4175ab09a9b02cacbb7d','小包',10),('022564f8573f4a97a0840a976dae2e31','9c3ed28bb39e4b079f548e69a3681cba','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','9190f4574805419187a8029042803617','大包',5);
/*!40000 ALTER TABLE `repertory_apply_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repertory_record`
--

DROP TABLE IF EXISTS `repertory_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repertory_record` (
  `record_id` varchar(35) NOT NULL,
  `my_team_id` varchar(35) NOT NULL,
  `record_type` tinyint(4) NOT NULL,
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
INSERT INTO `repertory_record` VALUES ('85ca39b404a5495790edaf360113d2df','10001',1,'','','89d9317fb3834353bcf2a507bee2eb83','李四','2017-08-26 11:14:00','备注');
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
INSERT INTO `repertory_record_list` VALUES ('85ca39b404a5495790edaf360113d2df','22a91981f71a43e7a8c34472bc7cc1c6','倍润828B,20%生长育肥猪浓缩饲料 使用阶段：60kg-出栏','1f9b286b836c4175ab09a9b02cacbb7d','小包',60),('85ca39b404a5495790edaf360113d2df','9c3ed28bb39e4b079f548e69a3681cba','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG','9190f4574805419187a8029042803617','大包',130);
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
-- Table structure for table `role_permission_re`
--

DROP TABLE IF EXISTS `role_permission_re`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission_re` (
  `permission_id` varchar(35) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `FK_role_permission_RE2` (`role_id`),
  CONSTRAINT `FK_role_permission_RE` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`),
  CONSTRAINT `FK_role_permission_RE2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission_re`
--

LOCK TABLES `role_permission_re` WRITE;
/*!40000 ALTER TABLE `role_permission_re` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_permission_re` ENABLE KEYS */;
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
INSERT INTO `shopping_address` VALUES ('230f398fbb0245aea68a570ea3e06f55','89d9317fb3834353bcf2a507bee2eb82','987654321','1kjgfd','scxz1','1367987878',1),('866e3b125d434621a67dd300bc238f36','89d9317fb3834353bcf2a507bee2eb82','987654321','1kjgfd','scxz1','1367987878',0);
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
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_customer`
--

LOCK TABLES `sys_customer` WRITE;
/*!40000 ALTER TABLE `sys_customer` DISABLE KEYS */;
INSERT INTO `sys_customer` VALUES ('ba5482eb62b74bdb9db459acc4994656','女','芳芳','13355667788','313','10000','中国电信','2017-09-20 00:00:00','华美洗车','广东省江门市鹤山市鹤山汽车总站','92da6064f89047cb84406c8859fc407d','总经办','manager','46f4d1bb405c4d95bffcf115c1a79e02','负责人','5198012fab4d45be806393acaded43ae',1,1002,'22.755718,112.970431');
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
INSERT INTO `sys_customer_account` VALUES ('1c3d2e36ebf84a17a95d915df4eac7ae',12,'5198012fab4d45be806393acaded43ae','五五','ed3820d0e989469a88b9b7f36ed1d7e8','五五'),('35ea769ed4e943a09d1957059ae6b946',12,'5198012fab4d45be806393acaded43ae','五五','f027d5c2750648779483b0b1d8389d5c','六六'),('5fdd009c4c854f709d7643cc892574dc',12,'5198012fab4d45be806393acaded43ae','五五','ed3820d0e989469a88b9b7f36ed1d7e8','五五'),('73b74dbb2efb4fc6983a7237baee3f90',11,'5198012fab4d45be806393acaded43ae','花花','9a5fcadc7fc643bb8e181598a2fd2833','五五'),('7e040e1de5c54d5ebc7c9c776570e282',12,'5198012fab4d45be806393acaded43ae','五五','ed3820d0e989469a88b9b7f36ed1d7e8','五五'),('80728f47af1e40c9948d5bc40c462c64',12,'5198012fab4d45be806393acaded43ae','五五','ed3820d0e989469a88b9b7f36ed1d7e8','五五'),('a0f7c2b189ce46e6ab097e9faafb25f9',11,'5198012fab4d45be806393acaded43ae','五五','ba5482eb62b74bdb9db459acc4994656','芳芳'),('a1b808ce03d54ad09fcf41207fb5f074',12,'5198012fab4d45be806393acaded43ae','五五','f027d5c2750648779483b0b1d8389d5c','六六'),('c2437b3f240f425dacc728bdb57195e9',12,'5198012fab4d45be806393acaded43ae','五五','ed3820d0e989469a88b9b7f36ed1d7e8','五五'),('db27c07994f94deab879e17db586de94',12,'5198012fab4d45be806393acaded43ae','五五','ed3820d0e989469a88b9b7f36ed1d7e8','五五'),('dec85fda13fe4e568fa457423a823e0d',11,'5198012fab4d45be806393acaded43ae','五五','f027d5c2750648779483b0b1d8389d5c','六六'),('f14887a6e5804024b57c6d497ddabcc5',12,'5198012fab4d45be806393acaded43ae','五五','f027d5c2750648779483b0b1d8389d5c','六六'),('ff4f0dff098a42f4983cd594c2faed6a',12,'5198012fab4d45be806393acaded43ae','五五','f027d5c2750648779483b0b1d8389d5c','六六');
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
INSERT INTO `sys_permission` VALUES ('04524cd9bb014ad2a5ac2488df842f26','获取用户列表','/user/list.action','获取管理系统用户列表'),('04bb46e5de5e4bd1b7e46650b3fd3c4a','修改用户','/user/update.action','修改管理系统用户'),('09dba6832eda4dca9a07952f0891a834','添加类目信息','/breed/info/save.action','添加类目信息'),('0ede55e3b2d148e186b09f5419efe0e8','添加权限','/permission/save.action','添加权限'),('10bcdfb847fa4592a36766400c0e059c','获取类目选项详情','/breed/select/get.action','获取类目选项详情'),('13de6d6db252417f8270467485c535f8','获取角色详情','/role/get.action','获取角色详情'),('151c37db08994e17aeba2a4352de7331','添加类目选项','/breed/select/save.action','添加类目选项'),('2136a7b67d4444b8b971af61c3f8dbb7','拒绝建账申请','/customer/account/updateRefuse.action','拒绝建账申请'),('21d758848934417098f06712f4576962','分配用户角色','/user/updateRole.action','为管理系统用户分配角色'),('3545d403b9fa49eeb96daddaf6893d53','获取用户详情','/user/get.action','获取管理系统用户详情'),('36134642493444f2b0e9688d77120957','添加养殖类目','/breed/save.action','添加养殖类目'),('3c7d7535d81544cf90daf2e04a625330','修改角色','/role/update.action','修改角色'),('3cd516b590f44486afa0548a711a3eff','修改客户','/customer/update.action','修改客户'),('3d6857b2144d48ebaf2f9da9983502f1','获取养殖类目列表','/breed/list.action','获取养殖类目列表'),('41a347632e6040ea9e63fc403356d1b9','修改养殖类目','/breed/update.action','修改养殖类目'),('44c9a70bf90048368f6c3488f5e9328f','删除客户','/customer/remove.action','删除客户'),('540fece018e04e23ad9963f5e8a23aa8','修改权限','/permission/update.action','修改权限'),('5e88a0848713449fa3997081ba814093','获取类目选项列表','/breed/select/list.action','获取类目选项列表'),('6a1336ac0c5b48e7b1076b931935d774','添加客户','/customer/save.action','添加客户'),('6c5715c8d8e94ee2a295147e92c91b54','修改密码','/password/update.action','修改当前用户密码'),('715ecfda0de74adf941b58f58eaf832f','删除用户','/user/remove.action','删除管理系统用户'),('7506f51b41f84328919da28fb0fa4a4f','获取类目信息列表','/breed/info/list.action','获取类目信息列表'),('7642bccc89104053acec00b62d4bb096','修改类目选项','/breed/select/update.action','修改类目选项'),('803249bf57924ae6b784b1a758e5c765','获取客户详情','/customer/get.action','获取客户详情'),('886c3a890fd94afd87fd9b690100a5be','添加用户','/user/save.action','添加管理系统用户'),('90452e97a07e4ed6a6a2d8df9505efd1','获取客户列表','/customer/list.action','获取客户列表'),('9b05e2cac7bd495ebd578e43b1b384c9','同意建账申请','/customer/account/updateAccept.action','同意建账申请'),('a5749f039cdd4476aab367d5bd596db3','删除类目选项','/breed/select/remove.action','删除类目选项'),('a6898173858242e18b339c08ad992a3e','发起建账申请','/customer/account/save.action','发起建账申请'),('aab8329b4413492aa886323b16dbff9d','申请人获取建账申请列表','/customer/account/listByProposer.action','申请人获取建账申请列表'),('ab4b5469c96c4175a84be1820dfc6810','为角色分配权限','/role/updatePermission.action','为角色分配权限'),('b428a4563f234a5fbb1e546b16e481c8','获取角色列表','/role/list.action','获取角色列表'),('bcf583cf00354675ac746bb3d7f7941e','审批人获取建账申请列表','/customer/account/listByApprove.action','审批人获取建账申请列表'),('c144e6c34274474ab6cd220b46ef57a5','删除角色','/role/remove.action','删除角色'),('dd746f116bf14d578ae316b191c10155','删除权限','/permission/remove.action','删除权限'),('df66c381adc948b18d4a17776917585a','获取养殖类目详情','/breed/get.action','获取养殖类目详情'),('e68e8531cc5f4c8fb6d2fb2e5df01d16','获取类目信息详情','/breed/info/get.action','获取类目信息详情'),('eaa70bbc95464dc2b58217989559bf6c','删除养殖类目','/breed/remove.action','删除养殖类目'),('ec7fd292e2184537b93982d09fc60f95','获取权限详情','/permission/get.action','获取权限详情'),('f0141be7c4ab49cb89cd36476b67e59c','获取权限列表','/permission/list.action','获取权限列表'),('f5d8cc6501124f5db96430de86a9bf58','修改类目信息','/breed/info/update.action','修改类目信息'),('f620697b12354014a0de6014be601381','添加角色','/role/save.action','添加角色'),('f8fb9d12ba8d4b3c974fd468c8b293f1','删除类目信息','/breed/info/remove.action','删除类目信息');
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
INSERT INTO `sys_role_permission_re` VALUES ('b03407084ffe4f05b04d80992e5a7362','8821044b28b040e5972167e53704da9e'),('super','df66c381adc948b18d4a17776917585a'),('super','e68e8531cc5f4c8fb6d2fb2e5df01d16'),('super','7506f51b41f84328919da28fb0fa4a4f'),('super','f8fb9d12ba8d4b3c974fd468c8b293f1'),('super','09dba6832eda4dca9a07952f0891a834'),('super','f5d8cc6501124f5db96430de86a9bf58'),('super','3d6857b2144d48ebaf2f9da9983502f1'),('super','eaa70bbc95464dc2b58217989559bf6c'),('super','36134642493444f2b0e9688d77120957'),('super','10bcdfb847fa4592a36766400c0e059c'),('super','5e88a0848713449fa3997081ba814093'),('super','a5749f039cdd4476aab367d5bd596db3'),('super','151c37db08994e17aeba2a4352de7331'),('super','7642bccc89104053acec00b62d4bb096'),('super','41a347632e6040ea9e63fc403356d1b9'),('super','bcf583cf00354675ac746bb3d7f7941e'),('super','aab8329b4413492aa886323b16dbff9d'),('super','a6898173858242e18b339c08ad992a3e'),('super','9b05e2cac7bd495ebd578e43b1b384c9'),('super','2136a7b67d4444b8b971af61c3f8dbb7'),('super','803249bf57924ae6b784b1a758e5c765'),('super','90452e97a07e4ed6a6a2d8df9505efd1'),('super','44c9a70bf90048368f6c3488f5e9328f'),('super','6a1336ac0c5b48e7b1076b931935d774'),('super','3cd516b590f44486afa0548a711a3eff'),('super','6c5715c8d8e94ee2a295147e92c91b54'),('super','ec7fd292e2184537b93982d09fc60f95'),('super','f0141be7c4ab49cb89cd36476b67e59c'),('super','dd746f116bf14d578ae316b191c10155'),('super','0ede55e3b2d148e186b09f5419efe0e8'),('super','540fece018e04e23ad9963f5e8a23aa8'),('super','13de6d6db252417f8270467485c535f8'),('super','b428a4563f234a5fbb1e546b16e481c8'),('super','c144e6c34274474ab6cd220b46ef57a5'),('super','f620697b12354014a0de6014be601381'),('super','3c7d7535d81544cf90daf2e04a625330'),('super','ab4b5469c96c4175a84be1820dfc6810'),('super','3545d403b9fa49eeb96daddaf6893d53'),('super','04524cd9bb014ad2a5ac2488df842f26'),('super','715ecfda0de74adf941b58f58eaf832f'),('super','886c3a890fd94afd87fd9b690100a5be'),('super','04bb46e5de5e4bd1b7e46650b3fd3c4a'),('super','21d758848934417098f06712f4576962');
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
INSERT INTO `team_department` VALUES ('27a9c57b4c69441aa569ef4ae1a9ef7c','总经办','manager',NULL,'0','2017-06-06 00:00:00','10001'),('27a9c57b4c69441aa569ef4ae1a9ef7d','财务部','',NULL,'0','2017-06-06 10:20:45','10001'),('47f0a0a4c639488b8772c4e51219ad02','测试部10','',NULL,'0','2017-09-02 00:00:00','10001'),('4bb875fc900047bca61c4b1f15ecc78f','总经办','manager',NULL,'0','2017-09-15 16:52:56','10086'),('624455c24e9744e8a3d6ef801b935d11','总经办','manager',NULL,'0','2017-09-20 14:39:16','10010'),('6256feb92d844cd5951d7cfe01d922ed','技术部','',NULL,'0','2017-06-26 00:00:00','10001'),('92da6064f89047cb84406c8859fc407d','总经办','manager',NULL,'0','2017-09-22 10:18:11','10000');
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
INSERT INTO `user` VALUES ('41370f132bd44bca943e2fe5dd9862ab','10001','27a9c57b4c69441aa569ef4ae1a9ef7c',1003,'赵六','825682eafec59c2e1632828195133a52','女','13657981326',NULL,'','','','2017-07-07 17:16:19','2017-07-07 17:16:19','u_st_2','','','','','22766697f14448c4ab032e2f168ca2d41500285106132',0,NULL,'135621567845465420','','2017-07-07 17:16:19','/WEB-INF/upload/img/id_card/4d69b8cb68c84988aa74e389287fe2a7.jpg','/WEB-INF/upload/img/id_card/89d9317fb3834353bcf2a507bee2eb82/b25f4d925ca3481284f541555ca7a265.jpg',NULL,'da1f6e509bdb43cd93e2bb4c7cbaa0e5',2,'Am-TGPU3Vi0R38DnVWrM2c7TfOzIgKO-7lVZjG7RJHA8'),('89d9317fb3834353bcf2a507bee2eb82','10001','27a9c57b4c69441aa569ef4ae1a9ef7c',1002,'张三','825682eafec59c2e1632828195133a52','男','13688888888','2017-06-14','x胡同y巷z号','北京市 西城区','','2017-06-14 10:38:46','2017-09-20 15:16:28','u_st_2','','','/upload/img/user/head_portrait/89d9317fb3834353bcf2a507bee2eb82/ae57d7661ae642498cbdf5f586ed48ae.jpg','','ad26681fea6349ee8e6ec6d49026cd5a1504144286906',0,NULL,'','','2017-07-01 11:56:19','','b765c637c95e43e6b395348b6ef72435','285746c4af0949518c2dbf301d2ad7ab','6192971fdd4d47d2b4ce77a3723a311b',2,''),('89d9317fb3834353bcf2a507bee2eb83','10001','27a9c57b4c69441aa569ef4ae1a9ef7d',1003,'李四','825682eafec59c2e1632828195133a52','女','13699999999','2017-06-14','z胡同y巷x号','北京市 西城区','','2017-06-14 10:38:46','2017-08-12 14:59:41','u_st_2','','','','','22766697f14448c4ab032e2f168ca2d41500285106132',0,NULL,'','','2017-07-01 11:56:19',NULL,NULL,NULL,'6d163a17a8b842dd98de4b059b893666',2,'Am-TGPU3Vi0R38DnVWrM2c7TfOzIgKO-7lVZjG7RJHA8'),('93ca6a0c638243aeab0b3412915581e2','10001','6256feb92d844cd5951d7cfe01d922ed',1003,'tom','825682eafec59c2e1632828195133a52','男','13597165115',NULL,'','','','2017-07-19 08:53:52','2017-07-19 08:53:52','u_st_2','','','','','22766697f14448c4ab032e2f168ca2d41500285106132',0,NULL,'465465121354678945','','2017-07-19 08:53:52','','',NULL,'4ae60c74c30143feb898d721a1299dd7',2,'Am-TGPU3Vi0R38DnVWrM2c7TfOzIgKO-7lVZjG7RJHA8'),('b970431e6dc543a285ca4fedcd64cb3a','10001','',1001,'四四','','女','13366663333','1993-03-13','address-333','','','2017-09-20 17:20:15','2017-09-20 17:20:15','u_st_0','','','','','',0,NULL,'','','2017-09-20 17:20:15','','','','',2,''),('ba5482eb62b74bdb9db459acc4994656','10000','92da6064f89047cb84406c8859fc407d',1002,'芳芳','','女','13355667788',NULL,'','','','2017-09-22 10:18:11','2017-09-22 10:18:11','','','','','','',0,NULL,'313','','2017-09-22 10:18:11',NULL,NULL,NULL,'46f4d1bb405c4d95bffcf115c1a79e02',2,'');
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
INSERT INTO `user_breed` VALUES ('7ca8d18306514e64990bebbe77fdfba0','','','',0,0,0,0,0,'',0,'943503bf37784ebea6538e2e743295dc',0,0,'2017-09-20 09:16:17','{\"信息2\":\"内容B\",\"信息1\":\"内容A\",\"类目1\":\"选项A\"}');
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
INSERT INTO `user_place` VALUES ('104d09740ca74b5592859e74dfd203bd','1ddd3d18c22a4c129c2517d50e69a400','',222,0,1,123,'','地区','allow','2017-09-09 11:28:41',0,NULL),('86bf38e9da59470386988684f564922d','1ddd3d18c22a4c129c2517d50e69a400','',131,0,1,123,'','地区','allow','2017-09-05 09:34:58',0,NULL);
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
INSERT INTO `user_qm_permission_re` VALUES ('89d9317fb3834353bcf2a507bee2eb82','889716e1a2784416a9b924131338c83b'),('89d9317fb3834353bcf2a507bee2eb82','d5a4e5dea5474aefaf3a2c267c09db42'),('89d9317fb3834353bcf2a507bee2eb82','b9c9f7a0b24e4b218627db8d7adb2402'),('89d9317fb3834353bcf2a507bee2eb82','ca44615670aa417095083b04324a9362'),('89d9317fb3834353bcf2a507bee2eb82','3e36f999ab6247848db16ca20e6c5910'),('89d9317fb3834353bcf2a507bee2eb82','717225a898044fbb8e44175dc0c19d0b'),('89d9317fb3834353bcf2a507bee2eb82','7bd549e0ca494f2387ef1a89f694cf06'),('89d9317fb3834353bcf2a507bee2eb82','83df51b1b6324fe5aa86458bf009955c'),('89d9317fb3834353bcf2a507bee2eb82','8737fe4c082e47fe82cbb0e0dcccfc32'),('89d9317fb3834353bcf2a507bee2eb82','8e2a86f8e8e84616a739dd2608cbac08'),('89d9317fb3834353bcf2a507bee2eb82','b406b06df0464de3b43eb6bac20f6020'),('89d9317fb3834353bcf2a507bee2eb82','d171e393b87d4ea4b47fa1ae84133b5f'),('89d9317fb3834353bcf2a507bee2eb82','d831fed38df849bf948e9bfc44398efc'),('89d9317fb3834353bcf2a507bee2eb82','db3131e947eb4de382493f9d5197705b'),('89d9317fb3834353bcf2a507bee2eb82','dba9e35f02844c1e892fa73cf62d3f82'),('89d9317fb3834353bcf2a507bee2eb82','f5c9249b46f641da873a40052e7cfeec'),('89d9317fb3834353bcf2a507bee2eb82','149bd9942355443b91d18e5d7315d863'),('89d9317fb3834353bcf2a507bee2eb82','3df3d136992049c6808983119e35f3f8'),('89d9317fb3834353bcf2a507bee2eb82','45e2b786f3f6421ea0c30f2d6df65418'),('89d9317fb3834353bcf2a507bee2eb82','4b972967a39446c49190e16d170143a6'),('89d9317fb3834353bcf2a507bee2eb82','52650715529a4400b15166efd1bfda79'),('89d9317fb3834353bcf2a507bee2eb82','5923178c2e464581a07e4deb6fff863c'),('89d9317fb3834353bcf2a507bee2eb82','5d78364d6e88419eb8ce0ed850f0e9d5');
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

-- Dump completed on 2017-09-22 10:22:28
