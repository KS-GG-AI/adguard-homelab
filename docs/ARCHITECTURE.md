# System Architecture & Design Principles

## Overview
This architecture is built on the principle of **Zero-Single-Point-of-Failure (Zero-SPOF)** for homelab and edge deployments. Rather than clustering hypervisors into a fragile quorum (where losing 2 of 3 nodes halts the cluster), each node operates as a self-contained, standalone unit.

```mermaid
graph TD
    subgraph WAN ["External Network 192.168.219.0/24"]
        Router["Router / Gateway"]
    end

    subgraph Internal_L2 ["Dedicated 2.5GbE L2 Switch (No Gateway / No NAT)"]
        Switch["2.5G Switch (10.0.0.0/16)"]
    end

    subgraph Node1 ["Physical Node 1 (myu1)"]
        AG1["AdGuard Home 01 (VM 3000)<br/>IP: 10.0.1.2<br/>HTTP/2, HTTP/3 DoQ"]
        VM1["Local VMs (dev01, mail01)<br/>DNS Primary: 10.0.1.2<br/>Fallback: 1.1.1.1"]
        AG1 --- VM1
    end

    subgraph Node2 ["Physical Node 2 (myu2)"]
        AG2["AdGuard Home 02 (VM 3000)<br/>IP: 10.0.2.2<br/>HTTP/2, HTTP/3 DoQ"]
        VM2["Local Guests<br/>DNS Primary: 10.0.2.2"]
        AG2 --- VM2
    end

    Router --- Node1
    Router --- Node2
    Switch --- Node1
    Switch --- Node2
```

## Key Architectural Tenets
1. **Isolated Standalone Pods**: Each physical hypervisor runs its own dedicated AdGuard Home instance. Local guests resolve against their own physical host's AdGuard instance first.
2. **Fast Public Fallback (`timeout:1 attempts:1`)**: If a node's local AdGuard VM is stopped or undergoing maintenance, guest VMs immediately failover to secondary public resolvers within 1 second without freezing.
3. **No Cross-Node Fragility**: No node depends on another node to boot, resolve DNS, or serve network traffic.
