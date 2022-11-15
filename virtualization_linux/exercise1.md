<img src="https://www.tamusa.edu/brandguide/jpeglogos/tamusa_final_logo_bw1.jpg" width="200" height="100"> 

# Web Applications

## VMware, Virtualbox & Labtainer
### Assumptions
This exercise assumes you have already installed VMware or VirtualBox. If you have not installed either hypervisor, install either VMware Workstation, Fusion or Player or VirtualBox. I recommend VMware Workstation or Fusion, but you may have a strong preference for VMware Player or VirtualBox. Either of those will work, but remember that class exercises and labs are written for VMware. You will have to adapt the instructions to VirtualBox if you choose to use VirtualBox.

### Directions
Download the Labtainer VM. Labtainer has preconfigured cyber security labs using Docker technology in an Ubuntu VM. Ubuntu is a Linux distribution. The labs are great for learning, but this particular VM was selected because:
1. It is a pre-built VM with downloads for VMware and VirtualBox
2. It is pre-configured with Docker and docker-compose

### Challenge 1: Deploy a VM from the Labtainer download. 
Labtainer downloads as an Open Virtual Appliance (OVA), .ova file extension. An OVA contains the resources needed to deploy a pre-configured virtual machine. Those resources include configuration files and virtual hard drive.

### Challenge 2: Launch VMware Workstation.
1. Click **File > Open**.
2. Browse to the Labtainer download, labtainer.ova and click Open.
3. Expect a pop-up, then click **Import**. 
4. Verify the Labtainer VM is created in VMware Workstation's library (that bar on the left side with the label Library). The name should be something like LabtainerVM-VMware.

### Challenge 3: Examine the VM settings. 
There is no immediate need to modify this VM, but there will be sometime in the future that you when you need to edit VM settings. 
1. ight-click the Labtainer VM, select **Settings**.
2. Examine the hardware settings (the default tab is **Hardware**).
3. Note that the hardware settings can be modified.
4. Select the **Options** tab.
5. Note the **Working directory**. VMs are nothing more than a set of files. The files that are the VM guest are stored in the Working directory. 
6. Open File Explorer and navigate to the Working directory.
7. **Capture a screenshot of the Working directory and its contents.**
8. Close the Settings pop-up.
### Examine the VM Configuration File. 
There are rare times when you may need to edit a VM. Now is a good time to explore the configuration file.
1. Note the .vmx file in the Working directory, the .vmx file is a configuration file. The configuration file is a text file and can be read with any text editor, such as Notepad.
2. Open LabtainerVM-VMWare.vmx (or whatever the actual file name is for the configuration file) with Notepad or some other text editor.
3. **Capture a screenshot of the contents of the configuration file.**

### Challenge 4: Start Labtainer VM. At this point, you should be able to start the Labtainer VM. 
1. There are at least three ways to start a VM.
- Right-click the VM name, click **Power > Start Up Guest**
- Select the VM name, on the VM's tab, select **Power on this virtual machine**
- Select the VM name, on the menu bar, click that big green triangle
2. Labtainer will boot after you power it on. Let Labtainer finish booting. Once booted, you will see a terminal with a prompt for **student@ubuntu**. That is proof you are running.
- Let's run a command. The command id will return information about the current user. Enter the command id in the terminal and hit Enter.
- Take a screenshot of the VM, with terminal, show the results from the id command.
### Challenge 5: Power off the VM. 
1. There are at least two ways to power of the VM. See if you can figure it out. Think about how you powered it on.
2. As you explore how to power off the VM, you will see an option to **Suspend Guest**. Sometimes you want to retain the current state of a machine but be able to power of the host. Suspending the guest pauses a running machine without powering it down. The host can be powered off and then eventually powered back on. Resuming a suspended guest restores the state of the VM guest at the time it was suspended.
