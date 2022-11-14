# <img src="https://www.tamusa.edu/brandguide/jpeglogos/tamusa_final_logo_bw1.jpg" width="100" height="50"> 
# Linux Introduction

## Challenge 1: Understanding the root user
The root user has privileges to create, read, write, edit or delete any file or directory in a Linux system. Root also has privileges to execute all commands on a Linux system. Administrators of Linux systems must be able to elevate user privileges to root, as well as understand the security risks associated with root privileges. This lab will demonstrate two methods to access root privileges, using the commands sudo and sudo su. The command sudo is useful when just one or two commands need to be executed with root, while sudo su is useful when multiple commands are expected. The prompt “$” indicates user mode (not root), while the prompt “#” indicates root.

The /etc/shadow file stores encrypted passwords and additional password information for all user accounts. Root is required to read /etc/shadow. We will
use this file to demonstrate root function. You will read content from the shadow file and store it to a new file. Additional information will be added to file throughout lab, and the file will be submitted in Blackboard. You will also maintain and submit lab notes. 

Complete the following commands and record the results in lab notes. The command **cat** is used to read the text from a file. The prompt **user@host:~$**
reflects the user account executing the command, the hostname, and that the user is in user mode. We will also use the **ls** and **grep** commands and three types of pipes (| , > and >>). The pipe **|** feeds the output from one command into another. The grep command searches for a specified text string. The pipe > reads the output from the command to a file, while the pipe >> appends the output to a file without overwriting existing content in the file. **The file lab1 results.txt needs to be created in your home directory, so replace your-username in the file path below to your username. Do not copy “your-username”**.

```
user@host:~$ ls
user@host:~$ cat /etc/shadow
```
Observe the results from cat /etc/shadow. You should expect an error that says permission was denied. Permission was denied because only root users can read the file /etc/shadow. The next command invokes root privileges to read the same file. Observe the difference when the same command, cat /etc/shadow, is executed with root privileges.

```
user@host:~$ sudo cat /etc/shadow
user@host:~$ sudo cat /etc/shadow | grep mysql
user@host:~$ sudo su
root@host:~# cat /etc/shadow
root@host:~# cat /etc/shadow | grep mysql > /home/yourusername/lab1-results.txt
root@host:~# chown your-username:your-username /home/yourusername/lab1-results.txt
root@host:~# exit
user@host:~$ ls
user@host:~$ cat lab1-results.txt
```

## Challenge 2: Navigating Directories
This section introduces the cd command and provides practice using cd with various shortcuts. The **~** represents the users home directory and can be used as a shortcut to move to the user’s home directory from anywhere in the directory tree. The shortcut .. is used to move up one directory. Both shortcuts can be combined with other strings to move through the directory tree. You will also use additional options of the ls (list) command and practice with the pwd (present working directory) command. The pwd command list the current directory. The tab button can be used to auto-complete directory and file names. Using the tab button not only speeds up navigation through the file structure, but also reduces the likeliness of typing or spelling errors. One thing … capitalization matters in Linux. Uppercase and lowercase always mean different things, do not interchange them. Things just will not work.

```
user@host:~$ printf "Navigating\n\n" >> lab1.txt
user@host:~$ pwd
user@host:~$ cd ..
user@host:~$ pwd
user@host:~$ cd /home/ubuntu
user@host:~$ sudo su
root@host:~# pwd >> /home/your-username/lab1-results.txt
root@host:~# exit
user@host:~$ cd ~
user@host:~$ pwd >> lab1-results.txt
```

## Challenge 3: Finding Files and Directories
You may sometimes struggle to find a file or directory. If it’s a system file or directory, an Internet search can usually help. However, a Google search won’t likely help you find a directory created by a user or a data file. Fortunately, you can search the file system with find. This section will demonstrate how to find a file or directory using find. It will also introduce you to the help option and man pages. 

Most commands have a either help or man pages, or both. When all else fails, use a command’s help option or man page for guidance on how to use that command. Help will usually be shown using the options -h and/or --help. Man pages can normally be accessed using **man** command. For example, **man pwd**. Exit a man page using the “**q**” key. The command **find** uses the **--help** option, not -h. The nmap command will be used to demonstrate the **-h** option. We will use the find command to search for the file lab1-results.txt. Report the results in your lab notes and offer an explanation why the different commands gave different results.

```
user@host:~$ cd /home/ubuntu
user@host:~$ man find
user@host:~$ q
user@host:~$ find –-help
user@host:~$ nmap -h
user@host:~$ find -name lab1-results.txt
user@host:~$ sudo find -name lab1-results.txt
user@host:~$ sudo find /home -name lab1-results.txt
user@host:~$ sudo find / -name lab1-results.txt
user@host:~$ sudo find /etc -name lab1-results.txt
```

The command **locate** is also useful for finding files. Locate maintains a database of all files. That database updates periodically, but can also be updated manually using the **updatedb** command. These commands are demonstrated below. Next, attempt to find a file that we know exists. It may not be found. We then  update the database, and use **locate** again to search for the file. The command locate is convenient because it searches the entire file system, not just the directory and subdirectories of current working directory.

```
user@host:~$ locate lab1-results.txt
user@host:~$ sudo updatedb
user@host:~$ locate lab1-results.txt
```

