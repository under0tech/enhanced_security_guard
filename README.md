# Protecting Linux Workstation Privacy Using Bash Scripts

## Overwiew
This script employs Linux systemd services, timers, and bash-scripts to establish layers of additional protection and shields, ensuring privacy for Linux workstations by concealing MAC addresses, locations, and preventing DNS leaks.

## MAC Address Concealment Service
Boost your privacy by spoofing the actual MAC address. Follow these steps:

Copy the `hide_mac.sh` and `hide_mac.service` files to the `/etc/systemd/system` directory.

Modify parameters for your network interface and default MAC address in the `hide_mac.sh` file.

Run the following commands:
```bash
sudo systemctl enable hide_mac.service
reboot
```

## Conceal Location DNS
Ensure privacy by configuring your own list of DNS servers to prevent location tracking and exposure of your address. Follow these steps:

Copy the `hide_location.sh`, `hide_location.service`, and `hide_location.timer` files to the `/etc/systemd/system` directory.

Modify parameters for your network interface and DNS server if necessary in the `hide_location.sh` file.

Execute the following commands:
```bash
sudo systemctl enable hide_location.timer
reboot
```

## Implement SSL-based OpenVPN
Secure your internet traffic by establishing a VPN (Virtual Private Network) tunnel. Follow these steps:

Copy the `open_vpn.sh`, `open_vpn.service`, `open_vpn.config`, and `open_vpn.timer`, along with all files starting with `vpnbook-*`, to the `/etc/systemd/system` directory.

Adjust parameters in the `open_vpn.sh` file as needed.

Execute the following commands:
```bash
sudo systemctl enable open_vpn.timer
reboot
```

## Establish Security Guard
Setup constant monitoring for breaches and threats while working on your Linux workstation. Follow these steps:

Copy the `guard.sh`, `guard.service`, and `guard.timer` files to the `/etc/systemd/system` directory.

Adjust parameters at the beginning of the `guard.sh` file as necessary.

Execute the following commands:
```bash
sudo systemctl enable guard.timer
reboot
```

## Troubleshooting
In the latest Linux distributions, you might encounter issues where services fail to function properly after being enabled. 

To diagnose these issues and check service status, health, and errors, execute the following command: 
```bash
sudo systemctl status hide_mac.service
```
In many cases, this problem stems from the SELinux policy subsystem. If you're the sole user of the computer, you likely don't need this subsystem. Here's how you can fix this:

Open a Bash terminal and execute the following command:
```bash
sudo nano /etc/selinux/config
```
Find the line that says `SELINUX=enforcing` and change it to `SELINUX=disabled`.

Reboot your system:
```bash
sudo reboot
```

## Get in touch
Feel free to ask me on Twitter if you have any questions.
Twitter: https://twitter.com/dmytro_sazonov