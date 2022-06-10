% include('header.tpl', title = "Añadir factura")

<form action="/add_factura" method="POST">

<h1>Añade los datos de la factura</h1>

<p>Introduce el id de la factura: </p>

<input type="text" size="100" maxlength="100" name="idfactura">

<p>Introduce la fecha: </p>

<input type="text" size="100" maxlength="100" name="fecha">

<p>Introduce el numero del pedido:</p>

<input type="text" size="100" maxlength="100" name="numeropedido"></br>


</br><input type="submit" name="save" value="Añadir factura">
</form>