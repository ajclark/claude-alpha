#!/bin/bash
# Claude Alpha Daily Update Script
# Runs fully autonomous stock research with sub-agents

cd /Users/allan/Code/stocks

PROMPT='You are updating Claude Alpha, an AI stock recommendations dashboard.

## Your Mission
Research and update stock recommendations for AI, tech, energy, and semiconductor sectors. You have full autonomy to:
1. Keep, remove, or add new tickers based on your research
2. Adjust allocations (must total 100%)
3. Change buy/no-buy signals based on current data

## Research Process

### Phase 1: Market Scan
Use web search to identify:
- Top performing AI/tech stocks in the past month
- New IPOs or emerging companies worth watching
- Any major news affecting current holdings
- Analyst rating changes

### Phase 2: Deep Research (Use Sub-Agents)
For EACH ticker (existing and new candidates), spawn a separate sub-agent to research:
- Current price and 52-week range
- Analyst consensus rating and price targets
- Recent earnings and guidance
- Key catalysts and risks
- Valuation metrics (P/E, P/S, PEG)

Run these sub-agents IN PARALLEL for efficiency.

### Phase 3: Portfolio Construction
Based on research, construct a portfolio:
- BUY: Strong conviction, good risk/reward
- NO BUY: Poor entry point, high risk, or better alternatives
- Allocations must total exactly 100%
- Weight by conviction (higher conviction = higher allocation)
- Diversify across categories: AI Infrastructure, Big Tech, Energy, Cybersecurity, Storage

## Current Categories to Cover
1. AI Infrastructure (chips, custom silicon, memory)
2. Big Tech AI (cloud, platforms, advertising)
3. AI Energy (nuclear, uranium, data center power)
4. Cybersecurity (endpoint, network, identity)
5. AI Storage (HDD, SSD, memory)

## Files to Update

1. **data/recommendations.json** - Update the full JSON with:
   - metadata.lastUpdated (ISO timestamp)
   - summary stats
   - All recommendations with current data

2. **index.html** - Update the embedded currentData object (search for "const currentData = {") with the same data

## After Updates
Run these commands:
```
git add .
git commit -m "Update recommendations $(date +%Y-%m-%d)"
git push
```

## Important Rules
- Be aggressive about removing underperformers or overvalued stocks
- Be aggressive about adding new opportunities you discover
- Always include specific price targets and upside percentages
- Keep justifications concise but specific (mention key metrics)
- Risks should be real concerns, not generic warnings
- Current date for research: use today'"'"'s date

Begin your research now. Use sub-agents extensively for parallel deep dives.'

claude -p "$PROMPT" --dangerously-skip-permissions

echo "Claude Alpha update completed at $(date)" >> /tmp/claude-alpha.log
