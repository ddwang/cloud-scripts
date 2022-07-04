#!/bin/sh
set -e

if [ -z "$1" ]
  then
	echo ""
    echo "Usage: $0 <database_name>"
	echo ""
	exit 1
fi

db_name=$1
  
date_dir="$(date +'%Y-%m-%d')"

backup_dir="influxd_backup_$date_dir"
backup_tar="influxd_backup_$date_dir.tar"

cd /tmp
sudo -u influxdb -H -- rm -rf $backup_dir
sudo -u influxdb -H -- rm -rf $backup_tar

echo ""
echo ">>> Creating portable backup at '$backup_dir'"
sudo -u influxdb -H -- influxd backup -portable -db $db_name $backup_dir

echo ""
echo ">>> Creating tar file '$backup_tar'"
sudo -u influxdb -H -- tar cvf "$backup_tar" $backup_dir

echo ""
echo ">>>"
ls -l $backup_tar
echo ""
