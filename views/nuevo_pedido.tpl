% include('header.tpl', title = "Pizzeria Papa Juan")
<h1>Pizzeria Papa Juan</h1>
<p><b>Añadir un nuevo pedido:</b></p>
<form action="/add_pedido" method="POST">
    <fieldset>
        <div>    
            {{ form.numeropedido.label }}:
            {{ form.numeropedido }}</br>

            {{  form.cantidad.label }}
            {{  form.cantidad }}</br>


            {{  form.nombre.label }}

            {{  form.nombre }}</br>

            {{ form.tamano.label }}

            {{ form.tamano}}</br>


             

            %if form.numeropedido.errors:
            <ul class="errors">
                %for error in form.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end

            

            %if form.cantidad.errors:
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


            %if form.tamano.errors:
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