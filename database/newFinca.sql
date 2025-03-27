CREATE DATABASE  IF NOT EXISTS `tuFinca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tuFinca`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: tuFinca
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contraseña` varchar(255) NOT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr0jus8ywt1dl6snd357ie37j9` (`usuario`),
  UNIQUE KEY `UK571pycikd1pkkvboiav3f69gp` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (2,'54321','millis@gmail.com','Millan','zzz'),(3,'9876','sancaslan@gmail.com','Santi','unGrosero');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiqueta`
--

DROP TABLE IF EXISTS `etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiqueta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK18uj0p0ffr26vm9hc4voiwy3j` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiqueta`
--

LOCK TABLES `etiqueta` WRITE;
/*!40000 ALTER TABLE `etiqueta` DISABLE KEYS */;
INSERT INTO `etiqueta` VALUES (1,'Apartamento'),(4,'Arriendo'),(2,'Finca');
/*!40000 ALTER TABLE `etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `propiedad_id` int DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `tipo` enum('imagen','video') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_media_propiedad` (`propiedad_id`),
  CONSTRAINT `fk_media_propiedad` FOREIGN KEY (`propiedad_id`) REFERENCES `propiedad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (2,NULL,'https://miweb.com/imagenes/casa-campestre-video.mp4','video'),(3,NULL,'https://miweb.com/imagenes/casa-campestre.jpg','imagen'),(4,NULL,'https://miweb.com/imagenes/casa-campestre-video.mp4','video'),(5,NULL,'https://miweb.com/imagenes/casa-campestre.jpg','imagen'),(6,NULL,'https://miweb.com/imagenes/casa-campestre-video.mp4','video'),(7,NULL,'https://miweb.com/imagenes/casa-campestre.jpg','imagen'),(8,NULL,'https://miweb.com/imagenes/casa-campestre-video.mp4','video'),(9,NULL,'cataaa','video');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensaje` (
  `id` int NOT NULL AUTO_INCREMENT,
  `propiedad_id` int DEFAULT NULL,
  `apellidoCliente` varchar(255) NOT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `detalle` text,
  `nombreCliente` varchar(255) NOT NULL,
  `gestion` enum('porLeer','realizado') NOT NULL,
  `administrador_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mensaje_propiedad` (`propiedad_id`),
  KEY `fk_mensaje_administrador` (`administrador_id`),
  CONSTRAINT `fk_mensaje_administrador` FOREIGN KEY (`administrador_id`) REFERENCES `administrador` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mensaje_propiedad` FOREIGN KEY (`propiedad_id`) REFERENCES `propiedad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje`
--

LOCK TABLES `mensaje` WRITE;
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
INSERT INTO `mensaje` VALUES (2,NULL,'wuu','123','m@linda','hola','cataa','porLeer',NULL),(3,NULL,'buu','123','m@xxx','hola','santii','realizado',NULL),(4,NULL,'buuuuuu','123','m@xxx','holaaaaaaaaaaaaaaaaaaaaaaaaaa','santii','realizado',NULL);
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedad`
--

DROP TABLE IF EXISTS `propiedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedad` (
  `administrador_id` int DEFAULT NULL,
  `areaConst` float DEFAULT NULL,
  `areaTotal` float DEFAULT NULL,
  `codigo` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `descripción` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) NOT NULL,
  `ubicación` varchar(255) DEFAULT NULL,
  `estado` enum('disponible','vendido') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKdo4ifshqs67ke7nksd9lhsil2` (`codigo`),
  KEY `fk_propiedad_administrador` (`administrador_id`),
  CONSTRAINT `fk_propiedad_administrador` FOREIGN KEY (`administrador_id`) REFERENCES `administrador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad`
--

LOCK TABLES `propiedad` WRITE;
/*!40000 ALTER TABLE `propiedad` DISABLE KEYS */;
INSERT INTO `propiedad` VALUES (2,250,300,10,4,'Casa amplia con 5 habitaciones, sala de estar con chimenea, cocina integral, 4 baños y un hermoso jardín. Ubicada en zona tranquila con excelente vista a las montañas.','Hermosa Casa Campestre en Sopó','Sopó','disponible');
/*!40000 ALTER TABLE `propiedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedadetiqueta`
--

DROP TABLE IF EXISTS `propiedadetiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedadetiqueta` (
  `etiqueta_id` int NOT NULL,
  `propiedad_id` int NOT NULL,
  PRIMARY KEY (`etiqueta_id`,`propiedad_id`),
  KEY `FKatyg6k2ail3fw6ua22xvx99vv` (`propiedad_id`),
  CONSTRAINT `FK5gekajb34a38xe1t9s0sa1uo9` FOREIGN KEY (`etiqueta_id`) REFERENCES `etiqueta` (`id`),
  CONSTRAINT `FKatyg6k2ail3fw6ua22xvx99vv` FOREIGN KEY (`propiedad_id`) REFERENCES `propiedad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedadetiqueta`
--

LOCK TABLES `propiedadetiqueta` WRITE;
/*!40000 ALTER TABLE `propiedadetiqueta` DISABLE KEYS */;
INSERT INTO `propiedadetiqueta` VALUES (4,4);
/*!40000 ALTER TABLE `propiedadetiqueta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-26 20:47:11
