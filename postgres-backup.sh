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

backup_dump="pg_dump_$date_dir.dump"

cd /tmp
sudo -u postgres -H -- rm -rf $backup_dump

echo ""
echo ">>> Creating database dump at '$backup_dump'"
sudo -u postgres -H -- pg_dump -F c $db_name > $backup_dump

echo ""
echo ">>>"
ls -l $backup_dump
echo ""
