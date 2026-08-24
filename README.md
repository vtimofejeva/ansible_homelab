# Personal Homelab — Linux, Docker, Ansible & Infrastructure Automation
This is a Raspberry Pi-based self-hosted infrastructure project demonstrating Linux administration, Docker, network services, security hardening, scheduled backups, monitoring and disaster recovery automation with Ansible.

Note: the full non-redacted repos are stored privately.

# Project Structure
- ansible/                = disaster recovery and server provisioning
- docker/                 = container configurations and documentation
- backups_scripts/        = automated backup scripts and systemd timers
- homealb_description.md  = detailed infrastructure documentation
- homelab_diagram         = network / infrastructure diagram

# Skills
- Linux administration
- Ansible / Infrastructure as Code
- Docker & Docker Compose
- SSH / public-key authentication / Fail2ban
- Network configuration
- DNS / Pi-hole
- HTTPS / PKI
- UFW (on Trixie OS) / Firewalld (on Fedora)
- Backup automation
- Disaster recovery
- Monitoring / alerting
- Git

# Networking Concepts Addressed
- IPv4 addressing
- DHCP
- DNS
- static addressing
- routing through the ISP router
- DNS forwarding
- Pi-hole
- IPv6 considerations
- SSH
- HTTPS
- firewall rules
- TCP/UDP
- ports
- reverse proxy
- network troubleshooting

# Hardware Limitations and Improvements:
1. ISP Router and Switch
The current ISP router does not support VLAN configuration, so the lab currently operates via wifi with several devices using the Static IPs.
ISP Router provides only DNS Forwarding, so in order to use Pi-hole as a Local DNS Server, I setup static IPs on my devices. 
VLAN segmentation and correct DHCP configuration is planned once suitable routing/switching hardware is acquired.

2. Storage Disks
In order to implement redundancy RAID and at least mirror, I am planning to purchase extra storage.
Whilst it could be a second hard drive, Pi hardware might struggle to support such power consumption. 
Alternatively, it could be NAS.

3. Server Itself
In order to expand on CCTV and use AI-driven CCTV software, I will need to purchase a more powerful server.
Alternatively, it could be an AI hut, but the Pi I am having is 400, that has a motherboard built inside a keyboard.

For further software and hardware projects, please, see the homelab_description.md.
