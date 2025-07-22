# Superset Dashboards

This repository provides a ready-to-use, version-controlled Apache Superset dashboard deployment with Snowflake as a data source and PostgreSQL as the metadata database.

## Features
- All dashboards, charts, datasets, and database configs are versioned as YAML files.
- Snowflake credentials are never committed; users provide them via a `.env` file.
---

## Prerequisites
- [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/)
- A Snowflake account and credentials

---

## Quick Start

1. **Clone the repository:**

```bash
git clone https://github.com/saugat-maitri/superset-tuva
cd superset-tuva
```

2. **Create your `.env` file:**

Copy the sample and fill in your Snowflake credentials:

```bash
cp .env.sample .env
# Edit .env and set SNOWFLAKE_URI
```

Example `.env`:
```
SNOWFLAKE_URI=snowflake://USER:PASSWORD@ACCOUNT/DATABASE?role=ROLE&warehouse=WAREHOUSE
```

3. **Start Superset:**

```bash
docker compose up --build
```

This will build the Docker images, install dependencies, and start Superset at [http://localhost:8088](http://localhost:8088).

4. **Login:**

- Username: `admin`
- Password: `admin`

---

## How it works
- On startup, your Snowflake URI is injected into the dashboard database YAML using `envsubst`.
- All dashboards, datasets, and charts are imported automatically.
- PostgreSQL is used for Superset's metadata (users, roles, etc).

---

## Updating Dashboards
- After editing dashboards in Superset, export them as YAML and replace the corresponding files in the `dashboards/` folder.
- Commit and push your changes.
- Users can pull the latest changes and run `docker compose down && docker compose up --build` to update their dashboards.

---

## Troubleshooting
- If you see `envsubst: command not found`, ensure your Dockerfile includes `apt-get install -y gettext`.
- If you see database connection errors, check your `.env` and PostgreSQL container status.

---

## Customization
- To add more data sources, add new YAML files in the appropriate `dashboards/` subfolders.
- To change the admin password, update the `command` in `docker-compose.yml`.

---