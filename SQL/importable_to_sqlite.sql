

DROP TABLE IF EXISTS `Cliente`;

CREATE TABLE `Cliente` (
  `Telefono` int NOT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Direccion` varchar(40) DEFAULT NULL,
  `C_Postal` int DEFAULT NULL,
  `NumeroPedido` int DEFAULT NULL,
  PRIMARY KEY (`Telefono`),
  KEY `NumeroPedido` (`NumeroPedido`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`NumeroPedido`) REFERENCES `Pedido` (`NumeroPedido`)
);

INSERT INTO `Cliente` VALUES (645374669,'Pedro','calle_fulanito',45632,54321),(876342781,'Eduardo','calle_melancolia',34652,45673),(965342776,'Juan','calle_de_la_pasa',52789,84212);


DROP TABLE IF EXISTS `Factura`;

CREATE TABLE `Factura` (
  `IdFactura` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `NumeroPedido` int DEFAULT NULL,
  PRIMARY KEY (`IdFactura`),
  KEY `NumeroPedido` (`NumeroPedido`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`NumeroPedido`) REFERENCES `Pedido` (`NumeroPedido`)
);


INSERT INTO `Factura` VALUES (7345621,'2022-03-21',54321),(7357865,'2022-02-01',84212),(9853470,'2022-01-12',45673);


DROP TABLE IF EXISTS `Pedido`;

CREATE TABLE `Pedido` (
  `NumeroPedido` int NOT NULL,
  `Cantidad` int DEFAULT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Tamano` varchar(10) NOT NULL,
  PRIMARY KEY (`NumeroPedido`,`Nombre`,`Tamano`),
  KEY `Nombre` (`Nombre`,`Tamano`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`Nombre`, `Tamano`) REFERENCES `Pizza` (`Nombre`, `Tamano`)
);

INSERT INTO `Pedido` VALUES (45673,1,'Margarita','Pequena'),(45673,1,'Marinera','Grande'),(45673,1,'Marinera','Pequena'),(54321,1,'Barbacoa','Grande'),(54321,20,'Barbacoa','Mediana'),(54321,2,'Margarita','Mediana'),(84212,1,'Barbacoa','Pequena');




DROP TABLE IF EXISTS `Pizza`;

CREATE TABLE `Pizza` (
  `IdPizza` INT NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Tamano` varchar(10) NOT NULL,
  `Precio` float DEFAULT NULL,
  PRIMARY KEY (`IdPizza`,`Nombre`,`Tamano`)
);



INSERT INTO `Pizza` VALUES (11344,'Barbacoa','Grande',15),(24545,'Barbacoa','Mediana',12),(234334,'Barbacoa','Pequena',7),(33443,'Margarita','Grande',15),(343434,'Margarita','Mediana',12),(9848,'Margarita','Pequena',7),(1039,'Marinera','Grande',15),(1394,'Marinera','Mediana',12),(10234,'Marinera','Pequena',7)

