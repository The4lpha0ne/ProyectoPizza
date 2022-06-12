% include('header.tpl', title = "Editar pedido")

    <p>Editar pedido con número de pedido {{no}}:</p>
    <form action="/edit_pedido/{{no}}" method="POST">
      <fieldset>
        <div>    
            {{ form.cantidad.label }}
            {{ form.cantidad }}</br>


             {{ form.nombre.label }}
             {{ form.nombre }}</br>  

             {{ form.tamano.label }}
             {{ form.tamano }}


           

            %if form.cantidad.errors:
            <ul class="errors">
                %for error in form.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end


            %if form.nombre.errors:
            <ul class = "errors">
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



        </div>

        <div>
           </br> {{ form.save }}    
        </div>
    </fieldset>
    </form>   

% include('footer.tpl')