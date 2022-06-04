% include('header.tpl', title = "Ver clientes")

<p>Los clientes almacenados son:</p>
<table border="1">
  <tr>
            <th>Telefono</th>
            <th>Nombre</th>
            <th>Direccion</th>
            <th>C_Postal</th>
            <th>NumeroPedido</th>
    </tr>
%for row in rows:
  <tr>
  %for col in row:
    <td>{{col}}</td>
  %end
  </tr>
%end
</table>