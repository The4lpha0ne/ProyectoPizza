from table import Table

TABLE_NAME = 'Pizza'
class Pizza(Table):
    def __init__(self, db_name):
        super().__init__(db_name)
        self._table_name = TABLE_NAME