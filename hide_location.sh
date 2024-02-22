#!/bin/bash

dns_default="192.168.0.1"
dns_opendns="208.67.222.222 208.67.220.220"
net_interface="wlp2s0f3u2"

if sudo resolvectl status | grep -q $dns_default; then
    sudo resolvectl dns $net_interface $dns_opendns
fi
