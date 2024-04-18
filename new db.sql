/*
SQLyog Community Edition- MySQL GUI v7.15 
MySQL - 5.5.29 : Database - creditcardfrad
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`creditcardfrad` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `creditcardfrad`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`username`,`password`) values ('admin','admin');

/*Table structure for table `card` */

DROP TABLE IF EXISTS `card`;

CREATE TABLE `card` (
  `id` int(11) DEFAULT NULL,
  `cname` varchar(40) DEFAULT NULL,
  `cno` varchar(40) DEFAULT NULL,
  `cvv` varchar(40) DEFAULT NULL,
  `edate` varchar(40) DEFAULT NULL,
  `user` varchar(40) DEFAULT NULL,
  `money` int(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `card` */

insert  into `card`(`id`,`cname`,`cno`,`cvv`,`edate`,`user`,`money`) values (0,'Nikith P','1234567890123456','123','11/22','nikilp306@gmail.com',12123),(0,'Shiva','1234567891234567','123','11/23','nikhith.1000projects@gmail.com',498000);

/*Table structure for table `fraud` */

DROP TABLE IF EXISTS `fraud`;

CREATE TABLE `fraud` (
  `user` varchar(40) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `pname` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fraud` */

insert  into `fraud`(`user`,`id`,`pname`) values ('nikhith.1000projects@gmail.com',2,'Laptop'),('nikilp306@gmail.com',1,'mobile'),('nikilp306@gmail.com',1,'mobile'),('nikilp306@gmail.com',1,'mobile'),('nikilp306@gmail.com',1,'mobile');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(40) DEFAULT NULL,
  `pquantity` varchar(40) DEFAULT NULL,
  `pdes` varchar(40) DEFAULT NULL,
  `pprice` varchar(40) DEFAULT NULL,
  `image` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `products` */

insert  into `products`(`id`,`pname`,`pquantity`,`pdes`,`pprice`,`image`) values (1,'mobile','13','aa','12000','mobile.jpg'),(2,'Laptop','10','Dell','50000','lap.jpg');

/*Table structure for table `purchase` */

DROP TABLE IF EXISTS `purchase`;

CREATE TABLE `purchase` (
  `id` int(40) DEFAULT NULL,
  `pname` varchar(40) DEFAULT NULL,
  `pdes` varchar(40) DEFAULT NULL,
  `quan` int(40) DEFAULT NULL,
  `total` int(40) DEFAULT NULL,
  `cno` varchar(40) DEFAULT NULL,
  `cvv` varchar(40) DEFAULT NULL,
  `user` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `purchase` */

insert  into `purchase`(`id`,`pname`,`pdes`,`quan`,`total`,`cno`,`cvv`,`user`) values (1,'mobile','aa',1,12000,'1234567891234567','123','nikhith.1000projects@gmail.com');

/*Table structure for table `server` */

DROP TABLE IF EXISTS `server`;

CREATE TABLE `server` (
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `server` */

insert  into `server`(`username`,`password`) values ('server','server');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `username` varchar(40) DEFAULT NULL,
  `password1` varchar(40) DEFAULT NULL,
  `gen` varchar(40) DEFAULT NULL,
  `dt` varchar(40) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `address` varchar(40) DEFAULT NULL,
  `status1` varchar(40) DEFAULT NULL,
  `skey` varchar(100) DEFAULT NULL,
  `cipher` varchar(100) DEFAULT NULL,
  `str` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`username`,`password1`,`gen`,`dt`,`mobile`,`email`,`address`,`status1`,`skey`,`cipher`,`str`) values ('chotu','chotu','Male','2023-08-01','8639966858','moulalicce225@gmail.com','hyd','Normal','3QjmHo6s40zvE7x09o/bNQ==','jpZOl4i9BP/IMDMe09PoqwuAKdA/u8fVBElgzcilHNw=','hii helloo how are you\n');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
