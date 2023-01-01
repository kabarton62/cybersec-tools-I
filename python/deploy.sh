/usr/bin/sudo /usr/bin/docker build -t python2:latest .

/usr/bin/sudo /usr/bin/docker run -itd -v scripts:/root/ --name python --hostname python python2:latest
/usr/bin/sudo /usr/bin/docker exec -it python apt update && apt install nano
/usr/bin/sudo /usr/bin/docker exec -it python pip install sh
