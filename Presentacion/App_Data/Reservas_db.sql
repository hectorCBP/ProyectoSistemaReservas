use master
go

--------------------------
if exists(select * from sysdatabases where name = 'Reservas_db')
begin
	drop database Reservas_db
end
go


--creo la base de datos
create database Reservas_db
go


--selecciono la base de datos
use Reservas_db
go


/******************************************/
/*			Creacion de tabalas			  */
/******************************************/
create table Usuarios
(
	nombre	varchar (100) not null,
	clave	varchar (100), /* TO DO restriccion minimo 8 caracteres*/
	nombre_completo varchar (100),
	primary key(nombre)
)
go

create table Administradores
(
	nombre	varchar (100) not null,
	cargo	varchar (100),
	primary key(nombre),
	foreign key (nombre) references Usuarios(nombre)
)
go

create table Clientes
(
	nombre					varchar (100) not null,
	direccion				varchar (100),
	numero_tarjeta_credito	varchar (100), 
	primary key (nombre),
	foreign key (nombre) references Usuarios(nombre)
)
go

create table Telefono_Clientes
(
	nombre		varchar (100) not null,
	telefono	varchar (100) not null,
	primary key (nombre, telefono),
	foreign key (nombre) references Usuarios(nombre)
)
go

create table Hoteles
(
	nombre		varchar(100) not null,
	calle		varchar(100),
	numero		int,
	ciudad		varchar(100),
	categoria	int, /*TO DO restriccion categirias (1 a 5)*/
	telefono	varchar(100),
	fax			varchar(100),
	url_foto	varchar(100),
	playa		bit,
	piscina		bit,
	primary key (nombre)
)
go

create table Habitaciones
(
	numero			int not null,
	nombre_hotel	varchar(100),
	descripcion		varchar(250),
	cant_huesped	int,
	costo			decimal,
	piso			int,
	estado_reserva	varchar(100),
	primary key(numero, nombre_hotel),
	foreign key(nombre_hotel)references Hoteles(nombre)
)
go

create table Reservas
(
	numero			int not null,/*TO DO autogenerado por sistema*/
	estado			varchar(100),/*TO DO restriccion estado (activa, cancelada, finalizada)*/
	fecha_inicio	date,
	fecha_final		date,
	nombre			varchar(100),
	numero_hab		int,
	nombre_hotel	varchar(100),
	primary key (numero),
	foreign key (nombre) references Usuarios(nombre),
	foreign key (numero_hab, nombre_hotel) references Habitaciones(numero, nombre_hotel)
)
go
/******************************************/
/*			Insersiones de prueba		  */
/******************************************/
insert into Usuarios values('adm','adm','adm_uno')
insert into Administradores values('adm','super_adm')
insert into Hoteles values('hotel','calleH',123,'ciudadH',3,'123456789','012345678','imagenes/uno.jpg',1,1)
insert into Hoteles values('hotel2','calleH2',321,'ciudadH2',5,'987654321','123456789','imagenes/dos.jpg',0,1)
insert into Habitaciones values(100,'hotel','descripcionH1',2,2000,1,'activa')
insert into Habitaciones values(101,'hotel2','descripcionH2',3,2200,1,'activa')
insert into Habitaciones values(102,'hotel','descripcionH3',1,1400,1,'activa')
go
/******************************************/
/*		Procedimientos de almacenado	  */
/******************************************/

create proc buscarUsuario
@nombre varchar(100),
@clave	varchar(100)
as
begin
	select COUNT(nombre)
	from Usuarios
	where nombre = @nombre
	and	clave = @clave		
end
go

create proc agregarAdministrador
@nombre			varchar (100), 
@clave			varchar (100),
@nombreCompleto	varchar (100),
@cargo			varchar	(100)
as
begin
	
	declare @usuario int
	declare @resultado int
	
	exec @usuario = buscarUsuario @nombre,@clave
	
	if (@usuario = 1)
		return -1 /*usuario ya existe*/
		
	begin tran
		insert into Usuarios values (@nombre, @clave, @nombreCompleto)
		set @resultado = @@ERROR
		if @resultado <> 0
		begin
			rollback
			return -2 /*error al insertar usuario*/
		end
		insert into Administradores values(@nombre, @cargo)
		set @resultado = @@ERROR
		if @resultado <> 0
		begin
			rollback
			return -3 /*error al insertar administrador*/
		end
		else
		begin
			commit tran
			return 1
		end
