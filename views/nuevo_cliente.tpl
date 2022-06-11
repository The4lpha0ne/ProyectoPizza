% include('header.tpl', title = "Pizzeria Papa Juan")
<h1>Pizzeria Papa Juan</h1>
<p><b>Añadir un nuevo cliente:</b></p>
<form action="/add_cliente" method="POST">
    <fieldset>
        <div>    
            {{ form.telefono.label }}:
            {{ form.telefono }}</br>

            {{  form.nombre.label }}
            {{  form.nombre }}</br>


            {{  form.direccion.label }}

            {{  form.direccion }}</br>

            {{ form.c_postal.label }}

            {{ form.c_postal}}</br>


            {{ form.numeropedido.label }}

            {{ form.numeropedido }} </br>

             

            %if form.nombre.errors:
            <ul class="errors">
                %for error in form.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end


            %if form.direccion.errors:
            <ul class="errors">
                %for error in form.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end

            %if form.c_postal.errors:
            <ul class="errors">
                %for error in form.errors:
                    <li>{{ error }}</li>
                %end
            </ul>
            %end


            %if form.numeropedido.errors:
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