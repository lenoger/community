/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.33 : Database - community
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`community` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `community`;

/*Table structure for table `building` */

DROP TABLE IF EXISTS `building`;

CREATE TABLE `building` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `numbers` varchar(50) DEFAULT NULL,
  `uints` varchar(50) DEFAULT NULL,
  `remarks` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `building` */

insert  into `building`(`id`,`numbers`,`uints`,`remarks`) values 
(1,'16栋','1单元','无1'),
(7,'17栋','2单元','无1'),
(11,'18栋','2单元','无');

/*Table structure for table `carcharge` */

DROP TABLE IF EXISTS `carcharge`;

CREATE TABLE `carcharge` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_date` datetime DEFAULT NULL,
  `end_date` varchar(25) DEFAULT NULL,
  `money` double(10,2) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `owner_id` int(10) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL COMMENT '收费类型',
  `park_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `carcharge` */

insert  into `carcharge`(`id`,`pay_date`,`end_date`,`money`,`status`,`owner_id`,`remarks`,`type`,`park_id`) values 
(2,'2020-09-30 16:00:00','2020-12-31',1200.00,1,1,'221','停车费',1),
(3,'2020-09-30 16:00:00','2020-12-31',1200.00,1,2,'221','停车费',2),
(8,'2020-10-31 16:00:00','2020-11-30',300.00,0,1,'112','停车费',1);

/*Table structure for table `clockin` */

DROP TABLE IF EXISTS `clockin`;

CREATE TABLE `clockin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clock_in_time` datetime DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `building_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `clockin` */

insert  into `clockin`(`id`,`clock_in_time`,`owner_id`,`house_id`,`building_id`) values 
(1,'2021-04-01 02:42:55',1,1,1),
(4,'2021-04-20 14:59:13',2,2,7),
(11,'2021-04-25 07:22:02',1,1,1),
(12,'2021-04-26 07:22:29',2,2,7),
(14,'2021-04-27 07:34:24',1,1,1),
(15,'2021-04-27 07:35:23',2,2,7);

/*Table structure for table `clockinnew` */

DROP TABLE IF EXISTS `clockinnew`;

CREATE TABLE `clockinnew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_date` datetime DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `type1` int(11) DEFAULT NULL COMMENT '是否为疑似病例如咳嗽，发热（0或1）',
  `type2` int(11) DEFAULT NULL COMMENT '是否确诊为肺炎病例',
  `today_address` varchar(100) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `clockinnew` */

insert  into `clockinnew`(`id`,`report_date`,`owner_id`,`type1`,`type2`,`today_address`,`remarks`) values 
(1,'2021-04-26 13:20:32',2,0,0,'江西省南昌市御景花园小区16栋1单元601','无'),
(3,'2021-04-25 14:34:06',2,0,0,'江西省南昌市御景花园小区16栋1单元601','无'),
(6,'2021-04-26 16:00:00',2,0,0,'测试',''),
(16,'2021-04-27 16:00:00',2,0,0,'测试','无'),
(17,'2021-04-27 16:00:00',1,1,0,'测试','v二十');

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `com_id` varchar(25) DEFAULT NULL,
  `com_date` datetime DEFAULT NULL,
  `handle_date` datetime DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `clr` int(11) DEFAULT NULL COMMENT '处理人',
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `complaint` */

insert  into `complaint`(`id`,`com_id`,`com_date`,`handle_date`,`owner_id`,`status`,`clr`,`remarks`) values 
(1,'1','2020-11-22 11:47:46',NULL,1,1,NULL,'垃圾经常乱放'),
(2,'2','2020-11-17 11:48:15','2020-11-21 11:48:21',1,1,111,'绿植被拔了'),
(4,'1','2020-11-24 14:21:01',NULL,2,0,NULL,'垃圾乱放没解决');

/*Table structure for table `complaint_type` */

DROP TABLE IF EXISTS `complaint_type`;

CREATE TABLE `complaint_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(250) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `complaint_type` */

insert  into `complaint_type`(`id`,`name`,`remarks`,`status`) values 
(1,'垃圾乱放',NULL,NULL),
(2,'绿植太差',NULL,NULL);

/*Table structure for table `house` */

DROP TABLE IF EXISTS `house`;

CREATE TABLE `house` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `storey` int(5) DEFAULT NULL,
  `numbers` varchar(50) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `into_date` datetime DEFAULT NULL,
  `building_id` int(5) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `area` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `house` */

insert  into `house`(`id`,`storey`,`numbers`,`status`,`into_date`,`building_id`,`remarks`,`area`) values 
(1,NULL,'401',1,'2020-10-01 09:27:52',1,NULL,80.00),
(2,NULL,'402',1,'2020-11-04 16:00:00',7,'',90.00),
(3,NULL,'201',1,'2020-11-17 15:52:58',1,NULL,100.00),
(4,NULL,'602',1,'2021-05-05 16:00:00',11,'',98.00);

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(250) DEFAULT NULL,
  `fbdate` datetime DEFAULT NULL,
  `fbr` int(11) DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `notice` */

/*Table structure for table `owner` */

DROP TABLE IF EXISTS `owner`;

CREATE TABLE `owner` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL,
  `tel` varchar(25) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `identity` varchar(25) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `password` varchar(28) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `owner` */

insert  into `owner`(`id`,`username`,`tel`,`sex`,`identity`,`house_id`,`remarks`,`password`) values 
(1,'mary','15270892323','女','433123456787',1,NULL,'12345'),
(2,'yx5411','13767134678','男','433123456788',2,NULL,'12345'),
(9,'yx7845','15270839876','男','587968932',4,'','123456');

