#!/usr/bin/env bash
# Exporta workflows via API do n8n.
# Uso: ./scripts/export-flows.sh [diretorio]
set -euo pipefail

N8N_HOST="${N8N_HOST:-http://localhost:5678}"
OUT_DIR="${1:-flows}"

mkdir -p "$OUT_DIR"

echo "[i] Listando workflows em $N8N_HOST ..."
WORKFLOWS_JSON=$(curl -s "$N8N_HOST/rest/workflows")

echo "$WORKFLOWS_JSON" | jq -c '.data[]' | while read -r wf; do
  ID=$(echo "$wf" | jq -r '.id')
  NAME=$(echo "$wf" | jq -r '.name' | tr ' ' '-' | tr '[:upper:]' '[:lower:]')
  FILE="$OUT_DIR/$(printf "%03d" "$ID")-$NAME.json"
  echo "[i] Exportando workflow $ID -> $FILE"
  echo "$wf" | jq '.' > "$FILE"
done

echo "[OK] Concluído."