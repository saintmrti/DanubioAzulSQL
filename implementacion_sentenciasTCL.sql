use danubio_azul;

select @@autocommit;
set @@autocommit = 1;
set @@autocommit = 0;

start transaction;

select * from cliente;
insert into cliente values (null, 'JULIA MARTINEZ GUAPILLO', 'FEMENINO', '2284571416', 'XICO, VER.', 'VICENTE GUERRERO 39', now());
insert into cliente values (null, 'MILTON OBED', 'MASCULINO', '2278903456', 'XICO, VER.', 'MORELOS 12', now()); 
insert into cliente values (null, 'CRISTIAN', 'MASCULINO',  '2299345876', 'XICO, VER.', 'MORELOS 12', now()); 
-- rollback;
-- commit;

start transaction;

select * from producto;
insert into producto values (null, 'CONCHA', 'PAN', 9, 10, ' ', '2022-11-17');
insert into producto values (null, 'PANQUE DE MAIZ', 'PAN', 9, 50, ' ', '2022-11-17'); 
insert into producto values (null, 'EMPANADA DE REQUESON', 'PAN', 9, 20, ' ', '2022-11-17'); 
insert into producto values (null, 'CUBILETE', 'PAN', 10, 40, ' ', '2022-11-17'); 
savepoint sp1;
insert into producto values (null, 'FLOREADO', 'PAN', 9, 80, ' ', '2022-11-17');
insert into producto values (null, 'LARGO', 'PAN', 9, 15, ' ', '2022-11-17'); 
insert into producto values (null, 'BOLA', 'PAN', 9, 60, ' ', '2022-11-17'); 
insert into producto values (null, 'AZUCARADO', 'PAN', 9, 30, ' ', '2022-11-17');
savepoint sp2;

rollback to sp1;
rollback;

release savepoint sp1;