% include('header.tpl', title = "Editar pizza")

    <p>Editar pizza con ID {{no}}:</p>
    <form action="/edit_pizza/{{no}}" method="POST">
      <fieldset>
        <div>    
            {{ form.nombre.label }}
            {{ form.nombre }}</br>


             {{ form.tamano.label }}
             {{ form.tamano }}</br>  

             {{ form.precio.label }}
             {{ form.precio }}


           

            %if form.nombre.errors:
            <ul class="errors">
                %for error in form.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end


            %if form.tamano.errors:
            <ul class = "errors">
                %for error in form.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end



            %if form.precio.errors:
            <ul class = "errors">
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

% include('footer.tpl')