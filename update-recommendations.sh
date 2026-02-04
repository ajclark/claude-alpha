#!/bin/bash
# Stock Recommendations Update Script
# Run this daily to update recommendations

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DATA_DIR="$SCRIPT_DIR/data"
HISTORY_DIR="$DATA_DIR/history"

# Create directories if they don't exist
mkdir -p "$HISTORY_DIR"

# Archive current recommendations before update
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H-%M-%S)

if [ -f "$DATA_DIR/recommendations.json" ]; then
    cp "$DATA_DIR/recommendations.json" "$HISTORY_DIR/recommendations-$DATE-$TIME.json"
    echo "Archived previous recommendations to history/$DATE-$TIME"
fi

# Clean up history older than 30 days
find "$HISTORY_DIR" -name "*.json" -mtime +30 -delete
echo "Cleaned up history files older than 30 days"

# Run Claude AI to update recommendations
echo "Starting AI research update..."
echo "Run the following command in Claude Code:"
echo ""
echo "claude-code --prompt 'Research the following stocks and update /Users/allan/Code/stocks/data/recommendations.json with current prices, analyst targets, and buy/no-buy recommendations: NVDA, AVGO, MU, MRVL, META, AMZN, MSFT, CRWD, PANW, VST, TLN, CCJ, VRT, STX, ORCL, WDC, CEG, GEV. Ensure portfolio allocation totals 100%.'"
echo ""

# Alternative: Use curl to call Claude API directly (requires API key)
# Uncomment and configure if using API directly
# curl -X POST https://api.anthropic.com/v1/messages \
#   -H "Content-Type: application/json" \
#   -H "x-api-key: $ANTHROPIC_API_KEY" \
#   -H "anthropic-version: 2023-06-01" \
#   -d '{
#     "model": "claude-sonnet-4-20250514",
#     "max_tokens": 8192,
#     "messages": [...]
#   }'

echo ""
echo "After update, open index.html in a browser to see the dashboard"
echo "file://$SCRIPT_DIR/index.html"
