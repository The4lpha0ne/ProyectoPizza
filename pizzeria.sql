BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "cliente" (
	"nombre"	TEXT,
	"direccion"	TEXT,
	"n_telefono"	INTEGER,
	"c_postal"	INTEGER,
	PRIMARY KEY("n_telefono")
);
CREATE TABLE IF NOT EXISTS "pizza" (
	"tamaño"	TEXT,
	"nombre"	TEXT,
	"precio"	INTEGER,
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
