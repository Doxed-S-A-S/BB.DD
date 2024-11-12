-- MySQL dump 10.13  Distrib 8.4.2, for Linux (x86_64)
--
-- Host: localhost    Database: LinguaLinkDB
-- ------------------------------------------------------
-- Server version	8.4.2

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
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `id_chat` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_chat`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
INSERT INTO `chats` VALUES (1,'Chat General'),(2,'Chat de Estudio'),(3,'Chat de Viajeros'),(4,'Chat de Lectura'),(5,'Chat de Tecnologa');
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id_comentario` int unsigned NOT NULL AUTO_INCREMENT,
  `id_post` int unsigned NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contenido` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `eliminado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_comentario`),
  KEY `id_post` (`id_post`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id_post`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,1,'2024-10-17 21:14:26','Excelente post!',0),(2,2,'2024-10-17 21:14:26','Muy interesante video.',0),(3,3,'2024-10-17 21:14:26','Increble foto.',0),(4,4,'2024-10-17 21:14:26','Gracias por compartir la gua.',0),(5,5,'2024-10-17 21:14:26','Qu buen viaje, me encant!',0),(6,9,'2024-11-11 02:51:57','123123123',0),(7,9,'2024-11-11 02:52:37','123123123',0),(8,9,'2024-11-11 03:24:11','asdasd',0),(9,9,'2024-11-11 03:26:22','asdasd',0),(10,9,'2024-11-11 03:26:34','asasdasdasdasdasd',0),(11,9,'2024-11-11 17:43:05','vamo a comentar algo pibe',0),(12,9,'2024-11-11 17:45:54','comentandoooooo',0),(13,9,'2024-11-11 17:48:20','anashex',0),(14,9,'2024-11-11 17:50:13','asdasdasdasdasdasdasdasdasd',0),(15,9,'2024-11-11 17:51:17','vamo a comentarrrrrrrrrrrrr',0),(16,9,'2024-11-11 17:52:17','comentacion',0);
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comparte`
--

DROP TABLE IF EXISTS `comparte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comparte` (
  `id_post` int unsigned NOT NULL,
  `id_cuenta` int unsigned NOT NULL,
  `fecha_compartido` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cuenta`,`id_post`),
  KEY `id_post` (`id_post`),
  CONSTRAINT `comparte_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id_cuenta`),
  CONSTRAINT `comparte_ibfk_2` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id_post`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comparte`
--

