% include('header.tpl', title = "Editar datos del cliente")
<h1> Editar cliente con número de pedido {{no}} </h1>
    <form action="/edit_cliente/{{no}}" method="POST">
      <input type="text" name="telefono" value="{{old[0]}}" size="100" maxlength="100">
      <input type = "text" name = "nombre" value="{{old[1]}}" size="100" maxlength="100">
      <input type = "text" name = "direccion" value="{{old[2]}}" size="100" maxlength="100">
      <input type = "text" name = "c_postal" value="{{old[3]}}" size="100" maxlength="100">
      <input type="submit" name="save" value="Editar cliente">
    </form>   
% include('footer.tpl')