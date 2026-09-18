#!/usr/bin/env bash
# ====================================================================
# Health Check & Verification Script for AdGuard Home Node
# ====================================================================

set -euo pipefail

NODE_IP="${1:-10.0.1.2}"

echo "=== [1] Checking ZRAM Status ==="
zramctl || echo "Warning: zramctl failed"

echo -e "\n=== [2] Checking Active Swap ==="
cat /proc/swaps

echo -e "\n=== [3] Checking Sysctl Tuning ==="
sysctl net.ipv4.tcp_congestion_control vm.swappiness vm.page-cluster net.core.rmem_max

echo -e "\n=== [4] Checking TLS & QUIC Ports ==="
ss -tulpn | grep -E ":443|:853" || echo "Warning: TLS ports not active"

echo -e "\n=== [5] Testing HTTP/2 Response ==="
curl -k -s -I --http2 "https://${NODE_IP}/" | head -n 5 || echo "Warning: HTTPS request failed"

echo -e "\n=== [6] Testing Local DNS Resolution ==="
dig @127.0.0.1 google.com +short || echo "Warning: DNS query failed"

echo -e "\nAll checks completed!"
