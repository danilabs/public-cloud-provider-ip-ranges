#!/bin/bash

set -euo pipefail

# Constants
DB_DIR="$PWD/data/db"
DATA_PATH="$DB_DIR/ip-ranges.duckdb"
SQL_FILE="queries/create_database.sql"

echo "🗃️  Creating new DuckDB database..."

# Create directory if it doesn't exist
echo "📁 Ensuring database directory exists at $DB_DIR"
mkdir -p "$DB_DIR"

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

echo "✅ Database created successfully at $DATA_PATH"
