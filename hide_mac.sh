#!/bin/bash

mac_new="d0:57:7b:11:39:c2"
net_interface="wlp2s0f3u2"

sudo macchanger --mac=$mac_new $net_interface
