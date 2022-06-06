% include('header.tpl', title = "Editar factura")

    <form action="/edit/{{no}}" method="POST">
      <input type="text" name="numeropedido" value="{{old[0]}}" size="100" maxlength="100">
      <br>
      <input type="text" name="fecha" value="{{old[1]}}" size="100" maxlength="100">
      <input type = "text" name = "idfactura" value="{{old[2]}}" size="100" maxlength="100">
      <input type="submit" name="save" value="Editar factura">
    </form>   
</body>
</html>