USE universidad;

INSERT INTO alumnos
VALUES
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
    
INSERT INTO carreras
VALUES
	('AA-001', 'Ingenieria en Sistemas', 200000),
    ('AA-002', 'Licenciatura en Administracion de Empresas', 180000),
    ('AA-003', 'Licenciatura en Derecho', 220000),
    ('AA-004', 'Licenciatura en Mercadotecnia', 190000),
    ('AA-005', 'Licenciatura en Psicologia', 250000),
    ('AA-006', 'Licenciatura en Teologia', 170000),
    ('AA-007', 'Licenciatura en Informatica', 190000),
    ('AA-008', 'Laboratorio Clinico', 175000);

INSERT INTO periodos_academicos
VALUES
	(null, 'Primero', '20190204', '20190508'),
	(null, 'Segundo', '20190527', '20190819'),
	(null, 'Tercero', '20190916', '20191220'),
    (null, 'Primero', '20200204', '20200508'),
	(null, 'Segundo', '20200527', '20200819'),
	(null, 'Tercero', '20200916', '20201220'),
    (null, 'Primero', '20210204', '20210508'),
	(null, 'Segundo', '20210527', '20210819'),
	(null, 'Tercero', '20210916', '20211220');
    
INSERT INTO profesiones
VALUES 
	('MGT', 'Master en Gerstion de Tecnologias'),
	('LCI', 'Lic. en Comercio Internacional'),
    ('IES', 'Ingeniero En Sistemas'),
    ('LPS', 'Lic. en Psicologia'),
    ('LED', 'Lic. en Derecho');

-- Asignaturas de Ingenieria
INSERT INTO asignaturas
VALUES
	('MM1', 'Matematica I', 5, 'AA-001'),
	('MM2', 'Matematica II', 5, 'AA-001'),
	('PG1', 'Programacion I', 4, 'AA-001'),
	('PG2', 'Programacion Logica', 4, 'AA-001'),
	('PG3', 'Programacion Funcional', 4, 'AA-001'),
	('PG4', 'Programacion Orientada a Objetos', 4, 'AA-001'),
	('PG5', 'Programacion Web', 4, 'AA-001'),
	('PG6', 'Desarrollo de Aplicaciones Web', 4, 'AA-001'),
	('PG7', 'Bases de Datos I', 4, 'AA-001'),
	('PG8', 'Laboratorio de Bases de Datos', 4, 'AA-001'),
	('PG9', 'Diseño Web ', 4, 'AA-001'),
	('PG10', 'Analisis de Algoritmos', 4, 'AA-001'),
	('PG11', 'Analisis de Sistemas', 4, 'AA-001'),
	('PMG12', 'Calculo I', 4, 'AA-001'),
	('PMG13', 'Algebra Lineal', 4, 'AA-001'),
	('PMG14', 'Teoria de Algoritmos', 4, 'AA-001');

-- Asignaturas de Psicologia    
INSERT INTO asignaturas
VALUES
	('PS1', 'Psicologia', 4, 'AA-005'),
	('PS2', 'Psicologia Educativa', 4, 'AA-005'),
	('PS3', 'Psicologia Emocional', 4, 'AA-005'),
	('PS4', 'Psicologia del Niño', 4, 'AA-005'),
	('PS5', 'Psicopatologia', 4, 'AA-005'),
	('PS6', 'Psicologia Social', 4, 'AA-005'),
	('PS7', 'Histologia', 4, 'AA-005'),
	('PS8', 'Desarrollo Cognitivo', 4, 'AA-005'),
	('PS9', 'Historia de la Psicologia', 4, 'AA-005'),
	('PS10', 'Desarrollo Psicopatologico', 4, 'AA-005'),
	('PS11', 'Desarrollo Psicoemocional', 4, 'AA-005');

-- Asignaturas de Administracion    
INSERT INTO asignaturas
VALUES
	('AD1', 'Historia de la Administracion', 4, 'AA-002'),
	('AD2', 'Administracion de Empresas', 4, 'AA-002'),
	('AD3', 'Administracion de Costos', 4, 'AA-002'),
	('AD4', 'Analisis de Empresas', 4, 'AA-002'),
	('AD5', 'Analisis de Estados Financieros', 4, 'AA-002'),
	('AD6', 'Ingenieria Economica', 4, 'AA-002'),
	('AD7', 'Microeconomia', 4, 'AA-002'),
	('AD8', 'acroeconomia', 4, 'AA-002'),
	('AD9', 'Administracion de Negocios', 4, 'AA-002'),
	('AD10', 'Administracion y Mercadeo', 4, 'AA-002'),
	('AD11', 'Administracion de Personal', 4, 'AA-002');
    
