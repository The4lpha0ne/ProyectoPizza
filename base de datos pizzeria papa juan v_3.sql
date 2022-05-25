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
    Fecha date,
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
alter table Factura add foreign key(NumeroPedido) REFERENCES Pedido(NumeroPedido);

insert into Pizza(Nombre,Tamano, Precio) values
("Margarita", "Mediana", 12.00),
("Margarita", "Pequena", 7.00),
("Margarita", "Grande", 15.00),
("Marinera", "Mediana", 12.00),
("Marinera", "Pequena", 7.00),
("Marinera", "Grande", 15.00),
("Barbacoa", "Grande", 15.00),
("Barbacoa", "Mediana", 12.00),
("Barbacoa", "Pequena", 7.00);

insert into Pedido(NumeroPedido,Cantidad,Nombre,Tamano) values 
(54321, 2, "Margarita", "Mediana"),
(84212, 1, "Barbacoa", "Pequena"),
(45673, 3, "Marinera", "Grande");

insert into Cliente(Telefono,Nombre,Direccion,C_Postal,NumeroPedido) values 
(645374669, "Pedro", "calle_fulanito", 45632, 54321),
(876342781, "Eduardo", "calle_melancolia", 34652, 45673),
(965342776, "Juan", "calle_de_la_pasa", 52789, 84212);

insert into Factura(IdFactura, Fecha, NumeroPedido) values
(7357865, 2022-02-01, 84212),
(7345621, 2022-03-21, 54321),
(9853470, 2022-01-12, 45673);