/usr/bin/sudo /usr/bin/docker build -t python2:latest .

/usr/bin/sudo /usr/bin/docker run -itd --name python --hostname python python2:latest
