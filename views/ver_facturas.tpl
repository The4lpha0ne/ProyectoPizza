% include('header.tpl', title = "Ver facturas")

<p>Los facturas almacenados son:</p>
<table border="1">
  <tr>
            <th>IdFactura</th>
            <th>Fecha</th>
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