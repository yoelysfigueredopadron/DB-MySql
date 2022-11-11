use universidad;

insert into profesiones
values 
	(null, 'Master en Gerstion de Tecnologias', 'MGT'),
	(null, 'Lic. en Comercio Internacional', 'LCI'),
    (null, 'Ingeniero En Sistemas', 'IES'),
    (null, 'Lic. en Psicologia', 'LPS'),
    (null, 'Lic. en Derecho', 'LED');

insert into profesores
values
	(null, '15191990', 'Jairo S', 'Galeas F', 'M', 'hola@jairogaleas.com', '27990012', 'Casado', 1, '19900112', '20120519'),
	(null, '15191991', 'Doris', 'Guzman', 'F', 'gdoris@gmail.com', '27990123', 'Casada', 2, '19800219', '20110110'),
    (null, '15031988', 'Angel', 'Zelaya', 'M', 'azelaya@gmail.com', '88445522', 'Casado', 3, '19880225', '20140120'),    
    (null, '15031978', 'Carlos', 'Perez', 'M', 'c.perez@gmail.com', '99887766', 'Soltero', 3, '19780420', '20140418'),
	(null, '15031986', 'Carlos', 'Velasquez', 'M', 'c.velasquez@gmail.com', '55668844', 'Casado', 3, '19860421', '20150520'),
    (null, '15031985', 'Diana', 'Peralta', 'F', 'peralta.diana@gmail.com', '99989796', 'Soltera', 4, '19850511', '20160120'),
    (null, '15031983', 'Maria', 'Funez', 'F', 'mariafunez1@gmail.com', '97989786', 'Casada', 4, '19850818', '20160120'),
	(null, '08011990', 'Victor', 'Acosta', 'M', 'acosvict@yahoo.com', '88989986', 'Soltero', 4, '19900621', '20170912'),
    (null, '01011968', 'Juan', 'Zavala', 'M', 'jzavala28@yahoo.com', '77889886', 'Casado', 5, '19680529', '20170903');
    
insert into alumnos
values
	(null, '15221990','Juan','Galeas','M','Soltero','19940112','88779988','juan@gmail.com','Barrio el Colegio'),
    (null, '15031992','Francelia','Rodirguez','F','Soltera','19920111','88999988','francelia@gmail.com','Parque Chacabuco'),
    (null, '16721990','Maria','Gonzales','F','Casada','19950312','55779988','maria@gmail.com','Barrio Butteler'),
    (null, '13422190','Ernesto','Rivera','M','Casado','19980108','88773388','ernesto@gmail.com','Nueva Pompeya'),
    (null, '11661990','Martin','Santana','M','Soltero','19930106','44114455','martin@gmail.com','Parque Patricios'),
    (null, '12881990','Liset','Hernandez','F','Casada','19900104','23779988','liset@gmail.com','Boedo'),
    (null, '55221990','Jennifer','Herrera','F','Soltera','19940210','55569988','jennifer@gmail.com','Caballito'),
    (null, '13244990','Susana','Lopez','M','Soltera','19950606','99887654','susana@gmail.com','Villa Crespo'),
    (null, '56271990','Hector','Jimenez','M','Soltero','19960107','97654321','hector@gmail.com','Colegiales'),
    (null, '33211990','Pedro','Fernandez','M','Casado','19931224','23234141','pedro@gmail.com','Villa Urquiza');
    
insert into carreras
values
	(null, 'AA-001', 'Ingenieria en Sistemas'),
    (null, 'AA-002', 'Licenciatura en Administracion de Empresas'),
    (null, 'AA-003', 'Licenciatura en Derecho'),
    (null, 'AA-004', 'Licenciatura en Mercadotecnia'),
    (null, 'AA-005', 'Licenciatura en Psicologia'),
    (null, 'AA-006', 'Licenciatura en Teologia'),
    (null, 'AA-007', 'Licenciatura en Informatica'),
    (null, 'AA-008', 'Laboratorio Clinico');
    
insert into periodos_academicos
values
	(null, 'Primero', '20190204', '20190508'),
	(null, 'Segundo', '20190527', '20190819'),
	(null, 'Tercero', '20190916', '20191220'),
    (null, 'Primero', '20200204', '20200508'),
	(null, 'Segundo', '20200527', '20200819'),
	(null, 'Tercero', '20200916', '20201220'),
    (null, 'Primero', '20210204', '20210508'),
	(null, 'Segundo', '20210527', '20210819'),
	(null, 'Tercero', '20210916', '20211220');
    
