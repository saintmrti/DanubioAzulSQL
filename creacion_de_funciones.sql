use danubio_azul;

drop function if exists fn_stock_producto;

select stock
from producto
where id_producto=1;

delimiter $$
create function fn_stock_producto (s int)
returns int
deterministic
begin
	declare n_stock int default 0;
	set n_stock =
		(select stock
		 from producto
		 where id_producto= s);
	return n_stock;
end$$
delimiter ;

select fn_stock_producto(4);

select telefono
from cliente
where nombre_cliente = 'SAINT MARTIN';

drop function if exists fn_datos_cliente;

delimiter //
create function fn_datos_cliente(n varchar(35))
returns varchar(80)
deterministic
begin
	declare tel varchar(15);
    declare dir varchar(20);
    set tel = (select telefono
			   from cliente
			   where nombre_cliente = n);
	set dir = (select direccion
               from cliente
               where nombre_cliente = n);

	return concat('Telefono: ', tel, ', Direccion: ', dir);
end //
delimiter ;

select fn_datos_cliente('carlos sandoval');