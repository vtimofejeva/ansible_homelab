Docker Containers - Homelab

Public repo for my docker compose files. Sensitive details removed from the files (mainly, ports).

Homelab is currently small - running one Raspberry Pi 400 as a server, plus External HDD as main storage, MicroSD as OS storage, SSD as offline backup storage. 
Until further improvements added to the homelab, there is no redundancy for the containers, but there are backups and monitoring implemented.

# Services provided via Docker Containers:
    Portainer           = container management
    Pi-hole             = DNS
    Ngnix Proxy Manager = SSL with self-signed certificates
    Uptime Kuma         = monitoring
    Joplin Server       = notes that are synced between 3 devices
    File Browser        = storage share for all local devices
    Heimdall            = dashboard

# Backups:
Whilst OS and Docker Engine are stored on the MicroSD, data and Docker volumes are stored on the external hard drive. 

Scheduled Backups of the containers' volumes run nightly between external HDD and MicroSD. Additionally, there are offline backups available on a separate SSD. 
See backups directory for scripts and documentation.

# Shared Docker Network
To provide smooth usage of SSL Certificates on Nginx Proxy Manager, I put all containers on the same bridged docker shared network - homenet. 
This allows NPM to communicate with the containers directly, without leaving the docker internal network to reach DNS etc.
Also, it simplifies the setup in case of IP changes.

Side note: 
- Joplin Server compose file hard-codes the IP address so I haven't found a workaround yet - it doesn't have a domain name, so it can sync all my devices until a more secure solution is found.

# Monitoring
Uptime Kuma is set to monitor each containers health. 
However, since Kuma is running on the same host, I have added a Healthcheck.io to monitor the uptime of the Pi Server itself.
(the Healthcheck.io is also monitoring my nightly backups).
Email Notifications are setup in case of alerts.
