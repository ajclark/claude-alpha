#!/bin/bash
# Claude Alpha v2 - High Alpha Stock Picker
# Simplified: Find up to 3 tickers with maximum alpha potential

cd /home/napta2k/stocks

PROMPT='You are updating Claude Alpha, a high-conviction stock picker focused on maximum alpha.

## Your Mission
Find 1-3 tickers that will generate the HIGHEST ALPHA (50%+ gains minimum) by end of year.

## Research Process

### Phase 1: Scan for Opportunities
Use web search extensively to find:
- Small/mid cap stocks with 100%+ analyst upside targets
- Stocks with strong buy consensus and massive price target gaps
- Emerging AI, biotech, energy, or tech plays with near-term catalysts
- WallStreetBets trending tickers with fundamental backing
- Recent IPOs or overlooked opportunities

Search queries to use:
- "best small cap stocks 2026 100% upside"
- "highest analyst price targets 2026"
- "stocks with 50%+ upside strong buy"
- "wallstreetbets most mentioned stocks this week"
- "breakout stocks catalyst 2026"

### Phase 2: Deep Due Diligence
For each candidate, research:
- Current price vs analyst targets (need 50%+ gap minimum)
- Buy/Hold/Sell ratings distribution
- Key catalysts in next 6-12 months
- Major risks that could derail the thesis
- WSB sentiment (treat as momentum indicator)

### Phase 3: Select Top Picks
Pick 1-3 stocks with:
- Highest conviction for 50%+ gains
- Clear catalysts
- Acceptable risk/reward

## Output Format
Update index.html with your picks (1-3 tickers). The file uses a simple ASCII table format.
Keep the HTML minimal - just update the table data and timestamp.

## After Updates
Run these commands:
```
git add .
git commit -m "Update picks $(date +%Y-%m-%d)"
git push
```

## Rules
- 1-3 tickers only (no more than 3)
- Each must have 50%+ realistic upside to analyst targets
- Be aggressive - this is an alpha-seeking portfolio
- Include specific price targets and catalyst dates
- Current date: use today'"'"'s date

Begin your research now.'

claude -p "$PROMPT" --dangerously-skip-permissions

echo "Claude Alpha update completed at $(date)" >> /tmp/claude-alpha.log
