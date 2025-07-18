import os
import urllib.parse

SECRET_KEY = 'kjSFDZ8ofIV6fbz0J9vRmzIhn+zbfmOyOKD5gC6Z2QpH7mlkq54M'

user = urllib.parse.quote_plus(os.getenv('SNOWFLAKE_USER') or '')
password = urllib.parse.quote_plus(os.getenv('SNOWFLAKE_PASSWORD') or '')
account = os.getenv('SNOWFLAKE_ACCOUNT')
database = os.getenv('SNOWFLAKE_DATABASE')

# SQLALCHEMY_DATABASE_URI = os.getenv('SUPERSET_DATABASE_URI')
