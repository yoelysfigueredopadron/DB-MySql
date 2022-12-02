-- Se creo un backup todos los datos de las tablas correspondientes a la base de datos universidad
-- Las tablas de las que se hizo respaldo de información fueron 12 y la mismas se nombran a continuación:
-- alumnos, asignaturas, carreras, logs_delete_students, logs_insert_students, logs_update_students, matricula_alumnos,
-- notas, periodos_academicos, profesiones, profesores, profesores_asignaturas

-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: universidad
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,'15221990','Juan','Galeas','M','Soltero','1994-01-12','88779988','juan@gmail.com','Barrio el Colegio'),(2,'15031992','Francelia','Rodirguez','F','Soltera','1992-01-11','88999988','francelia@gmail.com','Parque Chacabuco'),(3,'16721990','Maria','Gonzales','F','Casada','1995-03-12','55779988','maria@gmail.com','Barrio Butteler'),(4,'13422190','Ernesto','Rivera','M','Casado','1998-01-08','88773388','ernesto@gmail.com','Nueva Pompeya'),(5,'11661990','Martin','Santana','M','Soltero','1993-01-06','44114455','martin@gmail.com','Parque Patricios'),(6,'12881990','Liset','Hernandez','F','Casada','1990-01-04','23779988','liset@gmail.com','Boedo'),(7,'55221990','Jennifer','Herrera','F','Soltera','1994-02-10','55569988','jennifer@gmail.com','Caballito'),(8,'13244990','Susana','Lopez','M','Soltera','1995-06-06','99887654','susana@gmail.com','Villa Crespo'),(9,'56271990','Hector','Jimenez','M','Soltero','1996-01-07','97654321','hector@gmail.com','Colegiales'),(10,'33211990','Pedro','Fernandez','M','Casado','1993-12-24','23234141','pedro@gmail.com','Villa Urquiza');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `asignaturas`
--

LOCK TABLES `asignaturas` WRITE;
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
INSERT INTO `asignaturas` VALUES ('AD1','Historia de la Administracion',4,'AA-002'),('AD10','Administracion y Mercadeo',4,'AA-002'),('AD11','Administracion de Personal',4,'AA-002'),('AD2','Administracion de Empresas',4,'AA-002'),('AD3','Administracion de Costos',4,'AA-002'),('AD4','Analisis de Empresas',4,'AA-002'),('AD5','Analisis de Estados Financieros',4,'AA-002'),('AD6','Ingenieria Economica',4,'AA-002'),('AD7','Microeconomia',4,'AA-002'),('AD8','acroeconomia',4,'AA-002'),('AD9','Administracion de Negocios',4,'AA-002'),('MM1','Matematica I',5,'AA-001'),('MM2','Matematica II',5,'AA-001'),('PG1','Programacion I',4,'AA-001'),('PG10','Analisis de Algoritmos',4,'AA-001'),('PG11','Analisis de Sistemas',4,'AA-001'),('PG2','Programacion Logica',4,'AA-001'),('PG3','Programacion Funcional',4,'AA-001'),('PG4','Programacion Orientada a Objetos',4,'AA-001'),('PG5','Programacion Web',4,'AA-001'),('PG6','Desarrollo de Aplicaciones Web',4,'AA-001'),('PG7','Bases de Datos I',4,'AA-001'),('PG8','Laboratorio de Bases de Datos',4,'AA-001'),('PG9','Diseño Web ',4,'AA-001'),('PMG12','Calculo I',4,'AA-001'),('PMG13','Algebra Lineal',4,'AA-001'),('PMG14','Teoria de Algoritmos',4,'AA-001'),('PS1','Psicologia',4,'AA-005'),('PS10','Desarrollo Psicopatologico',4,'AA-005'),('PS11','Desarrollo Psicoemocional',4,'AA-005'),('PS2','Psicologia Educativa',4,'AA-005'),('PS3','Psicologia Emocional',4,'AA-005'),('PS4','Psicologia del Niño',4,'AA-005'),('PS5','Psicopatologia',4,'AA-005'),('PS6','Psicologia Social',4,'AA-005'),('PS7','Histologia',4,'AA-005'),('PS8','Desarrollo Cognitivo',4,'AA-005'),('PS9','Historia de la Psicologia',4,'AA-005');
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES ('AA-001','Ingenieria en Sistemas',200000.00),('AA-002','Licenciatura en Administracion de Empresas',180000.00),('AA-003','Licenciatura en Derecho',220000.00),('AA-004','Licenciatura en Mercadotecnia',190000.00),('AA-005','Licenciatura en Psicologia',250000.00),('AA-006','Licenciatura en Teologia',170000.00),('AA-007','Licenciatura en Informatica',190000.00),('AA-008','Laboratorio Clinico',175000.00);
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `logs_delete_students`
--

