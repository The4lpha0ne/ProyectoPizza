from abc import ABC, abstractmethod
from pedido import *


class factura_interfaz(ABC):
    @abstractmethod
    def agregar_factura(self, idfactura, fecha, numeropedido):
        pass
    @abstractmethod    
    def modificar_factura(self, nuevo_dato, idfactura, campo):
        pass
    @abstractmethod
    def eliminar_factura(self, idfactura):
        pass


class Factura(factura_interfaz):
    def __init__(self):
        self.lista_facturas = []

    def __str__(self):
        return f"la lista con las facturas es la siguiente: {self.lista_facturas}"
         

    def agregar_factura(self, idfactura, fecha, numeropedido):
        self.lista_facturas.append([idfactura, fecha, numeropedido])

    def modificar_factura(self, nuevo_dato, idfactura, campo):
        for i in range(len(self.lista_facturas)):
            if self.lista_facturas[i][0] == idfactura:
                if campo == "fecha":
                    self.lista_facturas[i][1] = nuevo_dato
                elif campo == "id_factura":
                    self.lista_facturas[i][0] = nuevo_dato
                elif campo == "numero_pedido":
                    self.lista_facturas[i][2] = nuevo_dato
                else:
                    print("El campo especificado no existe!!!")  

    def eliminar_factura(self, idfactura):
        for i in range(len(self.lista_facturas) -1, -1, -1):
            if self.lista_facturas[i][0] == idfactura:
                del self.lista_facturas[i]                      

facturas_pizzeria = Factura()
facturas_pizzeria.agregar_factura(65421, "04/03/2022", 364578 )
facturas_pizzeria.agregar_factura(78129, "01/07/2021", 549871 )
facturas_pizzeria.modificar_factura("02/01/2022", 364578, "fecha")
facturas_pizzeria.eliminar_factura(78129)
print(facturas_pizzeria)