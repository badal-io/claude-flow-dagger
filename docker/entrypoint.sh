#!/bin/bash -x

echo "running $0 $@"
export ANTHROPIC_AUTH_TOKEN="any-key-will-do"
export ANTHROPIC_BASE_URL="http://127.0.0.1:3456"

if [[ "$DEBUG_CONTAINER" == "true" ]] ; then
  env
fi

echo "starting Claude-code-router"
ccr start &

#tmux -T 256

npm install -g @liamhelmer/claude-flow-ui

env npx @liamhelmer/claude-flow-ui "$@"

ccr stop
exit 0
