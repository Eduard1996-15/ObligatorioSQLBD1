-- Obligatorio Agosto 2021

---------------------------------------------------------------------

---------------------------------------------------------------------

-- Creacion de la base de datos

---------------------------------------------------------------------

create database oblAG2021xxx
use oblAG2021xxx
SET DATEFORMAT YMD; 

-- CREACION DEL ESQUEMA RELACIONAL

create table Pais(

    IdPais decimal not null Primary Key,

    NombreParis varchar(50));



create table Pasajero (

    IdPasajero decimal not null Primary Key,

    NombrePasajero varchar(60),

    APaternoPasajero varchar(60),

    AMaternoPasajero varchar(60),

    TipoDocumentoPasajero char(3),

    NumeroDocumentoPasajero decimal,

    FechaNacimientoPasajero date,

    EmailPasajero varchar(60),

    PasswordPasajero character(40),

    IdPais decimal not null foreign key references Pais(IdPais));



create table PasajeroTelefono (

    IdPasajero decimal not null foreign key references Pasajero (IdPasajero),

    TelefonoPasajero varchar(60),

    Primary Key (IdPasajero, TelefonoPasajero));



create table Terminal (

    IdTerminal decimal not null Primary Key,

    NombreTerminal varchar(60),

    IdPais decimal not null foreign key references Pais(IdPais));



create table bus (

    Idbus decimal not null Primary Key,

    Tipobus varchar(60),

    Capacidadbus integer,

    Marcabus varchar(80));



create table Asiento (

    Idbus decimal not null foreign key references bus (Idbus),

    FilaAsiento integer,

    LetraAsiento char(2),

    Primary Key (Idbus,FilaAsiento,LetraAsiento));



create table Viaje (

    IdTerminalOrigenViaje decimal not null foreign key references Terminal (IdTerminal),

    IdTerminalDestinoViaje decimal not null foreign key references Terminal (IdTerminal),

    FechaHoraViaje datetime,

    Importe float,

    Idbus decimal foreign key references bus (Idbus),

    IdViaje decimal not null Primary Key);



create table Boleto (

    IdPasajero decimal not null foreign key references Pasajero (IdPasajero),

    Idbus decimal not null foreign key references bus (Idbus),

    FilaAsiento integer,

    LetraAsiento char(2),

    FechaCompraBoleto date,

    IdViaje decimal not null foreign key references Viaje (IdViaje),

    Foreign key (Idbus,FilaAsiento,LetraAsiento) references Asiento(Idbus,FilaAsiento,LetraAsiento));



create table PasajeroMercoSur (

    IdPasajero decimal not null foreign key references Pasajero (IdPasajero),

    PorcentajePasajeroMercoSur float,

    Primary Key (IdPasajero));



create table PasajeroMercoSurBeneficio (

    IdPasajero decimal not null foreign key references Pasajero (IdPasajero),

    BeneficioMercoSur varchar(80),

    Primary Key (IdPasajero,BeneficioMercoSur));


---------------------------------------------------------------------

-- insert de datos 

---------------------------------------------------------------------

Insert into Pais
values (1,'Uruguay'),(2,'Brasil'),(3,'Argentina'),(4,'Paraguay'),(5,'Espa?a'),(6,'Rusia'),(7,'Chile');

insert into Pasajero

values	(1,'Lionel','Messi','','AAA',1111,'1992-12-12','adrimede@hotmail.com','adr123',1),

		(2,'Neymar','Junior','','BBB',2222,'1990-12-24','brupic@hotmail.com','bru123',3),

		(3,'Paulo','Dybala','','CCC',3333,'1960-05-10','juanan@hotmail.com','jua123',2),

		(4,'Thiago','Silva','','DDD',4444,'1980-07-12','soyturista@gmail.com','seb123',2),

		(5,'Gonzalo','Higuain','','EEE',5555,'1995-10-28','fedemede@hotmail.com','fed123',1),

		(10,'Fernando','Muslera','','AAA',1111,'1992-12-12','fernandomuslera@hotmail.com','xxx',1),

		(11,'Diego','Godin','','BBB',2222,'1990-12-24','diegogodin@hotmail.com','yyy',1),

		(12,'Jos? Mar?a','Gimenez','','CCC',3333,'1960-05-10','josema@hotmail.com','zzz',1),

		(13,'Luis','Suarez','','DDD',4444,'1980-07-12','luchosuarez@gmail.com','ttt',1),

		(14,'Edinson','Cavani','','EEE',5555,'1995-10-28','edicavani@hotmail.com','www',1),

		(15,'Arturo','Vidal','','EEE',5555,'1995-10-28','artrito@hotmail.com','www',7);


