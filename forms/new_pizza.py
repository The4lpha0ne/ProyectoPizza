from wtforms import Form, StringField, SubmitField, validators,IntegerField

class NewPizzaForm(Form):

    idpizza = IntegerField('IdPizza', [validators.DataRequired(),validators.NumberRange(min = 1,max = 99999)], render_kw={"size" : "70", "maxlength" : "6"})
    nombre = StringField('Nombre', [validators.DataRequired()], render_kw={"size" : "70", "maxlength" : "20"})
    tamano = StringField('Tamaño', [validators.DataRequired()], render_kw={"size" : "70", "maxlength" : "15"})
    precio = IntegerField('Precio', [validators.DataRequired(), validators.NumberRange(min = 7,max = 17 )], render_kw={"size" : "70", "maxlength" : "2"})

    save = SubmitField('Guardar')
    cancel = SubmitField('Cancelar')
 
