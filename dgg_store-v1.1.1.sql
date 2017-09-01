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
INSERT INTO `common_apply` VALUES ('a2f3449d9a2442ec95dfd79899e93ce7','请假申请','89d9317fb3834353bcf2a507bee2eb82','张三','2017-08-30','2017-08-31','2017-08-30 17:58:50',12,'累'),('d37a103a7eac40319174bdd34d9cca8f','请假申请','89d9317fb3834353bcf2a507bee2eb82','张三','2017-08-30','2017-08-31','2017-08-30 17:59:28',12,'累');
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
INSERT INTO `common_apply_approve` VALUES ('a2f3449d9a2442ec95dfd79899e93ce7','89d9317fb3834353bcf2a507bee2eb84','王五',22,1,NULL),('a2f3449d9a2442ec95dfd79899e93ce7','41370f132bd44bca943e2fe5dd9862ab','赵六',20,2,NULL),('d37a103a7eac40319174bdd34d9cca8f','89d9317fb3834353bcf2a507bee2eb84','王五',21,1,NULL),('d37a103a7eac40319174bdd34d9cca8f','41370f132bd44bca943e2fe5dd9862ab','赵六',22,2,NULL);
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
INSERT INTO `common_apply_image` VALUES ('d37a103a7eac40319174bdd34d9cca8f','64801674a5c4457bb0e04cf5dbf269c4','/upload/img/user/apply/89d9317fb3834353bcf2a507bee2eb82\\acc2e795e5034d8b9d31e1ba8b05dfc2.jpg',0);
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
INSERT INTO `customer` VALUES ('0d1b01313364488b91540b20e03f39b7','dealer','886fe37f32154440b7604ae0f13bca14','89d9317fb3834353bcf2a507bee2eb82','89d9317fb3834353bcf2a507bee2eb83','10001','','',0,0,NULL,0),('1ddd3d18c22a4c129c2517d50e69a400','dealer','3440e2c15478425298edb4c396c786d4','89d9317fb3834353bcf2a507bee2eb82','89d9317fb3834353bcf2a507bee2eb83','10001','','',0,0,NULL,0);
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
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_account_request`
--

LOCK TABLES `customer_account_request` WRITE;
/*!40000 ALTER TABLE `customer_account_request` DISABLE KEYS */;
INSERT INTO `customer_account_request` VALUES ('1e66dd440a8c4755bc8180de19481818','89d9317fb3834353bcf2a507bee2eb82','张三','1ddd3d18c22a4c129c2517d50e69a400','三三','89d9317fb3834353bcf2a507bee2eb83','李四','41370f132bd44bca943e2fe5dd9862ab','赵六',2,'2017-08-28 10:12:19'),('f7230fe1e2614a50bb977b3ea5ffa3c4','89d9317fb3834353bcf2a507bee2eb82','张三','1ddd3d18c22a4c129c2517d50e69a400','三三','89d9317fb3834353bcf2a507bee2eb83','李四','41370f132bd44bca943e2fe5dd9862ab','赵六',1,'2017-08-24 11:27:27');
/*!40000 ALTER TABLE `customer_account_request` ENABLE KEYS */;
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
INSERT INTO `department_position` VALUES ('4ae60c74c30143feb898d721a1299dd7','负责人','6256feb92d844cd5951d7cfe01d922ed'),('6192971fdd4d47d2b4ce77a3723a311b','负责人','27a9c57b4c69441aa569ef4ae1a9ef7c'),('6d163a17a8b842dd98de4b059b893664','成员','6256feb92d844cd5951d7cfe01d922ed'),('6d163a17a8b842dd98de4b059b893666','负责人','27a9c57b4c69441aa569ef4ae1a9ef7d'),('da1f6e509bdb43cd93e2bb4c7cbaa0e5','成员','27a9c57b4c69441aa569ef4ae1a9ef7c');
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
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_order`
--

