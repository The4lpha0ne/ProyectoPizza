% include('header.tpl', title = "Pizzeria Papa Juan")
<h1>Pizzeria Papa Juan</h1>
<p><b>Añadir una nueva pizza:</b></p>
<form action="/pizzas" method="POST">
    <fieldset>
        <div>    
            {{ form.idpizza.label }}
            {{ form.idpizza }}</br>


            %if form.idpizza.errors:
            <ul class="errors">
                %for error in form.idpizza.errors:
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

            {{  form.tamano.label }}

            {{  form.tamano }}</br>

            %if form.tamano.errors:
            <ul class="errors">
                %for error in form.tamano.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end
        </div>

        <div>
            {{ form.precio.label }}

            {{ form.precio}}


            %if form.precio.errors:
            <ul class="errors">
                %for error in form.precio.errors:
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



<p>Las pizzas disponibles son las siguientes:</p>
<table border="1">
 <tr>
            <th>IdPizza</th>
            <th>Nombre</th>
            <th>Tamano</th>
            <th>Precio</th>
            <th colspan = 2> Acciones </th>

    </tr>
  %for row in rows:
    <tr>
        <td>{{row[0]}}</td> 
        <td>{{row[1]}}</td>  
        <td>{{row[2]}}</td>
        <td>{{row[3]}}</td>

        <td>
            <form action="/edit_pizza/{{row[0]}}" method="GET">
                <input type="submit" name="save" value="Editar">
            </form>
        </td>
        <td>
            <form action="/delete_pizza/{{row[0]}}" method="GET">
                <input type="submit" name="delete" value="Borrar">
            </form>
        </td>
    </tr>
    %end
</table>
% include('footer.tpl')