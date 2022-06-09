from pydoc import cli
import sys 
import bottle
import sqlite3

sys.path.append('models')

from models.cliente import Cliente
from models.factura import Factura
from models.pedido import Pedido




from models.pizza import Pizza
from bottle import route, run, template, request, get, post, redirect, static_file, error
from config.config import DATABASE,PEDIDO_DEFINITION,PIZZA_DEFINITION,FACTURA_DEFINITION,CLIENTE_DEFINITION


pizza = Pizza(DATABASE)

pedido = Pedido(DATABASE)

factura = Factura(DATABASE)

cliente = Cliente(DATABASE)


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
        data = {

            'idpizza' :request.POST.idpizza.strip(),
            'nombre' : request.POST.nombre.strip(),
            'tamano' :request.POST.tamano.strip(),
            'precio' : request.POST.precio.strip()

        }

        
        pizza.insert(data)
     
        return redirect('/pizzas')

@get('/pizzas')
def ver_pizzas():
    
    return template ('ver_pizzas', rows = pizza.select())

@get('/delete_pizza/<no:int>')
def delete_pizza_form(no):
    fields = ['Nombre','Tamano', 'Precio']
    where = {'IdPizza': no}
    cur_data = pizza.get(fields,where)
    return template('delete_pizza', old= cur_data, no = no)


@post('/delete_pizza/<no:int>')
def delete_pizza_item(no):
    if request.POST.delete:
        where = {'IdPizza': no}
        pizza.delete(where)

    return redirect('/pizzas')

    

@get('/edit_pizza/<no:int>')
def edit_pizza_form(no):
    fields = ['Nombre', 'Tamano', 'Precio']
    where = {'IdPizza': no}
    cur_data = pizza.get(fields, where)  # get the current data for the item we are editing
    return template('edit_pizza', old=cur_data, no=no)
    

@post('/edit_pizza/<no:int>')
def edit_pizza(no):
    if request.POST.save:
            data = {
                'Nombre': request.POST.nombre.strip(), 
                'Tamano': request.POST.tamano.strip(),
                'Precio': request.POST.precio.strip()
            }
            where = {'IdPizza': no}
            
            pizza.update(data, where)
            
    return redirect('/pizzas')

@get('/clientes')
def ver_clientes():
    rows=cliente.select()
    return template('ver_clientes', rows=cliente.select())
    


@get('/add_cliente')
def nuevo_cliente_form():
    return template('nuevo_cliente')

@post('/add_cliente')
def nuevo_cliente_save():
    if request.POST.save:
        data = {
            'Telefono': request.POST.telefono.strip(), 
            'Nombre': request.POST.nombre.strip(),
            'Direccion': request.POST.direccion.strip(),
            'C_Postal': request.POST.c_postal.strip(),
            'NumeroPedido': request.POST.numeropedido.strip()
        }

        cliente.insert(data)

        return redirect('/clientes')
        

@get('/delete_cliente/<no:int>')
def delete_cliente_form(no):
    fields = ['Nombre', 'Direccion','C_Postal','NumeroPedido']
    where = {'Telefono': no}
    cur_data = cliente.get(fields,where)
    return template('delete_cliente', old= cur_data, no = no)



@post('/delete_cliente/<no:int>')
def delete_cliente_item(no):
    if request.POST.delete:
            where = {'Telefono': no}
            cliente.delete(where)

    return redirect('/clientes')


@get('/pedidos')
def ver_pedidos():
   rows = pedido.select()
   return template('/pedidos', rows = pedido.select())



@get('/delete_pedido/<no:int>')
def delete_pedido_form(no):
    fields = ['Cantidad', 'Nombre','Tamano']
    where = {'NumeroPedido': no}
    cur_data = cliente.get(fields,where)
    return template('delete_pedido', old= cur_data, no = no)


@post('/delete_pedido/<no:int>')
def delete_pedido_item(no):
    if request.POST.delete:
            where = {'NumeroPedido': no}
            pedido.delete(where)
    return redirect('/pedidos')

@get('/add_pedido')
def nuevo_pedido_form():
    return template('nuevo_pedido')

@post('/add_pedido')
def nuevo_pedido_save():
    if request.POST.save:
        numeropedido = request.POST.numeropedido.strip()
        cantidad = request.POST.cantidad.strip()
        nombre = request.POST.nombre.strip()
        tamano = request.POST.tamano.strip()

        conn = sqlite3.connect(DATABASE)
        c = conn.cursor()

        c.execute("INSERT INTO Pedido (NumeroPedido, Cantidad, Nombre, Tamano) VALUES (?,?,?,?)", (numeropedido,cantidad,nombre,tamano))
        conn.commit()
        c.close()
        return redirect('/pedidos')

