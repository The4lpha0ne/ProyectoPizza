import sqlite3
def create_database(db_file):
    conn = sqlite3.connect(db_file) # Warning: This file is created in the current directory
    conn.execute("CREATE TABLE cliente (nombre text, direccion text, n_telefono INTEGER PRIMARY KEY, c_postal INTEGER)")
    conn.execute("CREATE TABLE ingredientes (codigoingrediente INTEGER PRIMARY KEY, nombreingrediente text)")
    conn.execute("CREATE TABLE pedido (numeropedido INTEGER PRIMARY KEY)")
    conn.execute("CREATE TABLE pizza (idpizza INTEGER PRIMARY KEY, precio INTEGER, nombre text, tamaño text)")

    conn.execute("INSERT INTO cliente (nombre,direccion,n_telefono, c_postal) VALUES ('Pepe','Avenida Central',62367784,35014)")
    conn.execute("INSERT INTO pizza  VALUES (34, 10, '4 estaciones', 'mediano')")
    conn.execute("INSERT INTO ingredientes VALUES(32424,'tomate')")
    conn.execute("INSERT INTO ingredientes VALUES (1343,'atun')")
    conn.execute("INSERT INTO ingredientes VALUES (3450,'queso')")
    conn.execute("INSERT INTO ingredientes VALUES (3450,'jamon')")
    conn.execute("INSERT INTO pedido  VALUES (135)")


    conn.commit()

