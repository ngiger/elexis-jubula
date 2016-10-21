-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: ng-tr    Database: elexistest
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
-- Table structure for table `at_medevit_elexis_loinc`
--

DROP TABLE IF EXISTS `at_medevit_elexis_loinc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_medevit_elexis_loinc` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `code` varchar(128) DEFAULT NULL,
  `longname` longtext,
  `shortname` varchar(255) DEFAULT NULL,
  `class` varchar(128) DEFAULT NULL,
  `unit` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `loinc1` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `at_medevit_elexis_loinc`
--

LOCK TABLES `at_medevit_elexis_loinc` WRITE;
/*!40000 ALTER TABLE `at_medevit_elexis_loinc` DISABLE KEYS */;
INSERT INTO `at_medevit_elexis_loinc` VALUES
('A68d140a4cff4975504127',1461313732880,'0','30003-8','Microalbumin [Mass/volume] in 24 hour Urine','Microalbumin 24h Ur-mCnc','CHEM',NULL),
('a6b5a5ab10f24504b02010',1461313402767,'0','6153-1','Kentucky blue grass IgE Ab [Units/volume] in Serum','Kent blue grass IgE Qn','ALLERGY',NULL),
('a6b9642b6d426d88a02110',1461313418111,'0','12230-9','Macrophages/100 leukocytes in Body fluid by Manual count','Macrophages NFr Fld Manual','HEM/BC',NULL),
('A6b9c91efcd8cefb502627',1461313498851,'0','25459-9','Lead [Moles/volume] in Serum or Plasma','Lead SerPl-sCnc','DRUG/TOX',NULL),
('A6d44868ca83c73a401877',1461313382265,'0','5388-4','Toxoplasma gondii IgG Ab [Units/volume] in Serum by Immunoassay','T gondii IgG Ser EIA-aCnc','MICRO',NULL),
('a6e30078dfbf6d5e502410',1461313465288,'0','22663-9','Estrone (E1) [Moles/volume] in Serum or Plasma','Estrone SerPl-sCnc','CHEM',NULL),
('a705194f0a24edcb702460',1461313472760,'0','8091-1','Ribonucleoprotein extractable nuclear Ab [Presence] in Serum','ENA RNP Ab Ser Ql','SERO',NULL),
('a70baffc4d91e06d40510',1461313170367,'0','737-7','Lymphocytes/100 leukocytes in Blood by Manual count','Lymphocytes NFr Bld Manual','HEM/BC',NULL),
('A70cd53de927ad05f0377',1461313149472,'0','1959-6','Bicarbonate [Moles/volume] in Blood','HCO3 Bld-sCnc','CHEM',NULL),
('A72428b577872149201377',1461313305882,'0','2118-8','Choriogonadotropin (pregnancy test) [Presence] in Serum or Plasma','HCG Preg SerPl Ql','CHEM',NULL),
('A741b99f1cdf3ef0b01027',1461313250557,'0','14135-8','CD3+CD8+ (T8 suppressor cells) cells [#/volume] in Blood','CD3+CD8+ Cells # Bld','CELLMARK',NULL),
('a7610d30149fa64fa01310',1461313295410,'0','44357-2','Galactomannan Ag [Units/volume] in Serum or Plasma by Immunoassay','Galactomannan Ag SerPl EIA-aCnc','MICRO',NULL),
('a771387bbf9d76e3a03110',1461313574405,'0','5036-9','Streptococcus pyogenes rRNA [Presence] in Unspecified specimen by DNA probe','S pyo rRNA XXX Ql Prb','MICRO',NULL),
('A7a00270f58e6d92b02227',1461313436622,'0','9586-9','Borrelia burgdorferi Ab [interpretation] in Serum','B burgdor Ab Ser-Imp','MICRO',NULL),
('A7d12ef6aa989fdfb02577',1461313491012,'0','5809-9','Reducing substances [Presence] in Urine','Reducing Subs Ur Ql','UA',NULL),
('a7d6172bc2c7fce6001360',1461313303224,'0','5157-3','Epstein Barr virus capsid IgG Ab [Units/volume] in Serum by Immunoassay','EBV VCA IgG Ser EIA-aCnc','MICRO',NULL),
('a864409aff5677d3702860',1461313535480,'0','38415-6','MTHFR gene mutation analysis in Blood or Tissue by Molecular genetics method Narrative','MTHFR gene Mut Anal Bld/T','MOLPATH.MUT',NULL),
('a88f0c60c49ff53b50560',1461313178171,'0','49136-5','Creatine kinase.MB/Creatine kinase.total [Ratio] in Serum or Plasma','CK MB SerPl-Rto','CHEM',NULL),
('A893b3bde8da698a701527',1461313328558,'0','10459-6','Alpha-1-Fetoprotein Ag [Presence] in Tissue by Immune stain','AFP Ag Tiss Ql ImStn','PATH',NULL),
('A895dd52b8027d97702927',1461313545675,'0','40905-2','Streptococcus pneumoniae 26 IgG Ab [Mass/volume] in Serum by Immunoassay','S pneum26 IgG Ser EIA-mCnc','MICRO',NULL),
('A89ef52c199fe936601477',1461313320560,'0','2705-2','Oxygen [Partial pressure] in Venous blood','pO2 BldV','CHEM',NULL),
('a8a43cf7c6dd3487601610',1461313340886,'0','32764-3','Clue cells [Presence] in Unspecified specimen by Wet preparation','Clue Cells XXX Ql Wet Prep','MICRO',NULL),
('a8a78bcf0470c5fb302810',1461313527624,'0','15212-4','Lipase [Enzymatic activity/volume] in Body fluid','Lipase Fld-cCnc','CHEM',NULL),
('A8b5b153e30e9b16501827',1461313374667,'0','51724-3','Cefuroxime [Susceptibility]','Cefuroxime Susc Islt','ABXBACT',NULL),
('a8ecc0ba3e34103ae0960',1461313240101,'0','14946-8','Valproate [Moles/volume] in Serum or Plasma','Valproate SerPl-sCnc','DRUG/TOX',NULL),
('A8f2cb250fe772e9b03327',1461313608239,'0','32546-4','Glucose-6-Phosphate dehydrogenase [Enzymatic activity/mass] in Red Blood Cells','G6PD RBC-cCnt','CHEM',NULL),
('a8f4d3df048fda6b502510',1461313480574,'0','2615-3','Methemoglobin/Hemoglobin.total in Arterial blood','MetHgb MFr BldA','CHEM',NULL),
('a9042c3fdbe722ee401710',1461313356815,'0','14627-4','Bicarbonate [Moles/volume] in Venous blood','HCO3 BldV-sCnc','CHEM',NULL),
('A908a95046ab5f1cc03427',1461313624068,'0','30437-8','Monocytes+Macrophages/100 leukocytes in Body fluid','Monos+Macros NFr Fld','HEM/BC',NULL),
('A94d47f665ad9578902177',1461313428733,'0','6476-6','Mumps virus IgG Ab [Presence] in Serum by Immunoassay','MuV IgG Ser Ql EIA','MICRO',NULL),
('a965a43d48c73af9d0860',1461313224575,'0','55593-8','Creatinine [Moles/volume] in unspecified time Urine','Creat ?Tm Ur-sCnc','CHEM',NULL),
('a970da3bd09d184e20810',1461313217163,'0','547-0','Streptococcus.beta-hemolytic [Presence] in Unspecified specimen by Organism specific culture','B-Hem Strep XXX Ql Cult','MICRO',NULL),
('a9735212a89a991ef0910',1461313232396,'0','8124-0','CD3 cells/100 cells in Blood','CD3 Cells NFr Bld','CELLMARK',NULL),
('A976888c8aa842f6f03877',1461313693694,'0','1777-2','Alkaline phosphatase.bone [Enzymatic activity/volume] in Serum or Plasma','ALP Bone SerPl-cCnc','CHEM',NULL),
('A982a5d12e7b5855f04177',1461313740861,'0','53835-5','\"1','5-Anhydroglucitol [Mass/volume] in Serum or Plasma\"','\"1',NULL),
('A99090f32110844280627',1461313188518,'0','774-0','Ovalocytes [Presence] in Blood by Light microscopy','Ovalocytes Bld Ql Smear','HEM/BC',NULL),
('A9a133427e5483ecb02977',1461313553732,'0','21619-2','APOE gene mutations found [Identifier] in Blood or Tissue by Molecular genetics method Nominal','APOE gene Mut Anal Bld/T','MOLPATH.MUT',NULL),
('a9a2f55f3d10ef70b0410',1461313154812,'0','764-1','Neutrophils.band form/100 leukocytes in Blood by Manual count','Neuts Band NFr Bld Manual','HEM/BC',NULL),
('A9b6f8e53cbe677b103777',1461313678166,'0','11060-1','Reducing substances [Presence] in Stool','Reducing Subs Stl Ql','CHEM',NULL),
('a9d95e7ec3130748a03510',1461313636688,'0','24378-2','Platelet aggregation epinephrine induced [Presence] in Platelet rich plasma','PA Epineph PRP Ql','COAG',NULL),
('a9da77176bcbb5b2f04010',1461313714303,'0','16195-0','Benzodiazepines [Presence] in Urine by Confirmatory method','Benzodiaz Ur Ql Cfm','DRUG/TOX',NULL),
('A9e0c1791d1a2c83701777',1461313367139,'0','3414-0','Buprenorphine [Presence] in Urine','Buprenorphine Ur Ql','DRUG/TOX',NULL),
('Aa151f650d7e3342703027',1461313561529,'0','6266-1','Tomato IgE Ab [Units/volume] in Serum','Tomato IgE Qn','ALLERGY',NULL),
('aa2c0440d32bdd3e802910',1461313543019,'0','6164-8','Virginia Live Oak IgE Ab [Units/volume] in Serum','Virg Live Oak IgE Qn','ALLERGY',NULL),
('aa3700b2ab3f9b7b103160',1461313582259,'0','6151-5','Italian Cypress IgE Ab [Units/volume] in Serum','Italian Cypress IgE Qn','ALLERGY',NULL),
('aa7f7016b830db33f03210',1461313589579,'0','6012-9','von Willebrand factor (vWf) Ag [Units/volume] in Platelet poor plasma by Immunologic method','vWF Ag PPP Imm-aCnc','COAG',NULL),
('aa8bc240307116f9c03560',1461313644144,'0','43399-5','JAK2 gene p.V617F [Presence] in Blood or Tissue by Molecular genetics method','JAK2 p.V617F Bld/T Ql','MOLPATH.MUT',NULL),
('Aa97897629a50f9650277',1461313133475,'0','14879-1','Phosphate [Moles/volume] in Serum or Plasma','Phosphate SerPl-sCnc','CHEM',NULL),
('Aab1f1fb52e22a5590677',1461313196433,'0','3184-9','Activated clotting time in Blood by Coagulation assay','ACT Time Bld','COAG',NULL),
('aaca71f50fba6735a01210',1461313279339,'0','12841-3','Prostate Specific Ag Free/Prostate specific Ag.total in Serum or Plasma','PSA Free MFr SerPl','CHEM',NULL),
('aad71aab183b5a87f02360',1461313457332,'0','43180-9','Herpes simplex virus 2 IgG Ab [Presence] in Serum by Immunoassay','HSV2 IgG Ser Ql EIA','MICRO',NULL),
('aadd43b9e87b9c5a403960',1461313706530,'0','20642-5','Glutamate [Moles/volume] in Serum or Plasma','Glutamate SerPl-sCnc','CHEM',NULL),
('Aaf6ee22999b03a1a01077',1461313258012,'0','19113-0','IgE [Units/volume] in Serum or Plasma','IgE SerPl-aCnc','CHEM',NULL),
('Aafcf31e6015ee54102277',1461313444753,'0','25700-6','Immunofixation [interpretation] for Serum or Plasma','Interpretation SerPl IFE-Imp','CHEM',NULL),
('Ab04ca99aaf15f0c502677',1461313506724,'0','13995-6','Gamma globulin/Protein.total in Urine by Electrophoresis','Gamma glob MFr Ur Elph','CHEM',NULL),
('Abdb0fd03fa7995eb04077',1461313725041,'0','46128-5','Tissue transglutaminase IgA Ab [Units/volume] in Serum by Immunoassay','tTG IgA Ser EIA-aCnc','SERO',NULL),
('abdff7f8a508601bd0160',1461313114863,'0','785-6','Erythrocyte mean corpuscular hemoglobin [Entitic mass] by Automated count','MCH RBC Qn Auto','HEM/BC',NULL),
('abf0cde00b7cbc64e01960',1461313395111,'0','14637-3','Calcium [Moles/time] in 24 hour Urine','Calcium 24h Ur-sRate','CHEM',NULL),
('ac180a49afbad9cc302060',1461313410956,'0','15210-8','Thyroglobulin Ab [Presence] in Serum','Thyroglob Ab Ser Ql','SERO',NULL),
('Ac1d7fd5c1d749f960727',1461313204036,'0','3393-6','Benzoylecgonine [Presence] in Urine','BZE Ur Ql','DRUG/TOX',NULL),
('Ac2345bc6b0a3a8f201427',1461313313004,'0','34660-1','Hemoglobin A2/Hemoglobin.total in Blood by Chromatography column','Hgb A2 MFr Bld Column Chrom','HEM/BC',NULL),
('Ac2471df4beaf33b202327',1461313452801,'0','6800-7','Spermatozoa Motile/100 spermatozoa in Semen','Sperm Motile NFr Smn','FERT',NULL),
('ac3cebe0dc5dc095102760',1461313520011,'0','34524-9','Neutrophils.band form [Presence] in Blood by Automated count','Neuts Band Bld Ql Auto','HEM/BC',NULL),
('Ac895ba2ecf9f27fa03377',1461313616237,'0','6257-0','Strawberry IgE Ab [Units/volume] in Serum','Strawberry IgE Qn','ALLERGY',NULL),
('Acba4705f584aeff703477',1461313631706,'0','6137-4','Hazelnut Pollen IgE Ab [Units/volume] in Serum','Hazelnut Poln IgE Qn','ALLERGY',NULL),
('acf02068f82e5b76401260',1461313287629,'0','42481-2','Human papilloma virus 6+11+42+43+44 DNA [Presence] in Cervix by Probe and signal amplification method','HPV Low Risk DNA Cervix Ql bDNA','MICRO',NULL),
('Ad150b9b642b5d2a90327',1461313141699,'0','2713-6','Oxygen saturation Calculated from oxygen partial pressure in Blood','SaO2 % Bld from pO2','CHEM',NULL),
('Ad3994e8a2c3aed8903827',1461313685813,'0','666-8','Microscopic observation [Identifier] in Unspecified specimen by India ink prep','India Ink Prep XXX','MICRO',NULL),
('ad51bfb4a483b993f03610',1461313651998,'0','6078-0','Cockroach IgE Ab [Units/volume] in Serum','Roach IgE Qn','ALLERGY',NULL),
('Ad7db84a51b04f07b0777',1461313212091,'0','14890-8','Progesterone [Moles/volume] in Serum or Plasma','Progest SerPl-sCnc','CHEM',NULL),
('Ad8cc6820bcb7d42401927',1461313390438,'0','27819-2','Protein C actual/normal in Platelet poor plasma by Coagulation assay','Prot C Act/Nor PPP','COAG',NULL),
('Ad99a634d55bcc17203727',1461313670502,'0','33630-5','HIV protease gene mutations detected [Identifier]','HIV PI gene Mut Det Islt','ABXBACT',NULL),
('Ada76e2378e539fbf03077',1461313568950,'0','8144-8','Amphetamines [Presence] in Meconium','Amphetamines Mec Ql','DRUG/TOX',NULL),
('Adabd9b168efa63f40227',1461313125601,'0','5905-5','Monocytes/100 leukocytes in Blood by Automated count','Monocytes NFr Bld Auto','HEM/BC',NULL),
('adb4eb3a9847aebdf03910',1461313698725,'0','13088-0','Complement total hemolytic CH100 [Units/volume] in Serum or Plasma','CH100 SerPl-aCnc','HEM/BC',NULL),
('adddb3df7c7476a280210',1461313122994,'0','14927-8','Triglyceride [Moles/volume] in Serum or Plasma','Trigl SerPl-sCnc','CHEM',NULL),
('addeb9d97457e899603260',1461313598251,'0','48038-4','Pathologist interpretation of Synovial fluid tests','Path Interp Snv-Imp','PATH',NULL),
('ade9e8b378b39c27503660',1461313659931,'0','7774-3','Cow whey IgE Ab [Units/volume] in Serum','Cow Whey IgE Qn','ALLERGY',NULL),
('Ae030107dc9b8723101127',1461313266285,'0','30089-7','Transitional cells [#/area] in Urine sediment by Microscopy high power field','Trans Cells #/area UrnS HPF','UA',NULL),
('ae1603e01cf2640bb01660',1461313349076,'0','32198-4','Neisseria gonorrhoeae rRNA [Presence] in Cervix by DNA probe','N gonorrhoea rRNA Cervix Ql Prb','MICRO',NULL),
('ae59fdb1de85bb9360460',1461313162467,'0','14683-7','Creatinine [Moles/volume] in Urine','Creat Ur-sCnc','CHEM',NULL),
('ae715ad1deee4c6ef04060',1461313722617,'0','25447-4','Insulin Free [Moles/volume] in Serum or Plasma','Insulin Free SerPl-sCnc','CHEM',NULL),
('b685264515150ad6401873',1461313381805,'0','6034-3','Bahia grass IgE Ab [Units/volume] in Serum','Bahia grass IgE Qn','ALLERGY',NULL),
('b6c5261c339e154f402973',1461313553072,'0','27374-8','Streptococcus pneumoniae 12 IgG Ab [Mass/volume] in Serum','S pneum12 IgG Ser-mCnc','MICRO',NULL),
('B6f0e8b088f97601301988',1461313399741,'0','6244-8','Sheep Sorrel IgE Ab [Units/volume] in Serum','Sheep Sorrel IgE Qn','ALLERGY',NULL),
('b6fa0f22f8712eb190673',1461313195914,'0','14807-2','Lead [Moles/volume] in Blood','Lead Bld-sCnc','DRUG/TOX',NULL),
('B70196a5fb6d2488801338',1461313299639,'0','70209-2','Haptoglobin [Moles/volume] in Serum or Plasma','Haptoglob SerPl-sCnc','HEM/BC',NULL),
('b7089f73e239f197204123',1461313732261,'0','18311-1','Pelger Huet cells [Presence] in Blood by Light microscopy','Pelger Huet Cells Bld Ql Smear','HEM/BC',NULL),
('B72cab033f1e62beb03638',1461313656462,'0','19098-3','Erythrocytes [Presence] in Amniotic fluid','RBC Amn Ql','HEM/BC',NULL),
('b7356cf0a70c52f3801423',1461313312385,'0','626-2','Bacteria identified in Throat by Culture','Bacteria Throat Cult','MICRO',NULL),
('B73d998543b9713a80588',1461313182442,'0','744-3','Monocytes/100 leukocytes in Blood by Manual count','Monocytes NFr Bld Manual','HEM/BC',NULL),
('b7509c3985a2b96eb02223',1461313436104,'0','667-6','Microscopic observation [Identifier] in Unspecified specimen by KOH preparation','KOH Prep XXX','MICRO',NULL),
('B7a4a5b791bf1a5f70188',1461313118916,'0','770-8','Neutrophils/100 leukocytes in Blood by Automated count','Neutrophils NFr Bld Auto','HEM/BC',NULL),
('B7a86f316f1e60d2902788',1461313524131,'0','35538-8','Baker\'s yeast IgG Ab [Mass/volume] in Serum','Baker\'s yeast IgG-mCnc','ALLERGY',NULL),
('B7af74b19a3e3756a0938',1461313236550,'0','8101-8','CD3+CD8+ (T8 suppressor cells) cells/100 cells in Blood','CD3+CD8+ Cells NFr Bld','CELLMARK',NULL),
('b7e3e413eaa3943930273',1461313132932,'0','26449-9','Eosinophils [#/volume] in Blood','Eosinophil # Bld','HEM/BC',NULL),
('B7f03f11dd04db44f02738',1461313516275,'0','25489-6','Normetanephrine [Moles/volume] in Serum or Plasma','Normetanephrine SerPl-sCnc','CHEM',NULL),
('b83e8f3983f60363f0723',1461313203427,'0','6598-7','Troponin T.cardiac [Mass/volume] in Serum or Plasma','Troponin T SerPl-mCnc','CHEM',NULL),
('B84de325d637f5ecd03938',1461313703129,'0','6286-9','Wormwood IgE Ab [Units/volume] in Serum','Wormwood IgE Qn','ALLERGY',NULL),
('b87781c2a55f09cde0323',1461313140872,'0','22748-8','Cholesterol in LDL [Moles/volume] in Serum or Plasma','LDLc SerPl-sCnc','CHEM',NULL),
('B87ba9f6ecd363a7002438',1461313469276,'0','16136-4','Beta 2 glycoprotein 1 IgM Ab [Units/volume] in Serum','B2 Glycoprot1 IgM Ser-aCnc','COAG',NULL),
('b87ceaef29964ca2502623',1461313498207,'0','28640-1','Bicarbonate [Moles/volume] in Arterial cord blood','HCO3 BldCoA-sCnc','CHEM',NULL),
('b87eef40408e096bd01523',1461313327931,'0','48391-7','\"Carbon dioxide',' total [Moles/volume] in Venous blood by calculation\"','CO2 BldV Calc-sCnc',NULL),
('b88b39dcb63819a2c03073',1461313568281,'0','14906-2','Rh [Type] in Cord blood','Rh BldCo','BLDBK',NULL),
('B8905bb430cbf3d8801738',1461313361286,'0','3209-4','Coagulation factor VIII activity actual/normal in Platelet poor plasma by Coagulation assay','Fact VIII Act/Nor PPP','COAG',NULL),
('b8a5503adb41281fe0223',1461313125091,'0','706-2','Basophils/100 leukocytes in Blood by Automated count','Basophils NFr Bld Auto','HEM/BC',NULL),
('b8b44cbe7d6ff43e704173',1461313739884,'0','25147-0','Calcium carbonate crystals [#/area] in Urine sediment by Microscopy high power field','Ca Carbonate Cry #/area UrnS HPF','UA',NULL),
('B8cde664bb87d558403588',1461313648789,'0','41480-5','BK virus DNA [#/volume] (viral load) in Urine by Probe and target amplification method','BKV DNA # Ur PCR','MICRO',NULL),
('B8d6a21a6ea795b6201288',1461313291675,'0','9590-1','Borrelia burgdorferi 28kD IgG Ab [Presence] in Serum by Immunoblot (IB)','B burgdor28kD IgG Ser Ql IB','MICRO',NULL),
('B8fa776e4b53f8fa10838',1461313221475,'0','30522-7','C reactive protein [Mass/volume] in Serum or Plasma by High sensitivity method','CRP SerPl HS-mCnc','CHEM',NULL),
('B916d137cf824b68104038',1461313718682,'0','43397-9','Dilute Russell viper venom time (dRVVT) factor substitution in Platelet poor plasma by Coagulation assay --immediately after addition of normal plasma','dRVV Tme imm NP Time PPP','COAG',NULL),
('B93284ba9b107cbce02888',1461313539909,'0','8150-5','Amphetamines [Mass/volume] in Urine','Amphetamines Ur-mCnc','DRUG/TOX',NULL),
('B935dce849a07f3770488',1461313166964,'0','14957-5','Microalbumin [Mass/volume] in Urine','Microalbumin Ur-mCnc','CHEM',NULL),
('B96a844d09a8e3aa502838',1461313532062,'0','33593-5','Hemoglobin G - Coushatta/Hemoglobin.total in Blood','Hgb G-Coush MFr Bld','HEM/BC',NULL),
('b9977ff4f5d46dc1202923',1461313545208,'0','6113-5','Gum-Tree IgE Ab [Units/volume] in Serum','Gum-Tree IgE Qn','ALLERGY',NULL),
('B9ba6b79fd490d40503288',1461313602812,'0','16117-4','Babesia microti IgG Ab [Titer] in Serum','Bab microti IgG Titr Ser','MICRO',NULL),
('b9de7bccbf9c3246903823',1461313685244,'0','26509-0','Neutrophils.band form/100 leukocytes in Cerebral spinal fluid','Neuts Band NFr CSF','HEM/BC',NULL),
('b9edfbac23382b8f901073',1461313257527,'0','14909-6','Salicylates [Moles/volume] in Serum or Plasma','Salicylates SerPl-sCnc','DRUG/TOX',NULL),
('B9f361c40f33aa42f01638',1461313345459,'0','6041-8','Bermuda grass IgE Ab [Units/volume] in Serum','Bermuda grass IgE Qn','ALLERGY',NULL),
('ba0ca29e811ddf44804073',1461313724389,'0','6349-5','Chlamydia trachomatis [Presence] in Unspecified specimen by Organism specific culture','C trach XXX Ql Cult','MICRO',NULL),
('ba157abd465fbfc0001823',1461313374058,'0','14995-5','Glucose [Moles/volume] in Serum or Plasma --2 hours post 75 g glucose PO','Glucose 2h p 75 g Glc PO SerPl-sCnc','CHAL',NULL),
('ba370a956db72ee0503873',1461313693025,'0','6239-8','Lenscale IgE Ab [Units/volume] in Serum','Lenscale IgE Qn','ALLERGY',NULL),
('Ba542d6f113c767a102388',1461313461702,'0','29615-2','Hepatitis B virus DNA [#/volume] (viral load) in Serum or Plasma by Probe and target amplification method','HBV DNA # SerPl PCR','MICRO',NULL),
('Ba56629f49fd5d70503188',1461313586479,'0','11235-9','Fentanyl [Presence] in Urine','Fentanyl Ur Ql','DRUG/TOX',NULL),
('Ba766a6d4ece5675202038',1461313407146,'0','22131-7','Borrelia burgdorferi IgG+IgM Ab [Presence] in Serum','B burgdor IgG+IgM Ser Ql','MICRO',NULL),
('ba7d65a1de67f525102323',1461313451782,'0','6604-3','Influenza virus identified in Unspecified specimen by Organism specific culture','FLUV XXX Cult','MICRO',NULL),
('baa658373bcc35e480623',1461313187891,'0','2465-3','IgG [Mass/volume] in Serum or Plasma','IgG SerPl-mCnc','CHEM',NULL),
('bab34dba7ebe6b31603473',1461313630846,'0','59412-7','Oxygen saturation in Arterial blood by Pulse oximetry --post exercise','SaO2 p Exc % BldA PulseOx','PULM',NULL),
('babde7dfd1f4932ba01923',1461313389837,'0','14759-5','Glucose [Moles/volume] in Serum or Plasma --2 hours post dose glucose','Glucose 2h p Glc SerPl-sCnc','CHAL',NULL),
('bad9a3eb1de9e9fd702273',1461313444177,'0','24476-4','F2 gene mutations found [Identifier] in Blood or Tissue by Molecular genetics method Nominal','F2 gene Mut Anal Bld/T','MOLPATH.MUT',NULL),
('bb17095f42b205a8a03373',1461313615527,'0','38476-8','Mullerian inhibiting substance [Mass/volume] in Serum or Plasma','MIS SerPl-mCnc','CHEM',NULL),
('Bb507443c94fb9cc202088',1461313414994,'0','22746-2','Gentamicin [Moles/volume] in Serum or Plasma --peak','Gentamicin Peak SerPl-sCnc','DRUG/TOX',NULL),
('Bb82558e03ae51f7401188',1461313276221,'0','546-2','Streptococcus.beta-hemolytic [Presence] in Throat by Organism specific culture','B-Hem Strep Throat Ql Cult','MICRO',NULL),
('bb8b94904a404d4cd02723',1461313514011,'0','14708-2','Endomysium Ab [Titer] in Serum','Endomysium Ab Titr Ser','SERO',NULL),
('bb8c3defdaf0e646701173',1461313273899,'0','25145-4','Bacteria [Presence] in Urine sediment by Light microscopy','Bacteria UrnS Ql Micro','UA',NULL),
('Bbb0d639783e8614101688',1461313353080,'0','29967-7','Neutrophil cytoplasmic IgG Ab [Titer] in Serum by Immunofluorescence','ANCA IgG Titr Ser IF','SERO',NULL),
('Bbb6fe43bd106e1e702138',1461313422982,'0','5187-0','Hepatitis B virus core Ab [Units/volume] in Serum by Immunoassay','HBV core Ab Ser EIA-aCnc','MICRO',NULL),
('Bbd1a56abcd4d50d80538',1461313174853,'0','3050-2','Triiodothyronine resin uptake (T3RU) in Serum or Plasma','T3RU NFr SerPl','CHEM',NULL),
('bbd3c53e24968a87203723',1461313669741,'0','14116-8','IgG synthesis rate [Mass/time] in Serum and CSF by calculation','IgG Synth Rate Ser+CSF Calc-mRate','CHEM',NULL),
('Bbd6bcc1ed50395ea03888',1461313695048,'0','18482-0','Yeast [Presence] in Unspecified specimen by Organism specific culture','Yeast XXX Ql Cult','MICRO',NULL),
('bc333dc8126057eed01373',1461313305272,'0','46769-6','Cystic fibrosis newborn screen interpretation','Cystic Fibrosis DBS-Imp','CHEM',NULL),
('bc548a6a4bfed962103023',1461313560961,'0','3282-1','Lupus anticoagulant neutralization hexagonal phase phospholipid [Time] in Platelet poor plasma by Coagulation assay','LAC Nt Hex PL Time PPP','COAG',NULL),
('bc586f7cb0e887e1f03773',1461313677514,'0','6234-9','Saltwort IgE Ab [Units/volume] in Serum','Saltwort IgE Qn','ALLERGY',NULL),
('bc625a74bfaf1fd3e01473',1461313320092,'0','19554-5','Methamphetamine [Presence] in Urine by Screen method','Methamphet Ur Ql Scn','DRUG/TOX',NULL),
('Bc724694dfd38725403138',1461313578491,'0','35270-8','Candida sp Ab [Presence] in Serum by Immune diffusion (ID)','Candida Ab Ser Ql ID','MICRO',NULL),
('bc7d31e8bc51cce990373',1461313148645,'0','33037-3','Anion gap in Serum or Plasma','Anion Gap SerPl-sCnc','CHEM',NULL),
('bcbed9b50a65244d601123',1461313265617,'0','10335-8','Color of Cerebral spinal fluid','Color CSF','SPEC',NULL),
('bcf208f9956f6fdfe02173',1461313428098,'0','33006-8','Cytomegalovirus DNA [#/volume] (viral load) in Unspecified specimen by Probe and target amplification method','CMV DNA # XXX PCR','MICRO',NULL),
('bd1ba2903f161c64c0773',1461313211581,'0','2868-8','Alpha 2 globulin [Mass/volume] in Serum or Plasma by Electrophoresis','Alpha2 Glob SerPl Elph-mCnc','CHEM',NULL),
('Bd27961342d10793e01238',1461313284061,'0','46765-4','Sickle cell anemia newborn screen interpretation','Sickle Cell Anemia DBS-Imp','CHEM',NULL),
('Bd30c759639a8dc8f03238',1461313594475,'0','7110-0','Groundsel Tree IgE Ab [Units/volume] in Serum','Groundsel Tree IgE Qn','ALLERGY',NULL),
('bd3fa8308c30e094903423',1461313623392,'0','42192-5','Nidus [Presence] in Stone','Nidus Stone Ql','PATH',NULL),
('Bd731648c89fdb8a001588',1461313337793,'0','5332-2','Rubella virus Ab [Presence] in Serum by Latex agglutination','RUBV Ab Ser Ql LA','MICRO',NULL),
('Bd76cad0b5f393d0903538',1461313640650,'0','22463-4','Reagin Ab [Presence] in Serum from donor','Reagin Ab Ser Donr Ql','MICRO',NULL),
('Bd7c46b53bdc236800888',1461313229054,'0','18943-1','Meropenem [Susceptibility]','Meropenem Susc Islt','ABXBACT',NULL),
('bd9c9b689e13d247e02573',1461313490385,'0','28645-0','Carbon dioxide [Partial pressure] in Venous cord blood','pCO2 BldCoV','CHEM',NULL),
('bdb463458792a65b001023',1461313249955,'0','5176-3','Helicobacter pylori IgG Ab [Units/volume] in Serum by Immunoassay','H pylori IgG Ser EIA-aCnc','MICRO',NULL),
('bde65517580f934f403323',1461313607754,'0','22751-2','Tobramycin [Moles/volume] in Serum or Plasma --peak','Tobramycin Peak SerPl-sCnc','DRUG/TOX',NULL),
('Bde6a4c9daf42263603688',1461313664059,'0','70214-2','Oxazepam [Moles/volume] in Urine by Confirmatory method','Oxazepam Ur Cfm-sCnc','DRUG/TOX',NULL),
('bdead8878592d22cd01773',1461313366118,'0','10900-9','Hepatitis B virus surface Ab [Presence] in Serum by Immunoassay','HBV surface Ab Ser Ql EIA','MICRO',NULL),
('Bdfeb761254ec92ed02488',1461313477381,'0','49051-6','Gestational age in weeks','GA (weeks)','OB.US',NULL),
('be02622fc83834eb002673',1461313506214,'0','13993-1','Alpha 2 globulin/Protein.total in Urine by Electrophoresis','Alpha2 Glob MFr Ur Elph','CHEM',NULL),
('Be1bdfed6e90a6ae60438',1461313158933,'0','14685-2','Cobalamin (Vitamin B12) [Moles/volume] in Serum or Plasma','Vit B12 SerPl-sCnc','CHEM',NULL),
('Be300328a8089406c03988',1461313710909,'0','20650-8','Lysine [Moles/volume] in Serum or Plasma','Lysine SerPl-sCnc','CHEM',NULL),
('Be5086dabf73d88b902338',1461313454122,'0','11051-0','Immunoglobulin light chains.lambda [Mass/volume] in Serum','Lambda LC Ser-mCnc','CHEM',NULL),
('c689aa41d86bc89bc02721',1461313513710,'0','6007-9','Protein C [Units/volume] in Platelet poor plasma by Coagulation assay','Prot C PPP-aCnc','COAG',NULL),
('c6994a16a32b9984201421',1461313312118,'0','19057-9','ABO and Rh group [Type] in Blood from newborn','ABO+Rh Gp Bld NB','BLDBK',NULL),
('C6a85c2725681ae470432',1461313157996,'0','14979-9','Activated partial thromboplastin time (aPTT) in Platelet poor plasma by Coagulation assay','aPTT Time PPP','COAG',NULL),
('c6df1ded63214662502971',1461313552763,'0','6050-9','Brazil Nut IgE Ab [Units/volume] in Serum','Brazil Nut IgE Qn','ALLERGY',NULL),
('c6ef903813229499603721',1461313669424,'0','41487-0','Cryptosporidium parvum Ag [Presence] in Stool by Immunoassay','C parvum Ag Stl Ql EIA','MICRO',NULL),
('c71a9a9d910dada0c0321',1461313140538,'0','32309-7','Cholesterol.total/Cholesterol in HDL [Molar ratio] in Serum or Plasma','Cholest/HDLc SerPl-sRto','CHEM',NULL),
('C734ce2f31035049701232',1461313283133,'0','14725-6','[Type] of Body fluid','Body fld type','SPEC',NULL),
('c75448ed83c6823c901771',1461313365817,'0','22674-6','Transferrin [Moles/volume] in Serum or Plasma','Transferrin SerPl-sCnc','CHEM',NULL),
('c773371b7b6c48ebf03771',1461313677246,'0','25383-1','Cow milk IgE Ab RAST class in Serum','Cow Milk IgE RAST Ql','ALLERGY',NULL),
('c77f7588af316c90902271',1461313443875,'0','5158-1','Epstein Barr virus capsid IgG Ab [Titer] in Serum by Immunofluorescence','EBV VCA IgG Titr Ser IF','MICRO',NULL),
('C7825931d297124c603282',1461313601618,'0','23301-5','Mycoplasma sp DNA [Presence] in Unspecified specimen by Probe and target amplification method','Mycoplasma DNA XXX Ql PCR','MICRO',NULL),
('C78b9a32111331ead0482',1461313166070,'0','30167-1','Human papilloma virus 16+18+31+33+35+39+45+51+52+56+58+59+68 DNA [Presence] in Cervix by Probe and signal amplification method','HPV I/H Risk 1 DNA Cervix Ql bDNA','MICRO',NULL),
('c7b66fcfb555dd3c10771',1461313211280,'0','2865-4','Alpha 1 globulin [Mass/volume] in Serum or Plasma by Electrophoresis','Alpha1 Glob SerPl Elph-mCnc','CHEM',NULL),
('c7b6793c8a1ac9aef03871',1461313692724,'0','8015-0','Rubella virus IgM Ab [Units/volume] in Serum','RUBV IgM Ser-aCnc','MICRO',NULL),
('C7bc3e48f6269e24e01282',1461313290930,'0','11004-9','Tricyclic antidepressants [Presence] in Urine','Tricyclics Ur Ql','DRUG/TOX',NULL),
('c7fa637db7b58533702621',1461313497907,'0','49047-4','Globulin [Mass/volume] in Urine by Electrophoresis','Globulin Ur Elph-mCnc','CHEM',NULL),
('C8117e28e6826e44c01582',1461313336815,'0','6189-5','White Oak IgE Ab [Units/volume] in Serum','White Oak IgE Qn','ALLERGY',NULL),
('c812615782b78dd9503821',1461313684894,'0','14117-6','IgG index in Serum and CSF','IgG index Ser+CSF','CHEM',NULL),
('c830982baf7a84a6201071',1461313256976,'0','46779-5','Medium/Short chain acyl-CoA dehydrogenase deficiency newborn screen interpretation','M/SCHADD DBS-Imp','CHEM',NULL),
('c831d801cb00873f901521',1461313327630,'0','42216-2','Reference lab name [Identifier]','Ref Lab Name','MISC',NULL),
('C88b1bc6f56faf2a00982',1461313243385,'0','18961-3','Oxacillin [Susceptibility]','Oxacillin Susc Islt','ABXBACT',NULL),
('c8a8e942e9e4a029401871',1461313381580,'0','2004-0','Calcium [Moles/volume] in Urine','Calcium Ur-sCnc','CHEM',NULL),
('C8c5640b71cfeaa7603182',1461313585660,'0','20473-5','Polymorphonuclear cells [Presence] in Unspecified specimen by Wright stain','Polys XXX Ql Wright Stn','HEM/BC',NULL),
('C8eacb2686910d09901332',1461313298670,'0','29463-7','Body weight','Weight','BDYWGT.ATOM',NULL),
('C917393b8e07d8e5803932',1461313702218,'0','15086-2','Oxalate [Moles/volume] in Urine','Oxalate Ur-sCnc','CHEM',NULL),
('C92fb061729b5ea9b03632',1461313655709,'0','6998-9','Ceftriaxone [Susceptibility] by Gradient strip (E-test)','Ceftriaxone Islt E-test','ABXBACT',NULL),
('C9311a1434b80583202082',1461313414132,'0','22587-0','Treponema pallidum Ab [Presence] in Serum','T pallidum Ab Ser Ql','MICRO',NULL),
('c9360de1e7f2b236b02171',1461313427797,'0','33248-6','Diabetes status [Identifier]','Diabetes status Patient','MISC',NULL),
('c936bfa5716709eb704121',1461313731977,'0','33216-3','Platelets agranular [Presence] in Blood by Light microscopy','Agran Platelets Bld Ql Smear','HEM/BC',NULL),
('c948746c8828351f903421',1461313622840,'0','9834-3','Hydromorphone [Presence] in Urine','Hydromorphone Ur Ql','DRUG/TOX',NULL),
('C94e4b66fff1439230932',1461313235605,'0','17790-7','Leukocytes Left Shift [Presence] in Blood by Automated count','WBC Left Shift Bld Ql Auto','HEM/BC',NULL),
('c97c98ea88916d3b202221',1461313435877,'0','11258-1','Hepatitis B virus DNA [Units/volume] in Serum','HBV DNA Ser-aCnc','MICRO',NULL),
('C9ac50df15886d70002882',1461313539207,'0','33333-6','Colistin [Susceptibility] by Gradient strip (E-test)','Colistin Islt E-test','ABXBACT',NULL),
('c9db87e681c86c31003021',1461313560718,'0','6158-0','Latex IgE Ab [Units/volume] in Serum','Ltx IgE Qn','ALLERGY',NULL),
('Ca012c080e128028d02032',1461313406252,'0','39796-8','Vancomycin [Moles/volume] in Serum or Plasma --peak','Vancomycin Peak SerPl-sCnc','DRUG/TOX',NULL),
('ca21f11735b5687760621',1461313187581,'0','2731-8','Parathyrin.intact [Mass/volume] in Serum or Plasma','PTH-Intact SerPl-mCnc','CHEM',NULL),
('ca492a88868c68dad02571',1461313490084,'0','2357-2','Glucose-6-Phosphate dehydrogenase [Enzymatic activity/volume] in Red Blood Cells','G6PD RBC-cCnc','CHEM',NULL),
('ca5907aca3656c95e01171',1461313273615,'0','20399-2','Nuclear Ab pattern.nucleolar [Titer] in Serum','ANA nucleolar Titr Ser','SERO',NULL),
('Ca64360b6244bc50103232',1461313593281,'0','36913-2','FMR1 gene mutation analysis in Blood or Tissue by Molecular genetics method Narrative','FMR1 gene Mut Anal Bld/T','MOLPATH.MUT',NULL),
('Ca68c2901623dab4d03982',1461313710107,'0','22412-1','Saccharopolyspora rectivirgula Ab [Presence] in Serum','S rectivirgula Ab Ser Ql','MICRO',NULL),
('Ca75c97e661ab0d1303582',1461313647870,'0','3193-0','Coagulation factor V activity actual/normal in Platelet poor plasma by Coagulation assay','Fact V Act/Nor PPP','COAG',NULL),
('ca94db42762eace9901021',1461313249629,'0','57845-0','Leukocytes [#/volume] in Body fluid by Automated count','WBC # Fld Auto','HEM/BC',NULL),
('ca9883df4902028dd01821',1461313373749,'0','30243-0','Choriogonadotropin.intact [Units/volume] in Serum or Plasma','HGC Intact SerPl-aCnc','CHEM',NULL),
('Caaea601dbd4ec20103682',1461313663140,'0','70240-7','Testosterone Free [Moles/volume] in Serum or Plasma by Detection limit <= 3.47 pmol/L','Testost Free SerPl DL<= 3.47 pmol/L-sCnc','CHEM',NULL),
('Cab7707f8c3659dd303132',1461313577581,'0','10587-4','Sexual abstinence duration','Sex Abstin duration Time Patient','FERT',NULL),
('Cae3e25a870a0bc8402382',1461313460517,'0','20450-3','Alpha-1-Fetoprotein [Multiple of the median] in Serum or Plasma','AFP MoM SerPl','CHEM',NULL),
('Caf415a2e1b5b0e8602482',1461313476403,'0','33721-2','Bone marrow Pathology biopsy report','','ATTACH.CLINRPT',NULL),
('cb32f11c9c235fbb403371',1461313615225,'0','8047-3','Varicella zoster virus IgG Ab [Units/volume] in Serum','VZV IgG Ser-aCnc','MICRO',NULL),
('Cb3964248ad9259720182',1461313118096,'0','2885-2','Protein [Mass/volume] in Serum or Plasma','Prot SerPl-mCnc','CHEM',NULL),
('Cb3df8f1f616be96301732',1461313360308,'0','709-6','Blasts/100 leukocytes in Blood by Manual count','Blasts NFr Bld Manual','HEM/BC',NULL),
('cb8a68b8a2b436cfd0271',1461313132631,'0','5767-9','Appearance of Urine','Appearance Ur','SPEC',NULL),
('Cbac54a4fb37bb76402732',1461313515339,'0','30340-4','Epstein Barr virus capsid IgM Ab [Presence] in Serum','EBV VCA IgM Ser Ql','MICRO',NULL),
('Cbb591cc0113ec3aa01632',1461313344179,'0','3299-5','Acetaminophen [Presence] in Urine','Acetamin Ur Ql','DRUG/TOX',NULL),
('cbc2b1c806565ef920371',1461313148396,'0','34928-2','Urobilinogen [Moles/volume] in Urine by Test strip','Urobilinogen Ur Strip-sCnc','UA',NULL),
('Cbd128221719cf80f03532',1461313639873,'0','71791-8','Metanephrines [Moles/volume] in 24 hour Urine','MetanephS 24h Ur-sCnc','CHEM',NULL),
('Cbfb1646a8fe8616e01982',1461313398420,'0','13525-1','Nonhematic cells/100 leukocytes in Cerebral spinal fluid by Manual count','Nonhematic Cells NFr CSF Manual','HEM/BC',NULL),
('Cc099b4dc9222fd0802782',1461313523229,'0','9796-4','Color of Stone','Color Stone','SPEC',NULL),
('cc1e492b527f8660e01121',1461313265316,'0','18887-0','Cefotetan [Susceptibility]','Cefotetan Susc Islt','ABXBACT',NULL),
('Cc45e83483906e7840582',1461313181431,'0','32215-6','Thyroxine (T4) free index in Serum or Plasma','FT4I SerPl-aCnc','CHEM',NULL),
('Cc4e8b5ec7c7cf8bb02532',1461313484075,'0','14665-4','Copper [Moles/volume] in Serum or Plasma','Copper SerPl-sCnc','DRUG/TOX',NULL),
('Cc4ebb64e1657b51803882',1461313694295,'0','13538-4','\"Carbon dioxide',' total [Moles/volume] in Urine\"','CO2 Ur-sCnc',NULL),
('cc5049a1879935f280721',1461313203117,'0','2842-3','Prolactin [Mass/volume] in Serum or Plasma','Prolactin SerPl-mCnc','CHEM',NULL),
('cca710c31b5927ba902321',1461313451481,'0','6107-7','Egg yolk IgE Ab [Units/volume] in Serum','Egg Yolk IgE Qn','ALLERGY',NULL),
('Ccc05b08c5ab224600832',1461313220389,'0','5048-4','Nuclear Ab [Titer] in Serum by Immunofluorescence','ANA Titr Ser IF','SERO',NULL),
('ccd17ef2ba9d487f601921',1461313389536,'0','56491-4','Hemoglobin.gastrointestinal [Presence] in Stool by Immunologic method --3rd specimen','Occult Bld sp3 Stl Ql Imm','CHEM',NULL),
('Ccd49578be2d61dba02132',1461313422047,'0','51775-5','Chromatin Ab [Units/volume] in Serum or Plasma','Chromatin Ab SerPl-aCnc','SERO',NULL),
('Cd0ecd0a275273d6b02432',1461313468439,'0','35275-7','Measles virus IgG Ab [Presence] in Serum by Immunoassay','MeV IgG Ser Ql EIA','MICRO',NULL),
('cd2dab1b3938381e402921',1461313544732,'0','28545-2','Mucus [#/area] in Urine sediment by Microscopy low power field','Mucous Threads #/area UrnS LPF','UA',NULL),
('cd43db2b3420df76103071',1461313567980,'0','21525-1','Sodium [Moles/volume] in 24 hour Urine','Sodium 24h Ur-sCnc','CHEM',NULL),
('cd762051c55c605d202671',1461313505906,'0','14603-5','Androstenedione [Moles/volume] in Serum or Plasma','Androst SerPl-sCnc','CHEM',NULL),
('cd9ba1a0d6465a48303471',1461313630545,'0','59417-6','Oxygen saturation in Arterial blood by Pulse oximetry --resting','SaO2 Resting % BldA PulseOx','PULM',NULL),
('cdad93fd9058f967201471',1461313319833,'0','7258-7','Cow milk IgE Ab [Units/volume] in Serum','Cow Milk IgE Qn','ALLERGY',NULL),
('cdbb53f6896c1ea1e03321',1461313607453,'0','4057-6','Tobramycin [Mass/volume] in Serum or Plasma --peak','Tobramycin Peak SerPl-mCnc','DRUG/TOX',NULL),
('cdcc0cfa06e66317804171',1461313739582,'0','5771-1','Bilirubin crystals [Presence] in Urine sediment by Light microscopy','Bilirub Cry UrnS Ql Micro','UA',NULL),
('Cde0bac18467524bc01682',1461313352286,'0','32046-5','Pregnancy associated plasma protein A [Units/volume] in Serum or Plasma','PAPP-A SerPl-aCnc','CHEM',NULL),
('ce0e0f51c964efeef0221',1461313124857,'0','736-9','Lymphocytes/100 leukocytes in Blood by Automated count','Lymphocytes NFr Bld Auto','HEM/BC',NULL),
('Ce1896265d59c6dc104032',1461313717762,'0','51844-9','Cortisol [Moles/volume] in Saliva','Cortis Sal-sCnc','CHEM',NULL),
('Ce1acb1a089eabfd901182',1461313275285,'0','4625-0','Hemoglobin S/Hemoglobin.total in Blood','Hgb S MFr Bld','HEM/BC',NULL),
('ce31e6a4e0f50946801371',1461313304905,'0','2756-5','pH of Urine','pH Ur','CHEM',NULL),
('ce33224295bdfd43c0671',1461313195688,'0','18928-2','Gentamicin [Susceptibility]','Gentamicin Susc Islt','ABXBACT',NULL),
('Ce384efc4bbbefe1d02832',1461313531109,'0','35127-0','Hemoglobin A2.prime/Hemoglobin.total in Blood','Hgb A2.prime MFr Bld','HEM/BC',NULL),
('Ce44e30d933fef6110532',1461313173784,'0','53553-4','Glucose mean value [Moles/volume] in Blood Estimated from glycated hemoglobin','Est. average glucose Bld gHb Est-sCnc','CHEM',NULL),
('Ce4ed53b169e312160882',1461313228176,'0','11031-2','Lymphocytes/100 leukocytes in Body fluid','Lymphocytes NFr Fld','HEM/BC',NULL),
('d6adab8240a97779102112',1461313418429,'0','27038-9','Endomysium IgA Ab [Titer] in Serum by Immunofluorescence','Endomysium IgA Titr Ser IF','SERO',NULL),
('d6be4294bbe2bb21f03212',1461313589856,'0','7902-0','Helicobacter pylori IgG Ab [Units/volume] in Serum','H pylori IgG Ser-aCnc','MICRO',NULL),
('d6c3ba0e8bfd1881303612',1461313652325,'0','15388-2','Mycoplasma hominis [Presence] in Unspecified specimen by Organism specific culture','M hominis XXX Ql Cult','MICRO',NULL),
('d6d19f2d0ec89e8ac03262',1461313598568,'0','4551-8','Hemoglobin A2/Hemoglobin.total in Blood','Hgb A2 MFr Bld','HEM/BC',NULL),
('D6e2c0dcdbbb475b801881',1461313382883,'0','9439-1','Casts [#/area] in Urine sediment by Microscopy high power field','Casts #/area UrnS HPF','UA',NULL),
('D708a22a4c0118d2f03081',1461313569954,'0','21023-7','Neutrophil cytoplasmic Ab [Titer] in Serum','ANCA Ab Titr Ser','SERO',NULL),
('d766122072a79c20604012',1461313714604,'0','6081-4','Coconut IgE Ab [Units/volume] in Serum','Coconut IgE Qn','ALLERGY',NULL),
('D76f45a9cb995016d01481',1461313321204,'0','14334-7','Lithium [Moles/volume] in Serum or Plasma','Lithium SerPl-sCnc','DRUG/TOX',NULL),
('d794a797d9c90f35702062',1461313411257,'0','4532-8','Complement total hemolytic CH50 [Units/volume] in Serum or Plasma','CH50 SerPl-aCnc','HEM/BC',NULL),
('D7b5a85bf488424aa01431',1461313314032,'0','10333-3','Appearance of Cerebral spinal fluid','Appearance CSF','SPEC',NULL),
('D7cc530bd707a063101381',1461313306359,'0','12710-0','Hemoglobin pattern [interpretation] in Blood','Hgb Fract Bld-Imp','HEM/BC',NULL),
('d7d0dffecadc00d4c03662',1461313660231,'0','5052-6','Aspergillus sp Ab [Presence] in Serum by Immune diffusion (ID)','Aspergillus Ab Ser Ql ID','MICRO',NULL),
('d7f765d123881052f0512',1461313170725,'0','2744-1','pH of Arterial blood','pH BldA','CHEM',NULL),
('d832a5b2c009b90890912',1461313232730,'0','31017-7','Tissue transglutaminase IgA Ab [Units/volume] in Serum','tTG IgA Ser-aCnc','SERO',NULL),
('D836048060646953603781',1461313678802,'0','50970-3','XXX blood group Ab [Titer] in Serum or Plasma by Antihuman globulin','XXX blood group Ab Titr SerPl AHG','BLDBK',NULL),
('D85e2ab6e1e2c4ab301831',1461313375352,'0','6152-3','Johnson grass IgE Ab [Units/volume] in Serum','Johnson grass IgE Qn','ALLERGY',NULL),
('D86bccc9b74a8251c02181',1461313429551,'0','21024-5','Pathologist interpretation of Cerebral spinal fluid tests','Path Interp CSF-Imp','PATH',NULL),
('D86d3cb8675d40af103731',1461313671029,'0','33893-9','Karyotype [Identifier] in Bone marrow Nominal','Karyotyp Mar','MOLPATH',NULL),
('D86f63707ca9620ed01031',1461313251167,'0','19312-8','Tricyclic antidepressants [Presence] in Urine by Screen method','Tricyclics Ur Ql Scn','DRUG/TOX',NULL),
('D8847b1f7f36efdfd03481',1461313632159,'0','3093-2','Urea nitrogen [Mass/volume] in Body fluid','Urea nit Fld-mCnc','CHEM',NULL),
('d89f7ae2c16fa9abd03162',1461313582560,'0','5946-9','Activated partial thromboplastin time (aPTT).factor substitution in Platelet poor plasma by Coagulation assay --immediately after addition of normal plasma','aPTT imm NP Time PPP','COAG',NULL),
('d8ca70ed54f6c237a0812',1461313217472,'0','5194-6','Hepatitis B virus surface Ab [Units/volume] in Serum by Radioimmunoassay (RIA)','HBV surface Ab Ser RIA-aCnc','MICRO',NULL),
('D8de51c6f1ba5b9a90231',1461313126211,'0','751-8','Neutrophils [#/volume] in Blood by Automated count','Neutrophils # Bld Auto','HEM/BC',NULL),
('d8f9c007a9bb2135602362',1461313457641,'0','30166-3','Thyroid stimulating immunoglobulins actual/normal in Serum','TSI Act/Nor Ser','CHEM',NULL),
('d8fda4be413449abb0962',1461313240335,'0','38478-4','Biotinidase [Presence] in Dried blood spot','Biotinidase DBS Ql','CHEM',NULL),
('d90ca00bff32f712a02512',1461313480875,'0','5053-4','Aspergillus sp Ab [Titer] in Serum by Complement fixation','Aspergillus Ab Titr Ser CF','MICRO',NULL),
('D915a09c6f363517b0731',1461313204646,'0','2069-3','Chloride [Moles/volume] in Blood','Chloride Bld-sCnc','CHEM',NULL),
('D922cdceb3e3e0a0601531',1461313329076,'0','6099-6','Dog epithelium IgE Ab [Units/volume] in Serum','Dog Epith IgE Qn','ALLERGY',NULL),
('D93dfd5a3d01b264001931',1461313390923,'0','26486-1','Monocytes/100 leukocytes in Cerebral spinal fluid','Monocytes NFr CSF','HEM/BC',NULL),
('d958350cc37b93b2b02012',1461313403034,'0','14756-1','Glucose [Moles/volume] in Serum or Plasma --1 hour post dose glucose','Glucose 1h p Glc SerPl-sCnc','CHAL',NULL),
('D95c1515048b0cbbe03831',1461313686290,'0','19734-3','Chicken droppings IgE Ab [Units/volume] in Serum','Chicken Drop IgE Qn','ALLERGY',NULL),
('D96587119f5529e8302231',1461313437240,'0','6942-7','Albumin [Mass/volume] in Urine by Electrophoresis','Albumin Ur Elph-mCnc','CHEM',NULL),
('d96d77a674179633f03512',1461313637038,'0','6062-4','Casein IgE Ab [Units/volume] in Serum','Casein IgE Qn','ALLERGY',NULL),
('d9c3755f29526697a01712',1461313357191,'0','31204-1','Hepatitis B virus core IgM Ab [Presence] in Serum','HBV core IgM Ser Ql','MICRO',NULL),
('d9c838715fafe144d02862',1461313535780,'0','42484-6','Protein.monoclonal/Protein.total in 24 hour Urine by Electrophoresis','M Protein 24h MFr Ur Elph','CHEM',NULL),
('d9d5521ce46126afd0862',1461313224801,'0','18893-8','Ceftazidime [Susceptibility]','Ceftazidime Susc Islt','ABXBACT',NULL),
('d9d9bfce6ecc58a6f01212',1461313279599,'0','11006-4','Borrelia burgdorferi Ab [Presence] in Serum','B burgdor Ab Ser Ql','MICRO',NULL),
('d9dce835347743d390212',1461313123303,'0','10466-1','Anion gap 3 in Serum or Plasma','Anion Gap3 SerPl-sCnc','CHEM',NULL),
('d9e24f2cac6d6970802912',1461313543403,'0','33915-0','Anabasine [Mass/volume] in Urine','Anabasine Ur-mCnc','DRUG/TOX',NULL),
('D9f20aafeb68dcafb0281',1461313134177,'0','5811-5','Specific gravity of Urine by Test strip','Sp Gr Ur Strip','UA',NULL),
('da096cb6e8561e0010462',1461313162751,'0','20408-1','Leukocytes [#/volume] in Urine by Test strip','WBC # Ur Strip','UA',NULL),
('Da2f63f03e61f748b02631',1461313499611,'0','32207-3','Platelet distribution width [Entitic volume] in Blood by Automated count','PDW Bld Auto','HEM/BC',NULL),
('Da4f6df17ac1f57dc02931',1461313546211,'0','19077-7','Cells identified in Body fluid','Cells Fld','HEM/BC',NULL),
('Da708e545f1cf9a6202681',1461313507434,'0','5354-6','Sjogrens syndrome-B extractable nuclear Ab [Presence] in Serum by Immune diffusion (ID)','ENA SS-B Ab Ser Ql ID','SERO',NULL),
('da81dda4bde6f078201662',1461313349377,'0','6085-5','Common Ragweed IgE Ab [Units/volume] in Serum','Common Ragweed IgE Qn','ALLERGY',NULL),
('Daa7472c5d7ec2c2d02981',1461313554260,'0','18267-5','CD16+CD56+ cells/100 cells in Blood','CD16+CD56+ Cells NFr Bld','CELLMARK',NULL),
('dadaf2345d410151701962',1461313395411,'0','13519-4','Basophils/100 leukocytes in Cerebral spinal fluid by Manual count','Basophils NFr CSF Manual','HEM/BC',NULL),
('db04274c4f8c4635501612',1461313341120,'0','42247-7','Hemoglobin pattern [interpretation] in Blood by HPLC Narrative','Hgb Fract Bld HPLC-Imp','HEM/BC',NULL),
('Db0d62dfd4dfc9a680331',1461313142443,'0','11558-4','pH of Blood','pH Bld','CHEM',NULL),
('Db19c1827d42c53ff02581',1461313491481,'0','6825-4','Crystals [type] in Body fluid by Light microscopy','Crystals Fld Micro','HEM/BC',NULL),
('Db31efd4c5b3cd32c02281',1461313445288,'0','11878-6','Number of fetuses by US','# Fetuses US','OB.US',NULL),
('Db77ab11d415941b303381',1461313616847,'0','19111-4','Mother\'s hospital number','Mother\'s hospital #','CLIN',NULL),
('db96c6bbeb6202a9203562',1461313644811,'0','13462-7','Apolipoprotein A-I/Apolipoprotein B [Mass ratio] in Serum or Plasma','Apo A-I/Apo B SerPl-mRto','CHEM',NULL),
('dbbfae1e53af761f701262',1461313287929,'0','13951-9','Hepatitis A virus Ab [Presence] in Serum by Immunoassay','HAV Ab Ser Ql EIA','MICRO',NULL),
('dbe046dbf709943150562',1461313178405,'0','14959-1','Microalbumin/Creatinine [Mass ratio] in Urine','Microalbumin/Creat Ur-mRto','CHEM',NULL),
('dc024c0737b2fbe9302812',1461313528009,'0','3507-1','Codeine [Presence] in Urine','Codeine Ur Ql','DRUG/TOX',NULL),
('Dc1071df77d30460803031',1461313562130,'0','936-5','Blood product unit [Identifier]','Bld Unit Id BPU','BLDBK',NULL),
('Dc1f34bde58bcf21704181',1461313741329,'0','20455-2','Leukocytes [Presence] in Urine sediment by Light microscopy','WBC UrnS Ql Micro','UA',NULL),
('Dc3770fff04480a510781',1461313212584,'0','28541-1','Metamyelocytes/100 leukocytes in Blood','Metamyelocytes NFr Bld','HEM/BC',NULL),
('Dc37e5bbb23eea88b01781',1461313367663,'0','10998-3','Oxycodone [Presence] in Urine','Oxycodone Ur Ql','DRUG/TOX',NULL),
('Dc500c6c8d99e603001081',1461313258598,'0','14688-6','Dehydroepiandrosterone sulfate (DHEA-S) [Moles/volume] in Serum or Plasma','DHEA-S SerPl-sCnc','CHEM',NULL),
('Dc64a5e76012d1fe901131',1461313266862,'0','2828-2','Potassium [Moles/volume] in Urine','Potassium Ur-sCnc','CHEM',NULL),
('Dc6bc96d65e5f457d0631',1461313189119,'0','30341-2','Erythrocyte sedimentation rate','ESR Bld Qn','HEM/BC',NULL),
('Dc73a391a44a2b80402331',1461313453403,'0','5181-3','Hepatitis A virus IgM Ab [Units/volume] in Serum by Immunoassay','HAV IgM Ser EIA-aCnc','MICRO',NULL),
('dc7a400d3dd6d52b903912',1461313699026,'0','34165-1','Granulocytes Immature [Presence] in Blood by Automated count','Imm Granulocytes Bld Ql Auto','HEM/BC',NULL),
('dcb067fc7b4f2f8f903112',1461313574756,'0','40974-8','Streptococcus pneumoniae 57 IgG Ab [Mass/volume] in Serum','S pneum57 IgG Ser-mCnc','MICRO',NULL),
('dcb1d3d0953a65e0604062',1461313722852,'0','6121-8','Fusarium moniliforme IgE Ab [Units/volume] in Serum','F moniliforme IgE Qn','ALLERGY',NULL),
('Dcce384b19996709703331',1461313608816,'0','9811-1','Chromogranin A [Mass/volume] in Serum or Plasma','CgA SerPl-mCnc','CHEM',NULL),
('dd04a0be324b0d87b02412',1461313465530,'0','17849-1','Reticulocytes/100 erythrocytes in Blood by Automated count','Retics/100 RBC NFr Auto','HEM/BC',NULL),
('dd1a3ce4b59e8dbbd02462',1461313473060,'0','41222-1','Yeast [Presence] in Body fluid by Light microscopy','Yeast Fld Ql Micro','MICRO',NULL),
('dd3dd6feb8b4d25bc0412',1461313155104,'0','4537-7','Erythrocyte sedimentation rate by Westergren method','ESR Bld Qn Westrgrn','HEM/BC',NULL),
('Dda1483a32193f5010381',1461313150082,'0','2965-2','Specific gravity of Urine','Sp Gr Ur','CHEM',NULL),
('Ddab973d0609e84ae04131',1461313733524,'0','5775-2','Calcium phosphate crystals [Presence] in Urine sediment by Light microscopy','Ca Phos Cry UrnS Ql Micro','UA',NULL),
('Ddaba8d06077a1f9c04081',1461313725542,'0','7797-4','Rouleaux [Presence] in Blood by Light microscopy','Rouleaux Bld Ql Smear','HEM/BC',NULL),
('Ddbfed5c675d80ec20681',1461313197068,'0','6462-6','Bacteria identified in Wound by Culture','Bacteria Wnd Cult','MICRO',NULL),
('ddd4f3724206968c30162',1461313115171,'0','2000-8','Calcium [Moles/volume] in Serum or Plasma','Calcium SerPl-sCnc','CHEM',NULL),
('ddd6216adde74446f03962',1461313706831,'0','20645-8','Histidine [Moles/volume] in Serum or Plasma','Histidine SerPl-sCnc','CHEM',NULL),
('Ddd86b681c3a722f703431',1461313624694,'0','19643-6','Oxycodone [Presence] in Urine by Confirmatory method','Oxycodone Ur Ql Cfm','DRUG/TOX',NULL),
('de12af735fcc4fc1802762',1461313520328,'0','23841-0','Choriogonadotropin.beta subunit [Multiple of the median] adjusted in Serum or Plasma','B-HCG adj MoM SerPl','CHEM',NULL),
('de146a85aa89a01ba01362',1461313303450,'0','33768-3','Leukocyte clumps [#/volume] in Urine by Automated count','WBC clumps # Ur Auto','UA',NULL),
('de50ab7d5fbbdb80601312',1461313295712,'0','6410-5','Gardnerella vaginalis rRNA [Presence] in Genital specimen by DNA probe','G vaginalis rRNA Genital Ql Prb','MICRO',NULL),
('e69041c9cedcd7bdb02902',1461313542015,'0','9428-4','Benzodiazepines [Mass/volume] in Urine','Benzodiaz Ur-mCnc','DRUG/TOX',NULL),
('E699e006d367e86b10880',1461313227901,'0','26487-9','Monocytes/100 leukocytes in Body fluid','Monocytes NFr Fld','HEM/BC',NULL),
('E69c97b8836fbf33d02830',1461313530833,'0','40926-8','Streptococcus pneumoniae 68 IgG Ab [Mass/volume] in Serum by Immunoassay','S pneum68 IgG Ser EIA-mCnc','MICRO',NULL),
('e6eea77f0b5781b2502502',1461313479396,'0','41499-5','Legionella pneumophila 1 Ag [Presence] in Urine by Immunoassay','L pneumo1 Ag Ur Ql EIA','MICRO',NULL),
('e7040fa48e5f8d07b0952',1461313238848,'0','18886-2','Cefotaxime [Susceptibility]','Cefotaxime Susc Islt','ABXBACT',NULL),
('e73de0381656356c80902',1461313230977,'0','18879-7','Cefepime [Susceptibility]','Cefepime Susc Islt','ABXBACT',NULL),
('e7400c40cfc83c20f0202',1461313121990,'0','14647-2','Cholesterol [Moles/volume] in Serum or Plasma','Cholest SerPl-sCnc','CHEM',NULL),
('E75798af9dee7093903630',1461313655445,'0','3096-5','Urea nitrogen [Mass/time] in 24 hour Urine','UUN 24h Ur-mRate','CHEM',NULL),
('e76bf8f0487eda84703552',1461313643014,'0','19086-8','Collection of urine specimen end date','Collect End Date Ur','SPEC',NULL),
('E76ecf041d6b88dd002080',1461313413832,'0','35383-9','Galactomannan Ag [Units/volume] in Serum or Plasma','Galactomannan Ag SerPl-aCnc','MICRO',NULL),
('E784ae4c24eaaf61c02780',1461313522927,'0','14316-4','Benzodiazepines [Presence] in Urine by Screen method','Benzodiaz Ur Ql Scn','DRUG/TOX',NULL),
('e791163bad1d2721003252',1461313597031,'0','22297-6','Epstein Barr virus nuclear Ab [Titer] in Serum','EBV NA Ab Titr Ser','MICRO',NULL),
('E794fea891ad636ce01980',1461313398112,'0','11135-1','Appearance of Spun Cerebral spinal fluid','Appearance spun CSF','SPEC',NULL),
('E79e89dcb8d9c06ee03680',1461313662839,'0','3198-9','Coagulation factor VII activity actual/normal in Platelet poor plasma by Coagulation assay','Fact VII Act/Nor PPP','COAG',NULL),
('E7acb639000fd06fd03130',1461313577280,'0','38256-4','Cells Counted Total [#] in Body fluid','Total Cells Counted Fld','HEM/BC',NULL),
('e7bce45ffb662f6df02402',1461313464010,'0','2483-6','Insulin-like growth factor binding protein 3 [Mass/volume] in Serum or Plasma','IGF BP3 SerPl-mCnc','CHEM',NULL),
('E7da8f7f3c039b3e903180',1461313585360,'0','59960-5','Propoxyphene [Moles/volume] in Urine','Propoxyph Ur-sCnc','DRUG/TOX',NULL),
('e80067741c24add7103502',1461313635342,'0','7893-1','Gliadin Ab [Units/volume] in Serum','Gliadin Ab Ser-aCnc','SERO',NULL),
('e801a25593c606b7403652',1461313658602,'0','49835-2','CD19+IgD+ cells/100 cells in Unspecified specimen','CD19+IgD+ cells NFr XXX','CELLMARK',NULL),
('E83a817ee7640739b03930',1461313701917,'0','14678-7','Cortisol [Moles/volume] in Serum or Plasma --PM trough specimen','Cortis PM SerPl-sCnc','CHEM',NULL),
('E886633ca338d7fcf0980',1461313243159,'0','26452-3','Eosinophils/100 leukocytes in Body fluid','Eosinophil NFr Fld','HEM/BC',NULL),
('e8b44315f56bb95da02452',1461313471565,'0','46267-1','Proteinase 3 Ab [Units/volume] in Serum by Immunoassay','Proteinase3 Ab Ser EIA-aCnc','SERO',NULL),
('E904099f8f0dcfb6d02030',1461313406018,'0','4090-7','Vancomycin [Mass/volume] in Serum or Plasma --peak','Vancomycin Peak SerPl-mCnc','DRUG/TOX',NULL),
('e91eb4729e5b46c1f0852',1461313223480,'0','14907-0','Rh [Type] in Blood from Blood product unit','Rh Bld BPU','BLDBK',NULL),
('E9216b42697e9ce8e0930',1461313235288,'0','18993-6','Tetracycline [Susceptibility]','Tetracycline Susc Islt','ABXBACT',NULL),
('E9272cfc03dd358ba03980',1461313709848,'0','32217-2','von Willebrand factor (vWf) multimers [Presence] in Platelet poor plasma','vWF multimers PPP Ql','COAG',NULL),
('E92f59c8fe1972b2e04030',1461313717462,'0','38168-1','Major crossmatch [interpretation] by Low ionic strenght saline (LISS)','Maj XM SerPl LISS-Imp','BLDBK',NULL),
('e937063b0bc66ee0603602',1461313650771,'0','58787-3','Corynebacterium diphtheriae IgG Ab [Units/volume] in Serum by Immunoassay','C diphtheriae IgG Ser EIA-aCnc','MICRO',NULL),
('E9382ae3c4d962dbf01580',1461313336506,'0','5813-1','Trichomonas vaginalis [Presence] in Urine sediment by Light microscopy','T vaginalis UrnS Ql Micro','UA',NULL),
('e949d354a7613e6f802752',1461313518566,'0','21441-1','Human papilloma virus 6+11+42+43+44 DNA [Presence] in Cervix by DNA probe','HPV Low Risk DNA Cervix Ql Prb','MICRO',NULL),
('E98e05e6ccd7bf1b102380',1461313460191,'0','31844-4','Hepatitis B virus e Ag [Presence] in Serum','HBV e Ag Ser Ql','MICRO',NULL),
('E9990ad3034e783430530',1461313173274,'0','3390-2','Benzodiazepines [Presence] in Urine','Benzodiaz Ur Ql','DRUG/TOX',NULL),
('E99b6b2b40255ba3f03580',1461313647552,'0','26517-3','Polymorphonuclear cells/100 leukocytes in Cerebral spinal fluid','Polys NFr CSF','HEM/BC',NULL),
('E9ba08a24514aa1ff03280',1461313601318,'0','49572-1','Second trimester triple maternal screen [interpretation] in Serum or Plasma Narrative','2nd trimester 3 screen SerPl-Imp','CHEM',NULL),
('e9c61066d03ba44f001352',1461313301662,'0','7886-5','Epstein Barr virus capsid IgM Ab [Units/volume] in Serum','EBV VCA IgM Ser-aCnc','MICRO',NULL),
('E9eae802ff81f80210580',1461313181155,'0','22753-8','Iron binding capacity.unsaturated [Moles/volume] in Serum or Plasma','UIBC SerPl-sCnc','CHEM',NULL),
('e9f9850f51b3584f101252',1461313286134,'0','18390-5','Opiates [Presence] in Urine by Confirmatory method','Opiates Ur Ql Cfm','DRUG/TOX',NULL),
('ea0eb649984d6a79a0502',1461313168995,'0','1995-0','Calcium.ionized [Moles/volume] in Serum or Plasma','Ca-I SerPl-sCnc','CHEM',NULL),
('ea137b068e2e8480404002',1461313713082,'0','12201-0','Cryoglobulin [Presence] in Serum by 1 day cold incubation','Cryoglob Ser Ql 1D Cold Inc','CHEM',NULL),
('Ea87b1a194f1a518501330',1461313298353,'0','19157-7','Tube number of Cerebral spinal fluid','Tube # CSF','SPEC',NULL),
('Eab8bc8840148ea5202530',1461313483774,'0','48039-2','Fibronectin.fetal [Presence] in Unspecified specimen','Fibronectin Fetal XXX Ql','CHEM',NULL),
('eac4535e227a5285f0552',1461313177117,'0','3377-9','Barbiturates [Presence] in Urine','Barbiturates Ur Ql','DRUG/TOX',NULL),
('eaca033cdc7c50d7d03902',1461313697220,'0','17813-7','Alpha 2 globulin/Protein.total in unspecified time Urine by Electrophoresis','Alpha2 Glob ?Tm MFr Ur Elph','CHEM',NULL),
('eae5c5543cc8f893902802',1461313526204,'0','30427-9','Macrophages/100 leukocytes in Body fluid','Macrophages NFr Fld','HEM/BC',NULL),
('eaf07859221ed405c04052',1461313721413,'0','7796-6','Platelet clump [Presence] in Blood by Light microscopy','Platelet Clump Bld Ql Smear','HEM/BC',NULL),
('Eaf2ae6bdf9ed297b03530',1461313639571,'0','2032-1','Carboxyhemoglobin/Hemoglobin.total in Venous blood','COHgb MFr BldV','CHEM',NULL),
('eb09c979988d9c34803202',1461313588568,'0','15197-7','Lymphocytes Fissured/100 leukocytes in Blood by Manual count','Fiss Lymphs NFr Bld Manual','HEM/BC',NULL),
('Eb570f1c9117d91bf01230',1461313282841,'0','13503-8','Borrelia burgdorferi Ab.IgM band pattern [interpretation] in Serum by Immunoblot (IB)','B burgdor IgM Patrn Ser IB-Imp','MICRO',NULL),
('Eb6c46f292b55090601180',1461313274843,'0','48066-5','Fibrin D-dimer DDU [Mass/volume] in Platelet poor plasma','D dimer DDU PPP-mCnc','COAG',NULL),
('eb6c7197843920a0501652',1461313347756,'0','30457-6','Nonhematic cells/100 leukocytes in Body fluid','Nonhematic Cells NFr Fld','HEM/BC',NULL),
('Eb9db4db98d74643c02880',1461313538906,'0','25157-9','Epithelial casts [Presence] in Urine sediment by Light microscopy','Epith Casts UrnS Ql Micro','UA',NULL),
('ebaefb36896ef80d002002',1461313401672,'0','14638-1','Calculus analysis [interpretation] in Stone','Stone Analysis-Imp','CHEM',NULL),
('ebd9495e8cb1296c503952',1461313705135,'0','20656-5','Serine [Moles/volume] in Serum or Plasma','Serine SerPl-sCnc','CHEM',NULL),
('ec2324d1020af35b101752',1461313363242,'0','655-1','Microscopic observation [Identifier] in Unspecified specimen by Acid fast stain.Kinyoun modified','Acid fast Mod Kiny Stn XXX','MICRO',NULL),
('Ec2527d9149057eab02130',1461313421746,'0','53982-5','Centromere protein B Ab [Units/volume] in Serum','Centromere B Ab Ser-aCnc','SERO',NULL),
('Ec46829c084e92df001680',1461313351918,'0','49062-3','Lipid risk factors [Finding]','Lipid risk factors Patient','CHEM',NULL),
('Ec5568d7ca4a937300430',1461313157695,'0','13317-3','Methicillin resistant Staphylococcus aureus [Presence] in Unspecified specimen by Organism specific culture','MRSA XXX Ql Cult','MICRO',NULL),
('Ec91f9a1e914fb5a603230',1461313593022,'0','7477-3','Mango Pollen IgE Ab [Units/volume] in Serum','Mango Poln IgE Qn','ALLERGY',NULL),
('Ec92f804914bc369d02430',1461313468205,'0','20479-2','Measles virus IgG Ab [Presence] in Serum','MeV IgG Ser Ql','MICRO',NULL),
('ec9ce91c5330fd8be01702',1461313355203,'0','2064-4','Ceruloplasmin [Mass/volume] in Serum or Plasma','Ceruloplasmin SerPl-mCnc','CHEM',NULL),
('Ecbd8b35c59aa929b0180',1461313117787,'0','14631-6','Bilirubin.total [Moles/volume] in Serum or Plasma','Bilirub SerPl-sCnc','CHEM',NULL),
('Ecc4315b9edfca64d01730',1461313359991,'0','29770-5','Karyotype [Identifier] in Blood or Tissue Nominal','Karyotyp Bld/T','MOLPATH',NULL),
('ecccf4962fdfa9bc101202',1461313278203,'0','5064-1','Borrelia burgdorferi IgM Ab [Units/volume] in Serum by Immunoassay','B burgdor IgM Ser EIA-aCnc','MICRO',NULL),
('Ece5cb8542b6aefad0480',1461313165844,'0','70199-5','Bilirubin.total [Moles/volume] in Urine','Bilirub Ur-sCnc','CHEM',NULL),
('ecf2972f961dee57801302',1461313294265,'0','9595-0','Borrelia burgdorferi 58kD IgG Ab [Presence] in Serum by Immunoblot (IB)','B burgdor58kD IgG Ser Ql IB','MICRO',NULL),
('ed5d4de95f642bcb802102',1461313417091,'0','15218-1','Food Allergen Mix 2 (Cod+Blue Mussel+Shrimp+Salmon+Tuna) IgE Ab [Presence] in Serum by Multidisk','Food Allerg Mix2 IgE Ql','ALLERGY',NULL),
('Ed7cb260043248bb802480',1461313476094,'0','49539-0','Cytomegalovirus IgM Ab [Presence] in Serum by Immunofluorescence','CMV IgM Ser Ql IF','MICRO',NULL),
('ed803bd192edf0cb002352',1461313456328,'0','46995-7','HLA-DP+DQ+DR (class II) Ab in Serum','HLA-DP+DQ+DR Ab NFr Ser','HLA',NULL),
('ed85b66986696eec80152',1461313113601,'0','2028-9','\"Carbon dioxide',' total [Moles/volume] in Serum or Plasma\"','CO2 SerPl-sCnc',NULL),
('Ed97fe7df7760948e02730',1461313515113,'0','32680-1','Fine Granular Casts [#/area] in Urine sediment by Microscopy low power field','Fine Gran Casts #/area UrnS LPF','UA',NULL),
('ed9fc86c859c764df01602',1461313339816,'0','36904-1','Inhibin A [Multiple of the median] adjusted in Serum','Inhibin A adj MoM Ser','CHEM',NULL),
('edb90b17cf7b0b22b0452',1461313161180,'0','14800-7','Iron binding capacity [Moles/volume] in Serum or Plasma','TIBC SerPl-sCnc','CHEM',NULL),
('edca0e50c9bdd31ab03152',1461313581039,'0','30165-5','Phosphatidylcholine/Albumin [Mass ratio] in Amniotic fluid','PC/Alb Amn-mRto','CHEM',NULL),
('eddae35e1698a06cc02852',1461313534118,'0','35572-7','Phenylalanine/Tyrosine [Molar ratio] in Dried blood spot','Phe/Tyr DBS-sRto','CHEM',NULL),
('ede198b692eae777b02052',1461313409243,'0','6281-0','White mulberry IgE Ab [Units/volume] in Serum','White mulberry IgE Qn','ALLERGY',NULL),
('Ee08259fa8a8cacda01630',1461313343895,'0','38180-6','Hepatitis C virus RNA [log units/volume] (viral load) in Serum or Plasma by Probe and target amplification method','HCV RNA SerPl PCR-Log IU','MICRO',NULL),
('Ee5df324d9c4195490830',1461313220088,'0','8099-4','Thyroperoxidase Ab [Units/volume] in Serum or Plasma','Thyroperoxidase Ab SerPl-aCnc','SERO',NULL),
('ee64124aa0b1552ef0802',1461313215492,'0','18865-6','Ampicillin+Sulbactam [Susceptibility]','Ampicillin+Sulbac Susc Islt','ABXBACT',NULL),
('Ee66ef023dc8017b501280',1461313290638,'0','17792-3','Sjogrens syndrome-A extractable nuclear Ab [Units/volume] in Serum','ENA SS-A Ab Ser-aCnc','SERO',NULL),
('f698ab47605d6a24501163',1461313272461,'0','2890-2','Protein/Creatinine [Mass ratio] in Urine','Prot/Creat Ur-mRto','CHEM',NULL),
('F69d279062f56744c02434',1461313468690,'0','5781-0','Crystals [type] in Synovial fluid by Light microscopy','Crystals Snv Micro','HEM/BC',NULL),
('F69f2fcd359bb4fb703234',1461313593599,'0','13943-6','Fructose [Presence] in Semen','Fructose Smn Ql','CHEM',NULL),
('f6a93111576c832700663',1461313194026,'0','12258-0','Epithelial cells.squamous [Presence] in Urine sediment by Light microscopy','Squamous UrnS Ql Micro','UA',NULL),
('f6f8e23047262338501863',1461313380359,'0','5213-4','Heterophile Ab [Presence] in Serum by Latex agglutination','Heteroph Ab Ser Ql LA','MICRO',NULL),
('F7255de7c9e51c80401984',1461313398730,'0','14764-5','Glucose [Moles/volume] in Serum or Plasma --3 hours post 100 g glucose PO','Glucose 3h p 100 g Glc PO SerPl-sCnc','CHAL',NULL),
('F73f2ceb5709ba75903284',1461313602220,'0','5256-3','Mycoplasma pneumoniae IgM Ab [Units/volume] in Serum by Immunoassay','M pneumo IgM Ser EIA-aCnc','MICRO',NULL),
('f75984a0c1ad96fb20363',1461313147324,'0','10839-9','Troponin I.cardiac [Mass/volume] in Serum or Plasma','Troponin I SerPl-mCnc','CHEM',NULL),
('F76a149c2b720f99302884',1461313539449,'0','71790-0','Calcium [Moles/volume] in unspecified time Urine','Calcium ?Tm Ur-sCnc','CHEM',NULL),
('F7893badfe67757fd0184',1461313118406,'0','6768-6','Alkaline phosphatase [Enzymatic activity/volume] in Serum or Plasma','ALP SerPl-cCnc','CHEM',NULL),
('f78eaeee2c100de1702563',1461313488873,'0','4621-9','Hemoglobin S [Presence] in Blood','Hgb S Bld Ql','HEM/BC',NULL),
('f7a21b21ea61cd27202713',1461313512473,'0','6092-1','Crab IgE Ab [Units/volume] in Serum','Crab IgE Qn','ALLERGY',NULL),
('f7ae47140fe3d5a0804163',1461313738288,'0','24015-0','Influenza virus A+B Ag [Presence] in Unspecified specimen','FLUAV+FLUBV Ag XXX Ql','MICRO',NULL),
('F7df9b63472a6a7ac03884',1461313694596,'0','14976-5','Lecithin/Sphingomyelin [Ratio] in Amniotic fluid','Lecithin/Sphingomyelin Amn-Rto','CHEM',NULL),
('F7f3e8a90b65a8b4102384',1461313460818,'0','48343-8','Hemoglobin.other/Hemoglobin.total in Blood','Hgb Other MFr Bld','HEM/BC',NULL),
('F7f9f806f57e2f1e201184',1461313275586,'0','2746-6','pH of Venous blood','pH BldV','CHEM',NULL),
('F801b02ce13cbbbdc02784',1461313523538,'0','9802-0','Size [Entitic volume] of Stone','Size Stone','PATH',NULL),
('f808e693e13007aa402963',1461313551544,'0','26020-8','Creatine Kinase.macromolecular type 2/Creatine kinase.total in Serum or Plasma','CK Macro2 CFr SerPl','CHEM',NULL),
('F81f859db2025155e0434',1461313158297,'0','11277-1','Epithelial cells.squamous [#/area] in Urine sediment by Microscopy high power field','Squamous #/area UrnS HPF','UA',NULL),
('f844df91a493eff0403413',1461313621669,'0','6237-2','Salmon IgE Ab [Units/volume] in Serum','Salmon IgE Qn','ALLERGY',NULL),
('f84ec97bcb22b653403463',1461313629283,'0','14251-3','Mitochondria M2 IgG Ab [Units/volume] in Serum','Mitochondria M2 IgG Ser-aCnc','SERO',NULL),
('F86c4f6577b5832000984',1461313243736,'0','10352-3','Bacteria identified in Genital specimen by Aerobe culture','Bacteria Genital Aerobe Cult','MICRO',NULL),
('F8932d32b15ded31801684',1461313352578,'0','26760-9','Cannabinoids [Units/volume] in Urine','Cannabinoids Ur-aCnc','DRUG/TOX',NULL),
('f8be000a04f776e5803813',1461313683674,'0','24312-1','Treponema pallidum Ab [Presence] in Serum by Agglutination','T pallidum Ab Ser Ql Aggl','MICRO',NULL),
('F8c5c71bd2fe5254102834',1461313531410,'0','31156-3','Hemoglobin Barts/Hemoglobin.total in Blood','Hgb Barts MFr Bld','HEM/BC',NULL),
('f8cdfbe12ee28f06201413',1461313311056,'0','2761-5','Phenylketones [Presence] in Blood','Phenylketones Bld Ql','CHEM',NULL),
('F8f5e3c076989ef5701584',1461313337116,'0','6075-6','Cladosporium herbarum IgE Ab [Units/volume] in Serum','C herbarum IgE Qn','ALLERGY',NULL),
('f9177e79be5b18e6003313',1461313606315,'0','6021-0','Apple IgE Ab [Units/volume] in Serum','Apple IgE Qn','ALLERGY',NULL),
('f92dbd841839dfe9501113',1461313264109,'0','10524-7','Microscopic observation [Identifier] in Cervix by Cyto stain','Cyto Cervix','CYTO',NULL),
('f939ce9f1d6c23c7601513',1461313326385,'0','6025-1','Aspergillus fumigatus IgE Ab [Units/volume] in Serum','A fumigatus IgE Qn','ALLERGY',NULL),
('f94ed262c0ac534d002213',1461313434649,'0','2466-1','IgG subclass 1 [Mass/volume] in Serum','IgG1 Ser-mCnc','CHEM',NULL),
('f95c42e15f16a19bd02263',1461313442597,'0','6556-5','Streptococcus pyogenes Ag [Presence] in Throat by Immunoassay','S pyo Ag Throat Ql EIA','MICRO',NULL),
('F95ef82b67fcb43d903584',1461313648171,'0','71797-5','Protoporphyrin.zinc [Moles/volume] in Red Blood Cells','ZPP RBC-sCnc','CHEM',NULL),
('F99b30a6273c2a4060534',1461313174326,'0','890-4','Blood group antibody screen [Presence] in Serum or Plasma','Bld gp Ab Scn SerPl Ql','BLDBK',NULL),
('F9b4c8641ffaf8ae503534',1461313640182,'0','47364-5','Hepatitis B virus surface Ag [Presence] in Serum from donor by Immunoassay','HBV surface Ag Ser Donr Ql EIA','MICRO',NULL),
('Fa4631bee91e62de802034',1461313406544,'0','2026-3','\"Carbon dioxide',' total [Moles/volume] in Arterial blood\"','CO2 BldA-sCnc',NULL),
('Fa4d8aa2b42f3214c03184',1461313585953,'0','35732-7','Histoplasma capsulatum H Ab [Presence] in Serum by Immune diffusion (ID)','H capsul H Ab Ser Ql ID','MICRO',NULL),
('Fa7022f894252ae8603984',1461313710349,'0','20652-4','Ornithine [Moles/volume] in Serum or Plasma','Ornithine SerPl-sCnc','CHEM',NULL),
('Fa99b0430bb0ccec501634',1461313344480,'0','14731-4','Folate [Moles/volume] in Red Blood Cells','Folate RBC-sCnc','CHEM',NULL),
('Fabe57b1cb207576e01234',1461313283442,'0','21299-3','Gestational age method','GA method','OB.US',NULL),
('fac0147a9fde0e3dd02163',1461313426652,'0','9780-8','Spermatozoa [#/volume] in Semen','Sperm # Smn','FERT',NULL),
('fae38853caad9def503863',1461313691688,'0','20649-0','Leucine [Moles/volume] in Serum or Plasma','Leucine SerPl-sCnc','CHEM',NULL),
('fb073b17807675ebb01813',1461313372319,'0','5177-1','Helicobacter pylori IgM Ab [Units/volume] in Serum by Immunoassay','H pylori IgM Ser EIA-aCnc','MICRO',NULL),
('fb32b2a5f8ed2c0e302313',1461313450078,'0','26523-1','Promyelocytes [#/volume] in Blood','Promyelocytes # Bld','HEM/BC',NULL),
('fb737f0772cb973cd04213',1461313746093,'0','33569-5','Sjogrens syndrome-A extractable nuclear Ab [Units/volume] in Serum by Immunoassay','ENA SS-A Ab Ser EIA-aCnc','SERO',NULL),
('fb85be68779c5e37101913',1461313387531,'0','18983-7','Streptomycin.high potency [Susceptibility]','Streptomycin High Pot Susc Islt','ABXBACT',NULL),
('Fba7ebc6b1c67a47b02134',1461313422364,'0','19295-5','Opiates [Presence] in Urine by Screen method','Opiates Ur Ql Scn','DRUG/TOX',NULL),
('fbb6af478c3f11f5e0713',1461313201989,'0','15198-5','Macrocytes [Presence] in Blood by Automated count','Macrocytes Bld Ql Auto','HEM/BC',NULL),
('Fbbcbd631d1271b6001334',1461313299013,'0','36916-5','Immunoglobulin light chains.kappa.free [Mass/volume] in Serum','Kappa LC Free Ser-mCnc','CHEM',NULL),
('Fbbec69bb97d82f330834',1461313220690,'0','2524-7','Lactate [Moles/volume] in Serum or Plasma','Lactate SerPl-sCnc','CHEM',NULL),
('fbd19dae674e092f901463',1461313318612,'0','802-9','Spherocytes [Presence] in Blood by Light microscopy','Spherocytes Bld Ql Smear','HEM/BC',NULL),
('Fbff5504fecfd157201284',1461313291173,'0','17791-5','Sjogrens syndrome-B extractable nuclear Ab [Units/volume] in Serum','ENA SS-B Ab Ser-aCnc','SERO',NULL),
('Fc125146606b4f64102734',1461313515566,'0','24115-8','Epstein Barr virus capsid IgM Ab [Presence] in Serum by Immunoassay','EBV VCA IgM Ser Ql EIA','MICRO',NULL),
('Fc2975399331708c30884',1461313228435,'0','749-2','Myelocytes/100 leukocytes in Blood by Manual count','Myelocytes NFr Bld Manual','HEM/BC',NULL),
('fc2fea9299fb0116d0763',1461313209818,'0','2111-3','Choriogonadotropin.beta subunit [Moles/volume] in Serum or Plasma','B-HCG SerPl-sCnc','CHEM',NULL),
('fc4e8c594545d373c04113',1461313730840,'0','10380-4','Stomatocytes [Presence] in Blood by Light microscopy','Stomatocytes Bld Ql Smear','HEM/BC',NULL),
('fc8fa79e33ed6e87503763',1461313675843,'0','65754-4','Skin Pathology biopsy report','Skin Path Bx report','PATH',NULL),
('Fc992524ed3f26e0e0484',1461313166312,'0','20507-0','Reagin Ab [Presence] in Serum by RPR','RPR Ser Ql','MICRO',NULL),
('fce9f44718c095a0103713',1461313668162,'0','6460-0','Bacteria identified in Sputum by Culture','Bacteria Spt Cult','MICRO',NULL),
('fcec55ce70da7e07a01563',1461313333733,'0','26466-3','Leukocytes [#/volume] in Body fluid','WBC # Fld','HEM/BC',NULL),
('Fcf46c4f24757609804034',1461313718063,'0','15568-9','Soybean IgE Ab RAST class in Serum','Soybean IgE RAST Ql','ALLERGY',NULL),
('fd172f06f7d338b6202613',1461313496853,'0','6891-6','Testosterone.bioavailable/Testosterone.total in Serum or Plasma','Testost Bioavail MFr SerPl','CHEM',NULL),
('Fd2a6b10f25a1797303634',1461313655935,'0','25630-5','Parvovirus B19 IgG Ab [Titer] in Serum','B19V IgG Titr Ser','MICRO',NULL),
('fd3a88535959a22c303013',1461313559031,'0','17284-1','Mitochondria Ab [Presence] in Serum by Immunofluorescence','Mitochondria Ab Ser Ql IF','SERO',NULL),
('fd4f652b2c1df248b01763',1461313364572,'0','7792-5','Dohle body [Presence] in Blood by Light microscopy','Dohle Bod Bld Ql Smear','HEM/BC',NULL),
('fd58f77548632e3ba03363',1461313614139,'0','15643-0','Clam IgE Ab RAST class in Serum','Clam IgE RAST Ql','ALLERGY',NULL),
('Fd6bbeedd288034d803684',1461313663441,'0','10386-1','Albumin given [Volume]','Albumin Gvn Vol','BLDBK',NULL),
('fd7ea4d20d988271e01063',1461313255764,'0','29571-7','Phenylalanine [Presence] in Dried blood spot','Phe DBS Ql','CHEM',NULL),
('fd8185e340fbd97120263',1461313131419,'0','10834-0','Globulin [Mass/volume] in Serum by calculation','Globulin Ser Calc-mCnc','CHEM',NULL),
('Fd9d77acb6316602701734',1461313360668,'0','20444-6','Herpes simplex virus 1+2 DNA [Presence] in Unspecified specimen by Probe and target amplification method','HSV1+2 DNA XXX Ql PCR','MICRO',NULL),
('Fda5510577d5e7fea0934',1461313235931,'0','13955-0','Hepatitis C virus Ab [Presence] in Serum or Plasma by Immunoassay','HCV Ab SerPl Ql EIA','MICRO',NULL),
('fdd612239393b1fbb0313',1461313139025,'0','11556-8','Oxygen [Partial pressure] in Blood','pO2 Bld','CHEM',NULL),
('Fdd761b1a97ab10e703134',1461313577881,'0','41479-7','BK virus DNA [#/volume] (viral load) in Serum or Plasma by Probe and target amplification method','BKV DNA # SerPl PCR','MICRO',NULL),
('Fdde8e45bc6a7eceb03934',1461313702527,'0','4991-6','Borrelia burgdorferi DNA [Presence] in Unspecified specimen by Probe and target amplification method','B burgdor DNA XXX Ql PCR','MICRO',NULL),
('Fde7fd2626d113e670584',1461313181732,'0','14930-2','Triiodothyronine (T3) [Moles/volume] in Serum or Plasma','T3 SerPl-sCnc','CHEM',NULL),
('fdfe9a4ea0e3b429902663',1461313504293,'0','9661-0','HIV 1 gp120 Ab [Presence] in Serum by Immunoblot (IB)','HIV1 gp120 Ab Ser Ql IB','MICRO',NULL),
('fe07c2864be8a03c30613',1461313186470,'0','29265-6','Calcium [Moles/volume] corrected for albumin in Serum or Plasma','Calcium Album cor SerPl-sCnc','CHEM',NULL),
('fe07ccfe2e9a10b6503063',1461313566868,'0','14622-5','Ascorbate [Moles/volume] in Serum or Plasma','Vit C SerPl-sCnc','CHEM',NULL),
('Fe189068c770bd74802084',1461313414442,'0','6178-8','Mountain Juniper IgE Ab [Units/volume] in Serum','Mt Juniper IgE Qn','ALLERGY',NULL),
('Fe283b515153ea14102484',1461313476788,'0','5127-6','Cytomegalovirus IgM Ab [Titer] in Serum by Immunofluorescence','CMV IgM Titr Ser IF','MICRO',NULL),
('fe4e71740e774252801013',1461313248016,'0','18919-1','Erythromycin [Susceptibility]','Erythromycin Susc Islt','ABXBACT',NULL),
('g6847118e67bd954f03914',1461313699327,'0','8072-1','Insulin Ab [Units/volume] in Serum','Insulin Ab Ser-aCnc','SERO',NULL),
('G6a91ecc453d4740d02937',1461313547130,'0','25296-5','Streptococcus pneumoniae 51 IgG Ab [Mass/volume] in Serum','S pneum51 IgG Ser-mCnc','MICRO',NULL),
('g6bfd471c1d05be5d01664',1461313349620,'0','6110-1','English Plantain IgE Ab [Units/volume] in Serum','Engl Plantain IgE Qn','ALLERGY',NULL),
('g6dace886db07f3df03664',1461313660532,'0','29675-6','Parvovirus B19 IgG Ab [Presence] in Serum','B19V IgG Ser Ql','MICRO',NULL),
('G6dfaea18691aad3002987',1461313555070,'0','14288-5','Carnitine [Moles/volume] in Serum or Plasma','Carnitine SerPl-sCnc','CHEM',NULL),
('G6e225cfc9c468bd302287',1461313446241,'0','19108-0','Histoplasma capsulatum Ag [Presence] in Serum','H capsul Ag Ser Ql','MICRO',NULL),
('g6eb69a82aac09b0603964',1461313707140,'0','20655-7','Proline [Moles/volume] in Serum or Plasma','Proline SerPl-sCnc','CHEM',NULL),
('g6fae65584a54259303164',1461313582827,'0','6230-7','Rice IgE Ab [Units/volume] in Serum','Rice IgE Qn','ALLERGY',NULL),
('G70ed94fc9bdd5e5d0237',1461313127132,'0','26450-7','Eosinophils/100 leukocytes in Blood','Eosinophil NFr Bld','HEM/BC',NULL),
('G70f7e47035d9b2a103487',1461313633027,'0','19768-1','Reviewing cytologist of results','Reviewing cytologist','CYTO',NULL),
('G713da3fa187fbeb40787',1461313213620,'0','2874-6','Gamma globulin [Mass/volume] in Serum or Plasma by Electrophoresis','Gamma glob SerPl Elph-mCnc','CHEM',NULL),
('G77f150d9e18f771601937',1461313391743,'0','7291-8','Whole Egg IgE Ab [Units/volume] in Serum','Whole Egg IgE Qn','ALLERGY',NULL),
('G78e5733adbfb11f80737',1461313205415,'0','42931-6','Chlamydia trachomatis rRNA [Presence] in Urine by Probe and target amplification method','C trach rRNA Ur Ql PCR','MICRO',NULL),
('g7a2947f03daa32250564',1461313178732,'0','48346-1','HIV 1+O+2 Ab [Units/volume] in Serum or Plasma','HIV 1+O+2 Ab SerPl-aCnc','MICRO',NULL),
('g7a47edca6f9736460814',1461313217772,'0','18955-5','Nitrofurantoin [Susceptibility]','Nitrofurantoin Susc Islt','ABXBACT',NULL),
('g7de776ee6dc6de6601614',1461313341463,'0','11153-4','Hematocrit [Volume Fraction] of Body fluid','Hct VFr Fld','HEM/BC',NULL),
('g7ed0b25b07dc536d0214',1461313123829,'0','14646-4','Cholesterol in HDL [Moles/volume] in Serum or Plasma','HDLc SerPl-sCnc','CHEM',NULL),
('g7f99b4b17a920ccd01264',1461313288197,'0','13502-0','Borrelia burgdorferi Ab.IgG band pattern [interpretation] in Serum by Immunoblot (IB)','B burgdor IgG Patrn Ser IB-Imp','MICRO',NULL),
('g800027f92d6fc7f30514',1461313171034,'0','30313-1','Hemoglobin [Mass/volume] in Arterial blood','Hgb BldA-mCnc','HEM/BC',NULL),
('g881548940b3a0af20464',1461313163178,'0','27045-4','Microscopic exam [interpretation] of Urine by Cytology','Microscopic Ur-Imp','CYTO',NULL),
('G89812072fd81f15f0387',1461313151009,'0','14630-8','Bilirubin.indirect [Moles/volume] in Serum or Plasma','Bilirub Indirect SerPl-sCnc','CHEM',NULL),
('g89fdb9687e14f43d02514',1461313481184,'0','33247-8','Weight of Sweat','Specimen wt Sweat Qn','SPEC',NULL),
('G8c6d3b2ab3cc094202187',1461313430346,'0','5274-6','Parvovirus B19 IgM Ab [Units/volume] in Serum by Immunoassay','B19V IgM Ser EIA-aCnc','MICRO',NULL),
('g8d242c26434997500914',1461313233031,'0','3150-0','Inhaled oxygen concentration','Inhaled O2 concentration','CLIN',NULL),
('g8fb0afb41391de5b02114',1461313418747,'0','20573-2','Histoplasma capsulatum mycelial phase Ab [Titer] in Serum by Complement fixation','H capsul Myc Ab Titr Ser CF','MICRO',NULL),
('g91cac9904f7bd96501214',1461313279933,'0','2880-3','Protein [Mass/volume] in Cerebral spinal fluid','Prot CSF-mCnc','CHEM',NULL),
('g935551f14cf4369402464',1461313473362,'0','38505-4','Thyroglobulin recovery in Serum or Plasma','Thyroglob Recovery MFr SerPl','CHEM',NULL),
('g94a8163d5d4cd76f03264',1461313598869,'0','47383-5','Nuclear Ab [Presence] in Serum by Immunoassay','ANA Ser Ql EIA','SERO',NULL),
('g96201d0c4052218d02914',1461313543746,'0','13358-7','Collection time of Semen','Collect Tme Smn','SPEC',NULL),
('G98f1c22db73baaed0687',1461313198095,'0','19659-2','Phencyclidine [Presence] in Urine by Screen method','PCP Ur Ql Scn','DRUG/TOX',NULL),
('g9925c0a8ead2dbb703564',1461313645112,'0','49295-9','Protein Fractions [interpretation] in Cerebral spinal fluid by Electrophoresis Narrative','Prot Pattern CSF Elph-Imp','CHEM',NULL),
('g9bf90775411de5960964',1461313240569,'0','34148-7','Borrelia burgdorferi IgG+IgM Ab [Units/volume] in Serum','B burgdor IgG+IgM Ser-aCnc','MICRO',NULL),
('G9bff7c1c366daadf0287',1461313135298,'0','5804-0','Protein [Mass/volume] in Urine by Test strip','Prot Ur Strip-mCnc','UA',NULL),
('G9e25de6c105b88c401137',1461313267632,'0','2639-3','Myoglobin [Mass/volume] in Serum or Plasma','Myoglobin SerPl-mCnc','CHEM',NULL),
('G9e47efa7e42f617302637',1461313500397,'0','33393-0','Coarse Granular Casts [#/area] in Urine sediment by Microscopy low power field','Coarse Gran Casts #/area UrnS LPF','UA',NULL),
('g9f28efac38681f2102864',1461313536081,'0','10863-9','Endomysium IgA Ab [Titer] in Serum','Endomysium IgA Titr Ser','SERO',NULL),
('Ga1ae48c88303037503437',1461313625597,'0','17395-5','Oxymorphone [Mass/volume] in Urine by Confirmatory method','Oxymorphone Ur Cfm-mCnc','DRUG/TOX',NULL),
('ga35b2036522b63d402414',1461313465781,'0','8216-4','Opiates [Presence] in Meconium by Screen method','Opiates Mec Ql Scn','DRUG/TOX',NULL),
('ga587f4c1352ca0950414',1461313155405,'0','8310-5','Body temperature','Body temperature','BDYTMP.ATOM',NULL),
('Ga64c2f4b95487e8802687',1461313508345,'0','1869-7','Apolipoprotein A-I [Mass/volume] in Serum or Plasma','Apo A-I SerPl-mCnc','CHEM',NULL),
('Ga71b2e0124f0f55801487',1461313322213,'0','21612-7','Age - Reported','Age - Reported','MISC',NULL),
('gad625fd4196c026902364',1461313457942,'0','9631-3','Viscosity of Semen','Visc Smn','SPEC',NULL),
('Gadd720d91502c0f102537',1461313485053,'0','15083-9','Normetanephrine [Moles/time] in 24 hour Urine','Normetanephrine 24h Ur-sRate','CHEM',NULL),
('Gaf3f64c4ed8d457a01887',1461313383920,'0','13438-7','Protein Fractions [interpretation] in Urine by Electrophoresis','Prot Pattern Ur Elph-Imp','CHEM',NULL),
('Gb305943bae447fec03087',1461313570871,'0','781-5','Promyelocytes [#/volume] in Blood by Manual count','Promyelocytes # Bld Manual','HEM/BC',NULL),
('Gb3b9e6053f528e540637',1461313189948,'0','22634-0','Pathology report gross observation Narrative','Path report.gross Spec','TUMRRGT',NULL),
('Gb52451991dfeddae03787',1461313679654,'0','19125-4','Meconium [Presence] in Amniotic fluid','Meconium Amn Ql','CHEM',NULL),
('gb70c7e3035147ed703614',1461313652551,'0','31036-7','Gatifloxacin [Susceptibility] by Minimum inhibitory concentration (MIC)','Gatifloxacin Islt MIC','ABXBACT',NULL),
('gb95c28d1f200811304064',1461313723144,'0','49838-6','Neural tube defect risk in population','Neural tube defect risk pop','CHEM',NULL),
('gb9fdbab61538367002064',1461313411558,'0','2748-2','pH of Body fluid','pH Fld','CHEM',NULL),
('Gba42b368c5b5b14d01787',1461313368517,'0','13046-8','Lymphocytes Variant/100 leukocytes in Blood','Variant Lymphs NFr Bld','HEM/BC',NULL),
('gbb312c40c81c5a2403514',1461313637364,'0','6220-8','Potato IgE Ab [Units/volume] in Serum','Potato IgE Qn','ALLERGY',NULL),
('Gbb7dd84187d48f0104187',1461313742240,'0','5795-0','Hippurate crystals [Presence] in Urine sediment by Light microscopy','Hippurate Cry UrnS Ql Micro','UA',NULL),
('gbf5f04ab1e43bc9a01364',1461313303760,'0','23811-3','Alpha-1-Fetoprotein [Multiple of the median] adjusted in Serum or Plasma','AFP adj MoM SerPl','CHEM',NULL),
('Gc2bcb935848de39f03837',1461313687543,'0','20643-3','Glutamine [Moles/volume] in Serum or Plasma','Glutamine SerPl-sCnc','CHEM',NULL),
('gc58b844bfddf8a2402014',1461313403343,'0','26524-9','Promyelocytes/100 leukocytes in Blood','Promyelocytes NFr Bld','HEM/BC',NULL),
('Gc67af7ce8d5b6d7601437',1461313314793,'0','6276-0','Wheat IgE Ab [Units/volume] in Serum','Wheat IgE Qn','ALLERGY',NULL),
('Gc67cc7e4aa61602c02587',1461313492466,'0','7691-9','Scallop IgE Ab [Units/volume] in Serum','Scallop IgE Qn','ALLERGY',NULL),
('Gc7b571b176d0dc4804087',1461313726395,'0','1926-5','Base excess in Capillary blood','Base excess BldC-sCnc','CHEM',NULL),
('Gca9721f84de5eb9d01837',1461313376147,'0','32286-7','Hepatitis C virus genotype [Identifier] in Serum or Plasma by Probe and target amplification method','HCV Gentyp SerPl PCR','MICRO',NULL),
('Gcd0f3ab37872b12a01037',1461313252053,'0','13518-6','Lymphocytes Variant/100 leukocytes in Body fluid by Manual count','Variant Lymphs NFr Fld Manual','HEM/BC',NULL),
('Gcf7cff0844cbf50b04137',1461313734459,'0','25886-3','Creatinine [Moles/volume] in 24 hour Urine','Creat 24h Ur-sCnc','CHEM',NULL),
('gd218a6edf9d3191904014',1461313714946,'0','721-1','Free Hemoglobin [Mass/volume] in Plasma','Hgb Free Plas-mCnc','HEM/BC',NULL),
('Gd437c3f9d737934e01537',1461313329846,'0','1761-6','Aldolase [Enzymatic activity/volume] in Serum or Plasma','Aldolase SerPl-cCnc','CHEM',NULL),
('Gd5938f49ce5a0c4703737',1461313671906,'0','5234-0','Jo-1 extractable nuclear Ab [Presence] in Serum by Immunoassay','ENA Jo1 Ab Ser Ql EIA','SERO',NULL),
('gd5e360ad4459121d0864',1461313225085,'0','18970-4','Piperacillin+Tazobactam [Susceptibility]','Piperacillin+Tazobac Susc Islt','ABXBACT',NULL),
('gd81f89648611180401714',1461313357733,'0','14626-6','Beta-2-Microglobulin [Moles/volume] in Serum','B2 Microglob Ser-sCnc','CHEM',NULL),
('Gd9aa5db71854173a02237',1461313438234,'0','3719-2','Lithium [Mass/volume] in Serum or Plasma','Lithium SerPl-mCnc','DRUG/TOX',NULL),
('gdc0445563e040fde03114',1461313575057,'0','40915-1','Streptococcus pneumoniae 57 IgG Ab [Mass/volume] in Serum by Immunoassay','S pneum57 IgG Ser EIA-mCnc','MICRO',NULL),
('gdcfd6dee55e936dc02764',1461313520637,'0','1857-2','Angiotensin converting enzyme [Enzymatic activity/volume] in Blood','ACE Bld-cCnc','CHEM',NULL),
('Ge0a9d283a8297e8903387',1461313617541,'0','26607-2','Cystathionine [Moles/volume] in Serum or Plasma','Cystathionin SerPl-sCnc','CHEM',NULL),
('Ge1efbc78483d968103037',1461313563041,'0','31080-5','Cannabinoids [Presence] in Meconium by Screen method','Cannabinoids Mec Ql Scn','DRUG/TOX',NULL),
('Ge20c3fe80d56bf2d01387',1461313307236,'0','4993-2','Chlamydia trachomatis rRNA [Presence] in Unspecified specimen by DNA probe','C trach rRNA XXX Ql Prb','MICRO',NULL),
('Ge34e4009463fc24001087',1461313260159,'0','30318-0','Base deficit in Blood','Base deficit Bld-sCnc','CHEM',NULL),
('ge42f60a4984443b001964',1461313395713,'0','3160-9','Volume of Semen','Specimen vol Smn','FERT',NULL),
('ge451196365cb2d0b02814',1461313528310,'0','27390-4','Streptococcus pneumoniae 19 IgG Ab [Mass/volume] in Serum','S pneum19 IgG Ser-mCnc','MICRO',NULL),
('Ge4a6680570e3a10e03337',1461313609735,'0','32109-1','Phenytoin Free [Moles/volume] in Serum or Plasma','Phenytoin Free SerPl-sCnc','DRUG/TOX',NULL),
('ge65ede7c65b4f14603214',1461313590240,'0','10728-4','Trichomonas sp identified in Genital specimen by Organism specific culture','Trichomonas Genital Cult','MICRO',NULL),
('Ge6d4f5e4d0c81bb60337',1461313143279,'0','13945-1','Erythrocytes [#/area] in Urine sediment by Microscopy high power field','RBC #/area UrnS HPF','UA',NULL),
('ge72f6fb5e56cd6dc01314',1461313296037,'0','6568-0','Trichomonas vaginalis rRNA [Presence] in Genital specimen by DNA probe','T vaginalis rRNA Genital Ql Prb','MICRO',NULL),
('ge751bb467e71ff970164',1461313115472,'0','15074-8','Glucose [Moles/volume] in Blood','Glucose Bld-sCnc','CHEM',NULL),
('H68558c815c68dd6901640',1461313345842,'0','53962-7','Alpha-1-fetoprotein.tumor marker [Mass/volume] in Serum or Plasma','AFP-TM SerPl-mCnc','CHEM',NULL),
('h6a011feaf6c6c34b03765',1461313676144,'0','15058-1','Dopamine [Moles/volume] in Urine','Dopamine Ur-sCnc','CHEM',NULL),
('H6ace3151656cdc4803590',1461313649132,'0','38390-1','Deprecated Cryptococcus neoformans Ag [Presence] in Cerebral spinal fluid','Deprecated C neoform Ag CSF Ql','MICRO',NULL),
('h6d34eb6fab9436890365',1461313147625,'0','19773-1','Recommended follow-up [Identifier] in Cervical or vaginal smear or scraping by Cyto stain','Recom F/U Cvx/Vag Cyto','CYTO',NULL),
('h6e289cac9927236702215',1461313434950,'0','6968-2','Proteinase 3 Ab [Units/volume] in Serum','Proteinase3 Ab Ser-aCnc','SERO',NULL),
('h6e814b69cca6f70b03365',1461313614365,'0','14869-2','Pathologist review of Blood tests','Path Rev Bld -Imp','BLDBK',NULL),
('h72efafb3ee4e683a0765',1461313210128,'0','2039-6','Carcinoembryonic Ag [Mass/volume] in Serum or Plasma','CEA SerPl-mCnc','CHEM',NULL),
('H77942890fc48d14402440',1461313469593,'0','44449-7','Beta 2 glycoprotein 1 IgM Ab [Units/volume] in Serum by Immunoassay','B2 Glycoprot1 IgM Ser EIA-aCnc','COAG',NULL),
('H77ed42eb6dab10ad02140',1461313423284,'0','2963-7','Somatotropin [Mass/volume] in Serum or Plasma','GH SerPl-mCnc','CHEM',NULL),
('H789bae558f4b181e01740',1461313361521,'0','7155-5','Boxelder IgE Ab [Units/volume] in Serum','Boxelder IgE Qn','ALLERGY',NULL),
('H78d4a85efe576b5303240',1461313594874,'0','2464-6','IgG [Mass/volume] in Cerebral spinal fluid','IgG CSF-mCnc','CHEM',NULL),
('h7ad1eeff727b975101565',1461313334033,'0','21440-3','Human papilloma virus 16+18+31+33+35+45+51+52+56 DNA [Presence] in Cervix by DNA probe','HPV I/H Risk DNA Cervix Ql Prb','MICRO',NULL),
('H7d4e1dbb8d9e879601590',1461313338019,'0','12248-1','Epithelial cells.renal [Presence] in Urine sediment by Light microscopy','Renal Epi Cells UrnS Ql Micro','UA',NULL),
('h7d8d29b82336416903315',1461313606549,'0','26451-5','Eosinophils/100 leukocytes in Cerebral spinal fluid','Eosinophil NFr CSF','HEM/BC',NULL),
('h7ee5775bb1044f6b01765',1461313364831,'0','2529-6','Lactate dehydrogenase [Enzymatic activity/volume] in Body fluid','LDH Fld-cCnc','CHEM',NULL),
('h803b25cdd1d8e58701815',1461313372762,'0','13516-0','Neutrophils/100 leukocytes in Cerebral spinal fluid by Manual count','Neutrophils NFr CSF Manual','HEM/BC',NULL),
('H815876b6f486e59102840',1461313532379,'0','35125-4','Hemoglobin Lepore/Hemoglobin.total in Blood','Hgb Lepore MFr Bld','HEM/BC',NULL),
('H82a82816b599b28702740',1461313516751,'0','19942-2','Oxygen gas flow setting','Gas flow.O2 setting','PULM',NULL),
('h86ea8a3698491fbf01015',1461313248501,'0','26455-6','Erythrocytes [#/volume] in Body fluid','RBC # Fld','HEM/BC',NULL),
('h8789bef0ecc157c502315',1461313450379,'0','6098-8','Dog dander IgE Ab [Units/volume] in Serum','Dog Dander IgE Qn','ALLERGY',NULL),
('h899c21afce821dfc02965',1461313551853,'0','41763-4','Rubella virus IgG Ab [Titer] in Serum','RUBV IgG Titr Ser','MICRO',NULL),
('h8d80ebc1c6d1a5c803415',1461313621987,'0','48049-1','Eosinophils [Presence] in Stool by Wright stain','Eosinophil Stl Ql Wright Stn','HEM/BC',NULL),
('H8df04426f2c590da0190',1461313119142,'0','33914-3','Glomerular filtration rate/1.73 sq M.predicted by Creatinine-based formula (MDRD)','GFR/BSA.pred SerPl MDRD-ArVRat','CHEM',NULL),
('h9061f200e782be4403065',1461313567103,'0','40527-4','Cocaine [Presence] in Meconium','Cocaine Mec Ql','DRUG/TOX',NULL),
('H9064d6f6f2b73afe03290',1461313603038,'0','41475-5','Rickettsia rickettsii IgM Ab [Presence] in Serum by Immunoassay','R rickettsi IgM Ser Ql EIA','MICRO',NULL),
('h90a12a87771b7d2003715',1461313668463,'0','20416-4','Hepatitis C virus RNA [#/volume] (viral load) in Serum or Plasma by Probe and target amplification method','HCV RNA # SerPl PCR','MICRO',NULL),
('H90a4d65a7c4f911f03140',1461313578801,'0','14194-5','Spermatozoa Progressive/100 spermatozoa in Semen','Sperm Prog NFr Smn','FERT',NULL),
('H91d77136a10a826503190',1461313586730,'0','5221-7','HIV 1 Ab [Presence] in Serum by Immunoblot (IB)','HIV1 Ab Ser Ql IB','MICRO',NULL),
('H953220b7bbbbe49904040',1461313719425,'0','16982-1','HTLV 1+2 Ab [Presence] in Serum by Immunoblot (IB)','HTLV1+2 Ab Ser Ql IB','MICRO',NULL),
('H9b93c46c1d57006402790',1461313524357,'0','48050-9','Neutrophils [Presence] in Stool by Wright stain','Neutrophils Stl Ql Wright Stn','HEM/BC',NULL),
('h9f6a714406fad92503815',1461313683983,'0','70198-7','Acetaminophen [Moles/volume] in Serum or Plasma by Screen method','Acetamin SerPl Scn-sCnc','DRUG/TOX',NULL),
('ha15413c8a204952c04165',1461313738622,'0','6437-8','Influenza virus A+B Ag [Presence] in Unspecified specimen by Immunoassay','FLUAV+FLUBV Ag XXX Ql EIA','MICRO',NULL),
('ha161f740280c060803865',1461313691955,'0','24139-8','Cockroach IgG Ab [Units/volume] in Serum','Roach IgG Qn','ALLERGY',NULL),
('Ha1782e87e8f727b10540',1461313175088,'0','30405-5','Leukocytes [#/volume] in Urine','WBC # Ur','UA',NULL),
('ha1f3dc45fdd56d6002715',1461313512724,'0','13926-1','Glutamate decarboxylase 65 Ab [Units/volume] in Serum','GAD65 Ab Ser-aCnc','SERO',NULL),
('ha54ab5fedde35d870665',1461313194327,'0','22633-2','Pathology report site of origin Narrative','Path report.site of origin Spec','TUMRRGT',NULL),
('Ha7c028f68c5685ca01290',1461313292418,'0','9594-3','Borrelia burgdorferi 45kD IgG Ab [Presence] in Serum by Immunoblot (IB)','B burgdor45kD IgG Ser Ql IB','MICRO',NULL),
('Haa257eb1e3187cca03890',1461313695341,'0','32789-0','Viscosity of Semen Qualitative','Visc Smn Ql','SPEC',NULL),
('hab41fe01e8b840ca02265',1461313442948,'0','34661-9','Actin IgG Ab [Units/volume] in Serum or Plasma','Actin IgG SerPl-aCnc','SERO',NULL),
('Had8b1b4923861b9b01340',1461313299923,'0','15120-9','Ethanol [Moles/volume] in Blood','Ethanol Bld-sCnc','DRUG/TOX',NULL),
('Hae0499b53ffe1c1902340',1461313454415,'0','32032-5','Phosphatidylserine IgG Ab [Units/volume] in Serum by Immunoassay','PS IgG Ser EIA-aCnc','COAG',NULL),
('hae39b356557545d204115',1461313731141,'0','7817-0','Borrelia burgdorferi IgG Ab [Units/volume] in Serum','B burgdor IgG Ser-aCnc','MICRO',NULL),
('haf21c6d06a8db8c203015',1461313559657,'0','16268-5','Calcium phosphate crystals [Presence] in Stone by Infrared spectroscopy','Ca Phos Cry Stone Ql IR','CHEM',NULL),
('haf2f36ad27af76570715',1461313202248,'0','33051-4','Erythrocytes [Presence] in Urine','RBC Ur Ql','UA',NULL),
('hb1ea3817bcc9095d02665',1461313504593,'0','9666-9','HIV 1 p31 Ab [Presence] in Serum by Immunoblot (IB)','HIV1 p31 Ab Ser Ql IB','MICRO',NULL),
('hb44b3010a462a97d01115',1461313264364,'0','29247-4','Sirolimus [Mass/volume] in Blood','Sirolimus Bld-mCnc','DRUG/TOX',NULL),
('Hb4f04181c90a6a710590',1461313182751,'0','5195-3','Hepatitis B virus surface Ag [Presence] in Serum','HBV surface Ag Ser Ql','MICRO',NULL),
('Hb56b1ad345fe398e02490',1461313477615,'0','7789-1','Acanthocytes [Presence] in Blood by Light microscopy','Acanthocytes Bld Ql Smear','HEM/BC',NULL),
('hbc036d073989ec840265',1461313131729,'0','39469-2','Cholesterol in LDL [Moles/volume] in Serum or Plasma by calculation','LDLc SerPl Calc-sCnc','CHEM',NULL),
('Hbc6acae6a3ec1a8701190',1461313276447,'0','21484-1','Mother\'s race','Mother\'s race','CLIN',NULL),
('hc195ce469d39f53502565',1461313489173,'0','26471-3','Leukocytes other/100 leukocytes in Blood','WBC Other NFr Bld','HEM/BC',NULL),
('Hc2364a68e12cf23e0490',1461313167281,'0','58448-2','Microalbumin ug/min [Mass/time] in 24 hour Urine','Microalbumin ug/min 24H Ur-mRate','CHEM',NULL),
('hc319b66b3eb605bd01465',1461313318922,'0','10704-5','Ova and parasites identified in Stool by Light microscopy','O+P Stl Micro','MICRO',NULL),
('Hc36e8be486c4d26802390',1461313462003,'0','21032-8','Thrombin time [interpretation] in Blood','TT Bld-Imp','COAG',NULL),
('hc38f1c68c378b2a902165',1461313426978,'0','6002-0','Platelet factor 4 [Units/volume] in Platelet poor plasma','PF4 PPP-aCnc','COAG',NULL),
('hc39088293771243c03465',1461313629585,'0','26535-5','Cortisol [Moles/volume] in Serum or Plasma --30 minutes post dose corticotropin','Cortis 30M p ACTH SerPl-sCnc','CHAL',NULL),
('Hc4085ceccf9c6d6403940',1461313703430,'0','32220-6','Liver kidney microsomal 1 Ab [Units/volume] in Serum','LKM-1 Ab Ser-aCnc','SERO',NULL),
('Hc5a9ab5d2362a26002040',1461313407455,'0','5404-9','Varicella zoster virus IgM Ab [Units/volume] in Serum by Immunoassay','VZV IgM Ser EIA-aCnc','MICRO',NULL),
('Hc714320c82819fb702090',1461313415262,'0','3663-2','Gentamicin [Mass/volume] in Serum or Plasma --peak','Gentamicin Peak SerPl-mCnc','DRUG/TOX',NULL),
('Hc921701679b0e28103640',1461313656779,'0','12229-1','Macrophages/100 leukocytes in Cerebral spinal fluid by Manual count','Macrophages NFr CSF Manual','HEM/BC',NULL),
('hc96f0ce313a1c6c80315',1461313139251,'0','22636-5','Pathology report relevant history Narrative','Path report.relevant Hx Spec','TUMRRGT',NULL),
('Hc9d3431d513d172f03990',1461313711211,'0','10853-0','Isospora belli [Presence] in Unspecified specimen by Acid fast stain.Kinyoun modified','I belli XXX Ql Acid fast Mod Kiny Stn','MICRO',NULL),
('Hca931a5d36e182e602890',1461313540186,'0','40287-5','Glucose [Moles/volume] in Serum or Plasma --1 hour post meal','Glucose 1h p meal SerPl-sCnc','CHAL',NULL),
('Hcb2c4b643ebabd790440',1461313159284,'0','20453-7','Epithelial cells [Presence] in Urine sediment by Light microscopy','Epi Cells UrnS Ql Micro','UA',NULL),
('Hcba7bf221d3353060840',1461313221700,'0','11156-7','Leukocyte morphology finding [Identifier] in Blood','WBC morph Bld','HEM/BC',NULL),
('hcbe686ef41d61a1801865',1461313380659,'0','13440-3','Immunofixation [interpretation] for Urine','Interpretation Ur IFE-Imp','CHEM',NULL),
('Hcc4ef959f807301101240',1461313284362,'0','10362-2','Endomysium IgA Ab [Presence] in Serum','Endomysium IgA Ser Ql','SERO',NULL),
('Hcf7adb950047f9530890',1461313229363,'0','32673-6','Creatine kinase.MB [Enzymatic activity/volume] in Serum or Plasma','CK MB SerPl-cCnc','CHEM',NULL),
('hd1b709a4204dbfdb01515',1461313326661,'0','21264-7','Estriol (E3).unconjugated [Multiple of the median] adjusted in Serum or Plasma','u Estriol adj MoM SerPl','CHEM',NULL),
('hd3420fa4e9ccc9aa01065',1461313256066,'0','21654-9','CFTR gene mutations found [Identifier] in Blood or Tissue by Molecular genetics method Nominal','CFTR Mut Anal Bld/T','MOLPATH.MUT',NULL),
('Hd4f9c91797aa2f2a01990',1461313399967,'0','6219-0','Pork IgE Ab [Units/volume] in Serum','Pork IgE Qn','ALLERGY',NULL),
('hd6f7b3f9ca8cbec90615',1461313186738,'0','5796-8','Hyaline casts [#/area] in Urine sediment by Microscopy low power field','Hyaline Casts #/area UrnS LPF','UA',NULL),
('Hd771ff7b4b7ae5d10140',1461313111745,'0','14682-9','Creatinine [Moles/volume] in Serum or Plasma','Creat SerPl-sCnc','CHEM',NULL),
('Hdac5af2a74320fe903540',1461313640884,'0','10622-9','Spermatozoa Normal/100 spermatozoa in Semen','Sperm Norm NFr Smn','FERT',NULL),
('hdcea5a08f1d255f802615',1461313497179,'0','11261-5','Bacteria identified in Vaginal fluid by Aerobe culture','Bacteria Vag Aerobe Cult','MICRO',NULL),
('hddf12d413b12930701415',1461313311374,'0','3779-6','Methamphetamine [Presence] in Urine','Methamphet Ur Ql','DRUG/TOX',NULL),
('hde65e48e60665cd201165',1461313272786,'0','33935-8','Cyclic citrullinated peptide IgG Ab [Units/volume] in Serum','cCP IgG Ser-aCnc','SERO',NULL),
('He0f5aee95ff7883b0940',1461313236783,'0','13451-0','Creatinine dialysis fluid clearance','Creat Cl Dial fld+SerPl-vRate','CHEM',NULL),
('he31f739849f6b25101915',1461313387773,'0','14765-2','Glucose [Moles/volume] in Serum or Plasma --3 hours post dose glucose','Glucose 3h p Glc SerPl-sCnc','CHAL',NULL),
('he3919fe56feb1edb04215',1461313746377,'0','45142-7','Sjogrens syndrome-B extractable nuclear Ab [Units/volume] in Serum by Immunoassay','ENA SS-B Ab Ser EIA-aCnc','SERO',NULL),
('He3e458cfb745a03a01690',1461313353389,'0','1795-4','Amylase [Enzymatic activity/volume] in Body fluid','Amylase Fld-cCnc','CHEM',NULL),
('I67e0f69356c7c15301095',1461313261246,'0','32693-4','Lactate [Moles/volume] in Blood','Lactate Bld-sCnc','CHEM',NULL),
('i6c77e96434b43c3203208',1461313589354,'0','28543-7','Basophils/100 leukocytes in Body fluid','Basophils NFr Fld','HEM/BC',NULL),
('I6f0dcf47850f8ed303445',1461313626759,'0','36922-3','TPMT gene mutation analysis in Blood or Tissue by Molecular genetics method Narrative','TPMT gene Mut Anal Bld/T','MOLPATH.MUT',NULL),
('I6f120b4e2fd637c601145',1461313268927,'0','35365-6','Vitamin D+Metabolites [Mass/volume] in Serum or Plasma','Vit D+metab SerPl-mCnc','CHEM',NULL),
('i6f3fe7ea9ff364d303908',1461313698366,'0','21027-8','Platelet aggregation [interpretation] in Platelet poor plasma','PA PPP-Imp','COAG',NULL),
('i72351d821a7ff4d50558',1461313177945,'0','5196-1','Hepatitis B virus surface Ag [Presence] in Serum or Plasma by Immunoassay','HBV surface Ag SerPl Ql EIA','MICRO',NULL),
('I72b78643380809a60345',1461313144758,'0','19146-0','Reference lab test results','Ref Lab Test Results','MISC',NULL),
('i77b96ed105d1740303658',1461313659630,'0','5096-3','Coccidioides immitis Ab [Titer] in Serum by Complement fixation','C immitis Ab Titr Ser CF','MICRO',NULL),
('I78bec82a547c796e02695',1461313509765,'0','2998-3','Thiamine [Mass/volume] in Blood','Vit B1 Bld-mCnc','CHEM',NULL),
('I79702b25e69ce1680395',1461313152037,'0','2947-0','Sodium [Moles/volume] in Blood','Sodium Bld-sCnc','CHEM',NULL),
('i7afe01ed261231f302458',1461313472442,'0','7369-2','Perennial rye grass IgE Ab [Units/volume] in Serum','Per rye grass IgE Qn','ALLERGY',NULL),
('I7b0a3c9fa8f23c9402995',1461313556323,'0','42810-2','Hemoglobin [Entitic mass] in Reticulocytes','Hgb Retic Qn','HEM/BC',NULL),
('I7d5bc6753e46747403795',1461313681057,'0','7415-3','Cladosporium sphaerospermum IgE Ab [Units/volume] in Serum','C sphaerospermum IgE Qn','ALLERGY',NULL),
('I7db7282afd222fb802945',1461313548693,'0','27392-0','Streptococcus pneumoniae 9 IgG Ab [Mass/volume] in Serum','S pneum9 IgG Ser-mCnc','MICRO',NULL),
('I7e0deec84caeab5002195',1461313431941,'0','13990-7','Alpha 1 globulin/Protein.total in Urine by Electrophoresis','Alpha1 Glob MFr Ur Elph','CHEM',NULL),
('i7eefd32f1efe68aa0508',1461313169923,'0','933-2','Blood product type','Bld Prod Typ BPU','BLDBK',NULL),
('i81e10df46e63223b01658',1461313348759,'0','20512-0','Turbidity of Cerebral spinal fluid Qualitative','Turbidity CSF Ql','SPEC',NULL),
('i87425ff9ac1a7a2801758',1461313364120,'0','13954-3','Hepatitis B virus e Ag [Presence] in Serum by Immunoassay','HBV e Ag Ser Ql EIA','MICRO',NULL),
('I8856c2d280b9f93d01895',1461313384940,'0','3665-7','Gentamicin [Mass/volume] in Serum or Plasma --trough','Gentamicin Trough SerPl-mCnc','DRUG/TOX',NULL),
('I889df311b98a03e10995',1461313245256,'0','543-9','Mycobacterium sp identified in Unspecified specimen by Organism specific culture','Mycobacterium XXX Cult','MICRO',NULL),
('i89509e492505073701958',1461313394802,'0','12278-8','Neutrophils.band form/100 leukocytes in Cerebral spinal fluid by Manual count','Neuts Band NFr CSF Manual','HEM/BC',NULL),
('I895c86ab54a364e501045',1461313253173,'0','33255-1','Cell Fractions/Differential [interpretation] in Blood','Cell Fract Bld-Imp','HEM/BC',NULL),
('i89ecd864274bff4e02758',1461313519693,'0','5863-6','Influenza virus A Ag [Presence] in Unspecified specimen by Immunofluorescence','FLUAV Ag XXX Ql IF','MICRO',NULL),
('i8a197b75a8c7a67602858',1461313535179,'0','13984-0','Alpha 1 globulin/Protein.total in 24 hour Urine by Electrophoresis','Alpha1 Glob 24h MFr Ur Elph','CHEM',NULL),
('I8bb95c01d7824eb503745',1461313673201,'0','20431-3','Microscopic observation [Identifier] in Unspecified specimen by Smear','Smear XXX','MICRO',NULL),
('I8dda1e17465acb1f02295',1461313447461,'0','26518-1','Polymorphonuclear cells/100 leukocytes in Body fluid','Polys NFr Fld','HEM/BC',NULL),
('I901ab526b2efcd8e01445',1461313316021,'0','25160-3','Granular casts [Presence] in Urine sediment by Light microscopy','Gran Casts UrnS Ql Micro','UA',NULL),
('i90940c557c811cbd04008',1461313714002,'0','26927-4','Herpes simplex virus 2 IgM Ab [Titer] in Serum by Immunofluorescence','HSV2 IgM Titr Ser IF','MICRO',NULL),
('I913c44d2f3e67e0b03695',1461313665062,'0','70213-4','Nordiazepam [Moles/volume] in Urine by Confirmatory method','Nordiazepam Ur Cfm-sCnc','DRUG/TOX',NULL),
('I91859dae25dda23f03395',1461313618761,'0','14721-5','Ethylene glycol [Moles/volume] in Serum or Plasma','Ethylene Glycol SerPl-sCnc','DRUG/TOX',NULL),
('i91daf220da1e0e7c03608',1461313651698,'0','17852-5','Ureaplasma urealyticum [Presence] in Unspecified specimen by Organism specific culture','U urealyticum XXX Ql Cult','MICRO',NULL),
('I91de944110df4ea60695',1461313199124,'0','50387-0','Chlamydia trachomatis rRNA [Presence] in Cervix by Probe and target amplification method','C trach rRNA Cervix Ql PCR','MICRO',NULL),
('i92c05a67946b761f0458',1461313162158,'0','2753-2','pH of Serum or Plasma','pH SerPl','CHEM',NULL),
('i92f8a6329a802ccf01258',1461313287311,'0','2695-5','Osmolality of Urine','Osmolality Ur','CHEM',NULL),
('I95f9ce6d672b6e720245',1461313128110,'0','6301-6','INR in Platelet poor plasma by Coagulation assay','INR PPP','COAG',NULL),
('i9612df7825c2b2da0908',1461313232053,'0','4092-3','Vancomycin [Mass/volume] in Serum or Plasma --trough','Vancomycin Trough SerPl-mCnc','DRUG/TOX',NULL),
('i9a724c4ceadcfaf70158',1461313114544,'0','786-4','Erythrocyte mean corpuscular hemoglobin concentration [Mass/volume] by Automated count','MCHC RBC Auto-mCnc','HEM/BC',NULL),
('i9a9859bdb57cd50802908',1461313542743,'0','22086-3','Aspergillus niger Ab [Presence] in Serum','A niger Ab Ser Ql','MICRO',NULL),
('i9d4ff30c0f927abf03258',1461313597950,'0','20427-1','Acetylcholine receptor Ab [Moles/volume] in Serum','AChR Ab Ser-sCnc','SERO',NULL),
('i9dd093435cca1e8d03958',1461313706221,'0','6029-3','Aureobasidium pullulans IgE Ab [Units/volume] in Serum','A pullulans IgE Qn','ALLERGY',NULL),
('Ia144f76e7300fe1004195',1461313743501,'0','11043-7','Cryofibrinogen [Presence] in Plasma','Cryofib Plas Ql','CHEM',NULL),
('ia1a6f0970527168b01308',1461313295101,'0','9588-5','Borrelia burgdorferi 18kD IgG Ab [Presence] in Serum by Immunoblot (IB)','B burgdor18kD IgG Ser Ql IB','MICRO',NULL),
('Ia2104b40eee83c950645',1461313191477,'0','19080-1','Choriogonadotropin [Units/volume] in Serum or Plasma','HCG SerPl-aCnc','CHEM',NULL),
('Ia33649b27fe3472903095',1461313572282,'0','32787-4','Neutrophil cytoplasmic Ab.perinuclear [Titer] in Serum','p-ANCA Titr Ser','SERO',NULL),
('ia7b5c751e697046e03558',1461313643868,'0','29280-5','Fibrin D-dimer [Presence] in Platelet poor plasma by Latex agglutination','D Dimer PPP Ql LA','COAG',NULL),
('Iab89b699429f94cd04145',1461313735538,'0','5798-4','Leucine crystals [Presence] in Urine sediment by Light microscopy','Leucine Cry UrnS Ql Micro','UA',NULL),
('iae34e897f160b12501358',1461313302955,'0','7885-7','Epstein Barr virus capsid IgG Ab [Units/volume] in Serum','EBV VCA IgG Ser-aCnc','MICRO',NULL),
('iaea6611ee306652401608',1461313340660,'0','2742-5','Angiotensin converting enzyme [Enzymatic activity/volume] in Serum or Plasma','ACE SerPl-cCnc','CHEM',NULL),
('Ib393cdd0c1c63c2901495',1461313323376,'0','10366-3','Cotinine [Mass/volume] in Urine','Cotinine Ur-mCnc','DRUG/TOX',NULL),
('ib50a2c7eb6491a5903508',1461313636261,'0','15013-6','Alkaline phosphatase.bone/Alkaline phosphatase.total in Serum or Plasma','ALP Bone CFr SerPl','CHEM',NULL),
('ib50d58042b9f459f02358',1461313457048,'0','17851-7','Herpes simplex virus 2 IgG Ab [Presence] in Serum','HSV2 IgG Ser Ql','MICRO',NULL),
('ib5ddddeb7352bcde03158',1461313581950,'0','70217-5','Thyroxine (
T4) free [Moles/volume] in Serum or Plasma by Dialysis','T4 Free SerPl Dialy-sCnc','CHEM',NULL),
('ib89c95ce1de8203a04058',1461313722316,'0','18743-5','Autopsy report','','ATTACH.CLINRPT',NULL),
('Ibb07a0a7232164bf01795',1461313369737,'0','5353-8','Sjogrens syndrome-B extractable nuclear Ab [Presence] in Serum by Immunoassay','ENA SS-B Ab Ser Ql EIA','SERO',NULL),
('ibd7118c6ddf40c6901208',1461313279105,'0','11011-4','Hepatitis C virus RNA [Units/volume] (viral load) in Serum or Plasma by Probe and target amplification method','HCV RNA SerPl PCR-aCnc','MICRO',NULL),
('Ibdbaf5a9585d6e9201545',1461313331091,'0','30083-0','Epstein Barr virus nuclear IgG Ab [Units/volume] in Serum by Immunoassay','EBV NA IgG Ser EIA-aCnc','MICRO',NULL),
('Ibe63ab74500ddb3e01845',1461313377576,'0','17949-9','Fungus # 4 identified in Unspecified specimen by Culture','Fungus XXX Cult org #4','MICRO',NULL),
('Ic108620b6e8194a902645',1461313501634,'0','14712-4','Epinephrine [Moles/time] in 24 hour Urine','Epineph 24h Ur-sRate','CHEM',NULL),
('Ic284eb81a12a862103045',1461313564136,'0','5820-6','WBC casts [#/area] in Urine sediment by Microscopy low power field','WBC Casts #/area UrnS LPF','UA',NULL),
('ic558014b75b59ccd01708',1461313356514,'0','30170-5','American Cockroach IgE Ab [Units/volume] in Serum','Amer Roach IgE Qn','ALLERGY',NULL),
('ic81e61d9659dbb2102408',1461313464970,'0','8169-5','Tetrahydrocannabinol [Presence] in Meconium by Screen method','THC Mec Ql Scn','DRUG/TOX',NULL),
('Ica1615dce8b5ea1801945',1461313393029,'0','20460-2','Cefuroxime Oral [Susceptibility] by Minimum inhibitory concentration (MIC)','Cefuroxime Oral Islt MIC','ABXBACT',NULL),
('Ica925a897c232be90745',1461313207044,'0','779-9','Poikilocytosis [Presence] in Blood by Light microscopy','Poikilocytosis Bld Ql Smear','HEM/BC',NULL),
('icb913a9c052f14150408',1461313154477,'0','44915-7','Cholesterol in LDL/Cholesterol in HDL [Molar ratio] in Serum or Plasma','LDLc/HDLc SerPl-sRto','CHEM',NULL),
('Icbd470e08ce0039704095',1461313727598,'0','5819-8','Waxy casts [#/area] in Urine sediment by Microscopy low power field','Waxy Casts #/area UrnS LPF','UA',NULL),
('icf2c57681d66fcef0958',1461313239859,'0','46736-5','Fatty acid oxidation defects newborn screen interpretation','FOD DBS-Imp','CHEM',NULL),
('id11d62025d82b0cd0858',1461313224349,'0','13965-9','Homocysteine [Moles/volume] in Serum or Plasma','Homocysteine SerPl-sCnc','CHEM',NULL),
('id2741f9a3a10a1f802058',1461313410647,'0','13169-8','Immunoelectrophoresis [interpretation] for Serum or Plasma','Interpretation SerPl IEP-Imp','CHEM',NULL),
('Id311579bf0306e4601395',1461313308482,'0','46740-7','Hemoglobin disorders newborn screen interpretation','Hemoglobin disorders DBS-Imp','CHEM',NULL),
('id53f9df37508414d02008',1461313402541,'0','8149-7','Amphetamines [Presence] in Serum or Plasma by Screen method','Amphetamines SerPl Ql Scn','DRUG/TOX',NULL),
('id6dedf7a53ff88e502808',1461313527398,'0','40913-6','Streptococcus pneumoniae 56 IgG Ab [Mass/volume] in Serum by Immunoassay','S pneum56 IgG Ser EIA-mCnc','MICRO',NULL),
('Id97a027e7175836902595',1461313493838,'0','23877-4','Anaplasma phagocytophilum IgG Ab [Titer] in Serum by Immunofluorescence','A phagocytoph IgG Titr Ser IF','MICRO',NULL),
('Id9dd9e473e754a180295',1461313136409,'0','2601-3','Magnesium [Moles/volume] in Serum or Plasma','Magnesium SerPl-sCnc','CHEM',NULL),
('Ide5d15b56947095f02545',1461313486040,'0','5356-1','Smith extractable nuclear Ab [Presence] in Serum by Immunoassay','ENA SM Ab Ser Ql EIA','SERO',NULL),
('ie00e2b21d55eb3c702508',1461313480240,'0','15761-0','Sweet gum IgE Ab RAST class in Serum','Sweet gum IgE RAST Ql','ALLERGY',NULL),
('Ie08d50a1a004b85a03345',1461313611105,'0','18182-6','Osmolality of Serum or Plasma by calculation','Osmolality SerPl Calc','CHEM',NULL),
('ie0d8d203d896abd20808',1461313216837,'0','635-3','Bacteria identified in Unspecified specimen by Anaerobe culture','Bacteria XXX Anaerobe Cult','MICRO',NULL),
('ie1f4abde101089a802108',1461313417878,'0','14912-0','Smudge cells/100 leukocytes in Blood by Manual count','Smudge Cells NFr Bld Manual','HEM/BC',NULL),
('Ie4ccde4aa778b6c102245',1461313439280,'0','32146-3','Platelets Large [Presence] in Blood by Light microscopy','Lg Platelets Bld Ql Smear','HEM/BC',NULL),
('ie4e9fe8b8a868b260208',1461313122684,'0','731-0','Lymphocytes [#/volume] in Blood by Automated count','Lymphocytes # Bld Auto','HEM/BC',NULL),
('Ie76b01d4b5f0ba4203845',1461313688789,'0','20661-5','Valine [Moles/volume] in Serum or Plasma','Valine SerPl-sCnc','CHEM',NULL),
('j680bc9b64349b14901616',1461313341772,'0','6875-9','Cancer Ag 15-3 [Units/volume] in Serum or Plasma','Cancer Ag15-3 SerPl-aCnc','CHEM',NULL),
('J6a7ad6d1961527a802243',1461313439013,'0','2468-7','IgG subclass 3 [Mass/volume] in Serum','IgG3 Ser-mCnc','CHEM',NULL),
('j6ce5f71293efd68601966',1461313396013,'0','38908-0','Poikilocytosis [Presence] in Blood by Automated count','Poikilocytosis Bld Ql Auto','HEM/BC',NULL),
('j6d4c8477591b362b0166',1461313115773,'0','4544-3','Hematocrit [Volume Fraction] of Blood by Automated count','Hct VFr Bld Auto','HEM/BC',NULL),
('J70254dd024038fc401943',1461313392720,'0','6473-3','Microscopic observation [Identifier] in Tissue by Trichrome stain','Tri Stn Tiss','MICRO',NULL),
('j70d613f47c0dbbc503216',1461313590541,'0','8118-2','CD2 cells/100 cells in Blood','CD2 Cells NFr Bld','CELLMARK',NULL),
('J74314c0475a1ac1203443',1461313626466,'0','17123-1','CD19+Lambda+ cells/100 cells in Blood','CD19+Lambda+ Cells NFr Bld','CELLMARK',NULL),
('J7487fe3d2e0aac0703693',1461313664837,'0','8220-6','Opiates [Mass/volume] in Urine','Opiates Ur-mCnc','DRUG/TOX',NULL),
('J763becb51cabfdb803793',1461313680749,'0','11559-2','Fractional oxyhemoglobin in Blood','OxyHgb MFr Bld','CHEM',NULL),
('j7671b10eb5e84af503666',1461313660833,'0','29660-8','Parvovirus B19 IgG Ab [Presence] in Serum by Immunoassay','B19V IgG Ser Ql EIA','MICRO',NULL),
('j76b5fd2cea12f1d903966',1461313707391,'0','18903-5','Chloramphenicol [Susceptibility]','Chloramphen Susc Islt','ABXBACT',NULL),
('J7a705f81e46e375704193',1461313743209,'0','27071-0','CD45 (Lymphs) cells [#/volume] in Blood','CD45 Cells # Bld','CELLMARK',NULL),
('j7b5c816644d137dc01216',1461313280392,'0','33944-0','Immunoglobulin light chains.lambda.free [Mass/volume] in Serum or Plasma','Lambda LC Free SerPl-mCnc','CHEM',NULL),
('J7d39c14f62fe282b03743',1461313672900,'0','15014-4','Alkaline phosphatase.intestinal/Alkaline phosphatase.total in Serum or Plasma','ALP Intest CFr SerPl','CHEM',NULL),
('J7e0e1525f825100802293',1461313447152,'0','32167-9','Clarity of Urine','Clarity Ur','SPEC',NULL),
('j80c514a176bda15a0816',1461313218082,'0','18481-2','Streptococcus pyogenes Ag [Presence] in Throat','S pyo Ag Throat Ql','MICRO',NULL),
('J810c8772d84d37190293',1461313136175,'0','3173-2','Activated partial thromboplastin time (aPTT) in Blood by Coagulation assay','aPTT Time Bld','COAG',NULL),
('J81ecf78a74b6465d01893',1461313384714,'0','70216-7','Salicylates [Moles/volume] in Serum or Plasma by Screen method','Salicylates SerPl Scn-sCnc','DRUG/TOX',NULL),
('j8205507da1f0dfcb01266',1461313288423,'0','11090-8','Smith extractable nuclear Ab [Units/volume] in Serum','ENA SM Ab Ser-aCnc','SERO',NULL),
('J83242cc9eaf5b70802693',1461313509432,'0','2640-1','Myoglobin [Presence] in Urine','Myoglobin Ur Ql','CHEM',NULL),
('j84ef97ddedb736da02416',1461313466007,'0','27816-8','von Willebrand factor (vWf) Ag actual/normal in Platelet poor plasma by Immunologic method','vWF Ag Act/Nor PPP Imm','COAG',NULL),
('J873cba38b071ff7803393',1461313618461,'0','698-1','Neisseria gonorrhoeae [Presence] in Unspecified specimen by Organism specific culture','N gonorrhoea XXX Ql Cult','MICRO',NULL),
('J8879ccf852f7e8c104093',1461313727298,'0','2716-9','Fractional oxyhemoglobin in Venous blood','OxyHgb MFr BldV','CHEM',NULL),
('j8abb523a2e76c60303266',1461313599178,'0','9557-0','CD2 cells [#/volume] in Blood','CD2 Cells # Bld','CELLMARK',NULL),
('J8b48f188a2c17dce0643',1461313191110,'0','11572-5','Rheumatoid factor [Units/volume] in Serum or Plasma','Rheumatoid fact SerPl-aCnc','SERO',NULL),
('J8b6cc9231f22ca4e01043',1461313252872,'0','49563-0','Troponin I.cardiac [Mass/volume] in Serum or Plasma by Detection limit <= 0.01 ng/mL','Troponin I SerPl DL<=0.01 ng/mL-mCnc','CHEM',NULL),
('j8d8a06ccd7702c2303916',1461313699628,'0','20660-7','Tyrosine [Moles/volume] in Serum or Plasma','Tyrosine SerPl-sCnc','CHEM',NULL),
('J90380b31279bf87801843',1461313376975,'0','17947-3','Fungus # 2 identified in Unspecified specimen by Culture','Fungus XXX Cult org #2','MICRO',NULL),
('j9111637944ba38de0566',1461313179040,'0','3349-8','Amphetamines [Presence] in Urine','Amphetamines Ur Ql','DRUG/TOX',NULL),
('J9159fd7a5f9e05c703343',1461313610647,'0','14083-0','Epstein Barr virus early Ab [Titer] in Serum by Immunofluorescence','EBV EA Ab Titr Ser IF','MICRO',NULL),
('j92ab705155e3ecc20466',1461313163662,'0','31100-1','Hematocrit [Volume Fraction] of Blood by Impedance','Hct VFr Bld Imped','HEM/BC',NULL),
('j93f29074207bf7fa02916',1461313544047,'0','25507-5','Pregnenolone [Moles/volume] in Serum or Plasma','Preg SerPl-sCnc','CHEM',NULL),
('J970269fb503777620243',1461313127826,'0','742-7','Monocytes [#/volume] in Blood by Automated count','Monocytes # Bld Auto','HEM/BC',NULL),
('J975b3eeb86e06c8302943',1461313548008,'0','40920-1','Streptococcus pneumoniae 8 IgG Ab [Mass/volume] in Serum by Immunoassay','S pneum8 IgG Ser EIA-mCnc','MICRO',NULL),
('j97ced2d18f8d738604016',1461313715247,'0','31209-0','Islet cell 512 Ab [Units/volume] in Serum','Islet Cell512 Ab Ser-aCnc','SERO',NULL),
('J9893e91c85319d650743',1461313206743,'0','3397-7','Cocaine [Presence] in Urine','Cocaine Ur Ql','DRUG/TOX',NULL),
('j9a7a59853ec58b0c02516',1461313481485,'0','5183-9','Hepatitis A virus Ab [Units/volume] in Serum by Immunoassay','HAV Ab Ser EIA-aCnc','MICRO',NULL),
('j9f4338bcd961719501316',1461313296413,'0','14564-9','Hemoglobin.gastrointestinal [Presence] in Stool --2nd specimen','Hemoccult sp2 Stl Ql','CHEM',NULL),
('j9ff967f7edcf6db001666',1461313349846,'0','6303-2','Dilute Russell viper venom time (dRVVT) in Platelet poor plasma by Coagulation assay','dRVV Tme Time PPP','COAG',NULL),
('Ja2bfe6a696cb1ae803043',1461313563877,'0','575-1','Fungus identified in Skin by Culture','Fungus Skin Cult','MICRO',NULL),
('ja3fd370b4ac876c20516',1461313171335,'0','10378-8','Polychromasia [Presence] in Blood by Light microscopy','Polychromasia Bld Ql Smear','HEM/BC',NULL),
('ja53b0fa35ac3812202116',1461313419056,'0','6246-3','Shrimp IgE Ab [Units/volume] in Serum','Shrimp IgE Qn','ALLERGY',NULL),
('Ja57bd891d7b3650201143',1461313268617,'0','48058-2','Fibrin D-dimer DDU [Mass/volume] in Platelet poor plasma by Immunoassay','D dimer DDU PPP EIA-mCnc','COAG',NULL),
('Ja7346adf7d401ee30343',1461313144457,'0','741-9','Microcytes [Presence] in Blood by Light microscopy','Microcytes Bld Ql Smear','HEM/BC',NULL),
('Ja8fed2cfe7264c5d03093',1461313571782,'0','25631-3','Parvovirus B19 IgM Ab [Titer] in Serum','B19V IgM Titr Ser','MICRO',NULL),
('jab1be7e67bc4a13b02366',1461313458251,'0','10585-8','Round cells [#/volume] in Semen','Round Cells # Smn','FERT',NULL),
('jac1f0831733d5a2501716',1461313358060,'0','1952-1','Beta-2-Microglobulin [Mass/volume] in Serum','B2 Microglob Ser-mCnc','CHEM',NULL),
('jac57368faba555fd0916',1461313233391,'0','1834-1','Alpha-1-Fetoprotein [Mass/volume] in Serum or Plasma','AFP SerPl-mCnc','CHEM',NULL),
('jb32a970a5ac2dd0002466',1461313474046,'0','16135-6','Beta 2 glycoprotein 1 IgG Ab [Units/volume] in Serum','B2 Glycoprot1 IgG Ser-aCnc','COAG',NULL),
('jb427b0894ec398e702016',1461313403645,'0','8234-7','Phencyclidine [Presence] in Meconium by Screen method','PCP Mec Ql Scn','DRUG/TOX',NULL),
('jb5a88dc4905dadb903616',1461313652777,'0','23871-7','Hepatitis C virus NS5 Ab [Presence] in Serum by Immunoblot (IB)','HCV NS5 Ab Ser Ql IB','MICRO',NULL),
('Jb5ba7753d4d12e7a01093',1461313261012,'0','3520-4','Cyclosporine [Mass/volume] in Blood','Cyclosporin Bld-mCnc','DRUG/TOX',NULL),
('Jb5fa2d0525194e4f02543',1461313485738,'0','15191-0','Lupus anticoagulant neutralization dilute phospholipid [Presence] in Platelet poor plasma','LAC Nt Dil PL PPP Ql','COAG',NULL),
('jb62e01f7958bce7403116',1461313575357,'0','48348-7','10-Hydroxycarbazepine [Moles/volume] in Serum or Plasma','10OH-Carbazepine SerPl-sCnc','DRUG/TOX',NULL),
('Jb95821f8515bcfff01543',1461313330765,'0','31374-2','Epstein Barr virus nuclear IgG Ab [Units/volume] in Serum','EBV NA IgG Ser-aCnc','MICRO',NULL),
('Jb95b7b5c8e40358202993',1461313556022,'0','11778-8','Delivery date Estimated','Deliv date Clin est','OB.US',NULL),
('jba265b2204a886cd03566',1461313645430,'0','43441-5','Bacteria identified in Bronchoalveolar lavage by Aerobe culture','Bacteria BAL Aerobe Cult','MICRO',NULL),
('Jbd11b52b0182863d02643',1461313501300,'0','8095-2','Smooth muscle Ab [Titer] in Serum','Smooth muscle Ab Titr Ser','SERO',NULL),
('Jbd9cc6219902292e02193',1461313431640,'0','5393-4','Treponema pallidum Ab [Presence] in Serum by Immunofluorescence','T pallidum Ab Ser Ql IF','MICRO',NULL),
('Jbeb7d6633e7599fa01793',1461313369436,'0','2614-6','Methemoglobin/Hemoglobin.total in Blood','MetHgb MFr Bld','CHEM',NULL),
('jc5e331b4ca2d635d01366',1461313304194,'0','3013-0','Thyroglobulin [Mass/volume] in Serum or Plasma','Thyroglob SerPl-mCnc','CHEM',NULL),
('jc74d901c859974bb0866',1461313225386,'0','54218-3','CD3+CD4+ (T4 helper) cells/CD3+CD8+ (T8 suppressor cells) cells [# Ratio] in Blood','CD3+CD4+ Cells/CD3+CD8+ Cells Bld','CELLMARK',NULL),
('Jc9aacdda642565080993',1461313244955,'0','7790-9','Burr cells [Presence] in Blood by Light microscopy','Burr Cells Bld Ql Smear','HEM/BC',NULL),
('jca2d82e4d6ed142102816',1461313528636,'0','27230-2','Streptococcus pneumoniae 19 IgG Ab [Mass/volume] in Serum by Immunoassay','S pneum19 IgG Ser EIA-mCnc','MICRO',NULL),
('jca78baa1e112a8e003516',1461313637641,'0','6873-4','Beta hydroxybutyrate [Moles/volume] in Serum or Plasma','B-OH-Butyr SerPl-sCnc','CHEM',NULL),
('jcf0dcf17d4d909a702766',1461313520938,'0','31797-4','Cytomegalovirus Ag [Presence] in Unspecified specimen','CMV Ag XXX Ql','MICRO',NULL),
('jcf8e3be3d0164db702866',1461313536340,'0','3830-7','Morphine [Presence] in Urine','Morphine Ur Ql','DRUG/TOX',NULL),
('jd03b60b31d7c27270416',1461313155706,'0','3040-3','Lipase [Enzymatic activity/volume] in Serum or Plasma','Lipase SerPl-cCnc','CHEM',NULL),
('jd52f2d2ed088a54302066',1461313411826,'0','26513-2','Neutrophils/100 leukocytes in Body fluid','Neutrophils NFr Fld','HEM/BC',NULL),
('Jd83e8341446b560104143',1461313735229,'0','716-1','Heinz bodies [Presence] in Blood by Light microscopy','Heinz Bod Bld Ql Smear','HEM/BC',NULL),
('Jd8990bb8efcfd34c0693',1461313198889,'0','634-6','Bacteria identified in Unspecified specimen by Aerobe culture','Bacteria XXX Aerobe Cult','MICRO',NULL),
('Jd89a65b0b82c434603843',1461313688537,'0','25473-0','Metanephrine [Moles/volume] in Serum or Plasma','Metaneph SerPl-sCnc','CHEM',NULL),
('jdb8d891c6cff75fa0216',1461313124230,'0','6463-4','Bacteria identified in Unspecified specimen by Culture','Bacteria XXX Cult','MICRO',NULL),
('jdc6fcee972366fb104066',1461313723445,'0','6090-5','Cottonwood IgE Ab [Units/volume] in Serum','Cottonwood IgE Qn','ALLERGY',NULL),
('jdf0e3b2cd15acc9403166',1461313583053,'0','10525-4','Microscopic observation [Identifier] in Unspecified specimen by Cyto stain','Cyto XXX','CYTO',NULL),
('Je0ceb18a74e2327b01443',1461313315628,'0','6095-4','American house dust mite IgE Ab [Units/volume] in Serum','D farinae IgE Qn','ALLERGY',NULL),
('Je0d5838598685ca202593',1461313493394,'0','12234-1','Mesothelial cells/100 leukocytes in Body fluid by Manual count','Mesothl Cell NFr Fld Manual','HEM/BC',NULL),
('Je0e4b587d9a0365b0393',1461313151736,'0','8247-9','Mucus [Presence] in Urine sediment by Light microscopy','Mucous Threads UrnS Ql Micro','UA',NULL),
('Je18ddf24e1ad555101493',1461313323150,'0','5124-3','Cytomegalovirus IgG Ab [Units/volume] in Serum by Immunoassay','CMV IgG Ser EIA-aCnc','MICRO',NULL),
('Je5a1e7e60ef05b7301393',1461313308164,'0','23641-4','Quinupristin+Dalfopristin [Susceptibility] by Minimum inhibitory concentration (MIC)','Quinupristin+Dalfoprist Islt MIC','ABXBACT',NULL),
('je690b308f92a28eb0966',1461313240878,'0','18969-6','Piperacillin [Susceptibility]','Piperacillin Susc Islt','ABXBACT',NULL),
('K67aebf153508b10003896',1461313696318,'0','35670-9','Tobramycin [Mass/volume] in Serum or Plasma','Tobramycin SerPl-mCnc','DRUG/TOX',NULL),
('K68b10095cc5556a102046',1461313408432,'0','8112-5','CD3-CD16+CD56+ (Natural killer) cells/100 cells in Blood','CD3-CD16+CD56+ Cells NFr Bld','CELLMARK',NULL),
('k69320c7813876c8001067',1461313256374,'0','38486-7','Homocystine [Presence] in Dried blood spot','(Hcys)2 DBS Ql','CHEM',NULL),
('K6a91c8a13b534b8102396',1461313462756,'0','8146-3','Amphetamines [Presence] in Meconium by Screen method','Amphetamines Mec Ql Scn','DRUG/TOX',NULL),
('k6be84409c289c66302317',1461313450663,'0','22310-7','Helicobacter pylori Ab [Presence] in Serum','H pylori Ab Ser Ql','MICRO',NULL),
('k6f7f8ce694aea45c02717',1461313513067,'0','2513-0','Ketones [Presence] in Serum or Plasma','Ketones SerPl Ql','CHEM',NULL),
('k6fc823f9f644c88c03417',1461313622288,'0','5202-7','Herpes simplex virus Ab [Units/volume] in Serum by Immunoassay','HSV Ab Ser EIA-aCnc','MICRO',NULL),
('K71797339d238c5f703146',1461313579603,'0','27820-0','Protein C Ag actual/normal in Platelet poor plasma by Immunologic method','Prot C Ag Act/Nor PPP Imm','COAG',NULL),
('k728f56943e2bca280317',1461313139519,'0','5769-5','Bacteria [#/area] in Urine sediment by Microscopy high power field','Bacteria #/area UrnS HPF','UA',NULL),
('k73bd9dd72952e0c302967',1461313552153,'0','42483-8','Protein.monoclonal/Protein.total in Urine by Electrophoresis','M Protein MFr Ur Elph','CHEM',NULL),
('K75334b0bca48daee03646',1461313657749,'0','13337-1','CD8+HLA-DR+ cells/100 cells in Blood','CD8+HLA-DR+ Cells NFr Bld','CELLMARK',NULL),
('k75c6f490f310992e01867',1461313380961,'0','6039-2','Beef IgE Ab [Units/volume] in Serum','Beef IgE Qn','ALLERGY',NULL),
('K774da785f352099d02146',1461313424070,'0','6156-4','Goosefoot IgE Ab [Units/volume] in Serum','Goosefoot IgE Qn','ALLERGY',NULL),
('K78a3fcd47d00f86001696',1461313354317,'0','14586-2','Aldosterone [Moles/volume] in Serum or Plasma','Aldost SerPl-sCnc','CHEM',NULL),
('K78b303098668e3d003996',1461313712146,'0','15050-8','Creatinine [Moles/volume] in Amniotic fluid','Creat Amn-sCnc','CHEM',NULL),
('K79e3098989f978aa01596',1461313338838,'0','22314-9','Hepatitis A virus IgM Ab [Presence] in Serum','HAV IgM Ser Ql','MICRO',NULL),
('k7e044da871ca599104217',1461313746603,'0','43182-5','Smith extractable nuclear Ab [Units/volume] in Serum by Immunoassay','ENA SM Ab Ser EIA-aCnc','SERO',NULL),
('K7eefc05c49b805d003246',1461313596212,'0','22752-0','Tobramycin [Moles/volume] in Serum or Plasma --trough','Tobramycin Trough SerPl-sCnc','DRUG/TOX',NULL),
('K81a620fbd67aebd703296',1461313603917,'0','21582-2','Tryptase [Mass/volume] in Serum or Plasma','Tryptase SerPl-mCnc','CHEM',NULL),
('K82e4d23ef5ef1bb602896',1461313541104,'0','52956-0','Barbiturates [Moles/volume] in Urine','Barbiturates Ur-sCnc','DRUG/TOX',NULL),
('k84744cb9a8396a8801517',1461313326936,'0','25836-8','HIV 1 RNA [#/volume] (viral load) in Unspecified specimen by Probe and target amplification method','HIV1 RNA # XXX PCR','MICRO',NULL),
('K85b80d5a45f2956e01746',1461313362281,'0','47528-5','Cytology report of Cervical or vaginal smear or scraping Cyto stain','Cytology Cvx/Vag Doc Cyto','CYTO',NULL),
('k8701ae87e4f0d7b003817',1461313684283,'0','550-4','Bordetella pertussis Ag [Presence] in Unspecified specimen by Immunofluorescence','B pert Ag XXX Ql IF','MICRO',NULL),
('k8c0e7748e74261eb03367',1461313614607,'0','5814-9','Triple phosphate crystals [Presence] in Urine sediment by Light microscopy','Tri-Phos Cry UrnS Ql Micro','UA',NULL),
('k8fb1de9f2c328ed303467',1461313629927,'0','19593-3','6-Monoacetylmorphine (6-MAM) [Mass/volume] in Urine by Confirmatory method','6MAM Ur Cfm-mCnc','DRUG/TOX',NULL),
('k9315c1e236db72a101767',1461313365132,'0','41399-7','Herpes simplex virus 1+2 IgM Ab [Units/volume] in Serum by Immunoassay','HSV1+2 IgM Ser EIA-aCnc','MICRO',NULL),
('K93e5b363a62b404b03546',1461313642062,'0','19089-2','Collection of urine specimen start time','Collect Start Tme Ur','SPEC',NULL),
('k9498a5a62e6384560667',1461313194637,'0','2472-9','IgM [Mass/volume] in Serum or Plasma','IgM SerPl-mCnc','CHEM',NULL),
('k976f45ff1d1f479d04167',1461313738931,'0','20457-8','Fungi.filamentous [Presence] in Urine sediment by Light microscopy','Filament Fungi UrnS Ql Micro','UA',NULL),
('K97c0e513ded7884503496',1461313634648,'0','14862-7','Oxalate [Moles/time] in 24 hour Urine','Oxalate 24h Ur-sRate','CHEM',NULL),
('K9af4fbcbd665191c02796',1461313525301,'0','2605-4','Meat fibers [Presence] in Stool by Light microscopy','Meat Fibers Stl Ql Micro','CHEM',NULL),
('k9b17bc6e9d54bc2f03717',1461313668764,'0','13941-0','Lymphocytes/100 leukocytes in Body fluid by Manual count','Lymphocytes NFr Fld Manual','HEM/BC',NULL),
('k9c15fa9b814574bc02617',1461313497414,'0','23878-2','Anaplasma phagocytophilum IgM Ab [Titer] in Serum by Immunofluorescence','A phagocytoph IgM Titr Ser IF','MICRO',NULL),
('Ka43882901fa092ec0496',1461313168200,'0','11279-7','Urine sediment comments by Light microscopy Narrative','UrnS Cmnt Micro','UA',NULL),
('Ka505ff50054ab2c803196',1461313587641,'0','7124-1','Bayberry Pollen IgE Ab [Units/volume] in Serum','Bayberry Poln IgE Qn','ALLERGY',NULL),
('ka6ff3778d2ffc3c802567',1461313489474,'0','46082-4','Influenza virus A Ag [Presence] in Nasopharynx by Immunoassay','FLUAV Ag Nph Ql EIA','MICRO',NULL),
('Ka8e73760dcc481c10896',1461313230274,'0','8123-2','CD3+CD4+ (T4 helper) cells/100 cells in Blood','CD3+CD4+ Cells NFr Bld','CELLMARK',NULL),
('ka9d8d1234857d3100267',1461313132030,'0','5770-3','Bilirubin.total [Presence] in Urine by Test strip','Bilirub Ur Ql Strip','UA',NULL),
('ka9fff19a1209527603017',1461313559958,'0','7905-3','Hepatitis B virus surface Ag [Presence] in Serum or Plasma by Neutralization test','HBV surface Ag SerPl Ql Nt','MICRO',NULL),
('kaa65750b8443d89001117',1461313264639,'0','739-3','Metamyelocytes [#/volume] in Blood by Manual count','Metamyelocytes # Bld Manual','HEM/BC',NULL),
('kab22d77c5844043603317',1461313606852,'0','5908-9','Platelets Giant [Presence] in Blood by Light microscopy','Giant Platelets Bld Ql Smear','HEM/BC',NULL),
('Kac2d792dbd05e7f801246',1461313285289,'0','14744-7','Glucose [Moles/volume] in Cerebral spinal fluid','Glucose CSF-sCnc','CHEM',NULL),
('Kacaa217bf263259c0196',1461313121079,'0','48642-3','Glomerular filtration rate/1.73 sq M predicted among non-blacks by Creatinine-based formula (MDRD)','GFR/BSA pred.non black SerPl MDRD-ArVRat','CHEM',NULL),
('kad9897f54189a0a904117',1461313731426,'0','5062-5','Borrelia burgdorferi IgG Ab [Units/volume] in Serum by Immunoassay','B burgdor IgG Ser EIA-aCnc','MICRO',NULL),
('kb033bc4dfaa571d301417',1461313311625,'0','35663-4','Protein [Mass/volume] in unspecified time Urine','Prot ?Tm Ur-mCnc','UA',NULL),
('kb0b8454e29e4e39501167',1461313273087,'0','16935-9','Hepatitis B virus surface Ab [Units/volume] in Serum','HBV surface Ab Ser-aCnc','MICRO',NULL),
('Kb0ea99c63e740d6902446',1461313470512,'0','14761-1','Glucose [Moles/volume] in Serum or Plasma --2 hours post meal','Glucose 2h p meal SerPl-sCnc','CHAL',NULL),
('Kb2ae8c0c69db97e40546',1461313176131,'0','30934-4','Natriuretic peptide B [Mass/volume] in Serum or Plasma','BNP SerPl-mCnc','CHEM',NULL),
('kb43c3324456f0d9f0367',1461313147925,'0','19769-9','Pathologist who read Cyto stain of Cervical or vaginal smear or scraping','Pathologist Cvx/Vag Cyto','CYTO',NULL),
('kb51154578756fec40767',1461313210428,'0','2862-1','Albumin [Mass/volume] in Serum or Plasma by Electrophoresis','Albumin SerPl Elph-mCnc','CHEM',NULL),
('Kb5649f73a2fd41be02846',1461313533340,'0','6165-5','Lobster IgE Ab [Units/volume] in Serum','Lobster IgE Qn','ALLERGY',NULL),
('Kb56cf13bb6d2edf303946',1461313704258,'0','20637-5','Arginine [Moles/volume] in Serum or Plasma','Arginine SerPl-sCnc','CHEM',NULL),
('Kb659147a739799cf0446',1461313160319,'0','1988-5','C reactive protein [Mass/volume] in Serum or Plasma','CRP SerPl-mCnc','CHEM',NULL),
('Kb8b19f2dda4dbce101296',1461313293387,'0','9592-7','Borrelia burgdorferi 39kD IgG Ab [Presence] in Serum by Immunoblot (IB)','B burgdor39kD IgG Ser Ql IB','MICRO',NULL),
('Kbb2c8e6a9e4ee0ea03596',1461313649893,'0','25987-9','Testosterone Free [Moles/volume] in Serum or Plasma by Radioimmunoassay (RIA)','Testost Free SerPl RIA-sCnc','CHEM',NULL),
('Kbce6c3b2fe3ec29902496',1461313478459,'0','2752-4','pH of Semen','pH Smn','CHEM',NULL),
('Kbdb06d354ad731ba0796',1461313214799,'0','36903-3','Chlamydia trachomatis+Neisseria gonorrhoeae DNA [Identifier] in Unspecified specimen by Probe and target amplification method','C trach+GC DNA XXX PCR','MICRO',NULL),
('Kc008df1fcc2f784701346',1461313300752,'0','14565-6','Hemoglobin.gastrointestinal [Presence] in Stool --3rd specimen','Hemoccult sp3 Stl Ql','CHEM',NULL),
('kc1922b4428cd599d03067',1461313567371,'0','14573-0','5-Hydroxyindoleacetate [Moles/time] in 24 hour Urine','5OH-indoleacetate 24h Ur-sRate','CHEM',NULL),
('Kc195286a4d9ee39d01196',1461313277283,'0','748-4','Myelocytes [#/volume] in Blood by Manual count','Myelocytes # Bld Manual','HEM/BC',NULL),
('kc78014f1d4916d4801017',1461313249094,'0','4485-9','Complement C3 [Mass/volume] in Serum or Plasma','C3 SerPl-mCnc','HEM/BC',NULL),
('kc7eab6d51e3d672f02267',1461313443249,'0','41274-2','Alpha-1-Fetoprotein interpretation [interpretation] in Serum or Plasma','AFP Interp SerPl-Imp','CHEM',NULL),
('Kc895f368c18312a20596',1461313183655,'0','714-6','Eosinophils/100 leukocytes in Blood by Manual count','Eosinophil NFr Bld Manual','HEM/BC',NULL),
('Kc906ea6232c34a5802746',1461313517720,'0','3256-5','Fibrinogen Ag [Mass/volume] in Platelet poor plasma by Immunologic method','Fibrinogen Ag PPP Imm-mCnc','COAG',NULL),
('kcb66f9e10da401640717',1461313202523,'0','6299-2','Urea nitrogen [Mass/volume] in Blood','BUN Bld-mCnc','CHEM',NULL),
('Kcb94a645c122618e0946',1461313237511,'0','46737-3','Galactosemias newborn screen interpretation','Galactosemias DBS-Imp','CHEM',NULL),
('kcc4a98b9eb1a3d0903867',1461313692181,'0','11183-1','Macadamia IgE Ab [Units/volume] in Serum','Macadamia IgE Qn','ALLERGY',NULL),
('Kccd34dcd234e8be40846',1461313222511,'0','6824-7','Color of Body fluid','Color Fld','SPEC',NULL),
('kd3a9a5846d84f59e01917',1461313388517,'0','5876-8','Respiratory syncytial virus Ag [Presence] in Unspecified specimen by Immunoassay','RSV Ag XXX Ql EIA','MICRO',NULL),
('Kd41dc52ebe1a661101646',1461313346653,'0','22496-4','Rubella virus Ab [Presence] in Serum','RUBV Ab Ser Ql','MICRO',NULL),
('Kd43b71d92f812c9a02346',1461313455326,'0','35668-3','Gentamicin [Mass/volume] in Serum or Plasma','Gentamicin SerPl-mCnc','DRUG/TOX',NULL),
('kd4707a0c5adf21d60617',1461313187030,'0','5198-7','Hepatitis C virus Ab [Units/volume] in Serum by Immunoassay','HCV Ab Ser EIA-aCnc','MICRO',NULL),
('kd49bc29163636a3a02217',1461313435301,'0','42768-2','HIV 1 and 2 Ab [interpretation] in Serum Narrative','HIV 1 & 2 Ab Ser-Imp','MICRO',NULL),
('kd9788e2cb9c84bf002667',1461313504894,'0','11070-0','Microscopic observation [Identifier] in Urine by Cyto stain','Cyto Ur','CYTO',NULL),
('kda3e1bb4c315497502167',1461313427220,'0','6014-5','von Willebrand factor (vWf) ristocetin cofactor actual/normal in Platelet poor plasma by Aggregation','vWf:RCo Act/Nor PPP Aggr','COAG',NULL),
('Kdd3532b93386888f02096',1461313416164,'0','5126-8','Cytomegalovirus IgM Ab [Units/volume] in Serum by Immunoassay','CMV IgM Ser EIA-aCnc','MICRO',NULL),
('Kdd4d2e258e7fcfe304046',1461313720311,'0','30374-3','Basophils/100 leukocytes in Cerebral spinal fluid','Basophils NFr CSF','HEM/BC',NULL),
('kdda76c9ea5776b8301817',1461313373213,'0','4023-8','Salicylates [Presence] in Serum or Plasma','Salicylates SerPl Ql','DRUG/TOX',NULL),
('Kde0859c08e5742830146',1461313112663,'0','14749-6','Glucose [Moles/volume] in Serum or Plasma','Glucose SerPl-sCnc','CHEM',NULL),
('Kdfb74b5ae68fc01001996',1461313400769,'0','70207-6','Estrogen [Moles/volume] in Serum or Plasma','Estrogen SerPl-sCnc','CHEM',NULL),
('ke3a436922e62e48901467',1461313319222,'0','5185-4','Hepatitis B virus core IgM Ab [Units/volume] in Serum by Immunoassay','HBV core IgM Ser EIA-aCnc','MICRO',NULL),
('ke5578c5692b31a5f03767',1461313676786,'0','24521-7','Epinephrine [Moles/volume] in Urine','Epineph Ur-sCnc','CHEM',NULL),
('L67a07ebe0da4eb2c01698',1461313354618,'0','34574-4','Pathology report final diagnosis','Path report.final Dx Spec','TUMRRGT',NULL),
('l696b83603bccc8d203268',1461313599471,'0','41476-3','Rickettsia rickettsii IgG Ab [Presence] in Serum by Immunoassay','R rickettsi IgG Ser Ql EIA','MICRO',NULL),
('l6a41c4df1c81e69c04018',1461313715756,'0','1779-8','Alkaline phosphatase.liver [Enzymatic activity/volume] in Serum or Plasma','ALP Liver SerPl-cCnc','CHEM',NULL),
('L6a800431cc7dfbd403898',1461313696619,'0','17819-4','Albumin/Protein.total in unspecified time Urine by Electrophoresis','Albumin ?Tm MFr Ur Elph','CHEM',NULL),
('L6c04f26da32515820498',1461313168521,'0','21613-5','Chlamydia trachomatis DNA [Presence] in Unspecified specimen by Probe and target amplification method','C trach DNA XXX Ql PCR','MICRO',NULL),
('l6d2fd1fc9d677ea202468',1461313474372,'0','44448-9','Beta 2 glycoprotein 1 IgG Ab [Units/volume] in Serum by Immunoassay','B2 Glycoprot1 IgG Ser EIA-aCnc','COAG',NULL),
('l6eb58c376fb05cf002868',1461313536608,'0','14947-6','Vanillylmandelate [Moles/time] in 24 hour Urine','VMA 24h Ur-sRate','CHEM',NULL),
('L73630b8d1cde5e6303998',1461313712447,'0','29767-1','Bilirubin.total [Moles/volume] in Body fluid','Bilirub Fld-sCnc','CHEM',NULL),
('l73b4256b1184cbb00568',1461313179342,'0','17856-6','Hemoglobin A1c/Hemoglobin.total in Blood by HPLC','Hgb A1c MFr Bld HPLC','HEM/BC',NULL),
('l764464b075cf159103568',1461313645731,'0','21482-5','Protein [Mass/volume] in 24 hour Urine','Prot 24h Ur-mCnc','CHEM',NULL),
('L7781fc9b03a2ad6502048',1461313408709,'0','19774-9','Cytology study comment Cervical or vaginal smear or scraping Cyto stain','Cytology Cmnt Cvx/Vag Cyto-Imp','CYTO',NULL),
('L79873e89b52da4af0798',1461313215024,'0','580-1','Fungus identified in Unspecified specimen by Culture','Fungus XXX Cult','MICRO',NULL),
('l7f859d264b889d3f03118',1461313575667,'0','30173-9','Cortisol Free [Moles/volume] in Urine','Cortis F Ur-sCnc','CHEM',NULL),
('L7fd39a53fb56b33f01598',1461313339148,'0','46154-1','Trichomonas vaginalis rRNA [Presence] in Unspecified specimen by Probe and target amplification method','T vaginalis rRNA XXX Ql PCR','MICRO',NULL),
('l81168df36a0c3d580518',1461313171669,'0','2324-2','Gamma glutamyl
transferase [Enzymatic activity/volume] in Serum or Plasma','GGT SerPl-cCnc','CHEM',NULL),
('L845b5f4d21ed1cf101648',1461313346937,'0','49050-8','Microscopic observation [Identifier] in Endocervical brush by Cyto stain','Cyto Endocvx brush','CYTO',NULL),
('l84a40b7bf2485bbe02018',1461313404062,'0','11065-0','Urea nitrogen [Mass/volume] in Serum or Plasma --pre dialysis','BUN pre dial SerPl-mCnc','CHEM',NULL),
('l85f1ece13f73851903618',1461313653019,'0','15917-8','Peanut IgE Ab RAST class in Serum','Peanut IgE RAST Ql','ALLERGY',NULL),
('l8775467688c37e1201218',1461313280693,'0','3389-4','Benzodiazepines [Presence] in Serum or Plasma','Benzodiaz SerPl Ql','DRUG/TOX',NULL),
('l881b784c2a8f5d4a0168',1461313116016,'0','6690-2','Leukocytes [#/volume] in Blood by Automated count','WBC # Bld Auto','HEM/BC',NULL),
('L88e55cf0e2514c830948',1461313238176,'0','14581-3','Acetaminophen [Moles/volume] in Serum or Plasma','Acetamin SerPl-sCnc','DRUG/TOX',NULL),
('L8a3cdd1493d4d98403648',1461313658066,'0','21112-8','Birth date','Birth Date','MISC',NULL),
('L8a6517b9e13157cf02798',1461313525602,'0','730-2','Leukocytes other/100 leukocytes in Blood by Manual count','WBC Other NFr Bld Manual','HEM/BC',NULL),
('L8b4ce226a535386302848',1461313533583,'0','21709-1','MTHFR gene mutations found [Identifier] in Blood or Tissue by Molecular genetics method Nominal','MTHFR gene Mut Anal Bld/T','MOLPATH.MUT',NULL),
('L8bbc0a5c87ebee6603548',1461313642371,'0','15174-6','Cryocrit of Serum by Spun Westergren','Cryocrit Ser Spun Westergren','CHEM',NULL),
('l91d7eac6d7d293cb02368',1461313458569,'0','33217-1','Spermatozoa Agglutinated [Presence] in Semen','Sperm Agglutinated Smn Ql','FERT',NULL),
('l9377d25442bc2c1f01318',1461313296738,'0','2164-2','Creatinine renal clearance in 24 hour','Creat Cl 24h Ur+SerPl-vRate','CHEM',NULL),
('L93ae9da9d892c6e301998',1461313401070,'0','11064-3','Urea nitrogen [Mass/volume] in Serum or Plasma --post dialysis','BUN p dialysis SerPl-mCnc','CHEM',NULL),
('L95b9ad0de81e5ef204048',1461313720612,'0','14812-2','Lidocaine [Moles/volume] in Serum or Plasma','Lidocain SerPl-sCnc','DRUG/TOX',NULL),
('L96aa966f45a6b79d01298',1461313293705,'0','9599-2','Borrelia burgdorferi 39kD IgM Ab [Presence] in Serum by Immunoblot (IB)','B burgdor39kD IgM Ser Ql IB','MICRO',NULL),
('L982b15c9e039554c03948',1461313704525,'0','20640-9','Citrulline [Moles/volume] in Serum or Plasma','Citrulline SerPl-sCnc','CHEM',NULL),
('L985820f53d8bfca50198',1461313121380,'0','48643-1','Glomerular filtration rate/1.73 sq M predicted among blacks by Creatinine-based formula (MDRD)','GFR/BSA pred.black SerPl MDRD-ArVRat','CHEM',NULL),
('l98baa7b07525a4e101718',1461313358360,'0','13514-5','Hemoglobin pattern [interpretation] in Blood by Electrophoresis Narrative','Hgb Fract Bld Elph-Imp','HEM/BC',NULL),
('L99a180a92ff5427a02898',1461313541405,'0','9785-7','Deprecated Microscopic observation [Identifier] in Stool by Ova and Parasite Preparation','Deprecated O and P Prep Stl','MICRO',NULL),
('l9b9f53ddac9428300818',1461313218307,'0','14754-6','Glucose [Moles/volume] in Serum or Plasma --1 hour post 50 g glucose PO','Glucose 1h p 50 g Glc PO SerPl-sCnc','CHAL',NULL),
('l9c3af2b56f462ec804068',1461313723763,'0','30192-9','Acetylcholine receptor modulation Ab/Acetylcholine Ab.total in Serum','AChR Mod Ab/AChR Total SFr Ser','SERO',NULL),
('L9ecd8c02efc271dd03198',1461313587942,'0','8251-1','Service comment','Service Cmnt XXX-Imp','MISC',NULL),
('L9f5aff2cf770776502348',1461313455627,'0','47109-4','Gentamicin [Moles/volume] in Serum or Plasma','Gentamicin SerPl-sCnc','DRUG/TOX',NULL),
('la0179169a749919901968',1461313396314,'0','13517-8','Lymphocytes Variant/100 leukocytes in Cerebral spinal fluid by Manual count','Variant Lymphs NFr CSF Manual','HEM/BC',NULL),
('la0786ad420676db902418',1461313466316,'0','8116-6','CD19 cells [#/volume] in Blood','CD19 Cells # Bld','CELLMARK',NULL),
('la09851bf69944dc502518',1461313482044,'0','29893-5','HIV 1 Ab [Presence] in Serum by Immunoassay','HIV1 Ab Ser Ql EIA','MICRO',NULL),
('la235b4f29af81e5b03218',1461313590859,'0','38496-6','Retinyl palmitate [Mass/volume] in Serum or Plasma','Retinyl Palmitate SerPl-mCnc','CHEM',NULL),
('La3b35ba10e3119140148',1461313113082,'0','2951-2','Sodium [Moles/volume] in Serum or Plasma','Sodium SerPl-sCnc','CHEM',NULL),
('la70b02db4c6359ff0418',1461313156024,'0','14798-3','Iron [Moles/volume] in Serum or Plasma','Iron SerPl-sCnc','CHEM',NULL),
('La7e9b412511feb6602098',1461313416489,'0','40844-3','Immunoglobulin light chains.kappa.free/Immunoglobulin light chains.lambda [Mass ratio] in Serum','Kappa LC Free/Lambda Ser-mRto','CHEM',NULL),
('laa1f41bc254d8b7103168',1461313583279,'0','40692-6','Volume of Semen--pre washing','Specimen vol Pre Wash Smn','FERT',NULL),
('Lab8b1f83713b466101198',1461313277584,'0','17898-8','Bacteria identified in Throat by Aerobe culture','Bacteria Throat Aerobe Cult','MICRO',NULL),
('Laf796d3058d7317e02498',1461313478794,'0','15359-3','Dilute Russell viper venom time (dRVVT) actual/normal in Platelet poor plasma by Coagulation assay','dRVV Tme Act/Nor PPP','COAG',NULL),
('Lb080b7d9e5ce369802398',1461313463365,'0','20991-6','Antithrombin [interpretation] in Platelet poor plasma','AT III PPP-Imp','COAG',NULL),
('Lb19a29c97e40a8fc02748',1461313518038,'0','35789-7','Daptomycin [Susceptibility]','Daptomycin Susc Islt','ABXBACT',NULL),
('lb279c208c88a8dc903668',1461313661151,'0','7981-4','Parvovirus B19 IgM Ab [Presence] in Serum','B19V IgM Ser Ql','MICRO',NULL),
('Lb32282fc29b7444a03598',1461313650169,'0','40464-0','Drugs identified in Urine by Confirmatory method','Drugs Ur Cfm','DRUG/TOX',NULL),
('lb35209bd812d1c8d01668',1461313350096,'0','27811-9','Antithrombin actual/normal in Platelet poor plasma by Chromogenic method','AT III Act/Nor PPP Chro','COAG',NULL),
('lb5c5869b1bbf369d02818',1461313528945,'0','27389-6','Streptococcus pneumoniae 23 IgG Ab [Mass/volume] in Serum','S pneum23 IgG Ser-mCnc','MICRO',NULL),
('Lb72211f12002907802448',1461313470812,'0','5290-2','Reagin Ab [Presence] in Cerebral spinal fluid by VDRL','VDRL CSF Ql','MICRO',NULL),
('Lb74e39e3a9a188d203148',1461313579971,'0','10579-1','Leukocytes [#/volume] in Semen','WBC # Smn','FERT',NULL),
('Lb76797ac0f75435501248',1461313285524,'0','18965-4','Penicillin G [Susceptibility]','Penicillin G Susc Islt','ABXBACT',NULL),
('lb911e498207638be02768',1461313521247,'0','6379-2','Cytomegalovirus Ag [Presence] in Unspecified specimen by Immunoassay','CMV Ag XXX Ql EIA','MICRO',NULL),
('Lb98aa29c99a2a2fa0848',1461313222811,'0','24113-3','Hepatitis B virus core IgM Ab [Presence] in Serum or Plasma by Immunoassay','HBV core IgM SerPl Ql EIA','MICRO',NULL),
('Lb9d36491eb0ca8970898',1461313230508,'0','26498-6','Myelocytes/100 leukocytes in Blood','Myelocytes NFr Bld','HEM/BC',NULL),
('lbbab13da8467cf3203918',1461313699937,'0','20401-6','Nuclear Ab pattern.speckled [Titer] in Serum','ANA Speckled Titr Ser','SERO',NULL),
('lbc050c457f330f4b0468',1461313163996,'0','11580-8','Thyrotropin [Units/volume] in Serum or Plasma by Detection limit <= 0.005 mIU/L','TSH SerPl DL<=0.005 mIU/L-aCnc','CHEM',NULL),
('lbe50503d118bd52203968',1461313707642,'0','17788-1','Large unstained cells/100 leukocytes in Blood by Automated count','LUC NFr Bld Auto','HEM/BC',NULL),
('lc07cb1713dd2dfde01618',1461313342090,'0','32166-1','Choriogonadotropin [Multiple of the median] adjusted in Serum or Plasma','HCG adj MoM SerPl','CHEM',NULL),
('Lc0e977129e4b1f0b01348',1461313301052,'0','17842-6','Cancer Ag 27-29 [Units/volume] in Serum or Plasma','Cancer Ag27-29 SerPl-aCnc','CHEM',NULL),
('Lc4504a1b974e573103498',1461313634874,'0','25835-0','HIV 1 RNA [Presence] in Serum or Plasma by Probe and target amplification method','HIV1 RNA SerPl Ql PCR','MICRO',NULL),
('lc6c6554e0d69cfd20868',1461313225686,'0','800-3','Schistocytes [Presence] in Blood by Light microscopy','Schistocytes Bld Ql Smear','HEM/BC',NULL),
('Lc7deccbd06b4d2b70548',1461313176449,'0','2019-8','Carbon dioxide [Partial pressure] in Arterial blood','pCO2 BldA','CHEM',NULL),
('lc9d54aba25af879603518',1461313637883,'0','47440-3','Hepatitis B virus core Ab [Presence] in Serum from donor','HBV core Ab Ser Donr Ql','MICRO',NULL),
('lca1b92aa1baf982e02118',1461313419548,'0','42176-8','\"1','3 beta glucan [Mass/volume] in Serum\"','\"1',NULL),
('Ld0331dd0401ca8620448',1461313160545,'0','5808-1','Erythrocytes [#/volume] in Urine sediment by Microscopy high power field','RBC # UrnS HPF','UA',NULL),
('Ld0737ccc3df95dd00598',1461313183888,'0','15067-2','Follitropin [Units/volume] in Serum or Plasma','FSH SerPl-aCnc','CHEM',NULL),
('Ld07e4f9208f3809403248',1461313596495,'0','48051-7','Erythrocytes [Presence] in Vaginal fluid','RBC Vag Ql','HEM/BC',NULL),
('ld244ea030aefec4402068',1461313412051,'0','8130-7','CD45 (Lymphs) cells/100 cells in Blood','CD45 Cells NFr Bld','CELLMARK',NULL),
('ld3070660c4a1432b01268',1461313288758,'0','606-4','Bacteria identified in Cerebral spinal fluid by Culture','Bacteria CSF Cult','MICRO',NULL),
('Ld9a025cf832c008101748',1461313362640,'0','6106-9','Egg white IgE Ab [Units/volume] in Serum','Egg White IgE Qn','ALLERGY',NULL),
('ld9c1b5fd4b9cb5e501568',1461313334634,'0','14874-2','Phenobarbital [Moles/volume] in Serum or Plasma','Phenobarb SerPl-sCnc','DRUG/TOX',NULL),
('le29bf3ff053ad8bd0918',1461313233675,'0','3167-4','Volume of 24 hour Urine','Specimen vol 24h Ur','SPEC',NULL),
('le7680336b5cdfbb20968',1461313241179,'0','2955-3','Sodium [Moles/volume] in Urine','Sodium Ur-sCnc','CHEM',NULL),
('M707c22f3d134f0e303294',1461313603616,'0','24119-0','Cytomegalovirus IgM Ab [Presence] in Serum by Immunoassay','CMV IgM Ser Ql EIA','MICRO',NULL),
('M749ffc241458287801194',1461313276966,'0','30446-9','Myelocytes [#/volume] in Blood','Myelocytes # Bld','HEM/BC',NULL),
('M75e77d1761b6367501294',1461313293061,'0','9591-9','Borrelia burgdorferi 30kD IgG Ab [Presence] in Serum by Immunoblot (IB)','B burgdor30kD IgG Ser Ql IB','MICRO',NULL),
('m7a7a6fc37ce544d502175',1461313428432,'0','22415-4','Mumps virus IgG Ab [Presence] in Serum','MuV IgG Ser Ql','MICRO',NULL),
('m7a8f07507b93d76a01125',1461313265926,'0','39778-6','Iron/Iron binding capacity.total [Molar ratio] in Serum or Plasma','Iron/TIBC SerPl-sRto','CHEM',NULL),
('m7d1cddd6cec5b33603725',1461313670192,'0','29539-4','HIV 1 RNA [Log #/volume] (viral load) in Plasma by Probe and signal amplification method','HIV1 RNA Plas bDNA-Log#','MICRO',NULL),
('m7d4bbc6a8393edcb02225',1461313436329,'0','1747-5','Albumin [Mass/volume] in Body fluid','Albumin Fld-mCnc','CHEM',NULL),
('M7da781370b13a68802144',1461313423844,'0','6082-2','Codfish IgE Ab [Units/volume] in Serum','Codfish IgE Qn','ALLERGY',NULL),
('M7deaa624ea1fbbb80144',1461313112354,'0','2823-3','Potassium [Moles/volume] in Serum or Plasma','Potassium SerPl-sCnc','CHEM',NULL),
('M7e85c7e669cef8a002894',1461313540787,'0','43583-4','Lipoprotein a [Moles/volume] in Serum or Plasma','LPa SerPl-sCnc','CHEM',NULL),
('m7ed14809bd596efa04175',1461313740228,'0','40729-6','Herpes simplex virus IgM Ab [Presence] in Serum by Immunoassay','HSV IgM Ser Ql EIA','MICRO',NULL),
('M7f0aa9e0a710871202844',1461313533048,'0','13986-5','Albumin/Protein.total in 24 hour Urine by Electrophoresis','Albumin 24h MFr Ur Elph','CHEM',NULL),
('M813ca9868c71932303944',1461313704023,'0','9361-7','Bartonella quintana IgM Ab [Titer] in Serum','B quintana IgM Titr Ser','MICRO',NULL),
('M8279c1ccae42842102394',1461313462522,'0','20423-0','Beta lactamase organism identified in Isolate','B-Lactamase Organism Islt','MICRO',NULL),
('M8297e561fe3a9d6a01994',1461313400468,'0','783-1','Promyelocytes/100 leukocytes in Blood by Manual count','Promyelocytes NFr Bld Manual','HEM/BC',NULL),
('M83674e7579198dbe01244',1461313285063,'0','18862-3','Amoxicillin+Clavulanate [Susceptibility]','Amoxicillin+Clav Susc Islt','ABXBACT',NULL),
('m847f02c900ae65ea03475',1461313631339,'0','6448-5','Legionella pneumophila Ag [Presence] in Urine by Radioimmunoassay (RIA)','L pneumo Ag Ur Ql RIA','MICRO',NULL),
('M874000c0f4808bdb0594',1461313183370,'0','769-0','Neutrophils.segmented/100 leukocytes in Blood by Manual count','Neuts Seg NFr Bld Manual','HEM/BC',NULL),
('M87b8110c23b70a8e01744',1461313361989,'0','13590-5','Activated protein C resistance [Time Ratio] in Platelet poor plasma by Coagulation assay','aPCR PPP','COAG',NULL),
('m88810179a0a8f30f02575',1461313490735,'0','39786-9','Pyridoxine [Moles/volume] in Serum or Plasma','Vit B6 SerPl-sCnc','CHEM',NULL),
('M8a0fbaba11729b8903244',1461313595895,'0','4059-2','Tobramycin [Mass/volume] in Serum or Plasma --trough','Tobramycin Trough SerPl-mCnc','DRUG/TOX',NULL),
('m8a7b1edfdde456b903425',1461313623725,'0','70215-9','Oxycodone [Moles/volume] in Urine by Confirmatory method','Oxycodone Ur Cfm-sCnc','DRUG/TOX',NULL),
('M8a87c1ae381353da03644',1461313657448,'0','6059-0','Candida albicans IgE Ab [Units/volume] in Serum','C albicans IgE Qn','ALLERGY',NULL),
('M8ac8b02ff5943b9302744',1461313517370,'0','15530-9','Alternaria alternata IgE Ab RAST class in Serum','A alternata IgE RAST Ql','ALLERGY',NULL),
('m8ad6a97cc9c019200775',1461313211823,'0','18906-8','Ciprofloxacin [Susceptibility]','Ciprofloxacin Susc Islt','ABXBACT',NULL),
('m8bfa448cbd4628e702325',1461313452091,'0','28647-6','pH of Venous cord blood','pH BldCoV','CHEM',NULL),
('M8c2d8d55d1f2e63903894',1461313696017,'0','50927-3','Tobramycin [Moles/volume] in Serum or Plasma','Tobramycin SerPl-sCnc','DRUG/TOX',NULL),
('m8d2f671ae25f89570625',1461313188192,'0','53925-4','Chlamydia trachomatis rRNA [Presence] in Urethra by Probe and target amplification method','C trach rRNA Urth Ql PCR','MICRO',NULL),
('M8dda99dfd3c4a7360894',1461313229965,'0','13655-6','Leukocytes [Presence] in Stool by Light microscopy','WBC Stl Ql Micro','HEM/BC',NULL),
('M8e2525b4fc2b31ca03494',1461313634356,'0','25726-1','Oxcarbazepine [Moles/volume] in Serum or Plasma','Oxcarbazepine SerPl-sCnc','DRUG/TOX',NULL),
('m90fd5564a8fbb78b03325',1461313608005,'0','30525-0','Age','Age','MISC',NULL),
('m92b9d55049d077950325',1461313141173,'0','630-4','Bacteria identified in Urine by Culture','Bacteria Ur Cult','MICRO',NULL),
('m93f32d1905ef98d803875',1461313693326,'0','5116-9','Corynebacterium diphtheriae Ab [Units/volume] in Serum by Immunoassay','C diphtheriae Ab Ser EIA-aCnc','MICRO',NULL),
('m95c1853c09a8bccc03775',1461313677865,'0','3786-1','Methaqualone [Presence] in Urine','Methaqualone Ur Ql','DRUG/TOX',NULL),
('M95d19fb6592203c702044',1461313408115,'0','33718-8','Cytology report of Tissue fine needle aspirate Cyto stain','Cytology Tiss FNA Doc Cyto','CYTO',NULL),
('m9609f525ae841b1f04075',1461313724698,'0','4635-9','Free Hemoglobin [Mass/volume] in Serum','Hgb Free Ser-mCnc','HEM/BC',NULL),
('m962a2927cd1c76ce01825',1461313374358,'0','4547-6','Hemoglobin A1/Hemoglobin.total in Blood','Hgb A1 MFr Bld','HEM/BC',NULL),
('M964df46315ead29802444',1461313470203,'0','14115-0','Collagen crosslinked N-telopeptide/Creatinine [Molar ratio] in Urine','Collagen NTx/Creat Ur-sRto','CHEM',NULL),
('m96504aa15352a40702975',1461313553390,'0','40903-7','Streptococcus pneumoniae 12 IgG Ab [Mass/volume] in Serum by Immunoassay','S pneum12 IgG Ser EIA-mCnc','MICRO',NULL),
('M9696ab7ac38b083103194',1461313587340,'0','10353-1','Bacteria identified in Nose by Aerobe culture','Bacteria Nose Aerobe Cult','MICRO',NULL),
('m96a3c23ab4a95ddc01425',1461313312695,'0','13532-7','Xanthochromia of Cerebral spinal fluid Qualitative','Xanthochromia CSF Ql','SPEC',NULL),
('m9ac2b6773ea1cd5001925',1461313390137,'0','8665-2','Date last menstrual period','Date LMP','H&P.HX',NULL),
('M9b767c70e2ce5d3d0844',1461313222210,'0','2335-8','Hemoglobin.gastrointestinal [Presence] in Stool','Hemoccult Stl Ql','CHEM',NULL),
('m9d52afc244f15dbf01375',1461313305573,'0','2484-4','Insulin-like growth factor-I [Mass/volume] in Serum or Plasma','IGF-I SerPl-mCnc','CHEM',NULL),
('m9d6ef1188c1246cd01075',1461313257786,'0','70200-1','Cholesterol in HDL/Cholesterol.total [Molar ratio] in Serum or Plasma','HDLc SerPl-sRto','CHEM',NULL),
('M9dd5ef6cc52c50280494',1461313167900,'0','24111-7','Neisseria gonorrhoeae DNA [Presence] in Unspecified specimen by Probe and target amplification method','N gonorrhoea DNA XXX Ql PCR','MICRO',NULL),
('m9e274496008c41ec02675',1461313506440,'0','5785-1','Eosinophils [#/area] in Urine sediment by Microscopy high power field','Eosinophil #/area UrnS HPF','UA',NULL),
('m9e8888c6af55d8f202625',1461313498534,'0','32319-6','Glucose [Moles/volume] in Serum or Plasma --30 minutes post 75 g glucose PO','Glucose 30M p 75 g Glc PO SerPl-sCnc','CHAL',NULL),
('m9eac5cee19ae1d0b0725',1461313203736,'0','2888-6','Protein [Mass/volume] in Urine','Prot Ur-mCnc','UA',NULL),
('M9eb3daed8330ed7e01594',1461313338537,'0','4552-6','Hemoglobin A2/Hemoglobin.total in Blood by Electrophoresis','Hgb A2 MFr Bld Elph','HEM/BC',NULL),
('ma4f5519c2e13ae660275',1461313133199,'0','66126-4','Cholesterol in VLDL [Moles/volume] in Serum or Plasma by calculation','VLDLc SerPl Calc-sCnc','CHEM',NULL),
('Ma55d424a2fd702e30794',1461313214523,'0','58413-6','Nucleated erythrocytes/100 leukocytes [Ratio] in Blood by Automated count','nRBC/100 WBC Bld Auto-Rto','HEM/BC',NULL),
('Ma7dc4d363cebb0d903994',1461313711845,'0','7059-9','Vancomycin [Susceptibility] by Gradient strip (E-test)','Vancomycin Islt E-test','ABXBACT',NULL),
('ma8c73cb8625399a001775',1461313366419,'0','3284-7','Lupus anticoagulant neutralization platelet [Time] in Platelet poor plasma by Coagulation assay','LAC Nt Platelet Time PPP','COAG',NULL),
('Ma9032eafa08ce3ca02494',1461313478142,'0','5117-7','Cryoglobulin [Presence] in Serum','Cryoglob Ser Ql','CHEM',NULL),
('maa153aab9193f92e03025',1461313561220,'0','32031-7','Phosphatidylserine IgA Ab [Units/volume] in Serum by Immunoassay','PS IgA Ser EIA-aCnc','COAG',NULL),
('Maab625f7832af9ca03594',1461313649667,'0','888-8','Blood group antibodies identified in Serum or Plasma','Blood group antibodies SerPl','BLDBK',NULL),
('Mac44dfa7557b0aae0944',1461313237252,'0','5130-0','DNA double strand Ab [Units/volume] in Serum','dsDNA Ab Ser-aCnc','SERO',NULL),
('Madbd1c08e2bc556801344',1461313300442,'0','6420-4','Helicobacter pylori IgA Ab [Units/volume] in Serum by Immunoassay','H pylori IgA Ser EIA-aCnc','MICRO',NULL),
('Mae38a444424d15ab03544',1461313641636,'0','47441-1','Hepatitis C virus Ab [Presence] in Serum from donor','HCV Ab Ser Donr Ql','MICRO',NULL),
('Maffc3c3f7eb7558402344',1461313455017,'0','7793-3','Howell-Jolly bodies [Presence] in Blood by Light microscopy','Howell-Jolly Bod Bld Ql Smear','HEM/BC',NULL),
('mb12879bd446fb11d0225',1461313125325,'0','713-8','Eosinophils/100 leukocytes in Blood by Automated count','Eosinophil NFr Bld Auto','HEM/BC',NULL),
('Mb2105169c3c0bf1c01644',1461313346427,'0','6212-5','Penicillium notatum IgE Ab [Units/volume] in Serum','P notatum IgE Qn','ALLERGY',NULL),
('mb5e7c07208ebf0c401875',1461313382032,'0','5358-7','Smooth muscle Ab [Titer] in Serum by Immunofluorescence','Smooth muscle Ab Titr Ser IF','SERO',NULL),
('mb659c19a958cba9702925',1461313545433,'0','27118-9','Streptococcus pneumoniae 26 IgG Ab [Mass/volume] in Serum','S pneum26 IgG Ser-mCnc','MICRO',NULL),
('Mb75ff9716703451704044',1461313720002,'0','6125-9','Gluten IgE Ab [Units/volume] in Serum','Gluten IgE Qn','ALLERGY',NULL),
('mb776bf8cc670c49104125',1461313732579,'0','11281-3','Auer rods [Presence] in Blood by Light microscopy','Auer Bodies Bld Ql Smear','HEM/BC',NULL),
('Mba8060f12b14a7210444',1461313159885,'0','2276-4','Ferritin [Mass/volume] in Serum or Plasma','Ferritin SerPl-mCnc','CHEM',NULL),
('mbd5e43ac9be2e59e03375',1461313615886,'0','5834-7','Adenovirus Ag [Presence] in Unspecified specimen by Immunofluorescence','HAdV Ag XXX Ql IF','MICRO',NULL),
('Mbe24c8f4b468e97c02094',1461313415863,'0','5247-2','Mitochondria Ab [Titer] in Serum by Immunofluorescence','Mitochondria Ab Titr Ser IF','SERO',NULL),
('mc75ccf905a88fa6b02275',1461313444477,'0','14929-4','Triiodothyronine (T3).reverse [Moles/volume] in Serum or Plasma','T3Reverse SerPl-sCnc','CHEM',NULL),
('mc82da01887c1c90003075',1461313568607,'0','20112-9','Tidal volume setting Ventilator','VT setting Vent','PULM',NULL),
('Mc9010fa3f06fd6f20194',1461313120761,'0','20570-8','Hematocrit [Volume Fraction] of Blood','Hct VFr Bld','HEM/BC',NULL),
('mcd4d1b26c4f2647701025',1461313250256,'0','16128-1','Hepatitis C virus Ab [Presence] in Serum','HCV Ab Ser Ql','MICRO',NULL),
('Md62681f5d9ef630103144',1461313579377,'0','6222-4','Queen Palm IgE Ab [Units/volume] in Serum','Queen Palm IgE Qn','ALLERGY',NULL),
('md68a28f79cc8659001525',1461313328232,'0','35678-2','Sodium [Moles/volume] in unspecified time Urine','Sodium ?Tm Ur-sCnc','CHEM',NULL),
('Mda55b6f0eb86262f02794',1461313524942,'0','25170-2','Mercury [Moles/volume] in Blood','Mercury Bld-sCnc','DRUG/TOX',NULL),
('mdac94fbe8e05d1f90675',1461313196140,'0','3255-7','Fibrinogen [Mass/volume] in Platelet poor plasma by Coagulation assay','Fibrinogen PPP-mCnc','COAG',NULL),
('mdc6a3683f93c280601475',1461313320318,'0','10328-3','Lymphocytes/100 leukocytes in Cerebral spinal fluid by Manual count','Lymphocytes NFr CSF Manual','HEM/BC',NULL),
('mdd3a6dd3357e99a80375',1461313148979,'0','728-6','Hypochromia [Presence] in Blood by Light microscopy','Hypochromia Bld Ql Smear','HEM/BC',NULL),
('me13821f5c10afacc03825',1461313685571,'0','12209-3','Eosinophils/100 leukocytes in Body fluid by Manual count','Eosinophil NFr Fld Manual','HEM/BC',NULL),
('Me228394aea4c9dde0544',1461313175834,'0','14913-8','Testosterone [Moles/volume] in Serum or Plasma','Testost SerPl-sCnc','CHEM',NULL),
('Me331a7f4fcbb89cc01694',1461313354008,'0','33716-2','Non-gynecological cytology method study','','ATTACH.CLINRPT',NULL),
('n67df949589cf24150874',1461313226648,'0','22763-7','Ammonia [Mass/volume] in Plasma','Ammonia Plas-mCnc','CHEM',NULL),
('N68fce70775ae3b5c01891',1461313384489,'0','38527-8','Number of specimens received of Stool','# Spec Recd Stl','SPEC',NULL),
('n6d7ede1dd05a7e590174',1461313116835,'0','777-3','Platelets [#/volume] in Blood by Automated count','Platelet # Bld Auto','HEM/BC',NULL),
('n738eea2167257db803124',1461313576519,'0','19803-6','Specimen site Narrative','Specimen site','ENDO.GI',NULL),
('n78e675ce419d495701574',1461313335512,'0','38526-0','Number of specimens tested of Stool','# Spec Tst Stl','SPEC',NULL),
('n79446d5d4ced35a50924',1461313234368,'0','1990-1','Cholecalciferol (Vit D3) [Mass/volume] in Serum or Plasma','Vitamin D3 SerPl-mCnc','CHEM',NULL),
('N7964ff2ffe80ebae01441',1461313315319,'0','3281-3','Lupus anticoagulant [interpretation] in Platelet poor plasma','LAC PPP-Imp','COAG',NULL),
('n7f8aeaccf561b4ce03524',1461313638669,'0','5877-6','Respiratory syncytial virus Ag [Presence] in Unspecified specimen by Immunofluorescence','RSV Ag XXX Ql IF','MICRO',NULL),
('N7fc2916a03a15f2104141',1461313734928,'0','33647-9','Protein.monoclonal/Protein.total in Serum or Plasma by Electrophoresis','M Protein MFr SerPl Elph','CHEM',NULL),
('N8279d3d12e25a2440991',1461313244655,'0','31160-5','Polymorphonuclear cells/100 leukocytes in Blood by Manual count','Polys NFr Bld Manual','HEM/BC',NULL),
('N884f961848b66c020241',1461313127600,'0','22637-3','Pathology report final diagnosis Narrative','Path report.final Dx Spec','TUMRRGT',NULL),
('N88ca0252cf9ed1480341',1461313144098,'0','2514-8','Ketones [Presence] in Urine by Test strip','Ketones Ur Ql Strip','CHEM',NULL),
('N88d443c2a26b5b1202991',1461313555714,'0','2333-3','Gastrin [Mass/volume] in Serum or Plasma','Gastrin SerPl-mCnc','CHEM',NULL),
('n89bb2db56451611d02074',1461313412863,'0','29641-8','Neutrophil Cytoplasmic Ab atypical [Presence] in Serum by Immunofluorescence','Atyp ANCA Ser Ql IF','SERO',NULL),
('N8c35e8154b88996303741',1461313672524,'0','70212-6','Nordiazepam [Moles/volume] in Serum or Plasma by Screen method','Nordiazepam SerPl Scn-sCnc','DRUG/TOX',NULL),
('N8d80eb75133956e702191',1461313430956,'0','13992-3','Albumin/Protein.total in Urine by Electrophoresis','Albumin MFr Ur Elph','CHEM',NULL),
('N8d9ebc46098595dd01841',1461313376657,'0','5199-5','Hepatitis C virus Ab [Presence] in Serum by Immunoblot (IB)','HCV Ab Ser Ql IB','MICRO',NULL),
('N8f3dbfe865c1913f02291',1461313446851,'0','2115-4','Choriogonadotropin.beta subunit free [Moles/volume] in Serum or Plasma','B-HCG Free SerPl-sCnc','CHEM',NULL),
('n8f50aa0841d6f07c02374',1461313459405,'0','17793-1','Immunoglobulin light chains [Mass/volume] in 24 hour Urine','BJ Protein 24h Ur-mCnc','CHEM',NULL),
('n8fbf6d2f692d06aa03924',1461313701039,'0','9360-9','Bartonella quintana IgG Ab [Titer] in Serum','B quintana IgG Titr Ser','MICRO',NULL),
('n907ac82bd0d39e9d01974',1461313397042,'0','10329-1','Monocytes/100 leukocytes in Cerebral spinal fluid by Manual count','Monocytes NFr CSF Manual','HEM/BC',NULL),
('n91b579100ad2b97903624',1461313653939,'0','3187-2','Coagulation factor IX activity actual/normal in Platelet poor plasma by Coagulation assay','Fact IX Act/Nor PPP','COAG',NULL),
('N93c569e6691efc3b03491',1461313634004,'0','808-6','Leukocytes [#/volume] in Pleural fluid by Manual count','WBC # Plr Manual','HEM/BC',NULL),
('n952a3f7db583c9c903574',1461313646583,'0','70205-0','Clonazepam [Moles/volume] in Serum or Plasma by Screen method','Clonazepam SerPl Scn-sCnc','DRUG/TOX',NULL),
('N95a788e1d7adbc2b0641',1461313190792,'0','56598-6','Epstein Barr virus early IgM Ab [Units/volume] in Serum by Immunoassay','EBV EA IgM Ser EIA-aCnc','MICRO',NULL),
('N9916d3158ca3920e02591',1461313493076,'0','28641-9','Bicarbonate [Moles/volume] in Venous cord blood','HCO3 BldCoV-sCnc','CHEM',NULL),
('N9a2672eac555383f0691',1461313198663,'0','624-7','Bacteria identified in Sputum by Respiratory culture','Bacteria Spt Resp Cult','MICRO',NULL),
('Na1c4c23f5740f6cb03791',1461313680431,'0','2749-0','pH of Gastric fluid','pH Gast','CHEM',NULL),
('na36cd8a7b432e97701674',1461313351007,'0','70201-9','Cholesterol in IDL [Moles/volume] in Serum or Plasma','IDLc SerPl-sCnc','CHEM',NULL),
('na51e29088c4851e803274',1461313600323,'0','33242-9','Fungi.filamentous [Presence] in Urine by Computer assisted method','Filament Fungi Ur Ql Comp Assist','UA',NULL),
('na865072d28e4713703224',1461313592269,'0','49839-4','Eosinophils [Presence] in Urine sediment by Wright stain','Eosinophil UrnS Ql Wright Stn','HEM/BC',NULL),
('Naa40d5e645ff45ec02941',1461313547732,'0','27113-0','Streptococcus pneumoniae 8 IgG Ab [Mass/volume] in Serum','S pneum8 IgG Ser-mCnc','MICRO',NULL),
('Naadbd1a5676083150741',1461313206426,'0','20629-2','Levofloxacin [Susceptibility]','Levofloxacin Susc Islt','ABXBACT',NULL),
('nab0800390a31ea2002424',1461313467294,'0','5390-0','Toxoplasma gondii IgM Ab [Units/volume] in Serum by Immunoassay','T gondii IgM Ser EIA-aCnc','MICRO',NULL),
('Nac88d1a7670664420291',1461313135907,'0','26511-6','Neutrophils/100 leukocytes in Blood','Neutrophils NFr Bld','HEM/BC',NULL),
('Nadb3d10cd71173a401091',1461313260770,'0','5569-9','Acetone [Presence] in Urine','Acetone Ur Ql','DRUG/TOX',NULL),
('naef02e9604b37fb402124',1461313420930,'0','9822-8','Bacteria identified in Dialysis fluid by Culture','Bacteria Dial fld Cult','MICRO',NULL),
('naf678fb604dd1eb002824',1461313530089,'0','40908-6','Streptococcus pneumoniae 4 IgG Ab [Mass/volume] in Serum by Immunoassay','S pneum4 IgG Ser EIA-mCnc','MICRO',NULL),
('Nafd59098f0e4b1c603091',1461313571472,'0','42803-7','Bacteria identified in Isolate','Bacteria Islt','MICRO',NULL),
('nb12422f64771f75602474',1461313475175,'0','33437-5','Oxygen [Partial pressure] in Capillary blood by Transcutaneous O2 monitor','pO2 BldC TcO2','PULM',NULL),
('Nb321f6ee991aa7790391',1461313151502,'0','14635-7','Calcidiol [Moles/volume] in Serum or Plasma','25(OH)D3 SerPl-sCnc','CHEM',NULL),
('nb52364551ad8a3270974',1461313242306,'0','12238-2','Neutrophils/100 leukocytes in Body fluid by Manual count','Neutrophils NFr Fld Manual','HEM/BC',NULL),
('Nb546140a3111da2a04091',1461313726997,'0','20456-0','Fungi.yeastlike [Presence] in Urine sediment by Light microscopy','Yeast Like Fungi UrnS Ql Micro','UA',NULL),
('nb624f883bc0bcb710474',1461313164916,'0','934-0','Blood product unit ID [#]','BPU ID','BLDBK',NULL),
('Nb67d82bb637ae8f503441',1461313626240,'0','12598-9','Fat.neutral [Presence] in Stool','Neutral Fat Stl Ql','CHEM',NULL),
('nb6933cdb8a8b39060824',1461313219168,'0','14675-3','Cortisol [Moles/volume] in Serum or Plasma','Cortis SerPl-sCnc','CHEM',NULL),
('Nb7e8d5decd63fca503391',1461313618143,'0','47387-6','Neisseria gonorrhoeae DNA [Presence] in Genital specimen by Probe and target amplification method','N gonorrhoea DNA Genital Ql PCR','MICRO',NULL),
('Nb8a155d9cec62af103341',1461313610337,'0','7613-3','Pistachio IgE Ab [Units/volume] in Serum','Pistachio IgE Qn','ALLERGY',NULL),
('nbeb36e72ee0af04a01624',1461313343118,'0','6087-1','Corn IgE Ab [Units/volume] in Serum','Corn IgE Qn','ALLERGY',NULL),
('nbfc28156fded824c0524',1461313172371,'0','2703-7','Oxygen [Partial pressure] in Arterial blood','pO2 BldA','CHEM',NULL),
('nc1c2dc23500ab1d102524',1461313482789,'0','38404-0','CFTR gene mutation analysis in Blood or Tissue by Molecular genetics method Narrative','CFTR Mut Anal Bld/T','MOLPATH.MUT',NULL),
('Nc3907453f612acdd01391',1461313307863,'0','44877-9','Insulin dependent diabetes mellitus [Presence]','IDDM Patient Ql','MISC',NULL),
('nc4d966fbbe98112f01224',1461313282071,'0','48803-1','Neural tube defect risk in Fetus','Neural tube defect risk Fetus','CHEM',NULL),
('nc92be5ed484b62ab02024',1461313405248,'0','35741-8','Prostate specific Ag [Mass/volume] in Serum or Plasma by Detection limit <= 0.01 ng/mL','PSA SerPl DL<=0.01 ng/mL-mCnc','CHEM',NULL),
('nc9555d2bfa65074101274',1461313289694,'0','18185-9','Gestational age','GA','OB.US',NULL),
('Nc9b68d02c9fcd67a01491',1461313322908,'0','43995-0','Trisomy 21 risk in Fetus','Ts 21 risk Fetus','CHEM',NULL),
('Nca6271da04e90be303041',1461313563610,'0','22296-8','Epstein Barr virus nuclear Ab [Presence] in Serum','EBV NA Ab Ser Ql','MICRO',NULL),
('Ncab8e17f6381506004191',1461313742883,'0','5776-0','Calcium sulfate crystals [Presence] in Urine sediment by Light microscopy','Ca Sulfate Cry UrnS Ql Micro','UA',NULL),
('ncd9fe6bff7129ec803674',1461313661886,'0','22111-9','Bartonella henselae IgM Ab [Titer] in Serum','B henselae IgM Titr Ser','MICRO',NULL),
('ncdf0fd80a8c722630424',1461313157001,'0','20565-8','\"Carbon dioxide',' total [Moles/volume] in Blood\"','CO2 Bld-sCnc',NULL),
('Nce05790a61057f8102641',1461313500974,'0','26447-3','Blasts/100 leukocytes in Cerebral spinal fluid','Blasts NFr CSF','HEM/BC',NULL),
('Ncfafab42b99fb44902241',1461313438778,'0','2467-9','IgG subclass 2 [Mass/volume] in Serum','IgG2 Ser-mCnc','CHEM',NULL),
('nd0425968f673cd8e01724',1461313359088,'0','13953-5','Hepatitis B virus e Ab [Presence] in Serum by Immunoassay','HBV e Ab Ser Ql EIA','MICRO',NULL),
('Nd0a23800fd1908ed03841',1461313688211,'0','5005-4','Epstein Barr virus DNA [Presence] in Unspecified specimen by Probe and target amplification method','EBV DNA XXX Ql PCR','MICRO',NULL),
('nd15c81d3487390dc01324',1461313297491,'0','21262-1','Escherichia coli shiga-like [Presence] in Stool by Immunoassay','E coli SLTEC Stl Ql EIA','MICRO',NULL),
('Nd15d03bc70d426ec02541',1461313485505,'0','49573-9','HIV genotype [Susceptibility] in Isolate by Genotype method Narrative','HIV Gentyp Islt','ABXBACT',NULL),
('nd34898606de9be3e04024',1461313716550,'0','29591-5','Enterovirus RNA [Presence] in Unspecified specimen by Probe and target amplification method','EV RNA XXX Ql PCR','MICRO',NULL),
('Nd38d5130f0a356a601141',1461313268300,'0','1922-4','Base deficit in Arterial blood','Base deficit BldA-sCnc','CHEM',NULL),
('Nd4e3d3eb3ce958b001941',1461313392361,'0','11545-1','Microscopic observation [Identifier] in Unspecified specimen by Acid fast stain','Acid fast Stn XXX','MICRO',NULL),
('nd698d0f3a819042e0574',1461313180244,'0','883-9','ABO group [Type] in Blood','ABO Group Bld','BLDBK',NULL),
('nd85fda10a4a141b902774',1461313521975,'0','30339-6','Epstein Barr virus capsid IgG Ab [Presence] in Serum','EBV VCA IgG Ser Ql','MICRO',NULL),
('nd886b70cc5b71f9b03174',1461313584398,'0','7287-6','Dog Fennel IgE Ab [Units/volume] in Serum','Dog Fennel IgE Qn','ALLERGY',NULL),
('Nd9b8983ae10df81a02691',1461313508955,'0','5352-0','Sjogrens syndrome-A extractable nuclear Ab [Presence] in Serum by Immune diffusion (ID)','ENA SS-A Ab Ser Ql ID','SERO',NULL),
('ndad6122452f7087b03974',1461313708928,'0','49058-1','Activated partial thromboplastin time (aPTT) in Blood drawn from CRRT circuit by Coagulation assay','aPTT Time BldCRRT','COAG',NULL),
('Ndb4967a8f018e72801041',1461313252571,'0','6864-3','Hemoglobin S [Presence] in Blood by Solubility test','Hgb S Bld Ql Soly','HEM/BC',NULL),
('Ndf5de29c37b4fd4e03691',1461313664327,'0','8087-9','Parietal cell Ab [Units/volume] in Serum','PCA Ab Ser-aCnc','SERO',NULL),
('Ne283942685e99b2401791',1461313369118,'0','6412-1','Giardia lamblia Ag [Presence] in Stool by Immunoassay','G lamblia Ag Stl Ql EIA','MICRO',NULL),
('Ne47c75c4cd9b852801541',1461313330464,'0','2078-4','Chloride [Moles/volume] in Urine','Chloride Ur-sCnc','CHEM',NULL),
('ne67a1f30af346de102874',1461313537815,'0','49540-8','Acid citrate dextrose [Volume] in Blood product unit','Acid citrate dextrose Vol BPU','BLDBK',NULL),
('O6a7974171ea6d36d02647',1461313501944,'0','6136-6','Hazelnut IgE Ab [Units/volume] in Serum','Hazelnut IgE Qn','ALLERGY',NULL),
('O6faf5132291c68bc0347',1461313145058,'0','3016-3','Thyrotropin [Units/volume] in Serum or Plasma','TSH SerPl-aCnc','CHEM',NULL),
('O6feedc08945b60ed01847',1461313378051,'0','42637-9','Natriuretic peptide B [Mass/volume] in Blood','BNP Bld-mCnc','CHEM',NULL),
('O704d07bebe8ddd1703047',1461313564521,'0','2999-1','Thiamine [Mass/volume] in Serum or Plasma','Vit B1 SerPl-mCnc','CHEM',NULL),
('o7099262863e4558103307',1461313605487,'0','13948-5','Coccidioides immitis IgM Ab [Presence] in Serum by Immunoassay','C immitis IgM Ser Ql EIA','MICRO',NULL),
('o7377bc85d28457d803457',1461313628589,'0','23925-1','Penicillin [Susceptibility] by Gradient strip (E-test)','Penicillin Islt E-test','ABXBACT',NULL),
('o759af2096ef0000c01557',1461313332812,'0','3243-3','Thrombin time in Platelet poor plasma by Coagulation assay','TT Time PPP','COAG',NULL),
('O76bf26524182e00801447',1461313316339,'0','33804-6','RBC casts [Presence] in Urine sediment by Light microscopy','RBC Casts UrnS Ql Micro','UA',NULL),
('O78e6cb0208389b4a03797',1461313681359,'0','34696-5','Collection method [Type] of Semen','Collection meth0d Smn','SPEC',NULL),
('o793db37b9b93df7403357',1461313613228,'0','26479-6','Lymphocytes/100 leukocytes in Cerebral spinal fluid','Lymphocytes NFr CSF','HEM/BC',NULL),
('o7d98c04ad568f00f01407',1461313310070,'0','49090-4','Trisomy 21 risk based on maternal age in Fetus','Ts 21risk-age Fetus','CHEM',NULL),
('o84a611db3d02bddf02657',1461313503364,'0','24469-9','Hemoglobin XXX/Hemoglobin.total in Blood by Electrophoresis','Hgb XXX MFr Bld Elph','HEM/BC',NULL),
('o84fdcc82a3936b5903407',1461313620475,'0','4633-4','Hemoglobin F/Hemoglobin.total in Blood by Kleihauer-Betke method','Hgb F MFr Bld Kleih Betke','HEM/BC',NULL),
('o86f42a994c97870103857',1461313690785,'0','3436-3','Carboxy tetrahydrocannabinol [Mass/volume] in Urine','CarboxyTHC Ur-mCnc','DRUG/TOX',NULL),
('o8b69d8d3897de93e04107',1461313729354,'0','33215-5','Neutrophils.agranular [Presence] in Blood by Light microscopy','Agran Neuts Bld Ql Smear','HEM/BC',NULL),
('o911bd637da4b54f303807',1461313682888,'0','2030-5','Carboxyhemoglobin/Hemoglobin.total in Arterial blood','COHgb MFr BldA','CHEM',NULL),
('O9257dd544869fdd902197',1461313432275,'0','801-1','Sickle cells [Presence] in Blood by Light microscopy','Sickle Cells Bld Ql Smear','HEM/BC',NULL),
('o928b296133e3cdea02557',1461313487945,'0','19839-0','Breath rate spontaneous --on ventilator','Breaths.spontaneous on vent','PULM',NULL),
('o9798336275cb2e4601107',1461313263218,'0','803-7','Toxic granules [Presence] in Blood by Light microscopy','Toxic Granules Bld Ql Smear','HEM/BC',NULL),
('o9a153372ae2b305b02207',1461313433738,'0','40750-2','Epstein Barr virus capsid IgG Ab [Presence] in Serum by Immunofluorescence','EBV VCA IgG Ser Ql IF','MICRO',NULL),
('O9a5eb2093668cf5201797',1461313369979,'0','2915-7','Renin [Enzymatic activity/volume] in Plasma','Renin Plas-cCnc','CHEM',NULL),
('O9b155cdb5bf108ee0297',1461313136635,'0','5821-4','Leukocytes [#/area] in Urine sediment by Microscopy high power field','WBC #/area UrnS HPF','UA',NULL),
('O9b20214f082a61ea02297',1461313447728,'0','19076-9','Cells Counted Total [#] in Unspecified specimen','Total Cells Counted XXX','HEM/BC',NULL),
('O9c79bf1fef9214ab01097',1461313261522,'0','48065-7','Fibrin D-dimer FEU [Mass/volume] in Platelet poor plasma','D dimer FEU PPP-mCnc','COAG',NULL),
('O9d269d6ab9c7ca9303347',1461313611381,'0','41279-1','Borrelia burgdorferi IgG Ab/IgM Ab [Ratio] in Serum','B burgdor IgG/IgM Ser-Rto','MICRO',NULL),
('O9de0f2f16c2e55af02247',1461313439581,'0','14277-8','Neutrophil cytoplasmic Ab.classic [Titer] in Serum by Immunofluorescence','c-ANCA Titr Ser IF','SERO',NULL),
('O9e5b0349939904d203397',1461313619121,'0','7917-8','HIV 1 Ab [Presence] in Serum','HIV1 Ab Ser Ql','MICRO',NULL),
('o9f212fe383df5bd60607',1461313185501,'0','702-1','Anisocytosis [Presence] in Blood by Light microscopy','Anisocytosis Bld Ql Smear','HEM/BC',NULL),
('o9f7e08738835d3d003107',1461313574080,'0','5357-9','Smith extractable nuclear Ab [Presence] in Serum by Immune diffusion (ID)','ENA SM Ab Ser Ql ID','SERO',NULL),
('o9fab72dbfd49ab3a0357',1461313146412,'0','19763-2','Specimen source [Identifier] in Cervical or vaginal smear or scraping by Cyto stain','Specimen source Cvx/Vag Cyto','CYTO',NULL),
('o9ff4ae46446e80a003757',1461313674865,'0','65757-7','Kidney Pathology biopsy report','Kidney Path Bx report','PATH',NULL),
('oa358648735282b4c04207',1461313745190,'0','18309-5','Nucleated erythrocytes/100 leukocytes [Ratio] in Blood by Manual count','nRBC/100 WBC Bld Manual-Rto','HEM/BC',NULL),
('Oa3f2b0e3a73d0c8a02947',1461313549093,'0','40923-5','Streptococcus pneumoniae 9 IgG Ab [Mass/volume] in Serum by Immunoassay','S pneum9 IgG Ser EIA-mCnc','MICRO',NULL),
('Oa44c510b08865db902597',1461313494087,'0','28644-3','Carbon dioxide [Partial pressure] in Arterial cord blood','pCO2 BldCoA','CHEM',NULL),
('Oa5560124a60c2e750997',1461313245551,'0','20564-1','Oxygen saturation in Blood','SaO2 % Bld','HEMODYN.MOLEC',NULL),
('Oa71004936bb01d8003747',1461313673528,'0','49588-7','First trimester maternal screen with nuchal translucency [interpretation] Narrative','1st trimester scn+NT Patient-Imp','CHEM',NULL),
('Oa756a4066bd5f0ec01947',1461313393330,'0','14757-9','Glucose [Moles/volume] in Serum or Plasma --2 hours post 100 g glucose PO','Glucose 2h p 100 g Glc PO SerPl-sCnc','CHAL',NULL),
('Oafac09479bcfeebf0747',1461313207353,'0','35591-7','Creatinine renal clearance predicted by Cockcroft-Gault formula','Creat Cl predicted SerPl C-G-vRate','CHEM',NULL),
('Ob182f654cc1324810397',1461313152772,'0','1994-3','Calcium.ionized [Moles/volume] in Blood','Ca-I Bld-sCnc','CHEM',NULL),
('ob313ce8be379661203007',1461313557937,'0','27939-8','Collagen crosslinked N-telopeptide [Moles/volume] in Urine','Collagen NTx Ur-sCnc','CHEM',NULL),
('ob47e9875c22fae3c02707',1461313511579,'0','11140-1','Metanephrine [Moles/time] in 24 hour Urine','Metaneph 24h Ur-sRate','CHEM',NULL),
('ob92230a7ab520b6802157',1461313425740,'0','32637-1','Urease [Presence] in Tissue','Urease Tiss Ql','MICRO',NULL),
('Ob92b296ff4fea51303847',1461313689014,'0','3861-2','Nordiazepam [Presence] in Urine','Nordiazepam Ur Ql','DRUG/TOX',NULL),
('ob9f403b20d067b5802607',1461313495851,'0','44447-1','Beta 2 glycoprotein 1 IgA Ab [Units/volume] in Serum by Immunoassay','B2 Glycoprot1 IgA Ser EIA-aCnc','COAG',NULL),
('Oba0f575c7828d9600247',1461313128429,'0','30180-4','Basophils/100 leukocytes in Blood','Basophils NFr Bld','HEM/BC',NULL),
('Obac9dc9754e763690647',1461313191794,'0','18998-5','Trimethoprim+Sulfamethoxazole [Susceptibility]','TMP SMX Susc Islt','ABXBACT',NULL),
('Obb16ee072821ebe502697',1461313510058,'0','38544-3','Spermatozoa [#/volume] in Semen --pre washing','Sperm Pre Wash # Smn','FERT',NULL),
('Obb90ed9b8e0c88b104197',1461313743744,'0','32033-3','Phosphatidylserine IgM Ab [Units/volume] in Serum by Immunoassay','PS IgM Ser EIA-aCnc','COAG',NULL),
('obc7cd37994bfbe170257',1461313130233,'0','5803-2','pH of Urine by Test strip','pH Ur Strip','UA',NULL),
('obe20d2092a389dd00657',1461313193107,'0','13362-9','Collection duration of Urine','Collect duration Time Ur','SPEC',NULL),
('Oc062473967840bd804147',1461313736072,'0','2027-1','\"Carbon dioxide',' total [Moles/volume] in Venous blood\"','CO2 BldV-sCnc',NULL),
('Oc07e6987d32fcff801047',1461313253499,'0','2708-6','Oxygen saturation in Arterial blood','SaO2 % BldA','CHEM',NULL),
('oc344386abf55bc9c0757',1461313208941,'0','31147-2','Reagin Ab [Titer] in Serum by RPR','RPR Ser-Titr','MICRO',NULL),
('oc346185f96e906dc03057',1461313566041,'0','20999-9','Cell Fractions/Differential [interpretation] in Body fluid','Cell Fract Fld-Imp','HEM/BC',NULL),
('oc4c0fe929b32977c0307',1461313138106,'0','11555-0','Base excess in Blood','Base excess Bld-sCnc','CHEM',NULL),
('oc8131c3b73e2be4602257',1461313441485,'0','18500-9','Microscopic observation [Identifier] in Cervix by Cyto stain.thin prep','Thin Prep Cervix','CYTO',NULL),
('Oc9cb85a1228cb15503097',1461313572617,'0','19429-0','Propoxyphene [Presence] in Urine by Screen method','Propoxyph Ur Ql Scn','DRUG/TOX',NULL),
('Oc9cc1225eaba2d7f01547',1461313331409,'0','47223-3','Trisomy 18 risk based on maternal age in Fetus','Ts 18 risk-Age Fetus','CHEM',NULL),
('Ocae9e1589a1bef6802997',1461313556624,'0','5191-2','Hepatitis B virus e Ag [Units/volume] in Serum by Immunoassay','HBV e Ag Ser EIA-aCnc','MICRO',NULL),
('ocb70826834f7d1e501057',1461313254912,'0','29574-1','Thyrotropin [Presence] in Dried blood spot','TSH DBS Ql','CHEM',NULL),
('Ocb788400b232969201147',1461313269228,'0','772-4','Nucleated erythrocytes [#/volume] in Blood by Manual count','nRBC # Bld Manual','HEM/BC',NULL),
('ocd2ec53763d1aa1201807',1461313371408,'0','6182-0','Mucor racemosus IgE Ab [Units/volume] in Serum','M racemosus IgE Qn','ALLERGY',NULL),
('ocfa3c0388e0c682001507',1461313325574,'0','49121-7','Erythrocyte inclusion bodies [Identifier] in Blood','RBC inclusions Bld','HEM/BC',NULL),
('Od340f6a7244fb1c903447',1461313627059,'0','6194-5','Orange IgE Ab [Units/volume] in Serum','Orange IgE Qn','ALLERGY',NULL),
('od4045dbe802bab290707',1461313201120,'0','59826-8','Creatinine [Moles/volume] in Blood','Creat Bld-sCnc','CHEM',NULL),
('od649512a4c446e2001457',1461313317776,'0','6584-7','Virus identified in Unspecified specimen by Culture','Virus XXX Cult','MICRO',NULL),
('Od6de5fe725afbd6a03697',1461313665355,'0','23876-6','HIV 1 RNA [Units/volume] (viral load) in Plasma by Probe and signal amplification method','HIV1 RNA Plas bDNA-aCnc','MICRO',NULL),
('od7ea22243315dcaa02307',1461313449117,'0','5095-5','Coccidioides immitis Ab [Presence] in Serum by Immune diffusion (ID)','C immitis Ab Ser Ql ID','MICRO',NULL),
('oda02dbd6da9e2d8901157',1461313271558,'0','4546-8','Hemoglobin A/Hemoglobin.total in Blood','Hgb A MFr Bld','HEM/BC',NULL),
('Oda8f9a121bd2950b01397',1461313308749,'0','14563-1','Hemoglobin.gastrointestinal [Presence] in Stool --1st specimen','Hemoccult sp1 Stl Ql','CHEM',NULL),
('oddabcbf5aa52e4f601007',1461313246980,'0','34713-8','Clostridium difficile toxin A+B [Presence] in Stool','C dif Tox A+B Stl Ql','MICRO',NULL),
('ode36e4f6cd571ed901907',1461313386720,'0','51597-3','Glucose [Moles/volume] in Serum or Plasma --1 hour post 75 g glucose PO','Glucose 1h p 75 g Glc PO SerPl-sCnc','CHAL',NULL),
('odfe81d7196b180c004157',1461313737542,'0','25149-6','Calcium phosphate crystals [#/area] in Urine sediment by Microscopy high power field','Ca Phos Cry #/area UrnS HPF','UA',NULL),
('oe0abf3e587a36da903707',1461313667351,'0','6037-6','Barley IgE Ab [Units/volume] in Serum','Barley IgE Qn','ALLERGY',NULL),
('Oe2297e5dd9e3a3f202547',1461313486341,'0','23761-0','Neutrophils/100 leukocytes in Blood by Manual count','Neutrophils NFr Bld Manual','HEM/BC',NULL),
('oe39d4aaceae8fe8301857',1461313379465,'0','20513-8','Turbidity of Body fluid Qualitative','Turbidity Fld Ql','SPEC',NULL),
('Oe442be2af11d92aa04097',1461313727908,'0','5807-3','RBC casts [#/area] in Urine sediment by Microscopy low power field','RBC Casts #/area UrnS LPF','UA',NULL),
('oe45988cc438111f002957',1461313550816,'0','27092-6','Streptococcus pneumoniae 1 IgG Ab [Mass/volume] in Serum','S pneum1 IgG Ser-mCnc','MICRO',NULL),
('Oe4dc800427dea9840697',1461313199399,'0','50388-8','Neisseria gonorrhoeae rRNA [Presence] in Cervix by Probe and target amplification method','N gonorrhoea rRNA Cervix Ql PCR','MICRO',NULL),
('Oe4f896a709db1f7901497',1461313323661,'0','6096-2','European house dust mite IgE Ab [Units/volume] in Serum','D pteronyss IgE Qn','ALLERGY',NULL),
('Oe6892317e3f5889d01897',1461313385191,'0','22747-0','Gentamicin [Moles/volume] in Serum or Plasma --trough','Gentamicin Trough SerPl-sCnc','DRUG/TOX',NULL),
('p686bbfe90865aeef02209',1461313434039,'0','6019-4','Almond IgE Ab [Units/volume] in Serum','Almond IgE Qn','ALLERGY',NULL),
('p6b7c67b0f925183c03709',1461313667694,'0','7632-3','Privet IgE Ab [Units/volume] in Serum','Privet IgE Qn','ALLERGY',NULL),
('p6cbe3938ddb2890301459',1461313318010,'0','19343-3','Amphetamine [Presence] in Urine by Screen method','Amphet Ur Ql Scn','DRUG/TOX',NULL),
('P6dd294c47d3bc87e02149',1461313424354,'0','6186-1','Nettle IgE Ab [Units/volume] in Serum','Nettle IgE Qn','ALLERGY',NULL),
('p73b55a02d4886e8a03359',1461313613546,'0','70218-3','Triglyceride [Moles/volume] in Blood','Trigl Bld-sCnc','CHEM',NULL),
('P7454083f5b68d0e302299',1461313447962,'0','33673-5','Thrombin time.factor substitution in Platelet poor plasma by Coagulation assay --immediately after addition of protamine sulfate','TT imm SO4 Time PPP','COAG',NULL),
('P746aca66f82c7acc01449',1461313316648,'0','703-9','Basophilic stippling [Presence] in Blood by Light microscopy','Baso Stipl Bld Ql Smear','HEM/BC',NULL),
('P758728d630338a6f03299',1461313604217,'0','5255-5','Mycoplasma pneumoniae IgG Ab [Units/volume] in Serum by Immunoassay','M pneumo IgG Ser EIA-aCnc','MICRO',NULL),
('p75b69435375cda530309',1461313138432,'0','47527-7','Cytology report of Cervical or vaginal smear or scraping Cyto stain.thin prep','Cytology Cvx/Vag Doc Thin Prep','CYTO',NULL),
('P760f62489dd47d7904099',1461313728167,'0','38995-7','Mixed cellular casts [#/area] in Urine sediment by Microscopy low power field','Mixed Cell Casts #/area UrnS LPF','UA',NULL),
('p781733654be95db003059',1461313566358,'0','70206-8','Codeine [Moles/volume] in Urine by Confirmatory method','Codeine Ur Cfm-sCnc','DRUG/TOX',NULL),
('P79546ebb9779cda901149',1461313269595,'0','806-0','Leukocytes [#/volume] in Cerebral spinal fluid by Manual count','WBC # CSF Manual','HEM/BC',NULL),
('P79c615f6782efc0201949',1461313393607,'0','21033-6','Yeast.budding [Presence] in Urine sediment','Yeast Budding UrnS Ql','UA',NULL),
('p7a3a045014fd211002709',1461313511937,'0','28643-5','Oxygen saturation in Venous cord blood','SaO2 % BldCoV','CHEM',NULL),
('p7a9bd8b6f00b8bf803809',1461313683147,'0','11034-6','Acetylcholine receptor binding Ab [Moles/volume] in Serum','AChR Bind Ab Ser-sCnc','SERO',NULL),
('P7bdebcd862e48cad0699',1461313199700,'0','35691-5','XXX microorganism DNA [Presence] in Unspecified specimen by Probe and target amplification method','Other microorganism DNA XXX Ql PCR','MICRO',NULL),
('p7c62c7a3aef4c4c702959',1461313551084,'0','27227-8','Streptococcus pneumoniae 1 IgG Ab [Mass/volume] in Serum by Immunoassay','S pneum1 IgG Ser EIA-mCnc','MICRO',NULL),
('P822cf17b40b6a80801399',1461313308975,'0','20447-9','HIV 1 RNA [#/volume] (viral load) in Serum or Plasma by Probe and target amplification method','HIV1 RNA # SerPl PCR','MICRO',NULL),
('p8247e0c00fd43b9a04109',1461313730154,'0','5788-5','Oval fat bodies (globules) [#/area] in Urine sediment by Microscopy high power field','Oval fat bodies #/area UrnS HPF','UA',NULL),
('P8264b98e5ce3b0be02599',1461313494322,'0','2956-1','Sodium [Moles/time] in 24 hour Urine','Sodium 24h Ur-sRate','CHEM',NULL),
('p84273a2ebbfab0bf02659',1461313503674,'0','771-6','Nucleated erythrocytes [#/volume] in Blood by Automated count','nRBC # Bld Auto','HEM/BC',NULL),
('p871eaeafff9f558b03859',1461313691086,'0','41163-7','Treponema pallidum DNA [Presence] in Unspecified specimen by Probe and target amplification method','T pallidum DNA XXX Ql PCR','MICRO',NULL),
('p87bc116552b7be1f02609',1461313496193,'0','9784-0','Ehrlichia chaffeensis IgM Ab [Titer] in Serum','E chaffeensis IgM Titr Ser','MICRO',NULL),
('p8ae0d3eece9252b701509',1461313325884,'0','13967-5','Sex hormone binding globulin [Moles/volume] in Serum or Plasma','SHBG SerPl-sCnc','CHEM',NULL),
('p8e53a30a941b312903009',1461313558237,'0','16130-7','Herpes simplex virus 1 DNA [Presence] in Unspecified specimen by Probe and target amplification method','HSV1 DNA XXX Ql PCR','MICRO',NULL),
('p90d78db697bab24c0359',1461313146722,'0','13969-1','Creatine kinase.MB [Mass/volume] in Serum or Plasma','CK MB SerPl-mCnc','CHEM',NULL),
('p920b4dbb03c38d9a01859',1461313379758,'0','48035-0','Hemoglobin [Presence] in Cerebral spinal fluid','Hgb CSF Ql','HEM/BC',NULL),
('p927777c7997b805801159',1461313271858,'0','49541-6','Fasting status [Presence] - Reported','Fasting status Patient Ql Reported','MISC',NULL),
('p94e1b60d08ef7e6204209',1461313745491,'0','5156-5','Epstein Barr virus nuclear IgG Ab [Presence] in Serum by Immunoassay','EBV NA IgG Ser Ql EIA','MICRO',NULL),
('P95074d157dc0d7eb03099',1461313572917,'0','25415-1','Folate [Moles/volume] in Blood','Folate Bld-sCnc','CHEM',NULL),
('P9571812e868abe2c0649',1461313192162,'0','43304-5','Chlamydia trachomatis rRNA [Presence] in Unspecified specimen by Probe and target amplification method','C trach rRNA XXX Ql PCR','MICRO',NULL),
('P97cbf7bef2ad480604199',1461313743979,'0','20578-1','Vancomycin [Mass/volume] in Serum or Plasma','Vancomycin SerPl-mCnc','DRUG/TOX',NULL),
('p97db5d64e01c32990609',1461313185810,'0','707-0','Basophils/100 leukocytes in Blood by Manual count','Basophils NFr Bld Manual','HEM/BC',NULL),
('p9d45c37afbf2e35403759',1461313675216,'0','65752-8','Liver Pathology biopsy report','Liver Path Bx report','PATH',NULL),
('p9e2466a0d3b19cfb01109',1461313263553,'0','33358-3','Protein.monoclonal [Mass/volume] in Serum or Plasma by Electrophoresis','M Protein SerPl Elph-mCnc','CHEM',NULL),
('P9e3409ede8ca189802199',1461313432576,'0','14582-1','Acetone [Moles/volume] in Serum or Plasma','Acetone SerPl-sCnc','DRUG/TOX',NULL),
('p9ff113622c5de09502559',1461313488187,'0','13539-2','Phosphate [Moles/volume] in Urine','Phosphate Ur-sCnc','CHEM',NULL),
('pa1142a7e8628409403309',1461313605771,'0','25474-8','Metanephrines [Moles/volume] in Serum or Plasma','MetanephS SerPl-sCnc','CHEM',NULL),
('pa42cf9fd05b04ef403459',1461313628815,'0','29901-6','HTLV 1+2 Ab [Presence] in Serum by Immunoassay','HTLV1+2 Ab Ser Ql EIA','MICRO',NULL),
('pa508dafdcffcf5280259',1461313130459,'0','1759-0','Albumin/Globulin [Mass ratio] in Serum or Plasma','Albumin/Glob SerPl-mRto','CHEM',NULL),
('Pa89d9bc03e58eac902549',1461313486650,'0','5297-7','Rheumatoid factor [Presence] in Serum by Latex agglutination','Rheumatoid fact Ser Ql LA','SERO',NULL),
('Padfa9d693650f9e103799',1461313681717,'0','7901-2','Helicobacter pylori IgA Ab [Units/volume] in Serum','H pylori IgA Ser-aCnc','MICRO',NULL),
('Pae5a465d558f2f7e0349',1461313145309,'0','6298-4','Potassium [Moles/volume] in Blood','Potassium Bld-sCnc','CHEM',NULL),
('pafe3b082cd9f64d90659',1461313193425,'0','11125-2','Platelet morphology finding [Identifier] in Blood','Plat morph Bld','HEM/BC',NULL),
('pb014afabd36ca54201059',1461313255155,'0','19994-3','Oxygen/Inspired gas setting [Volume Fraction] Ventilator','O2/Inspired gas setting VFr Vent','PULM',NULL),
('pb2994a696470872301409',1461313310371,'0','21026-0','Pathologist interpretation of Blood tests','Path Interp Bld-Imp','PATH',NULL),
('Pb4ff2864f212d9800399',1461313153140,'0','600-7','Bacteria identified in Blood by Culture','Bacteria Bld Cult','MICRO',NULL),
('Pb52060fc4ab9858b0749',1461313207746,'0','32356-8','Yeast [Presence] in Urine sediment by Light microscopy','Yeast UrnS Ql Micro','UA',NULL),
('Pb577078d194b18db03449',1461313627369,'0','5170-6','Gliadin IgG Ab [Units/volume] in Serum','Gliadin IgG Ser-aCnc','SERO',NULL),
('pb6119c7cca78f3d904159',1461313737785,'0','25158-7','Oval fat bodies (globules) [Presence] in Urine sediment by Light microscopy','Oval fat bodies UrnS Ql Micro','UA',NULL),
('pb62e2144fd52de2f03409',1461313620775,'0','4821-5','HLA-B27 [Presence]','HLA-B27 Ql','HLA',NULL),
('pb631e2decb9dbdfc0709',1461313201421,'0','15150-6','Anisocytosis [Presence] in Blood by Automated count','Anisocytosis Bld Ql Auto','HEM/BC',NULL),
('Pbacb3431abeee41501549',1461313331692,'0','14633-2','C peptide [Moles/volume] in Serum or Plasma','C peptide SerPl-sCnc','CHEM',NULL),
('Pbee759f7c7ed9a7701049',1461313253800,'0','5209-2','Herpes simplex virus 2 IgG Ab [Units/volume] in Serum by Immunoassay','HSV2 IgG Ser EIA-aCnc','MICRO',NULL),
('Pbfb3ba41dc5215c103349',1461313611633,'0','7883-2','Epstein Barr virus nuclear IgG Ab [Presence] in Serum','EBV NA IgG Ser Ql','MICRO',NULL),
('Pbff8d76982eb31960999',1461313245778,'0','8122-4','CD3 cells [#/volume] in Blood','CD3 Cells # Bld','CELLMARK',NULL),
('Pc30627286177b27802649',1461313502286,'0','9660-2','HIV 1 gp160 Ab [Presence] in Serum by Immunoblot (IB)','HIV1 gp160 Ab Ser Ql IB','MICRO',NULL),
('pc403e4d5316d79f802159',1461313426042,'0','46248-1','Borrelia burgdorferi IgG and IgM [interpretation] in Serum by Immunoassay','B burgdor IgG+IgM Ser EIA-Imp','MICRO',NULL),
('Pc57693fb09f9b39603049',1461313564829,'0','35452-2','HIV 1 gp40 Ab [Presence] in Serum by Immunoblot (IB)','HIV1 gp40 Ab Ser Ql IB','MICRO',NULL),
('Pc65c043028a9248202249',1461313440168,'0','14278-6','Neutrophil cytoplasmic Ab.perinuclear [Titer] in Serum by Immunofluorescence','p-ANCA Titr Ser IF','SERO',NULL),
('Pcb0e7f87f0bab2aa01799',1461313370214,'0','27416-7','SCL-70 extractable nuclear Ab [Units/volume] in Serum','ENA Scl70 Ab Ser-aCnc','SERO',NULL),
('pcd26ed185c4597c201009',1461313247414,'0','26510-8','Neutrophils.band form/100 leukocytes in Body fluid','Neuts Band NFr Fld','HEM/BC',NULL),
('Pce35de9ded92687203849',1461313689265,'0','12361-2','Oxazepam [Presence] in Urine','Oxazepam Ur Ql','DRUG/TOX',NULL),
('Pce730ee7c695aabb01849',1461313378455,'0','9327-8','Phosphatidylserine IgM Ab [Presence] in Serum by Immunoassay','PS IgM Ser Ql EIA','COAG',NULL),
('Pce8d8e36f725b2f802699',1461313510367,'0','38540-1','Spermatozoa Motile/100 spermatozoa in Semen --pre washing','Sperm Motile Pre Wash NFr Smn','FERT',NULL),
('Pcff2856dfcc8fb5101099',1461313261823,'0','2110-5','Choriogonadotropin.beta subunit (pregnancy test) [Presence] in Serum or Plasma','B-HCG Preg SerPl Ql','CHEM',NULL),
('pd0715e3021bf8b8102309',1461313449418,'0','8187-7','Benzoylecgonine [Presence] in Meconium','BZE Mec Ql','DRUG/TOX',NULL),
('Pd3d6a389c39fd4220249',1461313128888,'0','3097-3','Urea nitrogen/Creatinine [Mass ratio] in Serum or Plasma','BUN/Creat SerPl-mRto','CHEM',NULL),
('pd4167f9088f49dad01909',1461313387029,'0','14836-1','Methotrexate [Moles/volume] in Serum or Plasma','MTX SerPl-sCnc','DRUG/TOX',NULL),
('Pd435caa7507dcb9b01899',1461313385508,'0','14753-8','Glucose [Moles/volume] in Serum or Plasma --1 hour post 100 g glucose PO','Glucose 1h p 100 g Glc PO SerPl-sCnc','CHAL',NULL),
('Pda3856ec6416b9ff02999',1461313556925,'0','26458-0','Erythrocytes [#/volume] in Synovial fluid','RBC # Snv','HEM/BC',NULL),
('pdacd01b9958de6a301559',1461313333113,'0','19270-8','Barbiturates [Presence] in Urine by Screen method','Barbiturates Ur Ql Scn','DRUG/TOX',NULL),
('pdb1ba1b3afa5ccd601809',1461313371717,'0','49544-0','Newborn screening recommended follow-up [interpretation]','NB screen recommended f/u Patient-Imp','CHEM',NULL),
('Pdcb74a9403c677ac03399',1461313619447,'0','17122-3','CD19+Kappa+ cells/100 cells in Blood','CD19+Kappa+ Cells NFr Bld','CELLMARK',NULL),
('pde022951ed4b67a80759',1461313209208,'0','25428-4','Glucose [Presence] in Urine by Test strip','Glucose Ur Ql Strip','UA',NULL),
('Pdf101e686cbf9c0103699',1461313665980,'0','42621-3','Mycoplasma hominis DNA [Presence] in Blood by Probe and target amplification method','M hominis DNA Bld Ql PCR','MICRO',NULL),
('Pdf58ed67bed8817504149',1461313736389,'0','5815-6','Tyrosine crystals [Presence] in Urine sediment by Light microscopy','Tyrosine Cry UrnS Ql Micro','UA',NULL),
('Pe0c8ba0fa55528510299',1461313136894,'0','22702-5','Ketones [Moles/volume] in Urine by Test strip','Ketones Ur Strip-sCnc','UA',NULL),
('Pe18e9afcbb24f08f03749',1461313673754,'0','611-4','Bacteria identified in Body fluid by Culture','Bacteria Fld Cult','MICRO',NULL),
('pe1cf8dd18140bcdc02259',1461313442136,'0','13987-3','Alpha 2 globulin/Protein.total in 24 hour Urine by Electrophoresis','Alpha2 Glob 24h MFr Ur Elph','CHEM',NULL),
('Pe48576c023eab31702949',1461313549428,'0','15048-2','Creatine kinase.BB/Creatine kinase.total in Serum or Plasma by Electrophoresis','CK BB CFr SerPl Elph','CHEM',NULL),
('Pe70684726267b97701499',1461313324362,'0','26473-9','Leukocytes other/100 leukocytes in Body fluid','WBC Other NFr Fld','HEM/BC',NULL),
('q6aa39f8b604e1bf70900',1461313230734,'0','19162-7','Varicella zoster virus IgG Ab [Presence] in Serum','VZV IgG Ser Ql','MICRO',NULL),
('Q6b33b10c6387cb8c01226',1461313282355,'0','4563-3','Hemoglobin C/Hemoglobin.total in Blood','Hgb C MFr Bld','HEM/BC',NULL),
('Q6e2dc46e56808beb02076',1461313413172,'0','5034-4','Streptococcus agalactiae rRNA [Presence] in Unspecified specimen by DNA probe','Gp B Strep rRNA XXX Ql Prb','MICRO',NULL),
('q6ecd26cf179973fa03950',1461313704834,'0','20644-1','Glycine [Moles/volume] in Serum or Plasma','Glycine SerPl-sCnc','CHEM',NULL),
('q6f21a5c5fc6f06a602800',1461313525904,'0','8249-5','Transitional cells [Presence] in Urine sediment by Light microscopy','Trans Cells UrnS Ql Micro','UA',NULL),
('Q6fc327ec04bed0d003126',1461313576745,'0','14881-7','Phosphate [Moles/time] in 24 hour Urine','Phosphate 24h Ur-sRate','CHEM',NULL),
('Q70353d0fc56b792203576',1461313646809,'0','25964-8','Normetanephrine [Moles/volume] in 24 hour Urine','Normetanephrine 24h Ur-sCnc','CHEM',NULL),
('q705f9c4d8ed456dd01750',1461313362941,'0','2006-5','Cancer Ag 125 [Presence] in Serum or Plasma','Cancer Ag125 SerPl Ql','CHEM',NULL),
('Q740b27650027bcb30926',1461313234686,'0','47094-8','Calciferol (Vit D2) [Moles/volume] in Serum or Plasma','Vitamin D2 SerPl-sCnc','CHEM',NULL),
('Q776f08a64436fd5304026',1461313716827,'0','24103-4','Plasma cells [#/volume] in Blood by Manual count','Plasma Cells # Bld Manual','HEM/BC',NULL),
('q7797f97adf45c0100800',1461313215250,'0','2692-2','Osmolality of Serum or Plasma','Osmolality SerPl','CHEM',NULL),
('Q79991fb7c053618202026',1461313405557,'0','6265-3','Timothy IgE Ab [Units/volume] in Serum','Timothy IgE Qn','ALLERGY',NULL),
('Q79a59970af48205f03276',1461313600683,'0','27821-8','Protein S Free Ag actual/normal in Platelet poor plasma by Immunologic method','Prot S Free Ag Act/Nor PPP Imm','COAG',NULL),
('q7bd84159ae14683e0500',1461313168761,'0','14732-2','Folate [Moles/volume] in Serum or Plasma','Folate SerPl-sCnc','CHEM',NULL),
('q7e4312784e0c83f402400',1461313463683,'0','33720-4','Blood bank consult','','ATTACH.CLINRPT',NULL),
('Q7f420243eb55e1bd03676',1461313662171,'0','22362-8','HTLV 1+2 Ab [Presence] in Serum','HTLV1+2 Ab Ser Ql','MICRO',NULL),
('Q810c051242e3325e02476',1461313475475,'0','48683-7','Streptococcus agalactiae DNA [Presence] in Unspecified specimen by Probe and target amplification method','Gp B Strep DNA XXX Ql PCR','MICRO',NULL),
('Q81f8ddc149c9a6260476',1461313165275,'0','882-1','ABO and Rh group [Type] in Blood','ABO+Rh Gp Bld','BLDBK',NULL),
('Q821472b79e9f39020426',1461313157227,'0','925-8','Blood product disposition [Type]','Bld Prod Disposition BPU','BLDBK',NULL),
('q8283f9ee74f64c4703650',1461313658351,'0','25435-9','Herpes simplex virus IgM Ab [Presence] in Serum','HSV IgM Ser Ql','MICRO',NULL),
('Q84d362c2105c349003626',1461313654415,'0','43993-5','Age at delivery','Age at delivery','OB.US',NULL),
('q852a627b67d6d0a80600',1461313184139,'0','14715-7','Estradiol (E2) [Moles/volume] in Serum or Plasma','Estradiol SerPl-sCnc','CHEM',NULL),
('Q86f0530123da72a301626',1461313343427,'0','14955-9','Zinc [Moles/volume] in Serum or Plasma','Zinc SerPl-sCnc','DRUG/TOX',NULL),
('Q88b173f6aeb9493902826',1461313530381,'0','4575-7','Hemoglobin E/Hemoglobin.total in Blood','Hgb E MFr Bld','HEM/BC',NULL),
('q8bdc1e7721722e2102100',1461313416790,'0','15069-8','Fructosamine [Moles/volume] in Serum or Plasma','Fructosamine SerPl-sCnc','CHEM',NULL),
('q8dd8b3f2abd7df790200',1461313121680,'0','26515-7','Platelets [#/volume] in Blood','Platelet # Bld','HEM/BC',NULL),
('Q8e2afdd051afd0f302426',1461313467595,'0','32218-0','Cyclic citrullinated peptide Ab [Units/volume] in Serum by Immunoassay','cCP Ab Ser EIA-aCnc','SERO',NULL),
('Q8f96c0d027ff623103176',1461313584708,'0','44528-8','Histoplasma capsulatum M Ab [Presence] in Serum','H capsul M Ab Ser Ql','MICRO',NULL),
('q8fb4a881f63cbc1701650',1461313347303,'0','21190-4','Chlamydia trachomatis DNA [Presence] in Cervix by Probe and target amplification method','C trach DNA Cervix Ql PCR','MICRO',NULL),
('Q8fd08fa94cc5dd9d01976',1461313397343,'0','26472-1','Leukocytes other/100 leukocytes in Cerebral spinal fluid','WBC Other NFr CSF','HEM/BC',NULL),
('Q929f506612338fbc01326',1461313297751,'0','29374-6','Ribonucleoprotein extractable nuclear Ab [Units/volume] in Serum','ENA RNP Ab Ser-aCnc','SERO',NULL),
('Q93e286788bdec1590526',1461313172664,'0','664-3','Microscopic observation [Identifier] in Unspecified specimen by Gram stain','Gram Stn XXX','MICRO',NULL),
('q94ec29272ddb5d3a04000',1461313712823,'0','20638-3','Asparagine [Moles/volume] in Serum or Plasma','Asparagine SerPl-sCnc','CHEM',NULL),
('Q992a5221b74f5f8301176',1461313274217,'0','24467-3','CD3+CD4+ (T4 helper) cells [#/volume] in Blood','CD3+CD4+ Cells # Bld','CELLMARK',NULL),
('q9ac53e747747072f03600',1461313650470,'0','13227-4','Corynebacterium diphtheriae IgG Ab [Units/volume] in Serum','C diphtheriae IgG Ser-aCnc','MICRO',NULL),
('Q9ad21573292628f002126',1461313421153,'0','931-6','Blood product source [Type]','Bld Prod Source BPU','BLDBK',NULL),
('q9b54e5dfe7f1729203500',1461313635100,'0','35051-2','Leukocytes other [#/volume] in Body fluid','WBC Other # Fld','HEM/BC',NULL),
('Q9c541d2941b1e39203526',1461313638969,'0','49846-9','Hepatitis C virus Ag [Presence] in Blood or Marrow from donor','HCV Ag Bld/Mar Donr Ql','MICRO',NULL),
('Qa51d2eb56c6a50cf02526',1461313483089,'0','27923-2','Ubiquinone 10 [Mass/volume] in Serum or Plasma','Ubiquinone10 SerPl-mCnc','CHEM',NULL),
('qaaed1d17b3ae19f902350',1461313455961,'0','11274-8','Elliptocytes [Presence] in Blood by Light microscopy','Elliptocytes Bld Ql Smear','HEM/BC',NULL),
('qaf4e8bc5fc86397b0550',1461313176800,'0','34714-6','INR in Blood by Coagulation assay','INR Bld','COAG',NULL),
('qaf6d9a88a0830dc804050',1461313720913,'0','10526-2','Microscopic observation [Identifier] in Sputum by Cyto stain','Cyto Spt','CYTO',NULL),
('Qb017025482c3802701576',1461313335813,'0','40752-8','Epstein Barr virus early IgG Ab [Presence] in Serum by Immunoassay','EBV EA IgG Ser Ql EIA','MICRO',NULL),
('Qb2ecbadc390165e50976',1461313242607,'0','8098-6','Thyroglobulin Ab [Units/volume] in Serum or Plasma','Thyroglob Ab SerPl-aCnc','SERO',NULL),
('Qb30479a4eb44f6c40576',1461313180687,'0','25371-6','Cholesterol in VLDL [Moles/volume] in Serum or Plasma','VLDLc SerPl-sCnc','CHEM',NULL),
('qb43818bfda405b4103250',1461313596805,'0','19710-3','Tramadol [Presence] in Urine by Screen method','Tramadol Ur Ql Scn','DRUG/TOX',NULL),
('Qb675c2e4da7269210176',1461313117169,'0','1920-8','Aspartate aminotransferase [Enzymatic activity/volume] in Serum or Plasma','AST SerPl-cCnc','CHEM',NULL),
('qb7fcd9c0f0053b4b02450',1461313471118,'0','5817-2','Urate crystals [Presence] in Urine sediment by Light microscopy','Urate Cry UrnS Ql Micro','UA',NULL),
('qbb2750bc24419a0b01600',1461313339449,'0','6357-8','Chlamydia trachomatis DNA [Presence] in Urine by Probe and target amplification method','C trach DNA Ur Ql PCR','MICRO',NULL),
('Qbdd4f32c9df587df0826',1461313219486,'0','46744-9','Organic acidemias newborn screen interpretation','OA DBS-Imp','CHEM',NULL),
('qbf160b23f306793403550',1461313642671,'0','5000-5','Cytomegalovirus DNA [Presence] in Unspecified specimen by Probe and target amplification method','CMV DNA XXX Ql PCR','MICRO',NULL),
('qbf33d3a50e2d00b103200',1461313588242,'0','38996-5','Neutrophils [Presence] in Urine by Light microscopy','Neutrophils Ur Ql Micro','UA',NULL),
('Qc0f35042842070ec01726',1461313359381,'0','14745-4','Glucose [Moles/volume] in Body fluid','Glucose Fld-sCnc','CHEM',NULL),
('qc19559e624ea635f03150',1461313580305,'0','30247-1','Cytomegalovirus DNA [#/volume] (viral load) in Serum or Plasma by Probe and target amplification method','CMV DNA # SerPl PCR','MICRO',NULL),
('qc1da13718664be0101700',1461313354918,'0','45353-0','Date of analysis of unspecified specimen','Date Of Analysis XXX','MISC',NULL),
('qc2424ff828a095cd0850',1461313223179,'0','14578-9','ABO group [Type] in Blood from Blood product unit','ABO Group Bld BPU','BLDBK',NULL),
('Qc44f672ada29f7a102726',1461313514412,'0','7984-8','Parvovirus B19 IgM Ab [Units/volume] in Serum','B19V IgM Ser-aCnc','MICRO',NULL),
('Qc5514cb62990fb5b02376',1461313459664,'0','17850-9','Herpes simplex virus 1 IgG Ab [Presence] in Serum','HSV1 IgG Ser Ql','MICRO',NULL),
('Qc5df05a5817db5c503926',1461313701282,'0','23870-9','Hepatitis C virus 100+5-1-1 Ab [Presence] in Serum by Immunoblot (IB)','HCV100+5-1-1 Ab Ser Ql IB','MICRO',NULL),
('qc6ee2ca536b80e6101300',1461313294006,'0','9598-4','Borrelia burgdorferi 23kD IgM Ab [Presence] in Serum by Immunoblot (IB)','B burgdor23kD IgM Ser Ql IB','MICRO',NULL),
('qc81f01955117feea03900',1461313696920,'0','17811-1','Alpha 1 globulin/Protein.total in unspecified time Urine by Electrophoresis','Alpha1 Glob ?Tm MFr Ur Elph','CHEM',NULL),
('qc830aa1df379de1a0950',1461313238547,'0','14895-7','Protein Fractions [interpretation] in Serum or Plasma by Immunofixation','Prot Pattern SerPl IFE-Imp','CHEM',NULL),
('qca9baeb26976801e02050',1461313408935,'0','19128-8','Bacteria identified in Catheter tip by Culture','Bacteria Cath Tip Cult','MICRO',NULL),
('qcaa7fd24004f5cf401200',1461313277893,'0','673-4','Ova and parasites identified in Unspecified specimen by Light microscopy','O+P XXX Micro','MICRO',NULL),
('qcb52ebd1184e115002900',1461313541706,'0','52955-2','Benzodiazepines [Moles/volume] in Urine','Benzodiaz Ur-sCnc','DRUG/TOX',NULL),
('qcd16f63df7447f6c0150',1461313113324,'0','3094-0','Urea nitrogen [Mass/volume] in Serum or Plasma','BUN SerPl-mCnc','CHEM',NULL),
('qcf5bb876dc4d341102500',1461313479095,'0','2077-6','Chloride [Moles/volume] in Sweat','Chloride Sweat-sCnc','CHEM',NULL),
('qd43a308beb96a71f0450',1461313160879,'0','2532-0','Lactate dehydrogenase [Enzymatic activity/volume] in Serum or Plasma','LDH SerPl-cCnc','CHEM',NULL),
('qd47716f58908f5f902000',1461313401371,'0','6273-7','Walnut IgE Ab [Units/volume] in Serum','Walnut IgE Qn','ALLERGY',NULL),
('Qd7b2310cfb92c04601676',1461313351309,'0','70202-7','Cholesterol in IDL+Cholesterol in VLDL 3 [Moles/volume] in Serum or Plasma','IDLc+VLDL3c SerPl-sCnc','CHEM',NULL),
('qd80b7074156c1a2d01250',1461313285833,'0','9587-7','Borrelia burgdorferi 41kD IgM Ab [Presence] in Serum by Immunoblot (IB)','B burgdor41kD IgM Ser Ql IB','MICRO',NULL),
('Qda498e087e4152d202876',1461313538271,'0','5292-8','Reagin Ab [Presence] in Serum by VDRL','VDRL Ser Ql','MICRO',NULL),
('qdb93203876b0277402850',1461313533817,'0','29573-3','Phenylalanine [Moles/volume] in Dried blood spot','Phe DBS-sCnc','CHEM',NULL),
('Qdce6a8c2f4ff93a303226',1461313592562,'0','14802-3','Isopropanol [Moles/volume] in Serum or Plasma','Isopropanol SerPl-sCnc','DRUG/TOX',NULL),
('Qdebf50acd2fb523601276',1461313290028,'0','9597-6','Borrelia burgdorferi 93kD IgG Ab [Presence] in Serum by Immunoblot (IB)','B burgdor93kD IgG Ser Ql IB','MICRO',NULL),
('Qdf0e2c446ae764ba02776',1461313522276,'0','24114-1','Epstein Barr virus capsid IgG Ab [Presence] in Serum by Immunoassay','EBV VCA IgG Ser Ql EIA','MICRO',NULL),
('qdf8670154480b9e101350',1461313301361,'0','32515-9','CD3+CD4+ (T4 helper) cells [#/volume] in Unspecified specimen','CD3+CD4+ Cells # XXX','CELLMARK',NULL),
('Qe38e73a37dde6edf03976',1461313709229,'0','6061-6','Carrot IgE Ab [Units/volume] in Serum','Carrot IgE Qn','ALLERGY',NULL),
('Qe4fdc88154e8baac0876',1461313227057,'0','16362-6','Ammonia [Moles/volume] in Plasma','Ammonia Plas-sCnc','CHEM',NULL),
('qe5cae4baaeff6fc002750',1461313518314,'0','21365-2','Leptin [Mass/volume] in Serum or Plasma','Leptin SerPl-mCnc','CHEM',NULL),
('R67f84bfd2acab0dd03483',1461313632425,'0','1007-4','Direct antiglobulin test.poly specific reagent [Presence] on Red Blood Cells','DAT Poly-Sp Reag RBC Ql','BLDBK',NULL),
('R6a859a1f595e1ea802933',1461313546521,'0','27096-7','Streptococcus pneumoniae 3 IgG Ab [Mass/volume] in Serum','S pneum3 IgG Ser-mCnc','MICRO',NULL),
('R6a87f30985857d1f04183',1461313741639,'0','33905-1','Trichomonas sp [#/area] in Urine sediment by Microscopy high power field','Trichomonas #/area UrnS HPF','UA',NULL),
('r6e10199c7a7bfd2103403',1461313619957,'0','25521-6','Selenium [Moles/volume] in Serum or Plasma','Selenium SerPl-sCnc','DRUG/TOX',NULL),
('r756546960f81ee4b01403',1461313309461,'0','15064-9','Estriol (E3).unconjugated [Moles/volume] in Serum or Plasma','u Estriol SerPl-sCnc','CHEM',NULL),
('r764069057f64f67e01503',1461313324964,'0','5859-4','Herpes simplex virus identified in Unspecified specimen by Organism specific culture','HSV XXX Cult','MICRO',NULL),
('R76bc468eae03d99101383',1461313306593,'0','34705-4','Carbon dioxide [Partial pressure] adjusted to patients actual temperature in Blood','pCO2 temp adj Bld','CHEM',NULL),
('R77bd37be468de8500633',1461313189397,'0','798-9','Erythrocytes [#/volume] in Urine by Automated count','RBC # Ur Auto','UA',NULL),
('r7a2af18670cb9a8f0753',1461313208456,'0','740-1','Metamyelocytes/100 leukocytes in Blood by Manual count','Metamyelocytes NFr Bld Manual','HEM/BC',NULL),
('R7a4fd0afc19ece0b03433',1461313624995,'0','18325-1','Oxymorphone [Presence] in Urine by Confirmatory method','Oxymorphone Ur Ql Cfm','DRUG/TOX',NULL),
('R7af03c32cbaf4c120733',1461313204956,'0','5334-8','Rubella virus IgG Ab [Units/volume] in Serum by Immunoassay','RUBV IgG Ser EIA-aCnc','MICRO',NULL),
('R7caf038824858e4d03083',1461313570311,'0','7983-0','Parvovirus B19 IgG Ab [Units/volume] in Serum','B19V IgG Ser-aCnc','MICRO',NULL),
('r7ccda3965d8cf3a70603',1461313184882,'0','53927-0','Neisseria gonorrhoeae rRNA [Presence] in Urethra by Probe and target amplification method','N gonorrhoea rRNA Urth Ql PCR','MICRO',NULL),
('r7e10681f2b42de170703',1461313200302,'0','4679-7','Reticulocytes/100 erythrocytes in Blood','Retics/100 RBC NFr','HEM/BC',NULL),
('r7e741a59e4a6de2201553',1461313332228,'0','34468-9','Clostridium difficile toxin A+B [Presence] in Stool by Immunoassay','C dif Tox A+B Stl Ql EIA','MICRO',NULL),
('R7f6ac27c93a6773302983',1461313554486,'0','48560-7','Human papilloma virus genotype [Identifier] in Unspecified specimen by Probe and target amplification method','HPV Gentyp XXX PCR','MICRO',NULL),
('R805890536202b19902233',1461313437549,'0','6969-0','Myeloperoxidase Ab [Units/volume] in Serum','Myeloperoxidase Ab Ser-aCnc','SERO',NULL),
('r844fd4caec2a9bf401053',1461313254443,'0','18868-0','Aztreonam [Susceptibility]','Aztreonam Susc Islt','ABXBACT',NULL),
('r84997d824ef534ff02953',1461313550198,'0','15049-0','Creatine kinase.MM/Creatine kinase.total in Serum or Plasma by Electrophoresis','CK MM CFr SerPl Elph','CHEM',NULL),
('r85c16bb1303851a701953',1461313394192,'0','6073-1','Chocolate IgE Ab [Units/volume] in Serum','Chocolate IgE Qn','ALLERGY',NULL),
('R8644491e75e0a49f03033',1461313562440,'0','5119-3','Deprecated Cryptococcus neoformans Ag [Titer] in Serum by Latex agglutination','Deprecated C neoform Ag Titr Ser LA','MICRO',NULL),
('R877ea1fa863169d10283',1461313134478,'0','5794-3','Hemoglobin [Presence] in Urine by Test strip','Hgb Ur Ql Strip','UA',NULL),
('R8e58f1e2882402dc02583',1461313491757,'0','20458-6','Rubella virus IgG Ab [interpretation] in Serum','RUBV IgG Ser-Imp','MICRO',NULL),
('R8ed627c3a673144903383',1461313617073,'0','13349-6','Leukocytes [#/volume] in Stool by Manual count','WBC # Stl Manual','HEM/BC',NULL),
('r910bf5eac298de3e03453',1461313627970,'0','49581-2','Reference lab test identifier and name [Identifier]','Ref Lab Test ID+Name','MISC',NULL),
('r911162edbcfe784802553',1461313487343,'0','9783-2','Ehrlichia chaffeensis IgG Ab [Titer] in Serum','E chaffeensis IgG Titr Ser','MICRO',NULL),
('r92badf18efcbb7c703703',1461313666741,'0','6138-2','Helminthosporium halodes IgE Ab [Units/volume] in Serum','H halodes IgE Qn','ALLERGY',NULL),
('r951f73a5399782c802303',1461313448515,'0','12286-1','Drugs identified in Urine by Screen method','Drugs Ur Scn','DRUG/TOX',NULL),
('r9977be375151845b02703',1461313510969,'0','12195-4','Creatinine renal clearance/1.73 sq M in 24 hour','Creat Cl/1.73 sq M 24h Ur+SerPl-ArVRat','CHEM',NULL),
('r9dc4bddbfb396a7403753',1461313674230,'0','31112-6','Reticulocytes/100 erythrocytes in Blood by Manual','Retics/100 RBC NFr Manual','HEM/BC',NULL),
('R9e93e61037b362be03833',1461313686590,'0','2638-5','Myelin basic protein [Mass/volume] in Cerebral spinal fluid','MBP CSF-mCnc','CHEM',NULL),
('R9eabee79da52887d0233',1461313126521,'0','5902-2','Prothrombin time (PT) in Platelet poor plasma by Coagulation assay','PT Time PPP','COAG',NULL),
('R9eb8215cf7b6df6b04133',1461313733824,'0','5789-3','Fatty casts [#/area] in Urine sediment by Microscopy low power field','Fatty Casts #/area UrnS LPF','UA',NULL),
('Ra20fc6b7d34bb48f01883',1461313383235,'0','2745-8','pH of Capillary blood','pH BldC','CHEM',NULL),
('ra2bb70d701b5aa5102153',1461313425122,'0','30376-8','Blasts [#/volume] in Blood','Blasts # Bld','HEM/BC',NULL),
('ra2c66ae343e9b11f0253',1461313129515,'0','26499-4','Neutrophils [#/volume] in Blood','Neutrophils # Bld','HEM/BC',NULL),
('Ra33ea1cc216c864103733',1461313671254,'0','20398-4','Nuclear Ab Pattern Homogenous [Titer] in Serum','ANA Homogen Titr Ser','SERO',NULL),
('Ra34160062f4c1ad002333',1461313453671,'0','1961-2','Bicarbonate [Moles/volume] in Capillary blood','HCO3 BldC-sCnc','CHEM',NULL),
('Ra3fe8099387bed6901533',1461313329302,'0','34701-3','Platelet Ab.heparin induced [Presence] in Serum','Heparin Ind Platelet Ab Ser Ql','SERO',NULL),
('ra44d41ca4d9e3a1a0303',1461313137496,'0','14629-0','Bilirubin.direct [Moles/volume] in Serum or Plasma','Bilirub Direct SerPl-sCnc','CHEM',NULL),
('Ra6a37cba36c12eac04083',1461313725785,'0','8277-6','Body surface area','BSA','BDYSURF.ATOM',NULL),
('ra8e03ec3c775524d02203',1461313433186,'0','46420-6','Leukocyte clumps [#/area] in Urine sediment by Microscopy high power field','WBC clumps #/area UrnS HPF','UA',NULL),
('Raa178caaf09c1fa901783',1461313367898,'0','10976-9','6-Monoacetylmorphine (6-MAM) [Presence] in Urine','6MAM Ur Ql','DRUG/TOX',NULL),
('raa9926ee36d9d4fb03053',1461313565431,'0','6174-7','Milk IgE Ab [Units/volume] in Serum','Milk IgE Qn','ALLERGY',NULL),
('rab24c6cbfcfcff9401003',1461313246370,'0','584-3','Streptococcus agalactiae [Presence] in Vaginal fluid by Organism specific culture','Gp B Strep Vag Ql Cult','MICRO',NULL),
('rad65bd1f66972f5f04153',1461313736999,'0','30350-3','Hemoglobin [Mass/volume] in Venous blood','Hgb BldV-mCnc','HEM/BC',NULL),
('raec3c031dbb1c83101453',1461313317282,'0','20496-6','Gliadin IgG Ab [Units/volume] in Serum by Immunoassay','Gliadin IgG Ser EIA-aCnc','SERO',NULL),
('rafd70f21e994838e0653',1461313192639,'0','43305-2','Neisseria gonorrhoeae rRNA [Presence] in Unspecified specimen by Probe and target amplification method','N gonorrhoea rRNA XXX Ql PCR','MICRO',NULL),
('Rb00a8a543c3c63cf03783',1461313679102,'0','22315-6','Hepatitis A virus IgM Ab [Units/volume] in Serum','HAV IgM Ser-aCnc','MICRO',NULL),
('rb1309125a6d2e03503003',1461313557402,'0','8214-9','Opiates [Presence] in Meconium','Opiates Mec Ql','DRUG/TOX',NULL),
('Rb3278615fd0a5fac03333',1461313609125,'0','10355-6','Microscopic observation [Identifier] in Bone marrow by Wright Giemsa stain','Wright Gie Stn Mar','MICRO',NULL),
('rb3e335e61681522501153',1461313270934,'0','3181-5','Cardiolipin IgG Ab [Units/volume] in Serum by Immunoassay','Cardiolipin IgG Ser EIA-aCnc','COAG',NULL),
('Rb3e39ee10814217f0783',1461313212934,'0','3936-2','Phencyclidine [Presence] in Urine','PCP Ur Ql','DRUG/TOX',NULL),
('Rb6d3065dd1ab3fbb01033',1461313251476,'0','18908-4','Clindamycin [Susceptibility]','Clindamycin Susc Islt','ABXBACT',NULL),
('Rba0a617d668e166202283',1461313445631,'0','14676-1','Cortisol Free [Moles/time] in 24 hour Urine','Cortis F 24h Ur-sRate','CHEM',NULL),
('Rbb22be9033779d2001933',1461313391149,'0','1884-6','Apolipoprotein B [Mass/volume] in Serum or Plasma','Apo B SerPl-mCnc','CHEM',NULL),
('Rbb6092708e35db8402633',1461313499913,'0','25386-4','Creatinine [Moles/volume] in Body fluid','Creat Fld-sCnc','CHEM',NULL),
('rbb9df53939410bb402653',1461313502896,'0','9668-5','HIV 1 p55 Ab [Presence] in Serum by Immunoblot (IB)','HIV1 p55 Ab Ser Ql IB','MICRO',NULL),
('rbbd24295419f9f9003803',1461313682327,'0','13627-5','Erythrocytes [Presence] in Semen by Light microscopy','RBC Smn Ql Micro','FERT',NULL),
('rc047385a70b7132602603',1461313495107,'0','14252-1','Smooth muscle Ab [Presence] in Serum','Smooth muscle Ab Ser Ql','SERO',NULL),
('Rc08c415fcfc27ede01133',1461313267103,'0','29891-9','Helicobacter pylori [Presence] in Stomach by urea breath test','Urea Breath Test Ql','MICRO',NULL),
('Rc3a1ed88b53f036f02183',1461313429852,'0','38506-2','Thyroxine (T4) [Presence] in Dried blood spot','T4 DBS Ql','CHEM',NULL),
('rc52d94cc9dd100f401903',1461313386110,'0','32765-0','Yeast [Presence] in Unspecified specimen by Wet preparation','Yeast XXX Ql Wet Prep','MICRO',NULL),
('Rc6448ad2d4617aec01083',1461313258898,'0','625-4','Bacteria identified in Stool by Culture','Bacteria Stl Cult','MICRO',NULL),
('Rc808686c2f3295410683',1461313197460,'0','10501-5','Lutropin [Units/volume] in Serum or Plasma','LH SerPl-aCnc','CHEM',NULL),
('rca6073c8da70c49a01803',1461313370748,'0','21003-9','Fungus identified in Unspecified specimen by Fungus stain','Fungus XXX Fungus Stn','MICRO',NULL),
('rcaf52673c5242e4703853',1461313689866,'0','14121-8','Pyruvate [Moles/volume] in Blood','Pyruvate Bld-sCnc','CHEM',NULL),
('rcc66c72d061d1ea60403',1461313153776,'0','14920-3','Thyroxine (T4) free [Moles/volume] in Serum or Plasma','T4 Free SerPl-sCnc','CHEM',NULL),
('rcc727680183f084b01853',1461313378996,'0','14569-8','17-Hydroxyprogesterone [Moles/volume] in Serum or Plasma','17OHP SerPl-sCnc','CHEM',NULL),
('Rcdc256d604d98fc001433',1461313314341,'0','5822-2','Yeast [#/area] in Urine sediment by Microscopy high power field','Yeast #/area UrnS HPF','UA',NULL),
('Rd01b4c97349ccdc00333',1461313142701,'0','22639-9','Pathology report supplemental reports Narrative','Path report.supplemental reports Spec','TUMRRGT',NULL),
('rd0e1f686120e4f8404103',1461313728694,'0','5335-5','Rubella virus IgM Ab [Units/volume] in Serum by Immunoassay','RUBV IgM Ser EIA-aCnc','MICRO',NULL),
('rd18bbce7cacdef9503353',1461313612243,'0','1746-7','Albumin [Mass/volume] in Cerebral spinal fluid','Albumin CSF-mCnc','CHEM',NULL),
('rd27c1c6ea2dba21404203',1461313744580,'0','33256-9','Leukocytes [#/volume] corrected for nucleated erythrocytes in Blood by Automated count','WBC nRBC cor # Bld Auto','HEM/BC',NULL),
('rd6e3259bcb61445103303',1461313604827,'0','14716-5','Estriol (E3) [Moles/volume] in Serum or Plasma','Estriol SerPl-sCnc','CHEM',NULL),
('Rd7e3da29442d6fef01483',1461313321505,'0','41477-1','Bacterial sialidase [Presence] in Unspecified specimen','Bacterial sialidase XXX Ql','MICRO',NULL),
('rda3c208d2fcae5c00353',1461313145836,'0','19764-0','Statement of adequacy [interpretation] of Cervical or vaginal smear or scraping by Cyto stain','Stat of Adq Cvx/Vag Cyto-Imp','CYTO',NULL),
('Rdd04c5f5604959c901833',1461313375671,'0','46735-7','Endocrine disorders newborn screen interpretation','Endocrine Disorders DBS-Imp','CHEM',NULL),
('rdde83be6d9dbb85c02253',1461313440883,'0','48344-6','Kaolin activated time in Platelet poor plasma','KC time Time PPP','COAG',NULL),
('rdff8cd1d9d3e09d503103',1461313573477,'0','32585-2','Epstein Barr virus DNA [#/volume] (viral load) in Unspecified specimen by Probe and target amplification method','EBV DNA # XXX PCR','MICRO',NULL),
('Re5ce5ae0793d1d2902683',1461313507735,'0','27387-0','Streptococcus pneumoniae 14 IgG Ab [Mass/volume] in Serum','S pneum14 IgG Ser-mCnc','MICRO',NULL),
('re6b6d7a7902c153b01103',1461313262424,'0','610-6','Bacteria identified in Body fluid by Aerobe culture','Bacteria Fld Aerobe Cult','MICRO',NULL),
('Re6f440510f1e33d00383',1461313150391,'0','23658-8','Other Antibiotic [Susceptibility]','Other Antibiotic Susc Islt','ABXBACT',NULL),
('s67d13c41fd212cce02161',1461313426351,'0','1721-0','Adenosine triphosphate [Mass/volume] in Blood','ATP Bld-mCnc','CHEM',NULL),
('s6fa41cc30b354e5a02261',1461313442362,'0','13989-9','Gamma globulin/Protein.total in 24 hour Urine by Electrophoresis','Gamma glob 24h MFr Ur Elph','CHEM',NULL),
('s70adfd09f22bc43403061',1461313566642,'0','15283-5','Silver Birch IgE Ab [Units/volume] in Serum','Silver Birch IgE Qn','ALLERGY',NULL),
('s71f4eb2d93958e560761',1461313209509,'0','1960-4','Bicarbonate [Moles/volume] in Arterial blood','HCO3 BldA-sCnc','CHEM',NULL),
('s806494612e580df701411',1461313310714,'0','49543-2','Calcidiol+Calciferol [Mass/volume] in Serum or Plasma','Calcidiol+Calciferol SerPl-mCnc','CHEM',NULL),
('s821b055d424ecbe402561',1461313488588,'0','13988-1','Beta globulin/Protein.total in 24 hour Urine by Electrophoresis','B-Globulin 24h MFr Ur Elph','CHEM',NULL),
('s8269dd8d99617bc502961',1461313551310,'0','26019-0','Creatine Kinase.macromolecular type 1/Creatine kinase.total in Serum or Plasma','CK Macro1 CFr SerPl','CHEM',NULL),
('s85543ee648de6bff03011',1461313558555,'0','32766-8','Trichomonas vaginalis [Presence] in Unspecified specimen by Wet preparation','T vaginalis XXX Ql Wet Prep','MICRO',NULL),
('s863a4d09df2b387902611',1461313496510,'0','49701-6','pH of Blood adjusted to patients actual temperature','pH temp adj Bld','CHEM',NULL),
('s8717df572f336b2904161',1461313738011,'0','18487-9','Broad casts [#/area] in Urine sediment by Microscopy low power field','Broad Casts #/area UrnS LPF','UA',NULL),
('s8ea3433c89ba3b8202661',1461313503975,'0','9664-4','HIV 1 p24 Ab [Presence] in Serum by Immunoblot (IB)','HIV1 p24 Ab Ser Ql IB','MICRO',NULL),
('s95d68df32e6c45e903761',1461313675541,'0','65751-0','Muscle Pathology biopsy report','Muscle Path Bx report','PATH',NULL),
('s9f72077b1ab05b9a0661',1461313193726,'0','15180-3','Hypochromia [Presence] in Blood by Automated count','Hypochromia Bld Ql Auto','HEM/BC',NULL),
('s9fd92dac84d11b3003711',1461313667937,'0','10580-9','Liquefaction [Time] in Semen','Liquefaction Time Smn','FERT',NULL),
('sa4eb053d34b67af903811',1461313683372,'0','5838-8','Cytomegalovirus [Presence] in Unspecified specimen by Organism specific culture','CMV XXX Ql Cult','MICRO',NULL),
('sa8053ea480992dd703461',1461313629042,'0','22110-1','Bartonella henselae IgG Ab [Titer] in Serum','B henselae IgG Titr Ser','MICRO',NULL),
('sb0021e8ae1e37e5501011',1461313247715,'0','8246-1','Amorphous sediment [Presence] in Urine sediment by Light microscopy','Amorph Sed UrnS Ql Micro','UA',NULL),
('sb2e29cf4040ed34203311',1461313606063,'0','49580-4','HIV 1+2 Ab [Presence] in Unspecified specimen by Rapid test','HIV1+2 Ab XXX Ql Rapid','MICRO',NULL),
('sb4280a3b248f4a1402311',1461313449727,'0','13994-9','Beta globulin/Protein.total in Urine by Electrophoresis','B-Globulin MFr Ur Elph','CHEM',NULL),
('sb55c83f0ad97b11f0361',1461313147023,'0','18314-5','Morphology [interpretation] in Blood Narrative','Morphology Bld-Imp','HEM/BC',NULL),
('sb7884c45cf49ac060261',1461313130701,'0','26484-6','Monocytes [#/volume] in Blood','Monocytes # Bld','HEM/BC',NULL),
('sb81d9af345afe20202211',1461313434340,'0','41874-9','White Birch IgE Ab [Units/volume] in Serum','White Birch IgE Qn','ALLERGY',NULL),
('sbf869cea0d0f801e03861',1461313691386,'0','20648-2','Isoleucine [Moles/volume] in Serum or Plasma','Isoleucine SerPl-sCnc','CHEM',NULL),
('sbfdf1a30a0c0b48b0711',1461313201738,'0','14338-8','Prealbumin [Mass/volume] in Serum or Plasma','Prealb SerPl-mCnc','CHEM',NULL),
('sc172fad59d4d1cf904211',1461313745792,'0','51928-0','Ribonucleoprotein extractable nuclear Ab [Units/volume] in Serum by Immunoassay','ENA RNP Ab Ser EIA-aCnc','SERO',NULL),
('sc1d0a622b782b9290611',1461313186152,'0','19145-2','Reference lab test name','Ref Lab Test Name','MISC',NULL),
('sc21f04b37a881b6f01161',1461313272160,'0','4576-5','Hemoglobin F/Hemoglobin.total in Blood','Hgb F MFr Bld','HEM/BC',NULL),
('sc8d4130c29fbb43801911',1461313387305,'0','6924-5','Gliadin IgA Ab [Units/volume] in Serum','Gliadin IgA Ser-aCnc','SERO',NULL),
('sc8de283f906927a401811',1461313372018,'0','3297-9','Acetaminophen [Presence] in Serum or Plasma','Acetamin SerPl Ql','DRUG/TOX',NULL),
('scff133a1cb6e976c01111',1461313263845,'0','65633-0','Hepatitis B virus surface Ag [Presence] in Serum or Plasma by Confirmatory method','HBV surface Ag SerPl Ql Cfm','MICRO',NULL),
('sd113d761b807585a01461',1461313318295,'0','13964-2','Methylmalonate [Moles/volume] in Serum or Plasma','Methylmalonate SerPl-sCnc','CHEM',NULL),
('sd157b8f4b2b8a47404111',1461313730540,'0','2272-3','Fat [Presence] in Urine','Fat Ur Ql','CHEM',NULL),
('sd234117dd232a14303411',1461313621352,'0','22203-4','Clostridium tetani IgG Ab [Units/volume] in Serum','C tetani IgG Ser-aCnc','MICRO',NULL),
('sd250cecb980bd50e0311',1461313138783,'0','11557-6','Carbon dioxide [Partial pressure] in Blood','pCO2 Bld','CHEM',NULL),
('sd56c34f2ceb3acae01861',1461313380058,'0','1825-9','Alpha 1 antitrypsin [Mass/volume] in Serum or Plasma','A1AT SerPl-mCnc','CHEM',NULL),
('sd84631d7df22ff6c02711',1461313512197,'0','5057-5','Blastomyces dermatitidis Ab [Titer] in Serum by Complement fixation','B dermat Ab Titr Ser CF','MICRO',NULL),
('sd8d09192d7eb4d4e03361',1461313613880,'0','609-8','Bacteria identified in Eye by Aerobe culture','Bacteria Eye Aerobe Cult','MICRO',NULL),
('sde6fef003012384b01061',1461313255455,'0','32854-2','17-Hydroxyprogesterone [Presence] in Dried blood spot','17OHP DBS Ql','CHEM',NULL),
('se37fc3b84f60818301511',1461313326159,'0','3095-7','Urea nitrogen [Mass/volume] in Urine','UUN Ur-mCnc','CHEM',NULL),
('se41ccd1e073d21b901561',1461313333423,'0','15432-8','Testosterone Free/Testosterone.total in Serum or Plasma','Testost Free MFr SerPl','CHEM',NULL),
('se74e55ae44c3a52801761',1461313364346,'0','26446-5','Blasts/100 leukocytes in Blood','Blasts NFr Bld','HEM/BC',NULL),
('t6a461f10a7369b7501254',1461313286659,'0','10886-0','Prostate Specific Ag Free [Mass/volume] in Serum or Plasma','PSA Free SerPl-mCnc','CHEM',NULL),
('T6a6baab9c07993b703936',1461313702828,'0','22070-7','HP gene mutations found [Identifier] in Blood or Tissue by Molecular genetics method Nominal','HP gene Mut Anal Bld/T','MOLPATH.MUT',NULL),
('T6bc1740681c0e66702786',1461313523856,'0','2428-1','Homocysteine [Mass/volume] in Serum or Plasma','Homocysteine SerPl-mCnc','CHEM',NULL),
('T6c49f98e2ffca9f401336',1461313299339,'0','15189-4','Immunoglobulin light chains.kappa/Immunoglobulin light chains.lambda [Mass ratio] in Serum','Kappa LC/Lambda Ser-mRto','CHEM',NULL),
('t6c4d68812c7857350854',1461313223798,'0','14877-5','Phenytoin [Moles/volume] in Serum or Plasma','Phenytoin SerPl-sCnc','DRUG/TOX',NULL),
('T6d24902a8c94d35402136',1461313422665,'0','24011-9','Hepatitis C virus Ab band pattern [interpretation] in Serum by Immunoblot (IB)','HCV Ab Patrn Ser IB-Imp','MICRO',NULL),
('t7008bcbc00f8608001304',1461313294490,'0','9596-8','Borrelia burgdorferi 66kD IgG Ab [Presence] in Serum by Immunoblot (IB)','B burgdor66kD IgG Ser Ql IB','MICRO',NULL),
('t735823ad8bbb57520954',1461313239207,'0','46733-2','Amino acidemias newborn screen interpretation','Amino acidemias DBS-Imp','CHEM',NULL),
('t776dd22af4cbc0c801754',1461313363552,'0','3854-7','Nicotine [Mass/volume] in Urine','Nicotine Ur-mCnc','DRUG/TOX',NULL),
('T7a328c27efe76c910986',1461313244036,'0','4073-3','Tricyclic antidepressants [Presence] in Serum or Plasma','Tricyclics SerPl Ql','DRUG/TOX',NULL),
('T7b3a9c335321dac401736',1461313360985,'0','19153-6','Volume of unspecified time Urine','Specimen vol ?Tm Ur','SPEC',NULL),
('t7e6e0a67c63f73c401354',1461313301963,'0','5159-9','Epstein Barr virus capsid IgM Ab [Units/volume] in Serum by Immunoassay','EBV VCA IgM Ser EIA-aCnc','MICRO',NULL),
('T7f957e479e6dd7bd03136',1461313578182,'0','21260-5','Epstein Barr virus nuclear Ab [Titer] in Serum by Immunofluorescence','EBV NA Ab Titr Ser IF','MICRO',NULL),
('T81774cf811b21c7b02036',1461313406845,'0','2714-4','Fractional oxyhemoglobin in Arterial blood','OxyHgb MFr BldA','CHEM',NULL),
('T8444d2701990627701236',1461313283760,'0','4545-0','Hematocrit [Volume Fraction] of Blood by Centrifugation','Hct VFr Bld Spun','HEM/BC',NULL),
('T84ae049868052ac90186',1461313118692,'0','788-0','Erythrocyte distribution width [Ratio] by Automated count','RDW RBC Auto-Rto','HEM/BC',NULL),
('t870ea99c4e29d0d203604',1461313651080,'0','32284-2','BK virus DNA [Units/volume] (viral load) in Serum or Plasma by Probe and target amplification method','BKV DNA SerPl PCR-aCnc','MICRO',NULL),
('t88f8407192809d9802854',1461313534419,'0','14833-8','Metanephrines [Moles/time] in 24 hour Urine','MetanephS 24h Ur-sRate','CHEM',NULL),
('t88fffd25f997d3b301704',1461313355446,'0','792-2','Erythrocytes [#/volume] in Cerebral spinal fluid by Manual count','RBC # CSF Manual','HEM/BC',NULL),
('t8d0f7774da294b8e02104',1461313417392,'0','28005-7','MTHFR gene c.677C>T [Presence] in Blood or Tissue by Molecular genetics method','MTHFR c.677C>T Bld/T Ql','MOLPATH.MUT',NULL),
('t90d6c6bf931adc7a03504',1461313635652,'0','15015-1','Alkaline phosphatase.liver/Alkaline phosphatase.total in Serum or Plasma','ALP Liver CFr SerPl','CHEM',NULL),
('T963f7e381f6b09fa0536',1461313174627,'0','26507-4','Neutrophils.band form [#/volume] in Blood','Neuts Band # Bld','HEM/BC',NULL),
('t972f779193eba3230554',1461313177419,'0','8061-4','Nuclear Ab [Presence] in Serum','ANA Ser Ql','SERO',NULL),
('T97e804df2dd54d9901636',1461313344781,'0','5370-2','Streptolysin O Ab [Units/volume] in Serum or Plasma','ASO Ab SerPl-aCnc','MICRO',NULL),
('t982d89cf9a1774e60204',1461313122216,'0','26464-8','Leukocytes [#/volume] in Blood','WBC # Bld','HEM/BC',NULL),
('t9aa1aa499d0bf2b403554',1461313643332,'0','19087-6','Collection of urine specimen end time','Collect End Tme Ur','SPEC',NULL),
('T9c527f34f50c11a402736',1461313515833,'0','28642-7','Oxygen saturation in Arterial cord blood','SaO2 % BldCoA','CHEM',NULL),
('T9d0cefe8096e67ae04036',1461313718364,'0','43734-3','Activated partial thromboplastin time (aPTT) in Platelet poor plasma by Coagulation 1:1 saline','aPTT Time PPP 1:1 saline','COAG',NULL),
('t9e5f24250494369201204',1461313278511,'0','32998-7','Tissue transglutaminase IgG Ab [Units/volume] in Serum','tTG IgG Ser-aCnc','SERO',NULL),
('Ta02640960870b1d802386',1461313461385,'0','5160-7','Epstein Barr virus capsid IgM Ab [Titer] in Serum by Immunofluorescence','EBV VCA IgM Titr Ser IF','MICRO',NULL),
('Ta0a9ea3d26245ecd01986',1461313399423,'0','28008-1','Cytomegalovirus DNA [Presence] in Blood by Probe and signal amplification method','CMV DNA Bld Ql bDNA','MICRO',NULL),
('Ta419dcd6a0bac4f003286',1461313602537,'0','21760-4','FRAXE gene CGG repeats [Presence] in Blood or Tissue by Molecular genetics method','FRAXE gene CGG Rpt Bld/T Ql','MOLPATH.TRINUC',NULL),
('ta5a23d6ced1c466704054',1461313721740,'0','5959-2','Prothrombin time (PT) factor substitution in Platelet poor plasma by Coagulation assay --immediately after addition of normal plasma','PT imm NP Time PPP','COAG',NULL),
('Ta67f6c0a5283e6ed03586',1461313648471,'0','6367-7','Clostridium tetani IgG Ab [Units/volume] in Serum by Immunoassay','C tetani IgG Ser EIA-aCnc','MICRO',NULL),
('Ta69f62e229c26a8903886',1461313694822,'0','19201-3','Prostate Specific Ag Free [Units/volume] in Serum or Plasma','PSA Free SerPl-aCnc','CHEM',NULL),
('Ta7506902ba0297da02836',1461313531711,'0','4569-0','Hemoglobin D/Hemoglobin.total in Blood','Hgb D MFr Bld','HEM/BC',NULL),
('ta87f95fba82e097102404',1461313464319,'0','34712-0','Clostridium difficile [Presence] in Stool','C dif Stl Ql','MICRO',NULL),
('Taaeffa1ffefe162d01586',1461313337475,'0','14314-9','Benzoylecgonine [Presence] in Urine by Screen method','BZE Ur Ql Scn','DRUG/TOX',NULL),
('taaf46e46bb83ace201654',1461313348073,'0','34985-2','Unidentified cells/100 leukocytes in Body fluid','Unident Cells NFr Fld','HEM/BC',NULL),
('tb0784b9f307819020454',1461313161539,'0','5782-8','Crystals [type] in Urine sediment by Light microscopy','Crystals UrnS Micro','UA',NULL),
('tb07cfd82e118537c03154',1461313581341,'0','12782-9','Protein fractions.oligoclonal bands [interpretation] in Cerebral spinal fluid by Electrophoresis','Oligoclonal Bands CSF Elph-Imp','CHEM',NULL),
('tb1161ba29c5a05fc02754',1461313518842,'0','14956-7','Microalbumin [Mass/time] in 24 hour Urine','Microalbumin 24h Ur-mRate','CHEM',NULL),
('Tb27c2495415064310436',1461313158616,'0','32623-1','Platelet mean volume [Entitic volume] in Blood by Automated count','PMV Bld Auto','HEM/BC',NULL),
('tb28b740d54e72df70804',1461313215810,'0','18864-9','Ampicillin [Susceptibility]','Ampicillin Susc Islt','ABXBACT',NULL),
('Tb39e7ce486d6b11b0486',1461313166663,'0','3151-8','Inhaled oxygen flow rate','Inhaled O2 flow rate','CLIN',NULL),
('Tb3f23adeec46f01902486',1461313477088,'0','33773-3','Karyotype [Identifier] in Amniotic fluid Nominal','Karyotyp Amn','MOLPATH',NULL),
('tb5a28e173cc4c34102354',1461313456595,'0','46994-0','HLA-A+B+C (class I) Ab in Serum','HLA-A+B+C Ab NFr Ser','HLA',NULL),
('Tb5e3f22acd9f527b03236',1461313594141,'0','34441-6','Spermatozoa [Velocity] in Semen','Sperm Smn Qn','FERT',NULL),
('Tb6710e93b6871e1102086',1461313414726,'0','11266-4','Streptococcus agalactiae Ag [Presence] in Unspecified specimen','Gp B Strep Ag XXX Ql','MICRO',NULL),
('tba6d04071a9252270904',1461313231322,'0','5783-6','Unidentified crystals [Presence] in Urine sediment by Light microscopy','Unident Crys UrnS Ql Micro','UA',NULL),
('Tbbba665425ac0c7f01286',1461313291398,'0','9593-5','Borrelia burgdorferi 41kD IgG Ab [Presence] in Serum by Immunoblot (IB)','B burgdor41kD IgG Ser Ql IB','MICRO',NULL),
('tbd25ff5193e0d1720154',1461313113901,'0','2075-0','Chloride [Moles/volume] in Serum or Plasma','Chloride SerPl-sCnc','CHEM',NULL),
('tbeae430afa102e0403204',1461313588869,'0','14207-5','Streptococcal DNAse B [Titer] in Serum','Strep DNAse B Titr Ser','MICRO',NULL),
('tc0d0da6c6f9a3f6402004',1461313401972,'0','8191-9','Cocaine [Presence] in Serum or Plasma by Screen method','Cocaine SerPl Ql Scn','DRUG/TOX',NULL),
('tc0ed3882b509b9dc03954',1461313705603,'0','20658-1','Threonine [Moles/volume] in Serum or Plasma','Threonine SerPl-sCnc','CHEM',NULL),
('Tc2769acf420e785a03186',1461313586237,'0','19261-7','Amphetamines [Presence] in Urine by Screen method','Amphetamines Ur Ql Scn','DRUG/TOX',NULL),
('Tc27e6fbc6d5cd36b03686',1461313663750,'0','13589-7','Activated protein C resistance [Presence] in Blood by Probe and target amplification method','aPCR Bld Ql PCR','COAG',NULL),
('Tc28e8d1a1edbabb90886',1461313228753,'0','18932-4','Imipenem [Susceptibility]','Imipenem Susc Islt','ABXBACT',NULL),
('tc34f0561f94082af02904',1461313542258,'0','31032-6','Baker\'s yeast IgA Ab [Units/volume] in Serum','Baker\'s yeast IgA Qn','ALLERGY',NULL),
('Tc3f43de79fa7c96603986',1461313710592,'0','6733-0','Pigeon serum Ab [Presence] in Serum by Immune diffusion (ID)','Pigeon Serum Ab Ql ID','ALLERGY',NULL),
('tc89563b012c4456503254',1461313597340,'0','27823-4','Protein S Ag actual/normal in Platelet poor plasma by Immunologic method','Prot S Ag Act/Nor PPP Imm','COAG',NULL),
('tca1af03be6c5e82a02454',1461313471807,'0','2270-7','Fat [Presence] in Stool','Fat Stl Ql','CHEM',NULL),
('tcc2715449e40c40b02804',1461313526513,'0','19835-8','Breath rate setting Ventilator synchronized intermittent mandatory','Breaths setting SIMV','PULM',NULL),
('Tce9b4bdf7ea7bdf103536',1461313640425,'0','13942-8','Spermatozoa Motile [Presence] in Semen by Light microscopy','Sperm Motile Smn Ql Micro','FERT',NULL),
('Tcef34ecaf165193b0586',1461313182074,'0','18282-4','Cannabinoids [Presence] in Urine by Screen method','Cannabinoids Ur Ql Scn','DRUG/TOX',NULL),
('Tcf476b4bf65ad9ae0836',1461313221249,'0','763-3','Neutrophils.band form [#/volume] in Blood by Manual count','Neuts Band # Bld Manual','HEM/BC',NULL),
('Td0b34757c18dfde101686',1461313352821,'0','13183-9','White Elm IgG Ab [Units/volume] in Serum','White Elm IgG Qn','ALLERGY',NULL),
('Td0dbeabef75338eb02886',1461313539675,'0','588-4','Legionella pneumophila Ag [Presence] in Unspecified specimen by Immunofluorescence','L pneumo Ag XXX Ql IF','MICRO',NULL),
('Td29a99bb005c10b801186',1461313275887,'0','3376-1','\"Barbiturates [Presence] in Serum',' Plasma or Blood\"','Barbiturates SerPlBld Ql',NULL),
('td3de0b81a17a605303904',1461313697797,'0','17815-2','Beta globulin/Protein.total in unspecified time Urine by Electrophoresis','B-Globulin ?Tm MFr Ur Elph','CHEM',NULL),
('Td436fbac5d6b14d603636',1461313656161,'0','15076-3','Glucose [Moles/volume] in Urine','Glucose Ur-sCnc','CHEM',NULL),
('td9aac049dff172b30504',1461313169221,'0','11282-1','Cells Counted Total [#] in Blood','Total Cells Counted Bld','HEM/BC',NULL),
('tdaf473fda0ecaf0904004',1461313713325,'0','20499-0','Phosphatidylglycerol/Surfactant.total in Amniotic fluid','PG MFr Amn','CHEM',NULL),
('tdba697f7b17acbb101604',1461313340117,'0','5862-8','Influenza virus A Ag [Presence] in Unspecified specimen by Immunoassay','FLUAV Ag XXX Ql EIA','MICRO',NULL),
('Tdbeeb5dda0003ae30936',1461313236241,'0','18996-9','Tobramycin [Susceptibility]','Tobramycin Susc Islt','ABXBACT',NULL),
('tdfce7eba6c8379fc02504',1461313479697,'0','3141-9','Body weight Measured','Weight Measured','BDYWGT.ATOM',NULL),
('te085787411adaa1103654',1461313658869,'0','32632-2','HEXA gene mutations found [Identifier] in Blood or Tissue by Molecular genetics method Nominal','HEXA gene Mut Anal Bld/T','MOLPATH.MUT',NULL),
('te310f4569209563f02054',1461313409706,'0','24013-5','HIV 1 RNA [interpretation] in Serum','HIV1 RNA Ser-Imp','MICRO',NULL),
('Te3ab957886485f5102436',1461313468974,'0','26043-0','HLA-B27 [Presence] by Probe and target amplification method','HLA-B27 Ql PCR','HLA',NULL),
('TOP2000VERSION',1461313746628,'0','1.1.0',NULL,NULL,NULL,NULL),
('u6817cdf83409cb9301756',1461313363853,'0','16131-5','Herpes simplex virus 2 DNA [Presence] in Unspecified specimen by Probe and target amplification method','HSV2 DNA XXX Ql PCR','MICRO',NULL),
('u69d174cbfeada7ca03956',1461313705920,'0','20657-3','Taurine [Moles/volume] in Serum or Plasma','Taurine SerPl-sCnc','CHEM',NULL),
('u6e2dea1e643f08a102756',1461313519184,'0','14935-1','Urate [Moles/time] in 24 hour Urine','Urate 24h Ur-sRate','CHEM',NULL),
('u6e63c83f72f1a1b70556',1461313177703,'0','11529-5','Surgical pathology study','','ATTACH.CLINRPT',NULL),
('u6e827e96e5d8fdf90856',1461313224098,'0','14698-5','Digoxin [Moles/volume] in Serum or Plasma','Digoxin SerPl-sCnc','DRUG/TOX',NULL),
('U6f6f17c6ab29f4620892',1461313229664,'0','22322-2','Hepatitis B virus surface Ab [Presence] in Serum','HBV surface Ab Ser Ql','MICRO',NULL),
('U71093f566647fc4c01642',1461313346151,'0','17859-0','Helicobacter pylori IgG Ab [Presence] in Serum or Plasma by Immunoassay','H pylori IgG SerPl Ql EIA','MICRO',NULL),
('u7341a9c981201f5c0456',1461313161858,'0','21000-5','Erythrocyte distribution width [Entitic volume] by Automated count','RDW RBC Auto','HEM/BC',NULL),
('U75b9af46c51447dd03892',1461313695700,'0','7445-0','Lactalbumin alpha IgE Ab [Units/volume] in Serum','A-Lactalb IgE Qn','ALLERGY',NULL),
('u7610832e11f4408f02506',1461313479972,'0','5348-8','SCL-70 extractable nuclear Ab [Presence] in Serum by Immunoassay','ENA Scl70 Ab Ser Ql EIA','SERO',NULL),
('u762df3e7de3c103402056',1461313410346,'0','17780-8','Helicobacter pylori Ag [Presence] in Stool by Immunoassay','H pylori Ag Stl Ql EIA','MICRO',NULL),
('u78b82f1c912ac62403906',1461313698123,'0','17817-8','Gamma globulin/Protein.total in unspecified time Urine by Electrophoresis','Gamma glob ?Tm MFr Ur Elph','CHEM',NULL),
('U7e6cac381674ea6904042',1461313719701,'0','20420-6','Prostatic acid phosphatase [Mass/volume] in Serum','PACP Ser-mCnc','CHEM',NULL),
('U7e7cc04111331f4402792',1461313524625,'0','20593-0','CD19 cells/100 cells in Unspecified specimen','CD19 Cells NFr XXX','CELLMARK',NULL),
('u7eb1c358bc2cf76001306',1461313294759,'0','47000-5','Candida sp rRNA [Presence] in Vaginal fluid by DNA probe','Candida rRNA Vag Ql Prb','MICRO',NULL),
('U8173ead449d42eaa01242',1461313284662,'0','49048-2','Protein feed time','Protein feed time Patient','CHEM',NULL),
('U82c1040bb5a892ad02342',1461313454716,'0','25362-5','Calcium [Moles/volume] in 24 hour Urine','Calcium 24h Ur-sCnc','CHEM',NULL),
('u844273edbf952c860156',1461313114236,'0','789-8','Erythrocytes [#/volume] in Blood by Automated count','RBC # Bld Auto','HEM/BC',NULL),
('U8543d6a3b0d191510492',1461313167582,'0','26508-2','Neutrophils.band form/100 leukocytes in Blood','Neuts Band NFr Bld','HEM/BC',NULL),
('u86c52ecf473afc4002406',1461313464653,'0','33594-3','Platelet factor 4 [Presence] in Platelet poor plasma','PF4 PPP Ql','COAG',NULL),
('U8794f5394844673403592',1461313649441,'0','31843-6','Helicobacter pylori Ag [Presence] in Stool','H pylori Ag Stl Ql','MICRO',NULL),
('U87dd8d4c351404bd02742',1461313517052,'0','18319-4','Neutrophils.vacuolated [Presence] in Blood by Light microscopy','Neuts Vac Bld Ql Smear','HEM/BC',NULL),
('u88c5dd5e64b87cbc0806',1461313216111,'0','14771-0','Fasting glucose [Moles/volume] in Serum or Plasma','Glucose p fast SerPl-sCnc','CHAL',NULL),
('u8961e845c8264f1301706',1461313355879,'0','29771-3','Hemoglobin.gastrointestinal [Presence] in Stool by Immunologic method','Occult Bld Stl Ql Imm','CHEM',NULL),
('U8c7495badfd6584a02842',1461313532705,'0','35126-2','Hemoglobin O - Arab/Hemoglobin.total in Blood','Hgb O-Arab MFr Bld','HEM/BC',NULL),
('u8e2580a7d0ab237702456',1461313472124,'0','6278-6','White Ash IgE Ab [Units/volume] in Serum','White Ash IgE Qn','ALLERGY',NULL),
('u8e4cd7e3fd18861904006',1461313713601,'0','50758-2','Herpes simplex virus 1 IgM Ab [Titer] in Serum by Immunofluorescence','HSV1 IgM Titr Ser IF','MICRO',NULL),
('U91ddbe12d1df680702442',1461313469894,'0','19296-3','Opiates tested for in Urine by Screen method Nominal','Opiates Tested Ur Scn','DRUG/TOX',NULL),
('u964b958ac43a29bb01256',1461313286961,'0','14196-0','Reticulocytes [#/volume] in Blood','Retics #','HEM/BC',NULL),
('u9723a6b2ecf0220802906',1461313542517,'0','47320-7','Baker\'s yeast IgA Ab [Units/volume] in Serum by Immunoassay','Baker\'s yeast IgA Qn EIA','ALLERGY',NULL),
('u97d0ea97cd15065701356',1461313302272,'0','26052-1','Epithelial cells.renal [#/area] in Urine sediment by Microscopy high power field','Renal Epi Cells #/area UrnS HPF','UA',NULL),
('U9976a5f8d57844350192',1461313119460,'0','704-7','Basophils [#/volume] in Blood by Automated count','Basophils # Bld Auto','HEM/BC',NULL),
('U9b77ed4b090df8a30142',1461313112045,'0','718-7','Hemoglobin [Mass/volume] in Blood','Hgb Bld-mCnc','HEM/BC',NULL),
('U9c9af91bcef2ac4d0792',1461313214222,'0','14914-6','Testosterone Free [Moles/volume] in Serum or Plasma','Testost Free SerPl-sCnc','CHEM',NULL),
('U9e65ae43df81093102042',1461313407756,'0','14905-4','Retinol [Moles/volume] in Serum or Plasma','Vit A SerPl-sCnc','CHEM',NULL),
('Ua05b229e2f641bc202142',1461313423584,'0','13530-1','Nucleated erythrocytes [#/volume] in Body fluid by Manual count','nRBC # Fld Manual','HEM/BC',NULL),
('ua200685a48514f1b02806',1461313526964,'0','27395-3','Streptococcus pneumoniae 56 IgG Ab [Mass/volume] in Serum','S pneum56 IgG Ser-mCnc','MICRO',NULL),
('Ua221d2bc6a4c64eb02492',1461313477841,'0','8338-6','Body weight Measured --ante partum','Weight ante partum Measured','BDYWGT.MOLEC',NULL),
('Ua23e09258deeb56603192',1461313587040,'0','6109-3','White Elm IgE Ab [Units/volume] in Serum','White Elm IgE Qn','ALLERGY',NULL),
('ua2a9cb3db64aad2304056',1461313722040,'0','29559-2','Haemophilus ducreyi DNA [Presence] in Unspecified specimen by Probe and target amplification method','H ducreyi DNA XXX Ql PCR','MICRO',NULL),
('Ua4e8e51e901f330d0542',1461313175313,'0','48345-3','HIV 1+O+2 Ab [Presence] in Serum or Plasma','HIV 1+O+2 Ab SerPl Ql','MICRO',NULL),
('ua8af98cc4af1019d01206',1461313278821,'0','56537-4','Tissue transglutaminase IgG Ab [Units/volume] in Serum by Immunoassay','tTG IgG Ser EIA-aCnc','SERO',NULL),
('Ua96613f60f912c2e03142',1461313579102,'0','6190-3','Oat IgE Ab [Units/volume] in Serum','Oat IgE Qn','ALLERGY',NULL),
('Ua98347fdba6a297b02392',1461313462296,'0','5791-9','Fungi.yeastlike [#/area] in Urine sediment by Microscopy high power field','Yeast Like Fungi #/area UrnS HPF','UA',NULL),
('Uadf59666266bf4600442',1461313159601,'0','1798-8','Amylase [Enzymatic activity/volume] in Serum or Plasma','Amylase SerPl-cCnc','CHEM',NULL),
('Ub19c8e6beb92bf7e01742',1461313361763,'0','5866-9','Influenza virus B Ag [Presence] in Unspecified specimen by Immunoassay','FLUBV Ag XXX Ql EIA','MICRO',NULL),
('ub7a1d9d2b9cbe82b02856',1461313534861,'0','35571-9','Tyrosine [Moles/volume] in Dried blood spot','Tyrosine DBS-sCnc','CHEM',NULL),
('ub909c99a7db881930506',1461313169513,'0','2106-3','Choriogonadotropin (pregnancy test) [Presence] in Urine','HCG Preg Ur Ql','CHEM',NULL),
('ub90a5c8f9b5ba57103656',1461313659154,'0','70239-9','Testosterone [Moles/volume] in Serum or Plasma by Detection limit <= 3.47 pmol/L','Testost SerPl DL<= 3.47 pmol/L-sCnc','CHEM',NULL),
('Ub9d59f0604f5e6b601592',1461313338244,'0','5892-5','Protein S [Units/volume] in Platelet poor plasma by Coagulation assay','Prot S PPP-aCnc','COAG',NULL),
('uba022bc2ff29f06901956',1461313394501,'0','12208-5','Eosinophils/100 leukocytes in Cerebral spinal fluid by Manual count','Eosinophil NFr CSF Manual','HEM/BC',NULL),
('Uba9f784eaa95830501692',1461313353707,'0','1871-3','Apolipoprotein B-100 [Mass/volume] in Serum or Plasma','Apo B100 SerPl-mCnc','CHEM',NULL),
('Ubb3564122b63020902892',1461313540486,'0','17607-3','Volume of Cerebral spinal fluid','Specimen vol CSF','SPEC',NULL),
('Ubd38b4fca7db003703942',1461313703780,'0','9326-0','Phosphatidylserine IgG Ab [Presence] in Serum by Immunoassay','PS IgG Ser Ql EIA','COAG',NULL),
('ubdb62677012bf64202356',1461313456822,'0','6208-3','Pecan or Hickory Nut IgE Ab [Units/volume] in Serum','Pecan/Hick Nut IgE Qn','ALLERGY',NULL),
('uc05075a7e1b0ba4701606',1461313340418,'0','45371-2','Multiple pregnancy','Multiple Pregnancy','CLIN',NULL),
('uc44f319b1f02ba2e0956',1461313239524,'0','35492-8','Methicillin resistant Staphylococcus aureus (MRSA) DNA [Presence] by Probe and target amplification method','MRSA DNA XXX Ql PCR','ABXBACT',NULL),
('uc71d813754c4b25003156',1461313581649,'0','25361-7','Caffeine [Moles/volume] in Serum or Plasma','Caffeine SerPl-sCnc','DRUG/TOX',NULL),
('Uc7aa2987f52615470592',1461313183052,'0','1003-3','Indirect antiglobulin test.complement specific reagent [Presence] in Serum or Plasma','IAT Comp-Sp Reag SerPl Ql','BLDBK',NULL),
('Uc8405712eaa54f3703542',1461313641160,'0','19088-4','Collection of urine specimen start date','Collect Start Date Ur','SPEC',NULL),
('uc8e4b253976fec2c03256',1461313597649,'0','560-3','Chlamydia sp identified in Unspecified specimen by Organism specific culture','Chlamydia XXX Cult','MICRO',NULL),
('Uc95fca086c7419e60842',1461313221934,'0','19000-9','Vancomycin [Susceptibility]','Vancomycin Susc Islt','ABXBACT',NULL),
('Ucaa2da232ce1b36201292',1461313292718,'0','9589-3','Borrelia burgdorferi 23kD IgG Ab [Presence] in Serum by Immunoblot (IB)','B burgdor23kD IgG Ser Ql IB','MICRO',NULL),
('Ucacae8f2c20a916701192',1461313276681,'0','2021-4','Carbon dioxide [Partial pressure] in Venous blood','pCO2 BldV','CHEM',NULL),
('ucb017df66f6b7cd703206',1461313589111,'0','44547-8','Human papilloma virus DNA [Presence] in Unspecified specimen by Probe and signal amplification method','HPV DNA XXX Ql bDNA','MICRO',NULL),
('ucc6650a290336c7a0906',1461313231753,'0','39797-6','Vancomycin [Moles/volume] in Serum or Plasma --trough','Vancomycin Trough SerPl-sCnc','DRUG/TOX',NULL),
('Ucca7ecf0b095fee602092',1461313415562,'0','1927-3','Base excess in Venous blood','Base excess BldV-sCnc','CHEM',NULL),
('uccdda9737853d34603506',1461313635952,'0','33917-6','Nornicotine [Mass/volume] in Urine','Nornicotine Ur-mCnc','DRUG/TOX',NULL),
('ucd6b9699945d7d7803556',1461313643608,'0','7558-0','Oyster IgE Ab [Units/volume] in Serum','Oyster IgE Qn','ALLERGY',NULL),
('uce2cae4858a24b6603606',1461313651381,'0','19287-2','Cannabinoids tested for in Urine by Screen method Nominal','Cannabinoids Tested Ur Scn','DRUG/TOX',NULL),
('ucfdb260210e092a202106',1461313417652,'0','8014-3','Rubella virus IgG Ab [Units/volume] in Serum','RUBV IgG Ser-aCnc','MICRO',NULL),
('ud4b232e9a372367702006',1461313402273,'0','13068-2','Nuclear Ab pattern [interpretation] in Serum by Immunofluorescence','ANA Pat Ser IF-Imp','SERO',NULL),
('Ud649f758f5c4c64103992',1461313711511,'0','5869-3','Parainfluenza virus 1 Ag [Presence] in Unspecified specimen by Immunofluorescence','HPIV1 Ag XXX Ql IF','MICRO',NULL),
('ud7b420f292ba6ba501656',1461313348374,'0','7966-5','Mumps virus IgG Ab [Units/volume] in Serum','MuV IgG Ser-aCnc','MICRO',NULL),
('Ude345617aad8113d03642',1461313657135,'0','20446-1','Herpes simplex virus IgG Ab [interpretation] in Serum by Immunoassay','HSV IgG Ser EIA-Imp','MICRO',NULL),
('Ude7bfb7dbada616903242',1461313595368,'0','6195-2','Cocksfoot IgE Ab [Units/volume] in Serum','Cocksfoot IgE Qn','ALLERGY',NULL),
('Ue162972ac1bbce4a01342',1461313300216,'0','19993-5','Oxygen/Inspired gas Inhaled gas by Gas dilution.rebreath','FIO2 Gas Dil.rebreath','PULM',NULL),
('Ue16d7be8f5da55de03292',1461313603264,'0','21416-3','Neisseria gonorrhoeae DNA [Presence] in Urine by Probe and target amplification method','N gonorrhoea DNA Ur Ql PCR','MICRO',NULL),
('Ue2de6dc487fe860a01992',1461313400193,'0','11050-2','Immunoglobulin light chains.kappa [Mass/volume] in Serum','Kappa LC Ser-mCnc','CHEM',NULL),
('Ue542ae30f05abb9d0942',1461313237026,'0','1305-2','D Ag [Presence] in Blood','D Ag Bld Ql','BLDBK',NULL),
('ue623bffcdd2f0c450206',1461313122442,'0','30428-7','Erythrocyte mean corpuscular volume [Entitic volume]','MCV RBC','HEM/BC',NULL),
('v690edc6bef952d170572',1461313179943,'0','33903-6','Ketones [Presence] in Urine','Ketones Ur Ql','CHEM',NULL),
('V6945544b2be89c4901535',1461313329544,'0','20495-8','Gliadin IgA Ab [Units/volume] in Serum by Immunoassay','Gliadin IgA Ser EIA-aCnc','SERO',NULL),
('v69f7da91c5b9adc503522',1461313638351,'0','44538-7','HTLV 1+2 Ab [Presence] in Serum from donor','HTLV1+2 Ab Ser Donr Ql','MICRO',NULL),
('V6b3956395dc31b480235',1461313126822,'0','33069-6','Fetal Neck.soft tissue Translucency width US','Fet Width.translucency US.meas','OB.US',NULL),
('v6dc666545ae6095d02372',1461313459179,'0','27822-6','Protein S actual/normal in Platelet poor plasma by Coagulation assay','Prot S Act/Nor PPP','COAG',NULL),
('V6dd9dbe289756fd302535',1461313484752,'0','5880-0','Rotavirus Ag [Presence] in Stool by Immunoassay','RV Ag Stl Ql EIA','MICRO',NULL),
('V6f5f80cb4ef3858001085',1461313259700,'0','24475-6','F2 gene p.G20210A [Presence] in Blood or Tissue by Molecular genetics method','F2 p.G20210A Bld/T Ql','MOLPATH.MUT',NULL),
('V7024a0d257c8236a03035',1461313562740,'0','11013-0','DNA double strand Ab [Titer] in Serum','dsDNA Ab Titr Ser','SERO',NULL),
('V70478a118ba9cfa603385',1461313617299,'0','1992-7','Calcitonin [Mass/volume] in Serum or Plasma','Calcit SerPl-mCnc','CHEM',NULL),
('v71502364940941130972',1461313241981,'0','18860-7','Amikacin [Susceptibility]','Amikacin Susc Islt','ABXBACT',NULL),
('V719e591a9e88a2e20735',1461313205189,'0','20569-0','Creatine kinase.MB/Creatine kinase.total in Serum or Plasma','CK MB CFr SerPl','CHEM',NULL),
('V720545dfd857ad9503835',1461313687050,'0','14875-9','Phenylalanine [Moles/volume] in Serum or Plasma','Phe SerPl-sCnc','CHEM',NULL),
('V725da6ba16e23b470635',1461313189640,'0','1250-0','Major crossmatch [interpretation]','Maj XM SerPl-Imp','BLDBK',NULL),
('V72d00472fcb35beb04185',1461313741939,'0','30394-1','Granulocytes [#/volume] in Blood','Granulocytes # Bld','HEM/BC',NULL),
('v7a0336d61b63446402022',1461313404947,'0','19415-9','Tetrahydrocannabinol [Presence] in Urine by Screen method','THC Ur Ql Scn','DRUG/TOX',NULL),
('v7de70e17b829ff6a0172',1461313116509,'0','787-2','Erythrocyte mean corpuscular volume [Entitic volume] by Automated count','MCV RBC Auto','HEM/BC',NULL),
('v7f8585f0041add7c01322',1461313297265,'0','6331-3','Campylobacter sp identified in Stool by Organism specific culture','Campylobacter Stl Cult','MICRO',NULL),
('v7f8ea39aaa39909d02122',1461313420208,'0','33910-1','Rheumatoid factor [Presence] in Serum','Rheumatoid fact Ser Ql','SERO',NULL),
('v80bcef8f5856637801222',1461313281712,'0','19066-0','Blood bank comment','Blood Bank Cmnt Patient-Imp','BLDBK',NULL),
('V817de46d0f4c1e3704135',1461313734183,'0','5773-7','Calcium carbonate crystals [Presence] in Urine sediment by Light microscopy','Ca Carbonate Cry UrnS Ql Micro','UA',NULL),
('V81bee2fdd04dca0502585',1461313492165,'0','27818-4','Protein C actual/normal in Platelet poor plasma by Chromogenic method','Prot C Act/Nor PPP Chro','COAG',NULL),
('V81ec0ec3934f957504085',1461313726086,'0','765-8','Neutrophils.hypersegmented [Presence] in Blood by Light microscopy','Neuts Hyperseg Bld Ql Smear','HEM/BC',NULL),
('V8852369ec6dd808a01835',1461313375921,'0','6252-1','Stemphylium botryosum IgE Ab [Units/volume] in Serum','S botryosum IgE Qn','ALLERGY',NULL),
('v89c77917713152580822',1461313218826,'0','7791-7','Dacrocytes [Presence] in Blood by Light microscopy','Dacryocytes Bld Ql Smear','HEM/BC',NULL),
('v8a19254b280c0f4801972',1461313396791,'0','13529-3','Nucleated erythrocytes [#/volume] in Cerebral spinal fluid by Manual count','nRBC # CSF Manual','HEM/BC',NULL),
('V8a2df0352d3edee30385',1461313150692,'0','2857-1','Prostate specific Ag [Mass/volume] in Serum or Plasma','PSA SerPl-mCnc','CHEM',NULL),
('v8bd837fce99c347702822',1461313529580,'0','27094-2','Streptococcus pneumoniae 4 IgG Ab [Mass/volume] in Serum','S pneum4 IgG Ser-mCnc','MICRO',NULL),
('V8dc9aa4351ee52b601785',1461313368198,'0','14674-6','Corticotropin [Moles/volume] in Plasma','ACTH Plas-sCnc','CHEM',NULL),
('v8e829eef7a06b6d502872',1461313537135,'0','13499-9','HIV 1 Ab band pattern [interpretation] in Serum by Immunoblot (IB)','HIV1 Ab Patrn Ser IB-Imp','MICRO',NULL),
('V9560282934bc406202235',1461313437850,'0','6183-8','Mugwort IgE Ab [Units/volume] in Serum','Mugwort IgE Qn','ALLERGY',NULL),
('V96f227dc867b63bd02685',1461313508044,'0','27229-4','Streptococcus pneumoniae 14 IgG Ab [Mass/volume] in Serum by Immunoassay','S pneum14 IgG Ser EIA-mCnc','MICRO',NULL),
('v98145f1374e976fe03572',1461313646340,'0','2669-0','Normetanephrine [Mass/volume] in Serum or Plasma','Normetanephrine SerPl-mCnc','CHEM',NULL),
('v995bad2d8f1f9ac60922',1461313234135,'0','1925-7','Base excess in Arterial blood','Base excess BldA-sCnc','CHEM',NULL),
('v9bcb6803103d62b503622',1461313653638,'0','9609-9','Hepatitis C virus 22-3 Ab [Presence] in Serum by Immunoblot (IB)','HCV22-3 Ab Ser Ql IB','MICRO',NULL),
('v9c17a0f5ca4a4cae01272',1461313289360,'0','47238-1','Treponema pallidum IgG Ab [Presence] in Serum by Immunoassay','T pallidum IgG Ser Ql EIA','MICRO',NULL),
('V9c4c5aa90d1d78be0335',1461313142961,'0','20454-5','Protein [Presence] in Urine by Test strip','Prot Ur Ql Strip','UA',NULL),
('v9dcd64d553c8f35902422',1461313466993,'0','9795-6','Composition in Stone','Compn Stone','PATH',NULL),
('V9f01220c9924e88301935',1461313391441,'0','29953-7','Nuclear Ab [Titer] in Serum','ANA Titr Ser','SERO',NULL),
('v9fbe3e488a0c1c9e0472',1461313164607,'0','735-1','Lymphocytes Variant/100 leukocytes in Blood by Manual count','Variant Lymphs NFr Bld Manual','HEM/BC',NULL),
('va190eee72e025a8503222',1461313591910,'0','33984-6','Coagulation factor X activity actual/normal in Platelet poor plasma by Chromogenic method','Fact X Act/Nor PPP Chro','COAG',NULL),
('Va3338f53d8d2500b03485',1461313632726,'0','59841-7','Vendor name [Identifier] in Unspecified specimen','Vendor name XXX','CHEM',NULL),
('va5622212a238a76e04022',1461313716316,'0','16085-3','Wheat IgE Ab RAST class in Serum','Wheat IgE RAST Ql','ALLERGY',NULL),
('va758120b65a506f503972',1461313708538,'0','3218-5','Coagulation factor X activity actual/normal in Platelet poor plasma by Coagulation assay','Fact X Act/Nor PPP','COAG',NULL),
('Va8dcaf5e2fd492e001885',1461313383611,'0','33022-5','Carbon dioxide [Partial pressure] in Capillary blood by Transcutaneous CO2 monitor','pCO2 BldC TcCo2','PULM',NULL),
('Vac7d66271aed01d902335',1461313453897,'0','28646-8','pH of Arterial cord blood','pH BldCoA','CHEM',NULL),
('Vad4b1d942109bfee0685',1461313197786,'0','19244-3','Character of Urine','Character Ur','SPEC',NULL),
('vaef50f94c0a47f2c03122',1461313576276,'0','601-5','Fungus identified in Blood by Culture','Fungus Bld Cult','MICRO',NULL),
('Vb030a99aef8098e103435',1461313625296,'0','47226-6','Fetal lung maturity [interpretation] in Amniotic fluid','FLM Amn-Imp','CHEM',NULL),
('Vb20cb3a69989a89601385',1461313306902,'0','19254-2','Oxygen [Partial pressure] adjusted to patients actual temperature in Blood','pO2 temp adj Bld','CHEM',NULL),
('Vb3b0f71d5c8014640285',1461313134871,'0','22705-8','Glucose [Moles/volume] in Urine by Test strip','Glucose Ur Strip-sCnc','UA',NULL),
('vb3d30f63025cb13301622',1461313342758,'0','7900-4','Helicobacter pylori Ab [Units/volume] in Serum','H pylori Ab Ser-aCnc','MICRO',NULL),
('Vb4d23c2d0df050090785',1461313213294,'0','48159-8','Hepatitis C virus Ab Signal/Cutoff in Serum or Plasma by Immunoassay','HCV Ab s/co SerPl EIA','MICRO',NULL),
('Vb721d662d64a069601435',1461313314567,'0','49092-0','Second trimester quad maternal screen [interpretation] in Serum or Plasma Narrative','2nd trimester 4 screen SerPl-Imp','CHEM',NULL),
('Vbc954158db536d2103735',1461313671531,'0','15114-2','Arsenic [Moles/volume] in Blood','Arsenic Bld-sCnc','DRUG/TOX',NULL),
('Vbd21bb0ee75cee0c02185',1461313430120,'0','13522-8','Blasts/100 leukocytes in Body fluid by Manual count','Blasts NFr Fld Manual','HEM/BC',NULL),
('Vbd665f46c2ed667803335',1461313609426,'0','15057-3','Androstanolone [Moles/volume] in Serum or Plasma','Androstanolone SerPl-sCnc','CHEM',NULL),
('Vc0717b37e18b861b02635',1461313500155,'0','3174-0','Antithrombin [Units/volume] in Platelet poor plasma by Chromogenic method','AT III PPP Chro-aCnc','COAG',NULL),
('vc0ea643084a3336803672',1461313661619,'0','32147-1','Reducing substances [Mass/volume] in Urine','Reducing Subs Ur-mCnc','UA',NULL),
('vc21495b4428d12cc02522',1461313482513,'0','20466-9','Estriol (E3).unconjugated [Multiple of the median] in Serum or Plasma','u Estriol MoM SerPl','CHEM',NULL),
('Vc23e2289783486a303785',1461313679411,'0','17713-9','Topiramate [Mass/volume] in Serum or Plasma','Topiramate SerPl-mCnc','DRUG/TOX',NULL),
('Vc381d6905fdd4a4f01035',1461313251769,'0','14684-5','Creatinine [Moles/time] in 24 hour Urine','Creat 24h Ur-sRate','CHEM',NULL),
('vc582808bccd946ae01722',1461313358863,'0','5222-5','HIV 1 Ag [Presence] in Serum by Immunoassay','HIV1 Ag Ser Ql EIA','MICRO',NULL),
('vc8578fe80bf3ef6c0522',1461313172129,'0','14801-5','Iron saturation [Molar fraction] in Serum or Plasma','Iron Satn SFr SerPl','CHEM',NULL),
('vc9cd4dec20bc3ca102472',1461313474891,'0','593-4','Legionella sp identified in Unspecified specimen by Organism specific culture','Legionella XXX Cult','MICRO',NULL),
('vca3c64f9cf5c3a8302072',1461313412561,'0','25458-1','Lamotrigine [Moles/volume] in Serum or Plasma','Lamotrigine SerPl-sCnc','DRUG/TOX',NULL),
('vcba1aae5ec5432c703272',1461313599939,'0','20468-5','Thiamine [Moles/volume] in Serum or Plasma','Vit B1 SerPl-sCnc','CHEM',NULL),
('vcdbe40cf225285510872',1461313226347,'0','14719-9','Ethanol [Moles/volume] in Serum or Plasma','Ethanol SerPl-sCnc','DRUG/TOX',NULL),
('vd302561478b05e4701572',1461313335278,'0','22330-5','Hepatitis D virus Ab [Units/volume] in Serum','HDV Ab Ser-aCnc','MICRO',NULL),
('Vd38e159db7ff3d3602935',1461313546821,'0','27228-6','Streptococcus pneumoniae 3 IgG Ab [Mass/volume] in Serum by Immunoassay','S pneum3 IgG Ser EIA-mCnc','MICRO',NULL),
('vdaa723f48a90e66402772',1461313521715,'0','49542-4','Date and time of pheresis procedure','Pheresis Date&Time','BLDBK',NULL),
('Vdba7e4088137a0c402285',1461313445940,'0','21020-3','Bacteria identified in Unspecified specimen by Anaerobe+Aerobe culture','Bacteria XXX Anaerobe+Aerobe Cult','MICRO',NULL),
('vdcdfed221ca2f7950422',1461313156700,'0','14933-6','Urate [Moles/volume] in Serum or Plasma','Urate SerPl-sCnc','CHEM',NULL),
('Vde6c6512a02476c501485',1461313321806,'0','33254-4','pH of Arterial blood adjusted to patients actual temperature','pH temp adj BldA','CHEM',NULL),
('vdf8b08a705b318ba03172',1461313584098,'0','19171-8','Alpha-1-Fetoprotein [Units/volume] in Amniotic fluid','AFP Amn-aCnc','CHEM',NULL),
('ve0bee7dc2215b3eb03922',1461313700738,'0','20651-6','Methionine [Moles/volume] in Serum or Plasma','Methionine SerPl-sCnc','CHEM',NULL),
('Ve0efbe51b91de69502985',1461313554769,'0','33536-4','Miscellaneous allergen IgE Ab RAST class in Serum','Misc Allergen IgE RAST Ql','ALLERGY',NULL),
('Ve2ac3f67aa9034e703085',1461313570554,'0','30361-0','HIV 2 Ab [Presence] in Serum by Immunoassay','HIV2 Ab Ser Ql EIA','MICRO',NULL),
('Ve355a42348e985af01135',1461313267339,'0','19107-2','Histoplasma capsulatum Ag [Units/volume] in Serum by Radioimmunoassay (RIA)','H capsul Ag Ser RIA-aCnc','MICRO',NULL),
('ve665317dec6a326401672',1461313350698,'0','31145-6','Thyroxine (T4) [Moles/volume] in Dried blood spot','T4 DBS-sCnc','CHEM',NULL),
('VERSION',NULL,'0','1.0.0',NULL,NULL,NULL,NULL),
('w67b0706415b9343d01151',1461313270022,'0','14566-4','Calcitriol [Moles/volume] in Serum or Plasma','\"1','25(OH)2D3 SerPl-sCnc\"',NULL),
('W68a91373418db2e70629',1461313188819,'0','12454-5','Urate crystals amorphous [Presence] in Urine sediment by Light microscopy','Amorph Urate Cry UrnS Ql Micro','UA',NULL),
('w6a58c204d7cbe22401101',1461313262124,'0','13952-7','Hepatitis B virus core Ab [Presence] in Serum or Plasma by Immunoassay','HBV core Ab SerPl Ql EIA','MICRO',NULL),
('W6be11d04fd948fe702679',1461313507116,'0','14854-4','Norepinephrine [Moles/time] in 24 hour Urine','Norepineph 24h Ur-sRate','CHEM',NULL),
('W6d1e8ca51138189704079',1461313725300,'0','2711-0','Oxygen saturation in Venous blood','SaO2 % BldV','HEMODYN.MOLEC',NULL),
('w6f59df9f4374c77003851',1461313689566,'0','15097-9','Vanillylmandelate [Moles/volume] in Urine','VMA Ur-sCnc','CHEM',NULL),
('w72c411042074ba6703051',1461313565130,'0','20449-5','Borrelia burgdorferi Ab [Presence] in Serum by Immunoassay','B burgdor Ab Ser Ql EIA','MICRO',NULL),
('W747074731776136301529',1461313328850,'0','5793-5','Granular casts [#/area] in Urine sediment by Microscopy low power field','Gran Casts #/area UrnS LPF','UA',NULL),
('w7901805eb736b5ac01851',1461313378771,'0','14679-5','Cortisol [Moles/volume] in Serum or Plasma --AM peak specimen','Cortis AM peak SerPl-sCnc','CHEM',NULL),
('w7ba3399b7169cba803451',1461313627669,'0','26536-3','Cortisol [Moles/volume] in Serum or Plasma --1 hour post dose corticotropin','Cortis 1h p ACTH SerPl-sCnc','CHAL',NULL),
('W7cbc3abf95f9dfd80329',1461313142209,'0','22638-1','Pathology report comments Narrative','Path report.comments Imp Spec','TUMRRGT',NULL),
('W7e2b25861b3bf69d03479',1461313631933,'0','5644-0','Ethanol [Presence] in Urine','Ethanol Ur Ql','DRUG/TOX',NULL),
('W7e84bc9eba10c0930279',1461313133885,'0','26474-7','Lymphocytes [#/volume] in Blood','Lymphocytes # Bld','HEM/BC',NULL),
('w80bc5ca8239a62fe03101',1461313573226,'0','70210-0','Morphine [Moles/volume] in Urine by Confirmatory method','Morphine Ur Cfm-sCnc','DRUG/TOX',NULL),
('w81f876ff7c5bc98801051',1461313254143,'0','18964-7','Penicillin [Susceptibility]','Penicillin Susc Islt','ABXBACT',NULL),
('w83978436a64ca9c402701',1461313510668,'0','3746-5','Meperidine [Presence] in Urine','Meperidine Ur Ql','DRUG/TOX',NULL),
('w852880fad2d098c00651',1461313192413,'0','10331-7','Rh [Type] in Blood','Rh Bld','BLDBK',NULL),
('W8547e05fac9204de03829',1461313686039,'0','12215-0','Fatty acids.very long chain [Moles/volume] in Serum or Plasma','VLCFA SerPl-sCnc','CHEM',NULL),
('W8893b63823c33adc03379',1461313616538,'0','28009-9','Volume of Urine','Specimen vol Ur','SPEC',NULL),
('w8b0afbb2ee3714020751',1461313208122,'0','18878-9','Cefazolin [Susceptibility]','Cefazolin Susc Islt','ABXBACT',NULL),
('w8ef70de614b0a4d203001',1461313557159,'0','14664-7','Color of Synovial fluid','Color Snv','SPEC',NULL),
('w8fb0dbb679510b4001551',1461313331918,'0','23883-2','Inhibin A [Mass/volume] in Serum','Inhibin A Ser-mCnc','CHEM',NULL),
('W92bb17959453433a01929',1461313390698,'0','5076-5','Cardiolipin IgA Ab [Units/volume] in Serum by Immunoassay','Cardiolipin IgA Ser EIA-aCnc','COAG',NULL),
('w93119d2d539437c302301',1461313448214,'0','32133-1','Lactate [Moles/volume] in Plasma venous','Lactate PlasV-sCnc','CHEM',NULL),
('w941996570d1faeb901951',1461313393882,'0','19941-4','Oxygen gas flow Oxygen delivery system','Gas flow.O2 O2 delivery sys','PULM',NULL),
('W96bb8c1f8062ba6c0379',1461313149781,'0','26444-0','Basophils [#/volume] in Blood','Basophils # Bld','HEM/BC',NULL),
('w96d908e5870c378c02151',1461313424688,'0','11565-9','Jo-1 extractable nuclear Ab [Units/volume] in Serum','ENA Jo1 Ab Ser-aCnc','SERO',NULL),
('W98a431342798f9e101029',1461313250866,'0','7918-6','HIV 1+2 Ab [Presence] in Serum','HIV1+2 Ab Ser Ql','MICRO',NULL),
('W98e87ebc89c7ea5c02179',1461313429042,'0','49053-2','History of neural tube defect Narrative','Neural tube defect Hx Patient','CHEM',NULL),
('W998feaa15c80043803429',1461313624393,'0','6035-0','Banana IgE Ab [Units/volume] in Serum','Banana IgE Qn','ALLERGY',NULL),
('W9b7e9010f876460003879',1461313693995,'0','22568-0','Streptolysin O Ab [Titer] in Serum','ASO Ab Titr Ser','MICRO',NULL),
('w9cd6147343f418350401',1461313153458,'0','6742-1','Erythrocyte morphology finding [Identifier] in Blood','RBC morph Bld','HEM/BC',NULL),
('W9d57fcdb6bce43710779',1461313212316,'0','13950-1','Hepatitis A virus IgM Ab [Presence] in Serum or Plasma by Immunoassay','HAV IgM SerPl Ql EIA','MICRO',NULL),
('W9e88cddb4752ec3402279',1461313445021,'0','14915-3','Theophylline [Moles/volume] in Serum or Plasma','Theophylline SerPl-sCnc','DRUG/TOX',NULL),
('w9fd442e1bf354a6101901',1461313385809,'0','13527-7','Unidentified cells/100 leukocytes in Cerebral spinal fluid by Manual count','Unident Cells NFr CSF Manual','HEM/BC',NULL),
('wa162265ac57aa47601001',1461313246053,'0','21667-1','F5 gene mutations found [Identifier] in Blood or Tissue by Molecular genetics method Nominal','F5 gene Mut Anal Bld/T','MOLPATH.MUT',NULL),
('wa22bf3b647570e0b0251',1461313129205,'0','5802-4','Nitrite [Presence] in Urine by Test strip','Nitrite Ur Ql Strip','UA',NULL),
('Wa23a1e6ce5f19fee02229',1461313436939,'0','681-7','Microscopic observation [Identifier] in Unspecified specimen by Wright stain','Wright Stn XXX','MICRO',NULL),
('wa45d77c9337214ba03801',1461313682019,'0','49700-8','Metanephrine Free [Moles/volume] in Serum or Plasma','Metaneph Free SerPl-sCnc','CHEM',NULL),
('wa4625b4f3939c37102201',1461313432935,'0','7407-0','White Hickory IgE Ab [Units/volume] in Serum','White Hickory IgE Qn','ALLERGY',NULL),
('Wa50a12c958490e6d0729',1461313204346,'0','9842-6','Casts [#/area] in Urine sediment by Microscopy low power field','Casts #/area UrnS LPF','UA',NULL),
('wa51b1506e81788e402651',1461313502587,'0','2873-8','Gamma globulin [Mass/volume] in Cerebral spinal fluid by Electrophoresis','Gamma glob CSF Elph-mCnc','CHEM',NULL),
('Wa8d4a7eb12c709f303329',1461313608515,'0','32164-6','Cells [#/volume] in Synovial fluid by Manual count','Cells # Snv Manual','HEM/BC',NULL),
('Waa676f03f348d4b102579',1461313491255,'0','28649-2','Oxygen [Partial pressure] in Venous cord blood','pO2 BldCoV','CHEM',NULL),
('Waa905fca3bce5fec0679',1461313196733,'0','19139-5','Pathologist name','Pathologist name','CLIN',NULL),
('Wabce91ca344c191501129',1461313266586,'0','20761-3','Clostridium difficile [Presence] in Stool by Agglutination','C dif Stl Ql Aggl','MICRO',NULL),
('Waead0e44d87dee7b02629',1461313499285,'0','57804-7','Number of occult blood specimens recommended by testing kit protocol [#] in Stool','# Occ bld spec recommended Stl','CHEM',NULL),
('waff5b0b73c4a9f6b01501',1461313324663,'0','24108-3','Cancer Ag 19-9 [Units/volume] in Serum or Plasma','Cancer Ag19-9 SerPl-aCnc','CHEM',NULL),
('wb25044f58326904804151',1461313736690,'0','5766-1','Ammonium urate crystals [Presence] in Urine sediment by Light microscopy','Amm Urate Cry UrnS Ql Micro','UA',NULL),
('wb3f1d9c8f846087e04101',1461313728418,'0','46138-4','Urate crystals [#/area] in Urine sediment by Microscopy high power field','Urate Cry #/area UrnS HPF','UA',NULL),
('wb589669969af059a01451',1461313316948,'0','6020-2','Alternaria alternata IgE Ab [Units/volume] in Serum','A alternata IgE Qn','ALLERGY',NULL),
('wb65113a5fff6959c03701',1461313666441,'0','4477-6','Complement C1 esterase inhibitor [Mass/volume] in Serum or Plasma','C1INH SerPl-mCnc','HEM/BC',NULL),
('Wb8d38c11bb0dd2a501879',1461313382583,'0','27948-9','Herpes simplex virus 1+2 IgG Ab [Units/volume] in Serum by Immunoassay','HSV1+2 IgG Ser EIA-aCnc','MICRO',NULL),
('wb92397ed8287476f03751',1461313674005,'0','70211-8','Mycophenolate [Moles/volume] in Serum or Plasma','Mycophenolate SerPl-sCnc','DRUG/TOX',NULL),
('Wba6cd582eb79ff3604179',1461313741086,'0','5777-8','Cholesterol crystals [Presence] in Urine sediment by Light microscopy','Cholest Cry UrnS Ql Micro','UA',NULL),
('Wba93d48e6cf86b5601429',1461313313731,'0','26454-9','Erythrocytes [#/volume] in Cerebral spinal fluid','RBC # CSF','HEM/BC',NULL),
('Wbb45ad8dbc5670fa01079',1461313258271,'0','12232-5','Measles virus Ag [Presence] in Unspecified specimen by Immunofluorescence','MeV Ag XXX Ql IF','MICRO',NULL),
('wbb45e18ed5b7ae6b03401',1461313619722,'0','32786-6','Thyroperoxidase Ab [Titer] in Serum or Plasma','Thyroperoxidase Ab Titr SerPl','SERO',NULL),
('wbb9f633061f019c201801',1461313370439,'0','6565-6','Trichomonas vaginalis [Identifier] in Genital specimen by Wet preparation','T vaginalis Genital Wet Prep','MICRO',NULL),
('Wbc8941f813203b2801379',1461313306133,'0','18974-6','Rifampin [Susceptibility]','Rifampin Susc Islt','ABXBACT',NULL),
('Wbde461f9956e921803079',1461313569267,'0','6242-2','Sesame Seed IgE Ab [Units/volume] in Serum','Sesame Seed IgE Qn','ALLERGY',NULL),
('wbe7a1d561434fe2b02951',1461313549729,'0','12187-1','Creatine kinase.MB/Creatine kinase.total in Serum or Plasma by Electrophoresis','CK MB CFr SerPl Elph','CHEM',NULL),
('Wc01be689a5844f1a0229',1461313125911,'0','26478-8','Lymphocytes/100 leukocytes in Blood','Lymphocytes NFr Bld','HEM/BC',NULL),
('wc16afb199d95a76601401',1461313309201,'0','5244-9','Measles virus IgG Ab [Units/volume] in Serum by Immunoassay','MeV IgG Ser EIA-aCnc','MICRO',NULL),
('wc1ae5ca300d467070301',1461313137195,'0','4548-4','Hemoglobin A1c/Hemoglobin.total in Blood','Hgb A1c MFr Bld','HEM/BC',NULL),
('wc20cf2434d4313400701',1461313200001,'0','51656-7','Hepatitis C virus Ab Signal/Cutoff in Body fluid','HCV Ab s/co Fld','MICRO',NULL),
('wc25f94ff807f319802251',1461313440583,'0','12180-6','Calcium.ionized [Moles/volume] in Serum or Plasma by Ion-selective membrane electrode (ISE)','Ca-I SerPl ISE-sCnc','CHEM',NULL),
('Wc71b64436ee8508402929',1461313545910,'0','12856-1','HIV 1 p65 Ab [Presence] in Serum by Immunoblot (IB)','HIV1 p65 Ab Ser Ql IB','MICRO',NULL),
('Wcb795348cd0549e804129',1461313733197,'0','5784-4','Cystine crystals [Presence] in Urine sediment by Light microscopy','Cystine Cry UrnS Ql Micro','UA',NULL),
('Wcbd40bfcf234993402979',1461313554009,'0','14934-4','Urate [Moles/volume] in Urine','Urate Ur-sCnc','CHEM',NULL),
('wcc17ecedf37f9b1e04201',1461313744238,'0','31012-8','Vancomycin [Moles/volume] in Serum or Plasma','Vancomycin SerPl-sCnc','DRUG/TOX',NULL),
('wccbb7ff4c0e2ec1602601',1461313494556,'0','28648-4','Oxygen [Partial pressure] in Arterial cord blood','pO2 BldCoA','CHEM',NULL),
('wce13c5148805aa600351',1461313145535,'0','34927-4','Urobilinogen [Moles/volume] in Urine','Urobilinogen Ur-sCnc','CHEM',NULL),
('Wd1aa0ed0ee9a427701479',1461313320820,'0','43994-3','Trisomy 18 risk in Fetus','Ts 18 risk Fetus','CHEM',NULL),
('wd27c76a06c40b54203301',1461313604526,'0','13947-7','Coccidioides immitis IgG Ab [Presence] in Serum by Immunoassay','C immitis IgG Ser Ql EIA','MICRO',NULL),
('Wd4146ea902d7464403779',1461313678500,'0','20469-3','Acetone [Presence] in Serum or Plasma by Screen method','Acetone SerPl Ql Scn','DRUG/TOX',NULL),
('Wd4690896764f5c4203729',1461313670786,'0','21821-4','\"t(9;22)(q34.1;q11)(ABL1','BCR) fusion transcript [Presence] in Blood or Tissue by Molecular genetics method\"','\"t(9;22)(ABL1',NULL),
('Wd77e77abed4fe8ee02329',1461313453102,'0','6718-1','Cashew Nut IgE Ab [Units/volume] in Serum','Cashew Nut IgE Qn','ALLERGY',NULL),
('wd8345eb05229319502551',1461313486984,'0','5301-7','Ribonucleoprotein extractable nuclear Ab [Presence] in Serum by Immunoassay','ENA RNP Ab Ser Ql EIA','SERO',NULL),
('wdb75cd9fc728b0bf03351',1461313611933,'0','20425-5','Cardiolipin IgM Ab [interpretation] in Serum','Cardiolipin IgM Ser-Imp','COAG',NULL),
('Wdf3b32140a51042001829',1461313375051,'0','15061-5','Erythropoietin (EPO) [Units/volume] in Serum or Plasma','EPO SerPl-aCnc','CHEM',NULL),
('We35a7aa3e9c7117301779',1461313367370,'0','20404-0','Fibronectin.fetal [Presence] in Vaginal fluid','Fibronectin Fetal Vag Ql','CHEM',NULL),
('We3cd1621b76612f203029',1461313561830,'0','6009-5','Protein C Ag [Units/volume] in Platelet poor plasma by Immunologic method','Prot C Ag PPP Imm-aCnc','COAG',NULL),
('x6fdee3603ce78fb501720',1461313358636,'0','24012-7','HIV 1 Ag [Presence] in Serum','HIV1 Ag Ser Ql','MICRO',NULL),
('x7167e80199c4a1ac02820',1461313529246,'0','27231-0','Streptococcus pneumoniae 23 IgG Ab [Mass/volume] in Serum by Immunoassay','S pneum23 IgG Ser EIA-mCnc','MICRO',NULL),
('x71b0d1e76cfa998c04070',1461313724088,'0','6287-7','Baker\'s yeast IgE Ab [Units/volume] in Serum','Baker\'s yeast IgE Qn','ALLERGY',NULL),
('x7b25555b50b3e6d403170',1461313583640,'0','11884-4','Gestational age Estimated','GA Clin est','OB.US',NULL),
('x7d953137f71b21f302020',1461313404555,'0','19141-1','Propoxyphene [Presence] in Urine','Propoxyph Ur Ql','DRUG/TOX',NULL),
('x7db0d9129d5ba20503920',1461313700412,'0','533-0','Mycobacterium sp identified in Blood by Organism specific culture','Mycobacterium Bld Cult','MICRO',NULL),
('x829eb052d93c2b6b0920',1461313233909,'0','18895-3','Ceftriaxone [Susceptibility]','Ceftriaxone Susc Islt','ABXBACT',NULL),
('x82b0c6d93a7b342203620',1461313653320,'0','9610-7','Hepatitis C virus c33c Ab [Presence] in Serum by Immunoblot (IB)','HCV C33c Ab Ser Ql IB','MICRO',NULL),
('x86f7650e8884fe0f0470',1461313164306,'0','5787-7','Epithelial cells [#/area] in Urine sediment by Microscopy high power field','Epi Cells #/area UrnS HPF','UA',NULL),
('x8bc4844821897e4402120',1461313419908,'0','19075-1','Cells Counted Total [#] in Cerebral spinal fluid','Total Cells Counted CSF','HEM/BC',NULL),
('x8c43769f321e438d01670',1461313350397,'0','47213-4','Cholesterol in LDL real size pattern [Identifier] in Serum or Plasma','LDLc real size Pat SerPl','CHEM',NULL),
('x92a53141884a268f02370',1461313458878,'0','5218-3','Histoplasma capsulatum Ab [Presence] in Serum by Immune diffusion (ID)','H capsul Ab Ser Ql ID','MICRO',NULL),
('x9554e7b3556ed1040420',1461313156391,'0','9317-9','Platelet adequacy [Presence] in Blood by Light microscopy','Platelet Bld Ql Smear','HEM/BC',NULL),
('x9569266a1af1606d01970',1461313396557,'0','41016-7','Bilirubin.total [Moles/volume] in Urine by Test strip','Bilirub Ur Strip-sCnc','UA',NULL),
('x95bfd0e9e3697a850970',1461313241488,'0','10381-2','Target cells [Presence] in Blood by Light microscopy','Targets Bld Ql Smear','HEM/BC',NULL),
('x991b7f469037da680870',1461313226029,'0','21198-7','Choriogonadotropin.beta subunit [Units/volume] in Serum or Plasma','B-HCG SerPl-aCnc','CHEM',NULL),
('x9b2efc08ac34306503570',1461313646031,'0','2597-3','Magnesium [Moles/volume] in Red Blood Cells','Magnesium RBC-sCnc','CHEM',NULL),
('xa2913120db9f6b2102070',1461313412277,'0','11276-3','Tubular cells [Presence] in Urine sediment by Light microscopy','Tubular Cells UrnS Ql Micro','UA',NULL),
('xa38951207734a92203220',1461313591551,'0','48053-3','Turbidity of Synovial fluid Qualitative','Turbidity Snv Ql','SPEC',NULL),
('xa72ecd6eee95492501220',1461313281129,'0','5206-8','Herpes simplex virus 1 IgG Ab [Units/volume] in Serum by Immunoassay','HSV1 IgG Ser EIA-aCnc','MICRO',NULL),
('xac31527ff8b91c9003670',1461313661393,'0','40658-7','Parvovirus B19 IgM Ab [Presence] in Serum by Immunoassay','B19V IgM Ser Ql EIA','MICRO',NULL),
('xad95c3d6d42e17e003970',1461313707943,'0','14246-3','Phosphatidylserine IgM Ab [Units/volume] in Serum','PS IgM Ser-aCnc','COAG',NULL),
('xb3bf223c6768a3c801570',1461313335035,'0','10835-7','Lipoprotein a [Mass/volume] in Serum or Plasma','LPa SerPl-mCnc','CHEM',NULL),
('xb9a64b874120a44c0170',1461313116258,'0','1742-6','Alanine aminotransferase [Enzymatic activity/volume] in Serum or Plasma','ALT SerPl-cCnc','CHEM',NULL),
('xbcf6ec85878c76430570',1461313179643,'0','11253-2','Tacrolimus [Mass/volume] in Blood','Tacrolimus Bld-mCnc','DRUG/TOX',NULL),
('xbdea7ca86e016fb502870',1461313536834,'0','14835-3','Methanol [Moles/volume] in Serum or Plasma','Methanol SerPl-sCnc','DRUG/TOX',NULL),
('xbf08194d5d7bb78902770',1461313521489,'0','16264-4','Calcium oxalate monohydrate crystals [Presence] in Stone by Infrared spectroscopy','COM Cry Stone Ql IR','CHEM',NULL),
('xc287aad5292f2bf803270',1461313599713,'0','9804-6','Weight of Stone','Wt Stone Qn','PATH',NULL),
('xc69e18d3400d24110520',1461313171903,'0','25162-9','Hyaline casts [Presence] in Urine sediment by Light microscopy','Hyaline Casts UrnS Ql Micro','UA',NULL),
('xd0b760e90f514c7d02420',1461313466675,'0','7798-2','Smudge cells [Presence] in Blood by Light microscopy','Smudge Cells Bld Ql Smear','HEM/BC',NULL),
('xd1316e369c90a2a101620',1461313342457,'0','6741-3','Erythrocytes [#/volume] in Body fluid by Manual count','RBC # Fld Manual','HEM/BC',NULL),
('xd2538d9dc5ec7bbb02520',1461313482287,'0','20465-1','Choriogonadotropin [Multiple of the median] in Serum or Plasma','HCG MoM SerPl','CHEM',NULL),
('xdc3397ec6fa0a85603120',1461313575967,'0','9704-8','Spermatozoa [Morphology] in Semen','Sperm Smn','FERT',NULL),
('xdc7708e9b415f94102470',1461313474598,'0','6076-4','Clam IgE Ab [Units/volume] in Serum','Clam IgE Qn','ALLERGY',NULL),
('xdcc613e9b32b485004020',1461313716074,'0','2334-1','Hemoglobin.gastrointestinal [Presence] in Gastric fluid','Gastrocult Gast Ql','CHEM',NULL),
('xde9efaf8e94fc59301270',1461313289058,'0','6561-5','Treponema pallidum IgG Ab [Presence] in Serum','T pallidum IgG Ser Ql','MICRO',NULL),
('xdf67b83ab1e1a2de01320',1461313297039,'0','43371-4','Salmonella sp/Shigella sp identified in Stool by Organism specific culture','Salm/Shig Stl Cult','MICRO',NULL),
('xe1b0858ef59f52e603520',1461313638108,'0','44533-8','HIV 1+2 Ab [Presence] in Serum from donor','HIV1+2 Ab Ser Donr Ql','MICRO',NULL),
('xe302a40ef7bb870f0820',1461313218558,'0','12235-8','Microscopic observation [Identifier] in Urine sediment by Light microscopy','Micro UrnS','UA',NULL),
('Y6a16483d2564438d02778',1461313522585,'0','32554-8','Thiamine [Moles/volume] in Blood','Vit B1 Bld-sCnc','CHEM',NULL),
('y6bc0f978f98854330369',1461313148160,'0','2349-9','Glucose [Presence] in Urine','Glucose Ur Ql','CHEM',NULL),
('y6dcfec84182cb16f01519',1461313327313,'0','46640-9','Secondary diagnosis RFC','','SURVEY.RFC',NULL),
('y6debfacba70fe31102919',1461313544348,'0','34519-9','HFE gene mutation analysis in Blood or Tissue by Molecular genetics method Narrative','HFE gene Mut Anal Bld/T','MOLPATH.MUT',NULL),
('Y6e59e0abb3911bdd02828',1461313530607,'0','30153-1','Streptococcus pneumoniae 68 IgG Ab [Mass/volume] in Serum','S pneum68 IgG Ser-mCnc','MICRO',NULL),
('y728ee5009f2c702a0219',1461313124548,'0','26485-3','Monocytes/100 leukocytes in Blood','Monocytes NFr Bld','HEM/BC',NULL),
('Y72c193e5565c05190478',1461313165577,'0','19161-9','Urobilinogen [Units/volume] in Urine by Test strip','Urobilinogen Ur Strip-aCnc','UA',NULL),
('y782fb8e7604ee39704119',1461313731651,'0','5786-9','Epithelial casts [#/area] in Urine sediment by Microscopy low power field','Epith Casts #/area UrnS LPF','UA',NULL),
('Y7a37b2a70763025c02378',1461313459890,'0','51916-5','Herpes simplex virus 1 IgG Ab [Presence] in Serum by Immunoassay','HSV1 IgG Ser Ql EIA','MICRO',NULL),
('Y7e28584962ae8e6503528',1461313639270,'0','9632-1','Aspergillus fumigatus Ab [Presence] in Serum','A fumigatus Ab Ser Ql','MICRO',NULL),
('y7ee7e21521b72c4502169',1461313427496,'0','20475-0','Cytomegalovirus IgG Ab [interpretation] in Serum','CMV IgG Ser-Imp','MICRO',NULL),
('y7f88c378fb83879602969',1461313552454,'0','12859-5','HIV 1 p18 Ab [Presence] in Serum by Immunoblot (IB)','HIV1 p18 Ab Ser Ql IB','MICRO',NULL),
('Y7fcc89674a6f3bff03578',1461313647259,'0','13327-2','Parainfluenza virus Ag [Presence] in Unspecified specimen by Immunofluorescence','HPIV Ag XXX Ql IF','MICRO',NULL),
('y81532f14d6d9a3e703769',1461313677021,'0','14853-6','Norepinephrine [Moles/volume] in Urine','Norepineph Ur-sCnc','CHEM',NULL),
('Y8242e5fcf771306901978',1461313397677,'0','13508-7','Hematocrit [Volume Fraction] of Cerebral spinal fluid by Centrifugation','Hct VFr CSF Spun','HEM/BC',NULL),
('y8253a983863a0b8f01069',1461313256675,'0','38479-2','Branched chain keto-acid dehydrogenase complex [Presence] in Dried blood spot','BCKAD DBS Ql','CHEM',NULL),
('y82a89246a59034e301419',1461313311850,'0','20506-2','Specimen drawn from','Specimen drawn from Patient','SPEC',NULL),
('y831da2f2f1cffc0501869',1461313381262,'0','18929-0','Gentamicin.high potency [Susceptibility]','Gentamicin Synergy Susc Islt','ABXBACT',NULL),
('y85988395228075dc01819',1461313373473,'0','15054-0','Dehydroepiandrosterone (DHEA) [Moles/volume] in Serum or Plasma','DHEA SerPl-sCnc','CHEM',NULL),
('Y86e8685c2141a08d02028',1461313405792,'0','6233-1','Rough Pigweed IgE Ab [Units/volume] in Serum','Rough Pigweed IgE Qn','ALLERGY',NULL),
('Y8af1d41559027d7502878',1461313538588,'0','31102-7','Protein S actual/normal in Platelet poor plasma by Chromogenic method','Prot S Act/Nor PPP Chro','COAG',NULL),
('Y8ba1cf9872354eb201328',1461313298051,'0','9335-1','Appearance of Body fluid','Appearance Fld','SPEC',NULL),
('y8e43c009bc4af64c01919',1461313389218,'0','56490-6','Hemoglobin.gastrointestinal [Presence] in Stool by Immunologic method --2nd specimen','Occult Bld sp2 Stl Ql Imm','CHEM',NULL),
('Y91533c08514512fe01578',1461313336130,'0','6833-8','Cat dander IgE Ab [Units/volume] in Serum','Cat Dander IgE Qn','ALLERGY',NULL),
('Y92b161638c6eff7a0928',1461313234987,'0','14796-7','Insulin [Moles/volume] in Serum or Plasma','Insulin SerPl-sCnc','CHEM',NULL),
('Y93421a67daf45aba01228',1461313282606,'0','49049-0','Collection time of Unspecified specimen','Collect Tme XXX','SPEC',NULL),
('Y9391ed98e35c7cfd03178',1461313585050,'0','12227-5','Leukocytes [#/volume] corrected for nucleated erythrocytes in Blood','WBC nRBC cor # Bld','HEM/BC',NULL),
('y93a235861b46b1bf03469',1461313630244,'0','70197-9','6-Monoacetylmorphine (6-MAM) [Moles/volume] in Urine by Confirmatory method','6MAM Ur Cfm-sCnc','DRUG/TOX',NULL),
('Y95f6a221615a05f603978',1461313709547,'0','20781-1','Cryptosporidium sp [Presence] in Stool by Acid fast stain','Cryptosp Stl Ql Acid fast Stn','MICRO',NULL),
('y96dcd82bab34f98902319',1461313450990,'0','20124-4','Ventilation mode [Identifier] Ventilator','Ventilation mode Vent','PULM',NULL),
('Y9a229d59627b806f0528',1461313172965,'0','3879-4','Opiates [Presence] in Urine','Opiates Ur Ql','DRUG/TOX',NULL),
('Y9ac76ad78deabbb901728',1461313359690,'0','15205-8','Rheumatoid factor [Units/volume] in Serum by Nephlometry','Rheumatoid fact Ser Neph-aCnc','SERO',NULL),
('y9c4a637c346b34700619',1461313187273,'0','14866-8','Parathyrin.intact [Moles/volume] in Serum or Plasma','PTH-Intact SerPl-sCnc','CHEM',NULL),
('Y9cf8a1b4894840620428',1461313157470,'0','14921-1','Thyroxine (T4) [Moles/volume] in Serum or Plasma','T4 SerPl-sCnc','CHEM',NULL),
('Ya1f373392be11b3c03278',1461313601000,'0','3175-7','Antithrombin Ag [Units/volume] in Platelet poor plasma by Immunologic method','AT III Ag PPP Imm-aCnc','COAG',NULL),
('ya416261b39bb5daa01369',1461313304521,'0','6206-7','Peanut IgE Ab [Units/volume] in Serum','Peanut IgE Qn','ALLERGY',NULL),
('Ya49335ebaa3c938a02428',1461313467895,'0','46266-3','Myeloperoxidase Ab [Units/volume] in Serum by Immunoassay','Myeloperoxidase Ab Ser EIA-aCnc','SERO',NULL),
('ya6021810febda68903819',1461313684585,'0','25148-8','Calcium oxalate crystals [#/area] in Urine sediment by Microscopy high power field','CaOx Cry #/area UrnS HPF','UA',NULL),
('ya6d03c9f41e6f11c02219',1461313435602,'0','16126-5','Helicobacter pylori IgG Ab [Presence] in Serum','H pylori IgG Ser Ql','MICRO',NULL),
('Ya6f552b0da0ed36502528',1461313483399,'0','26512-4','Neutrophils/100 leukocytes in Cerebral spinal fluid','Neutrophils NFr CSF','HEM/BC',NULL),
('ya7abf7fd03f9e8fc0319',1461313140228,'0','2157-6','Creatine kinase [Enzymatic activity/volume] in Serum or Plasma','CK SerPl-cCnc','CHEM',NULL),
('Ya9e56026704bec3003128',1461313576987,'0','48577-1','Deprecated HFE gene c.845G>A [Presence] in Blood or Tissue by Molecular genetics method','Deprecated HFE c.845G>A Bld/T Ql','MOLPATH.MUT',NULL),
('yaa42c22c9e09739f01469',1461313319523,'0','46269-7','25-Hydroxycalciferol [Moles/volume] in Serum or Plasma','25(OH)D2 SerPl-sCnc','CHEM',NULL),
('Yaa8f9c25a8a1d50b0578',1461313180929,'0','2458-8','IgA [Mass/volume] in Serum or Plasma','IgA SerPl-mCnc','CHEM',NULL),
('yaaeaeff6da751ec702669',1461313505203,'0','14650-6','Citrate [Moles/time] in 24 hour Urine','Citrate 24h Ur-sRate','CHEM',NULL),
('Yac168eea2683fcf90978',1461313242908,'0','3773-9','Methadone [Presence] in Urine','Methadone Ur Ql','DRUG/TOX',NULL),
('yae768d8e0489c74a02719',1461313513392,'0','2518-9','Lactate [Moles/volume] in Arterial blood','Lactate BldA-sCnc','CHEM',NULL),
('Yaf888b5816c7dc9c03678',1461313662538,'0','15093-8','Protoporphyrin Free [Moles/volume] in Blood','FEP Bld-sCnc','CHEM',NULL),
('Yb0b2adccd882964a01178',1461313274542,'0','33762-6','Natriuretic peptide.B prohormone N-Terminal [Mass/volume] in Serum or Plasma','NT-proBNP SerPl-mCnc','CHEM',NULL),
('yb1c3edaaed2eb3d402619',1461313497639,'0','2112-1','Choriogonadotropin.beta subunit (pregnancy test) [Presence] in Urine','B-HCG Preg Ur Ql','CHEM',NULL),
('Yb6be4d4e1b7114e901278',1461313290337,'0','31418-7','Heterophile Ab [Presence] in Serum','Heteroph Ab Ser Ql','MICRO',NULL),
('ybb0da8e685ce826801169',1461313273338,'0','5193-8','Hepatitis B virus surface Ab [Units/volume] in Serum by Immunoassay','HBV surface Ab Ser EIA-aCnc','MICRO',NULL),
('ybbf4745d19d40aaf04169',1461313739240,'0','5812-3','Sulfonamide crystals [Presence] in Urine sediment by Light microscopy','Sulfonamide cry UrnS Ql Micro','UA',NULL),
('Ybca055c0f43ad3cf02128',1461313421437,'0','32140-6','Hemoglobin F [Presence] in Blood by Kleihauer-Betke method','Hgb F Bld Ql Kleih Betke','HEM/BC',NULL),
('Ybda5666227b70b0202078',1461313413472,'0','773-2','Nucleated erythrocytes/100 erythrocytes in Blood by Manual count','nRBC/100 RBC NFr Bld Manual','HEM/BC',NULL),
('ybe07055321da484b03069',1461313567671,'0','70208-4','Glucose [Moles/volume] in Serum or Plasma --pre 100 g glucose PO','Glucose pre 100 g Glc PO SerPl-sCnc','CHAL',NULL),
('Yc0f7b7b5443d80d503928',1461313701524,'0','59408-5','Oxygen saturation in Arterial blood by Pulse oximetry','SaO2 % BldA PulseOx','PULM',NULL),
('yc117bcd9a9bcbf0203719',1461313669065,'0','47252-2','Hepatitis C virus RNA [Log #/volume] (viral load) in Serum or Plasma by Probe and target amplification method','HCV RNA SerPl PCR-Log#','MICRO',NULL),
('yc206a5229582d72f01119',1461313264998,'0','2889-4','Protein [Mass/time] in 24 hour Urine','Prot 24h Ur-mRate','CHEM',NULL),
('yc2c683ebeb98369f02569',1461313489783,'0','46083-2','Influenza virus B Ag [Presence] in Nasopharynx by Immunoassay','FLUBV Ag Nph Ql EIA','MICRO',NULL),
('Yc42ed8315fea3e7603628',1461313654732,'0','23860-0','Erythrocytes [#/volume] in Body fluid by Automated count','RBC # Fld Auto','HEM/BC',NULL),
('Yc534dcc9738301ca02728',1461313514804,'0','11039-5','C reactive protein [Presence] in Serum or Plasma','CRP SerPl Ql','CHEM',NULL),
('Yc63d1f68334cf8f202478',1461313475793,'0','20574-0','Histoplasma capsulatum yeast phase Ab [Titer] in Serum by Complement fixation','H capsul Yst Ab Titr Ser CF','MICRO',NULL),
('Yc662b09c72f733d80178',1461313117487,'0','1751-7','Albumin [Mass/volume] in Serum or Plasma','Albumin SerPl-mCnc','CHEM',NULL),
('Yc79dba435009b06404028',1461313717161,'0','6038-4','American Beech IgE Ab [Units/volume] in Serum','Amer Beech IgE Qn','ALLERGY',NULL),
('yc98b1ac513f0e72203419',1461313622589,'0','12308-3','Hydrocodone [Presence] in Urine','Hydrocodone Ur Ql','DRUG/TOX',NULL),
('Yca715a95f2fee6d901678',1461313351609,'0','70203-5','Cholesterol in VLDL 3 [Moles/volume] in Serum or Plasma','VLDL3c SerPl-sCnc','CHEM',NULL),
('ycccb14802fdb7ae60669',1461313195303,'0','31208-2','Specimen source [Identifier] of Unspecified specimen','Specimen source XXX','SPEC',NULL),
('ycd20e50b30456be803869',1461313692423,'0','44607-0','HIV 1 [interpretation] in Serum by Immunoassay','HIV1 Ser EIA-Imp','MICRO',NULL),
('Yd21fbd6ae9ebfd7701628',1461313343652,'0','11259-9','Hepatitis C virus RNA [Presence] in Serum or Plasma by Probe and target amplification method','HCV RNA SerPl Ql PCR','MICRO',NULL),
('yd6c43db30cb5d4f803369',1461313614925,'0','30193-7','Acylcarnitine/Carnitine.free (C0) [Molar ratio] in Serum or Plasma','Acylcarnitine/C0 SerPl-sRto','CHEM',NULL),
('ydc5630c11af9f64502269',1461313443566,'0','33719-6','Flow cytometry study','','ATTACH.CLINRPT',NULL),
('ydcc067858d85c50d03019',1461313560475,'0','19126-2','Bacteria identified in Bone marrow by Aerobe culture','Bacteria Mar Aerobe Cult','MICRO',NULL),
('ydcc4d7bc57b8df9401019',1461313249329,'0','4498-2','Complement C4 [Mass/volume] in Serum or Plasma','C4 SerPl-mCnc','HEM/BC',NULL),
('Ydcfb04c34b2832b60828',1461313219787,'0','14611-8','Nuclear Ab pattern [interpretation] in Serum','ANA Pat Ser-Imp','SERO',NULL),
('ydcfbe1c9d85c0d3701769',1461313365499,'0','3034-6','Transferrin [Mass/volume] in Serum or Plasma','Transferrin SerPl-mCnc','CHEM',NULL),
('Ydee0300a6743ecc10878',1461313227666,'0','3426-4','Tetrahydrocannabinol [Presence] in Urine','THC Ur Ql','DRUG/TOX',NULL),
('ye22dd125fe7e2c8a0719',1461313202816,'0','70204-3','Cholesterol non HDL [Moles/volume] in Serum or Plasma','NonHDLc SerPl-sCnc','CHEM',NULL),
('Ye258c339fdd7fec903228',1461313592788,'0','7816-2','Blastomyces dermatitidis Ab [Presence] in Serum','B dermat Ab Ser Ql','MICRO',NULL),
('ye4ee849960fd019a0769',1461313210971,'0','2871-2','Beta globulin [Mass/volume] in Serum or Plasma by Electrophoresis','B-Globulin SerPl Elph-mCnc','CHEM',NULL),
('ye5df00658e68c70a03319',1461313607153,'0','16118-2','Babesia microti IgM Ab [Titer] in Serum','Bab microti IgM Titr Ser','MICRO',NULL),
('ye7705e643a5fc1e40269',1461313132330,'0','5799-2','Leukocyte esterase [Presence] in Urine by Test strip','Leukocyte esterase Ur Ql Strip','UA',NULL),
('Z6971909f49e3708302639',1461313500648,'0','9490-4','Aspergillus flavus Ab [Presence] in Serum','A flavus Ab Ser Ql','MICRO',NULL),
('z6db366fef008d55202205',1461313433445,'0','30471-7','Levetiracetam [Mass/volume] in Serum or Plasma','Levetiracetam SerPl-mCnc','DRUG/TOX',NULL),
('z6dc90fe99503bcdd03855',1461313690409,'0','46268-9','ABO and Rh group [Type] in Blood from Blood product unit--after transfusion reaction','ABO+Rh Gp p transf rx Bld BPU','BLDBK',NULL),
('Z6e7a61c1c9dde3300989',1461313244337,'0','1006-6','Direct antiglobulin test.IgG specific reagent [interpretation] on Red Blood Cells','DAT IgG-Sp Reag RBC-Imp','BLDBK',NULL),
('z6ee53f133c11354c01505',1461313325274,'0','5774-5','Calcium oxalate crystals [Presence] in Urine sediment by Light microscopy','CaOx Cry UrnS Ql Micro','UA',NULL),
('z6f72aa065888f9030605',1461313185183,'0','60256-5','Neisseria gonorrhoeae rRNA [Presence] in Urine by Probe and target amplification method','N gonorrhoea rRNA Ur Ql PCR','MICRO',NULL),
('z710ccfb0c2ce614a0755',1461313208682,'0','12851-2','Protein Fractions [interpretation] in Serum or Plasma by Electrophoresis','Prot Pattern SerPl Elph-Imp','CHEM',NULL),
('Z73422cdb6a2243db01139',1461313267933,'0','5028-6','Neisseria gonorrhoeae rRNA [Presence] in Unspecified specimen by DNA probe','N gonorrhoea rRNA XXX Ql Prb','MICRO',NULL),
('Z734a8f1d8d9875340289',1461313135607,'0','11579-0','Thyrotropin [Units/volume] in Serum or Plasma by Detection limit <= 0.05 mIU/L','TSH SerPl DL<=0.05 mIU/L-aCnc','CHEM',NULL),
('z74d9e41eced1f31501055',1461313254686,'0','1863-0','Anion gap 4 in Serum or Plasma','Anion Gap4 SerPl-sCnc','CHEM',NULL),
('Z7518305ffec015180639',1461313190249,'0','69419-0','Cholesterol in LDL [Moles/volume] in Serum or Plasma by Direct assay','LDLc SerPl Direct Assay-sCnc','CHEM',NULL),
('Z7661277d8b86a95403039',1461313563350,'0','5909-7','Blood smear finding [Identifier] in Blood by Light microscopy','Bld Smear Interp','HEM/BC',NULL),
('z785796be15cac92a0705',1461313200803,'0','22635-7','Pathology report microscopic observation Narrative Other stain','Path report.microscopic Spec Other Stn','TUMRRGT',NULL),
('z7927b8f4dd73da6101005',1461313246672,'0','10334-1','Cancer Ag 125 [Units/volume] in Serum or Plasma','Cancer Ag125 SerPl-aCnc','CHEM',NULL),
('z7d276f47911935cc03755',1461313674531,'0','25418-5','Mumps virus IgG Ab [Units/volume] in Serum by Immunoassay','MuV IgG Ser EIA-aCnc','MICRO',NULL),
('Z7d3832e82a233b4302589',1461313492775,'0','20474-3','Bacteria identified in Tissue by Biopsy culture','Bacteria Tiss Bx Cult','MICRO',NULL),
('z7e7d96e3a8ac87c301905',1461313386419,'0','20563-3','Carboxyhemoglobin/Hemoglobin.total in Blood','COHgb MFr Bld','CHEM',NULL),
('z824523ab0d5108da03105',1461313573745,'0','15410-4','Varicella zoster virus IgG Ab [Presence] in Serum by Immunoassay','VZV IgG Ser Ql EIA','MICRO',NULL),
('z8256c60cb99c20b802605',1461313495533,'0','21108-6','Beta 2 glycoprotein 1 IgA Ab [Units/volume] in Serum','B2 Glycoprot1 IgA Ser-aCnc','COAG',NULL),
('z831173ccdfdd049902155',1461313425432,'0','35676-6','Chloride [Moles/volume] in unspecified time Urine','Chloride ?Tm Ur-sCnc','CHEM',NULL),
('Z8576a3dfed125dd504189',1461313742549,'0','18312-9','Platelet satellitism [Presence] in Blood by Light microscopy','Platelet Satel Bld Ql Smear','HEM/BC',NULL),
('Z893915b84f0675ed01939',1461313392060,'0','22745-4','Ethanol [Moles/volume] in Urine','Ethanol Ur-sCnc','DRUG/TOX',NULL),
('z8b80ab8acee52ec901155',1461313271240,'0','3182-3','Cardiolipin IgM Ab [Units/volume] in Serum by Immunoassay','Cardiolipin IgM Ser EIA-aCnc','COAG',NULL),
('Z8d1d007f2102a89801089',1461313260468,'0','743-5','Monocytes [#/volume] in Blood by Manual count','Monocytes # Bld Manual','HEM/BC',NULL),
('Z8f4548eb1268e41101789',1461313368817,'0','5351-2','Sjogrens syndrome-A extractable nuclear Ab [Presence] in Serum by Immunoassay','ENA SS-A Ab Ser Ql EIA','SERO',NULL),
('Z8fb1e284d18596a602289',1461313446542,'0','44525-4','Histoplasma capsulatum Ag [Presence] in Serum by Immunoassay','H capsul Ag Ser Ql EIA','MICRO',NULL),
('z9051e3827d02fb2703305',1461313605186,'0','24125-7','Androgen free Index in Serum or Plasma','Androgen FAI SerPl-sRto','CHEM',NULL),
('Z91bb2c88c9ed8cc703789',1461313680088,'0','49578-8','Aminocaproate cutoff [Mass/volume] in Serum or Plasma','Amicaproate CtO SerPl-mCnc','DRUG/TOX',NULL),
('Z9302dad6d9f869790789',1461313213921,'0','31201-7','HIV 1+2 Ab [Presence] in Serum or Plasma by Immunoassay','HIV1+2 Ab SerPl Ql EIA','MICRO',NULL),
('Z93b6ae9ece005c0f02539',1461313485279,'0','1924-0','Base deficit in Venous blood','Base deficit BldV-sCnc','CHEM',NULL),
('Z95c548a09837241801039',1461313252295,'0','12179-8','Basophils/100 leukocytes in Body fluid by Manual count','Basophils NFr Fld Manual','HEM/BC',NULL),
('z95d12efd19b9d62a04155',1461313737300,'0','27200-5','Nuclear Ab [Units/volume] in Serum','ANA Ser-aCnc','SERO',NULL),
('z9621c4ef9d55070203005',1461313557636,'0','14286-9','Carnitine free (C0) [Moles/volume] in Serum or Plasma','Carnitine Free SerPl-sCnc','CHEM',NULL),
('Z98133f7361ee671704089',1461313726696,'0','7795-8','Pappenheimer bodies [Presence] in Blood by Light microscopy','Pappenheimer Bod Bld Ql Smear','HEM/BC',NULL),
('Z9876b8853fc0595b0739',1461313205991,'0','15199-3','Microcytes [Presence] in Blood by Automated count','Microcytes Bld Ql Auto','HEM/BC',NULL),
('z98c343bf44e6562103355',1461313612927,'0','20424-8','Cardiolipin IgG Ab [interpretation] in Serum','Cardiolipin IgG Ser-Imp','COAG',NULL),
('z9b67be1b323da11503455',1461313628288,'0','12210-1','Eosinophils/100 leukocytes in Urine sediment by Manual count','Eosinophil NFr UrnS Manual','UA',NULL),
('Z9c761f46da8bb01a02189',1461313430655,'0','5273-8','Parvovirus B19 IgG Ab [Units/volume] in Serum by Immunoassay','B19V IgG Ser EIA-aCnc','MICRO',NULL),
('Z9ed8c4ce5a5e658e03389',1461313617842,'0','16263-6','Calcium oxalate dihydrate crystals [Presence] in Stone by Infrared spectroscopy','COD Cry Stone Ql IR','CHEM',NULL),
('za0210cd30f256cb10305',1461313137797,'0','2336-6','Globulin [Mass/volume] in Serum','Globulin Ser-mCnc','CHEM',NULL),
('Za03a88a78ba0a00702989',1461313555380,'0','20402-4','CD16+CD56+ cells [#/volume] in Blood','CD16+CD56+ Cells # Bld','CELLMARK',NULL),
('Za0a5b76abd1915bd02239',1461313438553,'0','2469-5','IgG subclass 4 [Mass/volume] in Serum','IgG4 Ser-mCnc','CHEM',NULL),
('Za0ea7bfee14240d601439',1461313315018,'0','6248-9','Soybean IgE Ab [Units/volume] in Serum','Soybean IgE Qn','ALLERGY',NULL),
('za2fc25bc4a5465bd0405',1461313154210,'0','5818-0','Urobilinogen [Presence] in Urine by Test strip','Urobilinogen Ur Ql Strip','CHEM',NULL),
('Za327c2b36cd6281104139',1461313734702,'0','14958-3','Microalbumin/Creatinine [Mass ratio] in 24 hour Urine','Microalbumin/Creat 24h Ur-mRto','CHEM',NULL),
('Za8b1ebb6c829326401539',1461313330163,'0','8248-7','Spermatozoa [Presence] in Urine sediment by Light microscopy','Sperm UrnS Ql Micro','UA',NULL),
('Za8d79157019f0bb901489',1461313322608,'0','14639-9','Carbamazepine [Moles/volume] in Serum or Plasma','Carbamazepine SerPl-sCnc','DRUG/TOX',NULL),
('Zaa74b66f48af7ad103739',1461313672207,'0','16074-7','Walnut IgE Ab RAST class in Serum','Walnut IgE RAST Ql','ALLERGY',NULL),
('zac3d950b4a41854101405',1461313309769,'0','19550-3','Methadone [Presence] in Urine by Screen method','Methadone Ur Ql Scn','DRUG/TOX',NULL),
('zac48432a11b09f2d01455',1461313317551,'0','29541-0','HIV 1 RNA [Log #/volume] (viral load) in Plasma by Probe and target amplification method','HIV1 RNA Plas PCR-Log#','MICRO',NULL),
('zadb6e3500c4863d101105',1461313262884,'0','5403-1','Varicella zoster virus IgG Ab [Units/volume] in Serum by Immunoassay','VZV IgG Ser EIA-aCnc','MICRO',NULL),
('zae9af45a749ab3ed0255',1461313129915,'0','5778-6','Color of Urine','Color Ur','SPEC',NULL),
('zb4467214b6de4ef00655',1461313192864,'0','10701-1','Ova and parasites identified in Stool by Concentration','O+P Stl Conc','MICRO',NULL),
('Zb46e6d2596a166d902939',1461313547431,'0','40911-0','Streptococcus pneumoniae 51 IgG Ab [Mass/volume] in Serum by Immunoassay','S pneum51 IgG Ser EIA-mCnc','MICRO',NULL),
('Zb72a1c00283d8d5802689',1461313508671,'0','33332-8','Linezolid [Susceptibility] by Gradient strip (E-test)','Linezolid Islt E-test','ABXBACT',NULL),
('Zb790f4f682b0924803439',1461313625948,'0','19074-4','Carnitine esters [Moles/volume] in Serum or Plasma','Carn esters SerPl-sCnc','CHEM',NULL),
('Zc1a8900b31a7497403489',1461313633345,'0','5381-9','Thyroglobulin Ab [Titer] in Serum by Latex agglutination','Thyroglob Ab Titr Ser LA','SERO',NULL),
('zc2030b346eab450e01555',1461313332512,'0','2881-1','Protein [Mass/volume] in Body fluid','Prot Fld-mCnc','CHEM',NULL),
('zc2a053eca585821c03805',1461313682628,'0','15192-8','Lymphocytes Variant [Presence] in Blood by Automated count','Variant Lymphs Bld Ql Auto','HEM/BC',NULL),
('zc2df0c8518b72f7002705',1461313511278,'0','15059-9','Dopamine [Moles/time] in 24 hour Urine','Dopamine 24h Ur-sRate','CHEM',NULL),
('zc55c040a218e3ec602655',1461313503139,'0','9667-7','HIV 1 p51 Ab [Presence] in Serum by Immunoblot (IB)','HIV1 p51 Ab Ser Ql IB','MICRO',NULL),
('Zc709daeceb9fb92a0239',1461313127375,'0','711-2','Eosinophils [#/volume] in Blood by Automated count','Eosinophil # Bld Auto','HEM/BC',NULL),
('Zc861c35b86c0627d01839',1461313376373,'0','17948-1','Fungus # 3 identified in Unspecified specimen by Culture','Fungus XXX Cult org #3','MICRO',NULL),
('Zcc069cdb1db4d07f0389',1461313151268,'0','20409-9','Erythrocytes [#/volume] in Urine by Test strip','RBC # Ur Strip','UA',NULL),
('zcfaf772b17486d9402305',1461313448816,'0','6263-8','American Sycamore IgE Ab [Units/volume] in Serum','Amer Sycamore IgE Qn','ALLERGY',NULL),
('zd22527b49c821ba801855',1461313379222,'0','14604-3','Blood group antibodies present [Identifier] in Serum or Plasma from Blood product unit','Bld gp Ab present SerPl BPU','BLDBK',NULL),
('zd2c386a9c2f6071d02555',1461313487652,'0','25156-1','Eosinophils [Presence] in Urine sediment by Light microscopy','Eosinophil UrnS Ql Micro','UA',NULL),
('Zd827119042b55af303089',1461313571172,'0','51892-8','ABO group [Type] in Cord blood','ABO Group BldCo','BLDBK',NULL),
('Zd83674d2bd475bdb03339',1461313610036,'0','6270-3','Tuna IgE Ab [Units/volume] in Serum','Tuna IgE Qn','ALLERGY',NULL),
('zd8947bc6af543b2c02955',1461313550515,'0','9662-8','HIV 1 gp41 Ab [Presence] in Serum by Immunoblot (IB)','HIV1 gp41 Ab Ser Ql IB','MICRO',NULL),
('Zd8f639512765bd780689',1461313198404,'0','14928-6','Triiodothyronine (T3) Free [Moles/volume] in Serum or Plasma','T3Free SerPl-sCnc','CHEM',NULL),
('zd99d0fb9f2f01a6a04105',1461313728995,'0','25154-6','Unidentified crystals [#/area] in Urine sediment by Microscopy high power field','Unident Crys #/area UrnS HPF','UA',NULL),
('zd9a04cfc8ca6b7c603055',1461313565740,'0','13047-6','Plasma cells/100 leukocytes in Blood','Plasma Cells NFr Bld','HEM/BC',NULL),
('zd9db57745c8660970355',1461313146112,'0','19767-3','Cytologist who read Cyto stain of Cervical or vaginal smear or scraping','Cytologist Cvx/Vag Cyto','CYTO',NULL),
('zd9e302cfe491e36901805',1461313371091,'0','5639-0','Ethanol [Presence] in Blood','Ethanol Bld Ql','DRUG/TOX',NULL),
('Zdd034b430dfea60e01389',1461313307562,'0','1977-8','Bilirubin.total [Presence] in Urine','Bilirub Ur Ql','CHEM',NULL),
('Zdd050dd3d7a32a7d0339',1461313143591,'0','738-5','Macrocytes [Presence] in Blood by Light microscopy','Macrocytes Bld Ql Smear','HEM/BC',NULL),
('zdec71b02b60c8ada03705',1461313667042,'0','14703-3','Dopamine [Moles/volume] in Serum or Plasma','Dopamine SerPl-sCnc','CHEM',NULL),
('zdfb5a7f20fd5d07903405',1461313620183,'0','6209-1','Pecan or Hickory Tree IgE Ab [Units/volume] in Serum','Pecan/Hick Tree IgE Qn','ALLERGY',NULL),
('Ze23e118ad728322103839',1461313687852,'0','20636-7','Alanine [Moles/volume] in Serum or Plasma','Alanine SerPl-sCnc','CHEM',NULL),
('ze244ca745f477f7302255',1461313441185,'0','28637-7','Base deficit in Venous cord blood','Base deficit BldCoV-sCnc','CHEM',NULL),
('Ze3933884c13eac8901889',1461313384220,'0','8117-4','CD19 cells/100 cells in Blood','CD19 Cells NFr Bld','CELLMARK',NULL),
('ze3fc4d281b6b247904205',1461313744890,'0','708-8','Blasts [#/volume] in Blood by Manual count','Blasts # Bld Manual','HEM/BC',NULL);
/*!40000 ALTER TABLE `at_medevit_elexis_loinc` ENABLE KEYS */;
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
  `Betreff` varchar(255) DEFAULT NULL,
  `Datum` char(24) DEFAULT NULL,
  `modifiziert` char(24) DEFAULT NULL,
  `gedruckt` char(8) DEFAULT NULL,
  `geloescht` char(2) DEFAULT NULL,
  `AbsenderID` varchar(25) DEFAULT NULL,
  `DestID` varchar(25) DEFAULT NULL,
  `BehandlungsID` varchar(25) DEFAULT NULL,
  `PatientID` varchar(25) DEFAULT NULL,
  `Typ` varchar(30) DEFAULT NULL,
  `MimeType` varchar(80) DEFAULT NULL,
  `Path` longtext,
  `note` varchar(255) DEFAULT NULL,
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
-- Table structure for table `ch_elexis_arzttarife_ch_physio`
--

DROP TABLE IF EXISTS `ch_elexis_arzttarife_ch_physio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_elexis_arzttarife_ch_physio` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `validFrom` char(8) DEFAULT NULL,
  `validUntil` char(8) DEFAULT NULL,
  `TP` char(8) DEFAULT NULL,
  `ziffer` varchar(6) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`ID`),
  KEY `cheacp` (`ziffer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_elexis_arzttarife_ch_physio`
--

LOCK TABLES `ch_elexis_arzttarife_ch_physio` WRITE;
/*!40000 ALTER TABLE `ch_elexis_arzttarife_ch_physio` DISABLE KEYS */;
INSERT INTO `ch_elexis_arzttarife_ch_physio` VALUES ('VERSION',1461313110633,'0',NULL,NULL,NULL,'0.0.1',NULL,NULL);
/*!40000 ALTER TABLE `ch_elexis_arzttarife_ch_physio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_elexis_eigendiagnosen`
--

DROP TABLE IF EXISTS `ch_elexis_eigendiagnosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_elexis_eigendiagnosen` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `parent` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `title` varchar(80) DEFAULT NULL,
  `comment` longtext,
  `ExtInfo` longblob,
  PRIMARY KEY (`ID`),
  KEY `CH_ELEXIS_EIGENDIAGNOSEN_idx1` (`parent`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_elexis_eigendiagnosen`
--

LOCK TABLES `ch_elexis_eigendiagnosen` WRITE;
/*!40000 ALTER TABLE `ch_elexis_eigendiagnosen` DISABLE KEYS */;
INSERT INTO `ch_elexis_eigendiagnosen` VALUES ('VERSION',NULL,'0',NULL,NULL,'0.1.1',NULL,NULL);
/*!40000 ALTER TABLE `ch_elexis_eigendiagnosen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_elexis_icpc`
--

DROP TABLE IF EXISTS `ch_elexis_icpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_elexis_icpc` (
  `ID` char(3) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `component` char(2) DEFAULT NULL,
  `short` varchar(80) DEFAULT NULL,
  `synonyms` varchar(250) DEFAULT NULL,
  `icd10` longtext,
  `txt` longtext,
  `criteria` longtext,
  `inclusion` longtext,
  `exclusion` longtext,
  `consider` longtext,
  `note` longtext,
  PRIMARY KEY (`ID`),
  KEY `CH_ELEXIS_ICPC_IDX1` (`component`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_elexis_icpc`
--

LOCK TABLES `ch_elexis_icpc` WRITE;
/*!40000 ALTER TABLE `ch_elexis_icpc` DISABLE KEYS */;
INSERT INTO `ch_elexis_icpc` VALUES ('ver',NULL,'0',NULL,NULL,NULL,NULL,'1.2.1',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ch_elexis_icpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_elexis_icpc_encounter`
--

DROP TABLE IF EXISTS `ch_elexis_icpc_encounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_elexis_icpc_encounter` (
  `ID` varchar(25) DEFAULT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `KONS` varchar(25) DEFAULT NULL,
  `EPISODE` varchar(25) DEFAULT NULL,
  `RFE` char(4) DEFAULT NULL,
  `DIAG` char(4) DEFAULT NULL,
  `PROC` char(4) DEFAULT NULL,
  `ExtInfo` longblob,
  KEY `CH_ELEXIS_ICPC_ENCOUNTER1` (`KONS`),
  KEY `CH_ELEXIS_ICPC_ENCOUNTER2` (`EPISODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_elexis_icpc_encounter`
--

LOCK TABLES `ch_elexis_icpc_encounter` WRITE;
/*!40000 ALTER TABLE `ch_elexis_icpc_encounter` DISABLE KEYS */;
INSERT INTO `ch_elexis_icpc_encounter` VALUES ('1',NULL,'0','0.2.1',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ch_elexis_icpc_encounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_elexis_icpc_episodes`
--

DROP TABLE IF EXISTS `ch_elexis_icpc_episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_elexis_icpc_episodes` (
  `ID` varchar(25) DEFAULT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `PatientID` varchar(25) DEFAULT NULL,
  `Title` varchar(256) DEFAULT NULL,
  `StartDate` varchar(20) DEFAULT NULL,
  `Number` varchar(10) DEFAULT NULL,
  `Status` char(1) DEFAULT '1',
  `ExtInfo` longblob,
  KEY `CH_ELEXIS_ICPC_EPISODES1` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_elexis_icpc_episodes`
--

LOCK TABLES `ch_elexis_icpc_episodes` WRITE;
/*!40000 ALTER TABLE `ch_elexis_icpc_episodes` DISABLE KEYS */;
INSERT INTO `ch_elexis_icpc_episodes` VALUES ('1',NULL,'0',NULL,'0.4.2',NULL,NULL,'1',NULL);
/*!40000 ALTER TABLE `ch_elexis_icpc_episodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_elexis_icpc_episodes_diagnoses_link`
--

DROP TABLE IF EXISTS `ch_elexis_icpc_episodes_diagnoses_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_elexis_icpc_episodes_diagnoses_link` (
  `ID` varchar(25) DEFAULT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `Episode` varchar(25) DEFAULT NULL,
  `Diagnosis` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_elexis_icpc_episodes_diagnoses_link`
--

LOCK TABLES `ch_elexis_icpc_episodes_diagnoses_link` WRITE;
/*!40000 ALTER TABLE `ch_elexis_icpc_episodes_diagnoses_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `ch_elexis_icpc_episodes_diagnoses_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_elexis_messages`
--

DROP TABLE IF EXISTS `ch_elexis_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_elexis_messages` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `origin` varchar(25) DEFAULT NULL,
  `destination` varchar(25) DEFAULT NULL,
  `dateTime` char(14) DEFAULT NULL,
  `msg` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_elexis_messages`
--

LOCK TABLES `ch_elexis_messages` WRITE;
/*!40000 ALTER TABLE `ch_elexis_messages` DISABLE KEYS */;
INSERT INTO `ch_elexis_messages` VALUES ('VERSION',NULL,'0','0.2.0',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ch_elexis_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_elexis_privatrechnung`
--

DROP TABLE IF EXISTS `ch_elexis_privatrechnung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ch_elexis_privatrechnung` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `parent` varchar(80) DEFAULT NULL,
  `name` varchar(499) DEFAULT NULL,
  `short` varchar(80) DEFAULT NULL,
  `cost` char(8) DEFAULT NULL,
  `price` char(8) DEFAULT NULL,
  `time` char(4) DEFAULT NULL,
  `subsystem` varchar(25) DEFAULT NULL,
  `valid_from` char(8) DEFAULT NULL,
  `valid_until` char(8) DEFAULT NULL,
  `ExtInfo` longblob,
  PRIMARY KEY (`ID`),
  KEY `chelpr_idx1` (`parent`,`name`),
  KEY `chelpr_idx2` (`valid_from`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_elexis_privatrechnung`
--

LOCK TABLES `ch_elexis_privatrechnung` WRITE;
/*!40000 ALTER TABLE `ch_elexis_privatrechnung` DISABLE KEYS */;
INSERT INTO `ch_elexis_privatrechnung` VALUES ('VERSION',NULL,'0',NULL,'0.3.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ch_elexis_privatrechnung` ENABLE KEYS */;
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
INSERT INTO `config` VALUES (NULL,'ablauf/Trace_default','none'),
(NULL,'created','25.02.2016, 20:56:43'),
(NULL,'dbversion','3.2.0'),
(NULL,'ElexisVersion','3.2.0.qualifier'),
(NULL,'hilotec/kgview/pluginversion','1'),
(NULL,'LocalXIDDomains','www.elexis.ch/xid/kontakt/lab/sendingfacility#2#Sendende Institution#ch.elexis.data.Labor,;www.xid.ch/id/ean#2#EAN#ch.elexis.data.Kontakt,;www.elexis.ch/xid#5#UUID#ch.elexis.data.PersistentObject,;www.xid.ch/id/oid#7#OID#ch.elexis.data.PersistentObject,;www.elexis.ch/xid/kontakt/rolle#2#Rolle#;www.ahv.ch/xid#2#AHV#ch.elexis.data.Person,;www.elexis.ch/xid/kontakt/spez#2#Spezialität#ch.elexis.data.Person,;www.elexis.ch/xid/kontakt/kanton#2#Kanton#ch.elexis.data.Person,;www.elexis.ch/xid/kontakt/anrede#2#Anrede#ch.elexis.data.Person,;'),
(NULL,'org.iatrix.messwerte/acl/initialized','1'),
(NULL,'org.iatrix/dbversion','0.3.0');
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
-- Table structure for table `iatrix_problem_behdl_joint`
--

DROP TABLE IF EXISTS `iatrix_problem_behdl_joint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iatrix_problem_behdl_joint` (
  `ID` varchar(25) NOT NULL,
  `ProblemID` varchar(25) DEFAULT NULL,
  `BehandlungsID` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `problembehdl1` (`ProblemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iatrix_problem_behdl_joint`
--

LOCK TABLES `iatrix_problem_behdl_joint` WRITE;
/*!40000 ALTER TABLE `iatrix_problem_behdl_joint` DISABLE KEYS */;
/*!40000 ALTER TABLE `iatrix_problem_behdl_joint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iatrix_problem_dauermedikation_joint`
--

DROP TABLE IF EXISTS `iatrix_problem_dauermedikation_joint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iatrix_problem_dauermedikation_joint` (
  `ID` varchar(25) NOT NULL,
  `ProblemID` varchar(25) DEFAULT NULL,
  `DauermedikationID` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `problemdauermedikation1` (`ProblemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iatrix_problem_dauermedikation_joint`
--

LOCK TABLES `iatrix_problem_dauermedikation_joint` WRITE;
/*!40000 ALTER TABLE `iatrix_problem_dauermedikation_joint` DISABLE KEYS */;
/*!40000 ALTER TABLE `iatrix_problem_dauermedikation_joint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iatrix_problem_dg_joint`
--

DROP TABLE IF EXISTS `iatrix_problem_dg_joint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iatrix_problem_dg_joint` (
  `ID` varchar(25) NOT NULL,
  `ProblemID` varchar(25) DEFAULT NULL,
  `DiagnoseID` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `problemdg1` (`ProblemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iatrix_problem_dg_joint`
--

LOCK TABLES `iatrix_problem_dg_joint` WRITE;
/*!40000 ALTER TABLE `iatrix_problem_dg_joint` DISABLE KEYS */;
/*!40000 ALTER TABLE `iatrix_problem_dg_joint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icd10`
--

DROP TABLE IF EXISTS `icd10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icd10` (
  `ID` varchar(25) NOT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `parent` varchar(25) DEFAULT NULL,
  `ICDCode` varchar(10) DEFAULT NULL,
  `encoded` longtext,
  `ICDTxt` longtext,
  `ExtInfo` longblob,
  PRIMARY KEY (`ID`),
  KEY `icd1` (`parent`),
  KEY `icd2` (`ICDCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icd10`
--

LOCK TABLES `icd10` WRITE;
/*!40000 ALTER TABLE `icd10` DISABLE KEYS */;
INSERT INTO `icd10` VALUES ('1',NULL,'0',NULL,NULL,NULL,'1.0.2',NULL);
/*!40000 ALTER TABLE `icd10` ENABLE KEYS */;
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
INSERT INTO `kontakt` VALUES ('e9622d1546689e09302',1456430203564,'0','0','0','0','1','0','0',NULL,NULL,NULL,NULL,NULL,'Administrator',NULL,'Administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
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
  `DateFrom` char(24) DEFAULT NULL,
  `DateUntil` char(24) DEFAULT NULL,
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
INSERT INTO `right_` VALUES ('103a6569184c75dc',1456430209187,'0',NULL,'Verrechnen','b373c30e3705866','verrechnen'),
('11629a6a36aa66c2',1456430209321,'0',NULL,'Anwender','1760d3cd767660','Anwender'),
('11a628ba838b32e3e',1461314094970,'0',NULL,'org.iatrix.messwerte','dc5c457d83e95ed7','Messwert'),
('11d2973c44cdd88c3',1456430209479,'0',NULL,'Mandant','1760d3cd767660','Mandant'),
('13d8771beb1b',1456430205384,'0',NULL,'Fall','root','main::Fall'),
('15101375d93a134a',1456430206830,'0',NULL,'Systemvorlagen ändern','ca488f5331595492','Systemvorlagen ändern'),
('1567e02bbaf5e8c5',1456430206144,'0',NULL,'Laborwerte','dc5c457d83e95ed7','Laborwerte'),
('1627eaa2f9d37bba',1456430208811,'0',NULL,'Anmelden','a8696d8a30864f87','Anmelden'),
('166c5fbe9a622f',1456430204131,'0',NULL,'Admin','root','Administration'),
('1760d3cd767660',1456430207231,'0',NULL,'Daten','root','Daten'),
('185e66bcd74ca01a',1456430206496,'0',NULL,'createCategory','ca488f5331595492','Kategorie erstellen'),
('199c713ed089b6a',1456430208643,'0',NULL,'Hilfe','a8696d8a30864f87','Hilfe'),
('19e98dde2b1a45f',1456430207465,'0',NULL,'Konsultation','root','main::Konsultation'),
('1a463ca163308abe',1456430205517,'0',NULL,'Define_specials','9797c8ed2540cd06','Definieren von Spezialfeldern im Abrechnungssystem'),
('1c18d2a479a16ccc',1456430207808,'0',NULL,'Laborparamter vereinen','166c5fbe9a622f','Laborparameter vereinen'),
('296862557663050',1456430204365,'0',NULL,'createBills','c19734cdf2ca2b8','Rnn_ erstellen'),
('371a57e8a0eb3',1456430208476,'0',NULL,'Über','a8696d8a30864f87','über'),
('44ef3f0a713e16',1456430203897,'0',NULL,'read','c19734cdf2ca2b8','lesen'),
('4890dc5ebc575a9',1461314094134,'0',NULL,'editIntLabState','ec75a038cc7ada3e','Internes Labor: Path. Zustand'),
('490ec6d76500289',1461314094502,'0',NULL,'editIntLabValue','ec75a038cc7ada3e','Internes Labor: Ändern'),
('4b504fdd0f26593b',1456430206997,'0',NULL,'Vorlagen ändern','ca488f5331595492','Vorlagen ändern'),
('52fa258a537e15ab',1456430209780,'0',NULL,'change_billed','7e4592d8c3c785f','Verrechnete ändern'),
('5c2f42e3bfab5a55',1456430206663,'0',NULL,'delete','ca488f5331595492','Löschen'),
('5e8504baa3ccbb00',1456430207298,'0',NULL,'Kontakt','1760d3cd767660','Kontakt'),
('5e856339cbdd1b04',1456430206370,'0',NULL,'create','ca488f5331595492','erstellen'),
('5f0b9757dcf1ee5',1456430207975,'0',NULL,'Patient','1760d3cd767660','main::Patient'),
('710051961b7bc441',1456430208309,'0',NULL,'Beenden','a8696d8a30864f87','beenden'),
('79d3a17fc74f5',1456430205701,'0',NULL,'copy','13d8771beb1b','kopieren'),
('7e4592d8c3c785f',1456430209713,'0',NULL,'Konsultation','166c5fbe9a622f','main::Konsultation'),
('86f5a227885f9b57',1461314095036,'0',NULL,'deleteIntLab','11a628ba838b32e3e','Internes Labor'),
('9591fadadaed9ac9',1461314095220,'0',NULL,'deleteExtLab','11a628ba838b32e3e','Externes Labor'),
('9797c8ed2540cd06',1456430205450,'0',NULL,'Specials','13d8771beb1b','Fall-Spezialfelder in der Fall-View'),
('99a9748ac3d87e0',1456430209061,'0',NULL,'AlleVerrechnen','b373c30e3705866','Für alle Mandanten verrechnen'),
('9d3df572d800dd93',1456430208936,'0',NULL,'LoadInfoStore','root','LoadInfoStore'),
('9e43a6d32fe6061',1456430204891,'0',NULL,'Rechnungen','root','Rechnungen'),
('a8696d8a30864f87',1456430204532,'0',NULL,'Aktionen','root','Aktionen'),
('ae192c2da6fe93db',1461314094310,'0',NULL,'editExtLabState','ec75a038cc7ada3e','Externes Labor: Path. Zustand'),
('ae67deb90f37e0bb',1461314094685,'0',NULL,'editExtLabValue','ec75a038cc7ada3e','Externes Labor: Ändern'),
('b373c30e3705866',1456430207633,'0',NULL,'Leistungen','root','Leistungen'),
('b57e2605144d75df',1456430204197,'0',NULL,'Reminders','166c5fbe9a622f','Reminders'),
('c19734cdf2ca2b8',1456430203830,'0',NULL,'AccountingGlobal','root','Globales Verrechnen'),
('c91c6da890975fa3',1456430209964,'0',NULL,'Zugriff','166c5fbe9a622f','Zugriff'),
('ca488f5331595492',1456430206320,'0',NULL,'Dokumente','root','Dokumente'),
('dc5c457d83e95ed7',1456430205944,'0',NULL,'Löschen','root','Löschen'),
('df86da724914fac',1456430205994,'0',NULL,'Dauermedikation','dc5c457d83e95ed7','Dauermedikation'),
('ec75a038cc7ada3e',1461314093901,'0',NULL,'org.iatrix.messwerte','1760d3cd767660','Messwert'),
('fd1b0cc8a25af715',1456430208142,'0',NULL,'Script','root','Script'),
('root',NULL,'0',NULL,'root','',NULL);
/*!40000 ALTER TABLE `right_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights_per_user`
--

DROP TABLE IF EXISTS `rights_per_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights_per_user` (
  `USER_ID` tinyint(4) NOT NULL,
  `RIGHT_ID` tinyint(4) NOT NULL,
  `RIGHT_NAME` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights_per_user`
--

LOCK TABLES `rights_per_user` WRITE;
/*!40000 ALTER TABLE `rights_per_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `rights_per_user` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `role` VALUES ('assistant',NULL,'0',NULL,'1'),
('doctor',NULL,'0',NULL,'1'),
('executive_doctor',NULL,'0',NULL,'1'),
('patient',NULL,'0',NULL,'1'),
('user',NULL,'0',NULL,'1'),
('user_external',NULL,'0',NULL,'1');
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
INSERT INTO `role_right_joint` VALUES ('103a6569184c75dc',NULL,'0','assistant'),
('11629a6a36aa66c2',NULL,'0','doctor'),
('11d2973c44cdd88c3',NULL,'0','doctor'),
('15101375d93a134a',NULL,'0','user'),
('1567e02bbaf5e8c5',NULL,'0','user'),
('1627eaa2f9d37bba',NULL,'0','user'),
('185e66bcd74ca01a',NULL,'0','user'),
('199c713ed089b6a',NULL,'0','user'),
('19e98dde2b1a45f',NULL,'0','user'),
('1a463ca163308abe',NULL,'0','user'),
('1c18d2a479a16ccc',NULL,'0','user'),
('296862557663050',NULL,'0','user'),
('371a57e8a0eb3',NULL,'0','user'),
('44ef3f0a713e16',NULL,'0','user'),
('4890dc5ebc575a9',NULL,'0','user'),
('490ec6d76500289',NULL,'0','user'),
('4b504fdd0f26593b',NULL,'0','user'),
('52fa258a537e15ab',NULL,'0','doctor'),
('5c2f42e3bfab5a55',NULL,'0','user'),
('5e8504baa3ccbb00',NULL,'0','user'),
('5e856339cbdd1b04',NULL,'0','user'),
('5f0b9757dcf1ee5',NULL,'0','user'),
('710051961b7bc441',NULL,'0','user'),
('79d3a17fc74f5',NULL,'0','user'),
('86f5a227885f9b57',NULL,'0','executive_doctor'),
('9591fadadaed9ac9',NULL,'0','executive_doctor'),
('99a9748ac3d87e0',NULL,'0','assistant'),
('9d3df572d800dd93',NULL,'0','user'),
('9e43a6d32fe6061',NULL,'0','user'),
('a8696d8a30864f87',NULL,'0','user'),
('ae192c2da6fe93db',NULL,'0','user'),
('ae67deb90f37e0bb',NULL,'0','executive_doctor'),
('b373c30e3705866',NULL,'0','user'),
('b57e2605144d75df',NULL,'0','user'),
('c91c6da890975fa3',NULL,'0','executive_doctor'),
('df86da724914fac',NULL,'0','user'),
('fd1b0cc8a25af715',NULL,'0','user');
/*!40000 ALTER TABLE `role_right_joint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarmed`
--

DROP TABLE IF EXISTS `tarmed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarmed` (
  `ID` varchar(25) DEFAULT NULL,
  `lastupdate` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `Parent` varchar(14) DEFAULT NULL,
  `DigniQuanti` char(5) DEFAULT NULL,
  `DigniQuali` char(4) DEFAULT NULL,
  `Sparte` char(4) DEFAULT NULL,
  `GueltigVon` char(8) DEFAULT NULL,
  `GueltigBis` char(8) DEFAULT NULL,
  `Nickname` varchar(25) DEFAULT NULL,
  `tx255` varchar(255) DEFAULT NULL,
  `code` varchar(25) DEFAULT NULL,
  KEY `tarmed_id` (`ID`),
  KEY `tarmed2` (`Parent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarmed`
--

LOCK TABLES `tarmed` WRITE;
/*!40000 ALTER TABLE `tarmed` DISABLE KEYS */;
INSERT INTO `tarmed` VALUES ('Version',1461313110252,'0',NULL,NULL,NULL,NULL,NULL,NULL,'1.2.0',NULL,NULL);
/*!40000 ALTER TABLE `tarmed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarmed_daten`
--

DROP TABLE IF EXISTS `tarmed_daten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarmed_daten` (
  `Parameter` varchar(80) DEFAULT NULL,
  `DatumVon` char(8) DEFAULT NULL,
  `DatumBis` char(8) DEFAULT NULL,
  `Wert` varchar(10) DEFAULT NULL,
  KEY `tarmed5` (`Parameter`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarmed_daten`
--

LOCK TABLES `tarmed_daten` WRITE;
/*!40000 ALTER TABLE `tarmed_daten` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarmed_daten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarmed_definitionen`
--

DROP TABLE IF EXISTS `tarmed_definitionen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarmed_definitionen` (
  `Spalte` varchar(20) DEFAULT NULL,
  `Kuerzel` varchar(5) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  KEY `tarmed3` (`Spalte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarmed_definitionen`
--

LOCK TABLES `tarmed_definitionen` WRITE;
/*!40000 ALTER TABLE `tarmed_definitionen` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarmed_definitionen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarmed_extension`
--

DROP TABLE IF EXISTS `tarmed_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarmed_extension` (
  `CODE` varchar(25) DEFAULT NULL,
  `limits` longblob,
  `med_interpret` longtext,
  `tech_interpret` longtext,
  KEY `tarmed4` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarmed_extension`
--

LOCK TABLES `tarmed_extension` WRITE;
/*!40000 ALTER TABLE `tarmed_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarmed_extension` ENABLE KEYS */;
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
INSERT INTO `user_` VALUES ('007','0','U5df0b483ff852802042',1456430405695,'bacc5c7873ebb2881a5088a8e519b79791264f9c','3ecae43d407f412f','1','0',NULL,NULL),
('Administrator','0','e9622d1546689e09302',1456430203596,'b94a0b6fc7be97e0a1585ac85e814d3852668968','1254bb9a05856b9e','1','1',NULL,NULL);
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
INSERT INTO `user_role_joint` VALUES ('executive_doctor',NULL,'0','007'),
('user',NULL,'0','007');
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-22 10:36:06
