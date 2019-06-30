/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.53 : Database - db_dormitory
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_dormitory` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `db_dormitory`;

/*Table structure for table `t_b_class` */

DROP TABLE IF EXISTS `t_b_class`;

CREATE TABLE `t_b_class` (
  `id` varchar(36) NOT NULL,
  `classname` varchar(45) DEFAULT NULL,
  `teachername` varchar(10) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_b_class` */

insert  into `t_b_class`(`id`,`classname`,`teachername`,`createTime`) values ('2c9281a162d815fe0162d81f792c0004','16级通信工程','刘强东','2018-04-18 17:39:24'),('402881e44cbbfe2c014cbbfecf730001','13级软件工程2班','李彦宏','2015-04-29 17:56:54'),('402881e44cbc0292014cbd3aac1f0001','11级计算机科学与技术1班','马化腾','2015-04-15 21:18:01');

/*Table structure for table `t_b_damage` */

DROP TABLE IF EXISTS `t_b_damage`;

CREATE TABLE `t_b_damage` (
  `id` varchar(36) NOT NULL,
  `damagestation` varchar(200) DEFAULT NULL,
  `damagetime` date DEFAULT NULL,
  `fixtime` date DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `dormid` varchar(36) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `isfixed` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`dormid`),
  KEY `fk_t_b_damage_t_b_dorm1` (`dormid`),
  CONSTRAINT `fk_t_b_damage_t_b_dorm1` FOREIGN KEY (`dormid`) REFERENCES `t_b_dorm` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_b_damage` */

insert  into `t_b_damage`(`id`,`damagestation`,`damagetime`,`fixtime`,`remark`,`dormid`,`createTime`,`isfixed`) values ('2c9281a162d815fe0162d82171c70008','桌子坏了。','2018-04-18',NULL,'被裁坏了','402881e64d05267d014d0529d4050002','2018-04-18 17:41:33','3'),('402881e64cf9f0fe014cf9f189ea0000','888','2015-04-01','2015-04-30','123','402881e54ce9ee7d014ce9f0b6450000','2015-04-27 18:33:30','1');

/*Table structure for table `t_b_dorm` */

DROP TABLE IF EXISTS `t_b_dorm`;

CREATE TABLE `t_b_dorm` (
  `id` varchar(36) NOT NULL,
  `dormname` varchar(30) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `used` int(11) DEFAULT NULL,
  `dormadmin` varchar(10) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_b_dorm` */

insert  into `t_b_dorm`(`id`,`dormname`,`total`,`used`,`dormadmin`,`remark`,`createTime`) values ('1','已离校',0,9,'','离校','2015-04-24 16:27:10'),('402881e54ce9ee7d014ce9f0b6450000','一宿舍',10,5,'高圆圆','这是男生宿舍','2015-04-29 19:49:26'),('402881e54cea6e2e014cea72c01e0000','二宿舍',10,8,'罗玉凤','这也是男生宿舍','2015-04-24 16:27:10'),('402881e64d051ccf014d0520f3bf0000','三宿舍',5,5,'古天乐','这是女生宿舍','2015-04-29 20:22:35'),('402881e64d05267d014d0529d4050002','四宿舍',1,1,'王勇','很牛逼这个宿舍','2015-04-29 20:32:16');

/*Table structure for table `t_b_score` */

DROP TABLE IF EXISTS `t_b_score`;

