/*
SQLyog Trial v11.1 (32 bit)
MySQL - 5.5.19 : Database - guzhimei
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`guzhimei` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `guzhimei`;

/*Table structure for table `certificate` */

DROP TABLE IF EXISTS `certificate`;

CREATE TABLE `certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instruction` varchar(50) DEFAULT '',
  `pic_url` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `certificate` */

/*Table structure for table `constant` */

DROP TABLE IF EXISTS `constant`;

CREATE TABLE `constant` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `picUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `constant` */

insert  into `constant`(`id`,`title`,`content`,`picUrl`) values (1,'asdasd','<p>asdasdasd</p>',NULL),(2,'asdasd','<p>asdasdasd</p>',NULL);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT '',
  `content` varchar(255) DEFAULT '',
  `updatetime` datetime DEFAULT '2000-01-01 12:00:00',
  `type_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`content`,`updatetime`,`type_id`) values (1,'aaa','<p>asdasdad</p>','2013-03-20 21:56:51',1),(2,'asdasda','<p>asdasdasdad</p>','2013-03-27 20:21:33',4),(3,'12233','<p>asdasdvdaaacd</p>','2013-03-27 20:21:55',3),(4,'asdasdads','asdasdasdas','2000-01-01 12:00:00',3),(5,'asdsadasd','123456789','2000-01-01 12:00:00',4);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `pic_url` varchar(255) DEFAULT '',
  `function` varchar(255) DEFAULT '' COMMENT '功效',
  `type_id` int(11) DEFAULT '0' COMMENT '所属类型',
  `price` float DEFAULT '0' COMMENT '价格',
  `include` varchar(255) DEFAULT '' COMMENT '成分',
  `volume` varchar(25) DEFAULT '' COMMENT '容量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`pic_url`,`function`,`type_id`,`price`,`include`,`volume`) values (1,'asdad','/upload/1364739240437.doc','asdads',1,11,'asdasd','qqwe'),(2,'asdadasd','http://localhost:8080/upload/1364820650000.jpg','adsa',1,12,'aaaa','11as'),(3,'asdasdads','http://localhost:8080/upload/1364820650000.jpg','bbb',1,12,'aaa','aaa'),(4,'qwertgyhu','http://localhost:8080/upload/1364820650000.jpg','aaa',1,0,'aaaa','aaa');

/*Table structure for table `project` */

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT '0',
  `pic_url` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `project` */

insert  into `project`(`id`,`type_id`,`pic_url`,`description`) values (1,1,'http://localhost:8080/upload/1364825379296.jpg','<p>asdfghjk</p>');

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `reply`;

CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '',
  `content` varchar(255) DEFAULT '',
  `updatetime` datetime DEFAULT '2000-01-01 12:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `reply` */

/*Table structure for table `t_type` */

DROP TABLE IF EXISTS `t_type`;

CREATE TABLE `t_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `type` int(11) DEFAULT '0',
  `parentType` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_type` */

insert  into `t_type`(`id`,`name`,`type`,`parentType`) values (1,'aaa',1,0),(2,'bbb',2,0),(3,'ccc',3,0),(5,'eee',5,2),(6,'fff',6,3),(7,'asd',7,NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `pwd` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`pwd`) values (1,'admin','admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
