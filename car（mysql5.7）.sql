-- MySQL dump 10.13  Distrib 5.7.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: car
-- ------------------------------------------------------
-- Server version	5.7.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group`
(
    `id`   int(11)      NOT NULL AUTO_INCREMENT,
    `name` varchar(150) NOT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions`
(
    `id`            int(11) NOT NULL AUTO_INCREMENT,
    `group_id`      int(11) NOT NULL,
    `permission_id` int(11) NOT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`, `permission_id`) USING BTREE,
    KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`) USING BTREE,
    CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
    CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission`
(
    `id`              int(11)      NOT NULL AUTO_INCREMENT,
    `name`            varchar(255) NOT NULL,
    `content_type_id` int(11)      NOT NULL,
    `codename`        varchar(100) NOT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`, `codename`) USING BTREE,
    CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 41
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission`
    DISABLE KEYS */;
INSERT INTO `auth_permission`
VALUES (1, 'Can add log entry', 1, 'add_logentry'),
       (2, 'Can change log entry', 1, 'change_logentry'),
       (3, 'Can delete log entry', 1, 'delete_logentry'),
       (4, 'Can view log entry', 1, 'view_logentry'),
       (5, 'Can add permission', 2, 'add_permission'),
       (6, 'Can change permission', 2, 'change_permission'),
       (7, 'Can delete permission', 2, 'delete_permission'),
       (8, 'Can view permission', 2, 'view_permission'),
       (9, 'Can add group', 3, 'add_group'),
       (10, 'Can change group', 3, 'change_group'),
       (11, 'Can delete group', 3, 'delete_group'),
       (12, 'Can view group', 3, 'view_group'),
       (13, 'Can add user', 4, 'add_user'),
       (14, 'Can change user', 4, 'change_user'),
       (15, 'Can delete user', 4, 'delete_user'),
       (16, 'Can view user', 4, 'view_user'),
       (17, 'Can add content type', 5, 'add_contenttype'),
       (18, 'Can change content type', 5, 'change_contenttype'),
       (19, 'Can delete content type', 5, 'delete_contenttype'),
       (20, 'Can view content type', 5, 'view_contenttype'),
       (21, 'Can add session', 6, 'add_session'),
       (22, 'Can change session', 6, 'change_session'),
       (23, 'Can delete session', 6, 'delete_session'),
       (24, 'Can view session', 6, 'view_session'),
       (25, 'Can add 商品信息', 7, 'add_commodityinfos'),
       (26, 'Can change 商品信息', 7, 'change_commodityinfos'),
       (27, 'Can delete 商品信息', 7, 'delete_commodityinfos'),
       (28, 'Can view 商品信息', 7, 'view_commodityinfos'),
       (29, 'Can add 商品类型', 8, 'add_types'),
       (30, 'Can change 商品类型', 8, 'change_types'),
       (31, 'Can delete 商品类型', 8, 'delete_types'),
       (32, 'Can view 商品类型', 8, 'view_types'),
       (33, 'Can add 购物车', 9, 'add_cartinfos'),
       (34, 'Can change 购物车', 9, 'change_cartinfos'),
       (35, 'Can delete 购物车', 9, 'delete_cartinfos'),
       (36, 'Can view 购物车', 9, 'view_cartinfos'),
       (37, 'Can add 订单信息', 10, 'add_orderinfos'),
       (38, 'Can change 订单信息', 10, 'change_orderinfos'),
       (39, 'Can delete 订单信息', 10, 'delete_orderinfos'),
       (40, 'Can view 订单信息', 10, 'view_orderinfos');
/*!40000 ALTER TABLE `auth_permission`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user`
(
    `id`           int(11)      NOT NULL AUTO_INCREMENT,
    `password`     varchar(128) NOT NULL,
    `last_login`   datetime(6) DEFAULT NULL,
    `is_superuser` tinyint(1)   NOT NULL,
    `username`     varchar(150) NOT NULL,
    `first_name`   varchar(150) NOT NULL,
    `last_name`    varchar(150) NOT NULL,
    `email`        varchar(254) NOT NULL,
    `is_staff`     tinyint(1)   NOT NULL,
    `is_active`    tinyint(1)   NOT NULL,
    `date_joined`  datetime(6) DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user`
    DISABLE KEYS */;
INSERT INTO `auth_user`
VALUES (1, 'pbkdf2_sha256$180000$E0qJFonpGRDR$JtVZtfWCGe1DAOE07rHCVTlv5aWc0iz+sSLwqqFTr6w=',
        '2020-03-23 06:10:13.563622', 0, '13435423143', '', '', '', 1, 1, '2020-03-15 15:57:00.833884'),
       (2, 'pbkdf2_sha256$180000$At3aYjpISu82$R7bdGl2DXza5QeL+ix1wMN8Jpk/ZV8lCvD4rFjEPdAk=',
        '2020-03-20 20:58:22.819140', 0, '13800138001', '', '', '', 1, 1, '2020-03-18 13:36:23.868460'),
       (3, 'pbkdf2_sha256$180000$2eJ0TPkb0tnz$0uDiusZeZeqoKJPRF47X5Ht53BhG7vjpFTVjxWoSP/w=', NULL, 0, '13800138002', '',
        '', '', 1, 1, '2020-03-18 13:44:49.759706'),
       (4, 'pbkdf2_sha256$180000$f4ITV8ohCE9V$UzjFyfQx2KLR4f1WRda8UjxN/O5R5MCz9W5+5ruZtpE=', NULL, 0, '13800138019', '',
        '', '', 1, 1, '2020-03-20 19:42:09.213362'),
       (5, 'pbkdf2_sha256$180000$z4UBsmS1SBDV$caS1L0Gc7OMjh2Zt/4qURZv1+TfOWXnjMOP8PFJbvp4=', NULL, 0, '13800138020', '',
        '', '', 1, 1, '2020-03-20 19:49:06.244017'),
       (6, 'pbkdf2_sha256$180000$lmeJpXObPmkW$W0a/+CnBM5iE+RMrZpgEem3hYFBkYLFWquTp62fli1o=',
        '2020-03-20 20:00:10.783815', 0, '13800138021', '', '', '', 1, 1, '2020-03-20 19:51:29.472941'),
       (7, 'pbkdf2_sha256$180000$prFFunZxwFSW$+pGe0nzKREB9UISl1k4SJwy/J4D6DTCrr3Z9qRy03z0=',
        '2020-03-20 20:18:56.685928', 0, '13800138030', '', '', '', 1, 1, '2020-03-20 20:18:17.733500'),
       (8, 'pbkdf2_sha256$320000$FabaLp9VMnWONWR3trR6i3$J62/3g9/qA4qTlzOH406HCa7jMdRQTCWOKXmZB9nL3o=',
        '2020-03-29 12:42:04.657537', 1, 'admin', '', '', '', 1, 1, '2020-03-29 12:41:45.739651'),
       (9, 'pbkdf2_sha256$180000$glARPxfubTBG$9K7saCHrrO93F/XhwE3Dt9IdaP/vZb7bHHRDxIEfDYw=',
        '2020-03-31 15:33:09.438771', 0, 'root', '', '', '', 1, 1, '2020-03-31 14:29:00.000000'),
       (10, 'pbkdf2_sha256$320000$FabaLp9VMnWONWR3trR6i3$J62/3g9/qA4qTlzOH406HCa7jMdRQTCWOKXmZB9nL3o=',
        '2022-06-19 03:48:35.497518', 0, '18663140495', '', '', '', 1, 1, '2022-06-19 03:48:33.598247');
/*!40000 ALTER TABLE `auth_user`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT,
    `user_id`  int(11) NOT NULL,
    `group_id` int(11) NOT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`, `group_id`) USING BTREE,
    KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`) USING BTREE,
    CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
    CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions`
