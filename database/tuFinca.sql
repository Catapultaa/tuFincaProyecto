-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: tuFinca
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.22.04.1

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
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (2,'54321','millis@gmail.com','Millan','zzz'),(3,'9876','sancaslan@gmail.com','Santi','unGrosero');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `administradormensaje`
--

LOCK TABLES `administradormensaje` WRITE;
/*!40000 ALTER TABLE `administradormensaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `administradormensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `etiqueta`
--

LOCK TABLES `etiqueta` WRITE;
/*!40000 ALTER TABLE `etiqueta` DISABLE KEYS */;
INSERT INTO `etiqueta` VALUES (1,'Apartamento'),(4,'Arriendo'),(2,'Finca');
/*!40000 ALTER TABLE `etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (2,NULL,'https://miweb.com/imagenes/casa-campestre-video.mp4','video'),(3,NULL,'https://miweb.com/imagenes/casa-campestre.jpg','imagen'),(4,NULL,'https://miweb.com/imagenes/casa-campestre-video.mp4','video'),(5,NULL,'https://miweb.com/imagenes/casa-campestre.jpg','imagen'),(6,NULL,'https://miweb.com/imagenes/casa-campestre-video.mp4','video'),(7,NULL,'https://miweb.com/imagenes/casa-campestre.jpg','imagen'),(8,NULL,'https://miweb.com/imagenes/casa-campestre-video.mp4','video'),(9,NULL,'cataaa','video');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mensaje`
--

LOCK TABLES `mensaje` WRITE;
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
INSERT INTO `mensaje` VALUES (2,NULL,'wuu','123','m@linda','hola','cataa','porLeer',NULL),(3,NULL,'buu','123','m@xxx','hola','santii','realizado',NULL),(4,NULL,'buuuuuu','123','m@xxx','holaaaaaaaaaaaaaaaaaaaaaaaaaa','santii','realizado',NULL);
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `propiedad`
--

LOCK TABLES `propiedad` WRITE;
/*!40000 ALTER TABLE `propiedad` DISABLE KEYS */;
INSERT INTO `propiedad` VALUES (2,250,300,10,4,'Casa amplia con 5 habitaciones, sala de estar con chimenea, cocina integral, 4 baños y un hermoso jardín. Ubicada en zona tranquila con excelente vista a las montañas.','Hermosa Casa Campestre en Sopó','Sopó','disponible');
/*!40000 ALTER TABLE `propiedad` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2025-03-26 22:07:52
