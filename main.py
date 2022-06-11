import sys 
import os
import bottle
from random import randint
from forms.edit_cliente import EditClienteForm
from forms.edit_factura import EditFacturaForm
from forms.edit_pedido import EditPedidoForm
from forms.edit_pizza import EditPizzaForm
from forms.new_cliente import NewClienteForm
from forms.new_factura import NewFacturaForm
from forms.new_pedido import NewPedidoForm

sys.path.append('models')
sys.path.append('forms')

from models.cliente import Cliente
from models.factura import Factura
from models.pedido import Pedido
from models.pizza import Pizza

from bottle import route, run, template, request, get, post, redirect, static_file, error
from config.config import DATABASE,PEDIDO_DEFINITION,PIZZA_DEFINITION,FACTURA_DEFINITION,CLIENTE_DEFINITION
from forms.new_pizza import NewPizzaForm



pizza = Pizza(DATABASE)

pedido = Pedido(DATABASE)

factura = Factura(DATABASE)

cliente = Cliente(DATABASE)

numeropedido = randint(1000,10000)



@get('/pizzas')
def ver_pizzas():
    
    return template ('ver_pizzas', rows = pizza.select())

    
@get('/add_pizza')
def nueva_pizza_form():
    rows = pizza.select()
    form = NewPizzaForm(request.POST)
    return template('nueva_pizza', rows=pizza.select(), form=form)

@post('/add_pizza')
def nueva_pizza_save():
    form = NewPizzaForm(request.POST) 
    if form.save.data and form.validate():
        form_data = {
            'IdPizza' : request.POST.idpizza,
            'Nombre': request.POST.nombre,
            'Tamano': request.POST.tamano,
            'Precio': request.POST.precio
        }
        pizza.insert(form_data)
        redirect('/pizzas')

    rows=pizza.select()
    return template('ver_pizzas', rows=pizza.select(), form=form)



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
    # Obtenemos la tarea a editar
    fields = ['Nombre', 'Tamano','Precio']
    where = {'IdPizza': no}
    cur_data = pizza.get(fields, where)  
    
    # Creamos formulario y le pasamos los valores actuales de la tarea
    form = EditPizzaForm(request.POST)

    form.nombre.data = cur_data[0]
    form.tamano.data = cur_data[1]
    form.precio.data = cur_data[2]

    return template('edit_pizza', form=form, no=no)
    

