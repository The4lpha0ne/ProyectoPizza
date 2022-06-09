% include('header.tpl', title = "Editar pizza")
<h1> Editar pizza con ID {{no}} </h1>
    <form action="/edit_pizza/{{no}}" method="POST">
      <input type="text" name="nombre" value="{{old[1]}}" size="100" maxlength="100">
      <input type = "text" name = "tamano" value="{{old[2]}}" size="100" maxlength="100">
      <input type = "text" name = "precio" value="{{old[3]}}" size="100" maxlength="100">
      <input type="submit" name="save" value="Editar pizza">
    </form>   
</body>
</html>