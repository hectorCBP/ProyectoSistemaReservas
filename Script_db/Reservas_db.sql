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
	foreign key (nombre) references Clientes(nombre)
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
	numero			int identity not null,
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

insert into Usuarios values('adm','adm12345','adm_uno')
insert into Usuarios values('cli','cli12345','adm_uno')
insert into Usuarios values('Juan','juan1234','Juan Perez')
insert into Usuarios values('Carlos','carlos12','Carlos Lopez')
insert into Usuarios values('Lucas','lucas123','Lucas Martinez')
insert into Usuarios values('Laura','laura123','Laura Sanchez')
insert into Usuarios values('Carla','carla123','Carla Suarez')
insert into Usuarios values('Sofia','sofia123','Sofia Suarez')
insert into Usuarios values('usr','usr12345','usr_hard')

insert into Administradores values('adm','super_adm')
insert into Administradores values('Carlos','Gerente')
insert into Administradores values('Laura','Encargada')

insert into Clientes values('Carla','Rondeau768',1234567891011123)
insert into Clientes values('Lucas','Agraciada567',1234567891051123)
insert into Clientes values('Sofia','Agraciada567',1234567891011823)
insert into Clientes values('cli','jujuy',1234565291014123)
insert into Clientes values('Juan','jujuy',1234537891011123)
insert into Clientes values('usr','direccion','0123456789012345')

insert into Telefono_Clientes values('Carla','1122334455')

insert into Hoteles values('Europa','Uruguay',123,'Montevideo',2,'123456789','012345678','imagenes/uno.jpg',1,1)
insert into Hoteles values('Radisson','Juncal',123,'Montevideo',3,'123456789','012345678','imagenes/uno.jpg',1,1)
insert into Hoteles values('Sisai','Magallanes',123,'Montevideo',3,'123456789','012345678','imagenes/uno.jpg',1,1)
insert into Hoteles values('La Foret','Mercedes',123,'Montevideo',3,'123456789','012345678','imagenes/uno.jpg',1,1)
insert into Hoteles values('Resort&Spa','Colonia',321,'Punta Del Este',5,'987654321','123456789','imagenes/dos.jpg',0,1)
insert into Hoteles values('Sol&Luna','Estados Unidos',321,'Montevideo',5,'987654321','123456789','imagenes/dos.jpg',0,1)
insert into Hoteles values('Enjoy','Estados Unidos',321,'Punta Del Este',5,'987654321','123456789','imagenes/dos.jpg',0,1)
insert into Hoteles values('Howard Johnson','Carrasco',321,'Montevideo',4,'987654321','123456789','imagenes/dos.jpg',0,1)
insert into Hoteles values('Cottage','Miraflores',321,'Montevideo',4,'987654321','123456789','imagenes/dos.jpg',0,1)
insert into Hoteles values('InterCity','Agraciada',321,'Montevideo',4,'987654321','123456789','imagenes/dos.jpg',0,1)

insert into Habitaciones values(100,'Europa','Ideal habitacón para relajarse en familia.',2,2000,1)
insert into Habitaciones values(105,'Europa','Ideal habitacón para relajarse en familia.',2,2000,1)
insert into Habitaciones values(106,'Radisson','Hermosa habitación con vista al mar.',3,2200,1)
insert into Habitaciones values(107,'Radisson','Hermosa habitación con vista al mar.',3,2200,1)
insert into Habitaciones values(101,'Radisson','Hermosa habitación con vista al mar.',3,2200,1)
insert into Habitaciones values(102,'InterCity','Linda habitación con salida a la piscina.',1,1400,1)
insert into Habitaciones values(108,'InterCity','Linda habitación con salida a la piscina.',1,1400,1)
insert into Habitaciones values(109,'Cottage','Ideal para vacacionar en familia.',1,1400,1)
insert into Habitaciones values(110,'Howard Johnson','Ideal para vacacionar en familia.',1,1400,1)

