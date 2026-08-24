# Homelab - General Description
Homelab is currently in progress and has not reached its potential even with the current hardware. There are many projects ahead to improve redundancy and extend functionality.

Purpose: 
- To provide a secure local-only services for my family. This currently include data (docs and photos) shared storage and backups, as well as, sync notes application.
- Additionally, Pi-hole is used to limit advertisement and tracking traffic.

# Hardware:
- Raspberry Pi 400   = main server
- External HDD       = main storage for data and docker volumes
- MicroSD            = Pi Trixie 64-bit OS and software storage (as well as backups)
- External SSD       = offline storage / backups
- ISP Router         = simple ISP provided router - no VLAN support, DNS setup allowed but treated as Forwarding
- PC (Fedora)        = main PC that is used to manage Pi Server via SSH (OS: Fedora), also runs Joplin application that syncs with the Joplin Server, as well as, has access to the FileBrowser to share data between devices
- Android Phone      = runs a Joplin application that syncs with the Joplin Server
- Laptop (Windows)   = runs a Joplin application that syncs with the Joplin Server, as well as, has access to the FileBrowser to share data between devices
- 2nd PC (Windows)   = partner's PC that has access to the FileBrowser to share and store data

# Software:
Security:
- OpenSSH >> connection only via certificates from my PC
- UFW
- Fail2Ban
- Nginx Proxy Manager 
  I generated self-signed certificates (CA - Intermediate CA - SSL certs) to ensure that Docker self-hosted services are reachable via HTTPS securely.
- (no services leave internal network, nothing is public-facing)

Docker Containers:
- Portainer           = container management
- Pi-hole             = DNS and ad-blocker
- Ngnix Proxy Manager = SSL with self-signed certificates
- Uptime Kuma         = monitoring
- Joplin Server       = notes that are synced between 3 devices
- File Browser        = storage share for all local devices
- Heimdall            = dashboard

See "docker" directory for files and documentation.

# Scheduled Backups Automation
Storage:
- External HDD as main storage for data and docker containers volumes
- MicroSD as OS and Docker Engine storage
- SSD as offline backup storage

Until further improvements added to the homelab, backups are performed locally between HDD and MicroSD, as MicroSD has enough memory. 
Additionally, offline backups are performed weekly using the SSD.

See "backups_scripts" directory for files and documentation.

# Monitoring
Uptime Kuma is set to monitor each containers' health. 

However, since Kuma is running on the same host, I have added a Healthcheck.io to monitor the uptime of the Pi Server itself.
The Healthcheck.io is also monitoring my nightly backups. 

Email Notifications are setup in case of alerts.

# Disaster Recovery - Ansible
Ansible playbooks created and fully tested during the re-imaging of the OS. 

See "ansible" directory for files and documentation.

# Improvements & Projects
Projects for the current hardware:
1. Implement VPN to allow access outside local network.
2. Implement backups log and "previous files" rotation to avoid filling up the disk.
3. Add Grafana or similar monitoring tool for disk usage monitoring.
4. Add scheduled filesystem and hardware health checks.
5. Add scheduled apt updates and upgrades.
6. Add CCTV software (currently I have only one CCTV camera though).

New hardware projects:
1. Replace the ISP router and purchase a switch - setup VLANs and Static DNS via DHCP (current limitation forces to setup static DNS addresses directly on the hosts).
2. Purchase more storage - setup RAID mirroring at least. Perhaps NAS.
3. Expand CCTV cameras and put them on a separate VLAN.