insert into PasajeroTelefono

values(1,'095237627'),

	  (2,'095223234'),

	  (3,'092232327'),

	  (4,'094237627'),

	  (5,'092237627'),

	  (1,'097237237');

insert into Terminal

values(1,'Montevideo',1),

      (2,'San Pablo',2),

	  (3,'Buenos Aires',3),

	  (4,'Rio',2),

	  (5,'Asuncion',4),

	  (6,'Santiago de chile',7),

	  (7,'Moscu',6),

	  (8,'Leningrado',6);


insert into bus

values(1,'Internacional',40,'CUTCSA'),

      (2,'Urbano',32,'CUTCSA'),

      (3,'Internacional',40,'COME'),

	  (4,'Urbano',32,'COME');

insert into Asiento

values	(1,1,'A'),(1,2,'A'),(1,3,'A'),(1,4,'A'),

		(1,1,'B'),(1,2,'B'),(1,3,'B'),(1,4,'B'),

		(1,1,'C'),(1,2,'C'),(1,3,'C'),(1,4,'C'),

		(1,1,'D'),(1,2,'D'),(1,3,'D'),(1,4,'D'),

		(2,1,'A'),(2,2,'A'),(2,3,'A'),(2,4,'A'),

		(2,1,'B'),(2,2,'B'),(2,3,'B'),(2,4,'B'),

		(2,1,'C'),(2,2,'C'),(2,3,'C'),(2,4,'C'),

		(2,1,'D'),(2,2,'D'),(2,3,'D'),(2,4,'D'),

		(3,1,'A'),(3,2,'A'),(3,3,'A'),(3,4,'A'),

		(3,1,'B'),(3,2,'B'),(3,3,'B'),(3,4,'B'),

		(3,1,'C'),(3,2,'C'),(3,3,'C'),(3,4,'C'),

		(3,1,'D'),(3,2,'D'),(3,3,'D'),(3,4,'D'),

		(4,1,'A'),(4,2,'A'),(4,3,'A'),(4,4,'A'),

		(4,1,'B'),(4,2,'B'),(4,3,'B'),(4,4,'B'),

		(4,1,'C'),(4,2,'C'),(4,3,'C'),(4,4,'C'),

		(4,1,'D'),(4,2,'D'),(4,3,'D'),(4,4,'D');


insert into Viaje(IdTerminalOrigenViaje,IdTerminalDestinoViaje,FechaHoraViaje,Importe,Idbus,IdViaje)

values	(1,2,'2018-06-01 12:30:40',150,1,1),   -- Montevideo San Pablo

		(1,2,'2017-05-12 12:30:40',150,1,2),   -- Montevideo San Pablo

		(5,1,'2017-07-17 15:40:10',120,2,3),   -- Asuncion Montevideo 

		(2,3,'2017-08-28 19:00:15',100,3,4),   -- San Pablo Buenos Aires

		(4,8,'2017-09-04 21:45:55',150,4,5),   -- Rio Moscu 

		(1,2,'2017-11-16 00:00:00',150,3,6),   -- Montevideo San Pablo modificar esta fecha para el bus que sale ma?ana

		(5,1,'2017-11-15 12:40:00',150,3,7),   -- viaje del boleto del mes 9 

		(1,4,'2017-12-21 05:10:00',250,1,8),   -- viaje del boleto del mes 9

		(5,2,'2017-10-02 21:20:00',120,3,9),   -- viaje del boleto del mes 9 

		(1,3,'2017-11-20 00:00:00',150,3,255), -- Montevideo Buenos Aires

	    (5,3,'2017-12-13 00:00:00',130,4,256), -- Asuncion Buenos Aires

		(1,8,'2018-06-01 12:30:40',150,1,100), -- montevideo moscu

		(1,6,'2018-06-01 12:30:40',150,1,101); -- montevideo santiago


insert into Boleto

