# AdGuard Home 高性能家庭实验室集群套件

[🇺🇸 English](../README.md) · [🇰🇷 한국어](ko.md) · **🇨🇳 中文** · [🇪🇸 Español](es.md) · [🇮🇳 हिन्दी](hi.md) · [🇸🇦 العربية](ar.md) · [🇧🇷 Português](pt-BR.md) · [🇷🇺 Русский](ru.md) · [🇫🇷 Français](fr.md) · [🇮🇩 Bahasa Indonesia](id.md)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](../LICENSE)
[![AdGuard Home](https://img.shields.io/badge/AdGuard%20Home-v0.107+-green.svg)](https://adguard.com/adguard-home.html)
[![HTTP/2 & HTTP/3](https://img.shields.io/badge/Protocol-HTTP%2F2%20%7C%20HTTP%2F3%20QUIC-orange.svg)]()
[![Kernel Tuning](https://img.shields.io/badge/Linux-ZRAM%20%2B%20BBR-purple.svg)]()

专为多节点虚拟化平台（Proxmox VE、KVM、裸金属等）量身定制的生产级 **AdGuard Home** 高性能加固配置。包含 **ZRAM (zstd) 内存压缩优化**、**Linux 内核套接字缓冲区调优**、**原生 HTTP/2 Web UI 与 HTTP/3 (QUIC / DoQ)** 支持、**智能 PAC 代理分流** 以及 **1 秒极速故障转移 (Fast DNS Failover)**。

---

## 核心特性

- **⚡ ZRAM zstd 压缩交换**: 在 1GB 内存小规格 VM 中消除磁盘 I/O 瓶颈，基于 `swappiness 180` 与 `page-cluster 0`。
- **🚀 内核网络性能调优**: 启用 TCP BBR 拥塞控制、FQ 队列调度，并将 UDP 接收/发送缓冲区扩展至 7.5MB，平稳吸收高并发 DNS 流量。
- **🔒 原生 HTTP/2 与 HTTP/3 (QUIC / DoQ)**: Web 管理后台支持 443 端口 HTTP/2 多路复用，853 端口默认启用次世代 DNS-over-QUIC (DoQ / HTTP/3)。
- **🛡️ 20 年长期自签名证书**: 无需外部域名或 90 天证书续签，在完全内网/离线环境下永久平稳运行。
- **🔄 80 端口透明重定向**: 无需手动输入 `:3000` 端口即可直接通过 `http://<IP>` 访问管理后台。
- **🌐 智能 PAC 分流**: 集成 ByeDPI SOCKS5 代理与轻量 Python PAC 服务，智能绕过域名封锁。
- **🏛️ 独立高可用节点设计**: 避免集群仲裁带来的单点崩溃风险，本地 AdGuard 异常时 1 秒自动切换至备用公共 DNS。

---

## 快速上手

```bash
git clone https://github.com/KS-GG-AI/adguardhome-homelab-stack.git
cd adguardhome-homelab-stack/scripts
chmod +x setup-node.sh generate-self-signed-cert.sh verify-health.sh

# 执行自动化安装配置（指定节点静态 IP）
sudo ./setup-node.sh 10.0.1.2

# 验证系统健康状态
sudo ./verify-health.sh 10.0.1.2
```

---

## 开源协议

本项目基于 [MIT License](../LICENSE) 协议发布。
