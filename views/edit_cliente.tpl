% include('header.tpl', title = "Editar cliente")
    <p>Editar cliente número de pedido {{no}}:</p>
    <form action="/edit_cliente/{{no}}" method="POST">
      <fieldset>
        <div>    

            {{ form.telefono.label }}
 
            {{ form.telefono }} </br>


            {{ form.nombre.label }}

            {{  form.nombre }} </br>  

            {{ form.direccion.label }}
            {{ form.direccion }} </br>


            {{ form.c_postal.label }}
            {{ form.c_postal }}

           

            %if form.telefono.errors:
            <ul class="errors">
                %for error in form.telefono.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end


            %if form.nombre.errors:
            <ul class="errors">
                %for error in form.nombre.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end


            %if form.direccion.errors:
            <ul class="errors">
                %for error in form.direccion.errors:
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

% include('footer.tpl')