CREATE TABLE `t_b_score` (
  `id` varchar(36) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `scoredate` date DEFAULT NULL,
  `dormid` varchar(36) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`dormid`),
  KEY `fk_t_b_score_t_b_dorm1` (`dormid`),
  CONSTRAINT `fk_t_b_score_t_b_dorm1` FOREIGN KEY (`dormid`) REFERENCES `t_b_dorm` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_b_score` */

insert  into `t_b_score`(`id`,`score`,`scoredate`,`dormid`,`createTime`) values ('402881e64d041299014d04135f070000',5,'2015-04-29','402881e54ce9ee7d014ce9f0b6450000','2015-04-29 16:20:25'),('402881e64d04422d014d0443092c0000',1,'2015-04-29','402881e54cea6e2e014cea72c01e0000','2015-04-29 16:20:11'),('402881e64d054958014d055417390003',4,'2015-04-22','402881e64d051ccf014d0520f3bf0000','2015-04-29 21:18:26'),('402881e64d054958014d055459c70004',5,'2015-04-29','402881e64d05267d014d0529d4050002','2015-04-29 21:18:43'),('402881e64d232d9d014d232e253f0000',1,'2015-05-05','402881e54ce9ee7d014ce9f0b6450000','2015-05-05 16:25:36');

/*Table structure for table `t_b_student` */

DROP TABLE IF EXISTS `t_b_student`;

CREATE TABLE `t_b_student` (
  `id` varchar(36) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `qq` varchar(15) DEFAULT NULL,
  `mobile` varchar(13) DEFAULT NULL,
  `classid` varchar(36) NOT NULL,
  `dormid` varchar(36) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`classid`,`dormid`),
  KEY `fk_t_b_student_t_b_class1` (`classid`),
  KEY `fk_t_b_student_t_b_dorm1` (`dormid`),
  CONSTRAINT `fk_t_b_student_t_b_class1` FOREIGN KEY (`classid`) REFERENCES `t_b_class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_b_student_t_b_dorm1` FOREIGN KEY (`dormid`) REFERENCES `t_b_dorm` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_b_student` */

insert  into `t_b_student`(`id`,`name`,`sex`,`birthday`,`qq`,`mobile`,`classid`,`dormid`,`createTime`) values ('2c9281a162d815fe0162d81748c30000','马云','1','2018-04-12','6666666','13666666666','402881e44cbbfe2c014cbbfecf730001','402881e54ce9ee7d014ce9f0b6450000','2018-04-18 17:30:27'),('2c9281a162d840000162d84321000000','企鹅委屈','2','2018-04-11','','','2c9281a162d815fe0162d81f792c0004','402881e54ce9ee7d014ce9f0b6450000','2018-04-18 18:18:20'),('402881e64d05267d014d0527e3f80000','范冰冰','2','2015-04-22','6666','13575798836','402881e44cbbfe2c014cbbfecf730001','402881e64d051ccf014d0520f3bf0000','2015-04-29 20:30:09'),('402881e64d05267d014d0528d8570001','姚明','1','2015-04-15','8888','13566666666','402881e44cbc0292014cbd3aac1f0001','402881e54ce9ee7d014ce9f0b6450000','2015-04-29 20:31:12');

/*Table structure for table `t_b_visitor` */

DROP TABLE IF EXISTS `t_b_visitor`;

CREATE TABLE `t_b_visitor` (
  `id` varchar(36) NOT NULL,
  `visitorname` varchar(10) DEFAULT NULL,
  `studentid` varchar(36) NOT NULL,
  `relationship` varchar(10) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`studentid`),
  KEY `fk_t_b_visitor_t_b_student1` (`studentid`),
  CONSTRAINT `fk_t_b_visitor_t_b_student1` FOREIGN KEY (`studentid`) REFERENCES `t_b_student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_b_visitor` */

insert  into `t_b_visitor`(`id`,`visitorname`,`studentid`,`relationship`,`starttime`,`endtime`,`remark`,`createTime`) values ('2c9281a162d815fe0162d8206adc0006','吴彦祖','2c9281a162d815fe0162d81748c30000','3','2018-04-18 17:39:57','2018-04-18 22:40:07','俩人在干啥也不知道','2018-04-18 17:40:25'),('402881e64d094b2b014d095f25cc0000','李晨','402881e64d05267d014d0527e3f80000','1','2015-04-30 14:08:39','2015-04-30 16:08:44','来了，来了就做吧！','2015-04-30 16:09:00');

/*Table structure for table `t_s_depart` */

DROP TABLE IF EXISTS `t_s_depart`;

