-- Crearemos la base de datos Universidad
DROP DATABASE IF EXISTS `universidad`;

CREATE DATABASE IF NOT EXISTS `universidad`;

USE `universidad`;

-- creación de tablas
DROP TABLE IF EXISTS `alumnos`;

CREATE TABLE IF NOT EXISTS `alumnos` (
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

DROP TABLE IF EXISTS `carreras`;

CREATE TABLE IF NOT EXISTS `carreras` (
	cod_carrera VARCHAR(10) NOT NULL UNIQUE PRIMARY KEY,
	carrera VARCHAR(100),    
    monto DECIMAL(11, 2)
);

DROP TABLE IF EXISTS `periodos_academicos`;

CREATE TABLE IF NOT EXISTS `periodos_academicos` (
	id_periodo_academico INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    periodo VARCHAR(20),
    fecha_inicio DATE,
    fecha_final DATE
);

DROP TABLE IF EXISTS `profesiones`;

CREATE TABLE IF NOT EXISTS `profesiones` (
    cod_profesion VARCHAR(10) NOT NULL UNIQUE PRIMARY KEY ,
	profesion VARCHAR(50)
);

DROP TABLE IF EXISTS `asignaturas`;

CREATE TABLE IF NOT EXISTS `asignaturas` (
	cod_asignatura VARCHAR(10) NOT NULL UNIQUE PRIMARY KEY,    
    asignatura VARCHAR(50) NOT NULL,
    unidades INT NOT NULL,
    cod_carrera VARCHAR(10) NOT NULL,
    FOREIGN KEY (cod_carrera)
        REFERENCES carreras(cod_carrera)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `matricula_alumnos`;

CREATE TABLE IF NOT EXISTS `matricula_alumnos` (
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

DROP TABLE IF EXISTS `notas`;

CREATE TABLE IF NOT EXISTS `notas` (
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

DROP TABLE IF EXISTS `profesores`;

CREATE TABLE IF NOT EXISTS `profesores` (
    id_profesor INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    dni_profesor VARCHAR(8) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    genero CHAR(1),
    correo VARCHAR(50),
    telefono VARCHAR(15),    
    estado_civil VARCHAR(15),
    cod_profesion VARCHAR(10) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fecha_ingreso DATE NOT NULL,
    FOREIGN KEY (cod_profesion)
        REFERENCES profesiones(cod_profesion)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `profesores_asignaturas`;

CREATE TABLE IF NOT EXISTS `profesores_asignaturas` (
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

-- Tablas de logs
DROP TABLE IF EXISTS `logs_insert_alumnos`;

-- Guardamos en logs la insercion de los datos en la tabla "alumnos" ademas del usuario que realizo la insercion, fecha y hora de la misma.
CREATE TABLE IF NOT EXISTS `logs_insert_alumnos` (
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

DROP TABLE IF EXISTS `logs_update_alumnos`;

-- Guardamos los logs del usuario que realizo una actualizacion (user, fecha y hora) de los datos pudiendo verificar el dato que existia "old" y cual fue el nuevo dato ingresado en cada campo en la tabla "alumnos".
CREATE TABLE IF NOT EXISTS `logs_update_alumnos` (
	id_log_update_alumno INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT NOT NULL,
    old_dni_alumno VARCHAR(8) NOT NULL,
    old_nombres VARCHAR(50) NOT NULL,
    old_apellidos VARCHAR(50) NOT NULL,
    old_genero CHAR(1),
    old_estado_civil VARCHAR(15),
    old_fecha_nacimiento DATE NOT NULL,
    old_telefono VARCHAR(15),
    old_correo VARCHAR(50),
    old_direccion VARCHAR(100) NOT NULL,
    user_actualizo VARCHAR(100),
    fecha_actualizo DATE,
    hora_actualizo TIME,
    new_dni_alumno VARCHAR(8) NOT NULL,
    new_nombres VARCHAR(50) NOT NULL,
    new_apellidos VARCHAR(50) NOT NULL,
    new_genero CHAR(1),
    new_estado_civil VARCHAR(15),
    new_fecha_nacimiento DATE NOT NULL,
    new_telefono VARCHAR(15),
    new_correo VARCHAR(50),
    new_direccion VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS `logs_delete_alumnos`;

-- Guardamos los logs del usuario que elimino informacion(registros) de la tabla alumnos. Vamos a consevar todos los datos existentes del registo ademas del usuario,
-- fecha y hora en la que se realizo la acción en la tabla "alumnos".
CREATE TABLE IF NOT EXISTS `logs_delete_alumnos` (
	id_log_delete_alumno INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
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
    user_borro VARCHAR(100),
    fecha_borrado DATE,
    hora_borrado TIME    
);

DROP TABLE IF EXISTS `logs_insert_profesores`;

-- Guardamos en los logs los datos insertados en la tabla "profesores" ademas del usuario, fecha y hora en que se insertaron los datos.
CREATE TABLE IF NOT EXISTS `logs_insert_profesores` (
    id_profesor INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    dni_profesor VARCHAR(8) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    genero CHAR(1),
    correo VARCHAR(50),
    telefono VARCHAR(15),
    estado_civil VARCHAR(15),
    cod_profesion VARCHAR(10),    
    fecha_nacimiento DATE NOT NULL,
    fecha_ingreso DATE NOT NULL,
    user_insercion VARCHAR(100),
    fecha_insercion DATE,
    hora_insercion TIME    
);

DROP TABLE IF EXISTS `logs_update_profesores`;

-- Guardamos los logs del usuario que realizo una actualizacion en la tabla "profesores" pudiendo verificar el dato que existia "old"
-- y cual fue el nuevo dato "new" ingresado en cada campo teniendo un control de los datos actualizados.
CREATE TABLE IF NOT EXISTS `logs_update_profesores` (
	id_log_update_profesor INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_profesor INT NOT NULL,
    old_dni_profesor VARCHAR(8) NOT NULL,
    old_nombres VARCHAR(50) NOT NULL,
    old_apellidos VARCHAR(50) NOT NULL,
    old_genero CHAR(1),
    old_correo VARCHAR(50),
    old_telefono VARCHAR(15),
    old_estado_civil VARCHAR(15),
    old_cod_profesion varchar(10),
    old_fecha_nacimiento DATE NOT NULL,
    old_fecha_ingreso DATE NOT NULL,
    user_actualizo VARCHAR(100),
    fecha_actualizo DATE,
    hora_actualizo TIME,
    new_dni_profesor VARCHAR(8) NOT NULL,
    new_nombres VARCHAR(50) NOT NULL,
    new_apellidos VARCHAR(50) NOT NULL,
    new_genero CHAR(1),
    new_correo VARCHAR(50),
    new_telefono VARCHAR(15),
    new_estado_civil VARCHAR(15),
    new_cod_profesion VARCHAR(10),
    new_fecha_nacimiento DATE NOT NULL,
    new_fecha_ingreso DATE NOT NULL
);

DROP TABLE IF EXISTS `logs_delete_profesores`;

-- Guardamos los logs del usuario que elimino informacion(registros) de la tabla "profesores". Vamos a consevar todos los datos existentes del registo ademas del usuario,
-- fecha y hora en la que se realizo la acción de eliminacion.
CREATE TABLE IF NOT EXISTS `logs_delete_profesores` (
	id_log_delete_profesor INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_profesor INT NOT NULL,
    dni_profesor VARCHAR(8) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    genero CHAR(1),
    correo VARCHAR(50),
    telefono VARCHAR(15),
    estado_civil VARCHAR(15),
    cod_profesion VARCHAR(10),    
    fecha_nacimiento DATE NOT NULL,
    fecha_ingreso DATE NOT NULL,
    user_borro VARCHAR(100),
    fecha_borrado DATE,
    hora_borrado TIME    
);

-- Creacion de triggers
DROP TRIGGER IF EXISTS `tr_after_insert_nuevo_alumno`;

CREATE TRIGGER `tr_after_insert_nuevo_alumno`
AFTER INSERT ON `alumnos`
FOR EACH ROW
INSERT INTO `logs_insert_alumnos`
VALUES (NEW.id_alumno, NEW.dni_alumno, NEW.nombres , NEW.apellidos, NEW.genero, NEW.estado_civil, NEW.fecha_nacimiento,
		NEW.telefono, NEW.correo, NEW.direccion, SESSION_USER(), CURRENT_DATE(), CURRENT_TIME());
        
DROP TRIGGER IF EXISTS `tr_before_update_alumno`;

CREATE TRIGGER `tr_before_update_alumno`
BEFORE UPDATE ON `alumnos`
FOR EACH ROW
INSERT INTO `logs_update_alumnos`
VALUES (NULL, OLD.id_alumno, OLD.dni_alumno, OLD.nombres , OLD.apellidos, OLD.genero, OLD.estado_civil, OLD.fecha_nacimiento,
		OLD.telefono, OLD.correo, OLD.direccion, SESSION_USER(), CURRENT_DATE(), CURRENT_TIME(), NEW.dni_alumno, NEW.nombres , NEW.apellidos,
        NEW.genero, NEW.estado_civil, NEW.fecha_nacimiento, NEW.telefono, NEW.correo, NEW.direccion);
        
DROP TRIGGER IF EXISTS `tr_before_delete_alumno`;

CREATE TRIGGER `tr_before_delete_alumno`
BEFORE DELETE ON `alumnos`
FOR EACH ROW
INSERT INTO `logs_delete_alumnos`
VALUES (NULL, OLD.id_alumno, OLD.dni_alumno, OLD.nombres , OLD.apellidos, OLD.genero, OLD.estado_civil, OLD.fecha_nacimiento,
		OLD.telefono, OLD.correo, OLD.direccion, SESSION_USER(), CURRENT_DATE(), CURRENT_TIME());
        
DROP TRIGGER IF EXISTS `tr_after_insert_nuevo_profesor`;

CREATE TRIGGER `tr_after_insert_nuevo_profesor`
AFTER INSERT ON `profesores`
FOR EACH ROW
INSERT INTO `logs_insert_profesores`
VALUES (NEW.id_profesor, NEW.dni_profesor, NEW.nombres , NEW.apellidos, NEW.genero, NEW.correo, NEW.telefono, NEW.estado_civil,
		NEW.cod_profesion, NEW.fecha_nacimiento, NEW.fecha_ingreso, SESSION_USER(), CURRENT_DATE(), CURRENT_TIME());

DROP TRIGGER IF EXISTS `tr_before_update_profesor`;

CREATE TRIGGER `tr_before_update_profesor`
BEFORE UPDATE ON `profesores`
FOR EACH ROW
INSERT INTO `logs_update_profesores`
VALUES (NULL, OLD.id_profesor, OLD.dni_profesor, OLD.nombres , OLD.apellidos, OLD.genero, OLD.correo, OLD.telefono, OLD.estado_civil, OLD.cod_profesion,
		OLD.fecha_nacimiento, OLD.fecha_ingreso, SESSION_USER(), CURRENT_DATE(), CURRENT_TIME(), NEW.dni_profesor, NEW.nombres, NEW.apellidos,
        NEW.genero, NEW.correo, NEW.telefono, NEW.estado_civil, NEW.cod_profesion, NEW.fecha_nacimiento, NEW.fecha_ingreso);

DROP TRIGGER IF EXISTS `tr_before_delete_profesor`;

CREATE TRIGGER `tr_before_delete_profesor`
BEFORE DELETE ON `profesores`
FOR EACH ROW
INSERT INTO `logs_delete_profesores`
VALUES (NULL, OLD.id_profesor, OLD.dni_profesor, OLD.nombres, OLD.apellidos, OLD.genero, OLD.correo, OLD.telefono, OLD.estado_civil, OLD.cod_profesion,
		OLD.fecha_nacimiento, OLD.fecha_ingreso, SESSION_USER(), CURRENT_DATE(), CURRENT_TIME());        

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
					SELECT round(AVG(nota),1) AS 'Promedio Estudiante'
                    FROM notas
                    WHERE Id_Matricula = matricula_id
				  );
		
	RETURN result;
END$$

DROP PROCEDURE IF EXISTS `sp_get_lista_estudiantes`$$

CREATE PROCEDURE `sp_get_lista_estudiantes` (IN field VARCHAR(20), IN my_order VARCHAR(4))

-- creamos el parametro de ordenamiento de la lista de estudiantes. 
-- Se podrá ordenar por cualquier campo de la tabla alumnos, ejemplo: id_alumno, dni_alumno, nombres, apellidos, genero, estado_civil, fecha_nacimiento, telefono, correo, direccion
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
DROP PROCEDURE IF EXISTS `sp_set_alumno`$$

CREATE PROCEDURE `sp_set_alumno` (IN dniAlumno VARCHAR(8), IN nombres VARCHAR(50), IN apellidos VARCHAR(50), IN genero CHAR(1), IN estadoCivil VARCHAR(15),
									   IN fechaNacimiento DATE, IN telefono VARCHAR(15), IN correo VARCHAR(50), IN direccion VARCHAR(100))
BEGIN
    INSERT INTO alumnos (dni_alumno, nombres, apellidos, genero, estado_civil, fecha_nacimiento, telefono, correo, direccion)
    VALUES (dniAlumno, nombres, apellidos, genero, estadoCivil, fechaNacimiento, telefono, correo, direccion);
END$$

-- Procedimiento almacenado que agrega un profesor a la tabla profesores
-- Se deberá agregar un codigo de profesion 'cod_profesion' de la tabla profesiones para el campo con el mismo nombre en la tabla profesores
DROP PROCEDURE IF EXISTS `sp_set_profesor`$$

CREATE PROCEDURE `sp_set_profesor` (IN dniProfesor VARCHAR(8), IN nombres VARCHAR(50), IN apellidos VARCHAR(50), IN genero CHAR(1), IN correo VARCHAR(50),
									IN telefono VARCHAR(15), IN estadoCivil VARCHAR(15), IN codProfesion VARCHAR(10), IN fechaNacimiento DATE, IN fechaIngreso DATE)
BEGIN
    INSERT INTO profesores (dni_profesor, nombres, apellidos, genero, correo, telefono, estado_civil, cod_profesion, fecha_nacimiento, fecha_ingreso)
    VALUES (dniProfesor, nombres, apellidos, genero, correo, telefono, estadoCivil, codProfesion, fechaNacimiento, fechaIngreso);
END$$

DROP PROCEDURE IF EXISTS `sp_get_promedio_estudiante`$$

-- obtenemos el promedio de un estudiante especificando su id de matricula, ejemplo (1, 2, 3)
CREATE PROCEDURE `sp_get_promedio_estudiante` (IN idMatricula INT)

BEGIN
	IF EXISTS(SELECT id_matricula FROM matricula_alumnos WHERE id_matricula = idMatricula) THEN        
        SELECT CONCAT_WS(' ', A.nombres, A.apellidos) AS Alumno, C.carrera AS Carrera, promedio_estudiante(idMatricula) AS Promedio
		FROM alumnos AS A INNER JOIN matricula_alumnos AS MA ON A.id_alumno = MA.id_alumno
						  INNER JOIN carreras AS C ON MA.cod_carrera = C.cod_carrera
						  INNER JOIN notas AS N ON MA.id_matricula = N.id_matricula
		WHERE MA.id_matricula = idMatricula
		GROUP BY MA.id_matricula;
	ELSE
		SELECT CONCAT('Error: ', 'No se ha introducido un id de matricula valido.') AS 'Error';
    END IF;    
END$$

DELIMITER ;

-- Creación de vistas
-- Mostramos la lista de profesores con sus profesiones
CREATE OR REPLACE VIEW vs_profesores_profesion AS
SELECT CONCAT_WS(' ', PS.nombres, PS.apellidos) AS Profesor, PN.profesion AS Profesion
FROM profesores AS PS
JOIN profesiones AS PN ON (PS.cod_profesion = PN.cod_profesion);

-- Mostramos la lista de profesores con las asignaturas que imparten
CREATE OR REPLACE VIEW vs_profesores_asignaturas AS
SELECT CONCAT_WS(' ', PS.nombres, PS.apellidos) AS Profesor, A.asignatura AS Asignatua
FROM profesores AS PS
JOIN profesores_asignaturas AS PA ON (PS.id_profesor = PA.id_profesor)
JOIN asignaturas AS A ON (PA.cod_asignatura = A.cod_asignatura);

-- Mostramos listado de alumnos en las carreras y la carreras que estudian
CREATE OR REPLACE VIEW vs_alumnos_carreras AS
SELECT CONCAT_WS(' ', A.nombres, A.apellidos) AS Alumno, C.carrera AS Carrera
FROM alumnos AS A
JOIN matricula_alumnos AS MA ON (A.id_alumno = MA.id_alumno)
JOIN carreras AS C ON (MA.cod_carrera = C.cod_carrera);

-- Se muestra un listado de alumnos con sus respectivas notas por asignatura
CREATE OR REPLACE VIEW vs_alumnos_notas AS
SELECT CONCAT_WS(' ', A.nombres, A.apellidos) AS Alumno, ASG.asignatura AS Asignatura, N.nota AS Nota
FROM alumnos AS A
JOIN matricula_alumnos AS MA ON (A.id_alumno = MA.id_alumno)
JOIN notas AS N ON (N.id_matricula = MA.id_matricula)
JOIN asignaturas AS ASG ON (ASG.cod_asignatura = N.cod_asignatura);

-- Mostramos cantidad de alumnos que tiene un profesor por asignatura
CREATE OR REPLACE VIEW vs_cantidad_alumnos_por_asignatura AS
SELECT CONCAT_WS(' ', P.Nombres, P.Apellidos) AS Profesor, ASG.asignatura AS Asignatura, COUNT(MA.id_matricula) AS 'Cantidad Alumnos'
FROM profesores AS P
JOIN profesores_asignaturas AS PA ON (P.id_profesor = PA.id_profesor)
JOIN asignaturas AS ASG ON (PA.cod_asignatura = ASG.cod_asignatura)
JOIN notas AS N ON (ASG.cod_asignatura = N.cod_asignatura)
JOIN matricula_alumnos AS MA ON (N.id_matricula = MA.id_matricula)
GROUP BY Asignatura;

-- Mostramos la cantidad de asignaturas que tiene una carrera universitaria
CREATE OR REPLACE VIEW vs_asignaturas_carrera AS
SELECT C.carrera, COUNT(A.cod_asignatura) AS 'Cantidad Asignaturas'
FROM carreras AS C INNER JOIN asignaturas AS A ON C.cod_carrera = A.cod_carrera
GROUP BY C.carrera;

-- En la vista motramos más información de los estudiantes matriculados en las carreras
CREATE OR REPLACE VIEW vs_alumnos_matriculados AS
SELECT A.dni_alumno, A.nombres, A.apellidos, A.genero, C.carrera
FROM alumnos AS A INNER JOIN matricula_alumnos AS MA ON A.id_alumno = MA.id_alumno
				  INNER JOIN carreras AS C ON MA.cod_carrera = C.cod_carrera;

-- Mostramos la cantidad de alumnos que estan matriculados en las carreras universitarias
CREATE OR REPLACE VIEW vs_cantidad_alumnos_matriculados AS
SELECT C.carrera, COUNT(MA.id_matricula) AS 'Cantidad Alumnos'
FROM alumnos AS A INNER JOIN matricula_alumnos AS MA ON A.id_alumno = MA.id_alumno
				  INNER JOIN carreras AS C ON MA.cod_carrera = C.cod_carrera
GROUP BY C.carrera;

-- Mostramos el total de alumnos matriculados en la universidad agrupados por genero y por carrera universitaria
CREATE OR REPLACE VIEW vs_agrupados_por_genero_y_carrera AS
SELECT C.carrera, A.genero, COUNT(A.id_alumno) AS 'Total'
FROM alumnos AS A INNER JOIN matricula_alumnos AS MA ON A.id_alumno = MA.id_alumno
				  INNER JOIN carreras AS C ON MA.cod_carrera = C.cod_carrera
GROUP BY A.genero, C.carrera;

-- Mostramos el total de alumnos matriculados en la univerdad agrupados por genero
CREATE OR REPLACE VIEW vs_matriculados_por_genero AS
SELECT A.genero, COUNT(A.id_alumno) AS 'Total'
FROM alumnos AS A INNER JOIN matricula_alumnos AS MA ON A.id_alumno = MA.id_alumno
				  INNER JOIN carreras AS C ON MA.cod_carrera = C.cod_carrera
GROUP BY A.genero;

-- Listado de carreras con IVA precio final, utilizamos una funcion definida por mi con el nombre "precio_iva" a la misma le pasamos dos parametros (precio, iva)
CREATE OR REPLACE VIEW vs_carreras_precio AS
SELECT C.carrera, CONCAT('$ ', precio_iva(C.monto, 21)) AS 'Precio Totasl a Pagar'
FROM carreras AS C;

-- Mostramos el listado de estudiantes por carreras con sus promedios
CREATE OR REPLACE VIEW vs_promedio_carreras AS
SELECT CONCAT_WS(' ', A.nombres, A.apellidos) AS Alumno, C.carrera AS Carrera, round(AVG(N.nota),1) AS 'Promedio Estudiante'
FROM alumnos AS A INNER JOIN matricula_alumnos AS MA ON A.id_alumno = MA.id_alumno
				  INNER JOIN carreras AS C ON MA.cod_carrera = C.cod_carrera
                  INNER JOIN notas AS N ON MA.id_matricula = N.id_matricula
GROUP BY MA.id_matricula;

-- Creando roles
-- DROP ROLE IF EXISTS 'read_permissions', 'write_permissions', 'developer_permissions';

-- CREATE ROLE 'read_permissions', 'write_permissions', 'developer_permissions';

-- Agregando permisos a los roles
-- GRANT ALL ON universidad.* TO 'developer_permissions';
-- GRANT SELECT ON universidad.* TO 'read_permissions';
-- GRANT INSERT, UPDATE ON universidad.* TO 'write_permissions';

-- creando usuarios desarrolladores que tendran todos los permisos
-- CREATE USER 'yoelys_dev1'@'localhost' IDENTIFIED WITH mysql_native_password BY 'dev1pass';
-- CREATE USER 'yoelys_dev2'@'localhost' IDENTIFIED WITH mysql_native_password BY 'dev2pass';
-- CREATE USER 'yoelys_dev3'@'localhost' IDENTIFIED WITH mysql_native_password BY 'dev3pass';

-- creando usuarios que solo tendrán permisos de lectura
-- CREATE USER 'yoelys_readonly1'@'localhost' IDENTIFIED WITH mysql_native_password BY 'readonly_user1pass';
-- CREATE USER 'yoelys_readonly2'@'localhost' IDENTIFIED WITH mysql_native_password BY 'readonly_user2pass';
-- CREATE USER 'yoelys_readonly3'@'localhost' IDENTIFIED WITH mysql_native_password BY 'readonly_user3pass';

-- creando usuarios que tendrán permisos de lectura y escritura
-- CREATE USER 'yoelys_readwrite1'@'localhost' IDENTIFIED WITH mysql_native_password BY 'readwrite1_userpass';
-- CREATE USER 'yoelys_readwrite2'@'localhost' IDENTIFIED WITH mysql_native_password BY 'readwrite2_userpass';
-- CREATE USER 'yoelys_readwrite3'@'localhost' IDENTIFIED WITH mysql_native_password BY 'readwrite3_userpass';

-- Agregando usuarios a grupos(roles)
-- GRANT 'developer_permissions' TO 'yoelys_dev1'@'localhost', 'yoelys_dev2'@'localhost', 'yoelys_dev3'@'localhost';
-- GRANT 'read_permissions' TO 'yoelys_readonly1'@'localhost', 'yoelys_readonly2'@'localhost', 'yoelys_readonly3'@'localhost';
-- GRANT 'write_permissions' TO 'yoelys_readwrite1'@'localhost', 'yoelys_readwrite2'@'localhost', 'yoelys_readwrite3'@'localhost';

-- activamos los roles por defecto para cuando se logen los usuarios
-- SET DEFAULT ROLE ALL TO
-- 	'yoelys_dev1'@'localhost',
--    'yoelys_dev2'@'localhost',
--    'yoelys_dev3'@'localhost',
--    'yoelys_readonly1'@'localhost',
--    'yoelys_readonly2'@'localhost',
--    'yoelys_readonly3'@'localhost',
--    'yoelys_readwrite1'@'localhost',
--    'yoelys_readwrite2'@'localhost',
--    'yoelys_readwrite3'@'localhost';

-- revisamos que se hallan creados los usuarios en la base de datos 'mysql' en la tabla 'user'
-- SELECT * FROM mysql.user
-- WHERE user LIKE 'yoelys%';

-- Eliminamos los usuarios
-- DROP USER 'yoelys_dev1'@'localhost',
--		  'yoelys_dev2'@'localhost',
--		  'yoelys_dev3'@'localhost',
--		  'yoelys_readonly1'@'localhost',
--		  'yoelys_readonly2'@'localhost',
--		  'yoelys_readonly3'@'localhost',
--		  'yoelys_readwrite1'@'localhost',
--		  'yoelys_readwrite2'@'localhost',
--		  'yoelys_readwrite3'@'localhost';
