-- Crearemos la base de datos Universidad
CREATE DATABASE IF NOT EXISTS Universidad;

USE Universidad;

-- creación de tablas
CREATE TABLE IF NOT EXISTS alumnos (
    id_alumno INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    dni_alumno VARCHAR(8) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    genero CHAR(1),
    estado_civil VARCHAR(15),
    fecha_nacimiento DATE NOT NULL,
    telefono VARCHAR(15),
    correo VARCHAR(50),
    direccion VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS carreras (
	cod_carrera VARCHAR(10) NOT NULL UNIQUE PRIMARY KEY,
	carrera VARCHAR(100),    
    monto DECIMAL(11, 2)
);

CREATE TABLE IF NOT EXISTS periodos_academicos (
	id_periodo_academico INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    periodo VARCHAR(20),
    fecha_inicio DATE,
    fecha_final DATE
);

CREATE TABLE IF NOT EXISTS profesiones (
    cod_profesion VARCHAR(10) NOT NULL UNIQUE PRIMARY KEY ,
	profesion VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS asignaturas (
	cod_asignatura VARCHAR(10) NOT NULL UNIQUE PRIMARY KEY,    
    asignatura VARCHAR(50) NOT NULL,
    unidades INT NOT NULL,
    cod_carrera VARCHAR(10) NOT NULL,
    FOREIGN KEY (cod_carrera)
        REFERENCES carreras(cod_carrera)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS matricula_alumnos (
	id_matricula INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    cod_carrera VARCHAR(10) NOT NULL,
    id_periodo_academico INT NOT NULL,
    id_alumno INT NOT NULL,
    fecha_matricula DATE,
	FOREIGN KEY (cod_carrera)
        REFERENCES carreras(cod_carrera)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (id_periodo_academico)
        REFERENCES periodos_academicos(id_periodo_academico)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (id_alumno)
        REFERENCES alumnos(id_alumno)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS notas (
	id_nota INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT NOT NULL,
    cod_asignatura VARCHAR(10) NOT NULL,
    nota DECIMAL(3,1),
    FOREIGN KEY (id_matricula)
        REFERENCES matricula_alumnos(id_matricula)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (cod_asignatura)
        REFERENCES asignaturas(cod_asignatura)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS profesores (
    id_profesor INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    dni_profesor VARCHAR(8) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    genero CHAR(1),
    correo VARCHAR(50),
    telefono VARCHAR(15),    
    estado_civil VARCHAR(10),
    cod_profesion VARCHAR(10) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fecha_ingreso DATE NOT NULL,
    FOREIGN KEY (cod_profesion)
        REFERENCES profesiones(cod_profesion)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS profesores_asignaturas (
	id_profesor_asignatura INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_profesor INT NOT NULL,
    cod_asignatura VARCHAR(10) NOT NULL,
    id_periodo_academico INT NOT NULL,
    FOREIGN KEY (id_profesor)
        REFERENCES profesores(id_profesor)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (cod_asignatura)
        REFERENCES asignaturas(cod_asignatura)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (id_periodo_academico)
        REFERENCES periodos_academicos(id_periodo_academico)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Creación de vistas
CREATE OR REPLACE VIEW vs_profesores_profesion AS
SELECT ps.nombres, ps.apellidos, pn.profesion
FROM profesores ps
JOIN profesiones pn ON (ps.cod_profesion = pn.cod_profesion);

CREATE OR REPLACE VIEW vs_profesores_asignaturas AS
SELECT ps.nombres, ps.apellidos, a.asignatura
FROM profesores ps
JOIN profesores_asignaturas pa ON (ps.id_profesor = pa.id_profesor)
JOIN asignaturas a ON (pa.cod_asignatura = a.cod_asignatura);

CREATE OR REPLACE VIEW vs_alumnos_carreras AS
SELECT a.nombres, a.apellidos, c.carrera
FROM alumnos a
JOIN matricula_alumnos ma ON (a.id_alumno = ma.id_alumno)
JOIN carreras c ON (ma.cod_carrera = c.cod_carrera);

CREATE OR REPLACE VIEW vs_alumnos_notas AS
SELECT a.nombres, a.apellidos, n.nota
FROM alumnos a
JOIN matricula_alumnos ma ON (a.id_alumno = ma.id_alumno)
JOIN notas n ON (n.id_matricula = ma.id_matricula);

CREATE OR REPLACE VIEW vs_profesores_asignaturas_alumnos AS
SELECT p.Nombres AS Nombre_Profesor, p.Apellidos AS Apellido_Profesor, asg.Asignatura, a.Nombres AS Nombre_Alumno, a.Apellidos AS Apellido_Alumno
FROM profesores p
JOIN profesores_asignaturas pa ON (p.id_profesor = pa.id_profesor)
JOIN asignaturas asg ON (pa.cod_asignatura = asg.cod_asignatura)
JOIN notas n ON (asg.cod_asignatura = n.cod_asignatura)
JOIN matricula_alumnos ma ON (n.id_matricula = ma.id_matricula)
JOIN alumnos a ON (ma.id_alumno = a.id_alumno);

DELIMITER $$

DROP FUNCTION IF EXISTS `precio_iva`$$
-- Se calcula el precio de un producto o servivio con el iva incluido. 
-- Se utilizará para calcular el precio con iva de la carreras de los estudiantes
-- Se le pasaran dos parametros (precio, iva) respectivamente
CREATE FUNCTION `precio_iva`(precio DECIMAL(11,2), iva INT)

RETURNS DECIMAL(11,2)
NO SQL

BEGIN
	DECLARE result DECIMAL(11,2);    
    SET result = precio * ((iva / 100) + 1);    
    RETURN result;
END$$

DROP FUNCTION IF EXISTS `promedio_estudiante`$$
-- Se calcula el promedio de las notas de un estudiante indicando el id_matricula que corresponde al mismo
-- Se puede probar con el valor 1 para id_matricula ya que es el unico estudiante actual con notas ingresadas
CREATE FUNCTION `promedio_estudiante`(matricula_id INT)

RETURNS DECIMAL(3,1)
READS SQL DATA

BEGIN
	DECLARE result DECIMAL(3,1);

	SET result = (
					SELECT round(AVG(nota),1) AS promedio_estudiante
                    FROM notas
                    WHERE Id_Matricula = matricula_id
				  );
		
	RETURN result;
END$$

DROP PROCEDURE IF EXISTS `sp_get_lista_estudiantes`$$

CREATE PROCEDURE `sp_get_lista_estudiantes` (IN field VARCHAR(20), IN my_order VARCHAR(4))

-- creamos el parametro de ordenamiento de la lista de estudiantes. 
-- Se podrá ordenar por cualquier campo de la tabla alumnos, ejemplo: id_alumno, dni_alumno, nombres, apellidos, etc
BEGIN
	IF field <> '' THEN
		SET @ordenar_lista = concat_ws(' ', 'order by', field, my_order);
	ELSE
		SET @ordenar_lista = '';
    END IF;
    
    -- Armamos la clausula de select
	SET @clausula = concat_ws(' ', 'select * from alumnos', @ordenar_lista);
    
    -- Preparamos y ejecutamos la query del select ya armada
    PREPARE ejecutar FROM @clausula;
    EXECUTE ejecutar;
    DEALLOCATE PREPARE ejecutar;

END$$

-- Procedimiento almacenado que agrega estudiantes a la tabla alumnos
DROP PROCEDURE IF EXISTS `sp_set_estudiantes`$$

CREATE PROCEDURE `sp_set_estudiantes` (IN dniAlumno VARCHAR(8), IN nombres VARCHAR(50), IN apellidos VARCHAR(50), IN genero CHAR(1), IN estadoCivil VARCHAR(15),
									   IN fechaNacimiento DATE, IN telefono VARCHAR(15), IN correo VARCHAR(50), IN direccion VARCHAR(100))
BEGIN
    INSERT INTO alumnos (dmi_alumno, nombres, apellidos, genero, estado_civil, fecha_nacimiento, telefono, correo, direccion)
    VALUES (dniAlumno, nombres, apellidos, genero, estadoCivil, fechaNacimiento, telefono, correo, direccion);
END$$

DELIMITER ;