-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: cs12
-- ------------------------------------------------------
-- Server version	5.1.73-log

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
-- Table structure for table `Adviser`
--

DROP TABLE IF EXISTS `Adviser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Adviser` (
  `StudID` int(11) NOT NULL,
  `FacID` int(11) DEFAULT NULL,
  PRIMARY KEY (`StudID`),
  KEY `FacID` (`FacID`),
  CONSTRAINT `Adviser_ibfk_1` FOREIGN KEY (`StudID`) REFERENCES `Student` (`StudID`),
  CONSTRAINT `Adviser_ibfk_2` FOREIGN KEY (`FacID`) REFERENCES `Faculty` (`FacID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adviser`
--

LOCK TABLES `Adviser` WRITE;
/*!40000 ALTER TABLE `Adviser` DISABLE KEYS */;
INSERT INTO `Adviser` VALUES (100063,1039),(100092,1039),(100109,1039),(100088,1043),(100096,1044),(100076,1045),(100069,1049),(100070,1049),(100093,1049),(100098,1049),(100104,1053),(100111,1053),(100105,1055),(100059,1056),(100060,1056),(100061,1059);
/*!40000 ALTER TABLE `Adviser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Classification`
--

DROP TABLE IF EXISTS `Classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Classification` (
  `ClassID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Classification`
--

LOCK TABLES `Classification` WRITE;
/*!40000 ALTER TABLE `Classification` DISABLE KEYS */;
INSERT INTO `Classification` VALUES (1,'Freshmen'),(2,'Sophomore'),(3,'Junior'),(4,'Senior');
/*!40000 ALTER TABLE `Classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course` (
  `CrsID` int(11) NOT NULL AUTO_INCREMENT,
  `CrsName` varchar(40) DEFAULT NULL,
  `CrsCredits` float DEFAULT NULL,
  `CrsAbr` varchar(20) DEFAULT NULL,
  `FacID` int(11) NOT NULL,
  `MajID` int(11) NOT NULL,
  PRIMARY KEY (`CrsID`),
  KEY `FacID` (`FacID`),
  KEY `MajID` (`MajID`),
  CONSTRAINT `Course_ibfk_1` FOREIGN KEY (`FacID`) REFERENCES `Faculty` (`FacID`),
  CONSTRAINT `Course_ibfk_2` FOREIGN KEY (`MajID`) REFERENCES `Major` (`MajID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES (11,'Computer Science 1',4,'1314',1039,1),(12,'Computer Science 1 Lab',0,'1314L',1039,1),(13,'Computer Science 2',4,'1514',1041,1),(14,'Computer Science 2 Lab',0,'1514L',1041,1),(15,'Discrete Math',3,'1523',1045,1),(16,'Network Programming',3,'3013',1043,1),(17,'Operating Systems',3,'3513',1057,1),(18,'Algorithm Analysis',3,'3713',1050,1),(19,'Software Engineering',4,'4204',1047,1),(20,'Software Engineering Lab',0,'4204L',1047,1),(21,'Intro to Networking',3,'1503',1040,2),(22,'Research Topics in IT',3,'4013',1044,2),(23,'Cobal Programming',3,'3064',1049,2),(24,'Industrial Management Systems',3,'4033',1053,2),(25,'Internetworking Technologies',4,'2414',1056,2),(26,'Internetworking Technologies Lab',0,'2414L',1056,2),(28,'Capstone Project',3,'4233',1057,1),(29,'CS:Intro GUI: Progr in Python',3,'4003',1050,1),(30,'Sem: CS: Agile Development',3,'4023',1057,1),(31,'Programming 1',4,'1414',1053,2),(32,'Programming 1 L',0,'1414L',1053,2),(33,'Legal & Ethical Issues:IT Pro',3,'4342',1056,2),(34,'Fund Of Sys Analysis & Design',3,'2033',1049,2),(35,'Intro Comp Info Systems',3,'1013',1057,2),(36,'Technical Communications',3,'3013',1057,2),(37,'Workplace Safety',3,'4143',1053,2),(38,'Web System Technologies',3,'2333',1041,1),(39,'Data Structures',3,'2413',1039,1);
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `CourseCatalog`
--

DROP TABLE IF EXISTS `CourseCatalog`;
/*!50001 DROP VIEW IF EXISTS `CourseCatalog`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CourseCatalog` (
 `SectID` tinyint NOT NULL,
  `SectMaxStud` tinyint NOT NULL,
  `SemSemester` tinyint NOT NULL,
  `SemYear` tinyint NOT NULL,
  `SemStart` tinyint NOT NULL,
  `SemEnd` tinyint NOT NULL,
  `TimeAbr` tinyint NOT NULL,
  `RoomLocation` tinyint NOT NULL,
  `CrsName` tinyint NOT NULL,
  `CrsCredits` tinyint NOT NULL,
  `CrsAbr` tinyint NOT NULL,
  `FacID` tinyint NOT NULL,
  `FacLastName` tinyint NOT NULL,
  `DepID` tinyint NOT NULL,
  `DepName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Degree`
--

DROP TABLE IF EXISTS `Degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Degree` (
  `DegID` int(11) NOT NULL AUTO_INCREMENT,
  `DegEarned` date DEFAULT NULL,
  `StudID` int(11) NOT NULL,
  `MajID` int(11) NOT NULL,
  PRIMARY KEY (`DegID`),
  KEY `StudID` (`StudID`),
  KEY `MajID` (`MajID`),
  CONSTRAINT `Degree_ibfk_1` FOREIGN KEY (`StudID`) REFERENCES `Student` (`StudID`),
  CONSTRAINT `Degree_ibfk_2` FOREIGN KEY (`MajID`) REFERENCES `Major` (`MajID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Degree`
--

LOCK TABLES `Degree` WRITE;
/*!40000 ALTER TABLE `Degree` DISABLE KEYS */;
/*!40000 ALTER TABLE `Degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `DepID` int(11) NOT NULL AUTO_INCREMENT,
  `DepName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DepID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (1,'Staff'),(2,'CS'),(3,'IT');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Emails`
--

DROP TABLE IF EXISTS `Emails`;
/*!50001 DROP VIEW IF EXISTS `Emails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Emails` (
 `email` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Emailz`
--

DROP TABLE IF EXISTS `Emailz`;
/*!50001 DROP VIEW IF EXISTS `Emailz`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Emailz` (
 `StudEmail` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `FacRole`
--

DROP TABLE IF EXISTS `FacRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FacRole` (
  `RoleID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FacRole`
--

LOCK TABLES `FacRole` WRITE;
/*!40000 ALTER TABLE `FacRole` DISABLE KEYS */;
INSERT INTO `FacRole` VALUES (1,'STUDENT'),(2,'INSTRUCTOR'),(3,'CHAIR'),(4,'SECRETARY'),(5,'ADMIN');
/*!40000 ALTER TABLE `FacRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Faculty` (
  `FacID` int(11) NOT NULL AUTO_INCREMENT,
  `FacFirstName` varchar(30) DEFAULT NULL,
  `FacLastName` varchar(30) DEFAULT NULL,
  `FacOfficePhone` varchar(14) DEFAULT NULL,
  `FacPassword` varchar(50) DEFAULT NULL,
  `FacLocation` varchar(20) DEFAULT NULL,
  `FacPhone` varchar(14) DEFAULT NULL,
  `FacEmail` varchar(30) DEFAULT NULL,
  `DepID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `isActive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`FacID`),
  KEY `DepID` (`DepID`),
  KEY `RoleID` (`RoleID`),
  CONSTRAINT `Faculty_ibfk_1` FOREIGN KEY (`DepID`) REFERENCES `Department` (`DepID`),
  CONSTRAINT `Faculty_ibfk_2` FOREIGN KEY (`RoleID`) REFERENCES `FacRole` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=1064 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES (1039,'Tonie','Bernardi','(202)-577-0863','H20!777isgood','Howell Hall','(580)555-5555','TBernardi@cameron.edu',2,2,0),(1040,'Britni','Dodshun','(841)-958-1121','Pass_1234','Howell Hall','(580)555-5555','DodshunB7@cameron.edu',3,2,0),(1041,'Dianna','Mussington','(964)-533-8578','Pass_1234','Howell Hall','(580)555-5555','MussingtonD@cameron.edu',2,2,0),(1042,'Donnie','Valett','(145)-462-7866','Pass_1234','Howell Hall','(580)555-5555','DonnieV@cameron.edu',1,4,0),(1043,'Archibald','Wiffler','(919)-180-1502','Pass_1234','Howell Hall','(580)555-5555','ArchWiffler34@cameron.edu',2,2,0),(1044,'Birgitta','Cisson','(298)-628-7724','Pass_1234','Howell Hall','(580)555-5555','BCisson@cameorn.edu',3,2,0),(1045,'Brander','Di Franceschi','(572)-118-4936','Pass_1234','Howell Hall','(580)555-5555','FranceschiBr2@cameron.edu',2,2,0),(1046,'Becca','Conaboy','(341)-604-7648','Pass_1234','Howell Hall','(580)555-5555','CBec256800@gmail.com',1,4,0),(1047,'Jacquenette','Files','(819)-634-4271','Pass_1234','Howell Hall','(580)555-5555','JFiles2228900@cameron.edu',2,2,0),(1048,'Bail','Van\'t Hoff','(547)-895-3840','Pass_1234','Howell Hall','(580)555-5555','VanBail@cameron.edu',1,4,0),(1049,'Rois','Bloodworth','(315)-977-8846','Pass_1234','Howell Hall','(580)555-5555','bRois2344@cameron.edu',3,2,0),(1050,'Gannie','Redfearn','(502)-594-4928','Pass_1234','Howell Hall','(580)555-5555','GRedfearn27@cameron.edu',2,2,0),(1051,'Emili','Torri','(754)-756-0484','Pass_1234','Howell Hall','(580)555-5555','Etorr2021@hotmail.com',1,4,0),(1052,'Zerk','Ilson','(267)-565-6724','Pass_1234','Howell Hall','(580)555-5555','IlsonZ21@cameron.edu',2,2,0),(1053,'Teresa','Bordman','(737)-772-0991','Pass_1234','Howell Hall','(580)555-5555','BordmanT@cameron.edu',3,2,0),(1055,'Arturo','Zanini','(245)-276-0245','Pass_1234','Howell Hall','(580)555-5555','justin_86sc@hotmail.com',1,3,0),(1056,'Dynah','Waistall','(956)-845-0241','Pass_1234','Howell Hall','(580)555-5555','WaistallD@cameron.edu',3,2,0),(1057,'Bethena','Bowfin','(170)-631-7515','Pass_1234','Howell Hall','(580)555-5555','BBowfin@cameron.edu',2,2,0),(1058,'Horatia','Docksey','(518)-577-4937','Pass_1234','Howell Hall','(580)555-5555','Docksey2321@cameron.edu',1,4,0),(1059,'Justin','Administrator','(518)-577-4937','Iloveprograms2!','office','(580)555-5555','jw925682@cameron.edu',1,5,0),(1060,'Justin','Winchester','5802910000','211dcac9d12c7d2ee7ff4014c93a36e008ea39d6','Howell Hall','5802910000','toysrus@cameron.edu',2,2,NULL),(1061,'Justin','Winchester','5802910000','$2y$10$JTQ3qG1ZRITx98zsJJnjv.bmkpVOfah5yr2jKAq4evz','Howell Hall','5802910000','j986575GH@cameron.edu',2,2,NULL),(1062,'Justin','Winchester','5802912055','$2y$10$suk4qjMhiMqaOldurv/AcOT09Ny8o6l0blccotp8TVV','Howell Hall','5802912222','jw90002@cameron.edu',2,2,NULL),(1063,'Josh','Washington','5805555555','$2y$10$oS2/ZvUeHtKNLpgC8/9K8.A9tvfYx/vbsvosDUtkKlp','Howell Hall','5805555555','thankyougod77@cameron.edu',1,4,0);
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `History`
--

DROP TABLE IF EXISTS `History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `History` (
  `StudID` int(11) NOT NULL,
  `SectID` int(11) NOT NULL,
  `Grade` float DEFAULT NULL,
  PRIMARY KEY (`StudID`,`SectID`),
  KEY `SectID` (`SectID`),
  CONSTRAINT `History_ibfk_1` FOREIGN KEY (`StudID`) REFERENCES `Student` (`StudID`),
  CONSTRAINT `History_ibfk_2` FOREIGN KEY (`SectID`) REFERENCES `Section` (`SectID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `History`
--

LOCK TABLES `History` WRITE;
/*!40000 ALTER TABLE `History` DISABLE KEYS */;
INSERT INTO `History` VALUES (100059,1,4),(100059,2,4);
/*!40000 ALTER TABLE `History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Major`
--

DROP TABLE IF EXISTS `Major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Major` (
  `MajID` int(11) NOT NULL AUTO_INCREMENT,
  `MajName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MajID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Major`
--

LOCK TABLES `Major` WRITE;
/*!40000 ALTER TABLE `Major` DISABLE KEYS */;
INSERT INTO `Major` VALUES (1,'CS'),(2,'IT');
/*!40000 ALTER TABLE `Major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Room` (
  `RoomID` int(11) NOT NULL AUTO_INCREMENT,
  `RoomLocation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`RoomID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES (1,'CU Howell Hall 134N'),(2,'CU Howell Hall 135'),(3,'CU Howell Hall 150'),(4,'CU Howell Hall 151'),(5,'CU Howell Hall 221 S'),(6,'CU Howell Hall 222'),(7,'CU Howell Hall 234 N'),(8,'CU Howell Hall 240 N'),(9,'CU Howell Hall 244'),(10,'CU Howell Hall 255'),(11,'ONLINE COURSE');
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Schedules`
--

DROP TABLE IF EXISTS `Schedules`;
/*!50001 DROP VIEW IF EXISTS `Schedules`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Schedules` (
 `StudID` tinyint NOT NULL,
  `StudFirstName` tinyint NOT NULL,
  `StudLastName` tinyint NOT NULL,
  `SemSemester` tinyint NOT NULL,
  `SemYear` tinyint NOT NULL,
  `SemStart` tinyint NOT NULL,
  `SemEnd` tinyint NOT NULL,
  `TimeAbr` tinyint NOT NULL,
  `RoomLocation` tinyint NOT NULL,
  `CrsName` tinyint NOT NULL,
  `CrsCredits` tinyint NOT NULL,
  `CrsAbr` tinyint NOT NULL,
  `FacID` tinyint NOT NULL,
  `FacLastName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Section`
--

DROP TABLE IF EXISTS `Section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Section` (
  `SectID` int(11) NOT NULL AUTO_INCREMENT,
  `SectMaxStud` int(11) DEFAULT NULL,
  `CID` int(11) NOT NULL,
  `SemID` int(11) NOT NULL,
  `TimeID` int(11) NOT NULL,
  `RoomID` int(11) NOT NULL,
  PRIMARY KEY (`SectID`),
  KEY `CID` (`CID`),
  KEY `SemID` (`SemID`),
  KEY `TimeID` (`TimeID`),
  KEY `RoomID` (`RoomID`),
  CONSTRAINT `Section_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `Course` (`CrsID`),
  CONSTRAINT `Section_ibfk_2` FOREIGN KEY (`SemID`) REFERENCES `Semester` (`SemID`),
  CONSTRAINT `Section_ibfk_3` FOREIGN KEY (`TimeID`) REFERENCES `Time` (`TimeID`),
  CONSTRAINT `Section_ibfk_4` FOREIGN KEY (`RoomID`) REFERENCES `Room` (`RoomID`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Section`
--

LOCK TABLES `Section` WRITE;
/*!40000 ALTER TABLE `Section` DISABLE KEYS */;
INSERT INTO `Section` VALUES (1,28,11,10,5,1),(2,28,12,10,7,1),(3,28,11,10,4,2),(4,28,12,10,6,2),(5,30,13,10,5,3),(6,30,14,10,7,3),(7,31,15,10,3,4),(8,6,15,10,13,11),(9,28,16,10,1,5),(10,24,16,10,8,6),(11,25,17,10,5,7),(12,25,17,10,13,11),(13,25,18,10,2,8),(14,26,19,10,7,7),(15,26,20,10,9,7),(16,26,21,10,4,9),(17,26,21,10,11,10),(18,32,22,10,1,1),(19,32,23,10,6,3),(20,28,24,10,5,6),(21,29,25,10,1,8),(22,29,26,10,3,8),(23,24,28,12,8,10),(24,24,29,12,2,4),(25,24,30,12,6,1),(26,24,30,12,2,1),(27,27,31,12,1,7),(28,27,32,12,3,7),(29,28,33,12,4,3),(30,28,33,12,13,11),(31,28,34,12,13,11),(32,28,34,12,12,8),(33,28,35,12,13,11),(34,28,35,12,9,5),(35,28,35,12,10,10),(36,28,36,12,11,1),(37,32,36,12,13,11),(38,28,37,12,1,5),(39,29,38,12,1,6),(40,29,38,12,3,6),(41,24,39,12,3,9),(42,24,39,12,4,9),(43,24,39,12,12,9),(44,24,11,11,1,5),(45,27,12,11,3,5),(46,27,39,11,4,4),(47,28,21,11,10,3),(48,28,36,11,2,8),(49,28,29,11,5,2),(50,28,29,11,13,11),(51,28,35,11,13,11),(52,28,11,13,5,1),(53,28,12,13,7,1),(54,28,11,13,4,2),(55,28,12,13,6,2),(56,30,13,13,5,3),(57,30,14,13,7,3),(58,31,15,13,3,4),(59,6,15,13,13,11),(60,28,16,13,1,5),(61,24,16,13,8,6),(62,25,17,13,5,7),(63,25,17,13,13,11),(64,25,18,13,2,8),(65,26,19,13,7,7),(66,26,20,13,9,7),(67,26,21,13,4,9),(68,26,21,13,11,10),(69,32,22,13,1,1),(70,32,23,13,6,3),(71,28,24,13,5,6),(72,29,25,13,1,8),(73,29,26,13,3,8),(74,24,28,15,8,10),(75,24,29,15,2,4),(76,24,30,15,6,1),(77,24,30,15,2,1),(78,27,31,15,1,7),(79,27,32,15,3,7),(80,28,33,15,4,3),(81,28,33,15,13,11),(82,28,34,15,13,11),(83,28,34,15,12,8),(84,28,35,15,13,11),(85,28,35,15,9,5),(86,28,35,15,10,10),(87,28,36,15,11,1),(88,32,36,15,13,11),(89,28,37,15,1,5),(90,29,38,15,1,6),(91,29,38,15,3,6),(92,24,39,15,3,9),(93,24,39,15,4,9),(94,24,39,15,12,9),(95,24,11,14,1,5),(96,27,12,14,3,5),(97,27,39,14,4,4),(98,28,21,14,10,3),(99,28,36,14,2,8),(100,28,29,14,5,2),(101,28,29,14,13,11),(102,28,35,14,13,11),(103,28,11,16,5,1),(104,28,12,16,7,1),(105,28,11,16,4,2),(106,28,12,16,6,2),(107,30,13,16,5,3),(108,30,14,16,7,3),(109,31,15,16,3,4),(110,6,15,16,13,11),(111,28,16,16,1,5),(112,24,16,16,8,6),(113,25,17,16,5,7),(114,25,17,16,13,11),(115,25,18,16,2,8),(116,26,19,16,7,7),(117,26,20,16,9,7),(118,26,21,16,4,9),(119,26,21,16,11,10),(120,32,22,16,1,1),(121,32,23,16,6,3),(122,28,24,16,5,6),(123,29,25,16,1,8),(124,29,26,16,3,8),(125,24,28,18,8,10),(126,24,29,18,2,4),(127,24,30,18,6,1),(128,24,30,18,2,1),(129,27,31,18,1,7),(130,27,32,18,3,7),(131,28,33,18,4,3),(132,28,33,18,13,11),(133,28,34,18,13,11),(134,28,34,18,12,8),(135,28,35,18,13,11),(136,28,35,18,9,5),(137,28,35,18,10,10),(138,28,36,18,11,1),(139,32,36,18,13,11),(140,28,37,18,1,5),(141,29,38,18,1,6),(142,29,38,18,3,6),(143,24,39,18,3,9),(144,24,39,18,4,9),(145,27,12,17,3,5),(146,27,39,17,4,4),(147,28,21,17,10,3),(148,28,29,17,13,11),(149,28,35,17,13,11),(150,24,11,17,1,5),(151,28,29,17,5,2),(152,28,29,17,5,2);
/*!40000 ALTER TABLE `Section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Semester`
--

DROP TABLE IF EXISTS `Semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Semester` (
  `SemID` int(11) NOT NULL AUTO_INCREMENT,
  `SemSemester` varchar(10) DEFAULT NULL,
  `SemYear` date DEFAULT NULL,
  `SemStart` date DEFAULT NULL,
  `SemEnd` date DEFAULT NULL,
  PRIMARY KEY (`SemID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Semester`
--

LOCK TABLES `Semester` WRITE;
/*!40000 ALTER TABLE `Semester` DISABLE KEYS */;
INSERT INTO `Semester` VALUES (10,'Fall','2019-01-01','2019-08-16','2019-12-10'),(11,'Summer','2019-01-01','2019-05-27','2019-07-26'),(12,'Spring','2019-01-01','2019-01-11','2019-05-07'),(13,'Fall','2020-01-01','0000-00-00','2020-12-10'),(14,'Summer','2020-01-01','2020-05-27','2020-07-26'),(15,'Spring','2020-01-01','2020-01-11','2020-05-07'),(16,'Fall','2021-01-01','2021-08-16','2021-12-10'),(17,'Summer','2021-01-01','2021-05-27','2021-07-26'),(18,'Spring','2021-01-01','0000-00-00','2021-05-07'),(19,'','0000-00-00','0000-00-00','0000-00-00'),(20,'Fall','2022-01-01','2022-01-01','2022-06-03'),(21,'FaLL','0000-00-00','0000-00-00','0000-00-00');
/*!40000 ALTER TABLE `Semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `StudID` int(11) NOT NULL AUTO_INCREMENT,
  `StudFirstName` varchar(30) DEFAULT NULL,
  `StudLastName` varchar(30) DEFAULT NULL,
  `StudAddress` varchar(30) DEFAULT NULL,
  `StudCity` varchar(30) DEFAULT NULL,
  `StudCountry` varchar(30) DEFAULT NULL,
  `StudPhone` varchar(14) DEFAULT NULL,
  `StudEmail` varchar(30) DEFAULT NULL,
  `StudDOB` date DEFAULT NULL,
  `StudEnrolled` date DEFAULT NULL,
  `StudPassword` varchar(255) DEFAULT NULL,
  `StudPin` int(11) DEFAULT NULL,
  `MajID` int(11) NOT NULL,
  `ClassID` int(11) NOT NULL,
  `RoleID` int(11) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`StudID`),
  KEY `MajID` (`MajID`),
  KEY `ClassID` (`ClassID`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`MajID`) REFERENCES `Major` (`MajID`),
  CONSTRAINT `Student_ibfk_2` FOREIGN KEY (`ClassID`) REFERENCES `Classification` (`ClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=100117 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (100059,'Gill','Pipe','68 Forest Point','Tempe','United States','(602)-164-0615','Gman17@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,3,1,0),(100060,'Wilhelm','Savage','09 Hallows Pass','Columbus','United States','(614)-131-9814','Wilda_Sav@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,3,1,0),(100061,'Alon','Androlli','3 Bonner Plaza','Buffalo','United States','(716)-720-3082','Androl12@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,2,1,0),(100062,'Abel','McCandless','4 Cascade Lane','Boise','United States','(208)-551-0671','YoungAbe17@hotmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,1,1,0),(100063,'Noellyn','Brimacombe','1 Blue Bill Park Drive','Boston','United States','(617)-857-4030','Nb27001@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,1,1,0),(100064,'Kay','Brownsword','74949 Thierer Center','Zephyrhills','United States','(813)-495-8167','KayB44@yahoo.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,4,1,0),(100065,'Robinson','Lawrenz','77 Village Green Plaza','Richmond','United States','(804)-625-6151','Bfrench22@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,3,1,0),(100067,'Tybi','Cardenas','32 Sage Parkway','San Bernardino','United States','(760)-568-0256','Ilovecollege2000@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,2,1,0),(100068,'Enrichetta','Bellow','23 Troy Terrace','Washington','United States','(202)-191-4686','HiCoolPPL11@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,2,1,0),(100069,'Hester','Pozzo','788 Shopko Alley','Atlanta','United States','(770)-857-1493','hesterpozzo1@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,4,1,0),(100070,'Susanna','Traylen','1 Bashford Junction','Merrifield','United States','(571)-982-7649','SusyT87@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,1,1,0),(100071,'Gary','Seldner','7164 Village Plaza','Buffalo','United States','(716)-884-5631','ItsGary_447@hotmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,2,1,0),(100072,'Alard','Demonge','6678 Atwood Terrace','Norwalk','United States','(203)-357-9895','Aonto2_school@yahoo.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,3,1,0),(100073,'Merla','Houlson','9 Fairview Lane','El Paso','United States','(915)-106-8445','MHtwo_hi2@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,3,1,0),(100074,'Frieda','Ericsson','5 Hooker Parkway','Philadelphia','United States','(267)-857-1443','Friedathewise@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,2,1,0),(100075,'Constantia','Cason','15 Pearson Circle','Washington','United States','(202)-279-8367','CC2019@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,1,1,0),(100076,'Alphard','Tremblett','24033 Roth Terrace','Las Cruces','United States','(505)-405-3808','Tremblett79@yahoo.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,3,1,0),(100077,'Colman','Hollidge','3 Declaration Place','Washington','United States','(202)-586-0443','HollyCo22@hotmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,1,1,0),(100078,'Grayce','Gleasane','19 Kedzie Avenue','Rochester','United States','(585)-569-3129','GraySkyies2@cameron.edu','2000-10-13','2017-12-21','Strong_pass123',NULL,1,3,1,0),(100079,'Englebert','Cutridge','6 Shoshone Crossing','Pittsburgh','United States','(412)-293-1520','Kentwell87@yahoo.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,1,1,0),(100080,'Andres','Kentwell','453 Pawling Way','Lansing','United States','(517)-877-7835','wowthisiscool1@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,1,1,0),(100081,'Brandice','Rawle','8 Blue Bill Park Center','Springfield','United States','(781)-444-3364','RB10012@cameron.edu','2000-10-13','2017-12-21','Strong_pass123',NULL,2,1,1,0),(100084,'Floria','Payze','764 Atwood Lane','Denver','United States','(303)-632-6536','Thatsagood1@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,2,1,0),(100085,'Octavia','Kobelt','4 Rigney Junction','New Haven','United States','(203)-158-0578','NikoNik7@yahoo.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,3,1,0),(100088,'Thane','Regus','39 Homewood Street','Beaumont','United States','(936)-554-6710','Regz29@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,2,1,0),(100090,'Floria','Payze','764 Atwood Lane','Denver','United States','(303)-632-6536','Thatsagood1@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,2,1,0),(100091,'Octavia','Kobelt','4 Rigney Junction','New Haven','United States','(203)-158-0578','NikoNik7@yahoo.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,3,1,0),(100092,'Nikos','Whitworth','92 Everett Circle','Newport Beach','United States','(714)-315-3511','LearningisUnique22@hotmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,2,1,0),(100093,'Manuel','Bannerman','664 Eagle Crest Plaza','Pasadena','United States','(626)-511-8673','HowaboutitT87@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,4,1,0),(100094,'Jermayne','Conn','7759 Sunfield Road','Whittier','United States','(626)-916-2813','GoSooners290@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,4,1,0),(100095,'Prisca','Ebbens','721 Kingsford Junction','Port Washington','United States','(516)-901-6734','GoAggies2021@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,4,1,0),(100096,'Dorthea','Barens','9 Monterey Place','Omaha','United States','(402)-613-9620','Hacther44@yahoo.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,2,1,0),(100097,'Reilly','Hachard','599 Acker Crossing','Newark','United States','(973)-574-8879','Tennesse33@yahoo.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,3,1,0),(100098,'Olivette','Bottoner','82 Merchant Way','El Paso','United States','(915)-932-4871','ImfromKc12@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,2,3,0),(100099,'Huntley','Buckam','9 Waxwing Drive','Detroit','United States','(313)-178-9811','SternLearn40@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,1,1,0),(100100,'Kingsly','Stearn','01190 Del Mar Court','Chesapeake','United States','(757)-340-6198','BeaB4510@yahoo.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,2,1,0),(100101,'Bea','Chung','3905 Thierer Street','Lakeland','United States','(863)-634-3008','MandM13@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,2,1,0),(100102,'Marlene','Martensen','7083 Blue Bill Park Point','Lafayette','United States','(337)-326-4677','AggieFan202011@yahoo.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,3,1,0),(100103,'Collete','Bickley','29 Anniversary Terrace','Arlington','United States','(817)-999-1896','CClike2learn@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,3,1,0),(100104,'Basile','Eddow','36483 South Point','Detroit','United States','(313)-571-9700','BEbrave42@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,4,1,0),(100105,'Clair','Caldwall','135 Kropf Plaza','Albany','United States','(518)-647-8452','IdntClareT87@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,4,1,0),(100106,'Gregg','Ramstead','61408 Bunting Parkway','Pueblo','United States','(719)-233-1864','GR23443@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,2,1,0),(100107,'Deidre','Melladew','97 Muir Hill','El Paso','United States','(915)-735-4149','MDew3000@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,3,1,0),(100108,'Reta','Newbury','36235 Lake View Terrace','Baton Rouge','United States','(225)-542-3487','RetaLoveSchool22@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,3,1,0),(100109,'Bjorn','Berrisford','64648 Northport Junction','Fairbanks','United States','(907)-525-6916','BjorIronside2021@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,2,1,0),(100110,'Lay','Grafton','1653 Florence Parkway','San Diego','United States','(619)-881-9641','Soontobesmarter2@yahoo.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,2,1,0),(100111,'Rheta','O\'Gormley','6649 Forest Place','Evansville','United States','(812)-726-7928','BK321667@yahoo.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,1,1,0),(100112,'Baxie','Kirrage','3 Glendale Park','Evansville','United States','(812)-676-5007','BaxiesBack95@yahoo.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,1,1,0),(100113,'Caresse','Gogin','6 American Ash Hill','Carlsbad','United States','(760)-491-7103','2coolforthat33@hotmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,2,2,1,0),(100114,'Cam','Jarville','11 Sullivan Terrace','Clearwater','United States','(786)-356-8148','CamcLEar22@gmail.com','2000-10-13','2017-12-21','Strong_pass123',NULL,1,1,1,0),(100115,'Justin','Winchester','1500 W Gore Blvd','Lawton','United States','5802915555','justeststudent@cameron.edu','0000-00-00','2018-01-01','Hello7!',0,2,3,1,0),(100116,'Mary','Thomas','1510 W Gore Blvd','Lawton','United States','580-290-5555','Maryscoolstudent@cameron.edu','0000-00-00','2017-10-07','$2y$10$k4EjEFIlOb2USrLxNPTdfONfNOtHtioWVMq6eCzO8M4XskseLKQoa',0,2,3,1,0);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `StudentsSchedules`
--

DROP TABLE IF EXISTS `StudentsSchedules`;
/*!50001 DROP VIEW IF EXISTS `StudentsSchedules`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `StudentsSchedules` (
 `StudFirstName` tinyint NOT NULL,
  `StudLastName` tinyint NOT NULL,
  `SemSemester` tinyint NOT NULL,
  `SemYear` tinyint NOT NULL,
  `SemStart` tinyint NOT NULL,
  `SemEnd` tinyint NOT NULL,
  `TimeAbr` tinyint NOT NULL,
  `RoomLocation` tinyint NOT NULL,
  `CrsName` tinyint NOT NULL,
  `CrsCredits` tinyint NOT NULL,
  `CrsAbr` tinyint NOT NULL,
  `FacLastName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Time`
--

DROP TABLE IF EXISTS `Time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Time` (
  `TimeID` int(11) NOT NULL AUTO_INCREMENT,
  `TimeAbr` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`TimeID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Time`
--

LOCK TABLES `Time` WRITE;
/*!40000 ALTER TABLE `Time` DISABLE KEYS */;
INSERT INTO `Time` VALUES (1,'MW 09:30-10:45'),(2,'TR 09:30-10:45'),(3,'MW 11:00-12:15'),(4,'TR 11:00-12:15'),(5,'MW 12:30-01:45'),(6,'TR 12:30-01:45'),(7,'MW 02:00-03:15'),(8,'TR 02:00-03:15'),(9,'MW 03:30-04:45'),(10,'TR 03:30-04:45'),(11,'MW 05:00-06:15'),(12,'TR 05:00-06:15'),(13,'ONLINE COURSE');
/*!40000 ALTER TABLE `Time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!50001 DROP VIEW IF EXISTS `tbl_users`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `tbl_users` (
 `id` tinyint NOT NULL,
  `roleid` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `password` tinyint NOT NULL,
  `mobile` tinyint NOT NULL,
  `isActive` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `users`
--

DROP TABLE IF EXISTS `users`;
/*!50001 DROP VIEW IF EXISTS `users`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `users` (
 `email` tinyint NOT NULL,
  `password` tinyint NOT NULL,
  `role` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `CourseCatalog`
--

/*!50001 DROP TABLE IF EXISTS `CourseCatalog`*/;
/*!50001 DROP VIEW IF EXISTS `CourseCatalog`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cs12`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `CourseCatalog` AS select `Section`.`SectID` AS `SectID`,`Section`.`SectMaxStud` AS `SectMaxStud`,`Semester`.`SemSemester` AS `SemSemester`,`Semester`.`SemYear` AS `SemYear`,`Semester`.`SemStart` AS `SemStart`,`Semester`.`SemEnd` AS `SemEnd`,`Time`.`TimeAbr` AS `TimeAbr`,`Room`.`RoomLocation` AS `RoomLocation`,`Course`.`CrsName` AS `CrsName`,`Course`.`CrsCredits` AS `CrsCredits`,`Course`.`CrsAbr` AS `CrsAbr`,`Faculty`.`FacID` AS `FacID`,`Faculty`.`FacLastName` AS `FacLastName`,`Faculty`.`DepID` AS `DepID`,`Department`.`DepName` AS `DepName` from ((((((`Section` join `Semester` on((`Semester`.`SemID` = `Section`.`SemID`))) join `Time` on((`Time`.`TimeID` = `Section`.`TimeID`))) join `Room` on((`Room`.`RoomID` = `Section`.`RoomID`))) join `Course` on((`Course`.`CrsID` = `Section`.`CID`))) join `Faculty` on((`Faculty`.`FacID` = `Course`.`FacID`))) join `Department` on((`Department`.`DepID` = `Faculty`.`DepID`))) order by `Semester`.`SemYear` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Emails`
--

/*!50001 DROP TABLE IF EXISTS `Emails`*/;
/*!50001 DROP VIEW IF EXISTS `Emails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cs12`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Emails` AS select `Student`.`StudEmail` AS `email` from `Student` union all select `Faculty`.`FacEmail` AS `FacEmail` from `Faculty` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Emailz`
--

/*!50001 DROP TABLE IF EXISTS `Emailz`*/;
/*!50001 DROP VIEW IF EXISTS `Emailz`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cs12`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Emailz` AS select `Student`.`StudEmail` AS `StudEmail` from `Student` union all select `Faculty`.`FacEmail` AS `FacEmail` from `Faculty` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Schedules`
--

/*!50001 DROP TABLE IF EXISTS `Schedules`*/;
/*!50001 DROP VIEW IF EXISTS `Schedules`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cs12`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Schedules` AS select `Student`.`StudID` AS `StudID`,`Student`.`StudFirstName` AS `StudFirstName`,`Student`.`StudLastName` AS `StudLastName`,`Semester`.`SemSemester` AS `SemSemester`,`Semester`.`SemYear` AS `SemYear`,`Semester`.`SemStart` AS `SemStart`,`Semester`.`SemEnd` AS `SemEnd`,`Time`.`TimeAbr` AS `TimeAbr`,`Room`.`RoomLocation` AS `RoomLocation`,`Course`.`CrsName` AS `CrsName`,`Course`.`CrsCredits` AS `CrsCredits`,`Course`.`CrsAbr` AS `CrsAbr`,`Faculty`.`FacID` AS `FacID`,`Faculty`.`FacLastName` AS `FacLastName` from (((((((`Student` join `History` on((`Student`.`StudID` = `History`.`StudID`))) join `Section` on((`Section`.`SectID` = `History`.`SectID`))) join `Semester` on((`Semester`.`SemID` = `Section`.`SemID`))) join `Time` on((`Time`.`TimeID` = `Section`.`TimeID`))) join `Room` on((`Room`.`RoomID` = `Section`.`RoomID`))) join `Course` on((`Course`.`CrsID` = `Section`.`CID`))) join `Faculty` on((`Faculty`.`FacID` = `Course`.`FacID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `StudentsSchedules`
--

/*!50001 DROP TABLE IF EXISTS `StudentsSchedules`*/;
/*!50001 DROP VIEW IF EXISTS `StudentsSchedules`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cs12`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `StudentsSchedules` AS select `Student`.`StudFirstName` AS `StudFirstName`,`Student`.`StudLastName` AS `StudLastName`,`Semester`.`SemSemester` AS `SemSemester`,`Semester`.`SemYear` AS `SemYear`,`Semester`.`SemStart` AS `SemStart`,`Semester`.`SemEnd` AS `SemEnd`,`Time`.`TimeAbr` AS `TimeAbr`,`Room`.`RoomLocation` AS `RoomLocation`,`Course`.`CrsName` AS `CrsName`,`Course`.`CrsCredits` AS `CrsCredits`,`Course`.`CrsAbr` AS `CrsAbr`,`Faculty`.`FacLastName` AS `FacLastName` from (((((((`Student` join `History` on((`Student`.`StudID` = `History`.`StudID`))) join `Section` on((`Section`.`SectID` = `History`.`SectID`))) join `Semester` on((`Semester`.`SemID` = `Section`.`SemID`))) join `Time` on((`Time`.`TimeID` = `Section`.`TimeID`))) join `Room` on((`Room`.`RoomID` = `Section`.`RoomID`))) join `Course` on((`Course`.`CrsID` = `Section`.`CID`))) join `Faculty` on((`Faculty`.`FacID` = `Course`.`FacID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tbl_users`
--

/*!50001 DROP TABLE IF EXISTS `tbl_users`*/;
/*!50001 DROP VIEW IF EXISTS `tbl_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cs12`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tbl_users` AS select `Student`.`StudID` AS `id`,`Student`.`RoleID` AS `roleid`,`Student`.`StudFirstName` AS `firstname`,`Student`.`StudLastName` AS `lastname`,`Student`.`StudEmail` AS `email`,`Student`.`StudPassword` AS `password`,`Student`.`StudPhone` AS `mobile`,`Student`.`isActive` AS `isActive` from `Student` union all select `Faculty`.`FacID` AS `FacID`,`Faculty`.`RoleID` AS `RoleID`,`Faculty`.`FacFirstName` AS `FacFirstName`,`Faculty`.`FacLastName` AS `FacLastName`,`Faculty`.`FacEmail` AS `FacEmail`,`Faculty`.`FacPassword` AS `FacPassword`,`Faculty`.`FacOfficePhone` AS `FacOfficePhone`,`Faculty`.`isActive` AS `isActive` from `Faculty` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users`
--

/*!50001 DROP TABLE IF EXISTS `users`*/;
/*!50001 DROP VIEW IF EXISTS `users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cs12`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users` AS select `Student`.`StudEmail` AS `email`,`Student`.`StudPassword` AS `password`,`Student`.`RoleID` AS `role` from `Student` union all select `Faculty`.`FacEmail` AS `FacEmail`,`Faculty`.`FacPassword` AS `FacPassword`,`Faculty`.`RoleID` AS `RoleID` from `Faculty` */;
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

-- Dump completed on 2021-04-14 21:13:18
