#!/bin/bash
# Import dashboards from the /app/dashboards directory

set -e

DASHBOARD_DIR="/app/dashboards"

for DASHBOARD_FOLDER in "$DASHBOARD_DIR"/*/; do
  if [ -d "$DASHBOARD_FOLDER" ]; then
    echo "Importing dashboard directory: $DASHBOARD_FOLDER"
    superset import-directory "$DASHBOARD_FOLDER"
  else
    echo "No dashboard directories found in $DASHBOARD_DIR"
  fi
done
