-- DROP
DROP SCHEMA IF  EXISTS   danubio_azul;

-- CREATE
CREATE SCHEMA IF NOT EXISTS  danubio_azul;

use danubio_azul;

-- CREATE TABLES

-- Tabla Empleado
create table if not exists empleado(
id_empleado int not null auto_increment, 
nombre_empleado varchar(35),
tipo_contrato enum('DE PLANTA', 'EVENTUAL'),
id_puesto int not null,
id_sueldo int not null,
fecha_ingreso date,
primary key(id_empleado),
foreign key(id_puesto) references puesto(id_puesto),
foreign key(id_sueldo) references sueldo(id_sueldo)
);

-- drop table sueldo;
-- drop table puesto;
drop table empleado;

create table if not exists puesto(
id_puesto int not null auto_increment,
nombre_puesto varchar (15),
area varchar(15),
fecha_ingreso date,
primary key(id_puesto)
);

-- foreign key(id_empleado) references empleado(id_empleado)

-- Tabla Sueldo
create table if not exists sueldo(
id_sueldo int not null auto_increment,
sueldo_semanal decimal,
nomina_semanal decimal,
prestamo decimal,
anticipo decimal,
importe_extra decimal,
asistencias int,
fecha_ingreso date,
primary key(id_sueldo)
);

-- Tabla Cliente
create table if not exists cliente(
id_cliente int not null auto_increment, 
nombre_cliente varchar(35),
sexo varchar(15),
telefono varchar(15),
ciudad_residencia varchar(20),
direccion varchar(20),
fecha_registro date,
primary key(id_cliente)
);

-- Tabla Pedido
create table if not exists pedido(
id_pedido int not null auto_increment, 
id_cliente int not null,
envio enum('SI', 'NO'),
direccion varchar(20),
telefono varchar(15),
fecha_pedido date,
primary key(id_pedido),
foreign key(id_cliente) references cliente(id_cliente)
);

-- Tabla Producto
create table if not exists producto(
id_producto int not null auto_increment, 
nombre_producto varchar(30),
tipo varchar(20),
precio decimal,
stock int,
descripcion varchar(120),
fecha_registro date,
primary key(id_producto)
);

-- Tabla pedido_producto
create table if not exists pedido_producto(
id_pedido_producto int not null auto_increment,
id_pedido int not null,
id_producto int not null,
cantidad int,
costo decimal,
primary key(id_pedido_producto),
foreign key(id_pedido) references pedido(id_pedido),
foreign key(id_producto) references producto(id_producto)
);

-- drop table if exists pedido_producto;
-- drop table if exists cliente;
-- drop table if exists pedido;
-- drop table if exists producto;


