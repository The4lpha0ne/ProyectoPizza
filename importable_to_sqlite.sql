CREATE TABLE `Cliente` (
  `Telefono` int NOT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Direccion` varchar(40) DEFAULT NULL,
  `C_Postal` int DEFAULT NULL,
  `NumeroPedido` int DEFAULT NULL,
  PRIMARY KEY (`Telefono`),
  KEY `NumeroPedido` (`NumeroPedido`),
  CONSTRAINT `Cliente_ibfk_1` FOREIGN KEY (`NumeroPedido`) REFERENCES `Pedido` (`NumeroPedido`) ON DELETE CASCADE ON UPDATE CASCADE
);




DROP TABLE IF EXISTS `Factura`;

CREATE TABLE `Factura` (
  `IdFactura` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `NumeroPedido` int DEFAULT NULL,
  PRIMARY KEY (`IdFactura`),
  KEY `NumeroPedido` (`NumeroPedido`),
  CONSTRAINT `Factura_ibfk_1` FOREIGN KEY (`NumeroPedido`) REFERENCES `Pedido` (`NumeroPedido`) ON DELETE CASCADE ON UPDATE CASCADE
);




DROP TABLE IF EXISTS `Pedido`;

CREATE TABLE `Pedido` (
  `NumeroPedido` int NOT NULL,
  `Cantidad` int DEFAULT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Tamano` varchar(10) NOT NULL,
  PRIMARY KEY (`NumeroPedido`,`Nombre`,`Tamano`),
  KEY `Nombre` (`Nombre`,`Tamano`),
  CONSTRAINT `Pedido_ibfk_1` FOREIGN KEY (`Nombre`, `Tamano`) REFERENCES `Pizza` (`Nombre`, `Tamano`) ON DELETE CASCADE ON UPDATE CASCADE
);



DROP TABLE IF EXISTS `Pizza`;

CREATE TABLE `Pizza` (
  `Nombre` varchar(25) NOT NULL,
  `Tamano` varchar(10) NOT NULL,
  `Precio` float DEFAULT NULL,
  PRIMARY KEY (`Nombre`,`Tamano`)
);



INSERT INTO `Pizza` VALUES ('Barbacoa','Grande',15),('Barbacoa','Mediana',12),('Barbacoa','Pequena',7),('Margarita','Grande',15),('Margarita','Mediana',12),('Margarita','Pequena',7);

