import sys 
sys.path.append('models')
import bottle
from bottle import route, run, template, request, get, post, redirect, static_file, error
from config.config import DATABASE,pedido_definition,pizza_definition,factura_definition,cliente_definition
from models.pizzeria import Pizzeria


pizzeriapapajuan = Pizzeria(DATABASE)

@get("/static/<filepath:path>")
def html(filepath):
    return static_file(filepath, root = "static")
    
@get('/')
def index():
    rows=pizzeriapapajuan.select()
    return template('index', rows = pizzeriapapajuan.select())


@get('/pizza.ico')
def icon():
    return static_file('pizza.ico', root='static')

if __name__ == '__main__':
    run(host='localhost', port=8080, debug=True, reloader=True)
