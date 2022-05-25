drop database if exists pizzeria;
create database pizzeria;
Use pizzeria;

Create table Cliente(
    Telefono int(15) PRIMARY KEY,
    Nombre varchar(25),
    Direccion varchar(40),
    C_Postal int(5),
    NumeroPedido int(10)
 
);


Create table Pedido(
    NumeroPedido int(10),
    Cantidad int(15),
    Nombre varchar(25),
    Tamano varchar(10),
    PRIMARY KEY(NumeroPedido, Nombre, Tamano)
);

Create table Factura(
    IdFactura int(10) PRIMARY KEY,
    Fecha datetime,
    IGIC float(3),
    NumeroPedido int(10)

);



Create table Pizza(
    Nombre varchar(25),
    Tamano varchar(10),
    Precio float(4), 
    PRIMARY KEY(Nombre, Tamano)

);

alter table Cliente add foreign key(NumeroPedido) references Pedido(NumeroPedido);
alter table Pedido add foreign key(Nombre, Tamano) REFERENCES Pizza(Nombre, Tamano);
alter table Pedido add foreign key(Telefono) REFERENCES Cliente(Telefono);
alter table Factura add foreign key(NumeroPedido) REFERENCES Pedido(NumeroPedido);

insert into Pizza(Nombre,Tamano, Precio) values
("Margarita", "Mediana", 12.00);

insert into Pedido(NumeroPedido,Cantidad,Nombre,Tamano) values 
(54321, 2, "Margarita", "Mediana");

insert into Cliente(Telefono,Nombre,Direccion,C_Postal,NumeroPedido) values 
(645374669, "Pedro", "calle_fulanito", 45632, 54321);

