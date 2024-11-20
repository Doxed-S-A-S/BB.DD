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
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_chat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
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
  `contenido` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `eliminado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_comentario`),
  KEY `id_post` (`id_post`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id_post`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,1,'2024-11-19 22:32:25','magnifico toro la verdad',0),(2,1,'2024-11-19 22:34:55','la verdad creo que voy a subir otro post de toros',0),(3,1,'2024-11-19 22:38:18','che tremendo post nahuel la verdad le voy a dar like',0),(4,1,'2024-11-19 22:39:00','se parece al de lamborghini',0),(5,1,'2024-11-19 22:42:02','tremendo toro e',0),(6,2,'2024-11-19 22:51:23','che amigo tremendo logo',0);
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
  `rol` enum('owner','administrador','participante') COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `conforma` VALUES (1,4,'owner'),(2,1,'owner');
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
  `nombre_usuario` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date NOT NULL DEFAULT (curdate()),
  `imagen_perfil` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol_cuenta` enum('usuario','profesor','escuela') COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'npineyro','2024-11-19','Uploads/fotarda.jpg','usuario',0,1,1,1,0),(2,'aborges','2024-11-19','Uploads/WhatsApp Image 2024-05-16 at 7.10.55 PM.jpeg','usuario',0,2,2,2,0),(3,'smoreira','2024-11-19','Uploads/WhatsApp Image 2024-05-16 at 7.05.03 PM.jpeg','usuario',0,3,3,3,0),(4,'mfernandez','2024-11-19','Uploads/WhatsApp Image 2024-05-16 at 7.10.25 PM(1).jpeg','usuario',0,4,4,4,0);
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
INSERT INTO `da_upvote` VALUES (1,4),(4,2);
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
  `nombre_evento` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_evento` datetime NOT NULL,
  `descripcion_evento` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `eliminado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_post`),
  UNIQUE KEY `id_evento` (`id_evento`),
  CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id_post`),
  CONSTRAINT `evento_chk_1` CHECK ((`fecha_evento` >= sysdate()))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
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
  `nombre_grupo` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_creacion` date NOT NULL DEFAULT (curdate()),
  `descripcion` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `privacidad` tinyint(1) NOT NULL,
  `url_imagen` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen_banner` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reports` tinyint NOT NULL DEFAULT '0',
  `eliminado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_grupo`),
  UNIQUE KEY `nombre_grupo` (`nombre_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'grupo mclaren','2024-11-19','este grupo es un grupo de fans de mclaren',0,'Uploads/landito.jpg','Uploads/bannernahuel.jpg',0,0),(2,'grupo verstappen','2024-11-19','este grupo es para apreciar al mejor piloto de la formula 1',0,'Uploads/verstappen.jpg','Uploads/verstappen_benner.jpg',0,0);
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
INSERT INTO `hace` VALUES (1,1),(2,1),(6,1),(3,2),(4,2),(5,3);
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
  `contenido` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_envio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_mensaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes`
--

LOCK TABLES `mensajes` WRITE;
/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderadores_bo`
--

DROP TABLE IF EXISTS `moderadores_bo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moderadores_bo` (
  `id_moderador` int unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `super` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_moderador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderadores_bo`
--

LOCK TABLES `moderadores_bo` WRITE;
/*!40000 ALTER TABLE `moderadores_bo` DISABLE KEYS */;
/*!40000 ALTER TABLE `moderadores_bo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muro`
--

DROP TABLE IF EXISTS `muro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `muro` (
  `id_muro` int unsigned NOT NULL AUTO_INCREMENT,
  `detalles` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pub_destacada` int NOT NULL,
  `imagen_banner` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biografia` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_muro`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muro`
--

LOCK TABLES `muro` WRITE;
/*!40000 ALTER TABLE `muro` DISABLE KEYS */;
INSERT INTO `muro` VALUES (1,'',0,'Uploads/bannernahuel.jpg','mi nombre es nahuel y estoy haciendo un proyecto de programacion'),(2,'',0,'Uploads/bannernahuel.jpg','soy agustin y me gusta jugar a la compu y la formula 1'),(3,'',0,'Uploads/imagen2.jpg','mi nombre es sebastian moreira, me gusta la mecanica y comer bocatas'),(4,'',0,'Uploads/image.png','me gusta mucho la formula 1 y soy fanatico de mclaren');
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
  `contenido` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_envio` date NOT NULL DEFAULT (curdate()),
  `leida` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_notificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
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
INSERT INTO `postea_grupos` VALUES (2,1),(1,3),(2,3);
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
INSERT INTO `postea_muro` VALUES (4,3);
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
  `url_contenido` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_imagen` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_contenido` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenido` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_cuenta` int unsigned NOT NULL,
  `reports` tinyint NOT NULL DEFAULT '0',
  `eliminado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_post`),
  KEY `id_cuenta` (`id_cuenta`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'2024-11-19 22:32:10','torito.com','Uploads/imagen2.jpg','Lenguaje','este es mi primer post siendo nahuel',1,0,0),(2,'2024-11-19 22:41:47','Pegue el enlace aquí','Uploads/image.png','','me gusta un monton este logo',3,0,0),(3,'2024-11-19 22:44:25','matias.com','Uploads/landito.jpg','Educacion','quiero aprender ingles para hablar con mi idolo',4,0,0);
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
  `nombre_usuario` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_cuenta` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  KEY `id_cuenta` (`id_cuenta`),
  CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
INSERT INTO `registro` VALUES (1,'npineyro','npineyro@gmail.com','81dc9bdb52d04dc20036dbd8313ed055',1),(2,'aborges','borgesa@gmail.com','81dc9bdb52d04dc20036dbd8313ed055',2),(3,'smoreira','sebasmoreira@gmail.com','81dc9bdb52d04dc20036dbd8313ed055',3),(4,'mfernandez','mfernandez@gmail.com','81dc9bdb52d04dc20036dbd8313ed055',4);
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
  `idioma_app` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb4'spa'),
  `recordar_contrasena` tinyint(1) NOT NULL DEFAULT '0',
  `preferencias_contenido` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notificaciones_push` tinyint(1) NOT NULL DEFAULT '0',
  `muro_privado` tinyint(1) NOT NULL DEFAULT '0',
  `tema_de_apariencia` enum('claro','oscuro') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_preferencia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `set_preferencias`
--

LOCK TABLES `set_preferencias` WRITE;
/*!40000 ALTER TABLE `set_preferencias` DISABLE KEYS */;
INSERT INTO `set_preferencias` VALUES (1,'spa',0,NULL,0,0,'claro'),(2,'spa',0,NULL,0,0,'claro'),(3,'spa',0,NULL,0,0,'claro'),(4,'spa',0,NULL,0,0,'claro');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upvote`
--

LOCK TABLES `upvote` WRITE;
/*!40000 ALTER TABLE `upvote` DISABLE KEYS */;
INSERT INTO `upvote` VALUES (2,2),(2,4);
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
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido1` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido2` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pais` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idiomas_hablados` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'nahuel','pineyro','abella','LA','eng'),(2,'agustin','borges','Segundo Apellido Opcional','LA','spa'),(3,'sebastian','moreira','Segundo Apellido Opcional','LA','eng'),(4,'matias','fernandez','Segundo Apellido Opcional','EB','spa');
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
  `tipo_vinculo` enum('amigo','bloqueado','seguido','silenciado') COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `vinculados` VALUES (1,3,'amigo'),(1,4,'amigo');
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

-- Dump completed on 2024-11-19 23:18:51
