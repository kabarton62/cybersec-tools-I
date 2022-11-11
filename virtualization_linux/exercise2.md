# <img src="https://www.tamusa.edu/brandguide/jpeglogos/tamusa_final_logo_bw1.jpg" width="100" height="50"> Google Cloud Platform (GCP)

## Overview
### Objective: 
Create GCP account and claim GCP education grant credit.  Create public/private keys. Create a GCP Compute Engine instance.

### Discussion: 
You will complete labs in this and other TAMU-SA computer information systems courses in GCP. GCP is a cloud-hosted environment with virtual Linux server instances. An instance is a single, unique virtual machine within a cloud environment. GCP instances do not have graphical user interfaces (GUIs). Therefore, you will access and interact with the servers using ssh. Ssh will be introduced in the next class exercise. The goal for this exercise is to create a GCP account and apply an education grant to fund the GCP project for the semester.

### This exercise will guide you through: 
1. Creating a GCP account.
2. Claiming a GCP Education Grant coupon.
3. Adding the public key to GCP Compute Engine Metadata. 
4. Creation of public/private key pairs for ssh authentication.
5. Adding the public key to GCP Compute Engine Metadata. 
6. Connecting to your instance using SSH, both through the GCP Console and with a SSH client.

### Resources:  

N/A

### Summary of Procedures:  

1. Create a GCP account.
2. Claim a GCP Education Grant coupon.
3. Create a GCP Compute Engine Instance.
4. Verify that you can connect to the instance using the GCP console ssh web interface and by a ssh client. 

## Procedures:
### Challenge 1: Create a GCP account
If you do not already have a Google account, create a Google account here. You can use your Jaguar email or any other email of your preference.
Verify that you can log into GCP Console at https://console.cloud.google.com.
Create a project. You may have a default project which you could use if that is your preference.

### Challenge 2: Claim a GCP Education Grant coupon
You will receive an email from the instructor to claim your GCP Education Grant coupon. Click on the provided link.
The coupon will only be issued to your Jaguar email. You will receive an email from Google with a coupon code and a link to redeem the coupon for credit.
Follow the link to https://console.cloud.google.com/education. At this point, you can change the account that the coupon is applied to. If your GCP account is tied to your Jaguar email, then you are set. If you account is tied to another email, follow the instructions on the page to change accounts for applying the credit.
At this point you have credits, now change the billing for one or more projects. Select the **menu bars > Billing > Manage Billing Accounts**. You will see the coupon and a tab for MY PROJECTS. Select **MY PROJECTS**, and for each project you want to change billing for, select **Actions > Change billing**.

### Challenge 3:  Create a GCP Compute Engine instance

Select **menu bars > Compute Engine > VM instances**.
Click **Create Instance**.
Name your instance
Change the size to micro
Select an OS of your choice (Ubuntu 20.04 LTS recommended). Pay attention to the OS you choose, some OS's are free, others are expensive.
Configure a static external IP address (preferred for OpenVPN server which will be installed later)
You can customize other configurations if you like, or use the default settings. 

### Challenge 4: Generate and Secure a Public/Private Key Pair 

Open a terminal on your computer. 

Run the command ssh-keygen.  

You will be prompted for a filename and password. A default location and filename (/homedir/.ssh/id_rsa) will be offered. Note that location and filename or configure your own. 

You will be prompted for a password. Setting a password is recommended. Use a password you will remember or save it securely. The password is required to use the private key. 

**Two files will be created. In this example, id_rsa is the private key and id_rsa.pub is the public key.**

### Challenge 5: Configure your Username 

The end of the public key contains the username. In the example below, the username will be kbarton. That username will likely be the username for the account used to create the key pair but can be configured to whatever you like. 

Edit the public key to set the username to whatever you like. 

### Challenge 6: Post the Public Key in Compute Engine Metadata

Select the **menu bars > Compute Engine > Metadata**. Select the **SSH Keys** tab > **Edit**.

Add your public key to SSH keys. Ensure that the username matches your GCP account username. This ensures that you have just one account on your GCP instances.

### Challenge 7: Connect to GCP Compute Engine Instance with SSH using the GCP Console

Open the GCP console.

In the GCP console open SSH in the Web interface by clicking the SSH button next to the external IP address.

**Action: Capture a screenshot of your SSH connection.**

### Challenge 8:  Connect to GCP Compute Engine Instance with SSH using the GCP Console

Open a terminal on your computer.

Capture a screenshot of the SSH connection using the web interface.

Connect to the instance from the command line using:
```
ssh -i /path/to/private-key username@ip-address

example:

ssh -i /home/kbarton/id_rsa kbarton@35.100.100.10
```

**Action: Capture a screenshoot of the SSH connection with your SSH client. **