from wtforms import Form, StringField, SubmitField, validators

class NewPedidoForm(Form):
    
    numeropedido = StringField('NumeroPedido', [validators.DataRequired()], render_kw={"size" : "70", "maxlength" : "6"})
    cantidad = StringField('Cantidad', [validators.DataRequired()], render_kw={"size" : "70", "maxlength" : "2"})
    nombre = StringField('Nombre', [validators.DataRequired()], render_kw={"size" : "70", "maxlength" : "20"})
    tamano = StringField('Tamaño', [validators.DataRequired()], render_kw={"size" : "70", "maxlength" : "15"})
    save = SubmitField('Guardar')
    cancel = SubmitField('Cancelar')