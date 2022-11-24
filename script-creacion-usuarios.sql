USE `universidad`;

-- Creando roles
DROP ROLE IF EXISTS 'read_permissions', 'write_permissions', 'developer_permissions';

CREATE ROLE 'read_permissions', 'write_permissions', 'developer_permissions';

-- Agregando permisos a los roles
GRANT ALL ON universidad.* TO 'developer_permissions';
GRANT SELECT ON universidad.* TO 'read_permissions';
GRANT INSERT, UPDATE ON universidad.* TO 'write_permissions';

-- creando usuarios desarrolladores que tendran todos los permisos
CREATE USER 'yoelys_dev1'@'localhost' IDENTIFIED WITH mysql_native_password BY 'dev1pass';
CREATE USER 'yoelys_dev2'@'localhost' IDENTIFIED WITH mysql_native_password BY 'dev2pass';
CREATE USER 'yoelys_dev3'@'localhost' IDENTIFIED WITH mysql_native_password BY 'dev3pass';

-- creando usuarios que solo tendrán permisos de lectura
CREATE USER 'yoelys_readonly1'@'localhost' IDENTIFIED WITH mysql_native_password BY 'readonly_user1pass';
CREATE USER 'yoelys_readonly2'@'localhost' IDENTIFIED WITH mysql_native_password BY 'readonly_user2pass';
CREATE USER 'yoelys_readonly3'@'localhost' IDENTIFIED WITH mysql_native_password BY 'readonly_user3pass';

-- creando usuarios que tendrán permisos de lectura y escritura
CREATE USER 'yoelys_readwrite1'@'localhost' IDENTIFIED WITH mysql_native_password BY 'readwrite1_userpass';
CREATE USER 'yoelys_readwrite2'@'localhost' IDENTIFIED WITH mysql_native_password BY 'readwrite2_userpass';
CREATE USER 'yoelys_readwrite3'@'localhost' IDENTIFIED WITH mysql_native_password BY 'readwrite3_userpass';

-- Agregando usuarios a grupos(roles)
GRANT 'developer_permissions' TO 'yoelys_dev1'@'localhost', 'yoelys_dev2'@'localhost', 'yoelys_dev3'@'localhost';
GRANT 'read_permissions' TO 'yoelys_readonly1'@'localhost', 'yoelys_readonly2'@'localhost', 'yoelys_readonly3'@'localhost';
GRANT 'write_permissions' TO 'yoelys_readwrite1'@'localhost', 'yoelys_readwrite2'@'localhost', 'yoelys_readwrite3'@'localhost';

-- activamos los roles por defecto para cuando se logen los usuarios
SET DEFAULT ROLE ALL TO
	'yoelys_dev1'@'localhost',
    'yoelys_dev2'@'localhost',
    'yoelys_dev3'@'localhost',
    'yoelys_readonly1'@'localhost',
    'yoelys_readonly2'@'localhost',
    'yoelys_readonly3'@'localhost',
	'yoelys_readwrite1'@'localhost',
    'yoelys_readwrite2'@'localhost',
    'yoelys_readwrite3'@'localhost';

-- revisamos que se hallan creados los usuarios en la base de datos 'mysql' en la tabla 'user'
SELECT * FROM mysql.user
WHERE user LIKE 'yoelys%';

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
