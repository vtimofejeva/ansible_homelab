# DR - Ansible - Homelab
Public Ansible playbooks repo for my homelab. Sensitive details removed from the playbooks.

Homelab is currently small - running one Raspberry Pi 400 as a server, plus External HDD as main storage, MicroSD as OS storage, SSD as offline backup storage.
Until further improvements added to the homelab, Ansible playbooks focus on Disaster Recovery for my Pi Server. 

# Services provided via Docker Containers:
- Portainer = container management
- Pi-hole = DNS
- Ngnix Proxy Manager = SSL with self-signed certificates
- Uptime Kuma = monitoring
- Joplin Server = notes that are synced between 3 devices
- File Browser = storage share for all local devices
- Heimdall = dashboard

# Scheduled Backups are between external HDD and MicroSD
Two automated scripts run nightly to backup:
- data / docs
- containers volumes

Whilst OS and Docker Engine are stored on the MicroSD, data and Docker volumes are stored on the external hard drive. Data from the external HDD is also backed up offline onto SSD. 
1. In case MicroSD fails, a simple MicroSD swap and imaging is required to restore services. 
2. In case of the HDD failure, the SSD can be used until new hard drive is obtained.

# Complete Raspberry Pi DR provisioning - *00_master.yml* triggers 7 other playbooks:

01_bootstrap.yml
--> Basic OS configuration - apt updates, hostname, hosts, locale, timezone, software installation, journald persistent logging, user creation, SSH setup, static IP setup, UFW config

02_mount.yml 
--> External storage mounting - create mountpoint and /etc/fstab entry

03_fail2ban.yml
--> Fail2ban setup - install and restore the original config jail.local

04_docker.yml
--> Docker Engine installation - download and install Docker, add user to the docker group, create docker shared network for containers

05_containers.yml
--> Containers initialization from the external drive, that contains both docker compose files and actual backed volumes

06_backups.yml
--> Scheduled backups setup - back up data from external drive onto MicroSD, copy backup shell scripts and automation (service and timer) units to the appropriate locations

07_finaltouch.yml
--> Setup finalization - set static DNS (since Pihole container is up), copy SSH Github keys and set correct permissions, setup Github config, reboot the server

# Ansible Files Structure
Directory: homelab/ansible/
                            00_master.yml
                            01_bootstrap.yml
                            02_mount.yml
                            03_fail2ban.yml
                            04_docker.yml
                            05_containers.yml
                            06_backups.yml
                            07_finaltouch.yml
                            ansible.cfg
                            inventory
                            templates/
                                      hosts.j2
                                      jail.local.j2

# External Storage Structure (HDD and SSD)
 /media/external_drive/
                       storage/
                              documents/
                                        vtimofejeva/
                                        cdoyle/
                              photos/
                        homelab/
                              ansible/
                              ssh_keys/
                              configs/
                              selfsigned_certs/
                              docker/
                                        containers/

# Steps Required Before Running Ansible Playbook
1. On Router / Gateway disable the DNS Forwarding - set back to Automatic
2. On PC (Fedora) enable the DHCP and remove static DNS server
3. Using Pi Imager prepare the MicroSD and install the OS
4. Setup a new user if prompted on the Pi Server
5. Ensure OpenSSH is Running on the Pi Server
6. On main PC (Fedora) - delete the old Host Keys (ssh-keygen -R x.x.x.x)
7. Verify PC and Ansible reaches the Pi (ansible all -m ping)
8. Perform a dry run (ansible-playbook 00_master.yml --ask-become-pass --check)
9. Run the main playbook (ansible-playbook --ask-become-pass --ask-pass 00_master.yml)
10. On Router / Gateway enable the DNS Forwarding - point at the Pihole address
11. On PC (Fedora) set static IP and point DNS at Pihole
