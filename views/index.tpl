<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/static/imagenes/pizza.ico" type="image/x-icon">
    <link rel="stylesheet" href="/static/css/pizzeria.css">
    <title>Pizzeria Papá Juan</title>
</head>
<body>
    <header class="titulo">
        <img src="/static/imagenes/Papa_Juan.png" 
        alt="papa_juan1" class="logo1">

        <h1 class="LaPizzeria">
            <span class="span1">
                Pizzería
            </span>

            <span class="span2">
                Papá Juan
            </span>
        </h1>

        <img src="/static/imagenes/Papa_Juan.png" 
        alt="papa_juan2" class="logo2">    
    </header>

    <div class="elpedido">
        <h2>Servicio a Domicilio &#128513;</h2>        
    </div>

    <main>
        <form class="Formulario1" 
        action="http://www.iesanaluisabenitez.org/" 
        method="GET">
            <fieldset class="menu_pizzas">
                <legend class="pedido">Pizzas</legend>

                <div class="PrimeraParte">
                    <label for="pizza" class="thepizza">
                        Tipo de Pizza
                    </label>

                    <select name="escoger_pizzas" id="" 
                    class="escoger_pizzas">
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
                </div>

                <ul class="carta">
                    <li class="carta_pizzas">  
                        <p>
                            <b>Barbacoa</b> - Bacon, Carne Picada, 
                            Cebolla, Pechuga de Pollo, Queso, 
                            Tomate -<b> 12,50€</b>
                        </p>

                        <p>
                            <b>Capricciosa</b> - Aceitunas Negras, 
                            Anchoas, Champiñones, Queso, Tomate 
                            -<b> 11,50€</b>
                        </p>

                        <p>
                            <b>Cuatro Estaciones</b> - Albahaca, 
                            Aceitunas, Alcachofa, Jamón, Setas, 
                            Tomate -<b> 15,00€</b>
                        </p>

                        <p>
                            <b>Cuatro Quesos</b> - Queso cheddar, 
                            Queso crema, Queso mozzarella, 
                            Queso parmesano -<b> 13,00€</b>
                        </p>

                        <p>
                            <b>Hawaiana</b> - Jamón, Piña, 
                            Queso fundido, Tomate 
                            -<b> 18,00€</b>
                        </p>

                        <p>
                            <b>Margarita</b> - Jamón, Queso, 
                            Tomate -<b> 10,00€</b>
                        </p>

                        <p>
                            <b>Marinera</b> - Aceite, Ajo, 
                            Orégano, Tomate -<b> 12,50€</b>
                        </p>

                        <p>
                            <b>Napolitana</b> - Aceite, 
                            Alcaparras, Anchoas, Mozzarella, 
                            Orégano, Tomate -<b> 13,50€</b>
                        </p>

                        <p>
                            <b>Pepperoni</b> - Mozzarella, 
                            Pepperoni, Salami, Tomate 
                            -<b> 11,50€</b>
                        </p>

                        <p>
                            <b>Vegetariana</b> - Berenjena, 
                            Calabacín, Cebolla, Mozzarella, 
                            Pimiento verde, Tomate 
                            -<b> 13,00€</b>
                        </p>
                    </li>

                    <li class="imagen_pizzas">
                        <img src="/static/imagenes/Pizzaa_carta.jpg" 
                        alt="pizza_carta" class="pizza_carta">

                        <!-- <img src="./imagenes/AnotherPizza.jpg" 
                        alt="pizza_carta2" class="pizza_carta2"> -->
                    </li>
                </ul>
            </fieldset>
    
            <fieldset class="menu_pizzas2">
                <legend class="pedido2">Tamaño</legend>
                <ul class="tamanio">
                    <li class="conatiner1">
                        <input type="radio" name="el_tamanio" id="pequena">
                        <label for="pequena" class="small">Pequeña</label>

                        <input type="radio" name="el_tamanio" id="mediana">
                        <label for="mediana" class="medium">Mediana</label>
                        
                        <input type="radio" name="el_tamanio" id="grande">
                        <label for="grande" class="large">Grande</label>
                    </li> 
                </ul>
            </fieldset>

            <fieldset class="menu_pizzas3">
                <legend class="pedido3">Entrega</legend>

                <ul class="clientito">
                    <li class="conatiner2"> 
                        <label for="cliente" class="the_client">
                            Cliente
                        </label>
                        <input type="text" name="client" id="cliente" 
                        required minlength="3" maxlength="50">

                        <label for="telefono" class="phone">
                            Teléfono
                        </label>
                        <input type="text" name="phone_number" 
                        id="telefono" required minlength="9" 
                        maxlength="9">
                    </li>

                    <li class="conatiner3">
                        <label for="direccion" class="address">
                            Dirección
                        </label>

                        <textarea name="the_address" 
                        id="direccion" cols="30" 
                        rows="10"></textarea>
                    </li>
                
                    <li class="conatiner4">
                        <label for="hora_de_entrega" 
                        class="delivery_time">
                            Hora de entrega
                        </label>

                        <input type="time" name="la_delivery" 
                        id="hora_de_entrega" min="" max="" 
                        required>
                    </li>

                    <li class="ultima_parte">
                        <label for="bebida" class="the_drink">
                            Escoger Bebida
                        </label>

                        <select name="escoger_bebida" id="bebida" 
                        class="escoger_bebida">
                            <option value="cocacola">
                                Coca Cola
                            </option>

                            <option value="sprite">
                                Sprite
                            </option>

                            <option value="Nestea_mango_pina">
                                Nestea (Mango-Piña)
                            </option>

                            <option value="Nesta_limon">
                                Nestea (Limón)
                            </option>

                            <option value="fanta_naranja">
                                Fanta (Naranja)
                            </option>

                            <option value="botella_agua">
                                Botella de Agua
                            </option>

                            <option value="ninguna">
                                Ninguna
                            </option>
                        </select>
        
                        <input type="submit" 
                        value="Realizar Pedido" 
                        class="realizar">
                    </li>
                </ul>
            </fieldset>
        </form>
    </main>   
</body>
</html>