insert into Habitaciones values(103,'Cottage','Ideal para vacacionar en familia.',1,1400,1)
insert into Habitaciones values(104,'Howard Johnson','Ideal para vacacionar en familia.',1,1400,1)
insert into Habitaciones values(103,'Sol&Luna','Ideal para vacacionar en familia.',1,1400,1)
insert into Habitaciones values(111,'Sol&Luna','Ideal para vacacionar en familia.',1,1400,1)


insert into Reservas values('ACTIVA', '2018/04/12', '2018/04/15', 'Lucas', 100, 'Europa')
insert into Reservas values('ACTIVA', '2018/04/19', '2018/04/20', 'Lucas', 102, 'InterCity')
insert into Reservas values('ACTIVA', '2018/04/19', '2018/04/20', 'Lucas', 103, 'Cottage')

insert into Reservas values('ACTIVA', '2018/05/19', '2018/05/20', 'Sofia', 103, 'Cottage')
insert into Reservas values('ACTIVA', '2018/05/12', '2018/05/15', 'Sofia', 101, 'Radisson')



go
/******************************************/
/*		Procedimientos de almacenado	  */
/******************************************/

/***********************
	SP DE USUARIO
************************/

-- RETORNA UN ADMINISTRADOR POR NOMBRE Y CLAVE
-- usado en login
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

-- RETORNA UN ADMINISTRADOR POR NOMBRE
-- utilizado en la pagina de agregar 
-- administrador
create proc BuscarAdmin
@nombre varchar(100)
as
begin
	select	u.nombre as 'nombre',
			u.clave as 'clave',
			u.nombre_completo as 'nombre_completo',
			a.cargo as 'cargo' 
	from usuarios u join administradores a 
	on (u.nombre = a.nombre) and a.nombre=@nombre
end
go

-- INSERTA UN ADMINISTRADOR
create proc agregarAdministrador
@nombre			varchar (100), 
@clave			varchar (100),
@nombreCompleto	varchar (100),
@cargo			varchar	(100)
as
begin
	declare @resultado int

	if exists (select * from Usuarios where nombre=@nombre)
		return -1 -- error ya existe usuario
		
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

-- MODIFICA UN ADMINISTRADOR
create proc modificarAdmin
@nombre			varchar (100), 
@clave			varchar (100),
@nombreCompleto	varchar (100),
@cargo			varchar	(100)
as
begin
	
	declare @resultado int
		
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

-- ELIMINA UN REGISTRO FISICO DE ADMINISTRADOR
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

-- RETORNA UNA LISTA DE ADMINISTRADORES
create proc ListarAdmins
--alter proc ListarAdmins
as
begin
	select	u.nombre as 'nombre',
		u.clave as 'clave',
		u.nombre_completo as 'nombre_completo',
		a.cargo as 'cargo' 
	from usuarios u join administradores a 
	on (u.nombre = a.nombre)
end
go

/**************************************/

-- INSERTA UN CLIENTE
create proc agregarCliente
@nombre varchar(100),
@clave	varchar(100),
@nombreCompleto varchar(100),
@direccion varchar(100),
@numeroTarjeta varchar(100)
as 
begin
	
	declare @resultado int
	
	if exists (select nombre from Usuarios where nombre=@nombre)

		return -1 /*usuario ya existe*/	
		
	begin tran

		insert into Usuarios values (@nombre, @clave, @nombreCompleto)
		set @resultado = @@ERROR
		if @resultado <> 0
		begin
			
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

-- INSERTA TELEFONO DE UN CLEINTE
create proc agregarTelefono
--alter proc agregarTelefono
@nombre varchar(100),
@telefono varchar (100)
as
begin
declare @errorAux int
	if not exists (select * from Clientes where nombre=@nombre)
		return -1
	else
	insert into Telefono_Clientes (nombre,telefono) values (@nombre,@telefono)
	set @errorAux = @@ERROR
	if @errorAux<>0
		return -2;
	else
		return 1
