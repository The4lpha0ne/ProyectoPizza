% include('header.tpl', title = "Editar factura")

    <p>Editar factura con ID {{no}}:</p>
    <form action="/edit_factura/{{no}}" method="POST">
      <fieldset>
        <div>    
            {{ form.fecha.label }}
            {{ form.fecha }}</br>


            {{ form.numeropedido.label }}
            {{ form.numeropedido }}</br> 


            %if form.fecha.errors:
            <ul class="errors">
                %for error in form.fecha.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end


            %if form.numeropedido.errors:
            <ul class = "errors">
                %for error in form.numeropedido.errors:
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

%include('footer.tpl')