LOCK TABLES `logs_delete_students` WRITE;
/*!40000 ALTER TABLE `logs_delete_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs_delete_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `logs_insert_students`
--

LOCK TABLES `logs_insert_students` WRITE;
/*!40000 ALTER TABLE `logs_insert_students` DISABLE KEYS */;
INSERT INTO `logs_insert_students` VALUES (1,'15221990','Juan','Galeas','M','Soltero','1994-01-12','88779988','juan@gmail.com','Barrio el Colegio','root@localhost','2022-11-25','21:10:36'),(2,'15031992','Francelia','Rodirguez','F','Soltera','1992-01-11','88999988','francelia@gmail.com','Parque Chacabuco','root@localhost','2022-11-25','21:10:36'),(3,'16721990','Maria','Gonzales','F','Casada','1995-03-12','55779988','maria@gmail.com','Barrio Butteler','root@localhost','2022-11-25','21:10:36'),(4,'13422190','Ernesto','Rivera','M','Casado','1998-01-08','88773388','ernesto@gmail.com','Nueva Pompeya','root@localhost','2022-11-25','21:10:36'),(5,'11661990','Martin','Santana','M','Soltero','1993-01-06','44114455','martin@gmail.com','Parque Patricios','root@localhost','2022-11-25','21:10:36'),(6,'12881990','Liset','Hernandez','F','Casada','1990-01-04','23779988','liset@gmail.com','Boedo','root@localhost','2022-11-25','21:10:36'),(7,'55221990','Jennifer','Herrera','F','Soltera','1994-02-10','55569988','jennifer@gmail.com','Caballito','root@localhost','2022-11-25','21:10:36'),(8,'13244990','Susana','Lopez','M','Soltera','1995-06-06','99887654','susana@gmail.com','Villa Crespo','root@localhost','2022-11-25','21:10:36'),(9,'56271990','Hector','Jimenez','M','Soltero','1996-01-07','97654321','hector@gmail.com','Colegiales','root@localhost','2022-11-25','21:10:36'),(10,'33211990','Pedro','Fernandez','M','Casado','1993-12-24','23234141','pedro@gmail.com','Villa Urquiza','root@localhost','2022-11-25','21:10:36');
/*!40000 ALTER TABLE `logs_insert_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `logs_update_students`
--

LOCK TABLES `logs_update_students` WRITE;
/*!40000 ALTER TABLE `logs_update_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs_update_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `matricula_alumnos`
--

LOCK TABLES `matricula_alumnos` WRITE;
/*!40000 ALTER TABLE `matricula_alumnos` DISABLE KEYS */;
INSERT INTO `matricula_alumnos` VALUES (1,'AA-001',1,3,'2018-09-05'),(2,'AA-001',1,1,'2018-10-23'),(3,'AA-001',1,2,'2018-09-25'),(4,'AA-002',3,7,'2019-06-02'),(5,'AA-003',2,8,'2018-12-05'),(6,'AA-004',5,9,'2020-01-05'),(7,'AA-005',6,4,'2020-07-10'),(8,'AA-006',6,5,'2020-06-20'),(9,'AA-007',8,6,'2020-11-20'),(10,'AA-007',8,10,'2020-12-05');
/*!40000 ALTER TABLE `matricula_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,1,'MM1',9.0),(2,1,'MM2',8.0),(3,1,'PG1',9.5),(4,1,'PG2',7.0),(5,1,'PG3',6.0),(6,1,'PG4',9.0),(7,1,'PG5',8.0),(8,1,'PG6',7.0),(9,1,'PG7',10.0),(10,1,'PG8',10.0),(11,1,'PG9',8.0),(12,1,'PG10',8.0),(13,1,'PG11',9.0),(14,1,'PMG12',7.7),(15,1,'PMG13',8.5),(16,1,'PMG14',9.0),(17,2,'MM1',7.5),(18,2,'MM2',8.4),(19,2,'PG1',9.5),(20,2,'PG2',7.0),(21,2,'PG3',9.0),(22,2,'PG4',10.0),(23,2,'PG5',10.0),(24,2,'PG6',7.0),(25,2,'PG7',8.0),(26,2,'PG8',6.0),(27,2,'PG9',8.0),(28,2,'PG10',8.0),(29,2,'PG11',9.0),(30,2,'PMG12',7.0),(31,2,'PMG13',7.3),(32,2,'PMG14',9.0),(33,3,'MM1',6.5),(34,3,'MM2',7.4),(35,3,'PG1',9.0),(36,3,'PG2',7.0),(37,3,'PG3',9.0),(38,3,'PG4',8.0),(39,3,'PG5',9.9),(40,3,'PG6',6.0),(41,3,'PG7',8.0),(42,3,'PG8',10.0),(43,3,'PG9',8.0),(44,3,'PG10',8.0),(45,3,'PG11',9.0),(46,3,'PMG12',10.0),(47,3,'PMG13',7.0),(48,3,'PMG14',8.0);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `periodos_academicos`
--

LOCK TABLES `periodos_academicos` WRITE;
/*!40000 ALTER TABLE `periodos_academicos` DISABLE KEYS */;
INSERT INTO `periodos_academicos` VALUES (1,'Primero','2019-02-04','2019-05-08'),(2,'Segundo','2019-05-27','2019-08-19'),(3,'Tercero','2019-09-16','2019-12-20'),(4,'Primero','2020-02-04','2020-05-08'),(5,'Segundo','2020-05-27','2020-08-19'),(6,'Tercero','2020-09-16','2020-12-20'),(7,'Primero','2021-02-04','2021-05-08'),(8,'Segundo','2021-05-27','2021-08-19'),(9,'Tercero','2021-09-16','2021-12-20');
/*!40000 ALTER TABLE `periodos_academicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `profesiones`
--

LOCK TABLES `profesiones` WRITE;
/*!40000 ALTER TABLE `profesiones` DISABLE KEYS */;
INSERT INTO `profesiones` VALUES ('IES','Ingeniero En Sistemas'),('LCI','Lic. en Comercio Internacional'),('LED','Lic. en Derecho'),('LPS','Lic. en Psicologia'),('MGT','Master en Gerstion de Tecnologias');
/*!40000 ALTER TABLE `profesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,'15191990','Jairo S','Galeas F','M','hola@jairogaleas.com','27990012','Casado','MGT','1990-01-12','2012-05-19'),(2,'15191991','Doris','Guzman','F','gdoris@gmail.com','27990123','Casada','LCI','1980-02-19','2011-01-10'),(3,'15031988','Angel','Zelaya','M','azelaya@gmail.com','88445522','Casado','IES','1988-02-25','2014-01-20'),(4,'15031978','Carlos','Perez','M','c.perez@gmail.com','99887766','Soltero','IES','1978-04-20','2014-04-18'),(5,'15031986','Carlos','Velasquez','M','c.velasquez@gmail.com','55668844','Casado','IES','1986-04-21','2015-05-20'),(6,'15031985','Diana','Peralta','F','peralta.diana@gmail.com','99989796','Soltera','LPS','1985-05-11','2016-01-20'),(7,'15031983','Maria','Funez','F','mariafunez1@gmail.com','97989786','Casada','LPS','1985-08-18','2016-01-20'),(8,'08011990','Victor','Acosta','M','acosvict@yahoo.com','88989986','Soltero','LPS','1990-06-21','2017-09-12'),(9,'01011968','Juan','Zavala','M','jzavala28@yahoo.com','77889886','Casado','LED','1968-05-29','2017-09-03');
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `profesores_asignaturas`
--

LOCK TABLES `profesores_asignaturas` WRITE;
/*!40000 ALTER TABLE `profesores_asignaturas` DISABLE KEYS */;
INSERT INTO `profesores_asignaturas` VALUES (1,1,'MM1',2),(2,1,'MM2',3),(3,1,'PG2',2),(4,6,'PS1',2),(5,6,'PS2',3),(6,6,'PS3',4),(7,7,'PS4',7),(8,7,'PS5',8),(9,7,'PS6',9);
/*!40000 ALTER TABLE `profesores_asignaturas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-01 23:31:06
