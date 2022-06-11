%include('header.tpl',title = 'Clientes')

<p><b>Las clientes son los siguientes:</b></p>
<table border="1">
    <tr>
        <th>Telefono</th>
        <th>Nombre</th>
        <th>Direccion</th>
        <th>Código Postal</th>
        <th>NumeroPedido</th>
        <th colspan="2">Acciones</th>
    </tr>
    %for row in rows:
    <tr>
        <td>{{row[0]}}</td> 
        <td>{{row[1]}}</td>  
        <td>{{row[2]}}</td>      
        <td>{{row[3]}}</td>  
        <td>{{row[4]}}</td>
        <td>
            <form action="/edit_cliente/{{row[4]}}" method="GET">
                <input type="submit" name="save" value="Editar">
            </form>
        </td>
        <td>
            <form action="/delete_cliente/{{row[4]}}" method="GET">
                <input type="submit" name="delete" value="Borrar">
            </form>
        </td>
    </tr>
    %end
</table>
% include('footer.tpl')