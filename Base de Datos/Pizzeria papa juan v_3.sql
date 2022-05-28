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

alter table Cliente add foreign key(NumeroPedido) references Pedido(NumeroPedido) ON DELETE CASCADE ON UPDATE CASCADE;
alter table Pedido add foreign key(Nombre, Tamano) REFERENCES Pizza(Nombre, Tamano) ON DELETE CASCADE ON UPDATE CASCADE;
alter table Factura add foreign key(NumeroPedido) REFERENCES Pedido(NumeroPedido) ON DELETE CASCADE ON UPDATE CASCADE ;

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
(54321, 1, "Barbacoa", "Grande"),
(84212, 1, "Barbacoa", "Pequena"),
(45673, 1, "Marinera", "Grande"),
(45673, 1, "Marinera", "Pequena"),
(45673, 1, "Margarita", "Pequena");

insert into Cliente(Telefono,Nombre,Direccion,C_Postal,NumeroPedido) values 
(645374669, "Pedro", "calle_fulanito", 45632, 54321),
(876342781, "Eduardo", "calle_melancolia", 34652, 45673),
(965342776, "Juan", "calle_de_la_pasa", 52789, 84212);

insert into Factura(IdFactura, Fecha, NumeroPedido) values
(7357865, '2022-02-01', 84212),
(7345621, '2022-03-21', 54321),
(9853470, '2022-01-12', 45673);


/*Consultas*/

/*1.Queremos que nos muestre la información de todas las pizzas que sean de tamaño grande.*/
select * from Pizza where Tamano = "Grande";
+-----------+--------+--------+
| Nombre    | Tamano | Precio |
+-----------+--------+--------+
| Barbacoa  | Grande |     15 |
| Margarita | Grande |     15 |
| Marinera  | Grande |     15 |
+-----------+--------+--------+

/*2.Queremos que nos muestre la información de los clientes cuyo nombre termine en 'o'.*/
select * from Cliente where Nombre like "%o";
+-----------+---------+------------------+----------+--------------+
| Telefono  | Nombre  | Direccion        | C_Postal | NumeroPedido |
+-----------+---------+------------------+----------+--------------+
| 645374669 | Pedro   | calle_fulanito   |    45632 |        54321 |
| 876342781 | Eduardo | calle_melancolia |    34652 |        45673 |
+-----------+---------+------------------+----------+--------------+

/*3.Queremos ordenar las pizzas según su Precio*/
select * from Pizza
order by Precio desc;
+-----------+---------+--------+
| Nombre    | Tamano  | Precio |
+-----------+---------+--------+
| Barbacoa  | Grande  |     15 |
| Margarita | Grande  |     15 |
| Marinera  | Grande  |     15 |
| Barbacoa  | Mediana |     12 |
| Margarita | Mediana |     12 |
| Marinera  | Mediana |     12 |
| Barbacoa  | Pequena |      7 |
| Margarita | Pequena |      7 |
| Marinera  | Pequena |      7 |
+-----------+---------+--------+

/*4.Queremos saber el numero del pedido de los clientes que han pedido una pizza pequeña sin que sus números se repitan*/
select distinct(NumeroPedido) from Pedido
where Tamano = "Pequena";
+--------------+
| NumeroPedido |
+--------------+
|        45673 |
|        84212 |
+--------------+

/*5.Queremos saber la calle en la que viven los clientes cuyo nombre tiene 'ua'*/
select Nombre, Direccion from Cliente
where Nombre like "%ua%";

+---------+------------------+
| Nombre  | Direccion        |
+---------+------------------+
| Eduardo | calle_melancolia |
| Juan    | calle_de_la_pasa |
+---------+------------------+

/*Consultas multitablas*/

/*Seleccionar el nombre del cliente que haya pedido una pizza mediana*/
select Cliente.Nombre from Cliente
inner join Pedido on  Cliente.NumeroPedido = Pedido.NumeroPedido 
where Pedido.Tamano = "Mediana";  
+--------+
| Nombre |
+--------+
| Pedro  |
+--------+

/*Seleccionar el nombre aquellos clientes donde la id de su factura sea 9853470*/
select distinct(Cliente.Nombre) from Cliente
inner join Pedido on  Cliente.NumeroPedido = Pedido.NumeroPedido
inner join Factura on Pedido.NumeroPedido = Factura.NumeroPedido
where Factura.IdFactura = 9853470;
+---------+
| Nombre  |
+---------+
| Eduardo |
+---------+

/*Contar cuantas veces pidió eduardo una pizza pequeña*/
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
(54321, 1, "Barbacoa", "Grande"),
(84212, 1, "Barbacoa", "Pequena"),
(45673, 1, "Marinera", "Grande"),
(45673, 1, "Marinera", "Pequena"),
(45673, 1, "Margarita", "Pequena");

insert into Cliente(Telefono,Nombre,Direccion,C_Postal,NumeroPedido) values 
(645374669, "Pedro", "calle_fulanito", 45632, 54321),
(876342781, "Eduardo", "calle_melancolia", 34652, 45673),
(965342776, "Juan", "calle_de_la_pasa", 52789, 84212);

