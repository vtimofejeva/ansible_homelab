#!/bin/bash
backup_mount="/media/external_drive/"
backup_src="$backup_mount/homelab/docker/containers/"
backup_dest="/home/__username__/backups/docker/containers/"
current_date=$(date +%Y-%m-%d)
log_path="/home/__username__/backups/docker/containers/logs"
#previous_files="/home/__username__/backups/docker/containers/previous_files/$current_date"

healthcheck_url="https://hc-ping.com/_________"

#safety check
if ! mountpoint -q "$backup_mount"; then
    echo "Backups directory is not mounted - exiting!"
    exit 1
fi

#create required dirs
mkdir -p "$log_path"
#mkdir -p "$previous_files"

#run rsync
rsync -av --delete-after "$backup_src" "$backup_dest" \
> "$log_path/docker_backup_$current_date.log" \
2> "$log_path/docker_backup_${current_date}_error.log"

#Monitor if backup worked
if [ $? -eq 0 ]; then
    curl -fsS "$healthcheck_url" > /dev/null
fi