insert into matricula_alumnos
values
	(null, 1, 1, 3, '20180905', 80000),
    (null, 1, 1, 1, '20181023', 80000),
    (null, 1, 1, 2, '20180925', 80000),
    (null, 2, 3, 7, '20190602', 90000),
    (null, 3, 2, 8, '20181205', 85000),
    (null, 4, 5, 9, '20200105', 70000),
    (null, 5, 6, 4, '20200710', 75000),
    (null, 6, 6, 5, '20200620', 100000),
    (null, 7, 8, 6, '20201120', 95000),
    (null, 7, 8, 10, '20201205', 95000);

-- Asignaturas de Ingenieria
insert into asignaturas
values
    (null, 'MM1', 'Matematica I', 5, 1),
	(null, 'MM2', 'Matematica II', 5, 1),
	(null, 'PG1', 'Programacion I', 4, 1),
	(null, 'PG2', 'Programacion Logica', 4, 1),
	(null, 'PG3', 'Programacion Funcional', 4, 1),
	(null, 'PG4', 'Programacion Orientada a Objetos', 4, 1),
	(null, 'PG5', 'Programacion Web', 4, 1),
	(null, 'PG6', 'Desarrollo de Aplicaciones Web', 4, 1),
	(null, 'PG7', 'Bases de Datos I', 4, 1),
	(null, 'PG8', 'Laboratorio de Bases de Datos', 4, 1),
	(null, 'PG9', 'Diseño Web ', 4, 1),
	(null, 'PG10', 'Analisis de Algoritmos', 4, 1),
	(null, 'PG11', 'Analisis de Sistemas', 4, 1),
	(null, 'PMG12', 'Calculo I', 4, 1),
	(null, 'PMG13', 'Algebra Lineal', 4, 1),
	(null, 'PMG14', 'Teoria de Algoritmos', 4, 1);

-- Asignaturas de Psicologia    
insert into asignaturas
values
    (null, 'PS1', 'Psicologia', 4, 5),
	(null, 'PS2', 'Psicologia Educativa', 4, 5),
	(null, 'PS3', 'Psicologia Emocional', 4, 5),
	(null, 'PS4', 'Psicologia del Niño', 4, 5),
	(null, 'PS5', 'Psicopatologia', 4, 5),
	(null, 'PS6', 'Psicologia Social', 4, 5),
	(null, 'PS7', 'Histologia', 4, 5),
	(null, 'PS8', 'Desarrollo Cognitivo', 4, 5),
	(null, 'PS9', 'Historia de la Psicologia', 4, 5),
	(null, 'PS10', 'Desarrollo Psicopatologico', 4, 5),
	(null, 'PS11', 'Desarrollo Psicoemocional', 4, 5);

-- Asignaturas de Aministracion    
insert into asignaturas
values    
    (null, 'AD1', 'Historia de la Administracion', 4, 2),
	(null, 'AD2', 'Administracion de Empresas', 4, 2),
	(null, 'AD3', 'Administracion de Costos', 4, 2),
	(null, 'AD4', 'Analisis de Empresas', 4, 2),
	(null, 'AD5', 'Analisis de Estados Financieros', 4, 2),
	(null, 'AD6', 'Ingenieria Economica', 4, 2),
	(null, 'AD7', 'Microeconomia', 4, 2),
	(null, 'AD8', 'acroeconomia', 4, 2),
	(null, 'AD9', 'Administracion de Negocios', 4, 2),
	(null, 'AD10', 'Administracion y Mercadeo', 4, 2),
	(null, 'AD11', 'Administracion de Personal', 4, 2);
    
insert into notas
values
	(null, 1, 1, 9),
	(null, 1, 2, 8),
	(null, 1, 3, 9.5),
	(null, 1, 4, 7),
	(null, 1, 5, 6),
	(null, 1, 6, 9),
	(null, 1, 7, 8),
	(null, 1, 8, 7),
	(null, 1, 9, 10),
	(null, 1, 10, 10),
	(null, 1, 11, 8),
	(null, 1, 12, 8),
	(null, 1, 13, 9),
	(null, 1, 14, 7.7),
	(null, 1, 15, 8.5),
	(null, 1, 16, 9);

insert into profesores_asignaturas
values
	(null, 1, 1, 2),
    (null, 1, 2, 3),
    (null, 1, 4, 2),
    (null, 6, 17, 2),
    (null, 6, 18, 3),
    (null, 6, 19, 4),
    (null, 7, 20, 7),
    (null, 7, 21, 8),
    (null, 7, 22, 9);
