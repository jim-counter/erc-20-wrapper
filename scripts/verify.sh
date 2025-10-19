#!/bin/bash

# Load environment variables from .env
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

# Change the contract address if needed
forge verify-contract \
    --rpc-url $CHRONOS_RPC_URL \
    --verifier blockscout \
    --verifier-url $CHRONOS_EXPLORER_URL/api \
    --evm-version london \
    --chain $CHRONOS_CHAIN_ID \
    --compiler-version 0.4.19 \
    --watch \
    --skip-is-verified-check \
    --num-of-optimizations 200 \
    $1 \
    src/WAI3.sol:WAI3

# --skip-is-verified-check bypasses the "already verified" check