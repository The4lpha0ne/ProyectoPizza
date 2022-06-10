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
("Margarita", "Mediana", 12.30),
("Margarita", "Pequena", 7.57),
("Margarita", "Grande", 15.41),
("Marinera", "Mediana", 12.99),
("Marinera", "Pequena", 5.98),
("Marinera", "Grande", 13.60),
("Barbacoa", "Grande", 16.21),
("Barbacoa", "Mediana", 14.03),
("Barbacoa", "Pequena", 6.21),
("Cuatro quesos", "Grande", 15.50),
("Cuatro quesos", "Mediana", 10.87),
("Cuatro quesos", "Pequena", 8.88);

insert into Pedido(NumeroPedido,Cantidad,Nombre,Tamano) values 
(54321, 2, "Margarita", "Mediana"),
(54321, 1, "Barbacoa", "Grande"),
(54321, 2, "Cuatro quesos", "Grande"),
(84212, 1, "Barbacoa", "Pequena"),
(84212, 1, "Margarita", "Pequena"),
(45673, 1, "Marinera", "Grande"),
(45673, 1, "Marinera", "Pequena"),
(45673, 1, "Margarita", "Pequena"),
(45673, 1, "Cuatro quesos", "Mediana"),
(05842, 1, "Cuatro quesos", "Pequena"),
(05842, 1, "Margarita", "Grande"),
(05842, 1, "Barbacoa", "Mediana"),
(98732, 1, "Margarita", "Mediana"),
(98732, 1, "Cuatro quesos", "Grande");





insert into Cliente(Telefono,Nombre,Direccion,C_Postal,NumeroPedido) values 
(645374669, "Pedro", "calle_fulanito", 45632, 54321),
(876342781, "Eduardo", "calle_melancolia", 34652, 45673),
(965342776, "Juan", "calle_de_la_pasa", 52789, 84212),
(635489021, "Chano", "calle_gilberto", 35481, 05842),
(745299813, "Pepe", "calle_del_sol", 35491, 98732);


insert into Factura(IdFactura, Fecha, NumeroPedido) values
(7357865, '2022-02-01', 84212),
(7345621, '2022-03-21', 54321),
(9853470, '2022-01-12', 45673),
(8673421, '2022-02-03', 05842),
(7362756, '2022-01-28', 98732);



/*Consultas*/

/*1.Queremos que nos muestre la información de todas las pizzas que sean de tamaño grande.*/
select * from Pizza where Tamano = "Grande";
+---------------+--------+--------+
| Nombre        | Tamano | Precio |
+---------------+--------+--------+
| Barbacoa      | Grande |  16.21 |
| Cuatro quesos | Grande |   15.5 |
| Margarita     | Grande |  15.41 |
| Marinera      | Grande |   13.6 |
+---------------+--------+--------+

/*2.Queremos que nos muestre la información de los clientes cuyo nombre termine en 'o'.*/
select * from Cliente where Nombre like "%o";
+-----------+---------+------------------+----------+--------------+
| Telefono  | Nombre  | Direccion        | C_Postal | NumeroPedido |
+-----------+---------+------------------+----------+--------------+
| 635489021 | Chano   | calle_gilberto   |    35481 |         5842 |
| 645374669 | Pedro   | calle_fulanito   |    45632 |        54321 |
| 876342781 | Eduardo | calle_melancolia |    34652 |        45673 |
+-----------+---------+------------------+----------+--------------+

/*3.Queremos ordenar las pizzas según su Precio*/
select * from Pizza
order by Precio desc;
+---------------+---------+--------+
| Nombre        | Tamano  | Precio |
+---------------+---------+--------+
| Barbacoa      | Grande  |  16.21 |
| Cuatro quesos | Grande  |   15.5 |
| Margarita     | Grande  |  15.41 |
| Barbacoa      | Mediana |  14.03 |
| Marinera      | Grande  |   13.6 |
| Marinera      | Mediana |  12.99 |
| Margarita     | Mediana |   12.3 |
| Cuatro quesos | Mediana |  10.87 |
| Cuatro quesos | Pequena |   8.88 |
| Margarita     | Pequena |   7.57 |
| Barbacoa      | Pequena |   6.21 |
| Marinera      | Pequena |   5.98 |
+---------------+---------+--------+

/*4.Queremos saber el numero del pedido de los clientes que han pedido una pizza pequeña sin que sus números se repitan*/
select distinct(NumeroPedido) from Pedido
where Tamano = "Pequena";
+--------------+
| NumeroPedido |
+--------------+
|         5842 |
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


/*6.Queremos saber la fecha en la que hizo el pedido el cliente con el id '98732'*/
select Fecha from Factura
where NumeroPedido = 98732;

+------------+
| Fecha      |
+------------+
| 2022-01-28 |
+------------+


/*7.Queremos contar los pedidos donde el numero del pedido sea '45673'*/
select sum(Cantidad) as cantidad_pizzas
from Pedido
where NumeroPedido = 45673;

