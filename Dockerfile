FROM apache/superset:latest

USER root

# Install required packages and Python dependencies
RUN apt-get update && apt-get install -y gettext \
    && pip install snowflake-sqlalchemy pyyaml psycopg2-binary

COPY . /app
COPY superset_config.py /app/pythonpath/superset_config.py

RUN chown -R superset:superset /app/dashboards

USER superset