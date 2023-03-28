/*
SQLyog Community Edition- MySQL GUI v8.03 
MySQL - 8.0.32 : Database - stockmng
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`stockmng` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `stockmng`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add bill',7,'add_bill'),(26,'Can change bill',7,'change_bill'),(27,'Can delete bill',7,'delete_bill'),(28,'Can view bill',7,'view_bill'),(29,'Can add dis_registration',8,'add_dis_registration'),(30,'Can change dis_registration',8,'change_dis_registration'),(31,'Can delete dis_registration',8,'delete_dis_registration'),(32,'Can view dis_registration',8,'view_dis_registration'),(33,'Can add login',9,'add_login'),(34,'Can change login',9,'change_login'),(35,'Can delete login',9,'delete_login'),(36,'Can view login',9,'view_login'),(37,'Can add order',10,'add_order'),(38,'Can change order',10,'change_order'),(39,'Can delete order',10,'delete_order'),(40,'Can view order',10,'view_order'),(41,'Can add product',11,'add_product'),(42,'Can change product',11,'change_product'),(43,'Can delete product',11,'delete_product'),(44,'Can view product',11,'view_product'),(45,'Can add shop_registration',12,'add_shop_registration'),(46,'Can change shop_registration',12,'change_shop_registration'),(47,'Can delete shop_registration',12,'delete_shop_registration'),(48,'Can view shop_registration',12,'view_shop_registration'),(49,'Can add returnlist',13,'add_returnlist'),(50,'Can change returnlist',13,'change_returnlist'),(51,'Can delete returnlist',13,'delete_returnlist'),(52,'Can view returnlist',13,'view_returnlist'),(53,'Can add feedback',14,'add_feedback'),(54,'Can change feedback',14,'change_feedback'),(55,'Can delete feedback',14,'delete_feedback'),(56,'Can view feedback',14,'view_feedback'),(57,'Can add complaints',15,'add_complaints'),(58,'Can change complaints',15,'change_complaints'),(59,'Can delete complaints',15,'delete_complaints'),(60,'Can view complaints',15,'view_complaints'),(61,'Can add billdetails',16,'add_billdetails'),(62,'Can change billdetails',16,'change_billdetails'),(63,'Can delete billdetails',16,'delete_billdetails'),(64,'Can view billdetails',16,'view_billdetails');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'sms','bill'),(16,'sms','billdetails'),(15,'sms','complaints'),(8,'sms','dis_registration'),(14,'sms','feedback'),(9,'sms','login'),(10,'sms','order'),(11,'sms','product'),(13,'sms','returnlist'),(12,'sms','shop_registration');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2023-03-16 09:52:07.689558'),(2,'auth','0001_initial','2023-03-16 09:52:08.681630'),(3,'admin','0001_initial','2023-03-16 09:52:08.958658'),(4,'admin','0002_logentry_remove_auto_add','2023-03-16 09:52:08.974660'),(5,'admin','0003_logentry_add_action_flag_choices','2023-03-16 09:52:09.003661'),(6,'contenttypes','0002_remove_content_type_name','2023-03-16 09:52:09.157666'),(7,'auth','0002_alter_permission_name_max_length','2023-03-16 09:52:09.252673'),(8,'auth','0003_alter_user_email_max_length','2023-03-16 09:52:09.303684'),(9,'auth','0004_alter_user_username_opts','2023-03-16 09:52:09.326679'),(10,'auth','0005_alter_user_last_login_null','2023-03-16 09:52:09.462698'),(11,'auth','0006_require_contenttypes_0002','2023-03-16 09:52:09.469691'),(12,'auth','0007_alter_validators_add_error_messages','2023-03-16 09:52:09.484702'),(13,'auth','0008_alter_user_username_max_length','2023-03-16 09:52:09.640702'),(14,'auth','0009_alter_user_last_name_max_length','2023-03-16 09:52:09.739711'),(15,'auth','0010_alter_group_name_max_length','2023-03-16 09:52:09.803715'),(16,'auth','0011_update_proxy_permissions','2023-03-16 09:52:09.824717'),(17,'auth','0012_alter_user_first_name_max_length','2023-03-16 09:52:09.937732'),(18,'sessions','0001_initial','2023-03-16 09:52:10.013731'),(19,'sms','0001_initial','2023-03-16 09:52:11.640854'),(20,'sms','0002_alter_dis_registration_mobile_number','2023-03-23 05:20:16.862283'),(21,'sms','0003_alter_shop_registration_mobile_number','2023-03-23 05:48:38.698783');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

/*Table structure for table `sms_bill` */

