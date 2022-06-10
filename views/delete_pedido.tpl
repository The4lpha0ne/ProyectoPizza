% include('header.tpl', title = "Quitar pedido")

<body>
    <p>Borrar pedido con numero = {{no}}</p>
    <form action="/delete_pedido/{{no}}" method="POST">
      <p>Hac click para confirmar que deseas eliminar el pedido: </p>
      <input type="submit" name="delete" value="Borrar">
      <input type="submit" name="cancel" value="Cancelar">
    </form>   
</body>
</html>