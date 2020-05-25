#!/usr/bin/env bash

SCRIPT_PATH="$(dirname "$(realpath -s "${BASH_SOURCE[0]}")")"
CERT_DIR=$(dirname "$SCRIPT_PATH")/certificates

curl -v \
     --cacert "$CERT_DIR/fake-ca-crt.pem" \
     --key "$CERT_DIR/fake-client-key.pem" \
     --cert "$CERT_DIR/fake-client-crt.pem" \
     https://server.com:444
