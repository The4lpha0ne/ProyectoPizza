% include('header.tpl', title = "Pizzeria Papa Juan")
<h1>Pizzeria Papa Juan</h1>
<p><b>Añadir una nueva factura:</b></p>
<form action="/add_factura" method="POST">
    <fieldset>
        <div>    
            {{ form.idfactura.label }}:
            {{ form.idfactura }}</br>

            {{  form.fecha.label }}:
            {{  form.fecha }}</br>


            {{  form.numeropedido.label }}

            {{  form.numeropedido }}</br>



            %if form.idfactura.errors:
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


            %if form.fecha.errors:
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