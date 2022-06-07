#Creo la clase cliente
class cliente:
    #El constructor tendrá una lista vacía para insertar los datos
    def __init__(self):
        self.datos = []
    #Con esta función se agregarán datos a la lista de datos
    def agregar_datos(self, telefono, nombre, direccion, c_postal, numero_pedido ):
        self.datos.append([telefono, nombre, direccion, c_postal, numero_pedido])
    #Con está función se mostrarán por pantalla los datos almacenados
    def __str__(self):
        return f"los datos introducidos hasta ahora son : {self.datos}"
    #Con esta función se cambiará de la lista el dato que el usuario decida
    def cambiar_datos(self, dato_nuevo, numero_telefono, campo):
        #Recorremos la lista
        for i in range(len(self.datos)):
            if self.datos[i][0] == numero_telefono:
                if campo == "nombre":
                    self.datos[i][1] = dato_nuevo
                elif campo == "direccion":
                    self.datos[i][2] = dato_nuevo        
                elif campo == "c_postal":
                    self.datos[i][3] = dato_nuevo
                elif campo == "numero_pedido":
                    self.datos[i][4] = dato_nuevo
                else:
                    print("El campo que se quiere cambiar no existe.")    
    #Eliminamos de la lista los datos según su clave principal que es el número e teléfono
    def eliminar_datos(self, telefono):
        for i in range(len(self.datos) -1, -1, -1):
            if self.datos[i][0] == telefono:
                del self.datos[i]                
#Creamos el objeto de la clase
clientes = cliente()     
#En las siguientes líneas de código ejecutaremos las pruebas que verificarán nuestro código
clientes.agregar_datos(653789654, "Pepe", "calle_fulanito", 64532, 5437891)

clientes.cambiar_datos("Juan", 653789654, "nombre" )

clientes.eliminar_datos(653789654)