/*Table structure for table `parking` */

DROP TABLE IF EXISTS `parking`;

CREATE TABLE `parking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numbers` varchar(25) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `parking` */

insert  into `parking`(`id`,`numbers`,`status`,`owner_id`,`remarks`) values 
(1,'A10001',1,1,''),
(2,'A10002',1,2,'');

/*Table structure for table `property_info` */

DROP TABLE IF EXISTS `property_info`;

CREATE TABLE `property_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `money` double(10,2) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `property_info` */

insert  into `property_info`(`id`,`type_id`,`money`,`start_date`,`end_date`,`status`,`house_id`,`remarks`) values 
(1,2,900.00,'2020-10-01 09:28:11','2020-12-29 16:00:00',1,1,'啊水水'),
(4,1,208.00,'2020-09-30 16:00:00','2020-12-30 16:00:00',1,1,'物业费'),
(5,3,100.00,'2020-11-13 16:00:00','2020-11-13 16:00:00',1,1,'wu '),
(7,2,450.00,'2020-11-29 16:00:00','2020-11-19 16:00:00',0,3,'ceshi'),
(23,1,208.00,'2020-09-30 16:00:00','2020-12-30 16:00:00',0,1,'ceshi'),
(24,1,234.00,'2020-09-30 16:00:00','2020-12-30 16:00:00',0,2,'ceshi'),
(25,1,260.00,'2020-09-30 16:00:00','2020-12-30 16:00:00',1,3,'ceshi'),
(26,3,190.00,'2021-04-19 16:00:00','2021-04-19 16:00:00',0,3,'xxxxx'),
(27,3,61.50,'2021-05-05 16:00:00','2021-05-05 16:00:00',0,4,'');

/*Table structure for table `property_type` */

DROP TABLE IF EXISTS `property_type`;

CREATE TABLE `property_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `unit` varchar(25) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `property_type` */

insert  into `property_type`(`id`,`name`,`price`,`unit`,`remarks`) values 
(1,'物业费',2.60,'一平方',NULL),
(2,'水费',4.50,'一吨',NULL),
(3,'电费',0.50,'一度',NULL),
(4,'车位费',260.00,'一个',NULL);

/*Table structure for table `records` */

DROP TABLE IF EXISTS `records`;

CREATE TABLE `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `num` double(5,2) DEFAULT NULL,
  `num2` double(5,2) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `up_time` datetime DEFAULT NULL,
  `on_time` datetime DEFAULT NULL,
  `check_time` datetime DEFAULT NULL,
  `meter` varchar(25) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `records` */

insert  into `records`(`id`,`type_id`,`num`,`num2`,`house_id`,`up_time`,`on_time`,`check_time`,`meter`,`remarks`) values 
(1,2,200.00,300.00,1,'2020-10-01 09:28:11','2020-11-06 09:28:16','2020-11-12 09:28:23','张三','无'),
(2,2,100.00,200.00,1,'2020-09-23 10:34:48','2020-10-31 10:34:57','2020-10-30 10:35:05','yx',''),
(9,3,0.00,123.00,4,'2021-05-05 16:00:00','2021-05-05 16:00:00','2021-05-06 13:48:56','zhangsan','');

/*Table structure for table `repair` */

DROP TABLE IF EXISTS `repair`;

CREATE TABLE `repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `com_id` varchar(25) DEFAULT NULL,
  `com_date` datetime DEFAULT NULL,
  `handle_date` datetime DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `clr` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `repair` */

insert  into `repair`(`id`,`com_id`,`com_date`,`handle_date`,`owner_id`,`status`,`clr`,`remarks`) values 
(1,'1','2020-11-19 11:47:37','2020-11-21 11:47:41',1,1,1,'11'),
(2,'1','2020-11-18 11:48:02','2020-11-27 11:48:06',1,0,1,'11'),
(3,'2','2020-11-10 11:48:45','2020-11-27 11:48:48',1,1,1,'11'),
(4,'3','2020-11-11 14:56:31','2020-11-27 14:56:35',1,0,1,'22'),
(6,'3','2020-11-11 14:56:31','2020-11-22 06:14:52',1,0,1,'22'),
(7,'3','2020-11-11 14:56:31','2020-11-27 14:56:35',1,1,1,'22'),
(8,'4','2020-11-23 10:00:07','2020-11-25 10:00:13',1,1,1,'33'),
(9,'4','2020-11-23 10:00:07','2020-11-25 10:00:13',2,1,1,'33'),
(10,'4','2020-11-23 10:00:07','2020-11-25 10:00:13',1,1,1,'33'),
(13,'7','2020-11-05 10:00:59','2020-11-28 10:01:03',1,1,1,'22'),
(14,'3','2021-04-29 10:54:02',NULL,2,0,NULL,'电梯坏了');

/*Table structure for table `repairtype` */

DROP TABLE IF EXISTS `repairtype`;

CREATE TABLE `repairtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(250) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `repairtype` */

insert  into `repairtype`(`id`,`name`,`remarks`,`status`) values 
(1,'公共部位维修',NULL,1),
(2,'共用设施设备 ',NULL,1),
(3,'电梯',NULL,1),
(4,'自用部位维修',NULL,1),
(5,'门窗维修',NULL,1),
(6,'电话维修',NULL,1),
(7,'电路维修',NULL,1);

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `userinfo` */

insert  into `userinfo`(`id`,`username`,`password`,`type`,`remarks`) values 
(1,'admin','12345',1,NULL),
(2,'nssc','12345',0,NULL),
(3,'mary','12345',0,NULL),
(12,'ylx','123456',0,'');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
