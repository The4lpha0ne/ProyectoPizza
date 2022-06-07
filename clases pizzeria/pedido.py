#Importamos las otras clases 
from pizza import *
from cliente import *
from abc import ABC, abstractmethod
class pedido_abstracta:
    @abstractmethod
    def agregar_pedidos(self, numeropedido, cantidad, nombre, tamano):  
        pass  
    @abstractmethod    
    def modificar_pedido(self, dato_nuevo, numeropedido,nombre, tamano, campo):
        pass
    @abstractmethod    
    def eliminar_pedido(self, numeropedido, nombre, tamano):
        pass    

class pedido(pedido_abstracta):
    def __init__(self):
        self.lista_pedidos = []

    def __str__(self):
        return f"La lista de pedidos contiene los siguientes: {self.lista_pedidos}"
          

    def agregar_pedidos(self, numeropedido, cantidad, nombre, tamano):  
        self.lista_pedidos.append([numeropedido, cantidad, nombre, tamano]) 

    def modificar_pedido(self, dato_nuevo, numeropedido,nombre, tamano, campo):
        for i in range(len(self.lista_pedidos)):
            if self.lista_pedidos[i][0] == numeropedido and self.lista_pedidos[i][2] == nombre and self.lista_pedidos[i][3] == tamano:
                if campo == "numero_pedido":
                    self.lista_pedidos[i][0] = dato_nuevo 
                elif campo == "nombre":
                    self.lista_pedidos[i][2] = dato_nuevo
                elif campo == "tamano":
                    self.lista_pedidos[i][3] = dato_nuevo
                elif campo == "cantidad":
                    self.lista_pedidos[i][1] = dato_nuevo
                else:
                    print("El nombre del campo no existe!!")

    def eliminar_pedido(self, numeropedido, nombre, tamano):
        for i in range(len(self.lista_pedidos) -1, -1, -1):
            if self.lista_pedidos[i][0] == numeropedido and self.lista_pedidos[i][2] == nombre and self.lista_pedidos[i][3] == tamano:
                del self.lista_pedidos[i]

#Creamos el objeto y le pasamos las pruebas
lista_de_pedidos = pedido()

lista_de_pedidos.agregar_pedidos(364578, 2, "barbacoa", "mediana")

lista_de_pedidos.agregar_pedidos(549871, 1, "marinera", "grande")

lista_de_pedidos.modificar_pedido("pequena", 364578, "barbacoa", "mediana", "tamano")

lista_de_pedidos.eliminar_pedido(549871, "marinera", "grande")

print(lista_de_pedidos)