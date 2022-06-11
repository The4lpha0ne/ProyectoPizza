from wtforms import Form, StringField, SubmitField, validators

class NewPizzaForm(Form):
    
    idpizza = StringField('IdPizza', [validators.DataRequired()], render_kw={"size" : "70", "maxlength" : "100"})
    nombre = StringField('Nombre', [validators.DataRequired()], render_kw={"size" : "70", "maxlength" : "100"})
    tamano = StringField('Tamaño', [validators.DataRequired()], render_kw={"size" : "70", "maxlength" : "100"})
    precio = StringField('Precio', [validators.DataRequired()], render_kw={"size" : "70", "maxlength" : "100"})
    save = SubmitField('Guardar')
    cancel = SubmitField('Cancelar')