#!/usr/bin/env bash

SCRIPT_PATH="$(dirname "$(realpath -s "${BASH_SOURCE[0]}")")"
CERT_DIR=$(dirname "$SCRIPT_PATH")/certificates

curl -v \
     --cacert "$CERT_DIR/ca-crt.pem" \
     --key "$CERT_DIR/clientb-key.pem" \
     --cert "$CERT_DIR/clientb-crt.pem" \
     https://server.com:444
