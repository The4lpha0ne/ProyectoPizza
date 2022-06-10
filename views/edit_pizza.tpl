% include('header.tpl', title = "Editar pizza")
<h1> Editar pizza con ID {{no}} </h1>
    <form action="/edit_pizza/{{no}}" method="POST">
      <p>Nombre de la pizza </p>
      <input type="text" name="nombre" value="{{old[0]}}" size="100" maxlength="100">
      <p> Tama&ntildeo de la pizza </p>
      <input type="text" name="tamano" value="{{old[1]}}" size="100" maxlength="100">
      <p> Precio </p>
      <input type = "text" name = "precio" value="{{old[2]}}" size="100" maxlength="100"></br>
      </br><input type="submit" name="save" value="Editar pizza">
    </form>   
% include('footer.tpl')