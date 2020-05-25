#!/usr/bin/env bash

SCRIPT_PATH="$(dirname "$(realpath -s "${BASH_SOURCE[0]}")")"
BASE_DIR=$(dirname "$SCRIPT_PATH")

docker run \
    -p 444:444 \
    -v "$BASE_DIR/config/nginx.conf:/etc/nginx/nginx.conf:ro" \
    -v "$BASE_DIR/certificates:/certificates" \
    nginx
