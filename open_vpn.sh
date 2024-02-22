#!/bin/bash

system_path="/etc/systemd/system"

mac_address="74:da:38:8b:a5:c2"
ping_server="208.67.220.220"
dns_default="192.168.0.1"

# Check if MAC is not hidden
if sudo ifconfig | grep -q $mac_address; then
    exit 1
fi

# Check ping to OpenDNS server
if ! sudo ping -c 4 $ping_server >/dev/null 2>&1; then
    exit 1
fi

# Check if DNS is not secured
if sudo resolvectl status | grep -q $dns_default; then
    exit 1
fi

# Check if VPN connection is not established 
if ! sudo ifconfig | grep -q "tun1"; then
    vpn_config=$(shuf "$system_path/open_vpn.config" | head -n 1)
    sudo openvpn --config "$system_path/$vpn_config" --auth-user-pass "$system_path/vpnbook-password-tcp443.txt"
fi
