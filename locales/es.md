# Stack de AdGuard Home de Alto Rendimiento para Homelab

[🇺🇸 English](../README.md) · [🇰🇷 한국어](ko.md) · [🇨🇳 中文](zh-CN.md) · **🇪🇸 Español** · [🇮🇳 हिन्दी](hi.md) · [🇸🇦 العربية](ar.md) · [🇧🇷 Português](pt-BR.md) · [🇷🇺 Русский](ru.md) · [🇫🇷 Français](fr.md) · [🇮🇩 Bahasa Indonesia](id.md)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](../LICENSE)
[![AdGuard Home](https://img.shields.io/badge/AdGuard%20Home-v0.107+-green.svg)](https://adguard.com/adguard-home.html)
[![HTTP/2 & HTTP/3](https://img.shields.io/badge/Protocol-HTTP%2F2%20%7C%20HTTP%2F3%20QUIC-orange.svg)]()
[![Kernel Tuning](https://img.shields.io/badge/Linux-ZRAM%20%2B%20BBR-purple.svg)]()

Configuración reforzada y de nivel de producción para ejecutar **AdGuard Home** en hipervisores multinodo (Proxmox VE, KVM, Bare Metal). Cuenta con **optimización de memoria ZRAM (zstd)**, **ajuste de búfer de socket del kernel Linux**, **soporte nativo para HTTP/2 y HTTP/3 (QUIC / DoQ)**, **proxy PAC inteligente** y **conmutación por error rápida de DNS (Failover)**.

---

## Características Principales

- **⚡ ZRAM con compresión zstd**: Unidad RAM comprimida de 1 GB con `swappiness 180` y `page-cluster 0` para eliminar cuellos de botella de E/S de disco en VM de 1 GB de RAM.
- **🚀 Ajuste del kernel de Linux**: Control de congestión TCP BBR, programador FQ y búferes UDP expandidos a 7.5 MB para absorber ráfagas masivas de DNS.
- **🔒 HTTP/2 y HTTP/3 nativos (QUIC / DoQ)**: Panel web en puerto 443 con HTTP/2; DNS-over-QUIC (DoQ) y DNS-over-TLS (DoT) en puerto 853.
- **🛡️ Certificado SSL SAN de 20 años**: Sin dependencias externas ni renovaciones de 90 días; funciona de forma permanente en redes aisladas.
- **🔄 Redirección transparente del puerto 80**: Regla NAT de iptables persistente para acceder directamente a través de `http://<IP>` sin escribir `:3000`.
- **🌐 Evasión de DPI con PAC inteligente**: Proxy SOCKS5 ByeDPI integrado y servidor PAC ligero en Python.
- **🏛️ Diseño de nodos independientes**: Cada host físico opera de forma autónoma con conmutación por error en 1 segundo hacia DNS público en caso de fallo.

---

## Inicio Rápido

```bash
git clone https://github.com/KS-GG-AI/adguardhome-homelab-stack.git
cd adguardhome-homelab-stack/scripts
chmod +x setup-node.sh generate-self-signed-cert.sh verify-health.sh

# Ejecutar instalación automática (especifique la IP del nodo)
sudo ./setup-node.sh 10.0.1.2

# Verificar estado y protocolos
sudo ./verify-health.sh 10.0.1.2
```

---

## Licencia

Distribuido bajo la [Licencia MIT](../LICENSE).