## Challenge 4: Reading, Creating, Editing, and Deleting Directories and Files
This section will introduce the commands **cat**, **nano** and **rm**. **cat** reads a file. Linux distributions ship with at least one text editor. Common text editors include **nano**, **vi**, **vim** and **gedit**. **gedit** is a GUI based editor, and is common in Linux desktop distributions. However, the GCP instance you are working with is a server, so does not support GUI based tools or applications. You will practice with **nano**. Note, you begin this section in a directory other than your home directory. Therefore, you must provide the full file path to write to files in your home directory. Include ~/ as a shortcut to the full file path of your home directory (the full file path would be /home/username/lab1-results.txt, the
shortcut is ~/lab1-results.txt).

Use a text editor, **nano**, to create and edit a new file. After reading the file with **cat**, delete the file using **rm**. Note, Linux does not recognize spaces in a filename without the use of quotation marks. For example, **nano new file.txt** would not create a single file named new file.txt, but instead create two files, **new** and **file.txt**. nano "new file.txt" would create a single file named **new file.txt**. 

Directories are created with **mkdir**. Files and directories can be hidden by placing a period before the file or directory name. You will create visible and hidden directories in this section.

```
user@host:~$ printf "Create/Edit Files/Dir\n\n" >> ~/lab1-results.txt
user@host:~$ mkdir ~/newdir
user@host:~$ mkdir ~/.hiddendir
user@host:~$ ls ~
user@host:~$ ls -a ~
```

Compare the results from the two previous commands. Note the hidden directories and
files are listed using the **-a** option with the command **ls**.

The next step creates and opens a file in the user’s home directory with nano.

```
user@host:~$ nano ~/new-file.txt
```

Enter the following sentence:

**The quick brown fox jumped over the lazy dog.**

To exit **nano**, press **CTRL-x**, select **Y** to save the file, then enter to confirm the filename. Note, the command **rm** removes files and directories. The command below deletes a specific file in your home directory. DO NOT ADD SPACES in the file path.

```
user@host:~$ ls ~
user@host:~$ ls ~ >> ~/lab1-results.txt
user@host:~$ cat ~/new-file.txt
user@host:~$ cat ~/new-file.txt >> ~/lab1-results.txt
user@host:~$ rm ~/new-file.txt
user@host:~$ ls -a ~
user@host:~$ ls -a ~ >> ~/lab1-results.txt
```

## Challenge 5: Copying and Moving Directories and Files
There is no GUI, so there is no cut and paste when copying files. Instead, use the command **cp** and **mv**. Command **cp** is copy, **mv** is move. Either individual files or entire directories can be copied or moved. A set of files with common features, such as the same file extension or text string, can also be copied or moved using wildcards, and files can be renamed in the process.

```
user@host:~$ printf "Copy/Move Files/Dir\n\n" >> ~/lab1-results.txt
user@host:~$ cp ~/lab1-results.txt ~/newdir
user@host:~$ cp ~/lab1-results.txt ~/newdir/lab1-cp.txt
user@host:~$ ls ~/newdir
user@host:~$ ls ~/newdir >> ~/lab1-results.txt
user@host:~$ mv ~/newdir/lab1-cp.txt ~/.hiddendir
user@host:~$ ls ~/newdir
user@host:~$ ls ~/.hiddendir
user@host:~$ ls ~/.hiddendir >> ~/lab1-results.txt
```

The following steps demonstrate **rm**. First, you will attempt to remove a directory that contains files. Note the results. Then you will use the **–r** option to recursively remove the directory and its contents. Last, you will delete files using a wildcard. 

```
user@host:~$ rm ~/.hiddendir
user@host:~$ rm –r ~/.hiddendir
user@host:~$ rm ~/newdir/*.txt
user@host:~$ ls ~/newdir
user@host:~$ ls -a ~
Directory newdir should exist, but be empty. Directory .hiddendir
should be deleted.
```

## Challenge 6: Transfer Files using scp
You will need to transfer files to and from your JagCloud instance. If you had physical access to the host the instance was running on, you might be able to connect removable storage media to the host and transfer files to/from that removable media. However, you don’t have physical access, so you will need to use remote file transfer. SCP performs file transfer over ssh. Other options exist, such as netcat, ftp, or sftp, but since you will routinely access GCP instances with ssh, scp is a good options for routine file transfer.

Start Windows Command Prompt by searching for cmd. Confirm scp is functioning, then transfer the file. The following commands demonstrate how to complete these steps. Note: the following commands are run through the Windows Command Prompt, not the GCP instance.

```
username@server-ip-address:source destination
```

1. **The -i option** directs use of private key for authentication private-key: The file path to the private key 
- **username**: The username on the GCP instance
- **server-ip-address**: IP address for GCP instance
- **source**: The source file. Can be just the filename if the source file is in the user’s home directory, otherwise it must be the complete file path.

C:\Users\jdoe>scp –i C:\Users\jdoe\jdoe-private-key.ppk janedoe@50.60.70.80:lab1-results.txt lab1-results.txt

The above command will copy file lab1-results.txt from the home directory of jane-doe on the Linux server at IP address 50.60.70.80 to the directory C:\Users\jdoe on the local Windows computer. Alternatively, you can save the file to another directory by specifying the full file path for the desired directory. 

Confirm the file copied to your local computer with the command:
C:\Users\jdoe>dir lab1-results.txt
