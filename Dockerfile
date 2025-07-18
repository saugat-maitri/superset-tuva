FROM apache/superset:latest

USER root
RUN pip install snowflake-sqlalchemy pyyaml psycopg2-binary
USER superset