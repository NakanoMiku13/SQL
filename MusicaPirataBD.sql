--create database MusicaPiratas;
--drop database MusicaPirata;

create table Persona (
	id int primary key not null unique generated always as identity,
	Nombre char(50) not null,
	aPat char(50),
	aMat char(50),
	Genero char(3),
	Edad int,
	Telefono char(19),
	Direccion char(250),
	Correo char(70)
);
create table Empleado(
	id int not null unique,
	Salario int,
	Contratado date,
	foreign key (id) references Persona (id)
);
create table Cliente(
	id int not null unique,
	NoCompras int,
	foreign key (id) references Persona (id)
);
create table Producto(
	nSerie int primary key not null unique generated always as identity,
	tipoP char(75) not null,
	Precio int,
	Tamanio int,
	Formato char(15),
	Material char(15)
);
create table Pelicula(
	nSerie int not null unique,
	Reparto char(250),
	NomActor char(250),
	foreign key (nSerie) references Producto(nSerie)
);
create table Musica(
	nSerie int not null unique,
	Nombre char(50),
	Artista char(150),
	Duracion time,
	foreign key (nSerie) references Producto(nSerie)
);
create table Gadget(
	nSerie int not null unique,
	Nombre char(50),
	foreign key (nSerie) references Producto(nSerie)
);
create table Serie(
	nSerie int not null unique,
	Nombre char(150),
	Temporada int,
	foreign key (nSerie) references Producto(nSerie)
);
create table Promocion(
	id int not null unique generated always as identity,
	idEmpCreador int not null,
	Premio char(150),
	fechaEntrega date,
	foreign key (idEmpCreador) references Persona(id)
);
create table EmpleadoContrataCliente(
	idCliente int not null,
	idEmpleado int not null,
	fechaContrato date,
	foreign key (idCliente) references Cliente(id),
	foreign key (idEmpleado) references Empleado(id)
);
create table EvaluacionEmpleadoCliente(
	idEmpleado int not null,
	idCliente int not null,
	Evaluacion int,
	foreign key (idCliente) references Cliente(id),
	foreign key (idEmpleado) references Empleado(id)
);
create table EvaluacionEmpleadoEmpleado(
	idEvaluador int not null,
	idEvaluado int not null,
	Evaluacion int,
	foreign key (idEvaluador) references Empleado(id),
	foreign key (idEvaluado) references Empleado(id)
);
create table EvaluacionClienteEmpleado(
	idEmpleado int not null,
	idCliente int not null,
	Evaluacion int,
	foreign key (idCliente) references Cliente(id),
	foreign key (idEmpleado) references Empleado(id)
);
