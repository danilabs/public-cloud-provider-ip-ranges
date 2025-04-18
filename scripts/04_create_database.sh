#!/bin/bash

set -euo pipefail

# Constants
DATA_PATH="/tmp/duckdb-database.duckdb"
SQL_FILE="queries/create_database.sql"

echo "🗃️  Creating new DuckDB database..."

# Remove any existing database
if [[ -f "$DATA_PATH" ]]; then
  echo "🧹 Removing existing database at $DATA_PATH"
  rm -f "$DATA_PATH"
fi

# Check if SQL file exists
if [[ ! -f "$SQL_FILE" ]]; then
  echo "❌ SQL file not found: $SQL_FILE"
  exit 1
fi

# Run the SQL script to create the database
echo "🏗️  Initializing database schema from $SQL_FILE"
duckdb "$DATA_PATH" < "$SQL_FILE"
cp $DATA_PATH $PWD/data/db/

echo "✅ Database created successfully at $DATA_PATH"
