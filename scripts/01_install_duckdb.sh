#!/bin/bash

set -euo pipefail

# Variables
TMP_DIR=$(mktemp -d)
INSTALL_DIR="/usr/local/bin"
CLI_NAME="duckdb"
PLATFORM="linux-amd64"

echo "🔍 Fetching latest DuckDB CLI release info..."
LATEST_URL=$(curl -s https://api.github.com/repos/duckdb/duckdb/releases/latest |
  jq -r '.assets[] | select(.name | test("duckdb_cli-linux-amd64\\.zip")) | .browser_download_url')

if [[ -z "$LATEST_URL" ]]; then
  echo "❌ Could not find latest DuckDB CLI release for $PLATFORM."
  exit 1
fi

ZIP_NAME="${CLI_NAME}_cli-${PLATFORM}.zip"
ZIP_PATH="$TMP_DIR/$ZIP_NAME"

echo "⬇️  Downloading DuckDB CLI from: $LATEST_URL"
curl -L "$LATEST_URL" -o "$ZIP_PATH"

echo "📦 Unzipping to $INSTALL_DIR"
sudo unzip -o "$ZIP_PATH" -d "$INSTALL_DIR"

echo "🧹 Cleaning up"
rm -rf "$TMP_DIR"

echo "✅ DuckDB CLI installed at: $(which duckdb)"