values	(1,1,1,'A','2017-01-01',1),	   		

		(1,1,1,'B','2017-01-01',1),

		(1,1,1,'C','2017-01-01',1),

		(1,1,1,'D','2017-01-01',1),

		(2,1,2,'A','2017-02-05',2),

		(2,1,2,'B','2017-02-05',2),

		(3,2,2,'A','2017-03-17',3),

		(4,3,1,'B','2017-05-15',4),

		(5,4,3,'C','2017-07-25',5),

		(2,1,3,'A','2017-02-05',2),

		(2,1,3,'B','2017-02-05',2),

		(2,1,1,'A','2017-02-05',2),

		(2,1,1,'B','2017-02-05',2),

		(4,3,4,'B','2017-01-09',255),

		(10,1,1,'A','2017-01-01',100),	   		

		(11,1,1,'B','2017-01-01',100),

		(12,1,1,'C','2017-01-01',100),

		(13,1,1,'D','2017-01-01',100),

		(14,1,2,'A','2017-02-05',100),

		(15,1,2,'A','2017-02-05',101);

---------------------------------------------------------------------

--insert into boleto values
--		(4,3,2,'A','2017-09-15',7),--boleto del mes 9 del mail soyturista@gmail.com
--		(4,1,4,'C','2017-09-22',8),--boleto del mes 9 del mail soyturista@gmail.com
--		(4,3,3,'A','2017-09-05',9),--boleto del mes 9 del mail soyturista@gmail.com
--		(4,3,2,'A','2017-09-05',9);--boleto del mes 9 del mail soyturista@gmail.com

---------------------------------------------------------------------

insert into boleto values

        (4,3,2,'A','2021-09-15',7),--boleto del mes 9 del mail soyturista@gmail.com

		(4,1,4,'C','2021-09-22',8),--boleto del mes 9 del mail soyturista@gmail.com

		(4,3,3,'A','2021-09-05',9),--boleto del mes 9 del mail soyturista@gmail.com

		(4,3,2,'A','2021-09-05',9);--boleto del mes 9 del mail soyturista@gmail.com





insert into PasajeroMercoSur

values	(1,5),(2,5),(5,10);





insert into PasajeroMercoSurBeneficio

values	(1,'Beneficio por ser pasajero mercosur'),

		(2,'Beneficio por ser pasajero mercosur'),

		(5,'Beneficio por ser pasajero mercosur');



---------------------------------------------------------------------

--AGREGADOS

---------------------------------------------------------------------
insert into bus values(5,'Internacional',40,'BUQUEBUS');
insert into bus values(6,'Internacional',40,'TURIL');
insert into bus values(7,'Internacional',40,'ELTURISTA');
insert into bus values(112,'Internacional',40,'ELTURISTA');
insert into Viaje(IdTerminalOrigenViaje,IdTerminalDestinoViaje,FechaHoraViaje,Importe,Idbus,IdViaje)
values	(1,2,dateadd(day,1,getdate()),150,6,123);   -- Montevideo San Pablo


select NombrePasajero, count(*) cantidad_de_boletos  from pasajero join boleto 
on pasajero.IdPasajero = Boleto.IdPasajero 
group by NombrePasajero 
having count(*) >=  all(select count(*)  from pasajero join boleto 
on pasajero.IdPasajero = Boleto.IdPasajero 
group by NombrePasajero )

select bus.* from bus where bus.Capacidadbus > 35 
and bus.Idbus not in (select bus.Idbus from bus join Viaje 
on bus.Idbus = Viaje.Idbus 
and Viaje.FechaHoraViaje = CONVERT(date, GETDATE() + 1))

select Pasajero.*  from Pasajero  where Pasajero.IdPasajero  in (select   p.IdPasajero  
from Pasajero p join Boleto 
on p.IdPasajero = Boleto.IdPasajero 
group by p.IdPasajero
having Count(*) >=5)

select distinct Pasajero.IdPasajero, nombrepasajero, APaternoPasajero, AMaternoPasajero, Boleto.Idbus, filaAsiento, Viaje.IdViaje from pasajero, Boleto, Viaje
where Pasajero.IdPasajero=Boleto.IdPasajero 
and Boleto.IdViaje = Viaje.IdViaje
and Viaje.IdViaje = 255

select distinct v.IdViaje, count(b.IdPasajero) as cantPasajes from Viaje v join Boleto b
on v.IdViaje = b.IdViaje
and b.FechaCompraBoleto between '2021-09-01' and '2021-09-30'
join Pasajero p on p.EmailPasajero = 'soyturista@gmail.com'
group by v.IdViaje 
order by v.IdViaje asc
