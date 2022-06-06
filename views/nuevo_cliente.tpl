
% include('header.tpl', title = "Añadir cliente")

<form action="/add_cliente" method="POST">

<h1>Añade los datos del cliente</h1>

<p>Introduce el telefono del cliente: </p>

<input type="text" size="100" maxlength="100" name="telefono">

<p>Introduce el nombre del cliente: </p>

<input type="text" size="100" maxlength="100" name="nombre">

<p>Introduce la direccion del cliente:</p>

<input type="text" size="100" maxlength="100" name="direccion">

<p> Introduce el codigo postal del cliente: </p>

<input type="text" size="100" maxlength="100" name="c_postal">

<p> Introduce el numero de pedido del cliente: </p>

<input type="text" size="100" maxlength="100" name="numeropedido"><br>


<br><input type="submit" name="save" value="Añadir cliente">
</form>