DROP TABLE IF EXISTS `sms_bill`;

CREATE TABLE `sms_bill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `totalamount` int NOT NULL,
  `status` varchar(100) NOT NULL,
  `sid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sms_bill_sid_id_fbd87131_fk_sms_shop_registration_id` (`sid_id`),
  CONSTRAINT `sms_bill_sid_id_fbd87131_fk_sms_shop_registration_id` FOREIGN KEY (`sid_id`) REFERENCES `sms_shop_registration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_bill` */

/*Table structure for table `sms_billdetails` */

DROP TABLE IF EXISTS `sms_billdetails`;

CREATE TABLE `sms_billdetails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `bid_id` bigint NOT NULL,
  `pid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sms_billdetails_bid_id_1658cc88_fk_sms_bill_id` (`bid_id`),
  KEY `sms_billdetails_pid_id_22504d26_fk_sms_product_id` (`pid_id`),
  CONSTRAINT `sms_billdetails_bid_id_1658cc88_fk_sms_bill_id` FOREIGN KEY (`bid_id`) REFERENCES `sms_bill` (`id`),
  CONSTRAINT `sms_billdetails_pid_id_22504d26_fk_sms_product_id` FOREIGN KEY (`pid_id`) REFERENCES `sms_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_billdetails` */

/*Table structure for table `sms_complaints` */

DROP TABLE IF EXISTS `sms_complaints`;

CREATE TABLE `sms_complaints` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `complaint` varchar(300) NOT NULL,
  `reply` varchar(90) NOT NULL,
  `did_id` bigint NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sms_complaints_did_id_8e702c70_fk_sms_dis_registration_id` (`did_id`),
  KEY `sms_complaints_lid_id_0448408e_fk_sms_login_id` (`lid_id`),
  CONSTRAINT `sms_complaints_did_id_8e702c70_fk_sms_dis_registration_id` FOREIGN KEY (`did_id`) REFERENCES `sms_dis_registration` (`id`),
  CONSTRAINT `sms_complaints_lid_id_0448408e_fk_sms_login_id` FOREIGN KEY (`lid_id`) REFERENCES `sms_login` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_complaints` */

/*Table structure for table `sms_dis_registration` */

DROP TABLE IF EXISTS `sms_dis_registration`;

CREATE TABLE `sms_dis_registration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  `location` varchar(90) NOT NULL,
  `mobile_number` bigint NOT NULL,
  `email` varchar(90) NOT NULL,
  `image` varchar(100) NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sms_dis_registration_lid_id_164b8c20_fk_sms_login_id` (`lid_id`),
  CONSTRAINT `sms_dis_registration_lid_id_164b8c20_fk_sms_login_id` FOREIGN KEY (`lid_id`) REFERENCES `sms_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_dis_registration` */

insert  into `sms_dis_registration`(`id`,`name`,`location`,`mobile_number`,`email`,`image`,`lid_id`) values (1,'milma','calicut',9876542311,'milma@gmail.com','WhatsApp Image 2021-12-20 at 11.59.15 AM_4VkM3aM.jpeg',7),(5,'Parle','calicut',7976341267,'parle@gmail.com','0',16);

/*Table structure for table `sms_feedback` */

DROP TABLE IF EXISTS `sms_feedback`;