LOCK TABLES `my_order` WRITE;
/*!40000 ALTER TABLE `my_order` DISABLE KEYS */;
INSERT INTO `my_order` VALUES ('2068d11cf4944fce8b38eb3cca9410bf',100,NULL,'3440e2c15478425298edb4c396c786d4','三三','','',NULL,1,10,112,'1','','2017-08-29 15:33:41',NULL,NULL);
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
INSERT INTO `my_order_list` VALUES ('2068d11cf4944fce8b38eb3cca9410bf','1f9b286b836c4175ab09a9b02cacbb7d','倍润828B,20%生长育肥猪浓缩饲料 使用阶段：60kg-出栏',5,'7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|','7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|','小包',3,0),('2068d11cf4944fce8b38eb3cca9410bf','9190f4574805419187a8029042803617','【畅消】4%中猪预混料 长势快 后劲强 适用于30~60KG',10,'7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|','7f919e4356a44fe8a199dde18d561cbc|bc13439ff4384bcab77d93911ce783f6|df85119137904e93895d8c76e06b1924|','大包',30,0);
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
  `my_team_area` varchar(50) NOT NULL DEFAULT '',
  `my_team_address` varchar(50) NOT NULL DEFAULT '',
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
INSERT INTO `my_team` VALUES ('10001','青麦科技','2017-06-14 10:38:11','','',0,1,'','0','39.939224,116.427612');
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
INSERT INTO `permission` VALUES ('2c26b3cf90d0478ab7e167d325fe18f2','业务订单','','0','',0,NULL),('42b95b8f711447c49038e922c6f6167d','根据手机或姓名查找用户','/user_findUserByPhoneOrName','e7d92c8a7a914cc1ac4c69f19e6280a9','',0,NULL),('499aeeadb21d4311bd79d712761a989c','业务审核通过','/user_updateSalesmanPass','2c26b3cf90d0478ab7e167d325fe18f2','',0,NULL),('4da35a0112bd458f924232d98132a283','财务A轮审核不通过','/user_updateFinanceFailA','2c26b3cf90d0478ab7e167d325fe18f2','',0,NULL),('5d4c37102aa943f48a679cca07fe2bb3','客户管理','','0','',0,NULL),('649663c1e3e247708df7de7c0018fb3b','登录组织管理','/s/login','71e4956673c14543a2ed8c8e3c65e0a4','',0,NULL),('678dba65e68f4bf88648e81d5bd9be8a','查找分类下的客户','/s/findCustomerByGroup','5d4c37102aa943f48a679cca07fe2bb3','',0,NULL),('6bb47e49d7cc470680a586da0bd85f33','发起添加好友申请','/user_addFriendRequest','e7d92c8a7a914cc1ac4c69f19e6280a9','',0,NULL),('71478daa45b54bc3a94f81a11f5c292f','设置好友申请为已读','/user_updateRequestIsRead','e7d92c8a7a914cc1ac4c69f19e6280a9','',0,NULL),('71e4956673c14543a2ed8c8e3c65e0a4','组织管理','','0','',0,NULL),('742cbb56d23e45048611200e846933a7','财务退款','/user_updateRefundMoney','2c26b3cf90d0478ab7e167d325fe18f2','',0,NULL),('942f55f2332646a581de2bc6540f03a1','查找客户更新次数','/s/findCustomerUpdateCount','5d4c37102aa943f48a679cca07fe2bb3','',0,NULL),('a91b37fd239d4b73ba92226e6d95f7d4','跟单确认收到退货','/user_updateRefundReceive','2c26b3cf90d0478ab7e167d325fe18f2','',0,NULL),('b08a3600a23a4fc19617b75d0b61fe9b','财务B轮审核通过','/user_updateFinancePassB','2c26b3cf90d0478ab7e167d325fe18f2','',0,NULL),('b10aec46954a49aa9857c02746b874fc','财务B轮审核不通过','/user_updateFinanceFailB','2c26b3cf90d0478ab7e167d325fe18f2','',0,NULL),('b18ea1a89d0948c4a293a6d21b47afeb','查找部门下成员','/s/findMemberList','71e4956673c14543a2ed8c8e3c65e0a4','',0,NULL),('bad6c8f4a96343fd88749925cc852e15','跟单同意退款','/user_updateRefundPass','2c26b3cf90d0478ab7e167d325fe18f2','',0,NULL),('bcb06295c7b04ba8b3b56a42ca66a9ce','确认发货','/user_updateDelivered','2c26b3cf90d0478ab7e167d325fe18f2','',0,NULL),('c442c7be80f7428eae971888176647c4','获取好友申请总数','/user_findFriendRequestCount','e7d92c8a7a914cc1ac4c69f19e6280a9','',0,NULL),('c901587599ad40c7a1f2dd6c0e7ccbb1','查看客户详情','/s/findCustomerInfo','5d4c37102aa943f48a679cca07fe2bb3','',0,NULL),('c9c6b6a0f3a040e2a02cf93f7c886400','更新好友备注','/user_updateFriendRemark','e7d92c8a7a914cc1ac4c69f19e6280a9','',0,NULL),('caa3b16c0cd04f31ae63681d53c95fd4','获取未读消息总数','/user_findNotReadChatHistoryCount','e7d92c8a7a914cc1ac4c69f19e6280a9','',0,NULL),('cb6831e81c274cc8b6d1e3f81847ea35','获取好友申请','/user_findFriendRequest','e7d92c8a7a914cc1ac4c69f19e6280a9','',0,NULL),('cede163f9abd4bcca09e11714c61bb05','客户建档','/s/addCustomerRecord','5d4c37102aa943f48a679cca07fe2bb3','',0,NULL),('d2d8cff538074519b2835409eccee4cf','财务A轮审核通过','/user_updateFinancePassA','2c26b3cf90d0478ab7e167d325fe18f2','',0,NULL),('d31989274caa46c59e8e6990101586cb','查看好友列表','/user_findFriendList','e7d92c8a7a914cc1ac4c69f19e6280a9','',0,NULL),('e2db4bd557094c43879fc49b0607da36','查看好友详情','/user_findFriendData','e7d92c8a7a914cc1ac4c69f19e6280a9','',0,NULL),('e7d92c8a7a914cc1ac4c69f19e6280a9','我的好友','','0','',0,NULL),('eec5a2fa74d749d49c8d1a6777f60332','获取未读消息','/user_findNotReadChatHistory','e7d92c8a7a914cc1ac4c69f19e6280a9','',0,NULL),('f88e3b58298f475192a346608da993bf','拒绝好友申请','/user_negativeFriendRequest','e7d92c8a7a914cc1ac4c69f19e6280a9','',0,NULL),('fa3c507ecc664802841f4eb53ded32a3','同意好友申请','/user_agreeFriendRequest','e7d92c8a7a914cc1ac4c69f19e6280a9','',0,NULL);
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
INSERT INTO `position_permission_re` VALUES ('6192971fdd4d47d2b4ce77a3723a311b','account_check'),('6192971fdd4d47d2b4ce77a3723a311b','follow'),('6192971fdd4d47d2b4ce77a3723a311b','986b810014e44d2c9d5b383f2a83da3c');
/*!40000 ALTER TABLE `position_permission_re` ENABLE KEYS */;
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
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `delete_date` date DEFAULT NULL,
  PRIMARY KEY (`qm_permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm_permission`
--

LOCK TABLES `qm_permission` WRITE;
/*!40000 ALTER TABLE `qm_permission` DISABLE KEYS */;
INSERT INTO `qm_permission` VALUES ('47d99008f4594d64a66300e96e2f0b5b','订单管理','','0',1,0,NULL),('63eae3f2b2164114b5c31b462180436e','库存管理','','0',1,0,NULL),('6a3479c94a4d43348b7fe37054013126','后台系统登陆','','0',1,0,NULL),('83ffc4a0432e4945890534583d62dd0a','登陆后台系统','登陆后台系统的权限','6a3479c94a4d43348b7fe37054013126',1,0,NULL),('986b810014e44d2c9d5b383f2a83da3c','我的好友使用权','查找、添加好友，删除好友，推荐好友，添加好友备注','c80bfab8902c402ba3019dfca8cf3a61',1,0,NULL),('986b810014e44d2c9d5b383f2a83da3d','添加部门/职位','拥有添加部门和职位的权限','c80bfab8902c402ba3019dfca8cf3a62',1,0,NULL),('account_check','建账审核','拥有审核客户建账的权限','47d99008f4594d64a66300e96e2f0b5b',1,0,NULL),('c80bfab8902c402ba3019dfca8cf3a61','我的好友','','0',1,0,NULL),('c80bfab8902c402ba3019dfca8cf3a62','部门/职位管理权','','0',1,0,NULL),('f78234ffb82b4ec79d7eb5486ce9b3fc','库存申请权','对总部发起库存申请','63eae3f2b2164114b5c31b462180436e',1,0,NULL),('follow','跟单权限','对客户订单的跟进权限','47d99008f4594d64a66300e96e2f0b5b',1,0,NULL),('repertory_check','库存审批权','审批库存申请的权限','63eae3f2b2164114b5c31b462180436e',1,0,NULL);
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
INSERT INTO `qm_permission_re` VALUES ('42b95b8f711447c49038e922c6f6167d','986b810014e44d2c9d5b383f2a83da3c'),('caa3b16c0cd04f31ae63681d53c95fd4','986b810014e44d2c9d5b383f2a83da3c'),('cb6831e81c274cc8b6d1e3f81847ea35','986b810014e44d2c9d5b383f2a83da3c'),('d31989274caa46c59e8e6990101586cb','986b810014e44d2c9d5b383f2a83da3c'),('e2db4bd557094c43879fc49b0607da36','986b810014e44d2c9d5b383f2a83da3c'),('eec5a2fa74d749d49c8d1a6777f60332','986b810014e44d2c9d5b383f2a83da3c'),('f88e3b58298f475192a346608da993bf','986b810014e44d2c9d5b383f2a83da3c'),('c9c6b6a0f3a040e2a02cf93f7c886400','986b810014e44d2c9d5b383f2a83da3c'),('c442c7be80f7428eae971888176647c4','986b810014e44d2c9d5b383f2a83da3c'),('6bb47e49d7cc470680a586da0bd85f33','986b810014e44d2c9d5b383f2a83da3c'),('71478daa45b54bc3a94f81a11f5c292f','986b810014e44d2c9d5b383f2a83da3c'),('fa3c507ecc664802841f4eb53ded32a3','986b810014e44d2c9d5b383f2a83da3c'),('649663c1e3e247708df7de7c0018fb3b','83ffc4a0432e4945890534583d62dd0a'),('649663c1e3e247708df7de7c0018fb3b','83ffc4a0432e4945890534583d62dd0a'),('649663c1e3e247708df7de7c0018fb3b','83ffc4a0432e4945890534583d62dd0a'),('649663c1e3e247708df7de7c0018fb3b','83ffc4a0432e4945890534583d62dd0a'),('649663c1e3e247708df7de7c0018fb3b','83ffc4a0432e4945890534583d62dd0a'),('649663c1e3e247708df7de7c0018fb3b','83ffc4a0432e4945890534583d62dd0a'),('649663c1e3e247708df7de7c0018fb3b','986b810014e44d2c9d5b383f2a83da3d'),('bcb06295c7b04ba8b3b56a42ca66a9ce','follow'),('bad6c8f4a96343fd88749925cc852e15','follow'),('499aeeadb21d4311bd79d712761a989c','follow'),('a91b37fd239d4b73ba92226e6d95f7d4','follow');
/*!40000 ALTER TABLE `qm_permission_re` ENABLE KEYS */;
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
INSERT INTO `team_department` VALUES ('27a9c57b4c69441aa569ef4ae1a9ef7c','总经办','manager',NULL,'0','2017-06-06 00:00:00','10001'),('27a9c57b4c69441aa569ef4ae1a9ef7d','财务部','',NULL,'0','2017-06-06 10:20:45','10001'),('6256feb92d844cd5951d7cfe01d922ed','技术部','',NULL,'0','2017-06-26 00:00:00','10001');
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
  PRIMARY KEY (`user_id`),
  KEY `FK_user_role_re` (`role_id`),
  KEY `FK_user_team_re` (`my_team_id`),
  KEY `FK_user_department_re` (`team_department_id`),
  CONSTRAINT `FK_user_role_re` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `FK_user_team_re` FOREIGN KEY (`my_team_id`) REFERENCES `my_team` (`my_team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('3440e2c15478425298edb4c396c786d4','10001','',1001,'三三','','女','13366663333','1993-03-13','address-333','','','2017-08-23 09:33:12','2017-08-23 09:33:12','u_st_0','','','','','22766697f14448c4ab032e2f168ca2d41500285106132',0,NULL,'','','2017-08-23 09:33:12','','','','',2),('41370f132bd44bca943e2fe5dd9862ab','10001','27a9c57b4c69441aa569ef4ae1a9ef7c',1003,'赵六','825682eafec59c2e1632828195133a52','女','13657981326',NULL,'','','','2017-07-07 17:16:19','2017-07-07 17:16:19','u_st_2','','','','','22766697f14448c4ab032e2f168ca2d41500285106132',0,NULL,'135621567845465420','','2017-07-07 17:16:19','/WEB-INF/upload/img/id_card/4d69b8cb68c84988aa74e389287fe2a7.jpg','/WEB-INF/upload/img/id_card/89d9317fb3834353bcf2a507bee2eb82/b25f4d925ca3481284f541555ca7a265.jpg',NULL,'da1f6e509bdb43cd93e2bb4c7cbaa0e5',2),('7780058de7bf4d0ea20c791e50b6131f','10001','27a9c57b4c69441aa569ef4ae1a9ef7c',1003,'12','','男','3',NULL,'','','','2017-09-01 14:24:03','2017-09-01 14:24:03','u_st_1','','','','','',0,NULL,'d','','2017-09-01 14:24:03','/WEB-INF/upload/img/id_card/335e6fbaba1f40bb82315dd87de278ec.jpg','/WEB-INF/upload/img/id_card/9f5c7651692147feaf246cf0610c209f.jpg',NULL,'da1f6e509bdb43cd93e2bb4c7cbaa0e5',2),('89d9317fb3834353bcf2a507bee2eb82','10001','27a9c57b4c69441aa569ef4ae1a9ef7c',1003,'张三','825682eafec59c2e1632828195133a52','男','13688888888','2017-06-14','x胡同y巷z号','北京市 西城区','','2017-06-14 10:38:46','2017-08-31 09:51:00','u_st_2','','','/upload/img/user/head_portrait/89d9317fb3834353bcf2a507bee2eb82/716b9988505546ea9f84f5b86382f12a.jpg','','ad26681fea6349ee8e6ec6d49026cd5a1504144286906',0,NULL,'','','2017-07-01 11:56:19','','b765c637c95e43e6b395348b6ef72435','285746c4af0949518c2dbf301d2ad7ab','6192971fdd4d47d2b4ce77a3723a311b',2),('89d9317fb3834353bcf2a507bee2eb83','10001','27a9c57b4c69441aa569ef4ae1a9ef7d',1003,'李四','825682eafec59c2e1632828195133a52','女','13699999999','2017-06-14','z胡同y巷x号','北京市 西城区','','2017-06-14 10:38:46','2017-08-12 14:59:41','u_st_2','','','','','22766697f14448c4ab032e2f168ca2d41500285106132',0,NULL,'','','2017-07-01 11:56:19',NULL,NULL,NULL,'6d163a17a8b842dd98de4b059b893666',2),('89d9317fb3834353bcf2a507bee2eb84','10001','27a9c57b4c69441aa569ef4ae1a9ef7c',1003,'王五','825682eafec59c2e1632828195133a52','男','13677777777','2017-06-14','a胡同b巷c号','北京市 西城区','','2017-06-14 10:38:46','2017-06-14 10:38:46','u_st_2','','','/upload/img/user/head_portrait/89d9317fb3834353bcf2a507bee2eb82/34ac4d747a35414dbf249b6add3e8348.jpg','','22766697f14448c4ab032e2f168ca2d41500285106132',0,NULL,'','','2017-07-01 11:56:19',NULL,NULL,NULL,'da1f6e509bdb43cd93e2bb4c7cbaa0e5',2),('93ca6a0c638243aeab0b3412915581e2','10001','6256feb92d844cd5951d7cfe01d922ed',1003,'tom','825682eafec59c2e1632828195133a52','男','13597165115',NULL,'','','','2017-07-19 08:53:52','2017-07-19 08:53:52','u_st_2','','','','','22766697f14448c4ab032e2f168ca2d41500285106132',0,NULL,'465465121354678945','','2017-07-19 08:53:52','','',NULL,'4ae60c74c30143feb898d721a1299dd7',2);
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
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `delete_date` datetime DEFAULT NULL,
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
INSERT INTO `user_qm_permission_re` VALUES ('89d9317fb3834353bcf2a507bee2eb82','account_check'),('89d9317fb3834353bcf2a507bee2eb82','follow'),('89d9317fb3834353bcf2a507bee2eb82','repertory_check'),('89d9317fb3834353bcf2a507bee2eb82','83ffc4a0432e4945890534583d62dd0a'),('89d9317fb3834353bcf2a507bee2eb82','986b810014e44d2c9d5b383f2a83da3c'),('7780058de7bf4d0ea20c791e50b6131f','83ffc4a0432e4945890534583d62dd0a'),('7780058de7bf4d0ea20c791e50b6131f','986b810014e44d2c9d5b383f2a83da3c'),('7780058de7bf4d0ea20c791e50b6131f','986b810014e44d2c9d5b383f2a83da3d');
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
  `real_name` tinyint(4) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_record`
--

LOCK TABLES `user_record` WRITE;
/*!40000 ALTER TABLE `user_record` DISABLE KEYS */;
INSERT INTO `user_record` VALUES ('886fe37f32154440b7604ae0f13bca14','10001','',1001,'三三','','女','13366663333','1993-03-13','address-333','','','2017-08-28 10:11:49','2017-08-28 10:11:48','u_st_0','','','','','',0,NULL,'','','2017-08-28 10:11:48','','','','',2);
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

-- Dump completed on 2017-09-01 18:03:40
