#!/bin/bash
docker='/usr/bin/sudo /usr/bin/docker'
f=docker-compose.yml
web='tleemcjr/metasploitable2:latest'
wname='metasploitable'
webip='172.19.2.3'

printf "\nBe patient. Stopping and deleting metasploitable.\n\n"

# Deploy metasploitable2
$docker stop metasploitable && $docker rm metasploitable
$docker run --name $wname -it -d tleemcjr/metasploitable2:latest sh -c "/bin/services.sh && bash"

printf "\nCreating a new metasploitable.\n\n"

# create a new docker network and attach metasploitable2
$docker network rm hidden
$docker network create -d bridge hidden --subnet 192.168.100.0/24
$docker network connect --ip 192.168.100.15 hidden metasploitable

printf "\nChanging configuration for tomcat.\n\n"
# configure tomcat
$docker cp ./tomcat/server.xml $wname:/etc/tomcat5.5/server.xml
$docker exec -it $wname service tomcat5.5 restart 