(
    `id`            int(11) NOT NULL AUTO_INCREMENT,
    `user_id`       int(11) NOT NULL,
    `permission_id` int(11) NOT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`, `permission_id`) USING BTREE,
    KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`) USING BTREE,
    CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
    CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 41
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions`
    DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions`
VALUES (1, 9, 1),
       (2, 9, 2),
       (3, 9, 3),
       (4, 9, 4),
       (5, 9, 5),
       (6, 9, 6),
       (7, 9, 7),
       (8, 9, 8),
       (9, 9, 9),
       (10, 9, 10),
       (11, 9, 11),
       (12, 9, 12),
       (13, 9, 13),
       (14, 9, 14),
       (15, 9, 15),
       (16, 9, 16),
       (17, 9, 17),
       (18, 9, 18),
       (19, 9, 19),
       (20, 9, 20),
       (21, 9, 21),
       (22, 9, 22),
       (23, 9, 23),
       (24, 9, 24),
       (25, 9, 25),
       (26, 9, 26),
       (27, 9, 27),
       (28, 9, 28),
       (29, 9, 29),
       (30, 9, 30),
       (31, 9, 31),
       (32, 9, 32),
       (33, 9, 33),
       (34, 9, 34),
       (35, 9, 35),
       (36, 9, 36),
       (37, 9, 37),
       (38, 9, 38),
       (39, 9, 39),
       (40, 9, 40);
