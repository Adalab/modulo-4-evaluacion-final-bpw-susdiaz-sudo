-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: brandon-sanderson
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `id_serie` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `universe` varchar(20) NOT NULL,
  PRIMARY KEY (`id_serie`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,'Elantris','Cosmere'),(2,'Mistborn Era 1','Cosmere'),(3,'Warbreaker','Cosmere'),(4,'The Stormlight Archive','Cosmere'),(5,'Mistborn Era 2','Cosmere'),(6,'The Reckoners','No Cosmere'),(7,'Skyward','No Cosmere'),(8,'Cosmere Standalone','Cosmere');
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `publication_year` smallint NOT NULL,
  `independent` tinyint(1) NOT NULL,
  `id_serie` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `books_series_fk` (`id_serie`),
  CONSTRAINT `books_series_fk` FOREIGN KEY (`id_serie`) REFERENCES `series` (`id_serie`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Elantris',2005,1,1),(2,'Mistborn: The Final Empire',2006,0,2),(3,'The Well of Ascension',2007,0,2),(4,'The Hero of Ages',2008,0,2),(5,'Warbreaker',2009,1,3),(6,'The Way of Kings',2010,0,4),(7,'The Alloy of Law',2011,0,5),(8,'The Emperor’s Soul',2012,1,8),(9,'Steelheart',2013,0,6),(10,'Words of Radiance',2014,0,4),(11,'Shadows of Self',2015,0,5),(12,'The Bands of Mourning',2016,0,5),(13,'Oathbringer',2017,0,4),(14,'Skyward',2018,0,7),(15,'Starsight',2019,0,7),(16,'Rhythm of War',2020,0,4),(17,'Cytonic',2021,0,7),(18,'The Lost Metal',2022,0,5),(19,'Defiant',2023,0,7),(20,'Wind and Truth',2024,0,4),(21,'Isles of the Emberdark',2025,1,8);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'brandon-sanderson'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29 10:23:43
