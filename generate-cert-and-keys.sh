#!/usr/bin/env bash

# directory
rm -r certificates
mkdir certificates
cd certificates || exit

# generate certificate authority
openssl req \
-new -x509 \
-days 365 \
-keyout ca-key.pem \
-out ca-crt.pem \
-subj "/C=GB/ST=London/L=London/O=CertAuthority/OU=IT Department/CN=authority.com" \
-passout file:../passphrase.txt

# generate server key
openssl genrsa -out server-key.pem 4096

# generate certificate request for the server
openssl req \
-new -sha256 \
-key server-key.pem \
-out server-csr.pem \
-subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=server.com" \
-passout file:../passphrase.txt

# sign certificate request of the server
openssl x509 \
-req \
-days 365 \
-in server-csr.pem \
-CA ca-crt.pem \
-CAkey ca-key.pem \
-CAcreateserial \
-out server-crt.pem \
-passin file:../passphrase.txt

# generate client a's key
openssl genrsa -out clienta-key.pem 4096

# generate certificate request for client a
openssl req \
-new -sha256 \
-key clienta-key.pem \
-out clienta-csr.pem \
-subj "/C=GB/ST=London/L=London/O=clienta/OU=IT Department/CN=clienta.com" \
-passout file:../passphrase.txt

# sign certificate request of client a
openssl x509 \
-req \
-days 365 \
-in clienta-csr.pem \
-CA ca-crt.pem \
-CAkey ca-key.pem \
-CAcreateserial \
-out clienta-crt.pem \
-passin file:../passphrase.txt

# generate client b's key
openssl genrsa -out clientb-key.pem 4096

# generate certificate request for client b
openssl req \
-new -sha256 \
-key clientb-key.pem \
-out clientb-csr.pem \
-subj "/C=GB/ST=London/L=London/O=clientb/OU=IT Department/CN=clientb.com" \
-passout file:../passphrase.txt

# sign certificate request of client b
openssl x509 \
-req \
-days 365 \
-in clientb-csr.pem \
-CA ca-crt.pem \
-CAkey ca-key.pem \
-CAcreateserial \
-out clientb-crt.pem \
-passin file:../passphrase.txt