@post('/edit_pizza/<no:int>')
def edit_pizza(no):
    form = EditPizzaForm(request.POST)
    if form.save.data and form.validate():
        data = {
            'Nombre': request.POST.nombre,
            'Precio': request.POST.precio, 
            'Tamano': request.POST.tamano
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
    rows = cliente.select()
    form = NewClienteForm(request.POST)
    return template('nuevo_cliente', rows=cliente.select(), form=form)

@post('/add_cliente')
def nuevo_cliente_save():
    form = NewClienteForm(request.POST) 
    if form.save.data and form.validate():
        form_data = {
            'Telefono' : request.POST.telefono,
            'nombre': request.POST.nombre,
            'Direccion': request.POST.direccion,
            'C_Postal': request.POST.c_postal,
            'NumeroPedido': request.POST.numeropedido
        }
        cliente.insert(form_data)
        redirect('/clientes') 
    rows=cliente.select()
    return template('ver_clientes', rows=cliente.select(), form=form) 



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
    cur_data = pedido.get(fields,where)
    return template('delete_pedido', old= cur_data, no = no)


@post('/delete_pedido/<no:int>')
def delete_pedido_item(no):
    if request.POST.delete:
            where = {'NumeroPedido': no}
            pedido.delete(where)
    return redirect('/pedidos')

@get('/add_pedido')
def nuevo_pedido_form():
    rows = pedido.select()
    form = NewPedidoForm(request.POST)
    return template('nuevo_pedido', rows=pedido.select(), form=form)

@post('/add_pedido')
def nuevo_pedido_save():
    form = NewPedidoForm(request.POST) 
    if form.save.data and form.validate():
        form_data = {
            'NumeroPedido' : request.POST.numeropedido,
            'Cantidad': request.POST.cantidad,
            'Nombre': request.POST.nombre,
            'Tamano': request.POST.tamano
        }
        pedido.insert(form_data)
        redirect('/pedidos')

    rows=pedido.select()
    return template('ver_pedidos', rows=pedido.select(), form=form)



@get('/edit_pedido/<no:int>')
def edit_pedido_form(no):
    # Obtenemos la tarea a editar
    fields = ['Cantidad', 'nombre','Tamano']
    where = {'NumeroPedido': no}
    cur_data = pedido.get(fields, where)  
    
    # Creamos formulario y le pasamos los valores actuales de la tarea
    form = EditPedidoForm(request.POST)

    form.cantidad.data = cur_data[0]
    form.nombre.data = cur_data[1]
    form.tamano.data = cur_data[2]

    return template('edit_pedido', form=form, no=no)
    

@post('/edit_pedido/<no:int>')
def edit_pedido(no):
    form =  EditPedidoForm(request.POST)
    if form.save.data and form.validate():
        data = {
            'Cantidad': request.POST.cantidad,
            'Nombre': request.POST.nombre, 
            'Tamano': request.POST.tamano
        }

        where = {'NumeroPedido': no}
        
        pedido.update(data, where)
        
    return redirect('/pedidos')

    

@get('/facturas')
def ver_facturas():
    rows=factura.select()
    return template('ver_facturas', rows=factura.select())
    

@get('/add_factura')
def nueva_factura_form():
    rows = factura.select()
    form = NewFacturaForm(request.POST)
    return template('nueva_factura', rows=factura.select(), form=form)

@post('/add_factura')
def nueva_factura_save():
    form = NewFacturaForm(request.POST) 
    if form.save.data and form.validate():
        form_data = {
            'IdFactura' : request.POST.idfactura,
            'Fecha': request.POST.fecha,
            'NumeroPedido': request.POST.numeropedido,
        }
        factura.insert(form_data)
        redirect('/facturas')

    rows=factura.select()
    return template('ver_facturas', rows=factura.select(), form=form)
       

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
            factura.delete(where)
    return redirect('/facturas')

@get('/edit_factura/<no:int>')
def edit_factura_form(no):

    fields = ['Fecha', 'NumeroPedido']
    where = {'IdFactura': no}
    cur_data = factura.get(fields, where)  
    
    form = EditFacturaForm(request.POST)

    form.fecha.data = cur_data[0]
    form.numeropedido.data = cur_data[1]

    return template('edit_factura', form=form, no=no)
    

@post('/edit_factura/<no:int>')
def edit_factura(no):
    form =  EditFacturaForm(request.POST)
    if form.save.data and form.validate():
        data = {
            'Fecha': request.POST.fecha,
            'NumeroPedido': request.POST.numeropedido
        }

        where = {'IdFactura': no}
        
        factura.update(data, where)
        
    return redirect('/facturas')

  

@get('/edit_cliente/<no:int>')
def edit_cliente_form(no):
    #Obtenemos el cliente a editar
    fields = ['Telefono','nombre','Direccion','C_Postal']
    where = {'NumeroPedido': no}
    cur_data = cliente.get(fields, where)  
    
    # Creamos formulario y le pasamos los valores actuales del cliente
    form = EditClienteForm(request.POST)

    form.telefono.data = cur_data[0]
    form.nombre.data = cur_data[1]
    form.direccion.data = cur_data[2]
    form.c_postal.data = cur_data[3]

    return template('edit_cliente', form=form, no=no)
    

@post('/edit_cliente/<no:int>')
def edit_cliente(no):

    form = EditClienteForm(request.POST)
    if form.save.data and form.validate():
        data = {
          
            'Telefono': request.POST.telefono,
            'nombre': request.POST.nombre, 
            'Direccion': request.POST.direccion,
            'C_Postal': request.POST.c_postal
        }

        where = {'NumeroPedido': no}
        
        cliente.update(data, where)
        
    return redirect('/clientes')

@get('/add_index')
def insert_form():
    return template('index')

@post('/add_index')
def insert_index_save():

    if request.POST.save:
            data = {
                'Telefono': request.POST.telefono.strip(),
                'nombre': request.POST.nombre.strip(),
                'Direccion': request.POST.direccion.strip(),
                'C_Postal': request.POST.c_postal.strip(),
                'NumeroPedido': numeropedido
            }

            cliente.insert(data)
    return redirect('/clientes')


@get("/static/<filepath:path>")
def html(filepath):
    return static_file(filepath, root = "static")
    
@get("/")
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
