use universidad;

DELIMITER $$

drop procedure if exists `sp_get_lista_estudiantes`$$

create procedure `sp_get_lista_estudiantes` (in field varchar(20), in my_order varchar(4))

-- creamos el parametro de ordenamiento de la lista de estudiantes. Se podrá ordenar por cualquier campo de la tabla alumnos, ejemplo: Id_Alumno, DNI_Alumno, Nombres, Apellidos, etc
begin -- otra forma length(field) > 0
	if field <> '' then
		set @ordenar_lista = concat_ws(' ', 'order by', field, my_order);
	else
		set @ordenar_lista = '';
    end if;
    
    -- Armamos la clausula de select
	set @clausula = concat_ws(' ', 'select * from alumnos', @ordenar_lista);
    
    -- Preparamos y ejecutamos la query del select ya armada
    prepare ejecutar from @clausula;
    execute ejecutar;
    deallocate prepare ejecutar;

end$$

-- Procedimiento almacenado que agrega estudiantes a la tabla alumnos
drop procedure if exists `sp_set_estudiantes`$$

create procedure `sp_set_estudiantes` (in dniAlumno varchar(8), in nombres varchar(50), in apellidos varchar(50), in genero char(1), in estadoCivil varchar(15),
									   in fechaNacimiento date, in telefono varchar(15), in correo varchar(50), in direccion varchar(100))
begin
    insert into alumnos (DNI_Alumno, Nombres, Apellidos, Genero, Estado_Civil, Fecha_Nacimiento, Telefono, Correo, Direccion)
    values (dniAlumno, nombres, apellidos, genero, estadoCivil, fechaNacimiento, telefono, correo, direccion);
end$$

DELIMITER ;