/*!40000 ALTER TABLE `auth_user_user_permissions`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodity_commodityinfos`
--

DROP TABLE IF EXISTS `commodity_commodityinfos`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodity_commodityinfos`
(
    `id`       int(11)      NOT NULL AUTO_INCREMENT,
    `name`     varchar(100) NOT NULL,
    `sezes`    varchar(100) NOT NULL,
    `types`    varchar(100) NOT NULL,
    `price`    double       NOT NULL,
    `discount` double       NOT NULL,
    `stock`    int(11)      NOT NULL,
    `sold`     int(11)      NOT NULL,
    `likes`    int(11)      NOT NULL,
    `created`  date         NOT NULL,
    `img`      varchar(100) NOT NULL,
    `details`  varchar(100) NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 23
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity_commodityinfos`
--

LOCK TABLES `commodity_commodityinfos` WRITE;
/*!40000 ALTER TABLE `commodity_commodityinfos`
    DISABLE KEYS */;
INSERT INTO `commodity_commodityinfos`
VALUES (1, '飞利浦行车记录仪', '默认', '行车记录仪', 199, 188, 1311, 1666, 666, '2020-02-24', 'imgs/xingchejiluyi.jpg',
        'details/xingchejiluyidetail.jpg'),
       (2, '比飞利浦还好的行车记录仪', '默认', '行车记录仪', 121, 66, 1234, 2111, 599, '2020-02-24',
        'imgs/xingchejiluyi2.jpg', 'details/xingchejiluyi2detail.jpg'),
       (3, '金士顿内存卡', '默认', '内存卡', 250, 999, 2346, 1322, 333, '2020-02-24', 'imgs/neicunka1.jpg',
        'details/neicunka1detail.jpg'),
       (4, '三星内存卡', '默认', '内存卡', 50, 39, 2343, 4521, 902, '2020-02-24', 'imgs/neicunka2.jpg',
        'details/neicunka2detail.jpg'),
       (5, '超舒服头枕', '黑色', '头枕', 145, 111, 1341, 3412, 2356, '2020-02-24', 'imgs/touzhen1.jpg',
        'details/touzhen1detail.jpg'),
       (6, '全包围脚垫', '黑色', '脚垫', 123, 119, 2342, 232, 1233, '2020-02-24', 'imgs/jiaodian1.jpg',
        'details/jiaodian1detail.jpg'),
       (7, '冬暖夏凉坐垫', '黑色', '坐垫', 166, 111, 213, 2341, 1233, '2020-02-24', 'imgs/zuodian1.jpg',
        'details/zuodian1detail.jpg'),
       (8, '徕本洗车机高压水泵水枪神器', '黑白色', '洗车机', 124, 121, 531, 1345, 879, '2020-02-24',
        'imgs/xicheji1.jpg', 'details/xicheji1detail.jpg'),
       (9, '汽车玻璃水雨刷精雨刮水四季通用', '1L', '消耗品', 399, 366, 1233, 1231, 666, '2020-02-24',
        'imgs/bolishui1.jpg', 'details/bolishui1detail.jpg'),
       (10, '多功能泡沫清洁剂', '250ml', '消耗品', 209, 159, 1234, 4321, 3335, '2020-02-24', 'imgs/qingjieji1.jpg',
        'details/qingjieji1detail.jpg'),
       (11, '汽车除尘掸子擦车神器', '黑色', '毛刷', 30, 20, 3211, 1231, 2152, '2020-02-24', 'imgs/maoshua1.jpg',
        'details/maoshua1detail.jpg'),
       (12, '大众Hicar无线carplay', '黑色', 'carplay', 66, 38, 1543, 1845, 3245, '2020-02-24', 'imgs/carplay1.jpg',
        'details/carplay1detail.jpg'),
       (13, '迷你车载u盘64g', '银色', 'U盘', 59, 39, 1234, 3453, 2321, '2020-02-24', 'imgs/Upan1.jpg',
        'details/Upan1detail.jpg'),
       (14, '车载手机支架2021新款吸盘式', '黑色', '手机支架', 499, 399, 3231, 3412, 1234, '2020-02-24',
        'imgs/shoujizhijia1.jpg', 'details/shoujizhijia1detail.jpg'),
       (15, '汽车摆件车内饰品可爱小猫咪', '灰色', '装饰品', 888, 439, 1234, 1245, 2353, '2020-02-24',
        'imgs/zhuangshipin1.jpg', 'details/zhuangshipin1detail.jpg'),
       (16, '车载扶手箱收纳盒', '米色', '扶手箱', 688, 9999, 3421, 3644, 6245, '2020-02-24', 'imgs/fushouxiang1.jpg',
        'details/fushouxiang1detail.jpg'),
       (17, '铁夫车载冰箱', '黑色', '车载冰箱', 49.9, 29.9, 1231, 5674, 2317, '2020-02-24', 'imgs/chezaibingxiang1.jpg',
        'details/chezaibingxiang1detail.jpg'),
       (18, '汽车安全锤车用多功能车载手摇手电筒破窗神器应急救生自救逃生锤 ', '10瓶2球', '安全用品', 69, 29.9, 666, 1986,
        1569, '2020-02-24', 'imgs/anquanchui1.jpg', 'details/anquanchui1detail.jpg'),
       (19, '噗噗捏捏香香到爆香薰', '茉莉花香', '香薰', 59, 49, 555, 555, 555, '2022-06-19', 'imgs/xiangxun1.jpg',
        'details/xiangxun1detail.jpg'),
       (20, '噗噗捏捏香香到爆香薰', '花露水味', '香薰', 49, 39, 555, 444, 555, '2022-06-19', 'imgs/xiangxun2.jpg',
        'details/xiangxun2detail.jpg'),
       (21, '不好用的手机支架', '黑色', '手机支架', 19, 19, 555, 555, 555, '2022-06-19', 'imgs/shoujizhijia2.jpg',
        'details/shoujizhijia2detail.jpg'),
       (22, '特使', '默认', '行车记录仪', 199, 188, 1310, 999999, 666, '2020-02-24', 'imgs/xingchejiluyi.jpg',
        'details/xingchejiluyidetail.jpg');