end
go

create proc agregarTelefonosCliente
@nombre varchar(100),
@telefono varchar(100)
as 
begin 
	if exists (select @nombre from Telefono_Clientes where nombre = @nombre and telefono = @telefono)
		return -1 /*error cliente-telefono ya existe*/
	
	insert into Telefono_Clientes values (@nombre,@telefono)
end
go

create proc agregarCliente
@nombre varchar(100),
@clave	varchar(100),
@nombreCompleto varchar(100),
@direccion varchar(100),
@numeroTarjeta varchar(100)
as 
begin
	declare @usuario int
	declare @resultado int
	
	exec @usuario = buscarUsuario @nombre,@clave
	
	if (@usuario = 1)
		return -1 /*usuario ya existe*/	
		
	begin tran

		insert into Usuarios values (@nombre, @clave, @nombreCompleto)
		set @resultado = @@ERROR

		if @resultado <> 0
		begin
			rollback
			return -2 /*error al insertar usuario*/
		end

		insert into Clientes values (@nombre,@direccion,@numeroTarjeta)
		set @resultado = @@ERROR
		
		if @resultado <> 0
		begin
			rollback
			return -3 /*error al inserta cliente*/
		end
		else
		begin
			commit tran
			return 1
		end
end
go

create proc buscarAdministrador
@nombre varchar(100),
@clave	varchar(100)
as
begin 
	select a.*, u.nombre_completo, u.clave from Administradores a join Usuarios u
	on u.nombre = @nombre
	and u.clave = @clave
	and u.nombre = a.nombre
end
go

create proc buscarCliente
--alter proc buscarCliente
@nombre varchar(100),
@clave varchar(100)
as
begin
	select c.*, u.nombre_completo, u.clave/*, t.telefono */from Clientes c join Usuarios u
	on u.nombre = @nombre
	and u.clave = @clave
	and u.nombre = c.nombre
	/*
	join Telefono_Clientes t
	on c.nombre = t.nombre
	*/
end
go

create proc listarHabitacionesActivas
as
begin 
	select * from Habitaciones
	where estado_reserva = 'activa'
end
go

create proc obtenerHoteles
as
begin
	select * from Hoteles
end 
go

create proc buscarHotel
@nombre varchar(100)
as
begin
	select * from Hoteles where nombre = @nombre;
end
go

create proc agregarHotel
@nombre varchar(100),
@calle varchar(100),
@numero int,
@ciudad varchar(100),
@categoria int,
@telefono varchar(100),
@fax varchar(100),
@url_foto varchar(100),
@playa bit,
@piscina bit
as
begin

	if exists(select nombre from Hoteles where nombre = @nombre)
		return -1 /* sale cuando ya existe el hotel */

	insert into Hoteles
	values(@nombre, @calle, @numero, @ciudad, @categoria, @telefono, @fax, @url_foto, @playa, @piscina)
end
go

create proc modificarHotel
@nombre varchar(100),
@calle varchar(100),
@numero int,
@ciudad varchar(100),
@categoria int,
@telefono varchar(100),
@fax varchar(100),
@url_foto varchar(100),
@playa bit,
@piscina bit
as
begin 
	declare @respuesta int
	update Hoteles 
	set calle = @calle,
		numero = @numero,
		ciudad = @ciudad,
		categoria = @categoria,
		telefono = @telefono,
		fax = @fax,
		url_foto = @url_foto,
		playa = @playa,
		piscina = @piscina
	where nombre = @nombre
	set @respuesta = @@ERROR
	if @respuesta <> 0
		return -1 /*ERROR SQL*/
end 
go

create proc eliminarHotel
@nombre varchar(100)
as
begin
	declare @respuesta int
	delete from Hoteles where name = @name
	set @respuesta = @@ERROR
	if @respuesta <> 0
		return -1 /*ERROR SQL*/
end
go
/******************************************/
/*			Consultas de prueba			  */
/******************************************/
-- exec agregarAdministrador 'pepe','clave','pepe gonzales','administrativo'
-- exec agregarCliente 'Maria','mariaclave','maria rodriguez','direccion maria',5221283915454775
-- exec buscarAdministrador 'pepe', 'clave'
-- exec buscarCliente 'tito','titoclave'
-- select * from Usuarios
-- select * from Administradores
-- select * from Clientes
-- select * from Telefono_Clientes
-- select * from Hoteles
-- select * from Habitaciones

