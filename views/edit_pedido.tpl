% include('header.tpl', title = "Editar pedido")
<h1> Editar pedido número {{no}} </h1>
    <form action="/edit_pedido/{{no}}" method="POST">
      <input type="text" name="cantidad" value="{{old[0]}}" size="100" maxlength="100">
      <input type = "text" name = "nombre" value="{{old[1]}}" size="100" maxlength="100">
      <input type = "text" name = "tamano" value="{{old[2]}}" size="100" maxlength="100">
      <input type="submit" name="save" value="Editar pedido">
    </form>   
</body>
</html>