/*!40000 ALTER TABLE `commodity_commodityinfos`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client = @@character_set_client */;
/*!50003 SET @saved_cs_results = @@character_set_results */;
/*!50003 SET @saved_col_connection = @@collation_connection */;
/*!50003 SET character_set_client = utf8mb4 */;
/*!50003 SET character_set_results = utf8mb4 */;
/*!50003 SET collation_connection = utf8mb4_general_ci */;
/*!50003 SET @saved_sql_mode = @@sql_mode */;
/*!50003 SET sql_mode =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
DELIMITER ;;
/*!50003 CREATE */ /*!50017 DEFINER =`root`@`localhost`*/ /*!50003 trigger commodity_limit5_trigger
    after update
    on commodity_commodityinfos
    for each row
begin
    if old.sold > new.sold then
        insert into commodity_sold(id, name, sezes, types, price)
        values (OLD.id, OLD.name, OLD.sezes, OLD.types, OLD.price);
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode = @saved_sql_mode */;
/*!50003 SET character_set_client = @saved_cs_client */;
/*!50003 SET character_set_results = @saved_cs_results */;
/*!50003 SET collation_connection = @saved_col_connection */;

--
-- Temporary table structure for view `commodity_limit5`
--

DROP TABLE IF EXISTS `commodity_limit5`;
/*!50001 DROP VIEW IF EXISTS `commodity_limit5`*/;
SET @saved_cs_client = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `commodity_limit5` AS
SELECT 1 AS `id`,
       1 AS `img`,
       1 AS `name`,
       1 AS `sold`,
       1 AS `types`,
       1 AS `firsts`
        */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `commodity_sold`
--

DROP TABLE IF EXISTS `commodity_sold`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodity_sold`
(
    `id`    int(11) NOT NULL,
    `date`  datetime     DEFAULT CURRENT_TIMESTAMP,
    `name`  varchar(100) DEFAULT NULL,
    `sezes` varchar(100) DEFAULT NULL,
    `types` varchar(100) DEFAULT NULL,
    `price` double       DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `commodity_sold_id_uindex` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity_sold`
