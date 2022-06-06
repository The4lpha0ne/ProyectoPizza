

% include('header.tpl', title = "Quitar pizzas")


<p>Introduce el nombre de la pizza que quieres eliminar</p>
<form action="/delete" method="POST">
<input type="text" size="100" maxlength="100" name="nombre">
<input type="submit" name="save" value="save">
</form>