%include('header.tpl',title = 'Clientes')


<p><b>Añadir un nuevo  cliente:</b></p>
<form action="/clientes" method="POST">
    <fieldset>
        <div>    
            {{ form.telefono.label }}
            {{ form.telefono }}

            %if form.telefono.errors:
            <ul class="errors">
                %for error in form.telefono.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end


        </div>
        <div>
            {{  form.nombre.label }}
            {{  form.nombre }}

            %if form.nombre.errors:
            <ul class="errors">
                %for error in form.nombre.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end

        </div>
        <div>
            {{  form.direccion.label }}

            {{  form.direccion }}

            %if form.direccion.errors:
            <ul class="errors">
                %for error in form.direccion.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end
        </div>

        <div>

            {{ form.c_postal.label }}

            {{ form.c_postal}}

            %if form.c_postal.errors:
            <ul class="errors">
                %for error in form.c_postal.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end
        </div>

        <div>
            {{ form.numeropedido.label }}

            {{ form.numeropedido }}

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