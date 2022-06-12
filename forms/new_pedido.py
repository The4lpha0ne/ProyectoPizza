from wtforms import Form, StringField, SubmitField, validators,IntegerField

class NewPedidoForm(Form):
    
    numeropedido = IntegerField('NumeroPedido', [validators.DataRequired(), validators.NumberRange(min = 1,max = 99999)], render_kw={"size" : "70", "maxlength" : "6"})
    cantidad = IntegerField('Cantidad', [validators.DataRequired(),validators.NumberRange(min = 1,max = 20)], render_kw={"size" : "70", "maxlength" : "2"})
    nombre = StringField('Nombre', [validators.DataRequired()], render_kw={"size" : "70", "maxlength" : "20"})
    tamano = StringField('Tamaño', [validators.DataRequired()], render_kw={"size" : "70", "maxlength" : "15"})
    save = SubmitField('Guardar')
    cancel = SubmitField('Cancelar')