--

LOCK TABLES `commodity_sold` WRITE;
/*!40000 ALTER TABLE `commodity_sold`
    DISABLE KEYS */;
INSERT INTO `commodity_sold`
VALUES (4, '2022-06-21 17:09:38', '三星内存卡', '默认', '内存卡', 50),
       (17, '2022-06-21 17:09:38', '铁夫车载冰箱', '黑色', '车载冰箱', 49.9),
       (22, '2022-06-21 17:09:38', '特使', '默认', '行车记录仪', 199);
/*!40000 ALTER TABLE `commodity_sold`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodity_types`
--

DROP TABLE IF EXISTS `commodity_types`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodity_types`
(
    `id`      int(11)      NOT NULL AUTO_INCREMENT,
    `firsts`  varchar(100) NOT NULL,
    `seconds` varchar(100) NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 20
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity_types`
--

LOCK TABLES `commodity_types` WRITE;
/*!40000 ALTER TABLE `commodity_types`
    DISABLE KEYS */;
INSERT INTO `commodity_types`
VALUES (1, '用车舒适', '头枕'),
       (2, '用车舒适', '坐垫'),
       (3, '用车舒适', '脚垫'),
       (4, '汽车清洁', '洗车机'),
       (5, '汽车清洁', '消耗品'),
       (6, '汽车清洁', '毛刷'),
       (7, '影视影音', 'carplay'),
       (8, '影视影音', 'U盘'),
       (9, '车内配件', '手机支架'),
       (10, '车内配件', '装饰品'),
       (11, '车内配件', '扶手箱'),
       (12, '车内配件', '车载冰箱'),
       (13, '行车安全', '内存卡'),
       (14, '行车安全', '安全用品'),
       (15, '车内配件', '挪车号码牌'),
       (16, '车内配件', '水杯架'),
       (17, '车内配件', '感应灯'),
       (18, '用车舒适', '香薰'),
       (19, '行车安全', '行车记录仪');
/*!40000 ALTER TABLE `commodity_types`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log`
(
    `id`              int(11)              NOT NULL AUTO_INCREMENT,
    `action_time`     datetime(6) DEFAULT NULL,
    `object_id`       longtext,
    `object_repr`     varchar(200)         NOT NULL,
    `action_flag`     smallint(5) unsigned NOT NULL,
    `change_message`  longtext             NOT NULL,
    `content_type_id` int(11)     DEFAULT NULL,
    `user_id`         int(11)              NOT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`) USING BTREE,
    KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`) USING BTREE,
    CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
    CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log`
    DISABLE KEYS */;
INSERT INTO `django_admin_log`
VALUES (1, '2020-03-31 14:29:14.791765', '9', 'root', 1, '[{\"added\": {}}]', 4, 8),
       (2, '2020-03-31 15:32:59.927205', '9', 'root', 2,
        '[{\"changed\": {\"fields\": [\"Staff status\", \"User permissions\"]}}]', 4, 8),
       (3, '2020-03-31 15:49:40.192259', '1', '1', 2, '[]', 7, 8);
/*!40000 ALTER TABLE `django_admin_log`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type`
(
    `id`        int(11)      NOT NULL AUTO_INCREMENT,
    `app_label` varchar(100) NOT NULL,
    `model`     varchar(100) NOT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`, `model`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type`
    DISABLE KEYS */;
INSERT INTO `django_content_type`
VALUES (1, 'admin', 'logentry'),
       (3, 'auth', 'group'),
       (2, 'auth', 'permission'),
       (4, 'auth', 'user'),
       (7, 'commodity', 'commodityinfos'),
       (8, 'commodity', 'types'),
       (5, 'contenttypes', 'contenttype'),
       (6, 'sessions', 'session'),
       (9, 'shopper', 'cartinfos'),
       (10, 'shopper', 'orderinfos');
/*!40000 ALTER TABLE `django_content_type`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations`
(
    `id`      int(11)      NOT NULL AUTO_INCREMENT,
    `app`     varchar(255) NOT NULL,
    `name`    varchar(255) NOT NULL,
    `applied` datetime(6) DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 21
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations`
    DISABLE KEYS */;
