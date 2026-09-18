# Stack AdGuard Home Haute Performance pour Homelab

[🇺🇸 English](../README.md) · [🇰🇷 한국어](ko.md) · [🇨🇳 中文](zh-CN.md) · [🇪🇸 Español](es.md) · [🇮🇳 हिन्दी](hi.md) · [🇸🇦 العربية](ar.md) · [🇧🇷 Português](pt-BR.md) · [🇷🇺 Русский](ru.md) · **🇫🇷 Français** · [🇮🇩 Bahasa Indonesia](id.md)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](../LICENSE)
[![AdGuard Home](https://img.shields.io/badge/AdGuard%20Home-v0.107+-green.svg)](https://adguard.com/adguard-home.html)
[![HTTP/2 & HTTP/3](https://img.shields.io/badge/Protocol-HTTP%2F2%20%7C%20HTTP%2F3%20QUIC-orange.svg)]()
[![Kernel Tuning](https://img.shields.io/badge/Linux-ZRAM%20%2B%20BBR-purple.svg)]()

Configuration renforcée et prête pour la production pour faire tourner **AdGuard Home** sur des hyperviseurs multi-nœuds (Proxmox VE, KVM, Bare Metal). Comprend **l'optimisation de la mémoire ZRAM (zstd)**, **le réglage des tampons de socket du noyau Linux**, **la prise en charge native de HTTP/2 et HTTP/3 (QUIC / DoQ)**, **le proxy PAC intelligent** et **le basculement rapide DNS (Failover)**.

---

## Caractéristiques Principales

- **⚡ ZRAM avec compression zstd**: Disque RAM compressé de 1 Go avec `swappiness 180` et `page-cluster 0` pour éliminer les goulots d'étranglement E/S sur les VM avec 1 Go de RAM.
- **🚀 Réglage du noyau Linux**: Contrôle de congestion TCP BBR, ordonnanceur FQ et tampons UDP étendus à 7.5 Mo pour absorber les rafales massives de requêtes DNS.
- **🔒 HTTP/2 et HTTP/3 natifs (QUIC / DoQ)**: Tableau de bord servi en HTTP/2 sur le port 443 ; DNS-over-QUIC (DoQ) et DNS-over-TLS (DoT) actifs sur le port 853.
- **🛡️ Certificat SSL SAN de 20 ans**: Fonctionne en permanence sur un réseau isolé sans dépendance de domaine externe ni renouvellement tous les 90 jours.
- **🔄 Redirection transparente du port 80**: Accès direct via `http://<IP>` sans devoir spécifier le port `:3000`.
- **🌐 Contournement DPI avec PAC intelligent**: Proxy SOCKS5 ByeDPI intégré et serveur PAC léger en Python.

---

## Démarrage Rapide

```bash
git clone https://github.com/KS-GG-AI/adguardhome-homelab-stack.git
cd adguardhome-homelab-stack/scripts
chmod +x setup-node.sh generate-self-signed-cert.sh verify-health.sh

# Lancer l'installation automatisée (spécifiez l'IP de votre nœud)
sudo ./setup-node.sh 10.0.1.2

# Vérifier la santé du système
sudo ./verify-health.sh 10.0.1.2
```

---

## Licence

Distribué sous la [Licence MIT](../LICENSE).
