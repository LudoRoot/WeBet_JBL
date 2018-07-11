-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: webet_jbl
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `civilite`
--

DROP TABLE IF EXISTS `civilite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `civilite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `abbreviation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `civilite`
--

LOCK TABLES `civilite` WRITE;
/*!40000 ALTER TABLE `civilite` DISABLE KEYS */;
INSERT INTO `civilite` VALUES (1,'M'),(2,'Mme'),(3,'Melle');
/*!40000 ALTER TABLE `civilite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codepostal` varchar(255) DEFAULT NULL,
  `datenaissance` datetime NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `montantmax` int(11) NOT NULL,
  `numerorue` varchar(255) DEFAULT NULL,
  `rue` varchar(255) DEFAULT NULL,
  `soldecompte` double DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `civ_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1eq23iv73wvkbfgkvxn16dhpn` (`civ_id`),
  CONSTRAINT `FK1eq23iv73wvkbfgkvxn16dhpn` FOREIGN KEY (`civ_id`) REFERENCES `civilite` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'75000','1990-01-01 00:00:00','0661660709',100,'5','la pompe',100,'PARIS',1),(2,'75000','2000-05-05 00:00:00','0698563245',100,'5','la pompe',141.8,'PARIS',1);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_sport`
--

DROP TABLE IF EXISTS `client_sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_sport` (
  `CLIENT_ID` bigint(20) NOT NULL,
  `SPORT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `UK_f1m1srn57ftnlnwwubhv57eqs` (`SPORT_ID`),
  KEY `FKtc1dwpfd2vfk6btydoy7yr3vi` (`CLIENT_ID`),
  CONSTRAINT `FKeavd1t04l5a61094un31hldtn` FOREIGN KEY (`SPORT_ID`) REFERENCES `sport` (`id`),
  CONSTRAINT `FKtc1dwpfd2vfk6btydoy7yr3vi` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_sport`
--

LOCK TABLES `client_sport` WRITE;
/*!40000 ALTER TABLE `client_sport` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_sport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipe` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `sport_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt21d9pou6e4rlw2rmscepbf3h` (`sport_id`),
  CONSTRAINT `FKt21d9pou6e4rlw2rmscepbf3h` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
INSERT INTO `equipe` VALUES (1,'Paris Saint-Germain',1),(2,'Olympique de Marseille',1),(3,'AS Saint-Etienne',1),(4,'Stade Toulousain',2),(5,'Stade Français',2),(6,'Castres Olympique',2),(7,'Montpellier',3),(8,'PSG Handball',3),(9,'Chambery',3);
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `mdp` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6ffysvc6u2wy1xmdp9qa6v6bb` (`client_id`),
  CONSTRAINT `FK6ffysvc6u2wy1xmdp9qa6v6bb` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'admin@admin.fr','$2a$10$IgXxjX1plCjDO4CkydBfOORH89HQ2isKliIfyQNoKDXoaDXuggb02','admin','admin','ROLE_ADMIN',1),(2,'user@user.fr','$2a$10$yIvM1rV38Qj5SdSMJsF.6eJaC8kfwd6xcBFYcmWDR4EDFqW2X6NGa','user','user','ROLE_USER',2);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pari`
--

DROP TABLE IF EXISTS `pari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pari` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gain` double DEFAULT NULL,
  `somme` int(11) NOT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `rencontre_id` bigint(20) DEFAULT NULL,
  `vainqueur_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK48klytkpf3khksfnvtnhi48g3` (`client_id`),
  KEY `FKrfpubbs56ke715xd3bn6kx7d5` (`rencontre_id`),
  KEY `FKt0vtl7jhnf570xlaimkyfon0n` (`vainqueur_id`),
  CONSTRAINT `FK48klytkpf3khksfnvtnhi48g3` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `FKrfpubbs56ke715xd3bn6kx7d5` FOREIGN KEY (`rencontre_id`) REFERENCES `rencontre` (`id`),
  CONSTRAINT `FKt0vtl7jhnf570xlaimkyfon0n` FOREIGN KEY (`vainqueur_id`) REFERENCES `equipe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pari`
--

LOCK TABLES `pari` WRITE;
/*!40000 ALTER TABLE `pari` DISABLE KEYS */;
INSERT INTO `pari` VALUES (1,70,50,2,2,1),(2,12,5,2,3,4),(3,12.4,4,2,5,4),(4,33.6,16,2,7,9),(6,16.5,11,2,8,7),(7,16.8,7,2,9,1);
/*!40000 ALTER TABLE `pari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rencontre`
--

DROP TABLE IF EXISTS `rencontre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rencontre` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cote1` double NOT NULL,
  `cote2` double NOT NULL,
  `cotenull` double NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `resultat1` int(11) NOT NULL,
  `resultat2` int(11) NOT NULL,
  `terminee` bit(1) NOT NULL,
  `equipe1_id` bigint(20) NOT NULL,
  `equipe2_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe6pcdk5pj522bbot30ckttmvp` (`equipe1_id`),
  KEY `FKn1ldmlgrho9i1ieh51a6vk3hg` (`equipe2_id`),
  CONSTRAINT `FKe6pcdk5pj522bbot30ckttmvp` FOREIGN KEY (`equipe1_id`) REFERENCES `equipe` (`id`),
  CONSTRAINT `FKn1ldmlgrho9i1ieh51a6vk3hg` FOREIGN KEY (`equipe2_id`) REFERENCES `equipe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rencontre`
--

LOCK TABLES `rencontre` WRITE;
/*!40000 ALTER TABLE `rencontre` DISABLE KEYS */;
INSERT INTO `rencontre` VALUES (1,3.8,1.8,4,'2018-07-11 14:15:00','2018-07-11 14:20:00',0,0,'\0',2,1),(2,1.4,4.1,3.2,'2018-07-12 13:15:00','2018-07-12 13:30:00',0,0,'\0',1,3),(3,2.4,2,10,'2018-07-13 20:45:00','2018-07-13 22:45:00',0,0,'\0',4,5),(5,3.1,1.9,10,'2018-07-12 13:22:00','2018-07-12 13:36:00',0,0,'\0',4,6),(6,2.1,1.8,5,'2018-07-09 10:45:00','2018-07-09 11:45:00',28,25,'',7,8),(7,2.1,3.5,10,'2018-07-12 13:40:00','2018-07-12 13:55:00',0,0,'\0',9,7),(8,1.5,3.2,5,'2018-07-14 12:00:00','2018-07-14 13:00:00',0,0,'\0',7,9),(9,2.4,3.5,5,'2018-07-11 14:35:00','2018-07-11 14:37:00',3,2,'',1,2);
/*!40000 ALTER TABLE `rencontre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sport`
--

DROP TABLE IF EXISTS `sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nomSport` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sport`
--

LOCK TABLES `sport` WRITE;
/*!40000 ALTER TABLE `sport` DISABLE KEYS */;
INSERT INTO `sport` VALUES (1,'Football'),(2,'Rugby'),(3,'Handball');
/*!40000 ALTER TABLE `sport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-11 14:47:32
