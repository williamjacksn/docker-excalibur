import os

from excalibur import configuration as conf
from excalibur import settings
from excalibur.utils.database import initialize_database
from excalibur.www.app import create_app
from waitress import serve

# based on the code for `excalibur webserver`
# at https://github.com/camelot-dev/excalibur/blob/v0.4.3/excalibur/cli.py#L48-L51

if conf.USING_SQLITE:
    sqlite_path = settings.SQL_ALCHEMY_CONN.replace('sqlite:///', '')
    if not os.path.isfile(sqlite_path):
        initialize_database()

app = create_app(conf)

host = os.getenv('HOST', '0.0.0.0')
port = os.getenv('PORT', 8080)

serve(app, host=host, port=port, ident=None)
