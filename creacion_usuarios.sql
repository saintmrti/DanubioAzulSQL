use mysql;

select * from user
where user = 'user_danubio';
drop user if exists 'admin_danubio'@'localhost';
drop user if exists 'user_danubio'@'localhost';

-- Creamos usuario administrador
create user if not exists 'admin_danubio'@'localhost' identified by 'danBlue100';
-- Creamos usuario de solo lectura
create user if not exists 'user_danubio'@'localhost' identified by 'danubio100';
-- Asignamos permisos para insertar, modificar y leer
grant select, insert, update on danubio_azul.* to 'admin_danubio'@'localhost';
-- Asignamos permisos de solo lectura
grant select on danubio_azul.* to 'user_danubio'@'localhost';