#!/bin/bash

set -euo pipefail

# Variables
DATE_STR=$(date '+%F')
DATA_PATH="/tmp/duckdb-database-${DATE_STR}.duckdb"
TMP_DIR=$(mktemp -d)
AZURE_HTML="${TMP_DIR}/azure.html"
AZURE_SQL_TEMP="queries/providers/azure.current.sql"
UA="public-cloud-bot/1.0"

echo "📥 Downloading Azure IP page..."
curl -sSL -H "User-Agent: $UA" "https://www.microsoft.com/en-US/download/details.aspx?id=56519" -o "$AZURE_HTML"

echo "🔍 Extracting Azure IP file URL..."
AZURE_URL=$(xmllint --html -xpath '//a[@data-bi-id="downloadretry"]/attribute::href' "$AZURE_HTML" 2>/dev/null | sed 's/ href="\([^"]*\)"/\1/g')

if [[ -z "$AZURE_URL" ]]; then
  echo "❌ Failed to extract Azure URL from HTML"
  exit 1
fi

echo "🔗 Azure IP URL: $AZURE_URL"

echo "📝 Populating Azure SQL file..."
sed "s|###AZURE_URL###|$AZURE_URL|" queries/providers/azure.sql > "$AZURE_SQL_TEMP"

echo "🧩 Installing httpfs extension..."
duckdb "$DATA_PATH" < queries/install_extensions.sql

echo "📦 Loading public cloud provider data..."

declare -a PROVIDERS=(
  aws
  azure.current
  cloudflare
  digitalocean
  fastly
  googlecloud
  linode
  oracle
)

# Special handling for Cloudflare since it must be downloaded first
echo "📥 Downloading Cloudflare IPs..."
curl -sSL -H "User-Agent: $UA" https://www.cloudflare.com/ips-v4 -o /tmp/cloudflare.txt

for provider in "${PROVIDERS[@]}"; do
  echo "➡️  Loading $provider..."
  duckdb "$DATA_PATH" < "queries/providers/${provider}.sql"
done

echo "🧠 Creating unified view..."
duckdb "$DATA_PATH" < queries/create_view.sql

echo "🧹 Cleaning up..."
rm -f "$AZURE_SQL_TEMP"
rm -rf "$TMP_DIR"

echo "✅ Done! DuckDB database created at $DATA_PATH"
