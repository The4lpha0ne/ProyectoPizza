% include('header.tpl', title = "Quitar factura")

<body>
    <p>Borrar factura con numero de pedido = {{no}}</p>
    <form action="/delete_factura/{{no}}" method="POST">
      <p>Hac click para confirmar que deseas eliminar la factura: </p>
      <input type="submit" name="delete" value="Borrar">
      <input type="submit" name="cancel" value="Cancelar">
    </form>   
% include('footer.tpl')