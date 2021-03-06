% include('header.tpl', title = "Ver facturas")

<h1>Pizzeria Papa Juan</h1>
<p><b>Añadir una nueva factura:</b></p>
<form action="/facturas" method="POST">
    <fieldset>
        <div>    
            {{ form.idfactura.label }}
            {{ form.idfactura }}


            %if form.idfactura.errors:
            <ul class="errors">
                %for error in form.idfactura.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end
        </div>

        <div>
            {{  form.fecha.label }}
            {{  form.fecha }}


            %if form.fecha.errors:
            <ul class="errors">
                %for error in form.fecha.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end
        </div>
        <div>

            {{  form.numeropedido.label }}

            {{  form.numeropedido }}


            %if form.numeropedido.errors:
            <ul class="errors">
                %for error in form.numeropedido.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end
        </div>

        <div>
           {{ form.save }}    
        </div>
    
    </fieldset>
</form>

   <table border="1">
    <tr>
        <th>IdFactura</th>
        <th>Fecha</th>
        <th>NumeroPedido</th>
        <th colspan="2">Acciones</th>
    </tr>
    %for row in rows:
    <tr>
        <td>{{row[0]}}</td> 
        <td>{{row[1]}}</td>  
        <td>{{row[2]}}</td>      
        <td>
            <form action="/edit_factura/{{row[0]}}" method="GET">
                <input type="submit" name="save" value="Editar">
            </form>
        </td>
        <td>
            <form action="/delete_factura/{{row[0]}}" method="GET">
                <input type="submit" name="delete" value="Borrar">
            </form>
        </td>
    </tr>
    %end
</table>
% include('footer.tpl')