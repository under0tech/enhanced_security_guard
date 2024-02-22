#!/bin/bash

agent="GUARD"
mac_address="74:da:38:8b:a5:c2"
ping_server="208.67.220.220"
dns_default="192.168.0.1"

send_message()
{
   sudo -u under0 DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send $agent "$1"
}

# Check if MAC is hidden
if sudo ifconfig | grep -q $mac_address; then
    send_message "MAC is not secured"
fi

# Check ping to OpenDNS server
if ! sudo ping -c 4 $ping_server >/dev/null 2>&1; then
    send_message "Internet connection lost"
fi

# Check DNS
if sudo resolvectl status | grep -q $dns_default; then
    send_message "DNS is not secured"
fi

# Check if VPN connection is not established 
if ! sudo ifconfig | grep -q "tun1"; then
    send_message "VPN is not established"
fi