@get('/facturas')
def ver_facturas():
    conn = sqlite3.connect(DATABASE)
    c = conn.cursor()
    c.execute("SELECT * from Factura;")
    result = c.fetchall()
    c.close()
    output = template('ver_facturas', rows=result)
    return output

@get('/add_factura')
def nueva_factura_form():
    return template('nueva_factura')

@post('/add_factura')
def nueva_factura_save():
    if request.POST.save:
        idfactura = request.POST.idfactura.strip()
        fecha = request.POST.fecha.strip()
        numeropedido = request.POST.numeropedido.strip()

        conn = sqlite3.connect(DATABASE)
        c = conn.cursor()

        c.execute("INSERT INTO Factura (IdFactura, Fecha, NumeroPedido) VALUES (?,?,?)", (idfactura, fecha, numeropedido))
        conn.commit()
        c.close()
        return redirect('/facturas')

@get('/delete_factura/<no:int>')
def delete_factura_form(no):
    conn = sqlite3.connect('pizzeriapapajuan.db')
    c = conn.cursor()
    c.execute("SELECT NumeroPedido FROM Factura WHERE IdFactura LIKE ?", (no,))
    cur_data = c.fetchone()
    c.close()

    return template('delete_factura', old=cur_data, no=no)



@post('/delete_factura/<no:int>')
def delete_factura_item(no):
    if request.POST.delete:
        conn = sqlite3.connect(DATABASE)
        c = conn.cursor()
        c.execute("DELETE FROM Factura WHERE IdFactura LIKE ?", (no,))
        conn.commit()
        c.close()

    return redirect('/facturas')

@get('/edit_factura/<no:int>')
def edit_factura_form(no):
    conn = sqlite3.connect(DATABASE)
    c = conn.cursor()
    c.execute("SELECT * FROM Factura WHERE  IdFactura= ?", (no,))
    cur_data = c.fetchone()
    c.close()
    return template('edit_factura', old=cur_data, no=no)

@post('/edit_factura/<no:int>')
def edit_factura(no):

    if request.POST.save:
        numeropedido = request.POST.numeropedido.strip()
        fecha = request.POST.fecha.strip()

        conn = sqlite3.connect(DATABASE)
        c = conn.cursor()
        c.execute("UPDATE Factura SET numeropedido = ?,  fecha= ? WHERE IdFactura LIKE ?", (numeropedido, fecha, no))
        conn.commit()
        c.close()

        return redirect('/facturas')

@get('/edit_cliente/<no:int>')
def edit_cliente_form(no):
    conn = sqlite3.connect(DATABASE)
    c = conn.cursor()
    c.execute("SELECT * FROM Cliente WHERE  NumeroPedido= ?", (no,))
    cur_data = c.fetchone()
    c.close()
    return template('edit_cliente', old=cur_data, no=no)

@post('/edit_cliente/<no:int>')
def edit_cliente(no):

    if request.POST.save:
        telefono = request.POST.telefono.strip()
        nombre = request.POST.nombre.strip()
        direccion = request.POST.direccion.strip()
        c_postal = request.POST.c_postal.strip()

        conn = sqlite3.connect(DATABASE)
        c = conn.cursor()
        c.execute("UPDATE Cliente SET Telefono = ?, Nombre= ?, Direccion = ?, C_Postal = ? WHERE NumeroPedido LIKE ?", (telefono, nombre, direccion, c_postal, no))
        conn.commit()
        c.close()

        return redirect('/clientes')

@get('/edit_pedido/<no:int>')
def edit_pedido_form(no):
    conn = sqlite3.connect(DATABASE)
    c = conn.cursor()
    c.execute("SELECT * FROM Pedido WHERE  NumeroPedido= ?", (no,))
    cur_data = c.fetchone()
    c.close()
    return template('edit_pedido', old=cur_data, no=no)

@post('/edit_pedido/<no:int>')
def edit_pedido(no):

    if request.POST.save:
        cantidad = request.POST.cantidad.strip()
        nombre = request.POST.nombre.strip()
        tamano = request.POST.tamano.strip()

        conn = sqlite3.connect(DATABASE)
        c = conn.cursor()
        c.execute("UPDATE OR REPLACE Pedido SET Cantidad = ?, Nombre= ?, Tamano = ? WHERE NumeroPedido LIKE ?", (cantidad, nombre, tamano, no))
        conn.commit()
        c.close()

        return redirect('/pedidos')





if __name__ == '__main__':
    run(host='localhost', port=8080, debug=True, reloader=True)




