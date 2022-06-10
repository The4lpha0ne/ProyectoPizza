% include('header.tpl', title = "Quitar cliente")

<body>
    <p>Borrar cliente con número de pedido = {{no}}</p>
    <form action="/delete_cliente/{{no}}" method="POST">
      <p>Hac click para confirmar que deseas eliminar al cliente: </p>
      <p><b>{{old[0]}}</b></p>

      <input type="submit" name="delete" value="Borrar">
      <input type="submit" name="cancel" value="Cancelar">
    </form>   
</body>
</html>