INSERT INTO `django_migrations`
VALUES (1, 'contenttypes', '0001_initial', '2020-02-24 15:16:26.623814'),
       (2, 'auth', '0001_initial', '2020-02-24 15:16:27.026737'),
       (3, 'admin', '0001_initial', '2020-02-24 15:16:28.147737'),
       (4, 'admin', '0002_logentry_remove_auto_add', '2020-02-24 15:16:28.523732'),
       (5, 'admin', '0003_logentry_add_action_flag_choices', '2020-02-24 15:16:28.536698'),
       (6, 'contenttypes', '0002_remove_content_type_name', '2020-02-24 15:16:28.766083'),
       (7, 'auth', '0002_alter_permission_name_max_length', '2020-02-24 15:16:29.015416'),
       (8, 'auth', '0003_alter_user_email_max_length', '2020-02-24 15:16:29.062290'),
       (9, 'auth', '0004_alter_user_username_opts', '2020-02-24 15:16:29.078248'),
       (10, 'auth', '0005_alter_user_last_login_null', '2020-02-24 15:16:29.194935'),
       (11, 'auth', '0006_require_contenttypes_0002', '2020-02-24 15:16:29.199921'),
       (12, 'auth', '0007_alter_validators_add_error_messages', '2020-02-24 15:16:29.211891'),
       (13, 'auth', '0008_alter_user_username_max_length', '2020-02-24 15:16:29.351528'),
       (14, 'auth', '0009_alter_user_last_name_max_length', '2020-02-24 15:16:29.515078'),
       (15, 'auth', '0010_alter_group_name_max_length', '2020-02-24 15:16:29.565943'),
       (16, 'auth', '0011_update_proxy_permissions', '2020-02-24 15:16:29.580902'),
       (17, 'commodity', '0001_initial', '2020-02-24 15:16:29.706567'),
       (18, 'sessions', '0001_initial', '2020-02-24 15:16:29.775383'),
       (19, 'shopper', '0001_initial', '2020-02-24 15:16:29.942934'),
       (20, 'auth', '0012_alter_user_first_name_max_length', '2022-06-17 06:27:15.081786');
/*!40000 ALTER TABLE `django_migrations`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session`
(
    `session_key`  varchar(40) NOT NULL,
    `session_data` longtext    NOT NULL,
    `expire_date`  datetime(6) DEFAULT NULL,
    PRIMARY KEY (`session_key`) USING BTREE,
    KEY `django_session_expire_date_a5c62663` (`expire_date`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session`
    DISABLE KEYS */;
