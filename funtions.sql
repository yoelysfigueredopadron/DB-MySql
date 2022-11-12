use `universidad`;

DELIMITER $$

drop function if exists `precio_iva`$$
-- Se calcula el precio de un producto o servivio con el iva incluido. Se utilizará para calcular el precio con iva de la carreras de los estudiantes
create function `precio_iva`(precio decimal(11,2), iva int)

returns decimal(11,2)
no sql

begin
	declare result decimal(11,2);    
    set result = precio * ((iva / 100) + 1);    
    return result;
end$$

drop function if exists `promedio_estudiante`$$
-- Se calcula el promedio de las notas de un estudiante indicando el id_Matricula que corresponde al mismo
-- Se puede probar con el valor 1 para Id_Matricula ya que es el unico estudiante actual con notas ingresadas
create function `promedio_estudiante`(matricula_id int)

returns decimal(3,1) 
reads sql data

begin
	declare result decimal(3,1);

	set result = (
					select round(avg(nota),1) as promedio_estudiante
                    from notas
                    where Id_Matricula = matricula_id
				  );
		
	return result;
end$$

DELIMITER ;