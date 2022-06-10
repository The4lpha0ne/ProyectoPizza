% include('header.tpl', title = "Editar factura")
<h1> Editar factura con ID {{no}} </h1>
    <form action="/edit_factura/{{no}}" method="POST">
      <input type="text" name="fecha" value="{{old[0]}}" size="100" maxlength="100">
      <input type = "text" name = "numeropedido" value="{{old[1]}}" size="100" maxlength="100">
      <input type="submit" name="save" value="Editar factura">
    </form>   
% include('footer.tpl')