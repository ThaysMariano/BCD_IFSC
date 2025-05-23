-- MySQL dump 10.13  Distrib 9.3.0, for Linux (x86_64)
--
-- Host: localhost    Database: Confeitaria
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
-- Table structure for table `Bolo`
--

DROP TABLE IF EXISTS `Bolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bolo` (
  `id` int NOT NULL,
  `nome` varchar(20) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `quantidade` int NOT NULL,
  `categoria` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `Bolo_chk_1` CHECK (((`preco` >= 0) and (`quantidade` >= 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bolo`
--

LOCK TABLES `Bolo` WRITE;
/*!40000 ALTER TABLE `Bolo` DISABLE KEYS */;
INSERT INTO `Bolo` VALUES (1,'bolo de chocolate',12.50,6,'classico'),(2,'bolo de morango',16.48,3,'fruta'),(3,'bolo de banana',15.21,4,'fruta'),(4,'bolo formigueiro',14.65,11,'classico'),(5,'bolo de pote',8.75,6,'pote');
/*!40000 ALTER TABLE `Bolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Venda`
--

DROP TABLE IF EXISTS `Venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Venda` (
  `idVenda` int NOT NULL,
  `idBOLO` int NOT NULL,
  `dataVenda` date NOT NULL,
  `quantidadeVendida` int NOT NULL,
  PRIMARY KEY (`idVenda`),
  KEY `idBOLO` (`idBOLO`),
  CONSTRAINT `Venda_ibfk_1` FOREIGN KEY (`idBOLO`) REFERENCES `Bolo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Venda`
--

LOCK TABLES `Venda` WRITE;
/*!40000 ALTER TABLE `Venda` DISABLE KEYS */;
INSERT INTO `Venda` VALUES (1,1,'2025-05-23',2);
/*!40000 ALTER TABLE `Venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-23 20:39:06
