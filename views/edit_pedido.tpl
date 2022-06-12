% include('header.tpl', title = "Editar pedido")

    <p>Editar pedido con número de pedido {{no}}:</p>
    <form action="/edit_pedido/{{no}}" method="POST">
      <fieldset>
        <div>    
            {{ form.cantidad.label }}
            {{ form.cantidad }}</br>

              %if form.cantidad.errors:
            <ul class="errors">
                %for error in form.cantidad.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end
        </div>

        <div>

             {{ form.nombre.label }}
             {{ form.nombre }}</br>  

            %if form.nombre.errors:
            <ul class = "errors">
                %for error in form.nombre.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end


        </div>
             {{ form.tamano.label }}
             {{ form.tamano }}
    
            %if form.tamano.errors:
            <ul class="errors">
                %for error in form.cantidad.errors:
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