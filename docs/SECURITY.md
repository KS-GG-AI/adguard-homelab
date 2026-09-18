# Security Hardening Guidelines

## 1. Network Boundary Isolation
- **No Gateway on L2 Switch**: The dedicated 2.5GbE internal network (`10.0.0.0/16`) has no default gateway. All cross-subnet routing from internal interfaces is disabled.
- **ARP Flux Prevention**: All hypervisors enforce `arp_ignore = 1` and `arp_announce = 2` to prevent MAC leakages across multi-homed physical NICs.

## 2. Host and Guest Hardening
- **SSH Hardening**:
  - Password authentication is strictly disabled (`PasswordAuthentication no`).
  - Only modern ed25519 public key authentication is permitted.
  - Root login is restricted to key-only access (`PermitRootLogin without-password`).
- **TLS & HTTP/3 Transport**:
  - Web management is served over TLS with HTTP/2 multiplexing.
  - DNS queries support DNS-over-QUIC (DoQ / HTTP/3) on port 853 UDP, mitigating man-in-the-middle tampering.

## 3. Sanitization & Secrets Management
- No production certificates or private keys are tracked in version control.
- All configuration files use environment variable overrides or templates.
