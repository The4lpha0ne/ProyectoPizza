from sqlalchemy import Integer
from wtforms import Form, StringField, SubmitField, validators,IntegerField

class EditPedidoForm(Form):
    
    cantidad = IntegerField('Cantidad', [validators.DataRequired(), validators.NumberRange(min = 1,max = 20)], render_kw={"size" : "50", "maxlength" : "2"})
    nombre = StringField ('Nombre', [validators.DataRequired()], render_kw={"size" : "50", "minlength" : "3", "maxlength": "15"})
    tamano = StringField('Tamaño', [validators.DataRequired()], render_kw={"size" : "50", "maxlength" : "12"})
  
    save = SubmitField('Guardar')
    