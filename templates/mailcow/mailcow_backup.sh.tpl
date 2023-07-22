#! /bin/sh
export MAILCOW_BACKUP_LOCATION=${mailcow_backup_path}
rm -rvf ${mailcow_backup_path}/mailcow-*
${mailcow_install_path}/helper-scripts/backup_and_restore.sh backup all
mv ${mailcow_backup_path}/mailcow-* ${mailcow_backup_path}/mailcow-current