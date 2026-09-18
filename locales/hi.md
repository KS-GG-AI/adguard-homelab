# AdGuard Home उच्च प्रदर्शन होमलैब क्लस्टर स्टैक

[🇺🇸 English](../README.md) · [🇰🇷 한국어](ko.md) · [🇨🇳 中文](zh-CN.md) · [🇪🇸 Español](es.md) · **🇮🇳 हिन्दी** · [🇸🇦 العربية](ar.md) · [🇧🇷 Português](pt-BR.md) · [🇷🇺 Русский](ru.md) · [🇫🇷 Français](fr.md) · [🇮🇩 Bahasa Indonesia](id.md)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](../LICENSE)
[![AdGuard Home](https://img.shields.io/badge/AdGuard%20Home-v0.107+-green.svg)](https://adguard.com/adguard-home.html)
[![HTTP/2 & HTTP/3](https://img.shields.io/badge/Protocol-HTTP%2F2%20%7C%20HTTP%2F3%20QUIC-orange.svg)]()
[![Kernel Tuning](https://img.shields.io/badge/Linux-ZRAM%20%2B%20BBR-purple.svg)]()

मल्टी-नोड हाइपरवाइज़र (Proxmox VE, KVM, Bare Metal) पर **AdGuard Home** चलाने के लिए उत्पादन-ग्रेड, सुरक्षित सेटअप। इसमें **ZRAM (zstd) मेमोरी ऑप्टिमाइज़ेशन**, **लिनक्स कर्नेल सॉकेट बफ़र ट्यूनिंग**, **HTTP/2 वेब UI और HTTP/3 (QUIC / DoQ)** सपोर्ट, **स्मार्ट PAC प्रॉक्सी**, और **तेज़ डीएनएस फ़ेलओवर** शामिल हैं।

---

## मुख्य विशेषताएं

- **⚡ ZRAM zstd कम्प्रेशन**: 1GB RAM वाली VM में डिस्क I/O बाधा को दूर करने के लिए 1GB कंप्रेस्ड रैम ड्राइव (`swappiness 180`, `page-cluster 0`)।
- **🚀 लिनक्स कर्नेल नेटवर्क ट्यूनिंग**: भारी DNS ट्रैफ़िक को संभालने के लिए TCP BBR, FQ शेड्यूलर, और 7.5MB तक विस्तारित UDP बफ़र।
- **🔒 नेटिव HTTP/2 और HTTP/3 (QUIC / DoQ)**: पोर्ट 443 पर HTTP/2 वेब डैशबोर्ड, और पोर्ट 853 पर अगली पीढ़ी का DNS-over-QUIC (DoQ)।
- **🛡️ 20-वर्षीय सेल्फ-साइंड प्रमाणपत्र**: बिना किसी बाहरी डोमेन या 90-दिन के नवीनीकरण के बंद नेटवर्क में भी स्थायी रूप से काम करता है।
- **🔄 पोर्ट 80 रीडायरेक्ट**: पोर्ट 3000 टाइप किए बिना सीधे `http://<IP>` के माध्यम से वेब डैशबोर्ड एक्सेस।
- **🌐 स्मार्ट PAC बाईपास**: स्थानीय ByeDPI SOCKS5 प्रॉक्सी और हल्के पायथन PAC सर्वर के साथ एकीकृत।

---

## त्वरित आरंभ

```bash
git clone https://github.com/KS-GG-AI/adguardhome-homelab-stack.git
cd adguardhome-homelab-stack/scripts
chmod +x setup-node.sh generate-self-signed-cert.sh verify-health.sh

# ऑटोमेशन सेटअप चलाएं (अपना नोड IP निर्दिष्ट करें)
sudo ./setup-node.sh 10.0.1.2

# सिस्टम स्थिति की जाँच करें
sudo ./verify-health.sh 10.0.1.2
```

---

## लाइसेंस

[MIT License](../LICENSE) के तहत जारी।
