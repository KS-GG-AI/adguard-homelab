# حزمة AdGuard Home عالية الأداء للمختبر المنزلي (Homelab)

[🇺🇸 English](../README.md) · [🇰🇷 한국어](ko.md) · [🇨🇳 中文](zh-CN.md) · [🇪🇸 Español](es.md) · [🇮🇳 हिन्दी](hi.md) · **🇸🇦 العربية** · [🇧🇷 Português](pt-BR.md) · [🇷🇺 Русский](ru.md) · [🇫🇷 Français](fr.md) · [🇮🇩 Bahasa Indonesia](id.md)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](../LICENSE)
[![AdGuard Home](https://img.shields.io/badge/AdGuard%20Home-v0.107+-green.svg)](https://adguard.com/adguard-home.html)
[![HTTP/2 & HTTP/3](https://img.shields.io/badge/Protocol-HTTP%2F2%20%7C%20HTTP%2F3%20QUIC-orange.svg)]()
[![Kernel Tuning](https://img.shields.io/badge/Linux-ZRAM%20%2B%20BBR-purple.svg)]()

تكوين متين وجاهز للإنتاج لتشغيل **AdGuard Home** عبر بيئات افتراضية متعددة العقد (مثل Proxmox VE و KVM والعتاد الفعلي). يتميز بـ **تحسين الذاكرة باستخدام ZRAM (zstd)**، و**ضبط مخازن مقابس نواة لينكس**، ودعم **HTTP/2 للواجهة و HTTP/3 (QUIC / DoQ)**، و**وكيل PAC الذكي**، و**التحويل السريع في حالة الفشل (Fast DNS Failover)**.

---

## الميزات الرئيسية

- **⚡ ضغط ZRAM zstd**: محرك ذاكرة وصول عشوائي مضغوط بسعة 1 جيجابايت مع `swappiness 180` و `page-cluster 0` لإلغاء اختناقات القرص في الأجهزة الافتراضية الصغيرة.
- **🚀 ضبط شبكة نواة لينكس**: تفعيل TCP BBR وجدولة FQ وتوسيع مخازن UDP المؤقتة إلى 7.5 ميجابايت لاستيعاب طلبات DNS الكثيفة.
- **🔒 دعم HTTP/2 و HTTP/3 الأصيل (QUIC / DoQ)**: لوحة تحكم سريعة عبر HTTP/2 على المنفذ 443، وتفعيل DNS-over-QUIC (DoQ) على المنفذ 853 UDP.
- **🛡️ شهادة SSL ذاتية التوقيع لمدة 20 عامًا**: تعمل بشكل دائم في الشبكات المغلقة دون الحاجة لنطاق خارجي أو تجديد كل 90 يومًا.
- **🔄 تحويل شفاف للمنفذ 80**: الوصول إلى لوحة الإدارة عبر `http://<IP>` مباشرة دون الحاجة لكتابة المنفذ `:3000`.

---

## دليل التشغيل السريع

```bash
git clone https://github.com/KS-GG-AI/adguardhome-homelab-stack.git
cd adguardhome-homelab-stack/scripts
chmod +x setup-node.sh generate-self-signed-cert.sh verify-health.sh

# تشغيل الإعداد التلقائي (حدد عنوان IP الخاص بالعقدة)
sudo ./setup-node.sh 10.0.1.2

# التحقق من حالة النظام
sudo ./verify-health.sh 10.0.1.2
```

---

## الترخيص

مرخص بموجب [رخصة MIT](../LICENSE).
