#!/usr/bin/env bash
# ====================================================================
# Automated Setup Script for High-Performance AdGuard Home Node
# ====================================================================

set -euo pipefail

NODE_IP="${1:-10.0.1.2}"

echo "=================================================="
echo " Starting AdGuard Home Node Optimization Setup"
echo " Target Node IP: ${NODE_IP}"
echo "=================================================="

export DEBIAN_FRONTEND=noninteractive

echo ">>> [1/6] Installing dependencies..."
apt-get update -qq
apt-get install -y -qq systemd-zram-generator iptables-persistent openssl curl jq

echo ">>> [2/6] Configuring ZRAM (1GB zstd compressed swap)..."
cp ../configs/systemd/zram-generator.conf /etc/systemd/zram-generator.conf
systemctl daemon-reload
systemctl restart systemd-zram-setup@zram0.service 2>/dev/null || systemctl start /dev/zram0 || true

echo ">>> [3/6] Applying Kernel & Sysctl tuning..."
cp ../configs/sysctl.d/99-adhome-tuning.conf /etc/sysctl.d/99-adhome-tuning.conf
sysctl --system > /dev/null

echo ">>> [4/6] Configuring Port 80 -> 3000 Redirect..."
cp ../configs/iptables/rules.v4 /etc/iptables/rules.v4
iptables-restore < /etc/iptables/rules.v4
systemctl enable --now netfilter-persistent

echo ">>> [5/6] Generating 20-Year TLS Certificate..."
chmod +x ./generate-self-signed-cert.sh
./generate-self-signed-cert.sh "${NODE_IP}"

echo ">>> [6/6] Enabling SSD Trim timer and Timezone (Asia/Seoul)..."
systemctl enable --now fstrim.timer
timedatectl set-timezone Asia/Seoul || true

echo "=================================================="
echo " Node setup completed successfully!"
echo " Web UI available at: https://${NODE_IP} (HTTP/2)"
echo " QUIC / DoQ active on: port 853 UDP (HTTP/3)"
echo "=================================================="
