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
- Linux administration    -  package management, networking, firewall config, SSH hardening, systemd automation and storage mounting on Fedora and Trixie OS.
- Infrastructure as Code  -  Created Ansible playbooks and fully tested them by re-imaging and provisioning my Pi Server from scartch.
- Docker                  -  Using containers to run various services on Pi Server. Docker-compose files and .env used for initializing the containers, whilst persistent volumes stored on external HDD. Shared network is used for all containers to ensure direct internal communication.
- SSH and Fail2ban        -  Hardened SSH security on both Linux devices, restricting access only to one single PC via SSH keys.
- Network configuration   -  Adjusted the DHCP Reservation on the ISP router. Set static IPs and specifically DNS Server to ensure Local DNS via Pi-hole is working correctly with NPM.
- DNS / Pi-hole           -  Due to the limitation of the ISP router (only DNS Forwarding is available and router is unable to advertise DNS via DHCP), Local DNS requires static IP addressing on the end hosts.
- HTTPS / PKI             -  Nginx Proxy Manager provides secure SSL connection to the local services running via Docker. I created a private CA, Intermediate CA and SSL certificates accordingly.
- UFW and Firewalld       -  Firewall configuration on the Trixie OS (Pi server) and Fedora (PC) hosts.
- Backup automation       -  Scheduled backups scripts ensure that both documents and docker volumes are backed up nightly using the systemd units.
- Disaster recovery       -  In addition to the fully tested Ansible and Scheduled Backups, I have an offline SSD that is also used as a backup storage.
- Monitoring / alerting   -  Uptime Kuma is used for containers' health monitoring, Healthcheck.io for both Pi Server uptime and Backup scripts. Alerts are emailed to my inbox.
- Git                     -  Version-controlled infrastructure configuration and automation, with repositories maintained locally and pushed to private GitHub repositories.

# Networking Concepts Addressed
- IPv4 addressing and DHCP reservations configuration on Gateway side.
- DNS and DNS Forwarding addressed to implement Local DNS Server on the Pi-hole.
- SSH and firewall rules managed to ensure local network is securely managed and accessed by various devices and users.
- TCP/UDP and ports addressed as part of docker containers configuration and DNS setup.
- Reverse proxy and HTTPS implemented via Nginx Proxy Manager for the internal services to be accessed securely using private self-signed certificates.
- Network troubleshooting performed to identify DNS related issues on both Linux and Windows machines.
- VPN setup is the next step of the homelab improvements to avoid publicly exposing any services but still be able to access the home network.
- IPv6 is under consideration to expand Local DNS.
- VLAN segmentation will be implemented once necessary hardware is obtained. Especially, for the CCTV, to keep its traffic noise away from the main devices.
- Dedicated firewall appliance in addition to a new router is under consideration to harden the security.

# Current Hardware Limitations and Planned Improvements:
1. ISP Router limitations and lack of a Switch
The current ISP router does not support VLAN configuration or custom DNS server advertisement via DHCP. Therefore, homelab currently operates via wifi with several devices using the Static IPs.
Solution: new router and switch to implement VLAN segmentation and correct DHCP configuration.

2. Lack of Storage Redundancy
Solution: additional disks or NAS with RAID.

3. Lack of Compute Power
In order to expand on CCTV and use AI-driven CCTV software, a more powerful server is required.
Solution: a more powerful server hardware to support the extensive workloads.

For further software and hardware projects, please, see the homelab_description.md.
