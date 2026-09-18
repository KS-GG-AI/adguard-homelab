# Stack AdGuard Home Performa Tinggi untuk Homelab

[🇺🇸 English](../README.md) · [🇰🇷 한국어](ko.md) · [🇨🇳 中文](zh-CN.md) · [🇪🇸 Español](es.md) · [🇮🇳 हिन्दी](hi.md) · [🇸🇦 العربية](ar.md) · [🇧🇷 Português](pt-BR.md) · [🇷🇺 Русский](ru.md) · [🇫🇷 Français](fr.md) · **🇮🇩 Bahasa Indonesia**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](../LICENSE)
[![AdGuard Home](https://img.shields.io/badge/AdGuard%20Home-v0.107+-green.svg)](https://adguard.com/adguard-home.html)
[![HTTP/2 & HTTP/3](https://img.shields.io/badge/Protocol-HTTP%2F2%20%7C%20HTTP%2F3%20QUIC-orange.svg)]()
[![Kernel Tuning](https://img.shields.io/badge/Linux-ZRAM%20%2B%20BBR-purple.svg)]()

Konfigurasi tingkat produksi yang diperkuat untuk menjalankan **AdGuard Home** di lingkungan multi-node hypervisor (Proxmox VE, KVM, Bare Metal). Dilengkapi **optimasi memori ZRAM (zstd)**, **penyetelan buffer soket kernel Linux**, **dukungan asli HTTP/2 dan HTTP/3 (QUIC / DoQ)**, **proxy PAC cerdas**, serta **failover DNS berkecepatan tinggi**.

---

## Fitur Utama

- **⚡ ZRAM dengan Kompresi zstd**: Drive RAM terkompresi 1GB dengan `swappiness 180` dan `page-cluster 0` untuk mengatasi hambatan I/O disk pada VM 1GB RAM.
- **🚀 Penyetelan Kernel Linux**: Kontrol kemacetan TCP BBR, penjadwal FQ, dan buffer UDP yang diperluas hingga 7.5MB untuk menangani lonjakan kueri DNS.
- **🔒 HTTP/2 & HTTP/3 Asli (QUIC / DoQ)**: Dashboard web disajikan melalui HTTP/2 pada port 443; DNS-over-QUIC (DoQ) dan DNS-over-TLS (DoT) berjalan pada port 853.
- **🛡️ Sertifikat SSL Mandiri 20 Tahun**: Beroperasi permanen di jaringan lokal tertutup tanpa perlu domain eksternal atau pembaruan berkala 90 hari.
- **🔄 Pengalihan Port 80 Transparan**: Akses dashboard langsung melalui `http://<IP>` tanpa perlu mengetik `:3000`.
- **🌐 Bypass DPI dengan PAC Cerdas**: Proxy ByeDPI SOCKS5 terintegrasi dan server PAC Python ringan untuk perutean cerdas.

---

## Panduan Memulai Cepat

```bash
git clone https://github.com/KS-GG-AI/adguardhome-homelab-stack.git
cd adguardhome-homelab-stack/scripts
chmod +x setup-node.sh generate-self-signed-cert.sh verify-health.sh

# Jalankan instalasi otomatis (tentukan IP node Anda)
sudo ./setup-node.sh 10.0.1.2

# Verifikasi status sistem
sudo ./verify-health.sh 10.0.1.2
```

---

## Lisensi

Didistribusikan di bawah [Lisensi MIT](../LICENSE).
