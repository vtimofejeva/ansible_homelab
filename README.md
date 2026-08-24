# Personal Homelab — Linux, Docker, Ansible & Infrastructure Automation
This is a Raspberry Pi-based self-hosted infrastructure project demonstrating Linux administration, Docker, network services, security hardening, scheduled backups, monitoring and disaster recovery automation with Ansible.

Note: the full non-redacted repos are stored privately.

# Project Structure
- ansible/                = disaster recovery and server provisioning
- docker/                 = container configurations and documentation
- backups_scripts/        = automated backup scripts and systemd timers
- homelab_description.md  = detailed infrastructure documentation
- homelab_diagram         = network / infrastructure diagram

# Skills
- Linux administration
  I am using Fedora as my main PC, whilst Pi server is running on a Trixie OS (Debian).
- Infrastructure as Code
  Created Ansible playbooks and fully tested them by re-imaging and provisioning my Pi Server from scartch.
- Docker
  Using containers to run various services on Pi Server. Docker-compose files and .env used for initializing the containers, whilst volumes stored on external HDD.
- SSH and Fail2ban
  Hardened SSH security on both Linux devices, restricting access only to one single PC via SSH keys.
- Network configuration
  Adjusted the DHCP Reservation on the ISP router. Set static IPs and specifically DNS Server to ensure Local DNS via Pi-hole is working correctly with NPM.
- DNS / Pi-hole
  Due to the limitation of the ISP router (only DNS Forwarding is available), Local DNS requires static IP addressing on the end hosts.
- HTTPS / PKI
  Ngnix Proxy Manager is used to ensure secure SSL connection to the local services runnning via Docker. I created CA, Intermediate CA and SSL certificates accordingly.
- UFW (on Trixie OS) / Firewalld (on Fedora)
  Firewall configuration on the hosts.
- Backup automation
  Scheduled backups scripts ensure that both documents and docker volumes are backed up nightly using the systemd units.
- Disaster recovery
  In addition to the fully tested Ansible and Scheduled Backups, I have an offline SSD that is also used as a backup storage.
- Monitoring / alerting
  Whilst Uptime Kuma is used for containers' health monitoring, Healthcheck.io is used to monitor both Pi Server uptime and Backup scripts.
  Alerts are sent via email to my inbox.
- Git
  Repositories are stored on the Pi Server and pushed to Github's private repos.

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
