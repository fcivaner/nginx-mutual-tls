#!/usr/bin/env bash

# directory
rm -r certificates/fake-*
cd certificates || exit

# generate fake certificate authority
openssl req \
-new \
-x509 \
-days 365 \
-keyout fake-ca-key.pem \
-out fake-ca-crt.pem \
-subj "/C=GB/ST=London/L=London/O=CertAuthority/OU=IT Department/CN=authority.com" \
-passout file:../passphrase.txt

# generate fake server key
openssl genrsa -out fake-server-key.pem 4096

# generate certificate request for the fake server
openssl req \
-new \
-sha256 \
-key fake-server-key.pem \
-out fake-server-csr.pem \
-subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=server.com" \
-passout file:../passphrase.txt

# sign certificate request of the fake server
openssl x509 \
-req \
-days 365 \
-in fake-server-csr.pem \
-CA fake-ca-crt.pem \
-CAkey fake-ca-key.pem \
-CAcreateserial \
-out fake-server-crt.pem \
-passin file:../passphrase.txt

# generate fake client's key
openssl genrsa -out fake-client-key.pem 4096

# generate certificate request for fake client
openssl req \
-new \
-sha256 \
-key fake-client-key.pem \
-out fake-client-csr.pem \
-subj "/C=GB/ST=London/L=London/O=clienta/OU=IT Department/CN=clienta.com" \
-passout file:../passphrase.txt

# sign certificate request for fake client
openssl x509 \
-req \
-days 365 \
-in fake-client-csr.pem \
-CA fake-ca-crt.pem \
-CAkey fake-ca-key.pem \
-CAcreateserial \
-out fake-client-crt.pem \
-passin file:../passphrase.txt
