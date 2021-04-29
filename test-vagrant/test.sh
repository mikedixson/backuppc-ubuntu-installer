#! /bin/sh

# Requirements: Vagrant, VirtualBox, VBox Host Network configured (here is 10.17.x.x), VBox Host Network IP available (here is 10.17.17.17), curl

vagrant destroy -f 2>/dev/null
vagrant up

sleep 10
curl -sS -i -w "%{http_code}" "http://backuppc:somepass@10.17.17.17:80/BackupPC_Admin" -o /dev/null
