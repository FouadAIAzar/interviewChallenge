#!/bin/bash

echo "I'm adding .env to your environment. This won't hurt at all."
source ./.env
export PORT=4444
export BASE_URL="/port"
printenv
echo "Script ended."
$@