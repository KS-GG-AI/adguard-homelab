# Stack de Alto Desempenho AdGuard Home para Homelab

[🇺🇸 English](../README.md) · [🇰🇷 한국어](ko.md) · [🇨🇳 中文](zh-CN.md) · [🇪🇸 Español](es.md) · [🇮🇳 हिन्दी](hi.md) · [🇸🇦 العربية](ar.md) · **🇧🇷 Português** · [🇷🇺 Русский](ru.md) · [🇫🇷 Français](fr.md) · [🇮🇩 Bahasa Indonesia](id.md)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](../LICENSE)
[![AdGuard Home](https://img.shields.io/badge/AdGuard%20Home-v0.107+-green.svg)](https://adguard.com/adguard-home.html)
[![HTTP/2 & HTTP/3](https://img.shields.io/badge/Protocol-HTTP%2F2%20%7C%20HTTP%2F3%20QUIC-orange.svg)]()
[![Kernel Tuning](https://img.shields.io/badge/Linux-ZRAM%20%2B%20BBR-purple.svg)]()

Configuração de nível de produção reforçada para executar o **AdGuard Home** em hipervisores com múltiplos nós (Proxmox VE, KVM, Bare Metal). Apresenta **otimização de memória ZRAM (zstd)**, **ajuste de buffers de socket do kernel Linux**, **suporte nativo a HTTP/2 e HTTP/3 (QUIC / DoQ)**, **proxy PAC inteligente** e **failover rápido de DNS**.

---

## Principais Recursos

- **⚡ ZRAM com compressão zstd**: Drive RAM comprimido de 1 GB com `swappiness 180` e `page-cluster 0` para eliminar gargalos de I/O em VMs com 1 GB de RAM.
- **🚀 Otimização do Kernel Linux**: Controle de congestionamento TCP BBR, agendador FQ e buffers UDP expandidos para 7.5 MB para absorver picos intensos de DNS.
- **🔒 HTTP/2 e HTTP/3 Nativos (QUIC / DoQ)**: Painel web servido em HTTP/2 na porta 443; DNS-over-QUIC (DoQ) e DNS-over-TLS (DoT) operando na porta 853.
- **🛡️ Certificado SSL SAN de 20 Anos**: Sem dependências de domínios externos ou renovações a cada 90 dias; opera de forma independente e definitiva.
- **🔄 Redirecionamento Transparente da Porta 80**: Regra persistente do iptables para acessar diretamente via `http://<IP>` sem precisar digitar `:3000`.
- **🌐 Bypass de DPI com PAC Inteligente**: Proxy ByeDPI SOCKS5 integrado e servidor PAC leve em Python para roteamento condicional de domínios.

---

## Guia de Início Rápido

```bash
git clone https://github.com/KS-GG-AI/adguardhome-homelab-stack.git
cd adguardhome-homelab-stack/scripts
chmod +x setup-node.sh generate-self-signed-cert.sh verify-health.sh

# Executar a instalação automatizada (informe o IP do nó)
sudo ./setup-node.sh 10.0.1.2

# Verificar a integridade e os serviços ativos
sudo ./verify-health.sh 10.0.1.2
```

---

## Licença

Distribuído sob a [Licença MIT](../LICENSE).
