# Kernel & Memory Performance Tuning

## 1. ZRAM Swap (zstd)
In small-footprint VMs (1 vCPU, 1GB RAM), disk swapping degrades performance drastically.
- We deploy `systemd-zram-generator` with a 1GB compressed RAM drive using the modern `zstd` algorithm.
- `vm.swappiness = 180` forces the kernel to aggressively compress inactive pages into ZRAM before considering OOM kills.
- `vm.page-cluster = 0` optimizes single-page I/O without speculative readahead latency.

## 2. TCP BBR & Fair Queueing
- `net.core.default_qdisc = fq`
- `net.ipv4.tcp_congestion_control = bbr`
BBR models network bottleneck bandwidth and round-trip time, delivering lower latency under packet loss compared to traditional CUBIC.

## 3. High-Throughput UDP Buffering
Under bursts of DNS traffic, default Linux socket buffers drop UDP packets.
- `net.core.rmem_max = 7500000` and `net.core.wmem_max = 7500000` provide 7.5MB buffer space to absorb microbursts.
