#! /bin/bash
export MAILCOW_BACKUP_LOCATION=${mailcow_backup_path}
echo -e "1\n0" | ${mailcow_install_path}/helper-scripts/backup_and_restore.sh restore