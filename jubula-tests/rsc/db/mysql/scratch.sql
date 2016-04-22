-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: unittests
-- ------------------------------------------------------
-- Server version	5.5.47-0+deb8u1

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
-- Table structure for table `artikel`
--

DROP TABLE IF EXISTS `artikel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artikel` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `EAN` varchar(15) DEFAULT NULL,
  `SubID` varchar(20) DEFAULT NULL,
  `LieferantID` varchar(25) DEFAULT NULL,
  `Klasse` varchar(80) DEFAULT NULL,
  `Name` varchar(127) DEFAULT NULL,
  `Name_intern` varchar(127) DEFAULT NULL,
  `Maxbestand` char(4) DEFAULT NULL,
  `Minbestand` char(4) DEFAULT NULL,
  `Istbestand` char(4) DEFAULT NULL,
  `EK_Preis` char(8) DEFAULT NULL,
  `VK_Preis` char(8) DEFAULT NULL,
  `Typ` varchar(15) DEFAULT NULL,
  `Codeclass` varchar(10) DEFAULT NULL,
  `ExtID` varchar(25) DEFAULT NULL,
  `LastImport` char(8) DEFAULT NULL,
  `ValidFrom` char(8) DEFAULT NULL,
  `ValidTo` char(8) DEFAULT NULL,
  `ATC_code` varchar(255) DEFAULT NULL,
  `ExtInfo` longblob,
  PRIMARY KEY (`ID`),
  KEY `i5` (`Name`),
  KEY `art1` (`SubID`),
  KEY `art2` (`Typ`),
  KEY `art3` (`Codeclass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artikel`
--

LOCK TABLES `artikel` WRITE;
/*!40000 ALTER TABLE `artikel` DISABLE KEYS */;
/*!40000 ALTER TABLE `artikel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artikel_details`
--

DROP TABLE IF EXISTS `artikel_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artikel_details` (
  `ARTICLE_ID` varchar(25) DEFAULT NULL,
  `notes` longtext,
  `image` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artikel_details`
--

LOCK TABLES `artikel_details` WRITE;
/*!40000 ALTER TABLE `artikel_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `artikel_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auf`
--

DROP TABLE IF EXISTS `auf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auf` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `PatientID` varchar(25) DEFAULT NULL,
  `FallID` varchar(25) DEFAULT NULL,
  `BriefID` varchar(25) DEFAULT NULL,
  `Prozent` char(3) DEFAULT NULL,
  `DatumAUZ` char(8) DEFAULT NULL,
  `DatumVon` char(8) DEFAULT NULL,
  `DatumBis` char(8) DEFAULT NULL,
  `Grund` varchar(50) DEFAULT NULL,
  `AUFZusatz` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AUF1` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auf`
--

LOCK TABLES `auf` WRITE;
/*!40000 ALTER TABLE `auf` DISABLE KEYS */;
/*!40000 ALTER TABLE `auf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bbs`
--

DROP TABLE IF EXISTS `bbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbs` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `reference` varchar(25) DEFAULT NULL,
  `topic` varchar(80) DEFAULT NULL,
  `date` char(8) DEFAULT NULL,
  `time` char(4) DEFAULT NULL,
  `authorID` varchar(25) DEFAULT NULL,
  `message` longtext,
  PRIMARY KEY (`ID`),
  KEY `bbs1` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbs`
--

LOCK TABLES `bbs` WRITE;
/*!40000 ALTER TABLE `bbs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bbs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `behandlungen`
--

DROP TABLE IF EXISTS `behandlungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `behandlungen` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `FallID` varchar(25) DEFAULT NULL,
  `MandantID` varchar(25) DEFAULT NULL,
  `RechnungsID` varchar(25) DEFAULT NULL,
  `Datum` char(8) DEFAULT NULL,
  `Diagnosen` varchar(25) DEFAULT NULL,
  `Leistungen` varchar(25) DEFAULT NULL,
  `Eintrag` longblob,
  PRIMARY KEY (`ID`),
  KEY `i4` (`FallID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `behandlungen`
--

LOCK TABLES `behandlungen` WRITE;
/*!40000 ALTER TABLE `behandlungen` DISABLE KEYS */;
/*!40000 ALTER TABLE `behandlungen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `behdl_dg_joint`
--

DROP TABLE IF EXISTS `behdl_dg_joint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `behdl_dg_joint` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `BehandlungsID` varchar(25) DEFAULT NULL,
  `DiagnoseID` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `bdg1` (`BehandlungsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `behdl_dg_joint`
--

LOCK TABLES `behdl_dg_joint` WRITE;
/*!40000 ALTER TABLE `behdl_dg_joint` DISABLE KEYS */;
/*!40000 ALTER TABLE `behdl_dg_joint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `briefe`
--

DROP TABLE IF EXISTS `briefe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `briefe` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `Betreff` varchar(80) DEFAULT NULL,
  `Datum` char(8) DEFAULT NULL,
  `modifiziert` char(8) DEFAULT NULL,
  `gedruckt` char(8) DEFAULT NULL,
  `geloescht` char(2) DEFAULT NULL,
  `AbsenderID` varchar(25) DEFAULT NULL,
  `DestID` varchar(25) DEFAULT NULL,
  `BehandlungsID` varchar(25) DEFAULT NULL,
  `PatientID` varchar(25) DEFAULT NULL,
  `Typ` varchar(30) DEFAULT NULL,
  `MimeType` varchar(80) DEFAULT NULL,
  `Path` longtext,
  PRIMARY KEY (`ID`),
  KEY `i8` (`BehandlungsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `briefe`
--

LOCK TABLES `briefe` WRITE;
/*!40000 ALTER TABLE `briefe` DISABLE KEYS */;
/*!40000 ALTER TABLE `briefe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `lastupdate` bigint(20) DEFAULT NULL,
  `param` varchar(80) NOT NULL,
  `wert` longtext,
  PRIMARY KEY (`param`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (NULL,'ablauf/Trace_default','none'),(NULL,'created','25.02.2016, 20:56:43'),(NULL,'dbversion','3.1.0'),(NULL,'ElexisVersion','3.1.0'),(NULL,'LocalXIDDomains','www.elexis.ch/xid/kontakt/lab/sendingfacility#2#Sendende Institution#ch.elexis.data.Labor,;www.xid.ch/id/ean#2#EAN#ch.elexis.data.Kontakt,;www.elexis.ch/xid#5#UUID#ch.elexis.data.PersistentObject,;www.xid.ch/id/oid#7#OID#ch.elexis.data.PersistentObject,;www.elexis.ch/xid/kontakt/rolle#2#Rolle#;www.ahv.ch/xid#2#AHV#ch.elexis.data.Person,;www.elexis.ch/xid/kontakt/spez#2#Spezialität#ch.elexis.data.Person,;www.elexis.ch/xid/kontakt/kanton#2#Kanton#ch.elexis.data.Person,;www.elexis.ch/xid/kontakt/anrede#2#Anrede#ch.elexis.data.Person,;');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbimage`
--

DROP TABLE IF EXISTS `dbimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbimage` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `Datum` char(8) DEFAULT NULL,
  `Prefix` varchar(80) DEFAULT NULL,
  `Title` varchar(80) DEFAULT NULL,
  `Bild` longblob,
  PRIMARY KEY (`ID`),
  KEY `DBIMAGE1` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbimage`
--

LOCK TABLES `dbimage` WRITE;
/*!40000 ALTER TABLE `dbimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosen`
--

DROP TABLE IF EXISTS `diagnosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnosen` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `DG_TXT` varchar(255) DEFAULT NULL,
  `DG_CODE` varchar(25) DEFAULT NULL,
  `KLASSE` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dg1` (`KLASSE`,`DG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosen`
--

LOCK TABLES `diagnosen` WRITE;
/*!40000 ALTER TABLE `diagnosen` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnosen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eigenleistungen`
--

DROP TABLE IF EXISTS `eigenleistungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eigenleistungen` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `Code` varchar(20) DEFAULT NULL,
  `Bezeichnung` varchar(80) DEFAULT NULL,
  `EK_PREIS` char(6) DEFAULT NULL,
  `VK_PREIS` char(6) DEFAULT NULL,
  `ZEIT` char(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eigenleistungen`
--

LOCK TABLES `eigenleistungen` WRITE;
/*!40000 ALTER TABLE `eigenleistungen` DISABLE KEYS */;
/*!40000 ALTER TABLE `eigenleistungen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ek_preise`
--

DROP TABLE IF EXISTS `ek_preise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ek_preise` (
  `TYP` varchar(80) DEFAULT NULL,
  `ID` varchar(25) DEFAULT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `DATUM_VON` char(8) DEFAULT NULL,
  `DATUM_BIS` char(8) DEFAULT NULL,
  `MULTIPLIKATOR` char(8) DEFAULT NULL,
  KEY `ekp1` (`TYP`),
  KEY `ekp2` (`DATUM_VON`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ek_preise`
--

LOCK TABLES `ek_preise` WRITE;
/*!40000 ALTER TABLE `ek_preise` DISABLE KEYS */;
/*!40000 ALTER TABLE `ek_preise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiketten`
--

DROP TABLE IF EXISTS `etiketten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etiketten` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `Image` varchar(25) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `importance` varchar(7) DEFAULT NULL,
  `Name` varchar(40) DEFAULT NULL,
  `foreground` char(6) DEFAULT NULL,
  `background` char(6) DEFAULT NULL,
  `classes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ETIKETTE1` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiketten`
--

LOCK TABLES `etiketten` WRITE;
/*!40000 ALTER TABLE `etiketten` DISABLE KEYS */;
/*!40000 ALTER TABLE `etiketten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiketten_objclass_link`
--

DROP TABLE IF EXISTS `etiketten_objclass_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etiketten_objclass_link` (
  `objclass` varchar(80) DEFAULT NULL,
  `sticker` varchar(25) DEFAULT NULL,
  KEY `eol1` (`objclass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiketten_objclass_link`
--

LOCK TABLES `etiketten_objclass_link` WRITE;
/*!40000 ALTER TABLE `etiketten_objclass_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `etiketten_objclass_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiketten_object_link`
--

DROP TABLE IF EXISTS `etiketten_object_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etiketten_object_link` (
  `lastupdate` bigint(20) DEFAULT NULL,
  `obj` varchar(25) DEFAULT NULL,
  `etikette` varchar(25) DEFAULT NULL,
  KEY `ETIKETTE2` (`obj`),
  KEY `ETIKETTE3` (`etikette`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiketten_object_link`
--

LOCK TABLES `etiketten_object_link` WRITE;
/*!40000 ALTER TABLE `etiketten_object_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `etiketten_object_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faelle`
--

DROP TABLE IF EXISTS `faelle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faelle` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `PatientID` varchar(25) DEFAULT NULL,
  `GarantID` varchar(25) DEFAULT NULL,
  `KostentrID` varchar(25) DEFAULT NULL,
  `VersNummer` varchar(25) DEFAULT NULL,
  `FallNummer` varchar(25) DEFAULT NULL,
  `BetriebsNummer` varchar(25) DEFAULT NULL,
  `Diagnosen` varchar(80) DEFAULT NULL,
  `DatumVon` char(8) DEFAULT NULL,
  `DatumBis` char(8) DEFAULT NULL,
  `Bezeichnung` varchar(80) DEFAULT NULL,
  `Grund` varchar(80) DEFAULT NULL,
  `Gesetz` varchar(20) DEFAULT NULL,
  `Status` varchar(80) DEFAULT NULL,
  `ExtInfo` longblob,
  PRIMARY KEY (`ID`),
  KEY `i3` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faelle`
--

LOCK TABLES `faelle` WRITE;
/*!40000 ALTER TABLE `faelle` DISABLE KEYS */;
/*!40000 ALTER TABLE `faelle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heap`
--

DROP TABLE IF EXISTS `heap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heap` (
  `ID` varchar(80) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `inhalt` longblob,
  `datum` char(8) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heap`
--

LOCK TABLES `heap` WRITE;
/*!40000 ALTER TABLE `heap` DISABLE KEYS */;
/*!40000 ALTER TABLE `heap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heap2`
--

DROP TABLE IF EXISTS `heap2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heap2` (
  `ID` varchar(80) NOT NULL,
  `deleted` char(1) DEFAULT '0',
  `datum` char(8) DEFAULT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `Contents` longblob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heap2`
--

LOCK TABLES `heap2` WRITE;
/*!40000 ALTER TABLE `heap2` DISABLE KEYS */;
/*!40000 ALTER TABLE `heap2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kontakt`
--

DROP TABLE IF EXISTS `kontakt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kontakt` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `istOrganisation` char(1) DEFAULT '0',
  `istPerson` char(1) DEFAULT '0',
  `istPatient` char(1) DEFAULT '0',
  `istAnwender` char(1) DEFAULT '0',
  `istMandant` char(1) DEFAULT '0',
  `istLabor` char(1) DEFAULT '0',
  `Land` char(3) DEFAULT NULL,
  `Geburtsdatum` char(8) DEFAULT NULL,
  `Geschlecht` char(1) DEFAULT NULL,
  `TITEL` varchar(255) DEFAULT NULL,
  `TitelSuffix` varchar(255) DEFAULT NULL,
  `Bezeichnung1` varchar(255) DEFAULT NULL,
  `Bezeichnung2` varchar(255) DEFAULT NULL,
  `Bezeichnung3` varchar(255) DEFAULT NULL,
  `Strasse` varchar(255) DEFAULT NULL,
  `Plz` varchar(6) DEFAULT NULL,
  `Ort` varchar(255) DEFAULT NULL,
  `Telefon1` varchar(30) DEFAULT NULL,
  `Telefon2` varchar(30) DEFAULT NULL,
  `Fax` varchar(30) DEFAULT NULL,
  `NatelNr` varchar(30) DEFAULT NULL,
  `EMail` varchar(255) DEFAULT NULL,
  `Website` varchar(255) DEFAULT NULL,
  `Gruppe` varchar(10) DEFAULT NULL,
  `PatientNr` varchar(40) DEFAULT NULL,
  `Anschrift` longtext,
  `Bemerkung` longtext,
  `Diagnosen` longblob,
  `PersAnamnese` longblob,
  `SysAnamnese` longblob,
  `FamAnamnese` longblob,
  `Risiken` longtext,
  `Allergien` longtext,
  `ExtInfo` longblob,
  PRIMARY KEY (`ID`),
  KEY `k0` (`Bezeichnung1`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kontakt`
--

LOCK TABLES `kontakt` WRITE;
/*!40000 ALTER TABLE `kontakt` DISABLE KEYS */;
INSERT INTO `kontakt` VALUES
('e9622d1546689e09302',1456430203564,'0','0','0','0','1','0','0',NULL,NULL,NULL,NULL,NULL,'Administrator',NULL,'Administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('U5df0b483ff852802042',1456430405770,'0','0','1','0','1','1','0',NULL,NULL,'m','Dr. med.',NULL,'Bond','James',NULL,'10, Baker Street','9999','10, Baker Street','0061 555 55 55',NULL,'0061 555 55 56',NULL,'james@bond.invalid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `kontakt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kontakt_adress_joint`
--

DROP TABLE IF EXISTS `kontakt_adress_joint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kontakt_adress_joint` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `myID` varchar(25) DEFAULT NULL,
  `otherID` varchar(25) DEFAULT NULL,
  `Bezug` varchar(80) DEFAULT NULL,
  `myRType` char(4) DEFAULT NULL,
  `otherRType` char(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `aij1` (`myID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kontakt_adress_joint`
--

LOCK TABLES `kontakt_adress_joint` WRITE;
/*!40000 ALTER TABLE `kontakt_adress_joint` DISABLE KEYS */;
/*!40000 ALTER TABLE `kontakt_adress_joint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konto`
--

DROP TABLE IF EXISTS `konto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `konto` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `PatientID` varchar(25) DEFAULT NULL,
  `RechnungsID` varchar(25) DEFAULT NULL,
  `ZahlungsID` varchar(25) DEFAULT NULL,
  `Betrag` char(8) DEFAULT NULL,
  `Datum` char(8) DEFAULT NULL,
  `Bemerkung` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `konto1` (`Datum`),
  KEY `konto2` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konto`
--

LOCK TABLES `konto` WRITE;
/*!40000 ALTER TABLE `konto` DISABLE KEYS */;
/*!40000 ALTER TABLE `konto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labgroup_item_joint`
--

DROP TABLE IF EXISTS `labgroup_item_joint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labgroup_item_joint` (
  `lastupdate` bigint(20) DEFAULT NULL,
  `GroupID` varchar(25) DEFAULT NULL,
  `ItemID` varchar(25) DEFAULT NULL,
  `Comment` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labgroup_item_joint`
--

LOCK TABLES `labgroup_item_joint` WRITE;
/*!40000 ALTER TABLE `labgroup_item_joint` DISABLE KEYS */;
/*!40000 ALTER TABLE `labgroup_item_joint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labgroups`
--

DROP TABLE IF EXISTS `labgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labgroups` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labgroups`
--

LOCK TABLES `labgroups` WRITE;
/*!40000 ALTER TABLE `labgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `labgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboritems`
--

DROP TABLE IF EXISTS `laboritems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laboritems` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `kuerzel` varchar(80) DEFAULT NULL,
  `titel` varchar(80) DEFAULT NULL,
  `laborID` varchar(25) DEFAULT NULL,
  `RefMann` varchar(256) DEFAULT NULL,
  `RefFrauOrTx` varchar(256) DEFAULT NULL,
  `Einheit` varchar(20) DEFAULT NULL,
  `typ` char(1) DEFAULT NULL,
  `Gruppe` varchar(25) DEFAULT NULL,
  `prio` char(3) DEFAULT NULL,
  `billingcode` varchar(128) DEFAULT NULL,
  `export` varchar(100) DEFAULT NULL,
  `loinccode` varchar(128) DEFAULT NULL,
  `visible` varchar(1) DEFAULT NULL,
  `digits` varchar(16) DEFAULT NULL,
  `formula` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `labit1` (`kuerzel`),
  KEY `labit2` (`laborID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboritems`
--

LOCK TABLES `laboritems` WRITE;
/*!40000 ALTER TABLE `laboritems` DISABLE KEYS */;
/*!40000 ALTER TABLE `laboritems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laborwerte`
--

DROP TABLE IF EXISTS `laborwerte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laborwerte` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `PatientID` varchar(25) DEFAULT NULL,
  `datum` char(8) DEFAULT NULL,
  `zeit` char(6) DEFAULT NULL,
  `ItemID` varchar(25) DEFAULT NULL,
  `Resultat` varchar(255) DEFAULT NULL,
  `Flags` varchar(10) DEFAULT NULL,
  `Origin` varchar(30) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `analysetime` varchar(24) DEFAULT NULL,
  `observationtime` varchar(24) DEFAULT NULL,
  `transmissiontime` varchar(24) DEFAULT NULL,
  `refmale` varchar(255) DEFAULT NULL,
  `reffemale` varchar(255) DEFAULT NULL,
  `OriginID` varchar(25) DEFAULT NULL,
  `Kommentar` longtext,
  `ExtInfo` longblob,
  PRIMARY KEY (`ID`),
  KEY `labor1` (`PatientID`),
  KEY `labor2` (`datum`),
  KEY `labor3` (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laborwerte`
--

LOCK TABLES `laborwerte` WRITE;
/*!40000 ALTER TABLE `laborwerte` DISABLE KEYS */;
/*!40000 ALTER TABLE `laborwerte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leistungen`
--

DROP TABLE IF EXISTS `leistungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leistungen` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `BEHANDLUNG` varchar(25) DEFAULT NULL,
  `LEISTG_TXT` varchar(255) DEFAULT NULL,
  `LEISTG_CODE` varchar(25) DEFAULT NULL,
  `KLASSE` varchar(80) DEFAULT NULL,
  `ZAHL` char(3) DEFAULT NULL,
  `EK_KOSTEN` char(8) DEFAULT NULL,
  `VK_TP` char(8) DEFAULT NULL,
  `VK_SCALE` char(8) DEFAULT NULL,
  `VK_PREIS` char(8) DEFAULT NULL,
  `SCALE` char(4) DEFAULT '100',
  `SCALE2` char(4) DEFAULT '100',
  `userID` varchar(25) DEFAULT NULL,
  `DETAIL` longblob,
  PRIMARY KEY (`ID`),
  KEY `lst1` (`BEHANDLUNG`),
  KEY `lst2` (`KLASSE`,`LEISTG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leistungen`
--

LOCK TABLES `leistungen` WRITE;
/*!40000 ALTER TABLE `leistungen` DISABLE KEYS */;
/*!40000 ALTER TABLE `leistungen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leistungsblock`
--

DROP TABLE IF EXISTS `leistungsblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leistungsblock` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `MandantID` varchar(25) DEFAULT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Macro` varchar(30) DEFAULT NULL,
  `Leistungen` longblob,
  PRIMARY KEY (`ID`),
  KEY `block1` (`Name`),
  KEY `block2` (`MandantID`),
  KEY `block3` (`Macro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leistungsblock`
--

LOCK TABLES `leistungsblock` WRITE;
/*!40000 ALTER TABLE `leistungsblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `leistungsblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `OID` varchar(255) DEFAULT NULL,
  `datum` char(8) DEFAULT NULL,
  `typ` varchar(20) DEFAULT NULL,
  `userID` varchar(25) DEFAULT NULL,
  `station` varchar(255) DEFAULT NULL,
  `ExtInfo` longblob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `output_log`
--

DROP TABLE IF EXISTS `output_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `output_log` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `ObjectID` varchar(25) DEFAULT NULL,
  `ObjectType` varchar(80) DEFAULT NULL,
  `Datum` char(8) DEFAULT NULL,
  `Outputter` varchar(80) DEFAULT NULL,
  `ExtInfo` longblob,
  PRIMARY KEY (`ID`),
  KEY `bal_i1` (`ObjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `output_log`
--

LOCK TABLES `output_log` WRITE;
/*!40000 ALTER TABLE `output_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `output_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_artikel_joint`
--

DROP TABLE IF EXISTS `patient_artikel_joint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_artikel_joint` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `PatientID` varchar(25) DEFAULT NULL,
  `ArtikelID` varchar(25) DEFAULT NULL,
  `Artikel` varchar(255) DEFAULT NULL,
  `RezeptID` varchar(25) DEFAULT NULL,
  `DateFrom` char(8) DEFAULT NULL,
  `DateUntil` char(8) DEFAULT NULL,
  `Dosis` varchar(255) DEFAULT NULL,
  `Anzahl` char(3) DEFAULT NULL,
  `Bemerkung` varchar(255) DEFAULT NULL,
  `prescType` char(2) DEFAULT NULL,
  `sortOrder` char(3) DEFAULT NULL,
  `prescDate` char(8) DEFAULT NULL,
  `prescriptor` varchar(25) DEFAULT NULL,
  `ExtInfo` longblob,
  PRIMARY KEY (`ID`),
  KEY `paj1` (`PatientID`),
  KEY `PAJ2` (`RezeptID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_artikel_joint`
--

LOCK TABLES `patient_artikel_joint` WRITE;
/*!40000 ALTER TABLE `patient_artikel_joint` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_artikel_joint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rechnungen`
--

DROP TABLE IF EXISTS `rechnungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rechnungen` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `RnNummer` varchar(8) DEFAULT NULL,
  `FallID` varchar(25) DEFAULT NULL,
  `MandantID` varchar(25) DEFAULT NULL,
  `RnDatum` char(8) DEFAULT NULL,
  `RnStatus` varchar(20) DEFAULT NULL,
  `RnDatumVon` char(8) DEFAULT NULL,
  `RnDatumBis` char(8) DEFAULT NULL,
  `Betrag` char(8) DEFAULT NULL,
  `StatusDatum` char(8) DEFAULT NULL,
  `ExtInfo` longblob,
  PRIMARY KEY (`ID`),
  KEY `Rn1` (`FallID`),
  KEY `Rn2` (`MandantID`),
  KEY `Rn3` (`RnStatus`),
  KEY `Rn4` (`RnDatumVon`),
  KEY `Rn5` (`RnDatumBis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rechnungen`
--

LOCK TABLES `rechnungen` WRITE;
/*!40000 ALTER TABLE `rechnungen` DISABLE KEYS */;
/*!40000 ALTER TABLE `rechnungen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `IdentID` varchar(25) DEFAULT NULL,
  `OriginID` varchar(25) DEFAULT NULL,
  `Responsible` varchar(25) DEFAULT NULL,
  `DateDue` char(8) DEFAULT NULL,
  `Status` varchar(1) DEFAULT NULL,
  `Typ` varchar(1) DEFAULT NULL,
  `Params` longtext,
  `Message` longtext,
  PRIMARY KEY (`ID`),
  KEY `rem1` (`IdentID`),
  KEY `rem2` (`DateDue`),
  KEY `rem3` (`Responsible`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders`
--

LOCK TABLES `reminders` WRITE;
/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders_responsible_link`
--

DROP TABLE IF EXISTS `reminders_responsible_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders_responsible_link` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `ReminderID` varchar(25) DEFAULT NULL,
  `ResponsibleID` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `rrl1` (`ReminderID`),
  KEY `rrl2` (`ResponsibleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders_responsible_link`
--

LOCK TABLES `reminders_responsible_link` WRITE;
/*!40000 ALTER TABLE `reminders_responsible_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders_responsible_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezepte`
--

DROP TABLE IF EXISTS `rezepte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rezepte` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `PatientID` varchar(25) DEFAULT NULL,
  `MandantID` varchar(25) DEFAULT NULL,
  `BriefID` varchar(25) DEFAULT NULL,
  `datum` char(8) DEFAULT NULL,
  `RpTxt` longtext,
  `RpZusatz` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `rp1` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezepte`
--

LOCK TABLES `rezepte` WRITE;
/*!40000 ALTER TABLE `rezepte` DISABLE KEYS */;
/*!40000 ALTER TABLE `rezepte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `right_`
--

DROP TABLE IF EXISTS `right_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `right_` (
  `ID` varchar(25) NOT NULL,
  `LASTUPDATE` bigint(20) DEFAULT NULL,
  `DELETED` char(1) DEFAULT '0',
  `LOG_EXECUTION` char(1) DEFAULT NULL,
  `NAME` varchar(256) DEFAULT NULL,
  `PARENTID` varchar(25) DEFAULT NULL,
  `I18N_NAME` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `right_`
--

LOCK TABLES `right_` WRITE;
/*!40000 ALTER TABLE `right_` DISABLE KEYS */;
INSERT INTO `right_` VALUES ('103a6569184c75dc',1456430209187,'0',NULL,'Verrechnen','b373c30e3705866','verrechnen'),('11629a6a36aa66c2',1456430209321,'0',NULL,'Anwender','1760d3cd767660','Anwender'),('11d2973c44cdd88c3',1456430209479,'0',NULL,'Mandant','1760d3cd767660','Mandant'),('13d8771beb1b',1456430205384,'0',NULL,'Fall','root','main::Fall'),('15101375d93a134a',1456430206830,'0',NULL,'Systemvorlagen ändern','ca488f5331595492','Systemvorlagen ändern'),('1567e02bbaf5e8c5',1456430206144,'0',NULL,'Laborwerte','dc5c457d83e95ed7','Laborwerte'),('1627eaa2f9d37bba',1456430208811,'0',NULL,'Anmelden','a8696d8a30864f87','Anmelden'),('166c5fbe9a622f',1456430204131,'0',NULL,'Admin','root','Administration'),('1760d3cd767660',1456430207231,'0',NULL,'Daten','root','Daten'),('185e66bcd74ca01a',1456430206496,'0',NULL,'createCategory','ca488f5331595492','Kategorie erstellen'),('199c713ed089b6a',1456430208643,'0',NULL,'Hilfe','a8696d8a30864f87','Hilfe'),('19e98dde2b1a45f',1456430207465,'0',NULL,'Konsultation','root','main::Konsultation'),('1a463ca163308abe',1456430205517,'0',NULL,'Define_specials','9797c8ed2540cd06','Definieren von Spezialfeldern im Abrechnungssystem'),('1c18d2a479a16ccc',1456430207808,'0',NULL,'Laborparamter vereinen','166c5fbe9a622f','Laborparameter vereinen'),('296862557663050',1456430204365,'0',NULL,'createBills','c19734cdf2ca2b8','Rnn_ erstellen'),('371a57e8a0eb3',1456430208476,'0',NULL,'Über','a8696d8a30864f87','über'),('44ef3f0a713e16',1456430203897,'0',NULL,'read','c19734cdf2ca2b8','lesen'),('4b504fdd0f26593b',1456430206997,'0',NULL,'Vorlagen ändern','ca488f5331595492','Vorlagen ändern'),('52fa258a537e15ab',1456430209780,'0',NULL,'change_billed','7e4592d8c3c785f','Verrechnete ändern'),('5c2f42e3bfab5a55',1456430206663,'0',NULL,'delete','ca488f5331595492','Löschen'),('5e8504baa3ccbb00',1456430207298,'0',NULL,'Kontakt','1760d3cd767660','Kontakt'),('5e856339cbdd1b04',1456430206370,'0',NULL,'create','ca488f5331595492','erstellen'),('5f0b9757dcf1ee5',1456430207975,'0',NULL,'Patient','1760d3cd767660','main::Patient'),('710051961b7bc441',1456430208309,'0',NULL,'Beenden','a8696d8a30864f87','beenden'),('79d3a17fc74f5',1456430205701,'0',NULL,'copy','13d8771beb1b','kopieren'),('7e4592d8c3c785f',1456430209713,'0',NULL,'Konsultation','166c5fbe9a622f','main::Konsultation'),('9797c8ed2540cd06',1456430205450,'0',NULL,'Specials','13d8771beb1b','Fall-Spezialfelder in der Fall-View'),('99a9748ac3d87e0',1456430209061,'0',NULL,'AlleVerrechnen','b373c30e3705866','Für alle Mandanten verrechnen'),('9d3df572d800dd93',1456430208936,'0',NULL,'LoadInfoStore','root','LoadInfoStore'),('9e43a6d32fe6061',1456430204891,'0',NULL,'Rechnungen','root','Rechnungen'),('a8696d8a30864f87',1456430204532,'0',NULL,'Aktionen','root','Aktionen'),('b373c30e3705866',1456430207633,'0',NULL,'Leistungen','root','Leistungen'),('b57e2605144d75df',1456430204197,'0',NULL,'Reminders','166c5fbe9a622f','Reminders'),('c19734cdf2ca2b8',1456430203830,'0',NULL,'AccountingGlobal','root','Globales Verrechnen'),('c91c6da890975fa3',1456430209964,'0',NULL,'Zugriff','166c5fbe9a622f','Zugriff'),('ca488f5331595492',1456430206320,'0',NULL,'Dokumente','root','Dokumente'),('dc5c457d83e95ed7',1456430205944,'0',NULL,'Löschen','root','Löschen'),('df86da724914fac',1456430205994,'0',NULL,'Dauermedikation','dc5c457d83e95ed7','Dauermedikation'),('fd1b0cc8a25af715',1456430208142,'0',NULL,'Script','root','Script'),('root',NULL,'0',NULL,'root','',NULL);
/*!40000 ALTER TABLE `right_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `rights_per_role`
--

DROP TABLE IF EXISTS `rights_per_role`;
/*!50001 DROP VIEW IF EXISTS `rights_per_role`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `rights_per_role` (
  `ROLE_ID` tinyint NOT NULL,
  `RIGHT_ID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `rights_per_user`
--

DROP TABLE IF EXISTS `rights_per_user`;
/*!50001 DROP VIEW IF EXISTS `rights_per_user`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `rights_per_user` (
  `USER_ID` tinyint NOT NULL,
  `RIGHT_ID` tinyint NOT NULL,
  `RIGHT_NAME` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `ID` varchar(25) NOT NULL,
  `LASTUPDATE` bigint(20) DEFAULT NULL,
  `DELETED` char(1) DEFAULT '0',
  `EXTINFO` longblob,
  `ISSYSTEMROLE` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('assistant',NULL,'0',NULL,'1'),('doctor',NULL,'0',NULL,'1'),('executive_doctor',NULL,'0',NULL,'1'),('patient',NULL,'0',NULL,'1'),('user',NULL,'0',NULL,'1'),('user_external',NULL,'0',NULL,'1');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_right_joint`
--

DROP TABLE IF EXISTS `role_right_joint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_right_joint` (
  `ID` varchar(25) NOT NULL,
  `LASTUPDATE` bigint(20) DEFAULT NULL,
  `DELETED` char(1) DEFAULT NULL,
  `ROLE_ID` varchar(25) NOT NULL,
  PRIMARY KEY (`ID`,`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_right_joint`
--

LOCK TABLES `role_right_joint` WRITE;
/*!40000 ALTER TABLE `role_right_joint` DISABLE KEYS */;
INSERT INTO `role_right_joint` VALUES ('103a6569184c75dc',NULL,'0','assistant'),('11629a6a36aa66c2',NULL,'0','doctor'),('11d2973c44cdd88c3',NULL,'0','doctor'),('15101375d93a134a',NULL,'0','user'),('1567e02bbaf5e8c5',NULL,'0','user'),('1627eaa2f9d37bba',NULL,'0','user'),('185e66bcd74ca01a',NULL,'0','user'),('199c713ed089b6a',NULL,'0','user'),('19e98dde2b1a45f',NULL,'0','user'),('1a463ca163308abe',NULL,'0','user'),('1c18d2a479a16ccc',NULL,'0','user'),('296862557663050',NULL,'0','user'),('371a57e8a0eb3',NULL,'0','user'),('44ef3f0a713e16',NULL,'0','user'),('4b504fdd0f26593b',NULL,'0','user'),('52fa258a537e15ab',NULL,'0','doctor'),('5c2f42e3bfab5a55',NULL,'0','user'),('5e8504baa3ccbb00',NULL,'0','user'),('5e856339cbdd1b04',NULL,'0','user'),('5f0b9757dcf1ee5',NULL,'0','user'),('710051961b7bc441',NULL,'0','user'),('79d3a17fc74f5',NULL,'0','user'),('99a9748ac3d87e0',NULL,'0','assistant'),('9d3df572d800dd93',NULL,'0','user'),('9e43a6d32fe6061',NULL,'0','user'),('a8696d8a30864f87',NULL,'0','user'),('b373c30e3705866',NULL,'0','user'),('b57e2605144d75df',NULL,'0','user'),('c91c6da890975fa3',NULL,'0','executive_doctor'),('df86da724914fac',NULL,'0','user'),('fd1b0cc8a25af715',NULL,'0','user');
/*!40000 ALTER TABLE `role_right_joint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traces`
--

DROP TABLE IF EXISTS `traces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traces` (
  `logtime` bigint(20) DEFAULT NULL,
  `Workstation` varchar(40) DEFAULT NULL,
  `Username` varchar(30) DEFAULT NULL,
  `action` longtext,
  KEY `trace1` (`logtime`),
  KEY `trace2` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traces`
--

LOCK TABLES `traces` WRITE;
/*!40000 ALTER TABLE `traces` DISABLE KEYS */;
/*!40000 ALTER TABLE `traces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_`
--

DROP TABLE IF EXISTS `user_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_` (
  `ID` varchar(25) NOT NULL,
  `DELETED` char(1) DEFAULT '0',
  `KONTAKT_ID` varchar(25) DEFAULT NULL,
  `LASTUPDATE` bigint(20) DEFAULT NULL,
  `HASHED_PASSWORD` varchar(64) DEFAULT NULL,
  `SALT` varchar(64) DEFAULT NULL,
  `IS_ACTIVE` char(1) DEFAULT '1',
  `IS_ADMINISTRATOR` char(1) DEFAULT '0',
  `KEYSTORE` longtext,
  `EXTINFO` longblob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_`
--

LOCK TABLES `user_` WRITE;
/*!40000 ALTER TABLE `user_` DISABLE KEYS */;
INSERT INTO `user_` VALUES ('007','0','U5df0b483ff852802042',1456430405695,'bacc5c7873ebb2881a5088a8e519b79791264f9c','3ecae43d407f412f','1','0',NULL,NULL),('Administrator','0','e9622d1546689e09302',1456430203596,'b94a0b6fc7be97e0a1585ac85e814d3852668968','1254bb9a05856b9e','1','1',NULL,NULL);
/*!40000 ALTER TABLE `user_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role_joint`
--

DROP TABLE IF EXISTS `user_role_joint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role_joint` (
  `ID` varchar(25) NOT NULL,
  `LASTUPDATE` bigint(20) DEFAULT NULL,
  `DELETED` char(1) DEFAULT NULL,
  `USER_ID` varchar(25) NOT NULL,
  PRIMARY KEY (`ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_joint`
--

LOCK TABLES `user_role_joint` WRITE;
/*!40000 ALTER TABLE `user_role_joint` DISABLE KEYS */;
INSERT INTO `user_role_joint` VALUES ('executive_doctor',NULL,'0','007'),('user',NULL,'0','007');
/*!40000 ALTER TABLE `user_role_joint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userconfig`
--

DROP TABLE IF EXISTS `userconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userconfig` (
  `lastupdate` bigint(20) DEFAULT NULL,
  `UserID` varchar(25) DEFAULT NULL,
  `Param` varchar(80) DEFAULT NULL,
  `Value` longtext,
  KEY `UCFG` (`Param`),
  KEY `UCFG2` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userconfig`
--

LOCK TABLES `userconfig` WRITE;
/*!40000 ALTER TABLE `userconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `userconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vk_preise`
--

DROP TABLE IF EXISTS `vk_preise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vk_preise` (
  `TYP` varchar(80) DEFAULT NULL,
  `ID` varchar(25) DEFAULT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `DATUM_VON` char(8) DEFAULT NULL,
  `DATUM_BIS` char(8) DEFAULT NULL,
  `MULTIPLIKATOR` char(8) DEFAULT NULL,
  KEY `vkp1` (`TYP`),
  KEY `vkp2` (`DATUM_VON`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vk_preise`
--

LOCK TABLES `vk_preise` WRITE;
/*!40000 ALTER TABLE `vk_preise` DISABLE KEYS */;
/*!40000 ALTER TABLE `vk_preise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xid`
--

DROP TABLE IF EXISTS `xid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xid` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `type` varchar(80) DEFAULT NULL,
  `object` varchar(25) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `domain_id` varchar(255) DEFAULT NULL,
  `quality` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `XIDIDX1` (`domain`),
  KEY `XIDIDX2` (`domain_id`),
  KEY `XIDIDX3` (`object`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xid`
--

LOCK TABLES `xid` WRITE;
/*!40000 ALTER TABLE `xid` DISABLE KEYS */;
/*!40000 ALTER TABLE `xid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zahlungen`
--

DROP TABLE IF EXISTS `zahlungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zahlungen` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `RechnungsID` varchar(25) DEFAULT NULL,
  `Betrag` char(8) DEFAULT NULL,
  `Datum` char(8) DEFAULT NULL,
  `Bemerkung` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `zahl1` (`RechnungsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zahlungen`
--

LOCK TABLES `zahlungen` WRITE;
/*!40000 ALTER TABLE `zahlungen` DISABLE KEYS */;
/*!40000 ALTER TABLE `zahlungen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `rights_per_role`
--

/*!50001 DROP TABLE IF EXISTS `rights_per_role`*/;
/*!50001 DROP VIEW IF EXISTS `rights_per_role`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`elexis`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `rights_per_role` AS select `r`.`ID` AS `ROLE_ID`,`ri`.`ID` AS `RIGHT_ID` from ((`role` `r` left join `role_right_joint` `rrj` on((`r`.`ID` = `rrj`.`ROLE_ID`))) left join `right_` `ri` on((`rrj`.`ID` = `ri`.`ID`))) order by `r`.`ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rights_per_user`
--

/*!50001 DROP TABLE IF EXISTS `rights_per_user`*/;
/*!50001 DROP VIEW IF EXISTS `rights_per_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`elexis`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `rights_per_user` AS select `u`.`ID` AS `USER_ID`,`ri`.`ID` AS `RIGHT_ID`,`ri`.`NAME` AS `RIGHT_NAME` from ((((`user_` `u` left join `user_role_joint` `urj` on((`u`.`ID` = `urj`.`USER_ID`))) left join `role` `r` on((`urj`.`ID` = `r`.`ID`))) left join `role_right_joint` `rrj` on((`r`.`ID` = `rrj`.`ROLE_ID`))) left join `right_` `ri` on((`rrj`.`ID` = `ri`.`ID`))) order by `u`.`ID` */;
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

-- Dump completed on 2016-02-25 21:01:57
