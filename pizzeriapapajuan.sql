DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `telefono` int NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `c_postal` int DEFAULT NULL,
  `numeropedido` int DEFAULT NULL,
  PRIMARY KEY (`telefono`),
  KEY `numeropedido` (`numeropedido`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`numeropedido`) REFERENCES `pedido` (`numeropedido`)
);


INSERT INTO `cliente` VALUES (67890755,'Pepe','Avenida 123',35678,1);


DROP TABLE IF EXISTS `factura`;

CREATE TABLE `factura` (
  `idfactura` int NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `IGIC` float DEFAULT NULL,
  `numeropedido` int DEFAULT NULL,
  PRIMARY KEY (`idfactura`),
  KEY `numeropedido` (`numeropedido`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`numeropedido`) REFERENCES `pedido` (`numeropedido`)
);



CREATE TABLE `pedido` (
  `numeropedido` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `dimension` varchar(10) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`numeropedido`),
  KEY `nombre` (`nombre`,`dimension`),
  KEY `telefono` (`telefono`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`nombre`, `dimension`) REFERENCES `pizza` (`nombre`, `dimension`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`telefono`) REFERENCES `cliente` (`telefono`)
);


INSERT INTO `pedido` VALUES (1,1,'4 estaciones','Mediana',67890755);


CREATE TABLE `pizza` (
  `nombre` varchar(25) NOT NULL,
  `dimension` varchar(10) NOT NULL,
  `precio` float DEFAULT NULL,
  PRIMARY KEY (`nombre`,`dimension`)
);