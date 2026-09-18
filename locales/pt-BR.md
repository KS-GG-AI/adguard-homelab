<div align="center">

<picture>
  <img src="../docs/assets/banner.svg" alt="AdGuard Home: Stack de Alto Desempenho para Homelab" width="100%" />
</picture>

# AdGuard Home: Stack de Alto Desempenho para Homelab

<p>
  <strong>Appliance de rede e DNS de nível de produção Zero-SPOF com otimização ZRAM (zstd), TCP BBR, HTTP/2 e HTTP/3 (QUIC/DoQ), e resiliência isolada multi-nó.</strong>
</p>

<p>
  <a href="../README.md">🇺🇸 English</a> ·
  <a href="ko.md">🇰🇷 한국어</a> ·
  <a href="zh-CN.md">🇨🇳 中文</a> ·
  <a href="es.md">🇪🇸 Español</a> ·
  <a href="hi.md">🇮🇳 हिन्दी</a><br />
  <a href="ar.md">🇸🇦 العربية</a> ·
  <strong>🇧🇷 Português</strong> ·
  <a href="ru.md">🇷🇺 Русский</a> ·
  <a href="fr.md">🇫🇷 Français</a> ·
  <a href="id.md">🇮🇩 Bahasa Indonesia</a>
</p>

<p>
  <a href="https://github.com/KS-GG-AI/adguardhome-homelab-stack/releases"><img src="https://img.shields.io/badge/Release-v1.0.0-A78BFA?style=flat-square&logo=github&labelColor=161126" alt="Release" /></a>
  <a href="../LICENSE"><img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square&labelColor=161126" alt="License: MIT" /></a>
  <a href="https://adguard.com/adguard-home.html"><img src="https://img.shields.io/badge/AdGuard%20Home-v0.107+-green.svg?style=flat-square&labelColor=161126" alt="AdGuard Home" /></a>
  <img src="https://img.shields.io/badge/Protocol-HTTP%2F2%20%7C%20HTTP%2F3%20QUIC-orange.svg?style=flat-square&labelColor=161126" alt="HTTP/2 & HTTP/3" />
  <img src="https://img.shields.io/badge/Linux-ZRAM%20%2B%20BBR-purple.svg?style=flat-square&labelColor=161126" alt="Kernel Tuning" />
  <img src="https://img.shields.io/badge/Network-2.5GbE%20Dual--NIC-2088FF.svg?style=flat-square&labelColor=161126" alt="Network 2.5G" />
</p>

<p>
  <img src="../docs/assets/dns-flow.gif" alt="DNS Flow Animation" width="92%" />
</p>

</div>

---

## Arquitetura de Rede: Rede Externa vs. Interna e Switch Hub de 2.5G

Esta arquitetura baseia-se na rigorosa **segmentação física** e **resiliência de pods independentes sem acoplamento (Zero-Coupling Pod Isolation)**, separando o tráfego externo WAN não confiável da rede interna LAN de alta largura de banda.

<p align="center">
  <img src="../docs/assets/network-topology.svg" alt="Network Topology" width="100%" />
</p>

### 1. 🌐 Rede Externa (WAN / Uplink)
- **Isolamento de Gateway ISP**: A rede externa e o roteador da operadora (192.168.1.1) conectam-se exclusivamente via vmbr0 (interface de gerenciamento e uplink), protegendo as máquinas virtuais de exposição pública direta.
- **Resolução DNS Criptografada Upstream**: As consultas DNS upstream saem por túneis criptografados DNS-over-HTTPS (DoH) e DNS-over-TLS (DoT) para Cloudflare (1.1.1.1), Quad9 (9.9.9.9) e Google (8.8.8.8), bloqueando espionagem do provedor.
- **Consultas Paralelas e Cache Otimista**: Múltiplos resolvedores upstream são consultados em paralelo e armazenados em cache na RAM, respondendo imediatamente em 0 ms mesmo durante instabilidades na rede externa.

