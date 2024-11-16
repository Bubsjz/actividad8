CREATE DATABASE  IF NOT EXISTS `blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `blog`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `idautores` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idautores`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (23,'Julio García','julio.garcia@gmail.com','https://ejemplo.com/img/julio.jpg'),(24,'Nieves López','nieves.lopez@gmail.com','https://ejemplo.com/img/nieves.jpg'),(25,'María González','maria.gonzalez@gmail.com','https://ejemplo.com/img/maria.jpg'),(26,'Pedro Martínez','pedro.martinez@gmail.com','https://ejemplo.com/img/pedro.jpg'),(27,'Ana Sánchez','ana.sanchez@gmail.com','https://ejemplo.com/img/ana.jpg'),(28,'Luis Torres','luis.torres@gmail.com','https://ejemplo.com/img/luis.jpg'),(29,'Carla Romero','carla.romero@gmail.com','https://ejemplo.com/img/carla.jpg'),(30,'Jorge Pérez','jorge.perez@gmail.com','https://example.com/img/jorge.jpg'),(41,'Laura Fernández','laura.fernandez@gmail.com','https://ejemplo.com/img/laura.jpg'),(42,'Daniel Ortiz','daniel.ortiz@gmail.com','https://ejemplo.com/img/daniel.jpg');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `idposts` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `categoria` varchar(45) DEFAULT NULL,
  `autor_id` int NOT NULL,
  PRIMARY KEY (`idposts`),
  UNIQUE KEY `titulo_UNIQUE` (`titulo`),
  KEY `fk_posts_autores_idx` (`autor_id`),
  CONSTRAINT `fk_posts_autores` FOREIGN KEY (`autor_id`) REFERENCES `autores` (`idautores`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (26,'Introducción a JavaScript','Básico de JS','2024-11-16 00:15:48','Programación',23),(27,'Node.js avanzado','Backend eficiente','2024-11-16 00:15:48','Programación',23),(28,'APIs RESTful','Buenas prácticas','2024-11-16 00:15:48','Backend',24),(29,'Diseño de Bases de Datos','Esquema simple','2024-11-16 00:15:48','Bases de Datos',24),(30,'Introducción a CSS','Estilos básicos','2024-11-16 00:15:48','Diseño Web',25),(31,'Diseño responsivo','Mobile-friendly','2024-11-16 00:15:48','Diseño Web',25),(32,'Conceptos de Python','Aprende lo básico','2024-11-16 00:15:48','Desarrollo',26),(33,'Proyectos con Python','Aplicaciones simples','2024-11-16 00:15:48','Desarrollo',26),(34,'Inteligencia Artificial','Introducción a IA','2024-11-16 00:15:48','AI',27),(35,'Redes neuronales básicas','Conceptos iniciales','2024-11-16 00:15:48','AI',27),(36,'Testing automatizado','Mejora la calidad','2024-11-16 00:15:48','QA',28),(37,'Optimización de software','Mejor rendimiento','2024-11-16 00:15:48','QA',28),(38,'JavaScript moderno','Aprende ES6','2024-11-16 00:15:48','Programación',29),(39,'Frameworks de Frontend','Alternativas comunes','2024-11-16 00:15:48','Frontend',29),(40,'Introducción a MySQL','Primeros pasos','2024-11-16 00:15:48','Bases de Datos',30),(41,'Consultas avanzadas','SQL optimizado','2024-11-16 00:15:48','Bases de Datos',30),(42,'DevOps desde cero','Conceptos básicos','2024-11-16 00:15:48','DevOps',41),(43,'Orquestación con Kubernetes','Buenas prácticas','2024-11-16 00:15:48','DevOps',41),(44,'Seguridad en APIs','Protege tus datos','2024-11-16 00:15:48','Seguridad',42),(45,'Microservicios prácticos','Despliegue eficiente','2024-11-16 00:15:48','Backend',42),(70,'CSS','Introducción a CSS','2024-11-16 16:05:11','Maquetación',30);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-16 23:08:01