+-----------------+
| cantidad_pizzas |
+-----------------+
|               4 |
+-----------------+

/*8.Queremos ordenar de mayor a menor las id de las facturas*/
select IdFactura from Factura
order by IdFactura desc;

+-----------+
| IdFactura |
+-----------+
|   9853470 |
|   8673421 |
|   7362756 |
|   7357865 |
|   7345621 |
+-----------+

/*Consultas multitablas*/

/*Seleccionar el nombre del cliente que haya pedido una pizza mediana*/
select Cliente.Nombre from Cliente
inner join Pedido on  Cliente.NumeroPedido = Pedido.NumeroPedido 
where Pedido.Tamano = "Mediana";  
+---------+
| Nombre  |
+---------+
| Chano   |
| Pedro   |
| Pepe    |
| Eduardo |
+---------+

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
select distinct(Cliente.Telefono) 
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

/*seleccionar la calle en la que viven los clientes que hayan pedido una pizza cuatro quesos de tamaño grande*/
select Cliente.Direccion 
from Cliente inner join Pedido on Cliente.NumeroPedido = Pedido.NumeroPedido
where Pedido.Nombre = "Cuatro quesos" and Pedido.Tamano = "Grande";
+----------------+
| Direccion      |
+----------------+
| calle_fulanito |
| calle_del_sol  |
+----------------+

/*Seleccionar la suma de los precios de los pedidos donde el id del pedido sea '45673'*/
select sum(round(Pizza.Precio, 2)) as Precio_total 
from Pizza inner join Pedido on Pizza.nombre = Pedido.Nombre and Pizza.Tamano = Pedido.Tamano
where Pedido.NumeroPedido = 45673;

+--------------+
| Precio_total |
+--------------+
|        38.02 |
+--------------+

/*Seleccionar el idfactura, la fecha de la factura y la suma de los precios de los pedidos donde el id del pedido sea '54321'*/
select Factura.IdFactura , Factura.Fecha , sum(round(Pizza.Precio, 2)) as Precio_total
from Factura inner join Pedido on Factura.NumeroPedido = Pedido.NumeroPedido
inner join Pizza on Pedido.Nombre = Pizza.Nombre and Pedido.Tamano = Pizza.Tamano
where Pedido.NumeroPedido = 54321;
+-----------+------------+--------------+
| IdFactura | Fecha      | Precio_total |
+-----------+------------+--------------+
|   7345621 | 2022-03-21 |        44.01 |
+-----------+------------+--------------+

/*Procedimientos*/

/*1.Selecciona el número de teléfono del cliente cuyo código postal sea 52789*/
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

/*2. Selecciona la media de los precios de las pizzas cuyo valor sea menor a 13*/
DELIMITER $$
CREATE OR REPLACE PROCEDURE obtenerMediaPrecio(IN Limite_Precio int)
BEGIN
    SELECT round(avg(Precio),2) as media
    FROM Pizza
    WHERE Precio <= Limite_Precio;
END$$
DELIMITER

CALL obtenerMediaPrecio(13);

+-------+
| media |
+-------+
|  9.26 |
+-------+


/*3.Seleccionar cuantas pizzas grandes se han pedido en total*/
DELIMITER $$
CREATE OR REPLACE PROCEDURE obtenerPizzasGrandes(IN Tamano_Pizza varchar(10))
BEGIN
    SELECT count(Tamano) as Total
    FROM Pizza
    WHERE Tamano = Tamano_Pizza;
END$$
DELIMITER

CALL obtenerPizzasGrandes('Grande');
+-------+
| Total |
+-------+
|     4 |
+-------+

/* Hemos creado un TRIGGER  para controlar que en el caso de que un cliente haga
un pedio de más de 20 pizzas o menor de 1, el pedido en el caso de 0 o  menos lo pone a 1
y en el caso de que cantidad sea mayor que 20, el tope será 20 pizzas */


delimiter $$
CREATE OR REPLACE TRIGGER numero_pizzas 
BEFORE INSERT ON Pedido
FOR EACH ROW
BEGIN
    IF NEW.Cantidad < 1 THEN
        set NEW.Cantidad = 1;
    ELSEIF NEW.Cantidad > 20 THEN
        set NEW.Cantidad = 20;
    END IF;
END;
delimiter ;


insert into Pedido(NumeroPedido,Cantidad,Nombre,Tamano) values 
(54321, 50, "Barbacoa", "Mediana");

+--------------+----------+-----------+---------+
| NumeroPedido | Cantidad | Nombre    | Tamano  |
+--------------+----------+-----------+---------+
|        45673 |        1 | Margarita | Pequena |
|        45673 |        1 | Marinera  | Grande  |
|        45673 |        1 | Marinera  | Pequena |
|        54321 |        1 | Barbacoa  | Grande  |
|        54321 |       20 | Barbacoa  | Mediana |
|        54321 |        1 | Barbacoa  | Pequena |
|        54321 |        2 | Margarita | Mediana |
|        84212 |        1 | Barbacoa  | Pequena |
+--------------+----------+-----------+---------+

