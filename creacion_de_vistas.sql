use danubio_azul;

select * from empleado;

select *
from empleado
order by nombre_empleado;

select id_empleado as id, nombre_empleado as empleado,
sueldo_semanal as sueldo,
e.fecha_ingreso as fecha_de_ingreso
from empleado e
inner join sueldo s
on (e.id_empleado = s.id_sueldo);

drop view if exists vw_general_empleados;

create or replace view vw_general_empleados as
	(select *
     from empleado
     order by nombre_empleado
	);
   
select * from vw_general_empleados;

drop view if exists vw_empleados;

create or replace view vw_empleados as
	(select id_empleado as id, nombre_empleado as empleado,
	 sueldo_semanal as sueldo,
	 e.fecha_ingreso as fecha_de_ingreso
	 from empleado e
	 inner join sueldo s
	 on (e.id_empleado = s.id_sueldo)
     );


select * from vw_empleados;

select s.id_sueldo as id, e.nombre_empleado as empleado,
s.sueldo_semanal as sueldo, nomina_semanal as nomina,
s.prestamo, s.anticipo, e.fecha_ingreso
from sueldo s
right join empleado e
on (s.id_sueldo = e.id_empleado);

drop view if exists vw_empleados_sueldo;

create or replace view vw_empleados_sueldo as
	(select s.id_sueldo as id, e.nombre_empleado as empleado,
	 s.sueldo_semanal as sueldo, nomina_semanal as nomina,
	 s.prestamo, s.anticipo, e.fecha_ingreso
	 from sueldo s
	 right join empleado e
	 on (s.id_sueldo = e.id_empleado)
    );
    

select * from vw_empleados_sueldo;

select *
from cliente
order by nombre_cliente;

drop view if exists vw_general_clientes;

create or replace view vw_general_clientes as
	(select *
     from cliente
     order by nombre_cliente
    );
    
select * from vw_general_clientes;

select *
from producto
where tipo = 'GALLETAS';

drop view if exists vw_producto_galletas;

create or replace view vw_producto_galletas as
	(select *
	 from producto
	 where tipo = 'GALLETAS'
    );

select * from vw_producto_galletas;