BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "recetas" (
	"nombre_receta"	TEXT,
	"ingredientes"	TEXT,
	PRIMARY KEY("nombre_receta")
);
CREATE TABLE IF NOT EXISTS "usuarios" (
	"nombre"	TEXT,
	"apellidos"	TEXT,
	"nombre_usuario"	TEXT,
	"fecha_nacimiento"	TEXT,
	"contraseña"	TEXT,
	PRIMARY KEY("nombre_usuario")
);
CREATE TABLE IF NOT EXISTS "productos" (
	"nombre"	TEXT,
	"precio"	INTEGER,
	PRIMARY KEY("nombre")
);
CREATE TABLE IF NOT EXISTS "propietario" (
	"nombre"	TEXT,
	"dni"	TEXT,
	"apellidos"	TEXT,
	PRIMARY KEY("dni")
);
CREATE TABLE IF NOT EXISTS "cocineros" (
	"nombre"	TEXT,
	"apellidos"	TEXT,
	"DNI"	TEXT,
	PRIMARY KEY("DNI")
);
CREATE TABLE IF NOT EXISTS "camareros" (
	"nombre"	TEXT,
	"apellidos"	TEXT,
	"DNI"	TEXT,
	PRIMARY KEY("DNI")
);
COMMIT;
