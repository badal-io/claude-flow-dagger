#!/bin/bash -x

echo "running $0 $@"
export ANTHROPIC_AUTH_TOKEN="any-key-will-do"
export ANTHROPIC_BASE_URL="http://127.0.0.1:3456"

env

echo "starting Claude-code-router"
ccr start &

#tmux -T 256 
#prompt="$(cat /workspace/prompt)"
#claude-flow hive-mind spawn "$prompt" --output-format stream-json --no-interactive --headless --verbose --claude
#claude-flow init --force
#claude-flow hive-mind init --force

npm install -g @liamhelmer/claude-flow-ui

env npx @liamhelmer/claude-flow-ui

ccr stop
exit 0

#echo "Starting Orchestrator and MCP"
#sleep 5s
#claude-flow start --headless &
#
#echo "Executing Claude-Flow"
#sleep 5s
#
#claude-flow sparc "$(cat /workspace/prompt)"
