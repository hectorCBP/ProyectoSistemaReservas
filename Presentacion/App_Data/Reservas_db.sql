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
	numero_tarjeta_credito	varchar (100) unique,/*TO DO debe ser unico y de 16 caracteres*/ 
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
	categoria	int constraint CHK_categoria check (categoria like '[1-5]'),
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
	piso			int
	primary key(numero, nombre_hotel),
	foreign key(nombre_hotel)references Hoteles(nombre)
)
go

create table Reservas
(

	numero			bigint identity not null,
	estado_reserva	varchar(100) constraint CHK_estado_reserva check (estado_reserva ='ACTIVA' OR estado_reserva='CANCELADA' or estado_reserva='FINALIZADA'),
	fecha_inicio	date,
	fecha_final		date,
	nombre_cli		varchar(100),
	numero_hab		int,
	nombre_hotel	varchar(100),
	primary key (numero),
	foreign key (nombre_cli) references Clientes(nombre),
	foreign key (numero_hab, nombre_hotel) references Habitaciones(numero, nombre_hotel)
)
go
/******************************************/
/*			Insersiones de prueba		  */
/******************************************/
insert into Usuarios values('adm','adm','adm_uno')
insert into Usuarios values('cli','cli','adm_uno')
insert into Administradores values('adm','super_adm')
insert into Clientes values('cli','jujuy',1234567891011123)
insert into Usuarios values('usr','usr','usr_hard')
insert into Clientes values('usr','direccion','0123456789012345')
insert into Telefono_Clientes values('usr','1122334455')
insert into Hoteles values('hotel','calleH',123,'ciudadH',3,'123456789','012345678','imagenes/uno.jpg',1,1)
insert into Hoteles values('hotel2','calleH2',321,'ciudadH2',5,'987654321','123456789','imagenes/dos.jpg',0,1)
insert into Habitaciones values(100,'hotel','descripcionH1',2,2000,1)
insert into Habitaciones values(101,'hotel2','descripcionH2',3,2200,1)
insert into Habitaciones values(102,'hotel','descripcionH3',1,1400,1)
go
/******************************************/
/*		Procedimientos de almacenado	  */
/******************************************/

/***********************
	SP DE USUARIO
************************/
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

create proc modificarAdmin
@nombre			varchar (100), 
@clave			varchar (100),
@nombreCompleto	varchar (100),
@cargo			varchar	(100)
as
begin
	
	declare @usuario int
	declare @resultado int
	
	exec @usuario = buscarUsuario @nombre,@clave
	
	if not exists (select * from Usuarios where nombre=@nombre)
	return -1
	else
		
	begin tran
		update Usuarios set nombre_completo=@nombreCompleto, clave = @clave where nombre = @nombre
		set @resultado = @@ERROR
		if @resultado <> 0
		begin
			rollback
			return -2 /*error al modificar usuario*/
		end
		update Administradores set cargo=@cargo where nombre = @nombre
		set @resultado = @@ERROR
		if @resultado <> 0
		begin
			rollback
			return -3 /*error al modificar administrador*/
		end
		else
		begin
			commit tran
			return 1 --todo ok
		end
end
go

create proc eliminarAdmin
--alter proc eliminarAdmin
@nombre varchar(100)
as
begin
	
	declare @resultado int
	
	if not exists (select * from Usuarios where nombre=@nombre)
	return -1 --no existe usuario
	else
		
	begin tran
		delete from Administradores where nombre = @nombre
		set @resultado = @@ERROR
		if @resultado <> 0
		begin
			rollback
			return -2 /*error al eliminar usuario*/
		end
		delete from Usuarios where nombre = @nombre
		set @resultado = @@ERROR
		if @resultado <> 0
		begin
			rollback
			return -3 /*error al eliminar administrador*/
		end
		else
		begin
			commit tran
			return 1 --todo ok
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

create proc ListarAdmins
--alter proc ListarAdmins
as
begin
	select u.nombre as 'nombre',u.clave as 'clave',u.nombre_completo as 'nombre_completo',a.cargo as 'cargo' from usuarios u join administradores a on (u.nombre = a.nombre)
end
go

create proc ListarClientes
--alter proc ListarClientes
as
begin
	select u.nombre as 'nombre',u.clave as 'clave',u.nombre_completo as 'nombre_completo', c.direccion as 'direccion', c.numero_tarjeta_credito as 'tarjeta de credito' from usuarios u join Clientes c on (u.nombre = c.nombre)
end
go

/************************
	SP DE RESERVAS
*************************/
create proc reservasActivas
as
begin 
	select * from Reservas
	where estado_reserva = 'activa'
end
go

