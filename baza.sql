/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.11-MariaDB : Database - library
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`library` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `library`;

/*Table structure for table `author` */

DROP TABLE IF EXISTS `author`;

CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `author` */

insert  into `author`(`id`,`firstName`,`lastName`) values 
(1,'dante','aligieri'),
(2,'stephen','king');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `descrpition` varchar(255) NOT NULL,
  `pages` int(11) NOT NULL,
  `releaseYear` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_66a4f0f47943a0d99c16ecf90b2` (`authorId`),
  CONSTRAINT `FK_66a4f0f47943a0d99c16ecf90b2` FOREIGN KEY (`authorId`) REFERENCES `author` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `book` */

insert  into `book`(`id`,`title`,`descrpition`,`pages`,`releaseYear`,`authorId`,`image`,`file`) values 
(1,'afdsg','asdfdsgfhdgfasgshdgjhgfagshdjhgaf agsrhdtj rydth',1243,12342,1,'Capture.PNG','концептуални модел.PNG'),
(2,'afdsg','dafghdnhgfa \\ndafsgrd \\nafsgrdht',344,1972,2,'Capture.PNG','концептуални модел.PNG'),
(4,'Izmena','',234,2000,1,'hrcak.jpg','iteh1.pdf'),
(5,'Docker in action','',330,2018,1,'docker slika.JPG','Docker-in-Action.pdf'),
(8,'Refactoring improving the design of existing code','',334,2002,2,'refactoring slika.jpg','refactoring.pdf'),
(9,'Java, the complete refference','',890,2010,1,'java slika.jpg','java pdf.pdf');

/*Table structure for table `book_topic` */

DROP TABLE IF EXISTS `book_topic`;

CREATE TABLE `book_topic` (
  `bookId` int(11) NOT NULL,
  `topicId` int(11) NOT NULL,
  PRIMARY KEY (`bookId`,`topicId`),
  KEY `IDX_80a629a49c3329ec7a28594e5d` (`bookId`),
  KEY `IDX_47a25e95b68cc294341862197e` (`topicId`),
  CONSTRAINT `FK_47a25e95b68cc294341862197e8` FOREIGN KEY (`topicId`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_80a629a49c3329ec7a28594e5d1` FOREIGN KEY (`bookId`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `book_topic` */

insert  into `book_topic`(`bookId`,`topicId`) values 
(1,1),
(2,1),
(4,1),
(4,2),
(4,4),
(5,1),
(5,7),
(5,8),
(8,7),
(9,7),
(9,8);

/*Table structure for table `favourite` */

DROP TABLE IF EXISTS `favourite`;

CREATE TABLE `favourite` (
  `userId` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`bookId`),
  KEY `FK_db0ea0aeab8448c32900c1673c5` (`bookId`),
  CONSTRAINT `FK_55262b1e0fdf72d3443562a9c3d` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_db0ea0aeab8448c32900c1673c5` FOREIGN KEY (`bookId`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `favourite` */

insert  into `favourite`(`userId`,`bookId`) values 
(1,2),
(1,4);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`timestamp`,`name`) values 
(1,1625052682786,'createUserTable1625052682786'),
(2,1625052797760,'createAuthorTable1625052797760'),
(3,1625052884068,'createTopicTable1625052884068'),
(4,1625053081284,'createBookTable1625053081284'),
(5,1625053306706,'createReviewTable1625053306706'),
(6,1625053497304,'updateBooks1625053497304'),
(7,1628939393252,'addFavourites1628939393252'),
(8,1628939920029,'addFavourites1628939920029');

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`bookId`),
  KEY `FK_ae1ec2fd91f77b5df325d1c7b4a` (`bookId`),
  KEY `FK_1337f93918c70837d3cea105d39` (`userId`),
  CONSTRAINT `FK_1337f93918c70837d3cea105d39` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_ae1ec2fd91f77b5df325d1c7b4a` FOREIGN KEY (`bookId`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `review` */

insert  into `review`(`id`,`content`,`rating`,`bookId`,`userId`) values 
(1,'review',4,2,1),
(2,'review',4,2,1),
(3,'cao',4,2,2),
(4,'Nije losa',4,2,1),
(5,'Nista spec',2,2,1),
(6,'dsafsb',4,1,1);

/*Table structure for table `topic` */

DROP TABLE IF EXISTS `topic`;

CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `topic` */

insert  into `topic`(`id`,`name`) values 
(1,'crime'),
(2,'fantasy'),
(3,'romantic'),
(4,'classic'),
(5,'sci-fi'),
(6,'children'),
(7,'tech'),
(8,'math');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `isAdmin` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user` */

insert  into `user`(`id`,`firstName`,`lastName`,`email`,`password`,`isAdmin`) values 
(1,'a','a','a','/1rBkZBCSx2I+UGe+UmuVriRDJwWOeh13xo7L6alJlo=',1),
(2,'b','b','b@gmail.com','/1rBkZBCSx2I+UGe+UmuVg+Tu5Tj7OdyyovAe6mRtCM=',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
