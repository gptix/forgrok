#!/bin/bash
# pi-selective-backup.sh - Backup only important files before Hermes reinstall
# Run from X230

set -e

PI_HOST="hermes-pi"
TIMESTAMP=$(date +%Y%m%d-%H%M)
BACKUP_DIR="/home/gt-hermes/backups/hermes-pre-reinstall-${TIMESTAMP}"

echo "Creating selective backup on ${PI_HOST} → ${BACKUP_DIR}"

ssh "${PI_HOST}" "
  mkdir -p ${BACKUP_DIR}
  cp -a ~/.hermes ${BACKUP_DIR}/ 2>/dev/null || true
  cp -a ~/bin ${BACKUP_DIR}/ 2>/dev/null || true
  cp -a ~/.config/systemd ${BACKUP_DIR}/ 2>/dev/null || true
  cp -a ~/hermes ${BACKUP_DIR}/ 2>/dev/null || true
  # Add more paths from tree as needed
  tar -czf ${BACKUP_DIR}.tar.gz -C /home/gt-hermes backups/hermes-pre-reinstall-${TIMESTAMP}
  echo 'Backup completed on Pi.'
"

# Pull to laptop
mkdir -p ~/local-side/infrastructure/pi/hermes-pi/backups/
scp "${PI_HOST}:${BACKUP_DIR}.tar.gz" ~/local-side/infrastructure/pi/hermes-pi/backups/

echo "✅ Backup pulled to laptop!"
ls -lh ~/local-side/infrastructure/pi/hermes-pi/backups/
