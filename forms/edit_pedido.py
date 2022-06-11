from wtforms import Form, StringField, SubmitField, validators

class EditPedidoForm(Form):
    
    cantidad = StringField('Cantidad', [validators.DataRequired()], render_kw={"size" : "50", "maxlength" : "2"})
    nombre = StringField ('Nombre', [validators.DataRequired()], render_kw={"size" : "50", "minlength" : "3", "maxlength": "15"})
    tamano = StringField('Tamaño', [validators.DataRequired()], render_kw={"size" : "50", "maxlength" : "12"})
  
    save = SubmitField('Guardar')
    