INSERT INTO `django_session`
VALUES ('04gh5eoprgxcpo1nchzensd84p7wqfk5',
        'MmNiN2NiN2U0M2FlNTAwMzkzYTFiYjg0Y2ZhNDExMDczMDgwN2Q4YTp7Imxpa2VzIjpudWxsfQ==', '2020-03-26 13:36:44.052388'),
       ('2ydw817m4zhotqb44za44z5khm5cxjii',
        'NTNiMDMzZThjOWE3MjFiNzRmN2Y1M2ZiODMzYjgzM2ZkM2QzYjAxNzp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZmEyYjQwNWY4MmEzNTBiYTg3YWI4OWYxNzIwNWNiMTVjZDNjMTM0In0=',
        '2020-04-14 15:33:09.445780'),
       ('93rbpb43zi18cr3n3o6bij9pyun3715n',
        'MjIzZGE0YjQ5ZTNjYWMzNTlhNjA4YzVkZjFmMGJkNmExZmJmMGU4OTp7Imxpa2VzIjp0cnVlfQ==', '2020-03-26 10:30:29.662811'),
       ('bcmyunt3inli143guv01n32cbfom2wm1',
        'MmNiN2NiN2U0M2FlNTAwMzkzYTFiYjg0Y2ZhNDExMDczMDgwN2Q4YTp7Imxpa2VzIjpudWxsfQ==', '2020-03-26 13:32:26.837713'),
       ('hqdzj2aii98g7aqfhd6cxtarbto74k3x',
        'MmNiN2NiN2U0M2FlNTAwMzkzYTFiYjg0Y2ZhNDExMDczMDgwN2Q4YTp7Imxpa2VzIjpudWxsfQ==', '2020-03-26 13:35:25.046970'),
       ('k53j3orf1urfnqn5bqjyy9pfa7fy1dwl',
        'MjIzZGE0YjQ5ZTNjYWMzNTlhNjA4YzVkZjFmMGJkNmExZmJmMGU4OTp7Imxpa2VzIjp0cnVlfQ==', '2020-03-26 10:38:44.347533'),
       ('lff8n3a25ens007n2z29u41t0czjioui',
        'MjQxNGM0NDM4ODIzNmYxZmFiZGFiNzZiYzNiN2U5ODM5NDM0ZTgzNjp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYzVhMGIzOTFiMzZmNzdiNGMyNjM5ZmE4NGI0NzFkMDkzODg0ZDM2In0=',
        '2020-04-12 12:42:04.663516'),
       ('r2gey1gibhywms3nxndagw04w2ir1jd6',
        'MmNiN2NiN2U0M2FlNTAwMzkzYTFiYjg0Y2ZhNDExMDczMDgwN2Q4YTp7Imxpa2VzIjpudWxsfQ==', '2020-03-26 13:41:00.303808'),
       ('sfzayj3e8lsylgvlxi4veh0yud237rf3',
        'MmNiN2NiN2U0M2FlNTAwMzkzYTFiYjg0Y2ZhNDExMDczMDgwN2Q4YTp7Imxpa2VzIjpudWxsfQ==', '2020-03-26 13:29:55.534079'),
       ('toqiw1u5vdy9qbgqivt8zn2qn9z328sf',
        'MDk0NmEwMGVhOGYyZjc2YWVlMTNhNmE5NzBkMzg2YTQ0ZTRmNTllYjp7Imxpa2VzIjpbNSw0XSwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImNiZmM4ODIzNGQxODQwYzhmMWIzODBhMDBiNzUzZTgwYTlkNjAyZDMifQ==',
        '2020-03-29 15:57:11.652234'),
       ('uaskjeoc29l2pg55m1xsy5g3xtopo6qn',
        'MjIzZGE0YjQ5ZTNjYWMzNTlhNjA4YzVkZjFmMGJkNmExZmJmMGU4OTp7Imxpa2VzIjp0cnVlfQ==', '2020-03-26 10:39:29.603761'),
       ('uqmxlp2skgnyqn0wa4l8272igc4as50a',
        'NmE4NWJlODNmOTg3ZGRlODBlMzYyM2M4ZGYxOTBiMWRlYWM3MmFkZTp7Imxpa2VzIjpbMTcsNCwxNywxMCwxMCw1XX0=',
        '2020-03-27 06:12:10.036017'),
       ('vmctbmji5fwjum5pr46x0n4uaxgqnion',
        '.eJxVjrtug0AQRf9larTamd3hVaZLkS4lEpp9GZwELGCLyPK_GyzLStpzro7uFXrJ29DnNS79GKAF1FD8hU78V5wOE84ynWbl52lbRqeOiXraVX3MIX6_Pbf_AoOsw9ElseiZIybjSkYWa4KvIpfiHVkJ2rCxZIlJCzaEQaqak0GjXeLk9-hFft-nNEN7hcsy-ggtNbVqCni9R13Ausm2K-gyh0RdLplSl20MNdwejc_x5_BYMteauNr5HZgnUj4:1o3ZtC:EjIA6VBEvaNY_DTr0ktGFCpHvSX0cSgwI8n1fNMEHa0',
        '2022-07-05 09:09:38.374954');
/*!40000 ALTER TABLE `django_session`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopper_cartinfos`
--

DROP TABLE IF EXISTS `shopper_cartinfos`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopper_cartinfos`
(
    `id`                int(11) NOT NULL AUTO_INCREMENT,
    `quantity`          int(11) NOT NULL,
    `commodityInfos_id` int(11) NOT NULL,
    `user_id`           int(11) NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopper_cartinfos`
--

LOCK TABLES `shopper_cartinfos` WRITE;
/*!40000 ALTER TABLE `shopper_cartinfos`
    DISABLE KEYS */;
INSERT INTO `shopper_cartinfos`
VALUES (8, 1, 17, 1),
       (9, 1, 4, 1),
       (10, 1, 17, 10),
       (11, 1, 4, 10),
       (12, 1, 22, 10);
/*!40000 ALTER TABLE `shopper_cartinfos`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopper_orderinfos`
--

DROP TABLE IF EXISTS `shopper_orderinfos`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopper_orderinfos`
(
    `id`      int(11)     NOT NULL AUTO_INCREMENT,
    `price`   double      NOT NULL,
    `created` date        NOT NULL,
    `user_id` int(11)     NOT NULL,
    `state`   varchar(20) NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopper_orderinfos`
--

LOCK TABLES `shopper_orderinfos` WRITE;
/*!40000 ALTER TABLE `shopper_orderinfos`
    DISABLE KEYS */;