CREATE PROCEDURE buscarFecha
--ALTER PROCEDURE buscarFecha
@Num_hab int,
@Nomb_hotel varchar(100),
@F_inicio date,
@F_fin date
as
BEGIN
	IF EXISTS (SELECT fecha_inicio,fecha_final,nombre_hotel,numero_hab FROM Reservas WHERE nombre_hotel=@Nomb_hotel  AND numero_hab=@Num_hab AND @F_inicio>=fecha_inicio AND @F_inicio<=fecha_final)
	OR EXISTS (SELECT fecha_inicio,fecha_final,nombre_hotel,numero_hab FROM Reservas WHERE nombre_hotel=@Nomb_hotel  AND numero_hab=@Num_hab AND @F_fin>=fecha_inicio AND @F_fin<=fecha_final)
	OR EXISTS (SELECT fecha_inicio,fecha_final,nombre_hotel,numero_hab FROM Reservas WHERE nombre_hotel=@Nomb_hotel  AND numero_hab=@Num_hab AND @F_inicio<=fecha_inicio AND @F_fin>=fecha_final)
	RETURN -3
END
GO

CREATE PROCEDURE RealizarReserva
--ALTER PROCEDURE RealizarReserva

@F_inicio date,
@F_fin date,
@Nombre_Cli varchar(100),
@Numero_Hab int,
@Nombre_Hotel varchar(100)

as
BEGIN
	DECLARE @aux int
	declare @dias int
	declare @total int
	declare @costo int
	--Controlo que el usuario ingresado se encuentre registrado.
	IF NOT EXISTS(SELECT nombre FROM Clientes WHERE nombre=@Nombre_Cli)
	RETURN -1
	
	--Controlo que el período de reserva ingresado sea positivo.
	IF (SELECT DATEDIFF(DAY,@F_inicio,@F_fin))<0
	RETURN -2
	
	--Controlo que el vehículo se encuentre disponible en la fecha ingresada.
	EXEC @aux=BuscarFecha @Numero_Hab, @Nombre_Hotel, @F_inicio, @F_fin
	IF @aux=-3
	RETURN @aux
	
	--Calculo el costo total de la reserva	
	SELECT @costo = costo FROM Habitaciones WHERE numero=@Numero_Hab AND nombre_hotel=@Nombre_Hotel
	SELECT @dias = DATEDIFF(dd,@F_inicio,@F_fin)
	SELECT @total = @costo * @dias
	
	--Inserto la reserva, devuelvo el costo de la reserva en caso de que no hayan errores.
	insert Reservas (estado_reserva, fecha_inicio, fecha_final, nombre_cli, numero_hab, nombre_hotel) values
	('ACTIVA',@F_inicio,@F_fin,@Nombre_Cli,@Numero_Hab, @Nombre_Hotel)
	SET @aux=@@ERROR
	IF @aux=0 
	RETURN @total;
	ELSE RETURN @aux
	
END
GO

create proc eliminarReservaCascada
@nomHotel varchar(100)
as 
begin
	declare @respuesta int
	delete from Reservas where nombre_hotel = @nomHotel
	set @respuesta = @@ERROR
	if @respuesta <> 0
		return -1 /*ERROR Eliminar reserva cascada*/
	else
		return 0 
end
go

create proc listadoReservasCronologica
@nombreHotel varchar(100),
@numeroHab int
as
begin
	select * from Reservas 
	where nombre_hotel = @nombreHotel and numero_hab = @numeroHab
	order by fecha_inicio DESC
end
go

create proc eliminarReserva
@nomHotel varchar(100),
@numeroHab int
as 
begin
	declare @respuesta int
	delete from Reservas 
	where nombre_hotel = @nomHotel 
	and numero_hab = @numeroHab
	set @respuesta = @@ERROR
	if @respuesta <> 0
		return -1 /*ERROR eliminar reserva*/
	else
		return 0
end
go

/**************************
	SP DE HABITACIONES
***************************/
create proc listarHabitacionesDeHotel
@nombre varchar(100)
as
begin 
	select ha.* from Habitaciones ha join Hoteles ho
	on ho.nombre = @nombre
	and ha.nombre_hotel = @nombre
end
go

create proc obtenerHabitacionDeHotel
@nombreHotel varchar(100),
@numeroHabitacion varchar(100)
as
begin
	select ha.* from Habitaciones ha join Hoteles ho
	on ho.nombre = @nombreHotel
	and ha.nombre_hotel = nombre_hotel
	and ha.numero = @numeroHabitacion
end
go

create proc agregarHabitacion
@numero int,
@nombreHotel varchar(100),
@descripcion varchar(100),
@cantHuesped int,
@costo decimal,
@piso int
as 
begin
	declare @resultado int
	 
	if exists (select nombre_hotel from Habitaciones where nombre_hotel = @nombreHotel and numero = @numero)
		return -1 /*ERROR habitacion ya existe*/

	insert into Habitaciones
	values(@numero, @nombreHotel, @descripcion, @cantHuesped, @costo, @piso)
	set @resultado = @@ERROR
	if @resultado <> 0
		return -2 /*ERROR SQL*/
