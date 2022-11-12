CREATE DATABASE Universidad;

USE Universidad;

-- creación de tablas
CREATE TABLE Alumnos (
    Id_Alumno int NOT NULL AUTO_INCREMENT,
    DNI_Alumno varchar(8) NOT NULL,
    Nombres varchar(50) NOT NULL,
    Apellidos varchar(50) NOT NULL,
    Genero char(1),
    Estado_Civil varchar(15),
    Fecha_Nacimiento date NOT NULL,
    Telefono varchar(15),
    Correo varchar(50),
    Direccion varchar(100),    
	PRIMARY KEY (Id_Alumno)
);

CREATE TABLE Carreras (
	Id_Carrera int NOT NULL AUTO_INCREMENT,
	Cod_Carrera varchar(15) NOT NULL,    
    Carrera varchar(100),
    PRIMARY KEY (Id_Carrera)
);

CREATE TABLE Asignaturas (
	Id_Asignatura int NOT NULL AUTO_INCREMENT,
	Cod_Asignatura varchar(12) NOT NULL,    
    Asignatura varchar(50) NOT NULL,
    Unidades varchar(15) NOT NULL,
    Id_Carrera int NOT NULL,
    PRIMARY KEY (Id_Asignatura),
    FOREIGN KEY (Id_Carrera) REFERENCES Carreras(Id_Carrera)
);

CREATE TABLE Periodos_Academicos (
	Id_Periodo_Academico int NOT NULL AUTO_INCREMENT,
    Periodo varchar(20),
    Fecha_Inicio date,
    Fecha_Final date,
    PRIMARY KEY (Id_Periodo_Academico)
);

CREATE TABLE Matricula_Alumnos (
	Id_Matricula int NOT NULL AUTO_INCREMENT,
    Id_Carrera int NOT NULL,
    Id_Periodo_Academico int NOT NULL,
    Id_Alumno int NOT NULL,
    Fecha_Matricula date,
    Monto decimal(11, 2),
    PRIMARY KEY (Id_Matricula),
    FOREIGN KEY (Id_Carrera) REFERENCES Carreras(Id_Carrera),
    FOREIGN KEY (Id_Periodo_Academico) REFERENCES Periodos_Academicos(Id_Periodo_Academico),
    FOREIGN KEY (Id_Alumno) REFERENCES Alumnos(Id_Alumno)
);

CREATE TABLE Notas (
	Id_Nota int NOT NULL AUTO_INCREMENT,
    Id_Matricula int NOT NULL,
    Id_Asignatura int NOT NULL,
    Nota decimal(3,1),
    PRIMARY KEY (Id_Nota),
    FOREIGN KEY (Id_Matricula) REFERENCES Matricula_Alumnos(Id_Matricula),
    FOREIGN KEY (Id_Asignatura) REFERENCES Asignaturas(Id_Asignatura)
);

CREATE TABLE Profesiones (
	Id_Profesion int NOT NULL AUTO_INCREMENT,
    Profesion varchar(50),
    Cod_Profesion varchar(12),
    PRIMARY KEY (Id_Profesion)
);

CREATE TABLE Profesores (
    Id_Profesor int NOT NULL AUTO_INCREMENT,
    DNI_Profesor varchar(8) NOT NULL,
    Nombres varchar(50) NOT NULL,
    Apellidos varchar(50) NOT NULL,
    Genero char(1),
    Correo varchar(50),
    Telefono varchar(15),    
    Estado_Civil varchar(15),
    Id_Profesion int NOT NULL,
    Fecha_Nacimiento date NOT NULL,
    Fecha_Ingreso date NOT NULL, 
	PRIMARY KEY (Id_Profesor),
    FOREIGN KEY (Id_Profesion) REFERENCES Profesiones(Id_Profesion)
);

CREATE TABLE Profesores_Asignaturas (
	Id_Profesor_Asignatura int NOT NULL AUTO_INCREMENT,
    Id_Profesor int NOT NULL,
    Id_Asignatura int NOT NULL,
    Id_Periodo_Academico int NOT NULL,
    PRIMARY KEY (Id_Profesor_Asignatura),
    FOREIGN KEY (Id_Profesor) REFERENCES Profesores(Id_Profesor),
    FOREIGN KEY (Id_Asignatura) REFERENCES Asignaturas(Id_Asignatura),
    FOREIGN KEY (Id_Periodo_Academico) REFERENCES Periodos_Academicos(Id_Periodo_Academico)
);

-- Creación de vistas
create or replace view vs_profesores_profesion as
select ps.Nombres, ps.Apellidos, pn.Profesion
from profesores ps
join profesiones pn on (ps.Id_Profesion = pn.Id_Profesion);

create or replace view vs_profesores_asignaturas as
select ps.Nombres, ps.Apellidos, a.Asignatura
from profesores ps
join profesores_asignaturas pa on (ps.Id_Profesor = pa.Id_Profesor)
join asignaturas a on(pa.Id_Asignatura = a.Id_Asignatura);

create or replace view vs_alumnos_carreras as
select a.Nombres, a.Apellidos, c.Carrera
from alumnos a
join matricula_alumnos ma on (a.Id_Alumno = ma.Id_Alumno)
join carreras c on(ma.Id_Carrera = c.Id_Carrera);

create or replace view vs_alumnos_notas as
select a.Nombres, a.Apellidos, n.Nota
from alumnos a
join matricula_alumnos ma on (a.Id_Alumno = ma.Id_Alumno)
join notas n on(n.Id_Matricula = ma.Id_Matricula);

create or replace view vs_profesores_asignaturas_alumnos as
select p.Nombres as Nombre_Profesor, p.Apellidos as Apellido_Profesor, asg.Asignatura, a.Nombres as Nombre_Alumno, a.Apellidos as Apellido_Alumno
from profesores p
join profesores_asignaturas pa on (p.Id_Profesor = pa.Id_Profesor)
join asignaturas asg on (pa.Id_Asignatura = asg.Id_Asignatura)
join notas n on (asg.Id_Asignatura = n.Id_Asignatura)
join matricula_alumnos ma on (n.Id_Matricula = ma.Id_Matricula)
join alumnos a on(ma.Id_Alumno = a.Id_Alumno);