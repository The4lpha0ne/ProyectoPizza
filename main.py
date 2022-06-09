import sys 
import os
import bottle

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



@get('/pizzas')
def ver_pizzas():
    
    return template ('ver_pizzas', rows = pizza.select())

    
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
    where = {'NumeroPedido': no}
    cur_data = cliente.get(fields,where)
    return template('delete_cliente', old= cur_data, no = no)



@post('/delete_cliente/<no:int>')
def delete_cliente_item(no):
    if request.POST.delete:
            where = {'NumeroPedido': no}
            cliente.delete(where)

    return redirect('/clientes')


@get('/pedidos')
def ver_pedidos():
   rows = pedido.select()
   return template('ver_pedidos', rows = pedido.select())



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
         data = {
            'NumeroPedido': request.POST.numeropedido.strip(), 
            'Cantidad': request.POST.cantidad.strip(),
            'Nombre': request.POST.nombre.strip(),
            'Tamano': request.POST.tamano.strip(),
        }

    pedido.insert(data)

    return redirect('/pedidos')



@get('/edit_pedido/<no:int>')
def edit_pedido_form(no):
    fields = ['Cantidad','Nombre','Tamano']
    where = {'NumeroPedido': no}
    cur_data = pedido.get(fields, where)  # get the current data for the item we are editing
    return template('edit_pedido', old=cur_data, no=no)

@post('/edit_pedido/<no:int>')
def edit_pedido(no):

    if request.POST.save:
            data = {
                'Cantidad': request.POST.cantidad.strip(), 
                'Nombre': request.POST.nombre.strip(),
                'Tamano': request.POST.tamano.strip(),
            }

            where = {'NumeroPedido': no}
            
            pedido.update(data, where)
            
    return redirect('/pedidos')

@get('/facturas')
def ver_facturas():
    rows=cliente.select()
    return template('ver_facturas', rows=factura.select())
    
    

@get('/add_factura')
def nueva_factura_form():
    return template('nueva_factura')

@post('/add_factura')
def nueva_factura_save():
    if request.POST.save:
            data = {
            'IdFactura': request.POST.idfactura.strip(), 
            'Fecha': request.POST.fecha.strip(),
            'NumeroPedido': request.POST.numeropedido.strip()
        }

    factura.insert(data)

    return redirect('/facturas')
       

@get('/delete_factura/<no:int>')
def delete_factura_form(no):
    fields = ['Fecha','NumeroPedido']
    where = {'IdFactura': no}
    cur_data = factura.get(fields,where)
    return template('delete_factura', old= cur_data, no = no)
    



@post('/delete_factura/<no:int>')
def delete_factura_item(no):
    if request.POST.delete:
            where = {'IdFactura': no}
            pedido.delete(where)
    return redirect('/facturas')

@get('/edit_factura/<no:int>')
def edit_factura_form(no):
    fields = ['Fecha', 'NumeroPedido']
    where = {'IdFactura': no}
    cur_data = pizza.get(fields, where)  # get the current data for the item we are editing
    return template('edit_factura', old=cur_data, no=no)
    

@post('/edit_factura/<no:int>')
def edit_factura(no):

    if request.POST.save:
            data = {
                'Fecha': request.POST.fecha.strip(), 
                'NumeroPedido': request.POST.numeropedido.strip(),
            }
            where = {'IdFactura': no}
            
            factura.update(data, where)
            
    return redirect('/facturas')

@get('/edit_cliente/<no:int>')
def edit_cliente_form(no):
    fields = ['Telefono','nombre', 'Direccion','C_Postal']
    where = {'NumeroPedido': no}
    cur_data = cliente.get(fields, where)  # get the current data for the item we are editing
    return template('edit_cliente', old=cur_data, no=no)
    

@post('/edit_cliente/<no:int>')
def edit_cliente(no):

    if request.POST.save:
            data = {
                'Telefono': request.POST.telefono.strip(),
                'nombre': request.POST.nombre.strip(), 
                'Direccion': request.POST.direccion.strip(),
                'C_Postal': request.POST.c_postal.strip(),
            }

            where = {'NumeroPedido': no}
            
            cliente.update(data, where)
            
    return redirect('/clientes')

@get("/static/<filepath:path>")
def html(filepath):
    return static_file(filepath, root = "static")
    
@get('/')
def index():
    return template('index')


@get('/pizza.ico')
def icon():
    return static_file('pizza.ico', root='static')




if __name__ == '__main__':
    if not os.path.exists(DATABASE) or os.path.getsize(DATABASE) == 0:
        
        pizza.create(PIZZA_DEFINITION)
        cliente.create(CLIENTE_DEFINITION)
        factura.create(FACTURA_DEFINITION)
        pedido.create(PEDIDO_DEFINITION)
        
    run(host='localhost', port=8080, debug=True, reloader=True)




