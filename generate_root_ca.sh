#!/bin/bash

set -euxo pipefail

OPENSSL=$(brew --prefix openssl)/bin/openssl

# https://www.openssl.org/docs/man3.0/man1/


$OPENSSL version

# https://www.openssl.org/docs/man3.0/man1/openssl-genrsa.html
# since we didn't specify -des3 , etc the private key won't be encrypted
$OPENSSL genrsa  -out rootca_privkey.pem  2048


# https://www.openssl.org/docs/man3.0/man1/openssl-req.html
$OPENSSL \
  req \
  -x509 \
  -new \
  -addext basicConstraints=critical,CA:TRUE,pathlen:0 \
  -addext keyUsage=critical,keyCertSign,cRLSign \
  -outform pem \
  -out rootca_cert.pem \
  -key rootca_privkey.pem \
  -days 365 \
  -subj "/O=MyCA"
