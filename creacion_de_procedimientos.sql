use danubio_azul;

select *
from cliente
order by nombre_cliente asc;

drop procedure if exists sp_ordenar;

delimiter //
create procedure sp_ordenar(inout p1 varchar(30),
							inout p2 varchar(15))
begin
	set @t1 = concat('select * from cliente order by', ' ', p1, ' ', p2);
    prepare param_stmt from @t1;
    execute param_stmt;
    deallocate prepare param_stmt;
end //
delimiter ;

set @p1 = 'nombre_cliente';
set @p2 = 'asc';

call sp_ordenar(@p1, @p2);

insert into pedido values (null, 2, 'SI', 'Ignacio Aldama 39', '2288548416', now());
insert into pedido_producto values (null, last_insert_id(), 1, 5, 35, now());
select last_insert_id();

delete from pedido where id_pedido= 2; 

drop procedure if exists sp_nuevo_pedido;

delimiter //
create procedure sp_nuevo_pedido(inout idCliente int,
								 inout idProducto int,
								 inout envio varchar(5),
								 inout direccion varchar(20),
                                 inout telefono varchar(15),
                                 inout cantidad int,
                                 inout costo decimal)
begin
	insert into pedido values (null, idCliente, envio, direccion, telefono, now());
	insert into pedido_producto values (null, last_insert_id(), idProducto, cantidad, costo, now());
end // 
delimiter ;

set @idCliente= 1;
set @idProducto= 5;
set @envio= 'SI';
set @direccion= 'Guerrero 5';
set @telefono= '2281775432';
set @cantidad= 2;
set @costo= 14;

call sp_nuevo_pedido(@idCliente, @idProducto, @envio, @direccion, @telefono, @cantidad, @costo);
