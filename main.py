from bottle import route, run, template, request, get, post, redirect, static_file, error




@get("/static/<filepath:path>")
def html(filepath):
    return static_file(filepath, root = "static")
    
@get('/index')
def index():
    return static_file('index.html', root='static') 


@get('/pizza.ico')
def index():
    return static_file('pizza.ico', root='static')

if __name__ == '__main__':
    run(host='localhost', port=8080, debug=True, reloader=True)
