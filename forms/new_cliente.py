from wtforms import Form, StringField, SubmitField, validators,IntegerField
from wtforms_alchemy import PhoneNumberField

class NewClienteForm(Form):
    
    telefono = PhoneNumberField('Telefono', [validators.DataRequired()], render_kw={"size" : "70", "minlength":"9","maxlength" : "9"})
    nombre = StringField('Nombre', [validators.DataRequired()], render_kw={"size" : "70", "minlength":"3","maxlength" : "15"})
    direccion = StringField('Dirección', [validators.DataRequired()], render_kw={"size" : "70", "maxlength" : "30"})
    c_postal = IntegerField('Código Postal', [validators.DataRequired(),validators.NumberRange(min = 10000,max = 99999)], render_kw={"size" : "70","minlength": "5","maxlength" : "5"})
    numeropedido =  IntegerField('Numero de pedido', [validators.DataRequired(), validators.NumberRange(min = 1,max = 99000)], render_kw={"size" : "70", "maxlength" : "6"})
    save = SubmitField('Guardar')

