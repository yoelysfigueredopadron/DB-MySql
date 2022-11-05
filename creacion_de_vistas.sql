USE Universidad;

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