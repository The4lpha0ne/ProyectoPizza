% include('header.tpl', title = "Añadir pizzas")


<h1>Añade una pizza</h1>
<br>
<form action="/add_pizza" method="POST">
<p>Introduce el nombre de la pizza </p>
<input type="text" size="100" maxlength="100" name="nombre">
<p> Introduce el tamaño de la pizza</p>
<input type="text" size="100" maxlength="100" name="tamano">
<p> Introduce el precio de la pizza </p>
<input type="text" size="100" maxlength="100" name="precio">
<input type="submit" name="save" value="Añadir pizza">
</form>