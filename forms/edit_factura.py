from wtforms import Form, StringField, BooleanField, SubmitField, validators,IntegerField,DateField

class EditFacturaForm(Form):
    
    fecha = StringField('Fecha', [validators.DataRequired()],render_kw={"size" : "50", "maxlength" : "20"})
    numeropedido = IntegerField('NumeroPedido', [validators.DataRequired(), validators.NumberRange(min=1000, max = 99999)], render_kw={"size" : "50", "maxlength" : "20"})
    save = SubmitField('Guardar')