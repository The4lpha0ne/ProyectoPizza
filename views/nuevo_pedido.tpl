
% include('header.tpl', title = "Añadir pedido")

<form action="/add_pedido" method="POST">

<h1>Añade los datos del pedido</h1>

<p>Introduce el numero de pedido: </p>

<input type="text" size="100" maxlength="100" name="numeropedido">

<p>Introduce la cantidad: </p>

<input type="text" size="100" maxlength="100" name="cantidad">

<p>Introduce el nombre de la pizza:</p>

<input type="text" size="100" maxlength="100" name="nombre">

<p> Introduce el tamaño de la pizza: </p>

<input type="text" size="100" maxlength="100" name="tamano">

<br><input type="submit" name="save" value="Añadir pedido">
</form>