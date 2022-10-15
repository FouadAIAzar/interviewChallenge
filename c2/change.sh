#!/bin/bash

echo "I'm going to overwrite PORT and BASE_URL to you .env. This will only hurt a little."
echo "Please enter a PORT value. I have no conditions to test whether it's valid, please be kind."
read PORT
echo "Please enter a BASE_URL with the following format: /name"
read BASE_URL
echo PORT=$PORT > ./.env
echo BASE_URL=$BASE_URL >> ./.env
echo ".env overwritten."
echo "Script ended."