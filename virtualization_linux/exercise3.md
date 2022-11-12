# <img src="https://www.tamusa.edu/brandguide/jpeglogos/tamusa_final_logo_bw1.jpg" width="100" height="50"> GCP ssh keys

## Overview
### Objective: 
Create ssh-rsa keys and add the public key to GCP.  Create a GCP Compute Engine instance.

### Discussion: 
You will complete labs in this and other TAMU-SA computer information systems courses in GCP. GCP is a cloud-hosted environment with virtual Linux server instances. An instance is a single, unique virtual machine within a cloud environment. GCP instances do not have graphical user interfaces (GUIs). Therefore, you will access and interact with the servers using ssh. Ssh will be introduced in the next class exercise. The goal for this exercise is to create a GCP account and apply an education grant to fund the GCP project for the semester.

### This exercise will guide you through: 
1. Creation of public/private key pairs for ssh authentication.
2. Adding the public key to GCP Compute Engine Metadata. 
3. Connecting to your instance using SSH, both through the GCP Console and with a SSH client.

### Resources:  

Storage device for public/private key pair 

### Summary of Procedures:  

1. Create a GCP Compute Engine Instance.
2. Verify that you can connect to the instance using the GCP console ssh web interface and by a ssh client. 

## Procedures:
### Challenge 1:  Create a GCP Compute Engine instance

1. Select **menu bars > Compute Engine > VM instances**.
2. Click **Create Instance**.
  - Name your instance
  - Change the size to micro
  - Change the **Boot disk**. 
    - Select **Ubuntu 20.04 LTS**. 
  - Configure a static external IP address (preferred for OpenVPN server which will be installed later)
    - Click Advanced options 
    - select **Networking**
    - Under Network Interfaces, click **default**
    - Click the drop-down under **External IPv4 address**
    - Click **Create IP address** and follow the prompt
  - You can customize other configurations if you like, or use the default settings. 

### Challenge 2: Generate and Secure a Public/Private Key Pair 

1. Open a terminal on your computer. 
2. Run the command ssh-keygen.  
3. You will be prompted for a filename and password. A default location and filename (/homedir/.ssh/id_rsa) will be offered. Note that location and filename or configure your own. 
4. You will be prompted for a password. Setting a password is recommended. Use a password you will remember or save it securely. The password is required to use the private key. 

```
fakeuser@demo1:~$ ssh-keygen

Generating public/private rsa key pair.
Enter file in which to save the key (/home/fakeuser/.ssh/id_rsa): 
Created directory '/home/fakeuser/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/fakeuser/.ssh/id_rsa
Your public key has been saved in /home/fakeuser/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:TRwssb3dWJyzOg2BHoy0slExVpjBvUK9XBYnBCSGs94 fakeuser@demo1
The key's randomart image is:
+---[RSA 3072]----+
|       o@%=o+..  |
|      o=*X+oo+ . |
|      o++oB=. =  |
|      .+.+++ = o |
|     ...S.+ + o  |
|      . E    +   |
|            o .  |
|             .   |
|                 |
+----[SHA256]-----+

fakeuser@demo1:~$ 
```
Two files will be created. In this example, 
- id_rsa is the **private key**
- id_rsa.pub is the **public key.**

### Challenge 3: Configure your Username 

1. The end of the public key contains the username. In the example below, the username is **fakeuser**. That username will likely be the username for the account used to create the key pair but can be changed to whatever you like. 
2. Edit the public key to set the username to whatever you like. 

```
fakeuser@demo1:~$ cat .ssh/id_rsa.pub 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCxpjju02MG4UvgJlPhEO2X/i93sSrSl8XwSP7i0Q5KGR3vQwxYgoSHJnRqU74p91Y1G0LpKh+DN80mQi014N0rdyJWNHB1VQcAo32qhELOwhX6QfUSXsnsltrYqPF+8mkdpfZprC63Z8jAtk9Twjd6XpGBmY0qbM2+3Lf3MDg0w+bg5EG5MKDEdred6DtZHh72nyPlYF4p0gF8FPjRGy3C/f0CSIw279UO8jcdF8fSgQ/eKQbZTwsGyK8wBvcqIMyR/KRsBOhp/4fiOhqt9T+LByfStewTftJM5crcmOzuN5V14XeS+FUtW+xqv2Et60lMkBHbnYkqYu/cGRiUGZuB0IwxnpZ3SMpROJI6ZyRjWPwebssAePbr/d3L7cSD2lb3Faglq1PxHTcB7JjhrRvgwD01qEUS6NzZnpHKF+5LZtoZl+JiZDjTzM5VRhd2hkt8WI/G5KaS/ag+Zt8andKVsrncl9KwgLJk+XMcciS+/FjN9ahL6eKEes7vnN479Fc= fakeuser@demo1
```

### Challenge 4: Post the Public Key in Compute Engine Metadata

1. Select the **menu bars > Compute Engine > Metadata**. Select the **SSH Keys** tab > **Edit**.
2. Add your public key to SSH keys. Ensure that the username matches your GCP account username. This ensures that you have just one account on your GCP instances.

### Challenge 5: Connect to GCP Compute Engine Instance with SSH using the GCP Console

1. Open the GCP console.
2. In the GCP console open SSH in the Web interface by clicking the SSH button next to the external IP address.
3. **Capture a screenshot of your SSH connection.**

### Challenge 6:  Connect to GCP Compute Engine Instance with SSH using the GCP Console

1. Open a terminal on your computer.
2. Capture a screenshot of the SSH connection using the web interface.
3. Connect to the instance from the command line using:
```
ssh -i /path/to/private-key username@ip-address

example:

ssh -i /home/kbarton/id_rsa kbarton@35.100.100.10
```

4. **Capture a screenshoot of the SSH connection with your SSH client.**

