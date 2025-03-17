-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tufinca
-- ------------------------------------------------------
-- Server version	8.0.40

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
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `contraseña` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'Millan','millz','cam.mill@email.com','1234');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administradormensaje`
--

DROP TABLE IF EXISTS `administradormensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradormensaje` (
  `administrador_id` int NOT NULL,
  `mensaje_id` int NOT NULL,
  `fecha_lectura` datetime DEFAULT NULL,
  PRIMARY KEY (`administrador_id`,`mensaje_id`),
  KEY `mensaje_id` (`mensaje_id`),
  CONSTRAINT `administradormensaje_ibfk_1` FOREIGN KEY (`administrador_id`) REFERENCES `administrador` (`id`) ON DELETE CASCADE,
  CONSTRAINT `administradormensaje_ibfk_2` FOREIGN KEY (`mensaje_id`) REFERENCES `mensaje` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradormensaje`
--

LOCK TABLES `administradormensaje` WRITE;
/*!40000 ALTER TABLE `administradormensaje` DISABLE KEYS */;
INSERT INTO `administradormensaje` VALUES (1,1,'2024-03-17 10:00:00');
/*!40000 ALTER TABLE `administradormensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiqueta`
--

DROP TABLE IF EXISTS `etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiqueta` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiqueta`
--

LOCK TABLES `etiqueta` WRITE;
/*!40000 ALTER TABLE `etiqueta` DISABLE KEYS */;
INSERT INTO `etiqueta` VALUES (1,'Económico','Propiedad a precio accesible');
/*!40000 ALTER TABLE `etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int NOT NULL,
  `propiedad_id` int DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `tipo` enum('imagen','video') NOT NULL COMMENT 'Type of media',
  PRIMARY KEY (`id`),
  KEY `propiedad_id` (`propiedad_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`propiedad_id`) REFERENCES `propiedad` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,'https://miweb.com/imagenes/casa-playa.jpg','imagen');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensaje` (
  `id` int NOT NULL,
  `nombreCliente` varchar(255) NOT NULL,
  `apellidoCliente` varchar(255) NOT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `detalle` text,
  `propiedad_id` int DEFAULT NULL,
  `gestion` enum('realizado','porLeer') NOT NULL COMMENT 'State of a email',
  PRIMARY KEY (`id`),
  KEY `propiedad_id` (`propiedad_id`),
  CONSTRAINT `mensaje_ibfk_1` FOREIGN KEY (`propiedad_id`) REFERENCES `propiedad` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje`
--

LOCK TABLES `mensaje` WRITE;
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
INSERT INTO `mensaje` VALUES (1,'Carlos','Ramírez','555123456','carlos.ramirez@email.com','Estoy interesado en la casa de guatavita',1,'porLeer');
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedad`
--

DROP TABLE IF EXISTS `propiedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedad` (
  `id` int NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `codigo` int NOT NULL,
  `descripción` text,
  `areaTotal` float DEFAULT NULL,
  `areaConst` float DEFAULT NULL,
  `ubicación` varchar(255) DEFAULT NULL,
  `estado` enum('vendido','disponible') NOT NULL COMMENT 'State of a property',
  `administrador_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `administrador_id` (`administrador_id`),
  CONSTRAINT `propiedad_ibfk_1` FOREIGN KEY (`administrador_id`) REFERENCES `administrador` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad`
--

LOCK TABLES `propiedad` WRITE;
/*!40000 ALTER TABLE `propiedad` DISABLE KEYS */;
INSERT INTO `propiedad` VALUES (1,'Oportunidad Única en el Centro de Guatavita',5,'Casa de dos niveles con 3 locales comerciales con gran potencial de renta, 4 habitaciones amplias y cómodas, 3 baños bien distribuidos, sala-comedor espaciosa, cocina funcional, patio de ropas. Vista privilegiada al parque principal de Guatavita.',238.8,NULL,'Guatavita','disponible',1);
/*!40000 ALTER TABLE `propiedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedadetiqueta`
--

DROP TABLE IF EXISTS `propiedadetiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedadetiqueta` (
  `propiedad_id` int NOT NULL,
  `etiqueta_id` int NOT NULL,
  PRIMARY KEY (`propiedad_id`,`etiqueta_id`),
  KEY `etiqueta_id` (`etiqueta_id`),
  CONSTRAINT `propiedadetiqueta_ibfk_1` FOREIGN KEY (`propiedad_id`) REFERENCES `propiedad` (`id`) ON DELETE CASCADE,
  CONSTRAINT `propiedadetiqueta_ibfk_2` FOREIGN KEY (`etiqueta_id`) REFERENCES `etiqueta` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedadetiqueta`
--

LOCK TABLES `propiedadetiqueta` WRITE;
/*!40000 ALTER TABLE `propiedadetiqueta` DISABLE KEYS */;
INSERT INTO `propiedadetiqueta` VALUES (1,1);
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

-- Dump completed on 2025-03-17 13:17:12
