use danubio_azul;

drop table if exists log_auditoria;

create table if not exists log_auditoria
(
id_log int auto_increment,
nombre_accion varchar(10),
nombre_tabla varchar(50),
usuario varchar(100),
fecha_upd_ins_del datetime,
primary key (id_log)
);

drop table if exists log_auditoria2;

create table if not exists log_auditoria2
(
id_log int auto_increment,
id_sueldo int not null,
sueldo_semanal decimal,
nomina_semanal decimal,
sueldoNuevo_sueldoAnterior varchar(200),
nominaNuevo_nominaAnterior varchar(200),
nombre_accion varchar(10),
nombre_tabla varchar(50),
usuario varchar(100),
fecha_upd_ins_del datetime,
primary key (id_log)
);

-- drop trigger if exists trg_log_empleado1;
delimiter //
create trigger trg_log_empleado1 after insert on empleado
for each row
begin
	insert into log_auditoria (nombre_accion, nombre_tabla, usuario, fecha_upd_ins_del)
    values ('INSERT', 'EMPLEADO', current_user(), now());
end //
delimiter ;

-- drop trigger if exists trg_log_empleado2;
delimiter //
create trigger trg_log_empleado2 after delete on empleado
for each row
begin
	insert into log_auditoria (nombre_accion, nombre_tabla, usuario, fecha_upd_ins_del)
    values ('DELETE', 'EMPLEADO', current_user(), now());
end //
delimiter ;

-- drop trigger if exists trg_log_empleado3;
delimiter //
create trigger trg_log_empleado3 after update on empleado
for each row
begin
	insert into log_auditoria (nombre_accion, nombre_tabla, usuario, fecha_upd_ins_del)
    values ('UPDATE', 'EMPLEADO', current_user(), now());
end //
delimiter ;

-- insert into empleado values (null, 'Ejemplo de Empleado', 'EVENTUAL', 11, 36, '2022-11-9');
-- delete from empleado where id_empleado= 37;
drop trigger if exists trg_log_sueldo;
delimiter //
create trigger trg_log_sueldo before update on sueldo
for each row
begin
	insert into log_auditoria2 (id_sueldo, sueldo_semanal, nomina_semanal, sueldoNuevo_sueldoAnterior,
								nominaNuevo_nominaAnterior, nombre_accion, nombre_tabla,
								usuario, fecha_upd_ins_del)
	values (new.id_sueldo, new.sueldo_semanal, new.nomina_semanal,
			concat(new.sueldo_semanal, '-', old.sueldo_semanal), concat(new.nomina_semanal, '-', old.nomina_semanal),
		    'UPDATE', 'SUELDO', current_user(), now());
end //
delimiter ;

update sueldo set nomina_semanal = 992
where id_sueldo = 36;
