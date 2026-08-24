# Scheduled Backups Automation - Homelab
Public repo for my homelab automated backups. Sensitive details removed from the files.

Homelab hardware is currently limited - running one Raspberry Pi 400 as a server. 
Storage:
- External HDD as main storage for data and docker containers volumes
- MicroSD as OS and Docker Engine storage
- SSD as offline backup storage

Until further improvements added to the homelab, backups are performed locally between HDD and MicroSD, as MicroSD has enough memory. 
Additionally, offline backups are performed weekly using the SSD.

# Scheduled Backups are between external HDD and MicroSD
Two automated scripts run nightly to backup:
- data / docs
- docker containers volumes
Automation achieved via systemd service and timer units.

# DR Note:
1. In case MicroSD fails, a simple MicroSD swap and imaging is required to restore services. 
2. In case of the HDD failure, the SSD can be used until new hard drive is obtained.

# External Storage Structure (HDD and SSD)
Main directory: /media/external_drive/

storage/
- documents/
- photos/

homelab/
- ansible/
- ssh_keys/
- configs/
- selfsigned_certs/
- docker/containers/
