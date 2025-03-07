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
-- Table structure for table `Administrador`
--

DROP TABLE IF EXISTS `Administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Administrador` (
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
-- Dumping data for table `Administrador`
--

LOCK TABLES `Administrador` WRITE;
/*!40000 ALTER TABLE `Administrador` DISABLE KEYS */;
INSERT INTO `Administrador` VALUES (1,'desarrolladores','CamSanCat','idk@example.com','clave123'),(2,'alejandra','aleja','ale@example.com','clave456');
/*!40000 ALTER TABLE `Administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdministradorMensaje`
--

DROP TABLE IF EXISTS `AdministradorMensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdministradorMensaje` (
  `administrador_id` int NOT NULL,
  `mensaje_id` int NOT NULL,
  `fecha_lectura` datetime DEFAULT NULL,
  PRIMARY KEY (`administrador_id`,`mensaje_id`),
  KEY `mensaje_id` (`mensaje_id`),
  CONSTRAINT `AdministradorMensaje_ibfk_1` FOREIGN KEY (`administrador_id`) REFERENCES `Administrador` (`id`) ON DELETE CASCADE,
  CONSTRAINT `AdministradorMensaje_ibfk_2` FOREIGN KEY (`mensaje_id`) REFERENCES `Mensaje` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdministradorMensaje`
--

LOCK TABLES `AdministradorMensaje` WRITE;
/*!40000 ALTER TABLE `AdministradorMensaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdministradorMensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Etiqueta`
--

DROP TABLE IF EXISTS `Etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Etiqueta` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Etiqueta`
--

LOCK TABLES `Etiqueta` WRITE;
/*!40000 ALTER TABLE `Etiqueta` DISABLE KEYS */;
INSERT INTO `Etiqueta` VALUES (1,'Casa','Propiedad tipo casa'),(2,'Apartamento','Tipo apto'),(3,'Finca','Tipo finca'),(4,'Lote','Tipo Lote'),(5,'Casa Lote','Propiedad tipo casa lote'),(6,'Venta','Propiedad a la venta pública'),(7,'Arriendo','Propiedad de arriendo');
/*!40000 ALTER TABLE `Etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mensaje`
--

DROP TABLE IF EXISTS `Mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mensaje` (
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
  CONSTRAINT `Mensaje_ibfk_1` FOREIGN KEY (`propiedad_id`) REFERENCES `Propiedad` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mensaje`
--

LOCK TABLES `Mensaje` WRITE;
/*!40000 ALTER TABLE `Mensaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Propiedad`
--

DROP TABLE IF EXISTS `Propiedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Propiedad` (
  `id` int NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `codigo` int NOT NULL,
  `descripción` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) NOT NULL,
  `areaTotal` int DEFAULT NULL,
  `areaConst` int DEFAULT NULL,
  `imgs` varchar(255) DEFAULT NULL,
  `videos` varchar(255) DEFAULT NULL,
  `ubicación` varchar(255) DEFAULT NULL,
  `estado` enum('vendido','disponible') NOT NULL COMMENT 'State of a property',
  `administrador_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `administrador_id` (`administrador_id`),
  CONSTRAINT `Propiedad_ibfk_1` FOREIGN KEY (`administrador_id`) REFERENCES `Administrador` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Propiedad`
--

LOCK TABLES `Propiedad` WRITE;
/*!40000 ALTER TABLE `Propiedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Propiedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PropiedadEtiqueta`
--

DROP TABLE IF EXISTS `PropiedadEtiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PropiedadEtiqueta` (
  `propiedad_id` int NOT NULL,
  `etiqueta_id` int NOT NULL,
  PRIMARY KEY (`propiedad_id`,`etiqueta_id`),
  KEY `etiqueta_id` (`etiqueta_id`),
  CONSTRAINT `PropiedadEtiqueta_ibfk_1` FOREIGN KEY (`propiedad_id`) REFERENCES `Propiedad` (`id`) ON DELETE CASCADE,
  CONSTRAINT `PropiedadEtiqueta_ibfk_2` FOREIGN KEY (`etiqueta_id`) REFERENCES `Etiqueta` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PropiedadEtiqueta`
--

LOCK TABLES `PropiedadEtiqueta` WRITE;
/*!40000 ALTER TABLE `PropiedadEtiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `PropiedadEtiqueta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-07 14:53:41
