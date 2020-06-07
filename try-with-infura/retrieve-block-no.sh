#!/bin/bash

source .env

curl --user :$PROJECT_SECRET https://$NETWORK_NAME.infura.io/v3/$PROJECT_ID \
-X POST \
-H "Content-Type: application/json" \
-d '{"jsonrpc":"2.0","method":"eth_blockNumber","params": [],"id":1}'
