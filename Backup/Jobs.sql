-- MySQL dump 10.13  Distrib 9.3.0, for Linux (x86_64)
--
-- Host: localhost    Database: Jobs
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Aluno`
--

DROP TABLE IF EXISTS `Aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aluno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) DEFAULT NULL,
  `curso_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `curso_id` (`curso_id`),
  CONSTRAINT `Aluno_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `Curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aluno`
--

LOCK TABLES `Aluno` WRITE;
/*!40000 ALTER TABLE `Aluno` DISABLE KEYS */;
INSERT INTO `Aluno` VALUES (1,'Mariana Da Silva',1),(2,'Joao Marcos',1),(3,'Beatriz Souza',1),(4,'Felipe Fagundes',1),(5,'Fabiana Martins',1),(6,'Maria Clara',2),(7,'Felipe Antonio',2),(8,'Amanda Medeiros',2),(9,'Pedro Manuel',2),(10,'Kauan Freitas',3),(11,'Isabella Correa',3),(12,'Thays Mariano',4);
/*!40000 ALTER TABLE `Aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Campus`
--

DROP TABLE IF EXISTS `Campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Campus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Campus`
--

LOCK TABLES `Campus` WRITE;
/*!40000 ALTER TABLE `Campus` DISABLE KEYS */;
INSERT INTO `Campus` VALUES (2,'Florianópolis'),(3,'Lages'),(1,'São José');
/*!40000 ALTER TABLE `Campus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Curso`
--

DROP TABLE IF EXISTS `Curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Curso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) DEFAULT NULL,
  `departamento_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`),
  KEY `departamento_id` (`departamento_id`),
  CONSTRAINT `Curso_ibfk_1` FOREIGN KEY (`departamento_id`) REFERENCES `Departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Curso`
--

LOCK TABLES `Curso` WRITE;
/*!40000 ALTER TABLE `Curso` DISABLE KEYS */;
INSERT INTO `Curso` VALUES (1,'Engenharia de Telecomunicações',1),(2,'Análise e Desenvolvimento de Sistemas',1),(3,'Engenharia Elétrica',3),(4,'Ciências da Computação',4);
/*!40000 ALTER TABLE `Curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Departamento`
--

DROP TABLE IF EXISTS `Departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) DEFAULT NULL,
  `campus_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`),
  KEY `campus_id` (`campus_id`),
  CONSTRAINT `Departamento_ibfk_1` FOREIGN KEY (`campus_id`) REFERENCES `Campus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departamento`
--

LOCK TABLES `Departamento` WRITE;
/*!40000 ALTER TABLE `Departamento` DISABLE KEYS */;
INSERT INTO `Departamento` VALUES (1,'Telecomunicações',1),(2,'Refrigeração',1),(3,'Engenharia',2),(4,'Computação',3);
/*!40000 ALTER TABLE `Departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dependente`
--

DROP TABLE IF EXISTS `Dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dependente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `empregado_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empregado_id` (`empregado_id`),
  CONSTRAINT `Dependente_ibfk_1` FOREIGN KEY (`empregado_id`) REFERENCES `Empregado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dependente`
--

LOCK TABLES `Dependente` WRITE;
/*!40000 ALTER TABLE `Dependente` DISABLE KEYS */;
INSERT INTO `Dependente` VALUES (1,'Dependente 1',1),(2,'Dependente 2',1),(3,'Dependente 3',1),(4,'Dependente 4',1),(5,'Dependente 5',1),(6,'Dependente 6',3),(7,'Dependente 7',3),(8,'Dependente 8',3),(9,'Dependente 9',3),(10,'Dependente 10',4),(11,'Dependente 11',4),(12,'Dependente 12',5);
/*!40000 ALTER TABLE `Dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empregado`
--

DROP TABLE IF EXISTS `Empregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empregado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `empresa_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empresa_id` (`empresa_id`),
  CONSTRAINT `Empregado_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `Empresa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empregado`
--

LOCK TABLES `Empregado` WRITE;
/*!40000 ALTER TABLE `Empregado` DISABLE KEYS */;
INSERT INTO `Empregado` VALUES (1,'Marcos Vieira',1),(2,'Jonas Ataide',1),(3,'Julia Mendes',2),(4,'Sofia Medeiros',3),(5,'Ana Clara',4);
/*!40000 ALTER TABLE `Empregado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empresa`
--

DROP TABLE IF EXISTS `Empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empresa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `grupo_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`),
  KEY `grupo_id` (`grupo_id`),
  CONSTRAINT `Empresa_ibfk_1` FOREIGN KEY (`grupo_id`) REFERENCES `Grupo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empresa`
--

LOCK TABLES `Empresa` WRITE;
/*!40000 ALTER TABLE `Empresa` DISABLE KEYS */;
INSERT INTO `Empresa` VALUES (1,'O baratao',1),(2,'A moda',1),(3,'Popular',2),(4,'Exclusiva',3);
/*!40000 ALTER TABLE `Empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grupo`
--

DROP TABLE IF EXISTS `Grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grupo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grupo`
--

LOCK TABLES `Grupo` WRITE;
/*!40000 ALTER TABLE `Grupo` DISABLE KEYS */;
INSERT INTO `Grupo` VALUES (1,'ABC'),(2,'DEF'),(3,'GHI');
/*!40000 ALTER TABLE `Grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `courseno` int NOT NULL,
  `cname` varchar(30) DEFAULT NULL,
  `cdate` date DEFAULT NULL,
  PRIMARY KEY (`courseno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Basic Accounting','1989-01-11'),(2,'Further Accounting','1989-01-25'),(3,'Issues In Administration','1988-09-27'),(4,'More Administration','1988-10-16'),(5,'Ada','1988-11-01'),(6,'Introduction To Ingres','1989-02-05'),(7,'New Topologies','1989-03-10'),(8,'LANs','1988-12-12'),(9,'Structural Stress Analysis','1989-02-20'),(10,'Taffic Flow Analysis','1988-10-24');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `depno` int NOT NULL,
  `dname` varchar(20) DEFAULT NULL,
  `location` varchar(15) DEFAULT NULL,
  `head` int DEFAULT NULL,
  PRIMARY KEY (`depno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'accounts','floor 3',1),(2,'administration','floor 2',1),(3,'software design','floor 1',2),(4,'communications','floor 4',3),(5,'engineering','floor 5',7);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eEpregado`
--

DROP TABLE IF EXISTS `eEpregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eEpregado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `empresa_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empresa_id` (`empresa_id`),
  CONSTRAINT `eEpregado_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `Empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eEpregado`
--

LOCK TABLES `eEpregado` WRITE;
/*!40000 ALTER TABLE `eEpregado` DISABLE KEYS */;
/*!40000 ALTER TABLE `eEpregado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empcourse`
--

DROP TABLE IF EXISTS `empcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empcourse` (
  `empno` int NOT NULL,
  `courseno` int NOT NULL,
  PRIMARY KEY (`empno`,`courseno`),
  KEY `courseno` (`courseno`),
  CONSTRAINT `empcourse_ibfk_1` FOREIGN KEY (`empno`) REFERENCES `employee` (`empno`),
  CONSTRAINT `empcourse_ibfk_2` FOREIGN KEY (`courseno`) REFERENCES `course` (`courseno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empcourse`
--

LOCK TABLES `empcourse` WRITE;
/*!40000 ALTER TABLE `empcourse` DISABLE KEYS */;
INSERT INTO `empcourse` VALUES (1,1),(2,1),(1,2),(2,2),(7,3),(8,3),(7,4),(8,4),(14,5),(15,5),(19,5),(14,6),(15,6),(19,6),(21,7),(22,7),(22,8);
/*!40000 ALTER TABLE `empcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `empno` int NOT NULL,
  `surname` varchar(15) DEFAULT NULL,
  `forenames` varchar(30) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `telno` varchar(20) DEFAULT NULL,
  `depno` int DEFAULT NULL,
  PRIMARY KEY (`empno`),
  KEY `depno` (`depno`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`depno`) REFERENCES `department` (`depno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Jones','Elizabeth Barbara','1944-01-05','26 Agnews Terrace, Shamrock Bay','212 337 2288',5),(2,'Smith','Robert','1947-02-07','18 Marsh Street, Tollcross, Edinburgh','031 732 8972',5),(3,'White','Allan','1961-05-05','6 Remote Place, North Berwick','121 555 6622',5),(4,'Reid','Gordon','1963-08-10','9 Noble Road, Penicuik','629 424 6713',5),(5,'MacCallan','Claire','1958-09-18','25 Crisis Avenue, Leith, Edinburgh','031 337 4166',5),(6,'Murphy','Brian Charles','1954-06-30','9 Roberts Street, Biggar','331 229 4147',5),(7,'Gibson','James','1948-03-09','11 Depressed Way, Glasgow','041 447 8001',2),(8,'Andrews','John','1958-01-02','73 Long Road, Lengthitown','70 229 7213',2),(9,'Wright','Audrey Mary','1958-01-02','10 Nile Terrace, Polwarth, Edinburgh','031 424 7092',2),(10,'Reagan','Anne','1961-08-17','82 Longstone Road, Longstone, Edinburgh','031 111 2799',2),(11,'North','Annabel','1962-09-01','35 Marchmont Terrace, Marchmont, Edinburgh','031 447 2266',2),(12,'South','Todd James','1959-02-28','10 Shandon Road, Merchiston, Edinburgh','031 333 1008',2),(13,'East','Ian','1942-05-13','47 Colinton Road, Craighlochart, Edinburgh','031 424 5665',2),(14,'West','Jack','1946-06-15','15 South West Gardens, Peebles','466 3176',3),(15,'Allen','Ester','1955-02-27','10 Troon Street, Leith, Edinburgh','031 424 2907',3),(16,'Brunell','Liza','1962-08-18','8 Commercial Street, Tollcross, Edinburgh','031 424 1656',3),(17,'Robertson','David Andrew','1960-08-07','9 North Loan,South Queensferry','031 447 8213',3),(18,'Robinson','Allan','1961-06-09','31 Newall Terrace, Hawick','229 0854',3),(19,'Roberts','Robert','1959-01-01','7 Peebles Road,Melrose','402 9213',3),(20,'Murray','James','1964-03-06','40 Blackhall Loan,Biggar','121 444 4580',3),(21,'Bryce','Anne','1965-09-13','22 Forresthill Place, Greyfriars, Edinburgh','031 402 6666',3),(22,'Cowan','Audrey','1940-04-03','12 Down Street, Brayend','228 9321',4),(23,'Stevenson','John David','1954-12-12','16 Rubber Road,Stampingham','337 6262',4),(24,'Dickson','William','1950-01-06','11 Newplace Road, Newton','041 444 6730',4),(25,'Brownlie','Matthew','1954-05-14','80 Cowan Road, Shandon, Edinburgh','031 228 4141',4),(26,'Gordon','Mark','1960-02-12','10 Whyte Place, North Berwick','424 1024',4),(27,'Kennedy','Luke','1952-07-26','14 Bucket Street, Musselburgh','031 414 7312',5),(28,'Grant','Lynn','1956-07-12','3 Dey Terrace, Selkirk','337 8911',5),(29,'MacDonald','Elizabeth','1968-09-03','23 Neidpath Road, Peebles','444 8998',5),(30,'MacDugle','Shirley','1964-10-09','8 Rosebank Terrace, Shandon, Edinburgh','031 447 1189',5),(31,'Douglas','Chris','1955-06-23','19 High Street, Livingston','031 229 6792',5),(32,'Christie','Malcolm','1959-07-25','11 Rounders Park, Polwarth, Edinburgh','031 424 8406',5);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobhistory`
--

DROP TABLE IF EXISTS `jobhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobhistory` (
  `empno` int NOT NULL,
  `position` varchar(30) NOT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`empno`,`position`),
  CONSTRAINT `jobhistory_ibfk_1` FOREIGN KEY (`empno`) REFERENCES `employee` (`empno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobhistory`
--

LOCK TABLES `jobhistory` WRITE;
/*!40000 ALTER TABLE `jobhistory` DISABLE KEYS */;
INSERT INTO `jobhistory` VALUES (1,'Accountant','1968-03-10','1972-02-11',15000.00),(1,'Accounts Manager','1976-01-12',NULL,30000.00),(1,'Assistant Accounts Manager','1972-02-11','1976-01-12',22000.00),(1,'Junior Accountant','1964-04-09','1968-03-10',6000.00),(2,'Accountant','1971-06-07','1976-05-08',16000.00),(2,'Assistant Accounts Manager','1976-05-08',NULL,25000.00),(2,'Junior Accountant','1967-07-06','1971-06-07',8000.00),(3,'Accountant','1984-08-05',NULL,16000.00),(3,'Junior Accountant','1981-09-04','1984-08-05',8000.00),(4,'Accountant','1989-10-05',NULL,16000.00),(5,'Accountant','1980-11-02',NULL,16000.00),(5,'Junior Accountant','1978-12-01','1980-11-02',8000.00),(6,'Accountant','1980-01-12',NULL,16000.00),(6,'Junior Accountant','1974-02-11','1980-01-12',8000.00),(7,'Admin Assistant','1960-05-07','1968-12-01',10000.00),(7,'Admin Manager','1980-03-10',NULL,30000.00),(7,'Assistant Admin Manager','1974-04-09','1980-03-10',22000.00),(7,'Senior Admin Assistant','1968-12-01','1974-04-09',16000.00),(8,'Admin Assistant','1976-12-01','1977-04-09',8000.00),(8,'Assistant Admin Manager','1980-03-10',NULL,20000.00),(8,'Senior Admin Assistant','1977-04-09','1980-03-10',12000.00),(9,'Admin Assistant','1982-06-08','1988-07-10',10000.00),(9,'Senior Admin Assistant','1988-07-10',NULL,14000.00),(10,'Admin Assistant','1986-09-06',NULL,12000.00),(10,'Junior Admin Assistant','1983-09-22','1986-09-06',6000.00),(11,'Admin Assistant','1982-03-13',NULL,15000.00),(11,'Junior Admin Assistant','1980-10-23','1982-03-13',8000.00),(12,'Admin Assistant','1982-02-26',NULL,15000.00),(12,'Junior Admin Assistant','1977-01-03','1982-02-26',6500.00),(13,'Admin Assistant','1988-04-17',NULL,16000.00),(14,'Admin Assistant','1985-11-14',NULL,16000.00),(15,'Analyst Programmer','1984-01-17','1986-02-09',25000.00),(15,'Programmer','1980-05-13','1984-01-17',16000.00),(15,'Senior Systems Analyst','1988-08-21',NULL,35000.00),(15,'Systems Analyst','1986-02-09','1988-08-21',31000.00),(16,'Analyst Programmer','1986-11-16','1991-04-25',21000.00),(16,'Programmer','1984-10-01','1986-11-16',16000.00),(16,'Systems Analyst','1991-04-25',NULL,30000.00),(17,'Analyst Programmer','1988-01-17',NULL,21000.00),(17,'Programmer','1984-10-01','1988-01-17',16000.00),(18,'Analyst Programmer','1988-09-23',NULL,22000.00),(18,'Programmer','1984-10-01','1988-09-23',16000.00),(19,'Analyst Programmer','1988-09-23',NULL,22000.00),(19,'Programmer','1984-10-01','1988-09-23',16000.00),(20,'Analyst Programmer','1988-09-23',NULL,22000.00),(20,'Programmer','1984-10-01','1988-09-23',16000.00),(21,'Analyst Programmer','1991-12-13',NULL,25000.00),(21,'Programmer','1989-09-11','1991-12-13',21000.00),(22,'Communications Engineer','1975-05-13','1977-06-21',12000.00),(22,'Communications Manager','1985-08-03',NULL,36000.00),(22,'Electrical Engineer','1966-02-08','1975-05-13',8000.00),(22,'Senior Communications Engineer','1977-06-21','1985-08-03',26000.00),(23,'Communications Engineer','1979-06-21','1985-08-03',9000.00),(23,'Senior Communications Engineer','1985-08-03',NULL,18000.00),(23,'Software Engineer','1977-02-14','1979-06-21',5000.00),(24,'Communications Engineer','1985-10-08',NULL,15000.00),(24,'Electrical Engineer','1980-05-06','1985-10-08',13000.00),(25,'Communications Engineer','1988-10-01',NULL,19000.00),(25,'Programmer','1980-09-14','1983-01-29',9000.00),(25,'Software Engineer','1985-08-25','1988-10-01',16000.00),(25,'Systems Programmer','1983-01-29','1985-08-25',11000.00),(26,'Communications Engineer','1988-03-13',NULL,19500.00),(26,'Electronic Engineer','1980-09-01','1982-09-13',9000.00),(26,'Software Engineer','1985-08-30','1988-03-13',17000.00),(26,'Trainee Engineer','1982-09-13','1985-08-30',11000.00),(27,'Chief Engineer','1986-06-20','1990-11-01',17000.00),(27,'Graduate Engineer','1975-09-13','1981-04-19',6000.00),(27,'Mechanical Engineer','1981-04-19','1986-06-20',11000.00),(27,'Senior Chief Engineer','1990-11-01',NULL,25000.00),(28,'Chief Engineer','1989-07-06',NULL,29000.00),(28,'Civil Engineer','1984-04-17','1989-07-06',17000.00),(28,'Graduate Engineer','1978-09-01','1978-12-10',3000.00),(28,'Trainee Engineer','1978-12-10','1984-04-17',12000.00),(29,'Electrical Engineer','1986-02-09',NULL,17000.00),(29,'Graduate Engineer','1980-10-03','1986-02-09',14000.00),(30,'Electrical Engineer','1987-03-06','1992-04-30',17000.00),(30,'Senior Electrical Engineer','1992-04-30',NULL,22000.00),(31,'Mechanical Engineer','1980-06-06','1987-05-30',17000.00),(31,'Senior Mechanical Engineer','1987-05-30',NULL,22000.00),(32,'Electronics Engineer','1989-10-31','1991-03-01',18000.00),(32,'Systems Engineer','1991-03-01',NULL,19000.00);
/*!40000 ALTER TABLE `jobhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `testee`
--

DROP TABLE IF EXISTS `testee`;
/*!50001 DROP VIEW IF EXISTS `testee`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `testee` AS SELECT 
 1 AS `depno`,
 1 AS `maxSalario`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `testee`
--

/*!50001 DROP VIEW IF EXISTS `testee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `testee` AS select `department`.`depno` AS `depno`,max(`jobhistory`.`salary`) AS `maxSalario` from ((`department` join `employee` on((`department`.`depno` = `employee`.`depno`))) join `jobhistory` on((`employee`.`empno` = `jobhistory`.`empno`))) group by `department`.`depno` */;
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

-- Dump completed on 2025-06-23 20:29:14
