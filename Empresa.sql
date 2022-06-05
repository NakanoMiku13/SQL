create table Empleado(
	nss int not null unique primary key,
	nombre char(50) not null,
	apPat char(50) not null,
	apMat char(50) not null,
	fnac date,
	sexo char(3),
	salario float,
	nd int,
	dir char(150),
	nssSuper int,
	foreign key (nssSuper) references Empleado(nss) on delete set null on update cascade
);
create table Dependiente(
	nombre char(50) not null,
	nssEmp int not null unique,
	sexo char(3),
	parentezco char(50),
	fnac date,
	constraint pk
	primary key (nombre,nssEmp),
	foreign key (nssEmp) references Empleado(nss) on update cascade on delete set default
);
create table Departamento(
	numD serial not null unique primary key,
	finiger date,
	nombreD char(50),
	nssGte int not null unique,
	foreign key (nssGte) references Empleado(nss) on delete set default on update cascade
);
create table Proyecto(
	numP serial not null unique primary key,
	nomP char(50) not null,
	ubicacion char(150),
	pControl int not null unique,
	foreign key (pControl) references Departamento(numD) on delete set default on update cascade
);
create table Trabaja_en(
	nssEmp int not null,
	numP int not null,
	horas time,
	constraint pkT
	primary key (nssEmp),
	foreign key (nssEmp) references Empleado(nss) on delete set default on update cascade,
	foreign key (numP) references Proyecto(numP) on delete set default on update cascade
);
alter table proyecto 
create table lugar_Depto(
	numD int not null,
	lugar char(150),
	constraint pkLD
	primary key (numD,lugar),
	foreign key (numD) references Departamento(numD) on delete set default on update cascade
);

