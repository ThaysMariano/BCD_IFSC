-- MySQL dump 10.13  Distrib 9.3.0, for Linux (x86_64)
--
-- Host: localhost    Database: Modelagem
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
  `Nome` varchar(50) NOT NULL,
  `Email` varchar(80) DEFAULT NULL,
  `Matricula` int NOT NULL,
  PRIMARY KEY (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aluno`
--

LOCK TABLES `Aluno` WRITE;
/*!40000 ALTER TABLE `Aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `Aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disciplina`
--

DROP TABLE IF EXISTS `Disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Disciplina` (
  `Cod` int NOT NULL,
  `CargaHoraria` int NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Semestre` int NOT NULL,
  `SIAPE` int NOT NULL,
  PRIMARY KEY (`Cod`),
  KEY `SIAPE` (`SIAPE`),
  CONSTRAINT `Disciplina_ibfk_1` FOREIGN KEY (`SIAPE`) REFERENCES `Professor` (`SIAPE`),
  CONSTRAINT `Disciplina_chk_1` CHECK (((`semestre` > 0) and (`semestre` <= 5) and (`CargaHoraria` > 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disciplina`
--

LOCK TABLES `Disciplina` WRITE;
/*!40000 ALTER TABLE `Disciplina` DISABLE KEYS */;
INSERT INTO `Disciplina` VALUES (101,60,'Matematica I',1,1001),(102,80,'Introducao a Programacao',1,1002);
/*!40000 ALTER TABLE `Disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faz`
--

DROP TABLE IF EXISTS `Faz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Faz` (
  `Estado` varchar(20) NOT NULL,
  `Matricula` int NOT NULL,
  `Cod` int NOT NULL,
  PRIMARY KEY (`Matricula`,`Cod`),
  KEY `Cod` (`Cod`),
  CONSTRAINT `Faz_ibfk_1` FOREIGN KEY (`Matricula`) REFERENCES `Aluno` (`Matricula`),
  CONSTRAINT `Faz_ibfk_2` FOREIGN KEY (`Cod`) REFERENCES `Disciplina` (`Cod`),
  CONSTRAINT `Faz_chk_1` CHECK (((`estado` = _latin1'Cursando') or (`estado` = _latin1'Concluido') or (`estado` = _latin1'Trancado') or (`estado` = _latin1'Reprovado')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faz`
--

LOCK TABLES `Faz` WRITE;
/*!40000 ALTER TABLE `Faz` DISABLE KEYS */;
/*!40000 ALTER TABLE `Faz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PreRequisito`
--

DROP TABLE IF EXISTS `PreRequisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PreRequisito` (
  `Cod_1` int NOT NULL,
  `PreRequisitoCod_2` int NOT NULL,
  PRIMARY KEY (`Cod_1`,`PreRequisitoCod_2`),
  KEY `PreRequisitoCod_2` (`PreRequisitoCod_2`),
  CONSTRAINT `PreRequisito_ibfk_1` FOREIGN KEY (`Cod_1`) REFERENCES `Disciplina` (`Cod`),
  CONSTRAINT `PreRequisito_ibfk_2` FOREIGN KEY (`PreRequisitoCod_2`) REFERENCES `Disciplina` (`Cod`),
  CONSTRAINT `PreRequisito_chk_1` CHECK ((`Cod_1` <> `PreRequisitoCod_2`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PreRequisito`
--

LOCK TABLES `PreRequisito` WRITE;
/*!40000 ALTER TABLE `PreRequisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `PreRequisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Professor`
--

DROP TABLE IF EXISTS `Professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Professor` (
  `Nome` varchar(50) NOT NULL,
  `SIAPE` int NOT NULL,
  `TempoDeCasa` date NOT NULL,
  PRIMARY KEY (`SIAPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Professor`
--

LOCK TABLES `Professor` WRITE;
/*!40000 ALTER TABLE `Professor` DISABLE KEYS */;
INSERT INTO `Professor` VALUES ('Maria Luz',1001,'2015-03-10'),('Carlos Eduardo Silva',1002,'2012-07-01'),('Fernanda Costa',1003,'2018-11-23'),('Jao Pedro Almeida',1004,'2014-05-15'),('Mariana Goncalves',1005,'2016-09-30');
/*!40000 ALTER TABLE `Professor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-23  1:05:33
