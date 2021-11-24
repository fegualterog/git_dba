-- MySQL dump 10.17  Distrib 10.3.23-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: UNIVERSIDAD
-- ------------------------------------------------------
-- Server version	10.3.23-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CARRERAS`
--

DROP TABLE IF EXISTS `CARRERAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CARRERAS` (
  `CARR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CARR_FACULTAD` varchar(255) NOT NULL,
  `CARR_PROGRAMA` varchar(255) NOT NULL,
  `TIPOPROG_ID` int(11) NOT NULL,
  `CARR_VALOR` decimal(16,6) NOT NULL,
  `CARR_FECHAREGISTRO` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CARR_ID`),
  KEY `FK_TIPOPROG_ID_idx` (`TIPOPROG_ID`),
  CONSTRAINT `FK_TIPOPROG_ID` FOREIGN KEY (`TIPOPROG_ID`) REFERENCES `TIPOPROGRAMA` (`TIPOPROG_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARRERAS`
--

LOCK TABLES `CARRERAS` WRITE;
/*!40000 ALTER TABLE `CARRERAS` DISABLE KEYS */;
INSERT INTO `CARRERAS` VALUES (1,'INGENIERIA','ELECTRONICA',1,4000000.000000,'2021-11-22 23:39:36'),(2,'INGENIERIA','SISTEMAS',1,3500000.000000,'2021-11-22 23:39:55'),(3,'ARTES','CINE Y TELEVISION',1,4000000.000000,'2021-11-22 23:42:47'),(4,'ARTES','DISEÑO GRAFICO',1,3500000.000000,'2021-11-22 23:42:47'),(5,'CIENCIAS','FISICA',1,4000000.000000,'2021-11-22 23:42:47'),(6,'CIENCIAS','ESTADISTICA',1,3500000.000000,'2021-11-22 23:42:47'),(7,'MEDICINA','MEDICINA',1,4000000.000000,'2021-11-22 23:42:47'),(8,'MEDICINA','FISIOTERAPIA',1,3500000.000000,'2021-11-22 23:42:47'),(9,'MEDICINA','GENETICA HUMANA',3,9000000.000000,'2021-11-22 23:44:17'),(10,'INGENIERIA','INGENIERIA DE SISTEMAS Y COMPUTACION',3,8000000.000000,'2021-11-22 23:45:27'),(11,'CIENCIAS ECONOMICAS','ESTUDIOS POLITICOS',3,7000000.000000,'2021-11-22 23:46:27'),(12,'INGENIERIA','BIG DATA',5,1700000.000000,'2021-11-22 23:48:30');
/*!40000 ALTER TABLE `CARRERAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ESTADOMATRICULA`
--

DROP TABLE IF EXISTS `ESTADOMATRICULA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESTADOMATRICULA` (
  `ESTMATR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ESTMATR_DESCRIPCION` varchar(255) NOT NULL,
  `ESTMATR_FECHAREGISTRO` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`ESTMATR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ESTADOMATRICULA`
--

LOCK TABLES `ESTADOMATRICULA` WRITE;
/*!40000 ALTER TABLE `ESTADOMATRICULA` DISABLE KEYS */;
INSERT INTO `ESTADOMATRICULA` VALUES (1,'PENDIENTE','2021-11-22 23:49:43'),(2,'PAGO','2021-11-22 23:49:43'),(3,'ANULADO','2021-11-22 23:49:43');
/*!40000 ALTER TABLE `ESTADOMATRICULA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ESTUDIANTE`
--

DROP TABLE IF EXISTS `ESTUDIANTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESTUDIANTE` (
  `EST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EST_NOMBRE` varchar(255) NOT NULL,
  `EST_APELLIDO` varchar(255) NOT NULL,
  `TIPODOC_ID` int(11) NOT NULL,
  `EST_DOCUMENTO` int(11) NOT NULL,
  `EST_FECHANACIMIENTO` date NOT NULL,
  `EST_FECHAREGISTRO` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`EST_ID`),
  KEY `FK_TIPODOC_ID_idx` (`TIPODOC_ID`),
  CONSTRAINT `FK_TIPODOC_ID` FOREIGN KEY (`TIPODOC_ID`) REFERENCES `TIPODOCUMENTO` (`TIPODOC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ESTUDIANTE`
--

LOCK TABLES `ESTUDIANTE` WRITE;
/*!40000 ALTER TABLE `ESTUDIANTE` DISABLE KEYS */;
INSERT INTO `ESTUDIANTE` VALUES (1,'Fabio Eduardo','Gualtero Garcia',1,1019041319,'1990-01-11','2121-01-01 00:00:00');
/*!40000 ALTER TABLE `ESTUDIANTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATRICULAS`
--

DROP TABLE IF EXISTS `MATRICULAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MATRICULAS` (
  `MATR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CARR_ID` int(11) NOT NULL,
  `EST_ID` int(11) NOT NULL,
  `ESTMATR_ID` int(11) NOT NULL,
  `SEM_ID` int(11) NOT NULL,
  `MATR_CARNET` bit(1) NOT NULL DEFAULT b'0',
  `MATR_CARNETVALOR` decimal(16,6) DEFAULT NULL,
  `MATR_VALOR` decimal(16,6) DEFAULT NULL,
  `MATR_DESCUENTO` decimal(16,6) DEFAULT NULL,
  `MATR_LINKPAGO` varchar(1000) DEFAULT NULL,
  `TIPOPAG_ID` int(11) DEFAULT NULL,
  `MATR_REFERENCIAPAGO` varchar(255) DEFAULT NULL,
  `MATR_VALORPAGO` decimal(16,6) DEFAULT NULL,
  `MATR_FECHAPAGO` datetime DEFAULT NULL,
  `MATR_FECHAPAGOPRONTO` datetime DEFAULT NULL,
  `MATR_FECHAREGISTRO` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`MATR_ID`),
  KEY `FK_CARR_ID_idx` (`CARR_ID`),
  KEY `FK_EST_ID_idx` (`EST_ID`),
  KEY `FK_ESTMATR_ID_idx` (`ESTMATR_ID`),
  KEY `FK_TIPOPAG_ID_idx` (`TIPOPAG_ID`),
  KEY `FK_SEM_ID_idx` (`SEM_ID`),
  KEY `IDX_FECHAPAGO` (`MATR_FECHAPAGO`),
  KEY `IDX_FECHAPAGOPRONTO` (`MATR_FECHAPAGOPRONTO`),
  CONSTRAINT `FK_CARR_ID` FOREIGN KEY (`CARR_ID`) REFERENCES `CARRERAS` (`CARR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ESTMATR_ID` FOREIGN KEY (`ESTMATR_ID`) REFERENCES `ESTADOMATRICULA` (`ESTMATR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_EST_ID` FOREIGN KEY (`EST_ID`) REFERENCES `ESTUDIANTE` (`EST_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SEM_ID` FOREIGN KEY (`SEM_ID`) REFERENCES `SEMESTRE` (`SEM_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TIPOPAG_ID` FOREIGN KEY (`TIPOPAG_ID`) REFERENCES `TIPOPAGO` (`TIPOPAG_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATRICULAS`
--

LOCK TABLES `MATRICULAS` WRITE;
/*!40000 ALTER TABLE `MATRICULAS` DISABLE KEYS */;
INSERT INTO `MATRICULAS` VALUES (1,6,1,1,1,'',20000.000000,3500000.000000,350000.000000,'https://universidad.com.co/pagos/1235',NULL,NULL,NULL,'2021-01-20 23:59:59','2021-01-10 23:59:59','2021-11-24 00:03:47'),(2,6,1,1,1,'\0',0.000000,3500000.000000,350000.000000,'https://universidad.com.co/pagos/1235',NULL,NULL,NULL,'2021-01-20 23:59:59','2021-01-10 23:59:59','2021-11-24 00:03:56'),(3,5,1,1,1,'\0',0.000000,4000000.000000,400000.000000,'https://universidad.com.co/pagos/1235',NULL,NULL,NULL,'2021-01-20 23:59:59','2021-01-10 23:59:59','2021-11-24 00:04:12'),(4,5,1,1,1,'',20000.000000,4000000.000000,400000.000000,'https://universidad.com.co/pagos/1235',NULL,NULL,NULL,'2021-01-20 23:59:59','2021-01-10 23:59:59','2021-11-24 00:04:16'),(5,2,1,1,1,'',20000.000000,3500000.000000,350000.000000,'https://universidad.com.co/pagos/1235',NULL,NULL,NULL,'2021-01-20 23:59:59','2021-01-10 23:59:59','2021-11-24 00:04:58'),(6,2,1,1,1,'\0',0.000000,3500000.000000,350000.000000,'https://universidad.com.co/pagos/1235',NULL,NULL,NULL,'2021-01-20 23:59:59','2021-01-10 23:59:59','2021-11-24 00:05:02'),(8,2,1,1,1,'\0',0.000000,3500000.000000,350000.000000,'https://universidad.com.co/pagos/1235',NULL,NULL,NULL,'2021-01-20 23:59:59','2021-01-10 23:59:59','2021-11-24 00:06:15'),(9,2,1,1,1,'',20000.000000,3500000.000000,350000.000000,'https://universidad.com.co/pagos/1235',NULL,NULL,NULL,'2021-01-20 23:59:59','2021-01-10 23:59:59','2021-11-24 00:06:18');
/*!40000 ALTER TABLE `MATRICULAS` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fabio`@`%`*/ /*!50003 TRIGGER FECHAPAGO
       BEFORE INSERT
       ON UNIVERSIDAD.MATRICULAS FOR EACH ROW
   BEGIN
       DECLARE _VALOR DECIMAL(16,6);
       DECLARE _DESCUENTO DECIMAL(16,6);
       DECLARE _FECHAPAGO DATETIME;
       DECLARE _FECHAPAGOPRONTO DATETIME;
       DECLARE _VALORCARNET DECIMAL(16,6);
	   
	   SELECT C.CARR_VALOR, ROUND((C.CARR_VALOR * ( S.SEM_PORCENTAJEDESCUENTO) / 100 ), 6), S.SEM_FECHAPAGO, S.SEM_FECHAPAGOPRONTO, S.SEM_VALORCARNET  INTO _VALOR, _DESCUENTO, _FECHAPAGO, _FECHAPAGOPRONTO, _VALORCARNET  FROM UNIVERSIDAD.CARRERAS C, UNIVERSIDAD.SEMESTRE S where S.SEM_ID = NEW.SEM_ID AND C.CARR_ID = NEW.CARR_ID;
	   
	   
	   SET NEW.MATR_VALOR = _VALOR;
	   SET NEW.MATR_DESCUENTO = _DESCUENTO;
	   SET NEW.MATR_FECHAPAGO = _FECHAPAGO;
	   SET NEW.MATR_FECHAPAGOPRONTO = _FECHAPAGOPRONTO;
       SET NEW.MATR_CARNETVALOR = IF(NEW.MATR_CARNET = b'1', _VALORCARNET, 0.0);

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `SEMESTRE`
--

DROP TABLE IF EXISTS `SEMESTRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEMESTRE` (
  `SEM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SEM_DESCRIPCION` varchar(255) DEFAULT NULL,
  `SEM_FECHAPAGO` datetime NOT NULL,
  `SEM_FECHAPAGOPRONTO` datetime NOT NULL,
  `SEM_PORCENTAJEDESCUENTO` decimal(16,6) DEFAULT 0.000000,
  `SEM_VALORCARNET` decimal(16,6) DEFAULT 0.000000,
  PRIMARY KEY (`SEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEMESTRE`
--

LOCK TABLES `SEMESTRE` WRITE;
/*!40000 ALTER TABLE `SEMESTRE` DISABLE KEYS */;
INSERT INTO `SEMESTRE` VALUES (1,'PERIODO 1','2021-01-20 23:59:59','2021-01-10 23:59:59',10.000000,20000.000000),(2,'PERIODO 2','2021-08-20 23:59:59','2021-08-10 23:59:59',12.000000,15000.000000),(3,'PERIODO 3','0000-00-00 00:00:00','0000-00-00 00:00:00',20.000000,10000.000000);
/*!40000 ALTER TABLE `SEMESTRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPODOCUMENTO`
--

DROP TABLE IF EXISTS `TIPODOCUMENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPODOCUMENTO` (
  `TIPODOC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIPODOC_DESCRIPCION` varchar(255) NOT NULL,
  `TIPODOC_ALIAS` varchar(45) DEFAULT NULL,
  `TIPODOC_FECHAREGISTRO` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`TIPODOC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPODOCUMENTO`
--

LOCK TABLES `TIPODOCUMENTO` WRITE;
/*!40000 ALTER TABLE `TIPODOCUMENTO` DISABLE KEYS */;
INSERT INTO `TIPODOCUMENTO` VALUES (1,'TARJETA DE IDENTIDAD','TI','2021-11-22 21:38:59'),(2,'CEDULA DE CIUDADANIA','CC','2021-11-22 21:38:59'),(3,'REGISTRO CIVIL','RC','2021-11-22 21:38:59'),(4,'CEDULA DE EXTRANJERIA','CE','2021-11-22 21:38:59'),(5,'NUMERO DE IDENTIFICACION PERSONAL','NIP','2021-11-22 21:38:59'),(6,'NUMERO UNICO DE IDENTIFICACION PERSONAL','NUIP','2021-11-22 21:38:59'),(7,'PERMISO ESPECIAL DE PERMANENCIA','PEP','2021-11-22 21:38:59');
/*!40000 ALTER TABLE `TIPODOCUMENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPOPAGO`
--

DROP TABLE IF EXISTS `TIPOPAGO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPOPAGO` (
  `TIPOPAG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIPOPAG_DESCRIPCION` varchar(255) DEFAULT NULL,
  `TIPOPAG_FECHAREGISTRO` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`TIPOPAG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPOPAGO`
--

LOCK TABLES `TIPOPAGO` WRITE;
/*!40000 ALTER TABLE `TIPOPAGO` DISABLE KEYS */;
INSERT INTO `TIPOPAGO` VALUES (1,'PAGO ONLINE','2021-11-22 22:53:35'),(2,'VENTANILLA','2021-11-22 22:53:35');
/*!40000 ALTER TABLE `TIPOPAGO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPOPROGRAMA`
--

DROP TABLE IF EXISTS `TIPOPROGRAMA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPOPROGRAMA` (
  `TIPOPROG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIPOPROG_DESCRIPCION` varchar(255) NOT NULL,
  `TIPOPROG_FECHAREGISTRO` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`TIPOPROG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPOPROGRAMA`
--

LOCK TABLES `TIPOPROGRAMA` WRITE;
/*!40000 ALTER TABLE `TIPOPROGRAMA` DISABLE KEYS */;
INSERT INTO `TIPOPROGRAMA` VALUES (1,'PREGRADO','2021-11-22 21:47:17'),(2,'ESPECIALIZACION','2021-11-22 21:47:17'),(3,'MAESTRIA','2021-11-22 21:47:17'),(4,'DOCTORADO','2021-11-22 21:47:17'),(5,'DIPLOMADO','2021-11-22 21:47:17');
/*!40000 ALTER TABLE `TIPOPROGRAMA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'UNIVERSIDAD'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-24  0:36:50
