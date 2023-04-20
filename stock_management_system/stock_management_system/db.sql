/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.32 : Database - stockmng
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add bill',7,'add_bill'),
(26,'Can change bill',7,'change_bill'),
(27,'Can delete bill',7,'delete_bill'),
(28,'Can view bill',7,'view_bill'),
(29,'Can add category',8,'add_category'),
(30,'Can change category',8,'change_category'),
(31,'Can delete category',8,'delete_category'),
(32,'Can view category',8,'view_category'),
(33,'Can add dis_registration',9,'add_dis_registration'),
(34,'Can change dis_registration',9,'change_dis_registration'),
(35,'Can delete dis_registration',9,'delete_dis_registration'),
(36,'Can view dis_registration',9,'view_dis_registration'),
(37,'Can add login',10,'add_login'),
(38,'Can change login',10,'change_login'),
(39,'Can delete login',10,'delete_login'),
(40,'Can view login',10,'view_login'),
(41,'Can add order',11,'add_order'),
(42,'Can change order',11,'change_order'),
(43,'Can delete order',11,'delete_order'),
(44,'Can view order',11,'view_order'),
(45,'Can add shop_product',12,'add_shop_product'),
(46,'Can change shop_product',12,'change_shop_product'),
(47,'Can delete shop_product',12,'delete_shop_product'),
(48,'Can view shop_product',12,'view_shop_product'),
(49,'Can add shop_registration',13,'add_shop_registration'),
(50,'Can change shop_registration',13,'change_shop_registration'),
(51,'Can delete shop_registration',13,'delete_shop_registration'),
(52,'Can view shop_registration',13,'view_shop_registration'),
(53,'Can add returnlist',14,'add_returnlist'),
(54,'Can change returnlist',14,'change_returnlist'),
(55,'Can delete returnlist',14,'delete_returnlist'),
(56,'Can view returnlist',14,'view_returnlist'),
(57,'Can add product',15,'add_product'),
(58,'Can change product',15,'change_product'),
(59,'Can delete product',15,'delete_product'),
(60,'Can view product',15,'view_product'),
(61,'Can add feedback',16,'add_feedback'),
(62,'Can change feedback',16,'change_feedback'),
(63,'Can delete feedback',16,'delete_feedback'),
(64,'Can view feedback',16,'view_feedback'),
(65,'Can add complaints',17,'add_complaints'),
(66,'Can change complaints',17,'change_complaints'),
(67,'Can delete complaints',17,'delete_complaints'),
(68,'Can view complaints',17,'view_complaints'),
(69,'Can add billdetails',18,'add_billdetails'),
(70,'Can change billdetails',18,'change_billdetails'),
(71,'Can delete billdetails',18,'delete_billdetails'),
(72,'Can view billdetails',18,'view_billdetails');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session'),
(7,'sms','bill'),
(18,'sms','billdetails'),
(8,'sms','category'),
(17,'sms','complaints'),
(9,'sms','dis_registration'),
(16,'sms','feedback'),
(10,'sms','login'),
(11,'sms','order'),
(15,'sms','product'),
(14,'sms','returnlist'),
(12,'sms','shop_product'),
(13,'sms','shop_registration');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-04-19 06:13:49.677134'),
(2,'auth','0001_initial','2023-04-19 06:13:50.245074'),
(3,'admin','0001_initial','2023-04-19 06:13:50.391979'),
(4,'admin','0002_logentry_remove_auto_add','2023-04-19 06:13:50.406530'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-04-19 06:13:50.419404'),
(6,'contenttypes','0002_remove_content_type_name','2023-04-19 06:13:50.518268'),
(7,'auth','0002_alter_permission_name_max_length','2023-04-19 06:13:50.586135'),
(8,'auth','0003_alter_user_email_max_length','2023-04-19 06:13:50.639409'),
(9,'auth','0004_alter_user_username_opts','2023-04-19 06:13:50.659605'),
(10,'auth','0005_alter_user_last_login_null','2023-04-19 06:13:50.729724'),
(11,'auth','0006_require_contenttypes_0002','2023-04-19 06:13:50.735655'),
(12,'auth','0007_alter_validators_add_error_messages','2023-04-19 06:13:50.748640'),
(13,'auth','0008_alter_user_username_max_length','2023-04-19 06:13:50.821015'),
(14,'auth','0009_alter_user_last_name_max_length','2023-04-19 06:13:50.894165'),
(15,'auth','0010_alter_group_name_max_length','2023-04-19 06:13:50.925468'),
(16,'auth','0011_update_proxy_permissions','2023-04-19 06:13:50.939325'),
(17,'auth','0012_alter_user_first_name_max_length','2023-04-19 06:13:51.020895'),
(18,'sessions','0001_initial','2023-04-19 06:13:51.064328'),
(19,'sms','0001_initial','2023-04-19 06:13:52.014121'),
(20,'sms','0002_order_quantity','2023-04-19 10:57:14.943177'),
(21,'sms','0003_order_count','2023-04-19 15:57:43.011901'),
(22,'sms','0004_remove_order_quantity','2023-04-19 17:14:38.937456');

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

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('mexb7667fj87846e2vf99d2ytbjt9kv2','.eJyrVsrJTFGyMtJRKihKSS4BsQ1BbCgjGSxZCwDgeAs9:1ppPDR:qxnNCKr0paOc1ekIPC5N5OX22Nf8VOQrTKqS5lXnrhU','2023-05-04 08:00:29.403742');

/*Table structure for table `sms_bill` */

DROP TABLE IF EXISTS `sms_bill`;

CREATE TABLE `sms_bill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `total_amount` int NOT NULL,
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

/*Table structure for table `sms_category` */

DROP TABLE IF EXISTS `sms_category`;

CREATE TABLE `sms_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `GST` varchar(100) NOT NULL,
  `discription` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_category` */

insert  into `sms_category`(`id`,`category_name`,`GST`,`discription`) values 
(1,'Bakery Products','5','Cake,Bread,Cookies,Biscuit'),
(2,'Ice Cream','5','amul'),
(3,'Ice Cream','5','amul');

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
  KEY `sms_complaints_lid_id_0448408e_fk_sms_shop_registration_id` (`lid_id`),
  CONSTRAINT `sms_complaints_did_id_8e702c70_fk_sms_dis_registration_id` FOREIGN KEY (`did_id`) REFERENCES `sms_dis_registration` (`id`),
  CONSTRAINT `sms_complaints_lid_id_0448408e_fk_sms_shop_registration_id` FOREIGN KEY (`lid_id`) REFERENCES `sms_shop_registration` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_complaints` */

insert  into `sms_complaints`(`id`,`date`,`complaint`,`reply`,`did_id`,`lid_id`) values 
(1,'2023-04-20','hhh','hkk',1,1),
(2,'2023-04-20','nbvc ','hhh',2,1),
(3,'2023-04-20','bad service','pending',2,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_dis_registration` */

insert  into `sms_dis_registration`(`id`,`name`,`location`,`mobile_number`,`email`,`image`,`lid_id`) values 
(1,'ABC Distribution','Kakkanchery',9876542311,'abc@gmail.com','WhatsApp Image 2023-02-18 at 8.01.54 PM_ZbuPO7S.jpeg',2),
(2,'Adam Distributors','kakkad',9876231411,'adam@gmail.com','Cloud computing_PJdOffx.jpg',4),
(3,'Chocolive','Kakkanchery',9994553145,'chocolive@gmail.com','level12.png',5);

/*Table structure for table `sms_feedback` */

DROP TABLE IF EXISTS `sms_feedback`;

CREATE TABLE `sms_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `sid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sms_feedback_sid_id_c6391ba2_fk_sms_shop_registration_id` (`sid_id`),
  CONSTRAINT `sms_feedback_sid_id_c6391ba2_fk_sms_shop_registration_id` FOREIGN KEY (`sid_id`) REFERENCES `sms_shop_registration` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_feedback` */

insert  into `sms_feedback`(`id`,`feedback`,`date`,`sid_id`) values 
(1,'good','2023-04-20',1),
(2,'good','2023-04-20',1);

/*Table structure for table `sms_login` */

DROP TABLE IF EXISTS `sms_login`;

CREATE TABLE `sms_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(90) NOT NULL,
  `password` varchar(90) NOT NULL,
  `type` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_login` */

insert  into `sms_login`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'amal','aml123','distributor'),
(3,'smrithi','smi123','shopowner'),
(4,'adam','adm123','distributor'),
(5,'riyas','rys123','distributor');

/*Table structure for table `sms_order` */

DROP TABLE IF EXISTS `sms_order`;

CREATE TABLE `sms_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `orderstatus` varchar(100) NOT NULL,
  `pid_id` bigint NOT NULL,
  `sid_id` bigint NOT NULL,
  `Count` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sms_order_pid_id_94ff5cd8_fk_sms_product_id` (`pid_id`),
  KEY `sms_order_sid_id_4b632d8e_fk_sms_shop_registration_id` (`sid_id`),
  CONSTRAINT `sms_order_pid_id_94ff5cd8_fk_sms_product_id` FOREIGN KEY (`pid_id`) REFERENCES `sms_product` (`id`),
  CONSTRAINT `sms_order_sid_id_4b632d8e_fk_sms_shop_registration_id` FOREIGN KEY (`sid_id`) REFERENCES `sms_shop_registration` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_order` */

insert  into `sms_order`(`id`,`date`,`orderstatus`,`pid_id`,`sid_id`,`Count`) values 
(1,'2023-04-19','accept',1,1,'20'),
(2,'2023-04-19','accept',2,1,'30'),
(3,'2023-04-20','accept',1,1,'90');

/*Table structure for table `sms_product` */

DROP TABLE IF EXISTS `sms_product`;

CREATE TABLE `sms_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `quantity` varchar(90) NOT NULL,
  `price` int NOT NULL,
  `MRP` int NOT NULL,
  `stock` int NOT NULL,
  `image` varchar(100) NOT NULL,
  `cid_id` bigint NOT NULL,
  `did_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sms_product_cid_id_91b4fc3d_fk_sms_category_id` (`cid_id`),
  KEY `sms_product_did_id_01e0b979_fk_sms_dis_registration_id` (`did_id`),
  CONSTRAINT `sms_product_cid_id_91b4fc3d_fk_sms_category_id` FOREIGN KEY (`cid_id`) REFERENCES `sms_category` (`id`),
  CONSTRAINT `sms_product_did_id_01e0b979_fk_sms_dis_registration_id` FOREIGN KEY (`did_id`) REFERENCES `sms_dis_registration` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_product` */

insert  into `sms_product`(`id`,`name`,`quantity`,`price`,`MRP`,`stock`,`image`,`cid_id`,`did_id`) values 
(1,'Sunfeast Dark Fantacy ChocoFills','300 g',130,170,200,'img11_nlip7I4',1,1),
(2,'Cadbury Oreo','100g',65,85,150,'img12.jpg',1,1),
(3,'Mom\'s magic','100g',27,30,250,'img13.jpg',1,1),
(4,'Chocolate Icecream','120 ml',200,230,100,'ice2_GOflY6d.jfif',2,2),
(5,'vanila icecream','120 ml',165,190,100,'ice1_vU2SSvc.jfif',2,2);

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

/*Table structure for table `sms_shop_product` */

DROP TABLE IF EXISTS `sms_shop_product`;

CREATE TABLE `sms_shop_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `quantity` varchar(90) NOT NULL,
  `MRP` int NOT NULL,
  `Tax` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_shop_product` */

/*Table structure for table `sms_shop_registration` */

DROP TABLE IF EXISTS `sms_shop_registration`;

CREATE TABLE `sms_shop_registration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  `location` varchar(90) NOT NULL,
  `email` varchar(90) NOT NULL,
  `mobile_number` bigint NOT NULL,
  `image` varchar(100) NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sms_shop_registration_lid_id_132f8428_fk_sms_login_id` (`lid_id`),
  CONSTRAINT `sms_shop_registration_lid_id_132f8428_fk_sms_login_id` FOREIGN KEY (`lid_id`) REFERENCES `sms_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sms_shop_registration` */

insert  into `sms_shop_registration`(`id`,`name`,`location`,`email`,`mobile_number`,`image`,`lid_id`) values 
(1,'Smrithi Stores','Valanchery','smrithi@gmail.com',9876543210,'WhatsApp Image 2022-03-04 at 3.35.26 PM.jpeg',3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