CREATE TABLE `sms_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `did_id` bigint NOT NULL,
  `lid_id` bigint NOT NULL,
  `sid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sms_feedback_did_id_8144d10b_fk_sms_dis_registration_id` (`did_id`),
  KEY `sms_feedback_lid_id_eaa9ca83_fk_sms_login_id` (`lid_id`),
  KEY `sms_feedback_sid_id_c6391ba2_fk_sms_shop_registration_id` (`sid_id`),
  CONSTRAINT `sms_feedback_did_id_8144d10b_fk_sms_dis_registration_id` FOREIGN KEY (`did_id`) REFERENCES `sms_dis_registration` (`id`),
  CONSTRAINT `sms_feedback_lid_id_eaa9ca83_fk_sms_login_id` FOREIGN KEY (`lid_id`) REFERENCES `sms_login` (`id`),
  CONSTRAINT `sms_feedback_sid_id_c6391ba2_fk_sms_shop_registration_id` FOREIGN KEY (`sid_id`) REFERENCES `sms_shop_registration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_feedback` */

/*Table structure for table `sms_login` */

DROP TABLE IF EXISTS `sms_login`;

CREATE TABLE `sms_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(90) NOT NULL,
  `password` varchar(90) NOT NULL,
  `type` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_login` */

insert  into `sms_login`(`id`,`username`,`password`,`type`) values (1,'admin','123','admin'),(2,'distributor','12345','distributor'),(3,'shopowner','123456','shopowner'),(7,'rajesh','123456','distributor'),(14,'gopan','gopu123','distributor'),(15,'gopan','gopu123','shopowner'),(16,'nandhu','parle','distributor'),(17,'jafar','bismisuper','shopowner');

/*Table structure for table `sms_order` */

DROP TABLE IF EXISTS `sms_order`;

CREATE TABLE `sms_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `orderstatus` varchar(100) NOT NULL,
  `pid_id` bigint NOT NULL,
  `sid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sms_order_pid_id_94ff5cd8_fk_sms_product_id` (`pid_id`),
  KEY `sms_order_sid_id_4b632d8e_fk_sms_shop_registration_id` (`sid_id`),
  CONSTRAINT `sms_order_pid_id_94ff5cd8_fk_sms_product_id` FOREIGN KEY (`pid_id`) REFERENCES `sms_product` (`id`),
  CONSTRAINT `sms_order_sid_id_4b632d8e_fk_sms_shop_registration_id` FOREIGN KEY (`sid_id`) REFERENCES `sms_shop_registration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_order` */

/*Table structure for table `sms_product` */

DROP TABLE IF EXISTS `sms_product`;

CREATE TABLE `sms_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `quantity` varchar(90) NOT NULL,
  `price` int NOT NULL,
  `Tax` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_product` */

/*Table structure for table `sms_returnlist` */

DROP TABLE IF EXISTS `sms_returnlist`;

CREATE TABLE `sms_returnlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `oid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sms_returnlist_oid_id_4383d861_fk_sms_order_id` (`oid_id`),
  CONSTRAINT `sms_returnlist_oid_id_4383d861_fk_sms_order_id` FOREIGN KEY (`oid_id`) REFERENCES `sms_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_returnlist` */

/*Table structure for table `sms_shop_registration` */

DROP TABLE IF EXISTS `sms_shop_registration`;

CREATE TABLE `sms_shop_registration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  `location` varchar(90) NOT NULL,
  `mobile_number` bigint NOT NULL,
  `email` varchar(90) NOT NULL,
  `image` varchar(100) NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sms_shop_registration_lid_id_132f8428_fk_sms_login_id` (`lid_id`),
  CONSTRAINT `sms_shop_registration_lid_id_132f8428_fk_sms_login_id` FOREIGN KEY (`lid_id`) REFERENCES `sms_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_shop_registration` */

insert  into `sms_shop_registration`(`id`,`name`,`location`,`mobile_number`,`email`,`image`,`lid_id`) values (1,'sara','malappuram',6534289800,'sara@gmail.com','chat gpt 3.jpg',15),(2,'Bismi','Valanchery',9992356431,'bismi123@gmail.com','0',17);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
