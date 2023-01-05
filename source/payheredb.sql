-- MySQL dump 10.13  Distrib 5.7.40, for Linux (x86_64)
--
-- Host: localhost    Database: payheredb
-- ------------------------------------------------------
-- Server version	5.7.40

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add receipt',7,'add_receipt'),(26,'Can change receipt',7,'change_receipt'),(27,'Can delete receipt',7,'delete_receipt'),(28,'Can view receipt',7,'view_receipt'),(29,'Can add permalink',8,'add_permalink'),(30,'Can change permalink',8,'change_permalink'),(31,'Can delete permalink',8,'delete_permalink'),(32,'Can view permalink',8,'view_permalink');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(8,'receipt','permalink'),(7,'receipt','receipt'),(5,'sessions','session'),(6,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'user','0001_initial','2023-01-05 13:38:37.861118'),(2,'contenttypes','0001_initial','2023-01-05 13:38:37.949629'),(3,'admin','0001_initial','2023-01-05 13:38:38.199882'),(4,'admin','0002_logentry_remove_auto_add','2023-01-05 13:38:38.214943'),(5,'admin','0003_logentry_add_action_flag_choices','2023-01-05 13:38:38.229484'),(6,'contenttypes','0002_remove_content_type_name','2023-01-05 13:38:38.361030'),(7,'auth','0001_initial','2023-01-05 13:38:39.223043'),(8,'auth','0002_alter_permission_name_max_length','2023-01-05 13:38:39.411932'),(9,'auth','0003_alter_user_email_max_length','2023-01-05 13:38:39.433012'),(10,'auth','0004_alter_user_username_opts','2023-01-05 13:38:39.453980'),(11,'auth','0005_alter_user_last_login_null','2023-01-05 13:38:39.476900'),(12,'auth','0006_require_contenttypes_0002','2023-01-05 13:38:39.491443'),(13,'auth','0007_alter_validators_add_error_messages','2023-01-05 13:38:39.512791'),(14,'auth','0008_alter_user_username_max_length','2023-01-05 13:38:39.535865'),(15,'auth','0009_alter_user_last_name_max_length','2023-01-05 13:38:39.557995'),(16,'auth','0010_alter_group_name_max_length','2023-01-05 13:38:39.602367'),(17,'auth','0011_update_proxy_permissions','2023-01-05 13:38:39.630447'),(18,'auth','0012_alter_user_first_name_max_length','2023-01-05 13:38:39.656121'),(19,'receipt','0001_initial','2023-01-05 13:38:40.141017'),(20,'sessions','0001_initial','2023-01-05 13:38:40.282682'),(21,'receipt','0002_remove_permalink_encode','2023-01-05 16:29:13.158444');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt_permalink`
--

DROP TABLE IF EXISTS `receipt_permalink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receipt_permalink` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `end_date` datetime(6) NOT NULL,
  `refer_to_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `receipt_permalink_refer_to_id_f49b6426_fk_receipt_receipt_id` (`refer_to_id`),
  CONSTRAINT `receipt_permalink_refer_to_id_f49b6426_fk_receipt_receipt_id` FOREIGN KEY (`refer_to_id`) REFERENCES `receipt_receipt` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt_permalink`
--

LOCK TABLES `receipt_permalink` WRITE;
/*!40000 ALTER TABLE `receipt_permalink` DISABLE KEYS */;
INSERT INTO `receipt_permalink` VALUES (1,'2023-01-05 23:38:38.699519',1),(2,'2023-01-05 18:24:20.358276',6),(3,'2023-01-05 18:45:10.433053',6),(4,'2023-01-05 18:45:40.427774',6),(5,'2023-01-05 18:46:20.354150',6),(6,'2023-01-05 18:46:23.088651',6),(7,'2023-01-05 18:46:33.727001',6),(8,'2023-01-05 18:46:53.990165',6),(9,'2023-01-05 18:46:55.935031',6),(10,'2023-01-05 18:48:09.351747',6),(11,'2023-01-05 18:48:10.616493',6),(12,'2023-01-05 18:48:49.673338',6),(13,'2023-01-05 18:51:23.431620',6),(14,'2023-01-05 18:51:34.812882',6);
/*!40000 ALTER TABLE `receipt_permalink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt_receipt`
--

DROP TABLE IF EXISTS `receipt_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receipt_receipt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `content` varchar(50) NOT NULL,
  `outlay` int(11) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `receipt_receipt_user_id_1eff22df_fk_user_user_id` (`user_id`),
  CONSTRAINT `receipt_receipt_user_id_1eff22df_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt_receipt`
--

LOCK TABLES `receipt_receipt` WRITE;
/*!40000 ALTER TABLE `receipt_receipt` DISABLE KEYS */;
INSERT INTO `receipt_receipt` VALUES (1,'2023-01-02 19:20:00.000000','테스트',777,'테스트','2023-01-05 13:55:16.839778',3),(2,'2023-01-02 19:20:00.000000','테스트',777,'테스트','2023-01-05 13:55:18.206628',3),(4,'2023-01-02 19:20:00.000000','테스트',777,'테스트','2023-01-05 13:55:20.034538',3),(5,'2023-01-02 19:20:00.000000','테스트',777,'테스트','2023-01-05 13:55:21.066130',3),(6,'2023-01-05 13:55:35.503824','테스트',777,'테스트','2023-01-05 13:55:35.523468',3);
/*!40000 ALTER TABLE `receipt_receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user`
--

DROP TABLE IF EXISTS `user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(128) NOT NULL,
  `join_date` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user`
--

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;
INSERT INTO `user_user` VALUES (1,NULL,'admin@test.com','pbkdf2_sha256$390000$HCbSnUeZfzsBhTZHo2tCjR$zDBkM7zrvayK3JZnMfLaxXROMAecnxhJQR9Cu1VydLk=','2023-01-05 13:51:32.767747',1,1),(2,NULL,'test@test.com','pbkdf2_sha256$390000$Ziv2p4VTZsNZiEDGppQvVS$bpOl/t648spD8zMcOCP3SUOY/Za5N66sNnVrPZw0XBE=','2023-01-05 13:54:20.644953',1,0),(3,NULL,'test1@test.com','pbkdf2_sha256$390000$ItyK3NqBvH3bOz1gDrtNn0$VULrWMbcS7M0uh8gmySkjrqDKssCPsp8I70MI+cS7Iw=','2023-01-05 13:54:27.654935',1,0),(4,NULL,'test2@test.com','pbkdf2_sha256$390000$qAkmSnzYMFBjtKpTE1Gw7y$6PghGC1t99b3MDLBCZynlNhUqURbebINaEV4zmm7X7Q=','2023-01-05 13:54:33.416700',1,0),(5,NULL,'test3@test.com','pbkdf2_sha256$390000$400B0N8RHXDz5i8PcNrCb7$5Q7k2+F334SVmFmJAsjjXyg8o69myGUxE8N9HC6KKrk=','2023-01-05 13:54:37.159595',1,0);
/*!40000 ALTER TABLE `user_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-05 19:29:53
