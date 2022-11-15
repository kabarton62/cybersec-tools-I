<img src="https://www.tamusa.edu/brandguide/jpeglogos/tamusa_final_logo_bw1.jpg" width="200" height="100"> 

# Google Cloud Platform (GCP) Set-up

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
1. If you do not already have a Google account, create a Google account here. You can use your Jaguar email or any other email of your preference.
2. Verify that you can log into GCP Console at https://console.cloud.google.com.
3. Create a project. You may have a default project which you could use if that is your preference.

### Challenge 2: Claim a GCP Education Grant coupon
1. You will receive an email from the instructor to claim your GCP Education Grant coupon. Click on the provided link.
2. The coupon will only be issued to your Jaguar email. You will receive an email from Google with a coupon code and a link to redeem the coupon for credit.
3. Follow the link to https://console.cloud.google.com/education. At this point, you can change the account that the coupon is applied to. If your GCP account is tied to your Jaguar email, then you are set. If you account is tied to another email, follow the instructions on the page to change accounts for applying the credit.
4. At this point you have credits, now change the billing for one or more projects. 
  - Select the **menu bars > Billing > Manage Billing Accounts**. 
  - You will see the coupon and a tab for MY PROJECTS. Select **MY PROJECTS**, and for each project you want to change billing for, select **Actions > Change billing**.

### Challenge 3:  Create a GCP Compute Engine instance

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

### Challenge 4: Extra-mile
1. Once the instance is running, open a Web terminal by clicking the SSH button. When the terminal opens, run the **id** command we used in Labtainer VM.
2. **Capture a screenshot of the results of the _id_ command**.