### 2. 🏢 Rede Interna e Switch Hub de 2.5 Gbps (LAN e Backbone)
- **Switch Hub Físico de 2.5G**: 4 mini PCs físicos independentes (myu1~myu4) interconectam-se via interfaces Ethernet dedicadas de 2.5 Gbps a um switch hub de alta velocidade, criando um backbone de hardware sem gargalos.
- **Segmentação com Placa de Rede Dupla (Dual-NIC)**: vmbr0 vincula-se à NIC física 1 para tráfego WAN e administração web do Proxmox (192.168.1.0/24); vmbr1 vincula-se à NIC física 2 para tráfego privado interno (10.0.X.0/24), isolando transferências pesadas da gestão do hipervisor.
- **Isolamento Rigoroso de Pods Independentes (Zero Acoplamento Entre Nós)**: Cada máquina física executa seu próprio appliance AdGuard Home na VMID 3000 (10.0.X.2). Sem clustering DNS entre nós: a manutenção do Nó 1 não afeta a autonomia operacional de 100% dos Nós 2, 3 e 4.
- **Comunicação de Alta Velocidade entre VMs e Resolução DNS em 0 ms**: Transferências pesadas entre VMs (Samba, NFS, SSH, bancos de dados) utilizam a velocidade total de 2.5 Gbps. As consultas DNS são resolvidas na máquina local via loopback (10.0.X.2:53 UDP) em menos de 0.1 ms.
- **Failover Instantâneo de 1 Segundo (Instant Failover)**: A configuração de rede das VMs inclui o resolver primário 10.0.X.2 e secundário público 1.1.1.1 com options timeout:1 attempts:1. Se o AdGuard parar, o tráfego migra suavemente em 1 segundo sem quedas de conexão.

---

## Especificações do Sistema: Requisitos Mínimos vs. Recomendados

| Componente | Requisitos Mínimos (Laboratório Básico) | Especificações Recomendadas (Produção Homelab) | Pod Corporativo Multi-Nó (Validado) |
| :--- | :--- | :--- | :--- |
| **CPU** | 1 vCPU (x86_64 ou ARM64) | 2 vCPU (x86_64) | Intel N100 / AMD Ryzen 5+ (Host físico) |
| **Memória (RAM)** | 512 MB (com ZRAM) | 1024 MB ~ 2048 MB | 16 GB+ Host (1024 MB dedicados por VM) |
| **Otimização de Memória** | Swap padrão em disco | ZRAM (zstd, swappiness 180) | ZRAM 1GB + page-cluster 0 |
| **Armazenamento (Disco)** | 8 GB Disco Virtual | 16 GB NVMe SSD | Armazenamento PCIe NVMe de alta velocidade |
| **Rede (NIC)** | 1x Ethernet 1Gbps | 2x Dual-NIC 1Gbps ou 2.5Gbps | 2x 2.5GbE Dual-NIC + Switch Hub 2.5G |
| **Hipervisor** | Proxmox VE 7+, KVM, ESXi | Proxmox VE 8.x / Bare Metal | Pods independentes Proxmox VE 8.x |
| **SO Convidado** | Debian 12 / Ubuntu 22.04 LTS | Debian 12 (Kernel 6.1+) | Debian 12 + TCP BBR + 7.5MB UDP |

---

## Cenários de Uso por Finalidade

### 1. 🏡 Proteção de Rede para Casa Inteligente e Homelab
- Bloqueio centralizado de anúncios, telemetria e malware sem instalação de aplicativos para Smart TVs, celulares, IoT e consoles.

### 2. 💻 Sandbox para Desenvolvedores e Engenharia
- Proxy ByeDPI SOCKS5 (:1080) e daemon Python PAC (:8088) leve integrados para aceleração seletiva de APIs e documentação externa, com suporte a domínios locais .local, .lab e .internal.

### 3. 🏛️ Infraestrutura de Virtualização de Alta Disponibilidade (Proxmox VE / KVM)
- Arquitetura de pods independentes que elimina riscos de falhas em cascata: a manutenção de um host não interrompe a rede dos demais.

### 4. 🔒 Transporte Criptografado de Última Geração (DoQ / HTTP/3 e DoT)
- Substitui o protocolo UDP 53 em texto não criptografado por DNS-over-QUIC (HTTP/3 UDP 853) e DNS-over-TLS (TCP 853), com interface web HTTP/2 e certificados SAN de 20 anos.

---

## Principais Recursos de Desempenho