LOCK TABLES `comparte` WRITE;
/*!40000 ALTER TABLE `comparte` DISABLE KEYS */;
INSERT INTO `comparte` VALUES (2,1,'2024-10-17 21:14:26'),(1,2,'2024-10-17 21:14:26'),(3,3,'2024-10-17 21:14:26'),(4,4,'2024-10-17 21:14:26'),(5,5,'2024-10-17 21:14:26');
/*!40000 ALTER TABLE `comparte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conforma`
--

DROP TABLE IF EXISTS `conforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conforma` (
  `id_grupo` int unsigned NOT NULL,
  `id_cuenta` int unsigned NOT NULL,
  `rol` enum('owner','administrador','participante') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_grupo`,`id_cuenta`),
  KEY `id_cuenta` (`id_cuenta`),
  CONSTRAINT `conforma_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `grupos` (`id_grupo`),
  CONSTRAINT `conforma_ibfk_2` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conforma`
--

LOCK TABLES `conforma` WRITE;
/*!40000 ALTER TABLE `conforma` DISABLE KEYS */;
INSERT INTO `conforma` VALUES (1,1,'owner'),(1,51,'participante'),(2,2,'administrador'),(2,51,'participante'),(3,3,'participante'),(3,51,'participante'),(4,4,'participante'),(4,51,'participante'),(5,5,'participante'),(5,51,'participante'),(6,51,'participante'),(8,51,'participante'),(10,1,'owner'),(12,1,'owner'),(13,1,'owner'),(14,1,'owner'),(15,1,'owner'),(17,1,'owner'),(20,1,'owner'),(21,1,'owner'),(22,1,'owner'),(23,1,'owner'),(24,1,'owner'),(25,1,'owner');
/*!40000 ALTER TABLE `conforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contiene`
--

DROP TABLE IF EXISTS `contiene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contiene` (
  `id_mensaje` int unsigned NOT NULL,
  `id_chat` int unsigned NOT NULL,
  PRIMARY KEY (`id_mensaje`),
  KEY `id_chat` (`id_chat`),
  CONSTRAINT `contiene_ibfk_1` FOREIGN KEY (`id_mensaje`) REFERENCES `mensajes` (`id_mensaje`),
  CONSTRAINT `contiene_ibfk_2` FOREIGN KEY (`id_chat`) REFERENCES `chats` (`id_chat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contiene`
--

LOCK TABLES `contiene` WRITE;
/*!40000 ALTER TABLE `contiene` DISABLE KEYS */;
INSERT INTO `contiene` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `contiene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `id_cuenta` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date NOT NULL DEFAULT (curdate()),
  `imagen_perfil` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol_cuenta` enum('usuario','profesor','escuela') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reports` tinyint NOT NULL DEFAULT '0',
  `id_usuario` int unsigned NOT NULL,
  `id_muro` int unsigned NOT NULL,
  `id_preferencia` int unsigned NOT NULL,
  `eliminado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cuenta`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_muro` (`id_muro`),
  KEY `id_preferencia` (`id_preferencia`),
  CONSTRAINT `cuenta_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `cuenta_ibfk_2` FOREIGN KEY (`id_muro`) REFERENCES `muro` (`id_muro`),
  CONSTRAINT `cuenta_ibfk_3` FOREIGN KEY (`id_preferencia`) REFERENCES `set_preferencias` (`id_preferencia`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'juan123','2024-10-17','Uploads/fotarda.jpg','usuario',0,1,1,1,0),(2,'maria_l','2024-10-17','perfil2.jpg','profesor',0,2,2,2,0),(3,'carlos_mx','2024-10-17','perfil3.jpg','usuario',0,3,3,3,0),(4,'ana_fr','2024-10-17','perfil4.jpg','escuela',0,4,4,4,0),(5,'luis_it','2024-10-17','perfil5.jpg','usuario',0,5,5,5,0),(6,'carlos_garcia','2024-11-02','pic','usuario',0,6,6,6,0),(7,'carlitos_garcia','2024-11-02','pic','usuario',0,7,7,7,0),(8,'carlitos_garacia','2024-11-02','pic','usuario',0,11,11,11,0),(9,'carlitos_garaacia','2024-11-02','pic','usuario',0,12,12,12,0),(14,'caarlitos_garaacia','2024-11-02','pic','usuario',0,17,17,17,0),(17,'caarlitos_gaaaaraacia','2024-11-02','pic','usuario',0,20,20,20,0),(18,'caarlitosgaaaaraacia','2024-11-02','pic','usuario',0,21,21,21,0),(19,'naaa','2024-11-02','pic','usuario',0,26,26,26,0),(32,'jperez','2024-11-02','pic','usuario',0,39,39,39,0),(33,'jrodriguez','2024-11-02','pic','usuario',0,40,40,40,0),(34,'npineyro','2024-11-04','pic','usuario',0,41,41,41,0),(35,'lvazquez','2024-11-04','pic','usuario',0,42,42,42,0),(36,'aasd','2024-11-04','pic','usuario',0,43,43,43,0),(37,'pargento','2024-11-05','pic','usuario',0,44,44,44,0),(38,'aa','2024-11-05','pic','usuario',0,45,45,45,0),(39,'dd','2024-11-05','pic','usuario',0,46,46,46,0),(40,'ss','2024-11-05','pic','usuario',0,47,47,47,0),(41,'ddsa','2024-11-05','','usuario',0,48,48,48,0),(42,'eee','2024-11-05','','usuario',0,51,51,51,0),(43,'napellidito','2024-11-05','','usuario',0,52,52,52,0),(44,'nape','2024-11-05','','usuario',0,53,53,53,0),(45,'ssdasd','2024-11-05','','usuario',0,54,54,54,0),(47,'etre','2024-11-05','','usuario',0,56,56,56,0),(48,'napellidoooo','2024-11-05','','usuario',0,57,57,57,0),(49,'messsss','2024-11-05','Uploads/fotarda.jpg','usuario',0,58,58,58,0),(50,'mapelllidardo','2024-11-05','Uploads/fotarda.jpg','usuario',0,59,59,59,0),(51,'mfernandez','2024-11-05','Uploads/fotarda.jpg','usuario',0,60,60,60,0),(61,'npineyro0','2024-11-12','Uploads/images.jpg','usuario',0,70,70,70,0),(63,'npineyrito','2024-11-12','Uploads/images.jpg','usuario',0,72,72,72,0),(64,'smoreira','2024-11-12','Uploads/PXL_20241024_160842414.jpg','usuario',0,73,73,73,0),(65,'aborg','2024-11-12','Uploads/PXL_20241107_141002704.jpg','usuario',0,74,74,74,0),(67,'n123','2024-11-12','Uploads/images.jpg','usuario',0,76,76,76,0);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `da_upvote`
--

DROP TABLE IF EXISTS `da_upvote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `da_upvote` (
  `id_cuenta` int unsigned NOT NULL,
  `id_upvote` int unsigned NOT NULL,
  PRIMARY KEY (`id_upvote`),
  KEY `id_cuenta` (`id_cuenta`),
  CONSTRAINT `da_upvote_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id_cuenta`),
  CONSTRAINT `da_upvote_ibfk_2` FOREIGN KEY (`id_upvote`) REFERENCES `upvote` (`id_upvote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `da_upvote`
--

LOCK TABLES `da_upvote` WRITE;
/*!40000 ALTER TABLE `da_upvote` DISABLE KEYS */;
INSERT INTO `da_upvote` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `da_upvote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envia`
--

DROP TABLE IF EXISTS `envia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envia` (
  `id_mensaje` int unsigned NOT NULL,
  `id_cuenta` int unsigned NOT NULL,
  PRIMARY KEY (`id_mensaje`),
  KEY `id_cuenta` (`id_cuenta`),
  CONSTRAINT `envia_ibfk_1` FOREIGN KEY (`id_mensaje`) REFERENCES `mensajes` (`id_mensaje`),
  CONSTRAINT `envia_ibfk_2` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envia`
--

LOCK TABLES `envia` WRITE;
/*!40000 ALTER TABLE `envia` DISABLE KEYS */;
INSERT INTO `envia` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `envia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `id_post` int unsigned NOT NULL,
  `id_evento` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre_evento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_evento` datetime NOT NULL,
  `descripcion_evento` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `eliminado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_post`),
  UNIQUE KEY `id_evento` (`id_evento`),
  CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id_post`),
  CONSTRAINT `evento_chk_1` CHECK ((`fecha_evento` >= sysdate()))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,1,'Evento Cultural','2025-10-10 18:00:00','Un evento para conocer nuevas culturas.',0),(2,2,'Charla sobre tecnologa','2025-10-20 15:00:00','Discusin sobre IA y el futuro de la tecnologa.',0),(3,3,'Festival de Cine','2025-09-25 20:00:00','Un festival de cine independiente.',0),(4,4,'Exposicin de Arte','2025-11-05 10:00:00','Exposicin de arte contemporneo.',0),(5,5,'Torneo de Ajedrez','2025-12-01 09:00:00','Torneo de ajedrez abierto.',0);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos` (
  `id_grupo` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre_grupo` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_creacion` date NOT NULL DEFAULT (curdate()),
  `descripcion` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `privacidad` tinyint(1) NOT NULL,
  `url_imagen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen_banner` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reports` tinyint NOT NULL DEFAULT '0',
  `eliminado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_grupo`),
  UNIQUE KEY `nombre_grupo` (`nombre_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'Grupo Cultural','2024-10-17','Grupo de intercambio cultural',1,'grupo1.jpg','banner1.jpg',0,1),(2,'Aprendiendo Espaol','2024-10-17','Grupo para aprender espaol',0,'grupo2.jpg','banner2.jpg',0,1),(3,'Tecnologa Avanzada','2024-10-17','Discusin sobre nuevas tecnologas',0,'grupo3.jpg','banner3.jpg',0,1),(4,'Grupo de Viajes','2024-10-17','Compartir experiencias de viaje',1,'grupo4.jpg','banner4.jpg',0,1),(5,'Club de Lectura','2024-10-17','Grupo para compartir libros y opiniones',0,'grupo5.jpg','banner5.jpg',0,1),(6,'Nombre del Grupo','2024-10-19','Descripcin del grupo aqu.',1,'http://localhost:44331/Uploads/images.jpg','http://localhost:44331/Uploads/images.jpg',0,1),(8,'Nombre del G22rupo','2024-10-25','Descripcin del grupo',1,'ruta/a/url_imagen.jpg','ruta/a/imagen_banner.jpg',0,1),(10,'Nombre del Grupooo','2024-10-26','Descripción del grupo',1,'ruta/a/url_imagen.jpg','ruta/a/imagen_banner.jpg',0,1),(12,'Nombre del Grupoaoo','2024-10-26','Descripción del grupo',0,'ruta/a/url_imagen.jpg','ruta/a/imagen_banner.jpg',0,1),(13,'asdasd','2024-10-26','asdasd',0,'Uploads/System.Web.HttpPostedFile','Uploads/System.Web.HttpPostedFile',0,1),(14,'a','2024-10-26','a',0,'Uploads/System.Web.HttpPostedFile','Uploads/System.Web.HttpPostedFile',0,1),(15,'qaasd','2024-10-26','asdasd',1,'Uploads/Screenshot 2024-07-27 181909.png','Uploads/Screenshot 2024-07-27 181909.png',0,0),(17,'asdasdaaaaa','2024-10-26','asdasd',1,'Uploads/matting_Doxed.png','Uploads/Doxed (1).png',0,0),(20,'grupaaosidnaosid','2024-10-26','asd',1,'Uploads/images.jpg','Uploads/Doxed (1).png',0,0),(21,'asdddddddddddd','2024-10-26','ddd',0,'Uploads/images.jpg','Uploads/Screenshot 2024-09-03 151620.png',0,0),(22,'aaaaaaaaaaaaaaaaaaaaa','2024-10-26','aaa',0,'Uploads/images.jpg','Uploads/dark-star-xerath-splash-art-uhdpaper.com-hd-7.1275.jpg',0,0),(23,'que grupaso este la verdad','2024-10-26','anashe',1,'Uploads/Doxed.png','Uploads/matting_Doxed.png',0,0),(24,'grupardo','2024-11-06','esto es un grupo',0,'Uploads/Doxed.png','Uploads/images.jpg',0,0),(25,'grupete','2024-11-07','grupo de petes',1,'Uploads/images.jpg','Uploads/dark-star-xerath-splash-art-uhdpaper.com-hd-7.1275.jpg',0,0);
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hace`
--

DROP TABLE IF EXISTS `hace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hace` (
  `id_comentario` int unsigned NOT NULL,
  `id_cuenta` int unsigned NOT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `id_cuenta` (`id_cuenta`),
  CONSTRAINT `hace_ibfk_1` FOREIGN KEY (`id_comentario`) REFERENCES `comentarios` (`id_comentario`),
  CONSTRAINT `hace_ibfk_2` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hace`
