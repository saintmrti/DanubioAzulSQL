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
sueldo int,
area varchar(25),
puesto varchar(25),
telefono varchar(15),
fecha_ingreso date,
primary key(id_empleado)
);
-- drope table empleado;

-- Tabla Sueldo
create table if not exists sueldo(
id_sueldo int not null auto_increment,
id_empleado int not null,  
anticipo decimal,
importe_extra decimal,
apoyo_medico boolean,
prima_vacacional decimal,
nomina decimal,
prestamo date,
asistencias int,
primary key(id_sueldo),
foreign key(id_empleado) references empleado(id_empleado)
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
envio enum('si', 'no'),
direccion varchar(20),
telefono varchar(15),
fecha_pedido date,
primary key(id_pedido),
foreign key(id_cliente) references cliente(id_cliente)
);

-- Tabla Producto
create table if not exists producto(
id_producto int not null auto_increment, 
nombre_producto varchar(20),
marca varchar(20),
precio decimal,
stock int,
descripcion varchar(60),
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


