--Era te dejo aquí todas las consultas que se vieron y con una pequeña explicación
--Ya lo único es que pues vayan acorde a tus atributos y tablas

--Consultas

--Selección
select * from Persona
where nombre = 'Eva';

--Proyección
select nombre, apat from Persona;

--Producto cartesiano
select * from Persona, Cliente;


--Producto cartesiano con selección
select nombre, salario
from Persona, empleado;

--Producto cartesiano con proyección y selección
select Persona.id,nombre,edad,correo from Persona,Cliente
where Persona.id=Cliente.id;

--Asignación de nombres temporales a las tablas
select P.nombre, E.salario, C.nocompras
from Persona P, Empleado E, Cliente C;

--Reunión
select P.nombre, C.nocompras
from Persona P inner join Cliente C on P.id=C.id
where C.nocompras > 2;

--Reunión natural
select P.nombre, C.nocompras
from Persona P natural join Cliente C
where C.nocompras >= 2;

--Reunión Externa izquierda
select P.nombre, C.nocompras
from Persona P left join Cliente C on P.id = C.id;

--Reunión Externa derecha
select P.nombre, E.salario
from Persona P right join Empleado E on P.id = E.id;

--Reunión Completa Externa
select P.nombre, C.nocompras, E.salario
from Empleado E,Persona P full join Cliente C on P.id = C.id;

--Distinct
select distinct (P.nombre) from Persona P;

--Unión
select id from Cliente  union  select id from Empleado;

--Intersección
select id from Cliente intersect select id from Empleado;

--Diferencia
select id from Cliente except select id from Empleado;

--Ordenar tuplas
select nombre, salario
from Persona natural join Empleado
order by salario;

--Funciones agregadas
--Contar todo
select count(id) from Persona;

--Contar nombres iguales, agrupandolos
select count(nombre),nombre from Persona
GROUP by nombre;

--Maximo de un grupo
select max(salario) from Empleado;

--Mínimo de un grupo
select min(nocompras) from Cliente;

--Promedio
select avg(nocompras) from Cliente;

--Suma
select sum(salario) from Empleado;

--Operador IN
select nombre from Persona
where nombre in (select nombre from Persona natural join Cliente);

--Operador NOT IN
select nombre from Persona
where nombre not in (select nombre from Persona natural join Cliente);

--Having (Se usa cuando necesitamos hacer preguntas sobre las funciones agregadas)
--Esta consulta nos dice el conteo de todos los nombres que se repiten más de 2 veces
select count(nombre),nombre
from Persona
group by nombre
having count(nombre)>2;

--Exists
select id from Persona
where exists (select id from Empleado);

