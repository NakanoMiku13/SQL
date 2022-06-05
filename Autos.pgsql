create table Agencia(
    numAgencia int not null unique primary key,
    direccion char(50) not null
);
create table Estacionamiento(
    numEstacion int not null unique primary key,
    nombre char(50) not null,
    direccion char(150),
    tipoEstacion char(50)
);

create table Cajon(
    codigoCajon int not null unique,
    numEsta int not null,
    tipo char(25),
    constraint pkCajon
    primary key (codigoCajon),
    constraint fkCajon
    foreign key (numEsta) references estacionamiento(numEstacion) on delete set default on update cascade
);
create table Coche(
    placa char(50) not null unique,
    cdCajon int not null,
    marca char(50),
    color char(50),
    modelo char(50),
    constraint pkCoche
    primary key (placa),
    constraint fkCoche1
    foreign key (cdCajon) references Cajon(codigoCajon) on delete set default on update cascade
);
create table Cliente(
    codigo int not null unique primary key,
    rfc char(50) not null unique,
    telefono char(15) not null unique,
    nombre char(25) not null,
    apPat char(25),
    apMat char(25),
    direccion char(150),
    cdAvaluado int not null,
    constraint fkCliente
    foreign key(cdAvaluado) references cliente(codigo) on delete set default on update cascade
);
create table Reservacion(
    folio int not null unique,
    cdClie int not null,
    placaCoche char(50) not null,
    fechaInicio date not null,
    fechaFin date not null,
    noAgencia int not null,
    constraint pkReservacion
    primary key (folio,cdClie),
    constraint fkReserCoche
    foreign key (placaCoche) references Coche(placa) on delete set default on update cascade,
    constraint fkReservacion
    foreign key (cdClie) references cliente(codigo) on delete set default on update cascade,
    constraint fkReservacionAgencia foreign key (noAgencia) references Agencia(numAgencia) on delete set default on update cascade
);