INSERT INTO `shopper_orderinfos`
VALUES (1, 99.9, '2020-03-29', 1, '已支付'),
       (2, 99.9, '2022-06-19', 10, '已支付'),
       (3, 298.9, '2022-06-21', 10, '已支付'),
       (4, 298.9, '2022-06-21', 10, '已支付'),
       (5, 298.9, '2022-06-21', 10, '已支付');
/*!40000 ALTER TABLE `shopper_orderinfos`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `commodity_limit5`
--

/*!50001 DROP VIEW IF EXISTS `commodity_limit5`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM = UNDEFINED */ /*!50013 DEFINER =`root`@`localhost` SQL SECURITY DEFINER */ /*!50001 VIEW `commodity_limit5` AS
select `ccct0`.`id`     AS `id`,
       `ccct0`.`img`    AS `img`,
       `ccct0`.`name`   AS `name`,
       `ccct0`.`sold`   AS `sold`,
       `ccct0`.`types`  AS `types`,
       `ccct0`.`firsts` AS `firsts`
from (select `babys`.`commodity_commodityinfos`.`id`    AS `id`,
             `babys`.`commodity_commodityinfos`.`img`   AS `img`,
             `babys`.`commodity_commodityinfos`.`name`  AS `name`,
             `babys`.`commodity_commodityinfos`.`sold`  AS `sold`,
             `babys`.`commodity_commodityinfos`.`types` AS `types`,
             `babys`.`commodity_types`.`firsts`         AS `firsts`
      from (`babys`.`commodity_commodityinfos` join `babys`.`commodity_types`
            on ((`babys`.`commodity_commodityinfos`.`types` = `babys`.`commodity_types`.`seconds`)))
      where (`babys`.`commodity_types`.`firsts` = '行车安全')
      order by `babys`.`commodity_commodityinfos`.`sold` desc
      limit 5) `ccct0`
union all
select `ccct1`.`id`     AS `id`,
       `ccct1`.`img`    AS `img`,
       `ccct1`.`name`   AS `name`,
       `ccct1`.`sold`   AS `sold`,
       `ccct1`.`types`  AS `types`,
       `ccct1`.`firsts` AS `firsts`
from (select `babys`.`commodity_commodityinfos`.`id`    AS `id`,
             `babys`.`commodity_commodityinfos`.`img`   AS `img`,
             `babys`.`commodity_commodityinfos`.`name`  AS `name`,
             `babys`.`commodity_commodityinfos`.`sold`  AS `sold`,
             `babys`.`commodity_commodityinfos`.`types` AS `types`,
             `babys`.`commodity_types`.`firsts`         AS `firsts`
      from (`babys`.`commodity_commodityinfos` join `babys`.`commodity_types`
            on ((`babys`.`commodity_commodityinfos`.`types` = `babys`.`commodity_types`.`seconds`)))
      where (`babys`.`commodity_types`.`firsts` = '用车舒适')
      order by `babys`.`commodity_commodityinfos`.`sold` desc
      limit 5) `ccct1`
union all
select `ccct2`.`id`     AS `id`,
       `ccct2`.`img`    AS `img`,
       `ccct2`.`name`   AS `name`,
       `ccct2`.`sold`   AS `sold`,
       `ccct2`.`types`  AS `types`,
       `ccct2`.`firsts` AS `firsts`
from (select `babys`.`commodity_commodityinfos`.`id`    AS `id`,
             `babys`.`commodity_commodityinfos`.`img`   AS `img`,
             `babys`.`commodity_commodityinfos`.`name`  AS `name`,
             `babys`.`commodity_commodityinfos`.`sold`  AS `sold`,
             `babys`.`commodity_commodityinfos`.`types` AS `types`,
             `babys`.`commodity_types`.`firsts`         AS `firsts`
      from (`babys`.`commodity_commodityinfos` join `babys`.`commodity_types`
            on ((`babys`.`commodity_commodityinfos`.`types` = `babys`.`commodity_types`.`seconds`)))
      where (`babys`.`commodity_types`.`firsts` = '车内配件')
      order by `babys`.`commodity_commodityinfos`.`sold` desc
      limit 5) `ccct2`
        */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2022-06-21 17:14:05
