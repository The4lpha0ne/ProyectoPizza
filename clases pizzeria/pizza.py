#Como vamos a crear una clase abstracta de la que luego heredará la clase que vamos a usar, tenemos que importar esto
from abc import ABC, abstractmethod
#Creamos la clase abstracta
class pizza_interfaz(ABC): 
    #A cada función hay que añadirle '@abstractmethod'        
    @abstractmethod
    def agregar_pizza(self, nombre, tamano, precio):
        pass
    @abstractmethod
    def cambiar_datos_pizza(self, dato_nuevo, tamano, nombre_pizza, campo):
        pass
    @abstractmethod    
    def eliminar_datos_pizza(self, nombre_pizza, tamano):
        pass
#Al crear la clase que usaremos especificaremos que heredará de la clase abstracta
class pizza(pizza_interfaz):
    #Creamos el constructor
    def __init__(self):
        self.datos_pizza = []
        
    #la primera función servirá para añadir datos a la lista, la segunda servirá para imprimir los datos que hay en la lista actualmente, la tercera servirá para modificar algún dato de la lista y la cuarta servirá para eliminar un dato de la lista usando la clave principal
    def agregar_pizza(self, nombre, tamano, precio):
        self.datos_pizza.append([nombre, tamano, precio])

    def __str__(self):
        return f"Las pizzas que existen actualmente son: {self.datos_pizza}"

    def cambiar_datos_pizza(self, dato_nuevo, tamano, nombre_pizza, campo):
        for i in range(len(self.datos_pizza)):
            if self.datos_pizza[i][0] == nombre_pizza and self.datos_pizza[i][1] == tamano:
                if  campo == "tamaño":
                    self.datos_pizza[i][1] = dato_nuevo
                elif campo == "nombre":
                    self.datos_pizza[i][0] = dato_nuevo
                elif campo == "precio":
                    self.datos_pizza[i][2] = dato_nuevo
                else:
                    print("El campo introducido no existe!!")            

    def eliminar_datos_pizza(self, nombre_pizza, tamano):
        for i in range(len(self.datos_pizza)):
            if self.datos_pizza[i][0] == nombre_pizza and self.datos_pizza[i][1] == tamano:
                del self.datos_pizza[i]
#Creamos el objeto y le pasamos las pruebas
pizzas = pizza()     

pizzas.agregar_pizza("marinera", "grande", 13.99)

pizzas.agregar_pizza("barbacoa", "mediana", 8.99)

pizzas.agregar_pizza("barbacoa", "pequeña", 5.99)

pizzas.cambiar_datos_pizza("grande", "mediana", "barbacoa", "tamaño")

pizzas.eliminar_datos_pizza("barbacoa", "pequeña")

print(pizzas)

