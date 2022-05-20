import sqlite3
def create_database(db_file):
    conn = sqlite3.connect(db_file) # Warning: This file is created in the current directory
    conn.execute("CREATE TABLE cliente (nombre text, codigocliente INTEGER PRIMARY KEY, apellido text, correoelectronico text)")
    conn.execute("CREATE TABLE base (codigobase text PRIMARY KEY, nombrebase text)")
    conn.execute("CREATE TABLE ingredientes (codigoingrediente INTEGER PRIMARY KEY, nombreingrediente text))")
    conn.execute("CREATE TABLE pedido (numeropedido INTEGER PRIMARY KEY)")
    conn.execute("CREATE TABLE pizza (idpizza INTEGER PRIMARY KEY)")
    conn.commit()

