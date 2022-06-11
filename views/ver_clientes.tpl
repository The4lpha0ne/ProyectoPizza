%include('header.tpl',title = 'Clientes')


<p><b>Añadir un nuevo  cliente:</b></p>
<form action="/clientes" method="POST">
    <fieldset>
        <div>    
            {{ form.telefono.label }}:
            {{ form.telefono }}</br>

            {{  form.nombre.label }}
            {{  form.nombre }}</br>


            {{  form.direccion.label }}

            {{  form.direccion }}</br>

            {{ form.c_postal.label }}

            {{ form.c_postal}}</br>


            {{ form.numeropedido.label }}

            {{ form.numeropedido }} </br>

             


            %if form.telefono.errors:
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


            %if form.direccion.errors:
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