end 
go

create proc modificarHabitacion
@numero int,
@nombreHotel varchar(100),
@descripcion varchar(100),
@cantHuesped int,
@costo decimal,
@piso int
as 
begin
	declare @resultado int
	if not exists (select nombre_hotel from Habitaciones where nombre_hotel = @nombreHotel and numero = @numero)
		return -1 /*ERROR habitacion no existe*/

	update Habitaciones 
	set descripcion = @descripcion, 
		cant_huesped = @cantHuesped,
		costo = @costo,
		piso = @piso
	where numero = @numero
	and nombre_hotel = @nombreHotel
	set @resultado = @@ERROR
	if @resultado <> 0
		return -2 /*ERROR SQL*/
end
go

create proc eliminarHabitacionCascada
@nomHotel varchar(100)
as
begin
	begin tran
		declare @reserva int 
		exec @reserva = eliminarReservaCascada @nomHotel

		if @reserva <> 0
		begin
			rollback
			return -1 /* ERROR Eliminar reserva cascada*/
		end
	
		declare @respuesta int
		delete from Habitaciones 
		where nombre_hotel = @nomHotel
		set @respuesta = @@ERROR
		if @respuesta <> 0
		begin
			rollback
			return -2 /*ERROR Eliminar habitacion cascada*/
		end
		else 
		begin
			commit tran
			return 0
		end
end
go

create proc eliminarHabitacion
@nomHotel varchar(100),
@numeroHab int
as
begin 
	begin tran
		if not exists (select nombre_hotel from Habitaciones where nombre_hotel = @nombreHotel and numero = @numero)
			return -1 /*ERROR habitacion no existe*/

		declare @resultado int
		exec @resultado = eliminarReserva @nomHotel, @numeroHab
		if @resultado <> 0
		begin
			rollback
			return -2 /*ERROR Eliminar reserva*/
		end
		
		declare @respuesta int
		delete from Habitaciones 
		where nombre_hotel = @nomHotel and numero = @numeroHab
		set @respuesta = @@ERROR
		if @respuesta <> 0
		begin
			rollback
			return -3 /*ERROR Eliminar habitacion*/
		end
		else 
		begin
			commit tran
			return 0
		end

end 
go

/***********************
	SP DE HOTELES
***********************/
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
@nomHotel varchar(100)
as
begin
	
	begin tran
		declare @respuesta int, @habitacion int

		exec @habitacion = eliminarHabitacionCascada @nomHotel
		if @habitacion <> 0
		begin
			rollback
			return -1 /*ERROR Eliminar habitacion*/
		end

		delete from Hoteles where nombre = @nomHotel
		set @respuesta = @@ERROR
		if @respuesta <> 0
		begin
			rollback
			return -2 /*ERROR Eliminar hotel*/
		end
		else
		begin
			commit tran
			return 0
		end
end
go

create proc ListarCategoria
@cat int
as
begin 
	select * from Hoteles
	where categoria = @cat
end
go


/******************************************/
/*			Consultas de prueba			  */
/******************************************/
-- exec agregarAdministrador 'pepe','clave','pepe gonzales','administrativo'
-- exec agregarCliente 'braddy','braddyclave','brad pit','direccion braddy',5225283915454785
-- exec buscarAdministrador 'pepe', 'clave'
-- exec buscarCliente 'tito','titoclave'
-- select * from Usuarios
-- select * from Administradores
-- select * from Clientes
-- select * from Telefono_Clientes
-- select * from Hoteles
-- select * from Habitaciones
-- exec ListarAdmins
--EXEC listarHabitacionesDeHotel 'hotel'
--select * from Reservas
DECLARE @resp int
EXEC @resp = RealizarReserva  '20171002', '20171011', 'cli', 100, 'hotel'
IF @resp=-1
     PRINT 'El usuario no se encuentra registrado. No se pudo realizar la reserva.'
     
ELSE IF @resp=-2
     PRINT 'El período de reserva no puede ser negativo. No se pudo realizar la reserva.'          
     
ELSE IF @resp=-3
     PRINT 'Esta habitacion ya se encuentra reservada en la fecha solicitada, no es posible realizar la reserva.'

ELSE IF @resp<0 AND @resp<>-1 AND @resp<>-2 AND @resp<>-3
	PRINT 'Ocurrió un error. No se pudo insertar la reserva.'

ELSE IF @resp>0
	PRINT '¡Habitacion reservada correctamente!' 
GO

