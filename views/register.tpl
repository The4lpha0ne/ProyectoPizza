<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/static/css/formularios.css">
    <title></title>
</head>
<body>
<h1>Formulario de registro</h1>
% if form.errors:
<blockquote>
    <p>Hay errores en el formulario:</p>
    <ul>
    % for field, errors in form.errors.items():
        % for error in errors:
        <li>{{field}}: {{error}}</li>
        % end
    % end
    </ul>
</blockquote>

% end
<form method="POST" action="/register">
    <fieldset>
    <div>
        {{ form.username.label }}
        {{ form.username }}

    </div>

    <div>    
        {{ form.email.label }}
        {{ form.email }}
        %if form.email.errors:
        <ul class="errors">
            %for error in form.email.errors:
                <li>{{ error }}</li>
            %end
        </ul>
        %end
    </div>

    <div>
        {{ form.password.label }}:
        {{ form.password }}
    </div>
    <div>
        {{ form.password_confirm.label }}:
        {{ form.password_confirm }}
        %if form.password.errors:
        <ul class="errors">
            %for error in form.password.errors:
                <li>{{ error }}</li>
            % end
        </ul>
        %end
    </div>

    <div>
        {{ form.accept_rules.label }}
        {{ form.accept_rules }}
    </div>

    <div>
        {{ form.save }}
        
    </div>
    <div><a href="/" class="btn btn-secondary">Cancelar</a></div>
</fieldset>
</form>
% include('footer.tpl')