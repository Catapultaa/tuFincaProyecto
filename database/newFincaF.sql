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
  `tipoEtiqueta` enum('propiedad','categoria') NOT NULL DEFAULT 'categoria',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK18uj0p0ffr26vm9hc4voiwy3j` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiqueta`
--

LOCK TABLES `etiqueta` WRITE;
/*!40000 ALTER TABLE `etiqueta` DISABLE KEYS */;
INSERT INTO `etiqueta` VALUES (1,'Apartamento','propiedad'),(2,'Finca','propiedad'),(3,'Casa','propiedad');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,2,'https://picsum.photos/1200/800?random=1','imagen'),(2,1,'https://picsum.photos/1200/800?random=2','imagen'),(3,14,'/uploads/ad3f1e0e-5743-4927-ba6b-d6d146c6175e_videoPrueba.mp4','video'),(4,14,'/uploads/49ac7154-eb91-4395-b74a-d58082a25899_475508924_582108171466198_5327851886345590608_n.jpg','imagen'),(5,14,'/uploads/8825ed3b-289d-4a08-8b34-3ffb05a00089_475644512_582108061466209_6067436470124258531_n.jpg','imagen'),(6,14,'/uploads/c13fe3a8-b04f-446f-b69c-a69da2be1797_475671199_582108221466193_7468574575736510358_n.jpg','imagen'),(7,14,'/uploads/bade19f2-697e-4540-af95-57d638bf693d_475814338_582108064799542_4423731959928888794_n.jpg','imagen'),(8,15,'/uploads/2bca8e5b-3105-4c55-aee0-01d922602ea8_475382288_582108021466213_8475270891535671192_n.jpg','imagen'),(9,15,'/uploads/fb42bcb1-35c7-42e5-b9ac-0d0381f41abb_475530591_582108238132858_4828623901128241897_n.jpg','imagen'),(10,15,'/uploads/9f91bf45-5702-478d-ba2f-322fc97effcc_475547778_582108028132879_8907523781240623758_n.jpg','imagen'),(11,15,'/uploads/6fa7cf7c-773a-4f80-a531-baa75eff488e_475686573_582107881466227_6766978271936131171_n.jpg','imagen'),(12,15,'/uploads/0878d3b4-4ac0-42fe-b9fa-cbe3c965aa14_475769207_582108018132880_3508143763220806909_n.jpg','imagen'),(13,15,'/uploads/323b47ea-9bab-4b3b-a9c0-f810c4adf1dd_475808713_582107998132882_1324031136612458045_n.jpg','imagen'),(14,15,'/uploads/1a640327-71fd-4279-940a-048897aa07de_475896702_582108024799546_6281198610520705642_n.jpg','imagen');
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
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
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
INSERT INTO `mensaje` VALUES (1,NULL,'wuu','123','m@linda','hola','cataa','porLeer',NULL,'2025-04-07 11:02:26'),(2,NULL,'buu','123','m@xxx','hola','santii','realizado',NULL,'2025-04-07 11:02:26'),(4,NULL,'buuuuuu','123','m@xxx','holaaaaaaaaaaaaaaaaaaaaaaaaaa','santii','realizado',NULL,'2025-04-07 11:02:26');
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
  `codigo` varchar(255) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `descripción` varchar(2000) DEFAULT NULL,
  `titulo` varchar(255) NOT NULL,
  `ubicación` varchar(255) DEFAULT NULL,
  `estado` enum('disponible','vendido') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKdo4ifshqs67ke7nksd9lhsil2` (`codigo`),
  KEY `fk_propiedad_administrador` (`administrador_id`),
  CONSTRAINT `fk_propiedad_administrador` FOREIGN KEY (`administrador_id`) REFERENCES `administrador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad`
--

LOCK TABLES `propiedad` WRITE;
/*!40000 ALTER TABLE `propiedad` DISABLE KEYS */;
INSERT INTO `propiedad` VALUES (2,250,300,'10',1,'Casa amplia con 5 habitaciones, sala de estar con chimenea, cocina integral, 4 baños y un hermoso jardín. Ubicada en zona tranquila con excelente vista a las montañas.','Hermosa Casa Campestre en Sopó','Sopó','disponible'),(2,0,51.23,'8',2,'Habitación principal con baño privado y vestier, habitación secundaria ideal para familia o estudio, sala-comedor con excelente iluminación, cocina integral con horno y barra americana, zona de ropas independiente, balcón con vista exterior, parqueadero incluido. Amenidades del conjunto: piscina, zona BBQ, salón de eventos, gimnasio, ascensor en la torre.\n','Oportunidad de Apartamento en Tocancipá ','Tocancipá ','disponible'),(NULL,0,56.1,'14',14,'? Acueducto\n⚡ Energía eléctrica\n? Alcantarillado\n✔ Aprobación para construcción:\n?️ Vivienda de hasta 4 niveles – Ideal para inversión o proyecto de vivienda familiar\n','Lote en La Vega','La Vega','disponible'),(NULL,0,300,'0037',15,'? 4 habitaciones con closets  \n? 3 baños, principal con baño privado  \n? Sala con chimenea y sala de estar  \n? Balcón con vista al jardín\n? Altillo y garaje privado\n? Cocina integral\n','Hermosa Casa en Guasca','Guasca','disponible');
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
INSERT INTO `propiedadetiqueta` VALUES (3,1),(1,2),(2,14),(3,15);
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

-- Dump completed on 2025-04-13 22:12:39