end
go

-- RETORNA UN CLIENTE POR NOMBRE Y CLAVE
-- usado en login
create proc buscarCliente
--alter proc buscarCliente
@nombre varchar(100),
@clave varchar(100)
as
begin
	select c.*, u.nombre_completo, u.clave from Clientes c join Usuarios u
	on u.nombre = @nombre
	and u.clave = @clave
	and u.nombre = c.nombre

end
go

-- RETORNA UN CLIENTE POR NOMBRE
-- usado en la pagina de administrador
-- cuando el sp BuscarAdmin retorna null
-- verifica a traves de este sp que el
-- nombre de usuario a agregar no exista
-- como cliente
create proc buscarClienteNombre
--alter proc buscarCliente
@nombre varchar(100)
as
begin
	select*from Clientes c join Usuarios u
	on u.nombre = @nombre
	and u.nombre = c.nombre
end
go

-- RETORNA UNA LISTA DE CLIENTES
create proc ListarClientes
--alter proc ListarClientes
as
begin
	select	u.nombre as 'nombre',
			u.clave as 'clave',
			u.nombre_completo as 'nombre_completo', 
			c.direccion as 'direccion', 
			c.numero_tarjeta_credito as 'tarjeta de credito' 
	from usuarios u join Clientes c 
	on (u.nombre = c.nombre)
end
go

-- RETORNA UNA LISTA DE TELEFONOS DE UN CLIENTE
create proc TelefonosCliente 
@nombre varchar(100)
as
begin
	select t.telefono from Telefono_Clientes t where (t.nombre=@nombre)
end
go


/************************
	SP DE RESERVAS
*************************/

-- BUSCA RESERVAS POR SU NUMERO
--exec BuscarReserva 1
create proc BuscarReserva
--alter proc BuscarReserva
@numero int
as
begin
	select*from Reservas where @numero=numero	
end
go

-- RETORNA LISTA DE RESERVAS ACTIVAS
--exec reservasActivas
create proc reservasActivas
as
begin 
	select * from Reservas
	where estado_reserva = 'ACTIVA'
end
go

-- RETORNA LISTA DE RESERVAS ACTIVAS POR CLIENTE
--exec reservasActivasCliente 'cli'
create procedure reservasActivasCliente
@nombre varchar(100)
as
begin 
	select * from Reservas
	where estado_reserva = 'ACTIVA' and nombre_cli=@nombre
end
go

-- FINALIZA UNA RESERVA
create proc finalizarReserva
@id int
as
begin
	declare @respuesta int
	declare @fechaFin date
	SELECT @fechaFin = fecha_final from Reservas where numero=@id
	if(GETDATE()<@fechaFin)
		return -2
	update Reservas 
	set estado_reserva = 'FINALIZADA'
	where numero = @id
	set @respuesta = @@ERROR
	if @respuesta <> 0
		return -1 /*ERROR al actualizar*/
	else 
		return 0
end
go

-- CANCELA UNA RESERVA
create proc CancelarReserva
--alter proc BuscarReserva
@numero int
as
begin
	declare @aux int
	UPDATE Reservas SET estado_reserva='CANCELADA' WHERE numero=@numero
	SET @aux=@@ERROR
	IF @aux=0 
	RETURN 1;
	ELSE RETURN @aux
end
go

-- BUSCA UNA RESERVA POR FECHA
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

-- INSERTA UNA RESERVA
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
	
	--Controlo que la habitacion se encuentre disponible en la fecha ingresada.
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

-- RETORNA UNA LISTA DE RESERVAS POR ESTADO
create proc listadoReservasCronologica
--alter proc listadoReservasCronologica
@nombreHotel varchar(100),
@numeroHab int,
@filtro varchar(100)
as
begin
	if(@filtro<>''and (select COUNT (numero) from Reservas 
	where nombre_hotel = @nombreHotel and numero_hab = @numeroHab and estado_reserva=@filtro)=0 )
	return -1
	select * from Reservas 
	where nombre_hotel = @nombreHotel and numero_hab = @numeroHab and estado_reserva like @filtro + '%'
	order by fecha_inicio DESC
