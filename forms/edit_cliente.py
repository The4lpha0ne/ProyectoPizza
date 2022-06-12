from wtforms import Form, StringField,SubmitField, validators,IntegerField

class EditClienteForm(Form):
    
    telefono = IntegerField('Telefono', [validators.DataRequired(), validators.NumberRange(min = 600000000,max = 699999999)], render_kw={"size" : "50","minlength":"9","maxlength" : "9"})
    nombre = StringField('Nombre', [validators.DataRequired()], render_kw={"size" : "50", "maxlength" : "20"})
    direccion = StringField ('Dirección', [validators.DataRequired()], render_kw={"size" : "50", "maxlength" : "50"})
    c_postal = IntegerField ('Código Postal',[validators.DataRequired(), validators.NumberRange(min = 10000,max = 99999)], render_kw={"size" : "50", "minlength": "5", "maxlength" : "5"})

    save = SubmitField('Guardar')
    