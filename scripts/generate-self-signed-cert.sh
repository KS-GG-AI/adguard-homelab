#!/usr/bin/env bash
# ====================================================================
# Generate a 20-Year (7300 Days) Self-Signed Certificate with SAN
# Supports IP SAN, Localhost, and custom hostnames for HTTP/2 & HTTP/3
# ====================================================================

set -euo pipefail

NODE_IP="${1:-10.0.1.2}"
CERT_DIR="/opt/AdGuardHome/ssl"

echo ">>> Generating 20-year SSL certificate for IP: ${NODE_IP}"
mkdir -p "${CERT_DIR}"

cat << EOF > "${CERT_DIR}/openssl.cnf"
[req]
default_bits = 2048
prompt = no
default_md = sha256
distinguished_name = dn
x509_extensions = v3_req

[dn]
C = KR
ST = Seoul
L = Seoul
O = AdGuardHome Local
OU = Homelab
CN = ${NODE_IP}

[v3_req]
subjectAltName = @alt_names
basicConstraints = CA:TRUE
keyUsage = digitalSignature, keyEncipherment, keyCertSign
extendedKeyUsage = serverAuth, clientAuth

[alt_names]
IP.1 = ${NODE_IP}
IP.2 = 127.0.0.1
DNS.1 = adhome.local
DNS.2 = Adguard-Home
DNS.3 = localhost
EOF

openssl req -x509 -nodes -days 7300 -newkey rsa:2048 \
  -config "${CERT_DIR}/openssl.cnf" \
  -extensions v3_req \
  -keyout "${CERT_DIR}/adhome.key" \
  -out "${CERT_DIR}/adhome.crt"

chmod 600 "${CERT_DIR}/adhome.key"
chmod 644 "${CERT_DIR}/adhome.crt"

echo ">>> Certificate generated successfully at ${CERT_DIR}/adhome.crt (Valid for 20 years)"
