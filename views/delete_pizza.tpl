% include('header.tpl', title = "Quitar pizza")

<body>
    <p>Borrar pizza con ID = {{no}}</p>
    <form action="/delete_pizza/{{no}}" method="POST">
      <p>Hac click para confirmar que deseas eliminar la pizza: </p>
      <input type="submit" name="delete" value="Borrar">
      <input type="submit" name="cancel" value="Cancelar">
    </form>   
% include('footer.tpl')