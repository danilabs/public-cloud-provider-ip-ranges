#!/bin/bash

set -euo pipefail

# Variables
DATE_STR=$(date '+%F')
DATA_PATH="/tmp/duckdb-database-${DATE_STR}.duckdb"
EXPORT_QUERY="queries/export_provider_data.sql"

echo "📤 Starting export of provider data..."
echo "📁 Using DuckDB file: $DATA_PATH"

# Check if the database file exists
if [[ ! -f "$DATA_PATH" ]]; then
  echo "❌ DuckDB database not found at $DATA_PATH"
  exit 1
fi

# Check if export SQL file exists
if [[ ! -f "$EXPORT_QUERY" ]]; then
  echo "❌ Export SQL file not found: $EXPORT_QUERY"
  exit 1
fi

# Run the export
echo "📄 Running export SQL script: $EXPORT_QUERY"
duckdb "$DATA_PATH" < "$EXPORT_QUERY"

echo "✅ Export completed successfully!"
