drop database if exists pizzeria;
create database pizzeria;
Use pizzeria;


Create table Cliente(
    Telefono int(15) primary key,
    Nombre varchar(25),
    Direccion varchar(40),
    C_Postal int(5),
    NumeroPedido int(10),

    FOREIGN key (NumeroPedido) references Pedido(NumeroPedido) 
);


create table Pedido(
    NumeroPedido int(10) primary key,
    Cantidad int(15),
    Nombre varchar(25),
    Tamaño varchar(10),
    Telefono int(9),
    
    FOREIGN key (Nombre) references Pizza(Nombre),
    FOREIGN key (Tamaño) references Pizza(Tamaño) ,
    FOREIGN key (Telefono) references Cliente(Telefono)
);


Create table Factura(
    IdFactura int(10) primary key,
    Fecha datetime,
    IGIC float(3),
    NumeroPedido int(10),

    FOREIGN key (NumeroPedido) references Pedido(NumeroPedido) 
);

Create table Pizza(
    Nombre varchar(25),
    Tamaño varchar(10) ,
    Precio float(4), 
    primary key(Nombre, Tamaño)
);