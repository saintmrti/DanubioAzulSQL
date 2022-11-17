use danubio_azul;

select * from stg_empleado;
insert into empleado select * from stg_empleado;
select * from empleado;
drop table stg_empleado;

select * from puesto;
-- drop table if exists puesto;
select * from sueldo;
-- drop table if exists sueldo;

insert into cliente (
id_cliente,
nombre_cliente,
sexo,
telefono,
ciudad_residencia,
direccion,
fecha_registro
)
values (
null,
'MARIA MERCEDES MENDEZ MARTINEZ',
'FEMENINO',
'2288130833',
'XICO, VERACRUZ',
'FRANCISCO SARABIA 5',
'22-10-25'
);

insert into cliente values
(null, 'PAULETTE MENDEZ MARTINEZ', 'FEMENINO', '2288130833', 'XICO, VERACRUZ', 'FRANCISCO SARABIA 5', '22-10-25'),
(null, 'SAINT MARTIN', 'MASCULINO', '2288548416', 'XICO, VERACRUZ', 'EMILIANO ZAPATA 32', '22-10-25');

insert into cliente values (null, 'CARLOS SANDOVAL', 'MASCULINO', '2281446987', 'XALAPA, VERACRUZ', 'FRANCISCO SARABIA 5', '22-10-25');

update cliente set nombre_cliente = 'SAINT MARTIN' where id_cliente= 6;

select * from cliente;

-- NO HACER ESTO --> delete from cliente;

insert into producto values
(null, 'MAZAFINAS', 'GALLETAS', '7', '60', '', '2022-10-30'),
(null, 'COCHINITOS DE PANELA', 'GALLETAS', '7', '50', '', '2022-10-30'),
(null, 'POLVORON DE NARANJA', 'GALLETAS', '7', '80', '', '2022-10-30'),
(null, 'ROSQUITA DE REQUESON', 'GALLETAS', '7', '100', '', '2022-10-30'),
(null, 'TLAXCALES DE MAIZ', 'GALLETAS', '7', '30', '', '2022-10-30'),
(null, 'GALLETAS DE LIMON', 'GALLETAS', '7', '40', '', '2022-10-30'),
(null, 'GALLETAS DE NATA', 'GALLETAS', '7', '60', '', '2022-10-30'),
(null, 'GALLETAS NEVADAS', 'GALLETAS', '7', '60', '', '2022-10-30'),
(null, 'GALLETAS DE MANTEQUILLA', 'GALLETAS', '7', '60', '', '2022-10-30');

select * from producto;










