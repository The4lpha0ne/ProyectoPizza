from wtforms import Form, StringField, SubmitField, validators,DateField,IntegerField

class NewFacturaForm(Form):
    
    idfactura = IntegerField('IdFactura', [validators.DataRequired(), validators.NumberRange(min = 1,max = 10000)], render_kw={"size" : "70", "maxlength" : "2"})
    fecha = StringField('Fecha',[validators.DataRequired()],render_kw={"size" : "70", "maxlength" : "25"})
    numeropedido = IntegerField('NumeroPedido', [validators.DataRequired(), validators.NumberRange(min = 1,max = 10000)], render_kw={"size" : "70", "maxlength" : "20"})
    save = SubmitField('Guardar')
