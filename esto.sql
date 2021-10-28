-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: agencia
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `archivo`
--

DROP TABLE IF EXISTS `archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archivo` (
  `id_archivo` mediumint NOT NULL AUTO_INCREMENT,
  `direcion_archivo` varchar(300) DEFAULT NULL,
  `idcliente` int DEFAULT NULL,
  `idrequisito` int DEFAULT NULL,
  `fecha_archivo` datetime DEFAULT NULL,
  `idTramite` int DEFAULT NULL,
  `nombre_requerimiento` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_archivo`),
  KEY `fk_relacion55` (`idcliente`),
  KEY `fk_relacion56` (`idrequisito`),
  CONSTRAINT `fk_relacion55` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `fk_relacion56` FOREIGN KEY (`idrequisito`) REFERENCES `requisito` (`idrequisito`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo`
--

LOCK TABLES `archivo` WRITE;
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
INSERT INTO `archivo` VALUES (33,'../documentos/720211028023107Netnografia metodo de investigacion.pdf',11,18,'2021-10-28 02:31:07',1,'Certificado de Origen '),(34,'../documentos/820211028023107Membretado.pdf',11,19,'2021-10-28 02:31:07',1,'Documentos de Transporte y Seguro');
/*!40000 ALTER TABLE `archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(25) NOT NULL,
  `correo_electronico` varchar(25) NOT NULL,
  `nit` varchar(200) DEFAULT NULL,
  `telefono` varchar(25) NOT NULL,
  `genero` varchar(20) NOT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE KEY `telefono_UNIQUE` (`telefono`),
  UNIQUE KEY `nit_UNIQUE` (`nit`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'pruebas','prueba@gmail.com','1511','11444','option1'),(11,'Burger  King Inc.','BurgerKing@gmail.com','33212','77851122','Hombre');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_has_tramite`
--

DROP TABLE IF EXISTS `cliente_has_tramite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_has_tramite` (
  `cliente_idcliente` int NOT NULL AUTO_INCREMENT,
  `tramite_idtramite` int NOT NULL,
  `idpersonal` int DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `fecha_tramite` date DEFAULT NULL,
  `pais_exportacion` varchar(200) DEFAULT NULL,
  `pais_importacion` varchar(200) DEFAULT NULL,
  `descEvaluacion` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`cliente_idcliente`,`tramite_idtramite`),
  KEY `fk_cliente_has_tramite_tramite1_idx` (`tramite_idtramite`),
  KEY `fk_cliente_has_tramite_cliente1_idx` (`cliente_idcliente`),
  KEY `fk_relacion54` (`idpersonal`),
  CONSTRAINT `fk_cliente_has_tramite_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `fk_cliente_has_tramite_tramite1` FOREIGN KEY (`tramite_idtramite`) REFERENCES `tramite` (`idtramite`),
  CONSTRAINT `fk_relacion54` FOREIGN KEY (`idpersonal`) REFERENCES `personal` (`idpersonal`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_has_tramite`
--

LOCK TABLES `cliente_has_tramite` WRITE;
/*!40000 ALTER TABLE `cliente_has_tramite` DISABLE KEYS */;
INSERT INTO `cliente_has_tramite` VALUES (11,1,24,'Rechazado','2021-10-28','Ninguno','Ninguno','tu certificado de origen tiene un error');
/*!40000 ALTER TABLE `cliente_has_tramite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documento` (
  `iddocumento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `formato` varchar(45) NOT NULL,
  `cliente_idcliente` int NOT NULL,
  PRIMARY KEY (`iddocumento`,`cliente_idcliente`),
  KEY `fk_documento_cliente1_idx` (`cliente_idcliente`),
  CONSTRAINT `fk_documento_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `idpersonal` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(250) NOT NULL,
  `apellidos` varchar(250) DEFAULT NULL,
  `c_i` varchar(1024) DEFAULT NULL,
  `genero` varchar(25) NOT NULL,
  `cargo` varchar(60) DEFAULT NULL,
  `telefono_personal` varchar(20) DEFAULT NULL,
  `estado_personal` varchar(30) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idpersonal`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (24,'Amilcar jose','Dario Torrez','0242a091a9147c186bd1b58c6512224179ce0430','Hombre','Gerente Administrativo','6521211','true',NULL),(29,'Keren','Gutierrez Andrade','8cb2237d0679ca88db6464eac60da96345513964','Mujer','Gerente Administrativo','4722111','true',NULL),(30,'Miguel','Perez Gutierrez','7c4a8d09ca3762af61e59520943dc26494f8941b','Hombre','Operador De Sistemas','78322111','true',NULL);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacion`
--

DROP TABLE IF EXISTS `publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacion` (
  `id_publicacion` mediumint NOT NULL AUTO_INCREMENT,
  `titulo_publicacion` varchar(1000) DEFAULT NULL,
  `descripcion_publicacion` text,
  `enlace_publicacion` varchar(1000) DEFAULT NULL,
  `fecha_publicacion` varchar(1000) DEFAULT NULL,
  `idpersonal` int DEFAULT NULL,
  PRIMARY KEY (`id_publicacion`),
  KEY `idpersonal` (`idpersonal`),
  CONSTRAINT `publicacion_ibfk_1` FOREIGN KEY (`idpersonal`) REFERENCES `personal` (`idpersonal`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacion`
--

LOCK TABLES `publicacion` WRITE;
/*!40000 ALTER TABLE `publicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `publicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisito`
--

DROP TABLE IF EXISTS `requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requisito` (
  `idrequisito` int NOT NULL AUTO_INCREMENT,
  `nombre_requerimiento` varchar(300) DEFAULT NULL,
  `enlace_requerimiento` varchar(300) DEFAULT NULL,
  `fecha_requisito` date DEFAULT NULL,
  `descripcion_requerimiento` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`idrequisito`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisito`
--

LOCK TABLES `requisito` WRITE;
/*!40000 ALTER TABLE `requisito` DISABLE KEYS */;
INSERT INTO `requisito` VALUES (1,'documento de cotizacion','../documentos/20211026064016OC_CST.pdf','2021-10-26','Descripcion del requerimiento 2'),(18,'Certificado de Origen ','../documentos/20211028022704Proyectos web.pdf','2021-10-28','Permite acreditar que los productos a exportarse tienen origen boliviano, de esta forma se deben cumplir las normas de origen establecidas lo cual permitirá beneficiarse con algún Acuerdo Comercial, lo que permite las preferencias arancelarias en los que participa Bolivia.'),(19,'Documentos de Transporte y Seguro','../documentos/20211028022922TOMA DE DESICIONES EN LA EMPRESA.pdf','2021-10-28','El documento de transporte a cargo de la empresa transportadora contratada por el exportador, el Seguro contratado de alguna aseguradora que cubra las pérdidas o daños que pudieran sufrir las mercancías durante su transporte. ');
/*!40000 ALTER TABLE `requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tramite`
--

DROP TABLE IF EXISTS `tramite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tramite` (
  `idtramite` int NOT NULL AUTO_INCREMENT,
  `tipo_tramite` varchar(25) DEFAULT NULL,
  `personal_idpersonal` int NOT NULL,
  `descripcion_tramite` varchar(2000) DEFAULT NULL,
  `fecha_tramite` datetime DEFAULT NULL,
  `estado_tramite` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idtramite`,`personal_idpersonal`),
  KEY `fk_tramite_personal1_idx` (`personal_idpersonal`),
  CONSTRAINT `fk_tramite_personal1` FOREIGN KEY (`personal_idpersonal`) REFERENCES `personal` (`idpersonal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tramite`
--

LOCK TABLES `tramite` WRITE;
/*!40000 ALTER TABLE `tramite` DISABLE KEYS */;
INSERT INTO `tramite` VALUES (1,'Exportar',24,'Tramite para realizar exportacion con destino a bolivia con un maximo de 100 ','2021-10-28 02:30:31',1),(2,'Importar',24,'Descripcion del tramite para realizar importaciones a otros paise con un maximo de 100 ','2021-10-27 17:22:38',1),(3,'Importar/Exportar',24,'Tramite conjunto para traer y exportar mercaderia desarrolada en bolas','2021-10-25 07:48:10',0);
/*!40000 ALTER TABLE `tramite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tramite_requisito`
--

DROP TABLE IF EXISTS `tramite_requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tramite_requisito` (
  `idtramite` int NOT NULL,
  `idrequisito` int NOT NULL,
  PRIMARY KEY (`idtramite`,`idrequisito`),
  KEY `FK_requisito` (`idrequisito`),
  CONSTRAINT `FK_requisito` FOREIGN KEY (`idrequisito`) REFERENCES `requisito` (`idrequisito`),
  CONSTRAINT `FK_tramite` FOREIGN KEY (`idtramite`) REFERENCES `tramite` (`idtramite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tramite_requisito`
--

LOCK TABLES `tramite_requisito` WRITE;
/*!40000 ALTER TABLE `tramite_requisito` DISABLE KEYS */;
INSERT INTO `tramite_requisito` VALUES (1,18),(1,19);
/*!40000 ALTER TABLE `tramite_requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion`
--

DROP TABLE IF EXISTS `ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicacion` (
  `idubicacion` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(45) NOT NULL,
  `cliente_idcliente` int NOT NULL,
  PRIMARY KEY (`idubicacion`,`cliente_idcliente`),
  KEY `fk_ubicacion_cliente1_idx` (`cliente_idcliente`),
  CONSTRAINT `fk_ubicacion_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion`
--

LOCK TABLES `ubicacion` WRITE;
/*!40000 ALTER TABLE `ubicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-27 22:32:17
