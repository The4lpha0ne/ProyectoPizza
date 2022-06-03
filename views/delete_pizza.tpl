<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/static/css/miligram.css">
    <title>Eliminar pizza</title>
</head>

<p>Introduce el nombre de la pizza que quieres eliminar</p>
<form action="/delete" method="POST">
<input type="text" size="100" maxlength="100" name="nombre">
<input type="submit" name="save" value="save">
</form>