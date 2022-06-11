from wtforms import Form, StringField, BooleanField, SubmitField, validators,IntegerField

class EditClienteForm(Form):
    
    telefono = IntegerField('Telefono', [validators.DataRequired()], render_kw={"size" : "50","minlength":"9","maxlength" : "9"})
    nombre = StringField('Nombre', [validators.DataRequired()], render_kw={"size" : "50", "maxlength" : "20"})
    direccion = StringField ('Dirección', [validators.DataRequired()], render_kw={"size" : "50", "maxlength" : "50"})
    c_postal = IntegerField ('Código Postal', [validators.DataRequired()], render_kw={"size" : "50", "minlength": "5", "maxlength" : "5"})

    save = SubmitField('Guardar')
    