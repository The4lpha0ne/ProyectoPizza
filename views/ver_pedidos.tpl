%#template to generate a HTML table from a list of tuples (or list of lists, or tuple of tuples or ...)
<p>Las pedidos son los siguientes:</p>
<table border="1">
  <tr>
            <th>NumeroPedido</th>
            <th>Cantidad</th>
            <th>Nombre</th>
            <th>Tamano</th>
    </tr>
%for row in rows:
  <tr>
  %for col in row:
    <td>{{col}}</td>
  %end
  </tr>
%end
</table>