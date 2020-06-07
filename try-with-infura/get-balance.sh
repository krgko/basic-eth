#!/bin/bash

source .env

CONTRACT=$1 # 0xBf4eD7b27F1d666546E30D74d50d173d20bca754
curl --user :$PROJECT_SECRET https://$NETWORK_NAME.infura.io/v3/$PROJECT_ID \
-X POST \
-H "Content-Type: application/json" \
-d '{"jsonrpc":"2.0","method":"eth_getBalance","params": ["'${CONTRACT}'", "latest"],"id":1}'
