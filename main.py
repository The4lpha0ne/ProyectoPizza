import sys 
sys.path.append('models')
import bottle
import sqlite3
from bottle import route, run, template, request, get, post, redirect, static_file, error
from config.config import DATABASE,pedido_definition,pizza_definition,factura_definition,cliente_definition


@get("/static/<filepath:path>")
def html(filepath):
    return static_file(filepath, root = "static")
    
@get('/')
def index():
    return template('index')


@get('/pizza.ico')
def icon():
    return static_file('pizza.ico', root='static')



@get('/add_pizza')
def nueva_pizza_form():
    return template('nueva_pizza')

@post('/add_pizza')
def nueva_pizza_save():
    if request.POST.save:
        nombre = request.POST.nombre.strip()
        tamano = request.POST.tamano.strip()
        precio = request.POST.precio.strip()
        conn = sqlite3.connect(DATABASE)
        c = conn.cursor()

        c.execute("INSERT INTO Pizza (Nombre, Tamano, Precio) VALUES (?,?,?)", (nombre,tamano,precio))
       
        conn.commit()
        c.close()
        return redirect('/pizzas')

@get('/pizzas')
def ver_pizzas():
    conn = sqlite3.connect(DATABASE)
    c = conn.cursor()
    c.execute("SELECT * from Pizza;")
    result = c.fetchall()
    c.close()
    output = template('ver_pizzas', rows=result)
    return output

@get('/delete')
def delete_pizza_form():
    return template('delete_pizza')

@post('/delete')
def delete_pizza():
        nombre = request.POST.nombre.strip()
        conn = sqlite3.connect(DATABASE)
        c = conn.cursor()
        c.execute("DELETE FROM Pizza WHERE Nombre LIKE ?", (nombre,))
        conn.commit()
        c.close()
        return redirect('/pizzas')


@get('/clientes')
def ver_clientes():
    conn = sqlite3.connect(DATABASE)
    c = conn.cursor()
    c.execute("SELECT * from Cliente;")
    result = c.fetchall()
    c.close()
    output = template('ver_clientes', rows=result)
    return output


@get('/add_cliente')
def nuevo_cliente_form():
    return template('nuevo_cliente')

@post('/add_cliente')
def nuevo_cliente_save():
    if request.POST.save:
        telefono = request.POST.telefono.strip()
        nombre = request.POST.nombre.strip()
        direccion = request.POST.direccion.strip()
        c_postal = request.POST.c_postal.strip()
        numeropedido = request.POST.numeropedido.strip()
        conn = sqlite3.connect(DATABASE)
        c = conn.cursor()

        c.execute("INSERT INTO Cliente (Telefono, Nombre, Direccion, C_Postal, NumeroPedido) VALUES (?,?,?,?,?)", (telefono, nombre, direccion,c_postal,numeropedido))
        conn.commit()
        c.close()
        return redirect('/clientes')


@get('/delete/<no:int>')
def delete_cliente_form(no):
    conn = sqlite3.connect('pizzeriapapajuan.db')
    c = conn.cursor()
    c.execute("SELECT Nombre FROM Cliente WHERE Telefono LIKE ?", (no,))
    cur_data = c.fetchone()
    c.close()

    return template('delete_cliente', old=cur_data, no=no)



@post('/delete/<no:int>')
def delete_cliente_item(no):
    if request.POST.delete:
        conn = sqlite3.connect(DATABASE)
        c = conn.cursor()
        c.execute("DELETE FROM Cliente WHERE Telefono LIKE ?", (no,))
        conn.commit()
        c.close()

    return redirect('/clientes')


@get('/pedidos')
def ver_pizzas():
    conn = sqlite3.connect(DATABASE)
    c = conn.cursor()
    c.execute("SELECT * from Pedido;")
    result = c.fetchall()
    c.close()
    output = template('ver_pedidos', rows=result)
    return output




@get('/delete/<no:int>')
def delete_pedido_form(no):
    conn = sqlite3.connect('pizzeriapapajuan.db')
    c = conn.cursor()
    c.execute("SELECT NumeroPedido FROM Pedido WHERE NumeroPedido LIKE ?", (no,))
    cur_data = c.fetchone()
    c.close()

    return template('delete_pedido', old=cur_data, no=no)



@post('/delete/<no:int>')
def delete_pedido_item(no):
    if request.POST.delete:
        conn = sqlite3.connect(DATABASE)
        c = conn.cursor()
        c.execute("DELETE FROM Pedido WHERE NumeroPedido LIKE ?", (no,))
        conn.commit()
        c.close()

    return redirect('/pedidos')



if __name__ == '__main__':
    run(host='localhost', port=8080, debug=True, reloader=True)




