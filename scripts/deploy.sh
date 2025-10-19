#!/bin/bash

# Load environment variables from .env
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

forge create src/WAI3.sol:WAI3 \
    --rpc-url $CHRONOS_RPC_URL \
    --private-key $PRIVATE_KEY \
    --evm-version london \
    --broadcast