INSERT INTO matricula_alumnos
VALUES
	(null, 'AA-001', 1, 3, '20180905'),
    (null, 'AA-001', 1, 1, '20181023'),
    (null, 'AA-001', 1, 2, '20180925'),
    (null, 'AA-002', 3, 7, '20190602'),
    (null, 'AA-003', 2, 8, '20181205'),
    (null, 'AA-004', 5, 9, '20200105'),
    (null, 'AA-005', 6, 4, '20200710'),
    (null, 'AA-006', 6, 5, '20200620'),
    (null, 'AA-007', 8, 6, '20201120'),
    (null, 'AA-007', 8, 10, '20201205');
    
INSERT INTO notas
VALUES
    (null, 1, 'MM1', 9),
	(null, 1, 'MM2', 8),
	(null, 1, 'PG1', 9.5),
	(null, 1, 'PG2', 7),
	(null, 1, 'PG3', 6),
	(null, 1, 'PG4', 9),
	(null, 1, 'PG5', 8),
	(null, 1, 'PG6', 7),
	(null, 1, 'PG7', 10),
	(null, 1, 'PG8', 10),
	(null, 1, 'PG9', 8),
	(null, 1, 'PG10', 8),
	(null, 1, 'PG11', 9),
	(null, 1, 'PMG12', 7.7),
	(null, 1, 'PMG13', 8.5),
	(null, 1, 'PMG14', 9),
    (null, 2, 'MM1', 7.5),
	(null, 2, 'MM2', 8.4),
	(null, 2, 'PG1', 9.5),
	(null, 2, 'PG2', 7),
	(null, 2, 'PG3', 9),
	(null, 2, 'PG4', 10),
	(null, 2, 'PG5', 10),
	(null, 2, 'PG6', 7),
	(null, 2, 'PG7', 8),
	(null, 2, 'PG8', 6),
	(null, 2, 'PG9', 8),
	(null, 2, 'PG10', 8),
	(null, 2, 'PG11', 9),
	(null, 2, 'PMG12', 7),
	(null, 2, 'PMG13', 7.3),
	(null, 2, 'PMG14', 9),
    (null, 3, 'MM1', 6.5),
	(null, 3, 'MM2', 7.4),
	(null, 3, 'PG1', 9),
	(null, 3, 'PG2', 7),
	(null, 3, 'PG3', 9),
	(null, 3, 'PG4', 8),
	(null, 3, 'PG5', 9.9),
	(null, 3, 'PG6', 6),
	(null, 3, 'PG7', 8),
	(null, 3, 'PG8', 10),
	(null, 3, 'PG9', 8),
	(null, 3, 'PG10', 8),
	(null, 3, 'PG11', 9),
	(null, 3, 'PMG12', 10),
	(null, 3, 'PMG13', 7),
	(null, 3, 'PMG14', 8);
    
INSERT INTO profesores
VALUES
	(null, '15191990', 'Jairo S', 'Galeas F', 'M', 'hola@jairogaleas.com', '27990012', 'Casado', 'MGT', '19900112', '20120519'),
	(null, '15191991', 'Doris', 'Guzman', 'F', 'gdoris@gmail.com', '27990123', 'Casada', 'LCI', '19800219', '20110110'),
    (null, '15031988', 'Angel', 'Zelaya', 'M', 'azelaya@gmail.com', '88445522', 'Casado', 'IES', '19880225', '20140120'),    
    (null, '15031978', 'Carlos', 'Perez', 'M', 'c.perez@gmail.com', '99887766', 'Soltero', 'IES', '19780420', '20140418'),
	(null, '15031986', 'Carlos', 'Velasquez', 'M', 'c.velasquez@gmail.com', '55668844', 'Casado', 'IES', '19860421', '20150520'),
    (null, '15031985', 'Diana', 'Peralta', 'F', 'peralta.diana@gmail.com', '99989796', 'Soltera', 'LPS', '19850511', '20160120'),
    (null, '15031983', 'Maria', 'Funez', 'F', 'mariafunez1@gmail.com', '97989786', 'Casada', 'LPS', '19850818', '20160120'),
	(null, '08011990', 'Victor', 'Acosta', 'M', 'acosvict@yahoo.com', '88989986', 'Soltero', 'LPS', '19900621', '20170912'),
    (null, '01011968', 'Juan', 'Zavala', 'M', 'jzavala28@yahoo.com', '77889886', 'Casado', 'LED', '19680529', '20170903');
    
INSERT INTO profesores_asignaturas
VALUES
	(null, 1, 'MM1', 2),
    (null, 1, 'MM2', 3),
    (null, 1, 'PG2', 2),
    (null, 6, 'PS1', 2),
    (null, 6, 'PS2', 3),
    (null, 6, 'PS3', 4),
    (null, 7, 'PS4', 7),
    (null, 7, 'PS5', 8),
    (null, 7, 'PS6', 9);
