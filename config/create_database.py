import sqlite3
def create_database(db_file):
    conn = sqlite3.connect(db_file) # Warning: This file is created in the current directory
    conn.execute("CREATE TABLE cliente (nombre text, direccion text, n_telefono INTEGER PRIMARY KEY, c_postal INTEGER)")
    conn.execute("CREATE TABLE ingredientes (codigoingrediente INTEGER PRIMARY KEY, nombreingrediente text))")
    conn.execute("CREATE TABLE pedido (numeropedido INTEGER PRIMARY KEY)")
    conn.execute("CREATE TABLE pizza (idpizza INTEGER PRIMARY KEY, precio INTEGER, nombre text, tamaño text)")
    conn.commit()

