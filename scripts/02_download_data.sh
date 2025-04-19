#!/bin/bash

set -euo pipefail

# Variables
DATA_PATH="/tmp/duckdb-database.duckdb"
TMP_DIR=$(mktemp -d)
AZURE_HTML="${TMP_DIR}/azure.html"
AZURE_SQL_TEMP="queries/providers/azure.current.sql"
UA="public-cloud-bot/1.0"

echo "📥 Downloading Azure IP page..."
curl -sSL -H "User-Agent: $UA" "https://www.microsoft.com/en-US/download/details.aspx?id=56519" -o "$AZURE_HTML"

echo "🔍 Extracting Azure IP file URL..."
AZURE_URL=$(xmllint --html -xpath "//html/body/div[3]/div/div[2]/main/div/div[1]/div/div/div/section[3]/div/div/div/div/div/a/@href" "$AZURE_HTML" 2>/dev/null | sed 's/ href="\([^"]*\)"/\1\n/g')

if [[ -z "$AZURE_URL" ]]; then
  echo "❌ Failed to extract Azure URL from HTML"
  exit 1
fi

echo "🔗 Azure IP URL: $AZURE_URL"

echo "📝 Populating Azure SQL file..."
sed "s|###AZURE_URL###|$AZURE_URL|" queries/providers/azure.sql > "$AZURE_SQL_TEMP"

# Special handling for Cloudflare since it must be downloaded first
echo "📥 Downloading Cloudflare IPs..."
curl -sSL -H "User-Agent: $UA" https://www.cloudflare.com/ips-v4 -o /tmp/cloudflare_ips.txt

# Special handling for Vultr since it must be downloaded first
# echo "📥 Downloading Vultr IPs..."
# curl -sSL -H "User-Agent: $UA" 'https://geofeed.constant.com/?text' -o /tmp/vultr_ips.txt

echo "📥 Moving Vultr IPs..."
cp data/vultr_ips.txt /tmp/vultr_ips.txt

# Downloading for Vercel
echo "📥 Moving Vercel IPs..."
cp data/vercel_ips.txt /tmp/vercel_ips.txt

# Downloading for IBM
echo "📥 Moving IBM IPs..."
cp data/ibm_ips.txt /tmp/ibm_ips.txt

# Downloading for Clevercloud
echo "📥 Moving Clever Cloud IPs..."
cp data/clevercloud_ips.txt /tmp/clevercloud_ips.txt

# Downloading for Outscale
echo "📥 Moving Outscale IPs..."
cp data/outscale_ips.txt /tmp/outscale_ips.txt

# Downloading for WP Engine
echo "📥 Moving WP Engine IPs..."
cp data/wpengine_ips.txt /tmp/wpengine_ips.txt

# Remove any existing database
if [[ -f "$DATA_PATH" ]]; then
  echo "🧹 Removing existing database at $DATA_PATH"
  rm -f "$DATA_PATH"
fi

echo "🧩 Installing httpfs extension..."
duckdb "$DATA_PATH" < queries/install_extensions.sql

echo "📦 Loading public cloud provider data..."

declare -a PROVIDERS=(
  aws
  azure.current
  clevercloud
  cloudflare
  digitalocean
  fastly
  googlecloud
  ibm
  linode
  oracle
  outscale
  vercel
  vultr
  wpengine
)

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
