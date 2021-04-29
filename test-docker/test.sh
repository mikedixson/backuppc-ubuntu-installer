#! /bin/sh

# Requirements: Docker, port 8080 available, name 'bpc' available, curl

NAME=bpc

docker rm  -f $NAME  2>/dev/null
docker rmi -f $NAME  2>/dev/null

cp ../backuppc-ubuntu-installer .
docker build  --build-arg BPC_UID="1000" --build-arg BPC_PASS="somepass" --tag $NAME .
rm backuppc-ubuntu-installer

docker run  --name=$NAME -p 8080:80 -d $NAME

sleep 10
curl -sS -i -w "%{http_code}" "http://backuppc:somepass@127.0.0.1:8080/BackupPC_Admin" -o /dev/null
