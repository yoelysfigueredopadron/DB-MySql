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
    (null, '33211990','Pedro','Fernandez','M','Casado','19931224','23234141','pedro@gmail.com','Villa Urquiza'),
	(null, '78722447','Sara','Rovira','F','Soltera','19571111','01259161','sara.rovira@gmail.com','Barrio Parque'),
    (null, '33741588','Gabriela','Jara','F','Divorciada','19760409','55809183','gjara@gmail.com','Parque Chas'),
    (null, '35939299','Yassine','Paz','M','Viudo','19500212','20499693','yassine.paz@gmail.com','Almagro'),
    (null, '94433274','Consuelo','Ares','F','Soltera','19970902','94104096','consuelitoshine@gmail.com','Palermo'),
    (null, '76696865','Rogelio','Badia','M','Casado','19740406','74482057','soybadia@gmail.com','Belgrano'),
    (null, '86546166','Laura','Castro','F','Casada','19800524','25603569','lauri@gmail.com','Hurlingham'),
    (null, '38889527','Alexia','Miralles','F','Viuda','19590412','05216969','a.miralles@gmail.com','Sarandi'),
    (null, '59221748','Alma','Gonzalez','F','Soltera','19890520','16475971','almita@gmail.com','Villa Crespo'),
    (null, '38170900','Patricio','Castro','M','Soltero','19940518','93152999','patooo@gmail.com','Villa Lugano'),
    (null, '89480616','Roberto','Roca','M','Casado','19851210','95628498','robert@gmail.com','Monte Castro');
    
INSERT INTO carreras
VALUES
	('AA-001', 'Ingeniería en Sistemas', 200000),
    ('AA-002', 'Licenciatura en Administración de Empresas', 180000),
    ('AA-003', 'Licenciatura en Derecho', 220000),
    ('AA-004', 'Licenciatura en Marketing', 190000),
    ('AA-005', 'Licenciatura en Psicología', 250000),
    ('AA-006', 'Licenciatura en Teología', 170000),
    ('AA-007', 'Licenciatura en Informática', 190000),
    ('AA-008', 'Técnico en Laboratorio Clínico', 175000),
	('AA-009', 'Licenciatura en Crimonología', 350000),
    ('AA-010', 'Doctorado en Derecho Penal', 900000),
    ('AA-011', 'Master en Marketing de Negocios', 890000),
    ('AA-012', 'Licenciatura en Relaciones Públicas', 475000);

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
	('MGT', 'Master en Gestión de Tecnologías'),
	('LCI', 'Lic. en Comercio Internacional'),
    ('IES', 'Ingeniero En Sistemas'),
    ('LPS', 'Lic. en Psicología'),
    ('LED', 'Lic. en Derecho'),
	('LAE', 'Lic. en Administración de Empresas'),
	('LSI', 'Lic. en Sistemas de Información'),
    ('MMN', 'Master en Marketing de Negocios'),
    ('DDP', 'Doctorado en Derecho Penal'),
    ('LRP', 'Lic. en Relaciones Públicas');

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
    (null, 'AA-009', 8, 10, '20201205'),
	(null, 'AA-010', 2, 8, '20211105'),
    (null, 'AA-002', 6, 4, '20220710'),
    (null, 'AA-011', 1, 1, '20210429'),
    (null, 'AA-012', 8, 10, '20191104'),
    (null, 'AA-004', 3, 7, '20191024');
    
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
    (null, '01011968', 'Juan', 'Zavala', 'M', 'jzavala28@yahoo.com', '77889886', 'Casado', 'LED', '19680529', '20170903'),
	(null, '18024566', 'Margarita', 'Monteiro', 'F', 'marga.mont@gmail.com', '44323456', 'Casada', 'DDP', '19600527', '20171120'),
    (null, '19762344', 'Marcos', 'Acosta', 'M', 'marcos.a@gmail.com', '49076522', 'Soltero', 'LSI', '19870819', '20201209'),
    (null, '99855441', 'Luana', 'Britos', 'F', 'britosluana@gmail.com', '43217655', 'Casada', 'MMN', '19811020', '20180221'),
	(null, '47983074', 'Dante', 'Castro', 'M', 'profedante@icloud.com', '45678833', 'Soltero', 'LAE', '19910430', '20210511'),
    (null, '16523499', 'Gabriel', 'Juarez', 'M', 'juarez.gabriel80@ba.edu.ar', '46737129', 'Divorciado', 'LRP', '19770322', '20141201');
    
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
