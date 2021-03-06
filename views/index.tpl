<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./static/imagenes/pizza.ico" type="image/x-icon">
    <link rel="stylesheet" href="./static/css/pizzeria.css">
    <title>Pizzeria Papá Juan</title>
</head>
<body>
    <header class="titulo">
        <img src="./static/imagenes/Papa_Juan.png" 
        alt="papa_juan1" class="logo1">

        <h1 class="la_pizzeria">
            <span class="span1">
                Pizzería
            </span>

            <span class="span2">
                Papá Juan
            </span>
        </h1>

        <img src="./static/imagenes/Papa_Juan.png" 
        alt="papa_juan2" class="logo2">    
    </header>

    <div class="elpedido">
        <h2>Servicio a Domicilio &#128513;</h2>        
    </div>

    <main>
        <div class="formulario_uno">
            <fieldset class="menu_pizzas">
                <legend class="legend1" id="legend1"></legend>

                <div class="primera_parte">
                    <div class="container_titulo1">
                        <div class="pedido1">Pizzas</div>

                        <label for="pizza" class="la_pizza">
                            Tipo de Pizza:
                        </label>
                    </div>

                    <select name="escoger_pizzas" id="" 
                    class="escoger_pizzas" required>
                        <option value="barbacoa">
                            Barbacoa
                        </option>

                        <option value="capricciosa">
                            Capricciosa
                        </option>

                        <option value="cuatro_estaciones">
                            Cuatro Estaciones
                        </option>

                        <option value="cuatro_quesos">
                            Cuatro Quesos
                        </option>

                        <option value="hawaiana">
                            Hawaiana
                        </option>

                        <option value="margarita">
                            Margarita
                        </option>

                        <option value="marinera">
                            Marinera
                        </option>

                        <option value="napolitana">
                            Napolitana
                        </option>

                        <option value="pepperoni">
                            Pepperoni
                        </option>

                        <option value="vegetariana">
                            Vegetariana
                        </option>
                    </select>

                    <div class="menu_pizzas2">
                        <div class="pedido2">Tamaño</div>
                        <ul class="tamanio">
                            <li class="conatiner1">
                                <input type="radio" name="el_tamanio" id="pequenia" checked>
                                <label for="pequenia" class="tamanio_pequenia">Pequeña: €6,99</label>
        
                                <input type="radio" name="el_tamanio" id="mediana">
                                <label for="mediana" class="tamanio_mediana">Mediana: €11,99</label>
                                
                                <input type="radio" name="el_tamanio" id="grande">
                                <label for="grande" class="tamanio_grande">Grande: €14,99</label>
                            </li> 
                        </ul>
                    </div>
                </div>

                <div class="segunda_parte">
                    <label for="cantidad" class="la_cantidad">
                        Cantidad:
                    </label>

                    <input type="number" id="cantidad" 
                    name="input_cantidad" min="1" max="10" 
                    value="1" required>


                    <input type="submit" value="Confirmar" 
                    class="confirmacion">
                </div>

                <ul class="carta">
                    <li class="carta_pizzas">  
                        <p>
                            <b>Barbacoa</b> - Bacon, Carne Picada, 
                            Cebolla, Pechuga de Pollo, Queso y 
                            Tomate.
                        </p>

                        <p>
                            <b>Capricciosa</b> - Aceitunas Negras, 
                            Anchoas, Champiñones, Queso y Tomate. 
                        </p>

                        <p>
                            <b>Cuatro Estaciones</b> - Albahaca, 
                            Aceitunas, Alcachofa, Jamón, Setas 
                            y Tomate.
                        </p>

                        <p>
                            <b>Cuatro Quesos</b> - Queso cheddar, 
                            Queso crema, Queso mozzarella y 
                            Queso parmesano.
                        </p>

                        <p>
                            <b>Hawaiana</b> - Jamón, Piña, 
                            Queso fundido y Tomate. 
                        </p>

                        <p>
                            <b>Margarita</b> - Jamón, Queso y 
                            Tomate.
                        </p>

                        <p>
                            <b>Marinera</b> - Aceite, Ajo, 
                            Orégano, Tomate.
                        </p>

                        <p>
                            <b>Napolitana</b> - Aceite, 
                            Alcaparras, Anchoas, Mozzarella, 
                            Orégano y Tomate.
                        </p>

                        <p>
                            <b>Pepperoni</b> - Mozzarella, 
                            Pepperoni, Salami y Tomate.
                        </p>

                        <p>
                            <b>Vegetariana</b> - Berenjena, 
                            Calabacín, Cebolla, Mozzarella, 
                            Pimiento verde y Tomate.
                        </p>
                    </li>

                    <li class="imagen_pizzas">
                        <img src="./static/imagenes/Pizzaa_carta.jpg" 
                        alt="pizza_carta" class="pizza_carta" 
                        width="768" height="250">
                    </li>
                </ul>
            </fieldset>

            <form action = "/add_index" method = "POST" class="form_real_1">
                <fieldset class="menu_pizzas3">
                    <legend class="legend2" id="legend2">Entrega</legend>

                    <ul class="clientito">
                        <li class="conatiner2">
                            <label for="telefono" class="movil">
                                Telefono
                            </label>
                            <input type="text" name="telefono" 
                            id="telefono" minlength="9" maxlength="9" 
                            required>

                            <label for="cliente" class="el_cliente">
                                Cliente
                            </label>
                            <input type="text" name="nombre" 
                            id="cliente" minlength="3" 
                            maxlength="50" required>
                        </li>

                        <li class="conatiner3">
                            <label for="direccion" class="la_direccion">
                                Dirección
                            </label>

                            <textarea name="direccion" 
                            id="direccion" cols="30" 
                            rows="3" required></textarea>
                        </li>

                        <li>
                            <label for="insertar_codigo" 
                            class="codigo_postal">
                                Codigo Postal
                            </label>
                            
                            <input type="text" name="c_postal"
                            id="insertar_codigo" minlength="5" 
                            maxlength="5" required>
                        </li>


                        <li>
                            <input type="submit" value="Realizar Pedido" 
                            name="save" class="realizar" formmethod="post">
                        </li>
                    </ul>
                </fieldset>
            </form>
        </div>
    </main>
    
    <footer class="redes_sociales">
        <div class="foto1">
            <a href="https://twitter.com/?lang=es" 
            target="_blank" rel="noopener noreferrer">
                <img src="./static/imagenes/twitter.png" 
                alt="twitter" class="twitter" 
                width="100" height="100">
            </a>
        </div>

        <div class="foto2">
            <a href="https://www.instagram.com/?hl=es" 
            target="_blank" rel="noopener noreferrer">
                <img src="./static/imagenes/instagram.jpg" 
                alt="instagram" class="instagram" 
                width="100" height="100">
            </a>
        </div>

        <div class="foto3">
            <a href="https://www.facebook.com/" 
            target="_blank" rel="noopener noreferrer">
                <img src="./static/imagenes/facebook.png" 
                alt="facebook" class="facebook" 
                width="100" height="100">
            </a>            
        </div>
    </footer>
</body>
</html>