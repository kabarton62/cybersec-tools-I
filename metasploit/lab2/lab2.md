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
sleep 10
nmap 172.17.0.0/24 -p-
```
Copy the above script. Create a file (i.e., build.sh) and paste the script. Run the script.

**Capture a screenshot of the nmap results**

## Challenge 2: distcc
1. Create a Meterpreter reverse shell. Use a Kali Linux that can catch the Meterpreter shell as the RHOST.
2. Prepare and start a Metasploit multi/handler on the RHOST.
3. Use the Metasploit-Frame work distcc exploit to:
- Transfer the Meterpreter reverse shell to Metasploitable2
- Change file permissions on the Meterpreter reverse shell
- Execute the Meterpreter reverse shell

**Capture screenshots that prove the Meterpreter reverse shell was transferred, had file permissions changed, and executed using the distcc exploit.**

## Challenge 3: Pivoting with Metasploitable2
Tomcat was reconfigured. TCP 8180 is listening on a single interface. We will use the session from the Metepreter shell we caught on the Metasploit multi/handler to pivot through Metasploitable2. _Pivoting_ refers to the process of using an exploited host to pivot network traffic through to discover and attack hosts that can only be reached from the exploited host.

The following shows an example. In this example, the Meterpreter shell is session 5. Your session will likely be different.
```
meterpreter > run autoroute -s 192.168.100.0/24

[!] Meterpreter scripts are deprecated. Try post/multi/manage/autoroute.
[!] Example: run post/multi/manage/autoroute OPTION=value [...]
[*] Adding a route to 192.168.100.0/255.255.255.0...
[-] Could not add route
[*] Use the -p option to list all active routes
meterpreter > run autoroute -p

[!] Meterpreter scripts are deprecated. Try post/multi/manage/autoroute.
[!] Example: run post/multi/manage/autoroute OPTION=value [...]

Active Routing Table
====================

   Subnet             Netmask            Gateway
   ------             -------            -------
   192.168.100.0      255.255.255.0      Session 5

meterpreter > 
```

Prepare a pivot. **The target SUBNET is 192.168.100.0/24.** You will see errors, but the command **run autoroute -p** should confirm that routing was added to 192.168.100.0/24.

**Background** your current session.

Next, use another Metasploit-Framework module, **auxiliary/scanner/portscan/tcp**, to run a port scan through the pivot. Two options need to be configured: **PORTS** and **RHOSTS**. Configure PORTS and RHOSTS as shown below.

```
msf6 auxiliary(scanner/portscan/tcp) > options

Module options (auxiliary/scanner/portscan/tcp):

   Name         Current Setting   Required  Description
   ----         ---------------   --------  -----------
   CONCURRENCY  10                yes       The number of concurrent ports to check per host
   DELAY        0                 yes       The delay between connections, per thread, in milli
                                            seconds
   JITTER       0                 yes       The delay jitter factor (maximum value by which to
                                            +/- DELAY) in milliseconds.
   PORTS        8180              yes       Ports to scan (e.g. 22-25,80,110-900)
   RHOSTS       192.168.100.0/24  yes       The target host(s), see https://github.com/rapid7/m
                                            etasploit-framework/wiki/Using-Metasploit
   THREADS      1                 yes       The number of concurrent threads (max one per host)
   TIMEOUT      1000              yes       The socket connect timeout in milliseconds
   ```
   **Run the port scan and capture a screenshot of the scan results**. The discovered host is the RHOST for tomcat.

### Challenge 4: Exploit tomcat through the Pivot
Recall that we previously used **exploit/multi/http/tomcat_mgr_upload** to exploit [CVE 2009-3548](https://nvd.nist.gov/vuln/detail/CVE-2009-3548). 

Exploit tomcat again, but recall that the RHOSTS must be the IP address discovered in the port scan.

**Capture a screenshot of the exploit against tomcat.**

### Challenge 5: Kill all Sessions
Use the command sessions -K to kill all sessions.

```
msf6 exploit(multi/http/tomcat_mgr_upload) > sessions -K
[*] Killing all sessions...
[*] 192.168.100.15 - Meterpreter session 2 closed.  Reason: Died
[*] 192.168.100.15 - Meterpreter session 2 closed.
[*] 172.17.0.3 - Meterpreter session 1 closed.
msf6 exploit(multi/http/tomcat_mgr_upload) > 
```
