from wtforms import Form, StringField, BooleanField, SubmitField, validators,IntegerField

class EditPizzaForm(Form):
    
    nombre = StringField('Nombre', [validators.DataRequired()], render_kw={"size" : "50", "maxlength" : "15"})
    tamano = StringField('Tamaño', [validators.DataRequired()], render_kw={"size" : "50", "maxlength" : "15"})
    precio = IntegerField ('Precio', [validators.DataRequired(), validators.NumberRange(min = 7,max = 17)], render_kw={"size" : "100", "minlength" : "2", "maxlength": "2"})
  
    save = SubmitField('Guardar')
    cancel = SubmitField('Cancelar')
    