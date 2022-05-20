BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "base" (
	"codigobase"	INTEGER,
	"nombrebase"	TEXT,
	PRIMARY KEY("codigobase")
);
CREATE TABLE IF NOT EXISTS "cliente" (
	"nombre"	TEXT,
	"codigocliente"	INTEGER,
	"apellido"	TEXT,
	"correoelectronico"	TEXT,
	PRIMARY KEY("codigocliente")
);
CREATE TABLE IF NOT EXISTS "pizza" (
	"idpizza"	INTEGER,
	PRIMARY KEY("idpizza")
);
CREATE TABLE IF NOT EXISTS "ingredientes" (
	"codigoingrediente"	INTEGER,
	"nombreingrediente"	TEXT,
	PRIMARY KEY("codigoingrediente")
);
CREATE TABLE IF NOT EXISTS "pedido" (
	"numeropedido"	INTEGER,
	PRIMARY KEY("numeropedido")
);
COMMIT;
