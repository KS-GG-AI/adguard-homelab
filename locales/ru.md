# Высокопроизводительный стек AdGuard Home для Homelab

[🇺🇸 English](../README.md) · [🇰🇷 한국어](ko.md) · [🇨🇳 中文](zh-CN.md) · [🇪🇸 Español](es.md) · [🇮🇳 हिन्दी](hi.md) · [🇸🇦 العربية](ar.md) · [🇧🇷 Português](pt-BR.md) · **🇷🇺 Русский** · [🇫🇷 Français](fr.md) · [🇮🇩 Bahasa Indonesia](id.md)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](../LICENSE)
[![AdGuard Home](https://img.shields.io/badge/AdGuard%20Home-v0.107+-green.svg)](https://adguard.com/adguard-home.html)
[![HTTP/2 & HTTP/3](https://img.shields.io/badge/Protocol-HTTP%2F2%20%7C%20HTTP%2F3%20QUIC-orange.svg)]()
[![Kernel Tuning](https://img.shields.io/badge/Linux-ZRAM%20%2B%20BBR-purple.svg)]()

Готовая к промышленной эксплуатации конфигурация для запуска **AdGuard Home** на многоузловых гипервизорах (Proxmox VE, KVM, Bare Metal). Включает **оптимизацию памяти ZRAM (zstd)**, **тюнинг сокетных буферов ядра Linux**, **нативную поддержку HTTP/2 и HTTP/3 (QUIC / DoQ)**, **интеллектуальный PAC-прокси** и **мгновенное переключение при сбоях (DNS Failover)**.

---

## Ключевые особенности

- **⚡ ZRAM с компрессией zstd**: Сжатый RAM-диск на 1 ГБ с `swappiness 180` и `page-cluster 0` устраняет узкие места дискового ввода-вывода на виртуальных машинах с 1 ГБ ОЗУ.
- **🚀 Оптимизация ядра Linux**: Алгоритм TCP BBR, планировщик FQ и буферы UDP, расширенные до 7.5 МБ для сглаживания пиковых нагрузок DNS.
- **🔒 Нативный HTTP/2 и HTTP/3 (QUIC / DoQ)**: Панель управления на порту 443 с мультиплексированием HTTP/2; DNS-over-QUIC (DoQ) и DNS-over-TLS (DoT) на порту 853.
- **🛡️ 20-летний самоподписанный SSL-сертификат**: Работает бессрочно в изолированной локальной сети без необходимости привязки внешнего домена и обновления каждые 90 дней.
- **🔄 Прозрачный редирект с порта 80**: Доступ к веб-интерфейсу по адресу `http://<IP>` без указания порта `:3000`.
- **🌐 Обход блокировок с PAC**: Интегрированный SOCKS5-прокси ByeDPI и легковесный Python-сервер PAC для гибкой маршрутизации.

---

## Быстрый старт

```bash
git clone https://github.com/KS-GG-AI/adguardhome-homelab-stack.git
cd adguardhome-homelab-stack/scripts
chmod +x setup-node.sh generate-self-signed-cert.sh verify-health.sh

# Запуск автоматической настройки (укажите IP ноды)
sudo ./setup-node.sh 10.0.1.2

# Проверка работоспособности
sudo ./verify-health.sh 10.0.1.2
```

---

## Лицензия

Распространяется под [Лицензией MIT](../LICENSE).