insert into Factura(IdFactura, Fecha, NumeroPedido) values
(7357865, 2022-02-01, 84212),
(7345621, 2022-03-21, 54321),
(9853470, 2022-01-12, 45673);


/*Consultas*/

/*1.Queremos que nos muestre la información de todas las pizzas que sean de tamaño grande.*/
select * from Pizza where Tamano = "Grande";
+-----------+--------+--------+
| Nombre    | Tamano | Precio |
+-----------+--------+--------+
| Barbacoa  | Grande |     15 |
| Margarita | Grande |     15 |
| Marinera  | Grande |     15 |
+-----------+--------+--------+

/*2.Queremos que nos muestre la información de los clientes cuyo nombre termine en 'o'.*/
select * from Cliente where Nombre like "%o";
+-----------+---------+------------------+----------+--------------+
| Telefono  | Nombre  | Direccion        | C_Postal | NumeroPedido |
+-----------+---------+------------------+----------+--------------+
| 645374669 | Pedro   | calle_fulanito   |    45632 |        54321 |
| 876342781 | Eduardo | calle_melancolia |    34652 |        45673 |
+-----------+---------+------------------+----------+--------------+

/*3.Queremos ordenar las pizzas según su Precio*/
select * from Pizza
order by Precio desc;
+-----------+---------+--------+
| Nombre    | Tamano  | Precio |
+-----------+---------+--------+
| Barbacoa  | Grande  |     15 |
| Margarita | Grande  |     15 |
| Marinera  | Grande  |     15 |
| Barbacoa  | Mediana |     12 |
| Margarita | Mediana |     12 |
| Marinera  | Mediana |     12 |
| Barbacoa  | Pequena |      7 |
| Margarita | Pequena |      7 |
| Marinera  | Pequena |      7 |
+-----------+---------+--------+

/*4.Queremos saber el numero del pedido de los clientes que han pedido una pizza pequeña sin que sus números se repitan*/
select distinct(NumeroPedido) from Pedido
where Tamano = "Pequena";
+--------------+
| NumeroPedido |
+--------------+
|        45673 |
|        84212 |
+--------------+

/*5.Queremos saber la calle en la que viven los clientes cuyo nombre tiene 'ua'*/
select Nombre, Direccion from Cliente
where Nombre like "%ua%";

+---------+------------------+
| Nombre  | Direccion        |
+---------+------------------+
| Eduardo | calle_melancolia |
| Juan    | calle_de_la_pasa |
+---------+------------------+

/*Consultas multitablas*/

/*Seleccionar el nombre del cliente que haya pedido una pizza mediana*/
select Cliente.Nombre from Cliente
inner join Pedido on  Cliente.NumeroPedido = Pedido.NumeroPedido 
where Pedido.Tamano = "Mediana";  
+--------+
| Nombre |
+--------+
| Pedro  |
+--------+

/*Seleccionar el nombre aquellos clientes donde la id de su factura sea 9853470*/
select distinct(Cliente.Nombre) from Cliente
inner join Pedido on  Cliente.NumeroPedido = Pedido.NumeroPedido
inner join Factura on Pedido.NumeroPedido = Factura.NumeroPedido
where Factura.IdFactura = 9853470;
+---------+
| Nombre  |
+---------+
| Eduardo |
+---------+

/*Contar cuantas veces pidió eduardo una pizza pequeña*/
select count(Pedido.Tamano) as contador
from Pedido inner join Cliente on Pedido.NumeroPedido = Cliente.NumeroPedido
where Pedido.Tamano = "Pequena" and Cliente.Nombre = "Eduardo";
+----------+
| contador |
+----------+
|        2 |
+----------+

/*Seleccionar el número de teléfono de los clientes que hayan pedido mas de una pizza del mismo tipo*/
select Cliente.Telefono 
from Cliente inner join Pedido on Cliente.NumeroPedido = Pedido.NumeroPedido
where Pedido.Cantidad > 1;
+-----------+
| Telefono  |
+-----------+
| 645374669 |
+-----------+

/*Seleccionar el nombre del cliente que hizo el pedido el 12 de enero de 2022*/
select distinct(Cliente.Nombre) as Cliente 
from Cliente inner join Pedido on Cliente.NumeroPedido = Pedido.NumeroPedido 
inner join Factura on Pedido.NumeroPedido = Factura.NumeroPedido
where Factura.IdFactura = 9853470;

+---------+
| Cliente |
+---------+
| Eduardo |
+---------+

/*Procedimiento*/

/*Selecciona el número de teléfono del cliente cuyo código postal sea 52789*/
DELIMITER $$
CREATE PROCEDURE obtenerNumeroTelefono(IN Telefono_C_Postal int)
BEGIN
    SELECT Telefono 
    FROM Cliente
    WHERE C_Postal = Telefono_C_Postal;
END$$
DELIMITER

CALL obtenerNumeroTelefono(52789);

+-----------+
| Telefono  |
+-----------+
| 965342776 |
+-----------+

/*Trigger*/
