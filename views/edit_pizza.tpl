% include('header.tpl', title = "Editar pizza")

    <p>Editar pizza con ID {{no}}:</p>
    <form action="/edit_pizza/{{no}}" method="POST">
      <fieldset>
        <div>    
            {{ form.nombre.label }}
            {{ form.nombre }}
            
            %if form.nombre.errors:
            <ul class="errors">
                %for error in form.nombre.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end
        </div>

        <div>
             {{ form.tamano.label }}
             {{ form.tamano }}

            %if form.tamano.errors:
            <ul class = "errors">
                %for error in form.tamano.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end
        </div>

        <div>
             {{ form.precio.label }}
             {{ form.precio }}

            %if form.precio.errors:
            <ul class = "errors">
                %for error in form.precio.errors:
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