# Mutual TLS configuration for NGINX

These configuration scripts are created as a test implementation to demonstrate an example Mutual TLS configuration for NGINX.

Mutual TLS means the both sides of the connection will check if each other's keys and certificates are coherent before establishing a connection. This means the server will also make sure that a client is authentic, compared to a regular TLS connection, in which only the party that is initiating the connection performs this check. This adds an extra layer of security for the server side.

An example use case for mutual TLS is middleware servers communicating with each other. As no unknown third party is expected to initiate a connection, these servers can be configured to communicate securely using mutual TLS.

This repository includes;

- Sample NGINX configuration
- A script for generating TLS certificates and keys for;
  - Certificate authority,
  - Server,
  - Two example clients.
- A script to run a sample NGINX container using docker on the local computer,
- Scripts to test client requests using curl.

## Usage

1. Generate certificates using the scripts. The process should complete without any prompt.

   `bash test/generate-cert-and-keys.sh`
   `bash test/generate-fake-cert-and-key.sh`

2. Start NGINX (Port 444 should be unused)

   `bash test/start-nginx.sh`

3. Modify your /etc/hosts file to include the following line;

   `127.0.0.1 server.com`

   redirecting server.com domain name to 127.0.0.1 on your local computer.

4. Run `bash test/test-with-\*` scripts to demonstrate the mutual TLS connection is correctly established with clienta and clientb certificates and rejected in the absence of a client certificate.
