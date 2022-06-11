% include('header.tpl', title = "Pizzeria Papa Juan")
<h1>Pizzeria Papa Juan</h1>
<p><b>Añadir una nueva pizza:</b></p>
<form action="/add_pizza" method="POST">
    <fieldset>
        <div>    
            {{ form.idpizza.label }}:
            {{ form.idpizza }}</br>

            {{  form.nombre.label }}
            {{  form.nombre }}</br>


            {{  form.tamano.label }}

            {{  form.tamano }}</br>

            {{ form.precio.label }}

            {{ form.precio}}




            %if form.idpizza.errors:
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

            %if form.precio.errors:
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