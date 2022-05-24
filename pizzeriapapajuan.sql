

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


DROP TABLE IF EXISTS `pedido`;

CREATE TABLE `pedido` (
  `numeropedido` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `dimension` varchar(10) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`numeropedido`),
  KEY `nombre` (`nombre`,`dimension`),
  KEY `telefono` (`telefono`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`nombre`) REFERENCES `pizza` (`nombre`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`telefono`) REFERENCES `cliente` (`telefono`),
  CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`dimension`) REFERENCES `pizza` (`dimension`),
);


DROP TABLE IF EXISTS `pizza`;

CREATE TABLE `pizza` (
  `nombre` varchar(25) NOT NULL,
  `dimension` varchar(10) NOT NULL,
  `precio` float DEFAULT NULL,
  PRIMARY KEY (`nombre`,`dimension`)
);
