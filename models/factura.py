from table import Table

TABLE_NAME = 'Factura'
class Factura(Table):
    def __init__(self, db_name):
        super().__init__(db_name)
        self._table_name = TABLE_NAME