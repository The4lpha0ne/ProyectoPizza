from wtforms import Form, StringField, SubmitField, validators,IntegerField

class NewPizzaForm(Form):
    
    idpizza = StringField('IdPizza', [validators.DataRequired()], render_kw={"size" : "70", "maxlength" : "6"})
    nombre = StringField('Nombre', [validators.DataRequired()], render_kw={"size" : "70", "maxlength" : "20"})
    tamano = StringField('Tamaño', [validators.DataRequired()], render_kw={"size" : "70", "maxlength" : "15"})
    precio = IntegerField('Precio', [validators.DataRequired(), validators.NumberRange(min = 1,max = 20)], render_kw={"size" : "70", "maxlength" : "2"})
    save = SubmitField('Guardar')
    cancel = SubmitField('Cancelar')