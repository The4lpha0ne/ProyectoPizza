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
def new_item_form():
    return template('nueva_pizza')

@post('/add_pizza')
def new_item_save():
    if request.POST.save:  # the user clicked the `save` button
        nombre = request.POST.nombre.strip()
        tamano = request.POST.tamano.strip()
        precio = request.POST.precio.strip()
            # get the task from the form
        conn = sqlite3.connect(DATABASE)
        c = conn.cursor()

        c.execute("INSERT INTO Pizza (Nombre, Tamano, Precio) VALUES (?,?,?)", (nombre,tamano,precio))
       
        conn.commit()
        c.close()
        # se muestra el resultado de la operación
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

if __name__ == '__main__':
    run(host='localhost', port=8080, debug=True, reloader=True)
