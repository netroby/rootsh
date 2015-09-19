#!/bin/bash

# Specify where we will install
# the server certificate
SSL_DIR="./"

if [ -z $@ ]; then
   echo $0 "\"*.netroby.com\""
   exit 0
fi
# Set the wildcarded domain
# we want to use
DOMAIN=$1

# A blank passphrase
PASSPHRASE=""

# Set our CSR variables
SUBJ="
C=US
ST=Connecticut
O=
localityName=New York
commonName=$DOMAIN
organizationalUnitName=
emailAddress=
"

# Create our SSL directory
# in case it doesn't exist
mkdir -p "$SSL_DIR"

# Generate our Private Key, CSR and Certificate
openssl genrsa -out "$SSL_DIR/server.key" 2048
openssl req -new -subj "$(echo -n "$SUBJ" | tr "\n" "/")" -key "$SSL_DIR/server.key" -out "$SSL_DIR/server.csr" -passin pass:$PASSPHRASE
openssl x509 -req -days 3650 -in "$SSL_DIR/server.csr" -signkey "$SSL_DIR/server.key" -out "$SSL_DIR/server.crt"
