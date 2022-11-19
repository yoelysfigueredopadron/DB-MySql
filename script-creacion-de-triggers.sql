USE universidad;

DROP TABLE IF EXISTS `logs_insert_students`;

CREATE TABLE IF NOT EXISTS `logs_insert_students` (
    id_alumno INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    dni_alumno VARCHAR(8) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    genero CHAR(1),
    estado_civil VARCHAR(15),
    fecha_nacimiento DATE NOT NULL,
    telefono VARCHAR(15),
    correo VARCHAR(50),
    direccion VARCHAR(100) NOT NULL,
    user_insercion VARCHAR(100),
    fecha_insercion DATE,
    hora_insercion TIME    
);

DROP TRIGGER IF EXISTS `tr_after_insert_new_student`;

CREATE TRIGGER `tr_after_insert_new_student`
AFTER INSERT ON `alumnos`
FOR EACH ROW
INSERT INTO `logs_insert_students`
VALUES (NEW.id_alumno, NEW.dni_alumno, NEW.nombres , NEW.apellidos, NEW.genero, NEW.estado_civil, NEW.fecha_nacimiento,
		NEW.telefono, NEW.correo, NEW.direccion, SESSION_USER(), CURRENT_DATE(), CURRENT_TIME());

DROP TABLE IF EXISTS `logs_update_students`;
        
CREATE TABLE IF NOT EXISTS `logs_update_students` (
	id_log_update_student INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT NOT NULL,
    dni_alumno VARCHAR(8) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    genero CHAR(1),
    estado_civil VARCHAR(15),
    fecha_nacimiento DATE NOT NULL,
    telefono VARCHAR(15),
    correo VARCHAR(50),
    direccion VARCHAR(100) NOT NULL,
    user_insercion VARCHAR(100),
    fecha_insercion DATE,
    hora_insercion TIME    
);

DROP TRIGGER IF EXISTS `tr_before_student_update`;

CREATE TRIGGER `tr_before_student_update`
BEFORE UPDATE ON `alumnos`
FOR EACH ROW
INSERT INTO `logs_update_students`
VALUES (NULL, OLD.id_alumno, OLD.dni_alumno, OLD.nombres , OLD.apellidos, OLD.genero, OLD.estado_civil, OLD.fecha_nacimiento,
		OLD.telefono, OLD.correo, OLD.direccion, SESSION_USER(), CURRENT_DATE(), CURRENT_TIME());

DROP TABLE IF EXISTS `logs_delete_students`;

CREATE TABLE IF NOT EXISTS `logs_delete_students` (
	id_log_delete_student INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT NOT NULL,
    dni_alumno VARCHAR(8) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    genero CHAR(1),
    estado_civil VARCHAR(15),
    fecha_nacimiento DATE NOT NULL,
    telefono VARCHAR(15),
    correo VARCHAR(50),
    direccion VARCHAR(100) NOT NULL,
    user_insercion VARCHAR(100),
    fecha_insercion DATE,
    hora_insercion TIME    
);

DROP TRIGGER IF EXISTS `tr_before_student_delete`;

CREATE TRIGGER `tr_before_student_delete`
BEFORE DELETE ON `alumnos`
FOR EACH ROW
INSERT INTO `logs_delete_students`
VALUES (NULL, OLD.id_alumno, OLD.dni_alumno, OLD.nombres , OLD.apellidos, OLD.genero, OLD.estado_civil, OLD.fecha_nacimiento,
		OLD.telefono, OLD.correo, OLD.direccion, SESSION_USER(), CURRENT_DATE(), CURRENT_TIME());