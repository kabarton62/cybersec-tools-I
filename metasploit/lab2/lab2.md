# <img src="https://www.tamusa.edu/brandguide/jpeglogos/tamusa_final_logo_bw1.jpg" width="100" height="50"> 
# Metasploitable II

## Challenge 1: Deploy the Lab
The following script prepares a custom Metasploitable2. Copy the script and run it or run the commands individually.
```
#!/bin/bash
cd ~
mkdir metasploitable2
mkdir metasploitable2/tomcat
cd ~/metasploitable2
wget https://raw.githubusercontent.com/kabarton62/cybersec-tools-I/main/metasploit/lab2/deploy.sh
wget -P ~/metasploitable2/tomcat https://raw.githubusercontent.com/kabarton62/cybersec-tools-I/main/metasploit/lab2/tomcat/server.xml
bash deploy.sh
nmap 172.17.0.0/24
```
**Capture a screenshot of the nmap results**

## Challenge 2:
