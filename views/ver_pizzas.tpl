% include('header.tpl', title = "Ver pizzas")
<p>Las pizzas disponibles son las siguientes:</p>
<table border="1">
%for row in rows:
  <tr>
  %for col in row:
    <td>{{col}}</td>
  %end
  </tr>
%end
</table>