end
go

-- ELIMINA EL REGISTRO FISICO DE UNA RESERVA
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

-- RETORNA UNA LISTA DE HABITACIONES DE UN HOTEL
create proc listarHabitacionesDeHotel
@nombre varchar(100)
as
begin 
	select ha.* from Habitaciones ha join Hoteles ho
	on ho.nombre = @nombre
	and ha.nombre_hotel = @nombre
end
go

-- RETORNA UNA HABITACION DE UN HOTEL
create proc obtenerHabitacionDeHotel
@nombreHotel varchar(100),
@numeroHabitacion int
as
begin
	select ha.* from Habitaciones ha, Hoteles ho 
	where ho.nombre = @nombreHotel and ho.nombre = ha.nombre_hotel and ha.numero = @numeroHabitacion
end
go

-- INSERTA UNA HABITACION
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

-- MODIFCA UNA HABITACION
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

-- ELIMINA EL REGISTRO FISICO DE UNA HABITACION
create proc eliminarHabitacion
@nomHotel varchar(100),
@numeroHab int
as
begin 

	if not exists (select * from Habitaciones where nombre_hotel = @nomHotel and numero = @numeroHab)
		return -1 -- error la habitacion no existe en el hotel

	begin tran
		delete from Reservas where nombre_hotel = @nomHotel and numero_hab = @numeroHab				
		if (@@ERROR <> 0)
		begin
			rollback
			return -2 -- error al eliminar reserva
		end
		
		delete from Habitaciones where nombre_hotel = @nomHotel and numero = @numeroHab
		if (@@ERROR <> 0)
		begin
			rollback
			return -3 -- error al eliminar habitacion
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

-- RETORNA UNA LISTA DE HOTELES
create proc obtenerHoteles
as
begin
	select * from Hoteles
end 
go

-- RETORNA UN HOTEL
create proc buscarHotel
@nombre varchar(100)
as
begin
	select * from Hoteles where nombre = @nombre;
end
go

-- INSERTA UN HOTEL
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

-- MODIFICA UN HOTEL
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

-- ELIMINIA UN HOTEL
create proc eliminarHotel
@nomHotel varchar(100)
as
begin
	
	if not exists(select * from Hoteles where nombre = @nomHotel)
		return -1 -- error el hotel no existe
	
	begin tran
			
		-- elimino las reservas asociadas
		delete from Reservas where nombre_hotel = @nomHotel
		if(@@ERROR <> 0)
		begin
			rollback
			return -2 -- error al eliminar reservas del hotel
		end
		
		-- elimino las habitaciones asociadas
		delete from Habitaciones where nombre_hotel = @nomHotel
		if(@@ERROR <> 0)
		begin
			rollback
			return -3 -- error al eliminar habitaciones del hotel
		end
		
		-- elimino el hotel
		delete from Hoteles where nombre = @nomHotel
		if(@@ERROR <> 0)
		begin
			rollback
			return -4 -- error al eliminar hotel
		end
		else
		begin
			commit tran
			return 0
		end
		
end
go

-- RETORNA UNA LISTA DE HOTELES POR CATEGORIA
--exec ListarCategoria 3
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
-- select * from Reservas
-- select * from Habitaciones
-- exec ListarAdmins
--select * from Reservas
DECLARE @resp int
EXEC @resp = RealizarReserva  '20181002', '20181011', 'cli', 104, 'Howard Johnson'
EXEC @resp = RealizarReserva  '20181102', '20181111', 'cli', 100, 'Europa'
EXEC @resp = RealizarReserva  '20181002', '20181011', 'cli', 101, 'Radisson'
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