--

LOCK TABLES `hace` WRITE;
/*!40000 ALTER TABLE `hace` DISABLE KEYS */;
INSERT INTO `hace` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(7,51),(8,51),(9,51),(10,51),(11,51),(12,51),(13,51),(14,51),(15,51),(16,51);
/*!40000 ALTER TABLE `hace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_coment`
--

DROP TABLE IF EXISTS `like_coment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_coment` (
  `id_upvote` int unsigned NOT NULL,
  `id_comentario` int unsigned NOT NULL,
  PRIMARY KEY (`id_upvote`),
  KEY `id_comentario` (`id_comentario`),
  CONSTRAINT `like_coment_ibfk_1` FOREIGN KEY (`id_upvote`) REFERENCES `upvote` (`id_upvote`),
  CONSTRAINT `like_coment_ibfk_2` FOREIGN KEY (`id_comentario`) REFERENCES `comentarios` (`id_comentario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_coment`
--

LOCK TABLES `like_coment` WRITE;
/*!40000 ALTER TABLE `like_coment` DISABLE KEYS */;
INSERT INTO `like_coment` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `like_coment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes` (
  `id_mensaje` int unsigned NOT NULL AUTO_INCREMENT,
  `contenido` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_envio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_mensaje`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes`
--

LOCK TABLES `mensajes` WRITE;
/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
INSERT INTO `mensajes` VALUES (1,'Hola, cmo ests?','2024-10-17 21:14:25'),(2,'Qu tal el evento?','2024-10-17 21:14:25'),(3,'Nos vemos maana!','2024-10-17 21:14:25'),(4,'Dnde est el lugar de reunin?','2024-10-17 21:14:25'),(5,'Confirmo asistencia al evento.','2024-10-17 21:14:25');
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muro`
--

DROP TABLE IF EXISTS `muro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `muro` (
  `id_muro` int unsigned NOT NULL AUTO_INCREMENT,
  `detalles` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pub_destacada` int NOT NULL,
  `biografia` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_muro`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muro`
--

LOCK TABLES `muro` WRITE;
/*!40000 ALTER TABLE `muro` DISABLE KEYS */;
INSERT INTO `muro` VALUES (1,'Detalles del muro 1',1,'Biografa del usuario 1'),(2,'Detalles del muro 2',0,'Biografa del usuario 2'),(3,'Detalles del muro 3',1,'Biografa del usuario 3'),(4,'Detalles del muro 4',0,'Biografa del usuario 4'),(5,'Detalles del muro 5',1,'Biografa del usuario 5'),(6,'',0,''),(7,'',0,''),(8,'',0,''),(9,'',0,''),(10,'',0,''),(11,'',0,''),(12,'',0,''),(13,'',0,''),(14,'',0,''),(15,'',0,''),(16,'',0,''),(17,'',0,''),(18,'',0,''),(19,'',0,''),(20,'',0,''),(21,'',0,''),(22,'',0,''),(23,'',0,''),(24,'',0,''),(25,'',0,''),(26,'',0,''),(27,'',0,''),(28,'',0,''),(29,'',0,''),(30,'',0,''),(31,'',0,''),(32,'',0,''),(33,'',0,''),(34,'',0,''),(35,'',0,''),(36,'',0,''),(37,'',0,''),(38,'',0,''),(39,'',0,''),(40,'',0,''),(41,'',0,''),(42,'',0,''),(43,'',0,''),(44,'',0,''),(45,'',0,''),(46,'',0,''),(47,'',0,''),(48,'',0,''),(49,'',0,''),(50,'',0,''),(51,'',0,''),(52,'',0,''),(53,'',0,''),(54,'',0,''),(55,'',0,''),(56,'',0,''),(57,'',0,''),(58,'',0,''),(59,'',0,''),(60,'',0,''),(61,'',0,''),(62,'',0,''),(63,'',0,''),(64,'',0,''),(65,'',0,''),(66,'',0,''),(67,'',0,''),(68,'',0,''),(69,'',0,''),(70,'',0,''),(71,'',0,''),(72,'',0,''),(73,'',0,''),(74,'',0,''),(75,'',0,''),(76,'',0,'');
/*!40000 ALTER TABLE `muro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones` (
  `id_notificacion` int unsigned NOT NULL AUTO_INCREMENT,
  `contenido` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_envio` date NOT NULL DEFAULT (curdate()),
  `leida` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_notificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
INSERT INTO `notificaciones` VALUES (1,'Tienes una nueva solicitud de amistad.','2024-10-17',0),(2,'Tu publicacin ha recibido un comentario.','2024-10-17',0),(3,'Te han mencionado en una conversacin.','2024-10-17',0),(4,'Nueva actualizacin en tu grupo favorito.','2024-10-17',0),(5,'Tu cuenta ha sido verificada.','2024-10-17',0);
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organiza`
--

DROP TABLE IF EXISTS `organiza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organiza` (
  `id_grupo` int unsigned NOT NULL,
  `id_evento` int unsigned NOT NULL,
  PRIMARY KEY (`id_grupo`,`id_evento`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `organiza_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`),
  CONSTRAINT `organiza_ibfk_2` FOREIGN KEY (`id_grupo`) REFERENCES `grupos` (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organiza`
--

LOCK TABLES `organiza` WRITE;
/*!40000 ALTER TABLE `organiza` DISABLE KEYS */;
INSERT INTO `organiza` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `organiza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participa`
--

DROP TABLE IF EXISTS `participa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participa` (
  `id_chat` int unsigned NOT NULL,
  `id_cuenta` int unsigned NOT NULL,
  PRIMARY KEY (`id_chat`,`id_cuenta`),
  KEY `id_cuenta` (`id_cuenta`),
  CONSTRAINT `participa_ibfk_1` FOREIGN KEY (`id_chat`) REFERENCES `chats` (`id_chat`),
  CONSTRAINT `participa_ibfk_2` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participa`
--

LOCK TABLES `participa` WRITE;
/*!40000 ALTER TABLE `participa` DISABLE KEYS */;
INSERT INTO `participa` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `participa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postea_grupos`
--

DROP TABLE IF EXISTS `postea_grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postea_grupos` (
  `id_grupo` int unsigned NOT NULL,
  `id_post` int unsigned NOT NULL,
  PRIMARY KEY (`id_grupo`,`id_post`),
  KEY `id_post` (`id_post`),
  CONSTRAINT `postea_grupos_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id_post`),
  CONSTRAINT `postea_grupos_ibfk_2` FOREIGN KEY (`id_grupo`) REFERENCES `grupos` (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postea_grupos`
--

LOCK TABLES `postea_grupos` WRITE;
/*!40000 ALTER TABLE `postea_grupos` DISABLE KEYS */;
INSERT INTO `postea_grupos` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(2,9),(3,9),(4,9),(5,9),(6,9),(8,9),(15,9),(3,10),(5,12),(5,13),(22,22),(23,22),(24,22);
/*!40000 ALTER TABLE `postea_grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postea_muro`
--

DROP TABLE IF EXISTS `postea_muro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postea_muro` (
  `id_muro` int unsigned NOT NULL,
  `id_post` int unsigned NOT NULL,
  PRIMARY KEY (`id_muro`,`id_post`),
  KEY `id_post` (`id_post`),
  CONSTRAINT `postea_muro_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id_post`),
  CONSTRAINT `postea_muro_ibfk_2` FOREIGN KEY (`id_muro`) REFERENCES `muro` (`id_muro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postea_muro`
--

LOCK TABLES `postea_muro` WRITE;
/*!40000 ALTER TABLE `postea_muro` DISABLE KEYS */;
INSERT INTO `postea_muro` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(60,9),(60,10),(60,11),(60,13);
/*!40000 ALTER TABLE `postea_muro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id_post` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `url_contenido` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_imagen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_contenido` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenido` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_cuenta` int unsigned NOT NULL,
  `reports` tinyint NOT NULL DEFAULT '0',
  `eliminado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_post`),
  KEY `id_cuenta` (`id_cuenta`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'2024-10-17 21:14:26','post1.jpg','post1.jpg','imagen','Primer post de Juan',1,0,1),(2,'2024-10-17 21:14:26','post2.mp4','post1.jpg','video','Video de Maria sobre arte',2,0,1),(3,'2024-10-17 21:14:26','post3.png','post1.jpg','imagen','Foto de Carlos sobre tecnologa',3,0,1),(4,'2024-10-17 21:14:26','post4.pdf','post1.jpg','documento','Gua de Ana sobre enseanza',4,0,1),(5,'2024-10-17 21:14:26','post5.jpg','post1.jpg','imagen','Luis compartiendo sus viajes',5,0,1),(6,'2024-10-19 03:54:45','asdas','http://localhost:44331/Uploads/Doxed.png','Lenguaje','asdasd',1,0,1),(7,'2024-10-19 18:22:25','asda','http://localhost:44331/Uploads/images.jpg','Educacion','asdasd',1,0,1),(8,'2024-10-19 18:22:37','asdas','http://localhost:44331/Uploads/Screenshot 2024-07-27 181909.png','Educacion','asdasd',1,0,1),(9,'2024-10-24 04:48:00','link 1','Uploads/downytfytload.jpg','Intercambio Cultural','post 1',1,0,0),(10,'2024-10-24 04:48:18','link 2','Uploads/grupo3be.jpg','Lenguaje','post 2',1,0,0),(11,'2024-10-24 04:48:21','link 2','Uploads/grupo3be.jpg','Lenguaje','post 2',1,0,0),(12,'2024-10-24 04:55:12','Pegue el enlace aquí','Uploads/Doxed.png','','post 4 creo',1,0,0),(13,'2024-10-24 04:55:36','asdasd','Uploads/6627adbbce5ee45e48d0b31d35a67932.jpeg','Lenguaje','post 56',1,0,0),(14,'2024-10-24 21:25:10','asdasd','Uploads/Screenshot 2024-10-14 232734.png','Educacion','postardo',1,0,0),(15,'2024-10-25 19:25:00','linksito','Uploads/dark-star-xerath-splash-art-uhdpaper.com-hd-7.1275.jpg','Lenguaje','postsito',1,0,0),(16,'2024-11-06 01:16:04','asdasd','','Lenguaje','posteando',1,0,1),(17,'2024-11-06 01:32:09','link','','Lenguaje','otro post',1,0,1),(18,'2024-11-06 01:34:59','aaa','','Intercambio Cultural','aaa',1,0,1),(19,'2024-11-06 01:36:10','asdqwf','','Educacion','wqefwadsf',1,0,1),(20,'2024-11-06 01:37:31','asda','','Educacion','asdewfwef',1,0,1),(21,'2024-11-06 01:40:46','asd','Uploads/images.jpg','Educacion','post nuevo',1,0,0),(22,'2024-11-06 01:44:06','asdasd','Uploads/matting_Doxed.png','Intercambio Cultural','asd',1,0,0),(23,'2024-11-11 18:03:10','asdasd','Uploads/images.jpg','Educacion','Posteando',1,0,0),(24,'2024-11-11 19:23:29','asdasd','Uploads/images.jpg','Educacion','asdas',1,0,0);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recibe`
--

DROP TABLE IF EXISTS `recibe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recibe` (
  `id_cuenta` int unsigned NOT NULL,
  `id_notificacion` int unsigned NOT NULL,
  PRIMARY KEY (`id_cuenta`,`id_notificacion`),
  KEY `id_notificacion` (`id_notificacion`),
  CONSTRAINT `recibe_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id_cuenta`),
  CONSTRAINT `recibe_ibfk_2` FOREIGN KEY (`id_notificacion`) REFERENCES `notificaciones` (`id_notificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibe`
--

LOCK TABLES `recibe` WRITE;
/*!40000 ALTER TABLE `recibe` DISABLE KEYS */;
INSERT INTO `recibe` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `recibe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro` (
  `id_registro` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contrasena` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_cuenta` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  KEY `id_cuenta` (`id_cuenta`),
  CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
INSERT INTO `registro` VALUES (1,'juan123','juan@mail.com','pass123',1),(2,'maria_l','maria@mail.com','pass456',2),(3,'carlos_mx','carlos@mail.com','pass789',3),(4,'ana_fr','ana@mail.com','pass101',4),(5,'luis_it','luis@mail.com','pass112',5),(6,'juan_perez','juan.perez@example.com','contrasena123',1),(7,'ana_lopez','ana.lopez@example.com','miSecreta456',2),(8,'carlos_garcia','carlos.garcia@example.com','seguro789',3),(10,'carlitos_garcia','carlitos_garcia@gmail.com','seguro789',7),(13,'caarlitos_garaacia','carlaitos_gaarcia@gmail.com','seguro7839',14),(15,'caarlitosgaaaaraacia','carlaitosgaarcia@gmail.com','seguro7839',18),(16,'naaa','nahuelcito@gmail.com','123aa123',19),(17,'jperez','juanperez@mail.com','123a123',32),(18,'jrodriguez','juanro@gmail.com','123a123',33),(19,'npineyro','nahuemanya2@gmail.com','contrasenia',34),(20,'lvazquez','correo@correo.correo','pass',35),(21,'aasd','asd','asd',36),(22,'pargento','peargentocorreo','pepe',37),(23,'aa','a','a',38),(24,'dd','d','d',39),(25,'ss','s','s',40),(26,'etre','tre','ert',47),(27,'napellidoooo','correeee','asd',48),(28,'messsss','correitoasd','asd',49),(29,'mapelllidardo','correardo','123',50),(30,'mfernandez','correo','5f4dcc3b5aa765d61d8327deb882cf99',51),(31,'npineyro0','npineyro@gmail.com','81dc9bdb52d04dc20036dbd8313ed055',61),(32,'npineyrito','nahuelcorreo','81dc9bdb52d04dc20036dbd8313ed055',63),(33,'smoreira','sebis','81dc9bdb52d04dc20036dbd8313ed055',64),(35,'n123','123','202cb962ac59075b964b07152d234b70',67);
/*!40000 ALTER TABLE `registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `set_preferencias`
--

DROP TABLE IF EXISTS `set_preferencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `set_preferencias` (
  `id_preferencia` int unsigned NOT NULL AUTO_INCREMENT,
  `idioma_app` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb4'spa'),
  `recordar_contrasena` tinyint(1) NOT NULL DEFAULT '0',
  `preferencias_contenido` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notificaciones_push` tinyint(1) NOT NULL DEFAULT '0',
  `muro_privado` tinyint(1) NOT NULL DEFAULT '0',
  `tema_de_apariencia` enum('claro','oscuro') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_preferencia`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `set_preferencias`
--

LOCK TABLES `set_preferencias` WRITE;
/*!40000 ALTER TABLE `set_preferencias` DISABLE KEYS */;
INSERT INTO `set_preferencias` VALUES (1,'spa',0,'Intereses en tecnologa',0,0,'claro'),(2,'spa',0,'Intereses en arte',0,0,'oscuro'),(3,'spa',0,'Intereses en msica',0,0,'claro'),(4,'spa',0,'Intereses en viajes',0,0,'oscuro'),(5,'spa',0,'Intereses en deportes',0,0,'claro'),(6,'spa',0,NULL,0,0,'claro'),(7,'spa',0,NULL,0,0,'claro'),(8,'spa',0,NULL,0,0,'claro'),(9,'spa',0,NULL,0,0,'claro'),(10,'spa',0,NULL,0,0,'claro'),(11,'spa',0,NULL,0,0,'claro'),(12,'spa',0,NULL,0,0,'claro'),(13,'spa',0,NULL,0,0,'claro'),(14,'spa',0,NULL,0,0,'claro'),(15,'spa',0,NULL,0,0,'claro'),(16,'spa',0,NULL,0,0,'claro'),(17,'spa',0,NULL,0,0,'claro'),(18,'spa',0,NULL,0,0,'claro'),(19,'spa',0,NULL,0,0,'claro'),(20,'spa',0,NULL,0,0,'claro'),(21,'spa',0,NULL,0,0,'claro'),(22,'spa',0,NULL,0,0,'claro'),(23,'spa',0,NULL,0,0,'claro'),(24,'spa',0,NULL,0,0,'claro'),(25,'spa',0,NULL,0,0,'claro'),(26,'spa',0,NULL,0,0,'claro'),(27,'spa',0,NULL,0,0,'claro'),(28,'spa',0,NULL,0,0,'claro'),(29,'spa',0,NULL,0,0,'claro'),(30,'spa',0,NULL,0,0,'claro'),(31,'spa',0,NULL,0,0,'claro'),(32,'spa',0,NULL,0,0,'claro'),(33,'spa',0,NULL,0,0,'claro'),(34,'spa',0,NULL,0,0,'claro'),(35,'spa',0,NULL,0,0,'claro'),(36,'spa',0,NULL,0,0,'claro'),(37,'spa',0,NULL,0,0,'claro'),(38,'spa',0,NULL,0,0,'claro'),(39,'spa',0,NULL,0,0,'claro'),(40,'spa',0,NULL,0,0,'claro'),(41,'spa',0,NULL,0,0,'claro'),(42,'spa',0,NULL,0,0,'claro'),(43,'spa',0,NULL,0,0,'claro'),(44,'spa',0,NULL,0,0,'claro'),(45,'spa',0,NULL,0,0,'claro'),(46,'spa',0,NULL,0,0,'claro'),(47,'spa',0,NULL,0,0,'claro'),(48,'spa',0,NULL,0,0,'claro'),(49,'spa',0,NULL,0,0,'claro'),(50,'spa',0,NULL,0,0,'claro'),(51,'spa',0,NULL,0,0,'claro'),(52,'spa',0,NULL,0,0,'claro'),(53,'spa',0,NULL,0,0,'claro'),(54,'spa',0,NULL,0,0,'claro'),(55,'spa',0,NULL,0,0,'claro'),(56,'spa',0,NULL,0,0,'claro'),(57,'spa',0,NULL,0,0,'claro'),(58,'spa',0,NULL,0,0,'claro'),(59,'spa',0,NULL,0,0,'claro'),(60,'spa',0,NULL,0,0,'claro'),(61,'spa',0,NULL,0,0,'claro'),(62,'spa',0,NULL,0,0,'claro'),(63,'spa',0,NULL,0,0,'claro'),(64,'spa',0,NULL,0,0,'claro'),(65,'spa',0,NULL,0,0,'claro'),(66,'spa',0,NULL,0,0,'claro'),(67,'spa',0,NULL,0,0,'claro'),(68,'spa',0,NULL,0,0,'claro'),(69,'spa',0,NULL,0,0,'claro'),(70,'spa',0,NULL,0,0,'claro'),(71,'spa',0,NULL,0,0,'claro'),(72,'spa',0,NULL,0,0,'claro'),(73,'spa',0,NULL,0,0,'claro'),(74,'spa',0,NULL,0,0,'claro'),(75,'spa',0,NULL,0,0,'claro'),(76,'spa',0,NULL,0,0,'claro');
/*!40000 ALTER TABLE `set_preferencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upvote`
--

DROP TABLE IF EXISTS `upvote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upvote` (
  `id_post` int unsigned NOT NULL,
  `id_upvote` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_upvote`),
  KEY `id_post` (`id_post`),
  CONSTRAINT `upvote_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id_post`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upvote`
--

LOCK TABLES `upvote` WRITE;
/*!40000 ALTER TABLE `upvote` DISABLE KEYS */;
INSERT INTO `upvote` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `upvote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pais` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `idiomas_hablados` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Juan','Prez','Gmez','ES','spa'),(2,'Maria','Lopez',NULL,'US','eng'),(3,'Carlos','Martinez','Hernandez','MX','spa'),(4,'Ana','Garcia','Sanchez','FR','fra'),(5,'Luis','Rodriguez',NULL,'IT','ita'),(6,'','','','SU','spa'),(7,'','','','SU','spa'),(8,'','','','SU','spa'),(9,'','','','SU','spa'),(10,'','','','SU','spa'),(11,'','','','SU','spa'),(12,'','','','SU','spa'),(13,'','','','SU','spa'),(14,'','','','SU','spa'),(15,'','','','SU','spa'),(16,'','','','SU','spa'),(17,'','','','SU','spa'),(18,'','','','SU','spa'),(19,'','','','SU','spa'),(20,'','','','SU','spa'),(21,'','','','SU','spa'),(22,'','','','SU','spa'),(23,'','','','SU','spa'),(24,'','','','SU','spa'),(25,'','','','SU','spa'),(26,'','','','SU','spa'),(27,'','','','SU','spa'),(28,'','','','SU','spa'),(29,'','','','SU','spa'),(30,'','','','SU','spa'),(31,'','','','SU','spa'),(32,'','','','SU','spa'),(33,'','','','SU','spa'),(34,'','','','SU','spa'),(35,'','','','SU','spa'),(36,'','','','SU','spa'),(37,'','','','SU','spa'),(38,'','','','SU','spa'),(39,'','','','SU','spa'),(40,'','','','SU','spa'),(41,'','','','SU','spa'),(42,'','','','SU','spa'),(43,'','','','SU','spa'),(44,'pepe','argento','argentito','LA','eng'),(45,'a','a','a','LA','eng'),(46,'d','d','d','LA','eng'),(47,'s','s','s','LA','eng'),(48,'dsa','dsa','dsa','OA',''),(49,'dsa','dsa','dsa','OA',''),(50,'ww','ww','ww','OA',''),(51,'ee','ee','ee','LA',''),(52,'nombrecito','apellidito','segundoa','OA',''),(53,'nom','ape','seguape','ED',''),(54,'sdsa','sdasd','dsasd','LA',''),(55,'sdsa','sdasd','dsasd','LA',''),(56,'ert','tre','ert','LA','eng'),(57,'nombreeee','apellidoooo','asdasd','LA','eng'),(58,'minombreeee','esssss','superman','LA','eng'),(59,'micuentarda','apelllidardo','segundardo','LA','eng'),(60,'matias','fernandez','asdi','ED','eng'),(61,'nahuel','pineyro','abella','OA','spa'),(62,'nahuel','pineyro','abella','OA','spa'),(63,'nahuel','pineyro','abella','ED','spa'),(64,'nahuel','pineyro','abella','LA','spa'),(65,'nahuel','pineyro','abella','LE','spa'),(66,'nahuel','pineyro','abella','LE','eng'),(67,'nahuel','pineyro','abella','LE','eng'),(68,'nahuel','pineyro','abella','LA','eng'),(69,'nahuel','pineyro','abella','LA','spa'),(70,'nahuelll','pineyro0','abella','UB','eng'),(71,'nahuel','pineyro','abella','ED','spa'),(72,'nahuelito','pineyrito','abellita','ED','spa'),(73,'seba','moreira','Segundo Apellido Opcional','ED','eng'),(74,'agus','borg','asd','LA','eng'),(75,'agus','borg','123','ED','eng'),(76,'nahu','123','123','LE','eng');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vinculados`
--

DROP TABLE IF EXISTS `vinculados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vinculados` (
  `id_cuenta1` int unsigned NOT NULL,
  `id_cuenta2` int unsigned NOT NULL,
  `tipo_vinculo` enum('amigo','bloqueado','seguido','silenciado') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_cuenta1`,`id_cuenta2`),
  KEY `id_cuenta2` (`id_cuenta2`),
  CONSTRAINT `vinculados_ibfk_1` FOREIGN KEY (`id_cuenta1`) REFERENCES `cuenta` (`id_cuenta`),
  CONSTRAINT `vinculados_ibfk_2` FOREIGN KEY (`id_cuenta2`) REFERENCES `cuenta` (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vinculados`
--

LOCK TABLES `vinculados` WRITE;
/*!40000 ALTER TABLE `vinculados` DISABLE KEYS */;
INSERT INTO `vinculados` VALUES (1,2,'amigo'),(2,1,'amigo'),(3,4,'seguido'),(4,5,'amigo'),(5,3,'bloqueado');
/*!40000 ALTER TABLE `vinculados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-12 19:52:02
