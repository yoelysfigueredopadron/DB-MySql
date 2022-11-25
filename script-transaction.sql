START TRANSACTION;

-- Vemos los registros actuales de la tabla
SELECT * FROM universidad.alumnos;

DELETE FROM alumnos
WHERE id_alumno IN (1,2,3,4,5,6,7,8,9,10);

-- Vemos la tabla luego de eliminar los registros
-- SELECT * FROM universidad.alumnos;

-- Los cambios se desharan si ejecutamos la instruccion ROLLBACK pero si en caso contrario realizamos COMMIT los cambios quedarán permanentes y no se podran deshacer

-- ROLLBACK;
-- COMMIT;
-- En caso de realizar COMMIT si se desean ingresar nuevamente los registros se pueden ejecutar la query de inserta los datos en la tabla 'alumnos'
-- Tener en cuenta que el campo id_alumno es de tipo AUTO_INCREMENT por lo que al insertarlos nuevamente los ids cambiarán en un rango del 11 al 20
-- si se desea insertar con los ids que tenían inicialmente del 1 al 10 se debe correr el script-creacion-de-objetos con el cual se eliminarán la 
-- base de datos univesidad con sus objetos y se crearan nuevamente con los valores de clave primaria por defecto.

-- INSERT INTO alumnos
-- VALUES
--	(null, '15221990','Juan','Galeas','M','Soltero','19940112','88779988','juan@gmail.com','Barrio el Colegio'),
--    (null, '15031992','Francelia','Rodirguez','F','Soltera','19920111','88999988','francelia@gmail.com','Parque Chacabuco'),
--    (null, '16721990','Maria','Gonzales','F','Casada','19950312','55779988','maria@gmail.com','Barrio Butteler'),
--    (null, '13422190','Ernesto','Rivera','M','Casado','19980108','88773388','ernesto@gmail.com','Nueva Pompeya'),
--    (null, '11661990','Martin','Santana','M','Soltero','19930106','44114455','martin@gmail.com','Parque Patricios'),
--    (null, '12881990','Liset','Hernandez','F','Casada','19900104','23779988','liset@gmail.com','Boedo'),
--    (null, '55221990','Jennifer','Herrera','F','Soltera','19940210','55569988','jennifer@gmail.com','Caballito'),
--    (null, '13244990','Susana','Lopez','M','Soltera','19950606','99887654','susana@gmail.com','Villa Crespo'),
--    (null, '56271990','Hector','Jimenez','M','Soltero','19960107','97654321','hector@gmail.com','Colegiales'),
--    (null, '33211990','Pedro','Fernandez','M','Casado','19931224','23234141','pedro@gmail.com','Villa Urquiza');

START TRANSACTION;
INSERT INTO alumnos (id_alumno, dni_alumno, nombres, apellidos, genero, estado_civil, fecha_nacimiento, telefono, correo, direccion)
VALUES (null, '15221990','Juan','Galeas','M','Soltero','19940112','88779988','juan@gmail.com','Barrio el Colegio');
INSERT INTO alumnos (id_alumno, dni_alumno, nombres, apellidos, genero, estado_civil, fecha_nacimiento, telefono, correo, direccion)
VALUES (null, '15221990','Juan','Galeas','M','Soltero','19940112','88779988','juan@gmail.com','Barrio el Colegio');
INSERT INTO alumnos (id_alumno, dni_alumno, nombres, apellidos, genero, estado_civil, fecha_nacimiento, telefono, correo, direccion)
VALUES (null, '15221990','Juan','Galeas','M','Soltero','19940112','88779988','juan@gmail.com','Barrio el Colegio');
INSERT INTO alumnos (id_alumno, dni_alumno, nombres, apellidos, genero, estado_civil, fecha_nacimiento, telefono, correo, direccion)
VALUES (null, '15221990','Juan','Galeas','M','Soltero','19940112','88779988','juan@gmail.com','Barrio el Colegio');
SAVEPOINT primer_grupo_de_cuatro_registros;
INSERT INTO alumnos (id_alumno, dni_alumno, nombres, apellidos, genero, estado_civil, fecha_nacimiento, telefono, correo, direccion)
VALUES (null, '15221990','Juan','Galeas','M','Soltero','19940112','88779988','juan@gmail.com','Barrio el Colegio');
INSERT INTO alumnos (id_alumno, dni_alumno, nombres, apellidos, genero, estado_civil, fecha_nacimiento, telefono, correo, direccion)
VALUES (null, '15221990','Juan','Galeas','M','Soltero','19940112','88779988','juan@gmail.com','Barrio el Colegio');
INSERT INTO alumnos (id_alumno, dni_alumno, nombres, apellidos, genero, estado_civil, fecha_nacimiento, telefono, correo, direccion)
VALUES (null, '15221990','Juan','Galeas','M','Soltero','19940112','88779988','juan@gmail.com','Barrio el Colegio');
INSERT INTO alumnos (id_alumno, dni_alumno, nombres, apellidos, genero, estado_civil, fecha_nacimiento, telefono, correo, direccion)
VALUES (null, '15221990','Juan','Galeas','M','Soltero','19940112','88779988','juan@gmail.com','Barrio el Colegio');
SAVEPOINT segundo_grupo_de_cuatro_registros;

-- Para ver los nuevos registros ingresados en la tabla 'alumnos'
SELECT * FROM universidad.alumnos;

-- Se hace un ROLLBACK para eliminar el segundo grupo de inserciones de registros.
ROLLBACK TO primer_grupo_de_cuatro_registros;

-- Vemos que se eliminaron los ultimos cuatro registros
-- SELECT * FROM universidad.alumnos;