% include('header.tpl', title = "Editar cliente")
    <p>Editar cliente número de pedido {{no}}:</p>
    <form action="/edit_cliente/{{no}}" method="POST">
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
            {{ form.nombre.label }}

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
            {{ form.direccion.label }}
            {{ form.direccion }} </br>

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
            {{ form.c_postal }}


            %if form.c_postal.errors:
            <ul class="errors">
                %for error in form.c_postal.errors:
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
% include('footer.tpl')