- **⚡ Swap Compactado ZRAM com zstd**: Drive RAM compactado de 1GB com swappiness 180 e page-cluster 0 que elimina gargalos de I/O em disco.
- **🚀 Otimização do Stack de Rede do Kernel**: Controle de congestionamento TCP BBR, filas FQ e buffers de socket UDP expandidos para 7.5MB (rmem_max/wmem_max) para suportar picos de tráfego.
- **🔒 HTTP/2 e HTTP/3 Nativos (QUIC / DoQ)**: Painel web servido via HTTP/2 na porta 443; mecanismo DNS-over-QUIC na porta 853 UDP.
- **🛡️ Certificados TLS Automatizados para 20 Anos**: Geração automática de certificados SAN válidos por 7.300 dias até 2046 sem dependência de renovação externa.
- **🔄 Redirecionamento Transparente da Porta 80**: Regra NAT persistente do iptables redirecionando a porta HTTP 80 para 3000 sem exigir digitação da porta no navegador.

---

## Estrutura de Diretórios

```
├── configs/
│   ├── AdGuardHome.yaml.template     # Sanitized, production-tuned AdGuard config
│   ├── sysctl.d/
│   │   └── 99-adhome-tuning.conf     # Kernel, BBR, and socket buffer tuning
│   ├── systemd/
│   │   ├── zram-generator.conf       # ZRAM zstd generator configuration
│   │   ├── byedpi.service            # ByeDPI SOCKS5 systemd service
│   │   └── pac-server.service        # Python PAC server systemd service
│   ├── pac/
│   │   ├── pac_server.py             # Lightweight PAC HTTP daemon
│   │   └── proxy.pac.template        # Smart routing PAC file template
│   └── iptables/
│       └── rules.v4                  # Persistent Port 80 -> 3000 NAT redirect
├── scripts/
│   ├── setup-node.sh                 # Full automated installation script
│   ├── generate-self-signed-cert.sh  # 20-Year SAN SSL certificate generator
│   └── verify-health.sh              # System & network health check utility
├── docs/
│   ├── assets/
│   │   ├── banner.svg                # High-resolution vector banner
│   │   ├── network-topology.svg      # Multi-node network topology diagram
│   │   └── dns-flow.gif              # Real-time resolution flow animation
│   ├── ARCHITECTURE.md               # Detailed multi-node architectural design
│   ├── SECURITY.md                   # Security boundary & hardening guide
│   └── PERFORMANCE.md                # ZRAM & BBR benchmark documentation
├── LICENSE                           # MIT License
└── README.md
```

---

## Guia de Início Rápido

### 1. Pré-requisitos
- VM limpa com Debian 12 / 13 ou Ubuntu 22.04 / 24.04.
- Configuração recomendada: 1 vCPU, 1024 MB RAM, 16 GB Disco, Placa de Rede Dupla (WAN + LAN 2.5G).

### 2. Instalação Automatizada do Nó
```bash
git clone https://github.com/KS-GG-AI/adguardhome-homelab-stack.git
cd adguardhome-homelab-stack/scripts
chmod +x setup-node.sh generate-self-signed-cert.sh verify-health.sh

# Executar instalação (informar o IP estático interno)
sudo ./setup-node.sh 10.0.1.2
```

### 3. Verificação de Integridade e Protocolos
```bash
sudo ./verify-health.sh 10.0.1.2
```

- **ZRAM**: Verificar se /dev/zram0 está ativo com compressão zstd.
- **Sysctl**: Verificar net.ipv4.tcp_congestion_control = bbr e vm.swappiness = 180.
- **Web UI**: Resposta HTTP/2 200/302 ao acessar https://10.0.1.2.
- **DNS**: Portas 53 (UDP), 443 (DoH) e 853 (DoT & DoQ / HTTP/3) em escuta ativa.

---

## Auditoria de Segurança e Conformidade

- **Zero Segredos Hardcoded**: Todas as senhas, hashes bcrypt e chaves privadas foram sanitizadas e fornecidas como modelos seguros.
- **Compatível com Redes Isoladas (Air-Gapped)**: Certificados de 20 anos dispensam validações externas ou APIs de renovação a cada 90 dias.
- **Zero Acoplamento Entre Nós**: Os hosts físicos sobrevivem de forma independente sem quorum compartilhado.

---

## Licença

Distribuído sob a [Licença MIT](../LICENSE).