CREATE TABLE `t_s_depart` (
  `id` varchar(36) NOT NULL,
  `departname` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `parentid` varchar(36) NOT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t_s_depart_t_s_depart1` (`parentid`),
  CONSTRAINT `fk_t_s_depart_t_s_depart1` FOREIGN KEY (`parentid`) REFERENCES `t_s_depart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_s_depart` */

insert  into `t_s_depart`(`id`,`departname`,`description`,`parentid`,`createTime`) values ('1','test','test','1',NULL);

/*Table structure for table `t_s_resource` */

DROP TABLE IF EXISTS `t_s_resource`;

CREATE TABLE `t_s_resource` (
  `id` varchar(36) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `href` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL,
  `resourceType` int(11) DEFAULT NULL,
  `parentid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t_s_resource_t_s_resource1` (`parentid`),
  CONSTRAINT `fk_t_s_resource_t_s_resource1` FOREIGN KEY (`parentid`) REFERENCES `t_s_resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_s_resource` */

insert  into `t_s_resource`(`id`,`createTime`,`description`,`href`,`name`,`order_no`,`resourceType`,`parentid`) values ('1','2014-08-27 16:05:40','系统','/','系统',1,1,NULL),('2',NULL,NULL,'userController.do?goUser','用户管理',1,1,'5'),('3',NULL,NULL,'roleController.do?goRole','角色管理',2,1,'5'),('4',NULL,NULL,'resourceController.do?goResource','菜单管理',3,1,'5'),('402881e44cb6a685014cb6a840aa0000','2015-04-14 17:07:19','基本信息管理','/','信息管理',2,1,'1'),('402881e44cb71ec1014cb723b7f40000','2015-04-15 13:55:55','学生基本信息管理','studentController.do?goStudent','学生管理',1,1,'402881e44cb6a685014cb6a840aa0000'),('402881e44cbbe87e014cbbea99a80000','2015-04-15 15:10:56','班级信息管理','classController.do?goClass','班级管理',2,1,'402881e44cb6a685014cb6a840aa0000'),('402881e54ce5b4be014ce5b838fa0000','2015-04-23 17:59:57','管理访客','visitorController.do?goVisitor','访客管理',3,1,'402881e44cb6a685014cb6a840aa0000'),('402881e54ce5b4be014ce5b8def70001','2015-04-27 10:00:44','管理损坏情况','damageController.do?goDamage','损耗管理',4,1,'402881e44cb6a685014cb6a840aa0000'),('402881e54ce5b4be014ce5b9a0bb0002','2015-04-23 18:01:30','管理宿舍信息','dormController.do?goDorm','宿舍管理',5,1,'402881e44cb6a685014cb6a840aa0000'),('402881e64d0404df014d040685870000','2015-04-29 15:14:05','对宿舍进行评分','scoreController.do?goScore','宿舍评分',6,1,'402881e44cb6a685014cb6a840aa0000'),('5',NULL,NULL,'/','系统管理',9,1,'1');

/*Table structure for table `t_s_role` */

DROP TABLE IF EXISTS `t_s_role`;

CREATE TABLE `t_s_role` (
  `id` varchar(36) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_s_role` */

insert  into `t_s_role`(`id`,`createTime`,`description`,`name`) values ('1','2015-04-29 15:14:30','拥有最高权限','超级管理员'),('2c9281a162d815fe0162d81a6adc0001','2018-04-18 17:33:52','宿管可以管理宿舍相关业务','宿管'),('402881e54c7e34f6014c7e367bfb0000','2015-04-07 20:08:41','学生只能查看自己的相关信息','学生');

/*Table structure for table `t_s_role_resource` */

DROP TABLE IF EXISTS `t_s_role_resource`;

CREATE TABLE `t_s_role_resource` (
  `role_id` varchar(36) NOT NULL,
  `resource_id` varchar(36) NOT NULL,
  KEY `FK17BAC656127E527` (`role_id`),
  KEY `FK17BAC653B9CBFA7` (`resource_id`),
  CONSTRAINT `FK17BAC653B9CBFA7` FOREIGN KEY (`resource_id`) REFERENCES `t_s_resource` (`id`),
  CONSTRAINT `FK17BAC656127E527` FOREIGN KEY (`role_id`) REFERENCES `t_s_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_s_role_resource` */

insert  into `t_s_role_resource`(`role_id`,`resource_id`) values ('1','1'),('1','402881e44cb6a685014cb6a840aa0000'),('1','402881e44cb71ec1014cb723b7f40000'),('1','402881e44cbbe87e014cbbea99a80000'),('1','402881e54ce5b4be014ce5b838fa0000'),('1','402881e54ce5b4be014ce5b8def70001'),('1','402881e54ce5b4be014ce5b9a0bb0002'),('1','402881e64d0404df014d040685870000'),('1','5'),('1','2'),('1','3'),('1','4'),('402881e54c7e34f6014c7e367bfb0000','402881e54ce5b4be014ce5b838fa0000'),('402881e54c7e34f6014c7e367bfb0000','402881e54ce5b4be014ce5b8def70001'),('402881e54c7e34f6014c7e367bfb0000','1'),('402881e54c7e34f6014c7e367bfb0000','402881e44cb6a685014cb6a840aa0000'),('2c9281a162d815fe0162d81a6adc0001','402881e54ce5b4be014ce5b838fa0000'),('2c9281a162d815fe0162d81a6adc0001','402881e54ce5b4be014ce5b8def70001'),('2c9281a162d815fe0162d81a6adc0001','402881e54ce5b4be014ce5b9a0bb0002'),('2c9281a162d815fe0162d81a6adc0001','402881e64d0404df014d040685870000'),('2c9281a162d815fe0162d81a6adc0001','1'),('2c9281a162d815fe0162d81a6adc0001','402881e44cb6a685014cb6a840aa0000');

/*Table structure for table `t_s_user` */

DROP TABLE IF EXISTS `t_s_user`;

CREATE TABLE `t_s_user` (
  `id` varchar(36) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `position_desc` varchar(100) DEFAULT NULL,
  `real_name` varchar(10) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `userName` varchar(50) NOT NULL,
  `departid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t_s_user_t_s_depart1` (`departid`),
  CONSTRAINT `fk_t_s_user_t_s_depart1` FOREIGN KEY (`departid`) REFERENCES `t_s_depart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_s_user` */

insert  into `t_s_user`(`id`,`createTime`,`email`,`password`,`phone`,`position`,`position_desc`,`real_name`,`status`,`userName`,`departid`) values ('1','2015-04-03 14:32:12','llqqxf@163.com','21232f297a57a5a743894a0e4a801fc3','13918621282','CEO','CEO','智慧点点',1,'admin',NULL),('2c9281a162d815fe0162d81b54720002','2018-04-18 17:34:52','llq@qq.com','5f8591a3d4fe06393cad53edff27ba05','13656565656','无','','张三',1,'张三学生',NULL),('2c9281a162d815fe0162d81b9ac10003','2018-04-18 17:35:10','117272@qq.com','5f8591a3d4fe06393cad53edff27ba05','15665656565','宿管阿姨','管理宿舍','张阿姨',1,'张阿姨',NULL);

/*Table structure for table `t_s_user_role` */

DROP TABLE IF EXISTS `t_s_user_role`;

CREATE TABLE `t_s_user_role` (
  `user_id` varchar(36) NOT NULL,
  `role_id` varchar(36) NOT NULL,
  KEY `FKD0596186127E527` (`role_id`),
  KEY `FKD059618652A907` (`user_id`),
  CONSTRAINT `FKD0596186127E527` FOREIGN KEY (`role_id`) REFERENCES `t_s_role` (`id`),
  CONSTRAINT `FKD059618652A907` FOREIGN KEY (`user_id`) REFERENCES `t_s_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_s_user_role` */

insert  into `t_s_user_role`(`user_id`,`role_id`) values ('1','1'),('2c9281a162d815fe0162d81b54720002','402881e54c7e34f6014c7e367bfb0000'),('2c9281a162d815fe0162d81b9ac10003','2c9281a162d815fe0162d81a6adc0001');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
