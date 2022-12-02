CREATE DATABASE  IF NOT EXISTS `universidad2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `universidad2`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: universidad2
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
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `id_alumno` int NOT NULL AUTO_INCREMENT,
  `dni_alumno` varchar(8) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `genero` char(1) DEFAULT NULL,
  `estado_civil` varchar(15) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_alumno`),
  UNIQUE KEY `id_alumno` (`id_alumno`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asignaturas`
--

DROP TABLE IF EXISTS `asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignaturas` (
  `cod_asignatura` varchar(10) NOT NULL,
  `asignatura` varchar(50) NOT NULL,
  `unidades` int NOT NULL,
  `cod_carrera` varchar(10) NOT NULL,
  PRIMARY KEY (`cod_asignatura`),
  UNIQUE KEY `cod_asignatura` (`cod_asignatura`),
  KEY `cod_carrera` (`cod_carrera`),
  CONSTRAINT `asignaturas_ibfk_1` FOREIGN KEY (`cod_carrera`) REFERENCES `carreras` (`cod_carrera`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carreras` (
  `cod_carrera` varchar(10) NOT NULL,
  `carrera` varchar(100) DEFAULT NULL,
  `monto` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`cod_carrera`),
  UNIQUE KEY `cod_carrera` (`cod_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_delete_students`
--

DROP TABLE IF EXISTS `logs_delete_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_delete_students` (
  `id_log_delete_student` int NOT NULL AUTO_INCREMENT,
  `id_alumno` int NOT NULL,
  `dni_alumno` varchar(8) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `genero` char(1) DEFAULT NULL,
  `estado_civil` varchar(15) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `user_insercion` varchar(100) DEFAULT NULL,
  `fecha_insercion` date DEFAULT NULL,
  `hora_insercion` time DEFAULT NULL,
  PRIMARY KEY (`id_log_delete_student`),
  UNIQUE KEY `id_log_delete_student` (`id_log_delete_student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_insert_students`
--

DROP TABLE IF EXISTS `logs_insert_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_insert_students` (
  `id_alumno` int NOT NULL AUTO_INCREMENT,
  `dni_alumno` varchar(8) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `genero` char(1) DEFAULT NULL,
  `estado_civil` varchar(15) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `user_insercion` varchar(100) DEFAULT NULL,
  `fecha_insercion` date DEFAULT NULL,
  `hora_insercion` time DEFAULT NULL,
  PRIMARY KEY (`id_alumno`),
  UNIQUE KEY `id_alumno` (`id_alumno`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_update_students`
--

DROP TABLE IF EXISTS `logs_update_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_update_students` (
  `id_log_update_student` int NOT NULL AUTO_INCREMENT,
  `id_alumno` int NOT NULL,
  `old_dni_alumno` varchar(8) NOT NULL,
  `old_nombres` varchar(50) NOT NULL,
  `old_apellidos` varchar(50) NOT NULL,
  `old_genero` char(1) DEFAULT NULL,
  `old_estado_civil` varchar(15) DEFAULT NULL,
  `old_fecha_nacimiento` date NOT NULL,
  `old_telefono` varchar(15) DEFAULT NULL,
  `old_correo` varchar(50) DEFAULT NULL,
  `old_direccion` varchar(100) NOT NULL,
  `user_insercion` varchar(100) DEFAULT NULL,
  `fecha_insercion` date DEFAULT NULL,
  `hora_insercion` time DEFAULT NULL,
  `new_dni_alumno` varchar(8) NOT NULL,
  `new_nombres` varchar(50) NOT NULL,
  `new_apellidos` varchar(50) NOT NULL,
  `new_genero` char(1) DEFAULT NULL,
  `new_estado_civil` varchar(15) DEFAULT NULL,
  `new_fecha_nacimiento` date NOT NULL,
  `new_telefono` varchar(15) DEFAULT NULL,
  `new_correo` varchar(50) DEFAULT NULL,
  `new_direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_log_update_student`),
  UNIQUE KEY `id_log_update_student` (`id_log_update_student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matricula_alumnos`
--

DROP TABLE IF EXISTS `matricula_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula_alumnos` (
  `id_matricula` int NOT NULL AUTO_INCREMENT,
  `cod_carrera` varchar(10) NOT NULL,
  `id_periodo_academico` int NOT NULL,
  `id_alumno` int NOT NULL,
  `fecha_matricula` date DEFAULT NULL,
  PRIMARY KEY (`id_matricula`),
  UNIQUE KEY `id_matricula` (`id_matricula`),
  KEY `cod_carrera` (`cod_carrera`),
  KEY `id_periodo_academico` (`id_periodo_academico`),
  KEY `id_alumno` (`id_alumno`),
  CONSTRAINT `matricula_alumnos_ibfk_1` FOREIGN KEY (`cod_carrera`) REFERENCES `carreras` (`cod_carrera`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matricula_alumnos_ibfk_2` FOREIGN KEY (`id_periodo_academico`) REFERENCES `periodos_academicos` (`id_periodo_academico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matricula_alumnos_ibfk_3` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id_alumno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `id_nota` int NOT NULL AUTO_INCREMENT,
  `id_matricula` int NOT NULL,
  `cod_asignatura` varchar(10) NOT NULL,
  `nota` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`id_nota`),
  UNIQUE KEY `id_nota` (`id_nota`),
  KEY `id_matricula` (`id_matricula`),
  KEY `cod_asignatura` (`cod_asignatura`),
  CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`id_matricula`) REFERENCES `matricula_alumnos` (`id_matricula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`cod_asignatura`) REFERENCES `asignaturas` (`cod_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `periodos_academicos`
--

DROP TABLE IF EXISTS `periodos_academicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodos_academicos` (
  `id_periodo_academico` int NOT NULL AUTO_INCREMENT,
  `periodo` varchar(20) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  PRIMARY KEY (`id_periodo_academico`),
  UNIQUE KEY `id_periodo_academico` (`id_periodo_academico`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profesiones`
--

DROP TABLE IF EXISTS `profesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesiones` (
  `cod_profesion` varchar(10) NOT NULL,
  `profesion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_profesion`),
  UNIQUE KEY `cod_profesion` (`cod_profesion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `id_profesor` int NOT NULL AUTO_INCREMENT,
  `dni_profesor` varchar(8) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `genero` char(1) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `estado_civil` varchar(10) DEFAULT NULL,
  `cod_profesion` varchar(10) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_ingreso` date NOT NULL,
  PRIMARY KEY (`id_profesor`),
  UNIQUE KEY `id_profesor` (`id_profesor`),
  KEY `cod_profesion` (`cod_profesion`),
  CONSTRAINT `profesores_ibfk_1` FOREIGN KEY (`cod_profesion`) REFERENCES `profesiones` (`cod_profesion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profesores_asignaturas`
--

DROP TABLE IF EXISTS `profesores_asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores_asignaturas` (
  `id_profesor_asignatura` int NOT NULL AUTO_INCREMENT,
  `id_profesor` int NOT NULL,
  `cod_asignatura` varchar(10) NOT NULL,
  `id_periodo_academico` int NOT NULL,
  PRIMARY KEY (`id_profesor_asignatura`),
  UNIQUE KEY `id_profesor_asignatura` (`id_profesor_asignatura`),
  KEY `id_profesor` (`id_profesor`),
  KEY `cod_asignatura` (`cod_asignatura`),
  KEY `id_periodo_academico` (`id_periodo_academico`),
  CONSTRAINT `profesores_asignaturas_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `profesores_asignaturas_ibfk_2` FOREIGN KEY (`cod_asignatura`) REFERENCES `asignaturas` (`cod_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `profesores_asignaturas_ibfk_3` FOREIGN KEY (`id_periodo_academico`) REFERENCES `periodos_academicos` (`id_periodo_academico`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-02  0:01:44
