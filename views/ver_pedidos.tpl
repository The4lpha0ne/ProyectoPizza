% include('header.tpl', title = "Ver pedidos")
<h1>Pizzeria Papa Juan</h1>
<p><b>Añadir un nuevo pedido:</b></p>
<form action="/pedidos" method="POST">
    <fieldset>
        <div>    
            {{ form.numeropedido.label }}:
            {{ form.numeropedido }}</br>

            {{  form.cantidad.label }}
            {{  form.cantidad }}</br>


            {{  form.nombre.label }}

            {{  form.nombre }}</br>

            {{ form.tamano.label }}

            {{ form.tamano}}</br>


             

            %if form.numeropedido.errors:
            <ul class="errors">
                %for error in form.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end

            

            %if form.cantidad.errors:
            <ul class="errors">
                %for error in form.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end



            %if form.nombre.errors:
            <ul class="errors">
                %for error in form.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end


            %if form.tamano.errors:
            <ul class="errors">
                %for error in form.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end




        </div>
        <div>
           </br> {{ form.save }}    
        </div>
    
    </fieldset>
</form>


  <table border="1">
    <tr>
        <th>NumeroPedido</th>
        <th>Cantidad</th>
        <th>Nombre</th>
        <th>Tama&ntildeo</th>
        <th colspan="2">Acciones</th>
    </tr>
    %for row in rows:
    <tr>
        <td>{{row[0]}}</td> 
        <td>{{row[1]}}</td>  
        <td>{{row[2]}}</td>
        <td>{{row[3]}}</td>


        <td>
            <form action="/edit_pedido/{{row[0]}}" method="GET">
                <input type="submit" name="save" value="Editar">
            </form>
        </td>
        <td>
            <form action="/delete_pedido/{{row[0]}}" method="GET">
                <input type="submit" name="delete" value="Borrar">
            </form>
        </td>
    </tr>
    %end
</table>
% include('footer.tpl')