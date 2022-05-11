---
title: A Quick Guide to getting started with SCINet
description: A Quick Guide to getting started with SCINet
permalink: /guide/quickstart
author:
layout: page

#sidenav:
# - text: What is SCINet
#   href: '#what-is-scinet'
# - text: Multi-Factor Authentication
#   href: '#setup-multi-factor-authentication'
# - text: Windows 10 Instructions
#   href: '#from-windows-10'
# - text: Older Windows Instructions
#   href: '#from-older-windows-versions'
# - text: Mac and Linux Instructions
#   href: '#from-mac-and-linux'
# - text: Storage
#   href: '#data-storage'
# - text: Data Transfer
#   href: '#data-transfer'
# - text: Running Software Applications
#   href: '#running-applications'

---

[No account? Signup here.](/about/signup){: .usa-button .usa-button-big }

#### Table of Contents
* [What is SCINet?](#what-is-scinet)
* [Multi-Factor Authentication](#set-up-multi-factor-authentication)
* [HPC Clusters on SCINet](#hpc-clusters-on-scinet)
* [Accessing SCINet](#accessing-scinet)
  * [Windows 10 Instructions](#from-windows-10)
  * [Older Windows Instructions](#from-older-windows-versions)
  * [Mac and Linux Instructions](#from-mac-and-linux)
* [Password Requirements](#password-requirements)
* [Frequently Asked Questions](#frequently-asked-questions)
* [Linux Command Line Interface](#linux-command-line-interface)
* [Storage](#data-storage)
  * [Quotas](#quotas)
  * [Home Directories](#home-directories)
  * [Project Directories](#project-directories)
* [Data Transfer](#data-transfer)
  * [Globus](#globus-data-transfers)
  * [Small Files](#small-data-transfers)
  * [Shipping Hard Drives](#shipping-hard-drives)
* [Tools and Software](#tools-and-software)
  * [Available Software](#available-software)
  * [Reference Genome Assemblies](#reference-genome-assemblies)
  * [Text Editors](#text-editors)
* [Running Applications](#running-applications)
  * [Compute Nodes](#compute-nodes)
  * [Interactive Mode](#interactive-mode)
  * [Batch Mode](#batch-mode)
  * [Job Script Generator](#job-script-generator)
  * [Useful SLURM Commands](#useful-slurm-commands)
* [Building Your Own Tools](#building-your-own-tools)
* [SCINet Acknowledgement in Publications](#scinet-citationacknowledgment-in-publications)


# What is SCINet?

SCINet is the USDA-ARS's initiative for scientific computing. It consists of:

1. High performance computer clusters for running command-line and graphical programs. There are currently two clusters: Ceres cluster in Ames IA and Atlas cluster in Starkville MS. SCINet also offers AWS cloud computing. See [SCINet HPC Systems](/about/compute) for more detail.
2. Network improvements across ARS.
3. Support for computing through the Virtual Research Support Core (VRSC). See [VRSC Support](/support/vrsc/) for more detail.
4. Training and workshop opportunities in multiple areas of scientific computing. See [upcoming](/training/training_event) and [past](/training-archive/) trainings and [upcoming](/events/upcoming_events) and [past](/events-archive) events for more information.

Users who are new to the HPC environment may benefit from the [SCINet/Ceres onboarding video](https://www.youtube.com/watch?v=FspDMlHaJUY) which covers most of the material contained in this guide. Note that /KEEP storage discussed in the video at 16:20 is no longer available. Instead data that cannot be easily reproduced should be manually backed up to [Juno](https://scinet.usda.gov/guide/storage/#juno-archive-storage). The instructional video at [https://www.youtube.com/watch?v=I3lnsCAfx3Q](https://www.youtube.com/watch?v=I3lnsCAfx3Q) demonstrates how to transfer files between local computer, Ceres, Atlas and Juno using Globus.

# Set Up Multi-Factor Authentication

For security, SCINet requires multifactor authentication. See the setup instructions in the [Multi-Factor Authentication User Guide](/guide/multifactor/).


# HPC Clusters on SCINet

Cluster name | Location | Login Nodes | Transfer Nodes
-------------|----------|-------------|---------------
Ceres        |Ames, IA  |ceres.scinet.usda.gov | ceres-dtn.scinet.usda.gov
Atlas        |Starkville, MS| atlas-login.hpc.msstate.edu |atlas-dtn.hpc.msstate.edu
TBD          |Beltsville, MD| TBD|TBD
-------------|---|---|


# Accessing SCINet

All users should have received their login credentials in an email.  If you have not, please email the Virtual Research Support Core at [scinet_vrsc@USDA.GOV](mailto:scinet_vrsc@USDA.GOV?subject=account%20access). Before accessing various SCINet resources, new users need to ssh either to Ceres or Atlas cluster and change the temporary password. Note that home directories on Atlas are not created right away, so it is recommended to wait a day after receiving email with the credentials before logging to Atlas cluster.      

## From Windows 10

Windows 10 that is up to date has an ssh client in the Windows Power Shell. To use that client, click on the Start button and start typing "power". Select Windows PowerShell from the list.

In the PowerShell window, you can type one of two options: 

	1) ssh user.name@ceres.scinet.usda.gov (for Ceres Connections)
	2) ssh user.name@atlas-login.hpc.msstate.edu (for Atlas Connections)

NOTE: Be sure to replace “user.name” in both options above with your assigned username.


It is also recommended to create a config file on your computer. You may do so using Notepad.  The file you create must be titled “config” with no extension for this method to work properly (i.e. “config” not “config.txt”). 
	Note: Do not copy the code into the terminal itself, it must be in a separate file. 

Create a ~/.ssh/config file replacing USER.NAME with your actual username, all in lowercase.  To save this config file to your .ssh folder, you must save it to your user folder.  The path to the .ssh file is as follows: C>Users>(Your Account)>.ssh

```bash
Host ceres-login
HostName ceres.scinet.usda.gov
User USER.NAME
TCPKeepAlive yes
ServerAliveInterval 20
ServerAliveCountMax 30

Host atlas-login
HostName atlas-login.hpc.msstate.edu
User USER.NAME
TCPKeepAlive yes
ServerAliveInterval 20
ServerAliveCountMax 30
```
If you don’t want to use the config file method above, add the following text to the ssh command replacing USER.NAME with your actual username, all in lowercase.

```bash
ssh -o TCPKeepAlive=yes -o ServerAliveInterval=20 -o ServerAliveCountMax=30 USER.NAME@ceres.scinet.usda.gov
```
and

```bash
ssh -o TCPKeepAlive=yes -o ServerAliveInterval=20 -o ServerAliveCountMax=30 USER.NAME@atlas-login.hpc.msstate.edu
```

After you have followed either of the options above, enter the 6-digit "Verification Code" generated by the Google Authenticator app when prompted. _Note that the code and your password will not be visible on the screen when typed._ If the code is correct, the system will then prompt you for your password. 

**Please Note:** If you are connected to the SCINet VPN, you will not be prompted to enter the Google Authenticator Code. If you make a mistake entering the code, you will be prompted to enter the verification code once more, but you must wait for a new code to be generated. 

![screenshot of logging in](/assets/img/password.png)

If your password has expired (new temporary passwords expire right away, and the passwords set by users expire after 60 days) you will be prompted to change your password. To paste from a clipboard into PowerShell, perform single right click with the mouse and then press Enter. Please see below for a detailed guide on changing your password. 

_When Changing Your Temporary Password (Mandatory Prompt When First Connecting):_

1. Enter either of the following:
	A. $ ssh user.name@ceres.scinet.usda.gov
	B. ssh user.name@atlas-login.hpc.msstate.edu
2. Enter the 6-digit verification code generated by the Google Authenticator app when prompted. 
3. Enter your temporary password found in your welcome email when prompted for the password.
4. When prompted for your “Current Password”, re-enter your temporary password.
5. Enter your “new password” twice when prompted. 
	Note: The new password requirements are listed below the Mac and Linux instructions. 

After updating your password, you will be prompted to answer Yes or No to entering a cell phone. _It is strongly recommended to add a cell phone just in case you need to reset your Google Authenticator in the future._ Enter "y" and then enter your cellphone number with no dashes or parenthesis, as shown in the image below. 

![screenshot of cellphone entry](/assets/img/cellphone.png)

## From Older Windows Versions

To begin, download [Putty.exe](https://www.putty.org/).  Once downloaded, start PuTTY and use the following instructions: 

1. In the left-hand menu select the 'Session' category, then on the right side type into the 'Host Name' either `ceres.scinet.usda.gov` (for Ceres connections) or `atlas-login.hpc.msstate.edu` (for Atlas connections).
2. In the left-hand menu select the 'Connection' category, then on the right side replace `0` with `60` for "Seconds between keepalives" and check the "Enable TCP keepalives"
3. In the left-hand menu select “Data” category under the ‘Connection’ category and type your username on the right side
4. To save these settings for later logins select the 'Session' category, and in the “Saved Sessions” type `SCINet Ceres` or `SCINet Atlas`, then click on “Save” button.
5. Hit "Open"
6. Enter the 6-digit verification code generated by the Google Authenticator app when prompted. __Note that when you type the code or the password, nothing will be shown on the screen.__ If you made a mistake when typing 6-digit code, you will be prompted for Verification code once again, but you must wait for the new code to be generated before entering the code again.  If system accepts the code it will prompt you for current password. If you are logging in for the first time, enter your temporary password provided in your welcome email. If you are changing your password, you may enter your current password. To paste from a clipboard into Putty, perform single right click with the mouse and then press Enter. (However, this form of copy and paste may no longer be functional)
	Note: The new password requirements are listed below the Mac and Linux instructions. 

![screenshot of Putty software](/assets/img/putty.png)

## From Mac and Linux

Open a terminal window. We recommend setting up a config file to make logging in easier and use settings to provide a more stable connection.  This can be done by creating a config file u sing the following code and then saving it to your .ssh file.  The file you create must be titled “config” for this method to work properly. 
	Note: Do not copy the code into the terminal itself, it must be a separate file on your computer. 

Create a ~/.ssh/config entry similar to this, replacing USER.NAME with your actual username, all in lowercase:
```bash
Host ceres-login
HostName ceres.scinet.usda.gov
User USER.NAME
TCPKeepAlive yes
ServerAliveInterval 20
ServerAliveCountMax 30

Host atlas-login
HostName atlas-login.hpc.msstate.edu
User USER.NAME
TCPKeepAlive yes
ServerAliveInterval 20
ServerAliveCountMax 30
```
Note: To save this config file to your .ssh folder, you must save it to your user folder. However, the .ssh file is currently hidden to you. To reveal the hidden files, you will press and hold CMD + SHIFT + . (Period Key) when choosing a location to save your file. The .ssh file will now be visible for you to save the config file. 

That will send a "keepalive" signal every 20 seconds and keep retrying for up to 30 failures. This also simplifies your login to just:

`ssh ceres-login`
or
`ssh atlas-login`

If you don’t want to use the config file method above, add the following text to the ssh command replacing USER.NAME with your actual username in lowercase.

```bash
ssh -o TCPKeepAlive=yes -o ServerAliveInterval=20 -o ServerAliveCountMax=30 USER.NAME@ceres.scinet.usda.gov
```
and

```bash
ssh -o TCPKeepAlive=yes -o ServerAliveInterval=20 -o ServerAliveCountMax=30 USER.NAME@atlas-login.hpc.msstate.edu
```

After typing ssh command, enter the 6-digit code verification code generated by the Google Authenticator app when prompted for the Verification Code. __Note that when you type the code or the password, nothing will be shown on the screen.__ If system accepts the code it will prompt you for password. 

**Please Note:** If you are connected to the SCINet VPN, you will not be prompted to enter the Google Authenticator Code. If you make a mistake entering the code, you will be prompted to enter the verification code once more, but you must wait for a new code to be generated. 

![screenshot of logging in](/assets/img/password.png)

_When Changing your Password (Mandatory Prompt when First Connecting):_

1. Enter either of the following: $ ssh user.name@ceres.scinet.usda.gov OR ssh user.name@atlas-login.hpc.msstate.edu
2. Enter the 6-digit verification code generated by the Google Authenticator app when prompted. 
3. Enter your temporary password found in your welcome email when prompted for the password.
4. When prompted for your “Current Password”, re-enter your temporary password.
5. Enter your “new password” twice when prompted.    
Note: The new password requirements are listed below. 

After updating your password, you will be prompted to answer Yes or No to entering a cell phone. _It is strongly recommended to add a cell phone just in case you need to reset your Google Authenticator in the future._ Enter "y" and then enter your cellphone number with no dashes or parenthesis, as shown in the image below. 

![screenshot of cellphone entry](/assets/img/cellphone.png)

# Password Requirements

1. AT LEAST 12 characters long
2. AT LEAST 3 different character classes: lower case letters, upper case letters, digits, symbols
3. Different from the expired password: at least 5 character changes (inserts, removals, or replacements) are required
4. Difficult to guess or brute force. Palindromes, passwords containing your username, and other patterns will be denied.
5. Older passwords CAN NOT be reused.

# Frequently Asked Questions

**It didn’t ask me for the Verification Code from Google Authenticator. What do I do?**  
If you are connected to the VPN, the code will be waived, no need to worry about entering it. 

**I can’t find the .ssh folder when saving my config file. Where is it located?**   
The .ssh file is usually hidden to you.  You must show all hidden files when saving your file before you will be able to save to the .ssh file. 

**My password/Google Authenticator Verification Code isn’t showing up when I type it. What is wrong?**   
There is nothing wrong with your terminal, the password and GA Verification Code will never show when you type. That is why it is important to be careful when entering the information. For passwords, copy + paste are extremely helpful to avoid mistakes. 

**After creating my account and changing my temporary password, I was prompted for my cell phone. Should I include this?**   
It is highly recommended to include your cell phone when setting up your account.  This will be used if you need to perform a self-reset on your Google Authenticator code.  Without the cell phone in your account, you may need to reapply for a SCINet account. 

# Linux Command Line Interface

SCINet HPC resources can be used via GUI tools such as Geneious, CLC Workbench, SmartAnalysis, JupyterHub, SCINet Galaxy etc., however users are limited by what these tools provide. One can do much more ssh-ing to a cluster and using Command Line Interface (CLI). If you're not familiar with CLI, check out the following resources: 

1. [Introduction to Unix](https://bioinformaticsworkbook.org/Appendix/Unix/unix-basics-1.html) 
2. [Unix Tutorials](https://www.hpc.iastate.edu/guides/unix-introduction)
3. [The list of basic CLI commands](/guide/CLI)

# Data Storage

There are multiple places to store data persistently on SCINet clusters. For more information about storage options, refer to [SCINet Storage Guide](/guide/storage).

Storage | Path
--------|-----
HOME | /home/user.name
PROJECT | /project
--------|------

## Quotas
Home and project directories have quotas. Current usage and quotas for home and project directories that user belongs to are displayed at login. The `my_quotas` command provides the same information.

## Home Directories

Home directories are private, they are only accessible to you and the system administrators. When a user logs into Ceres, they are automatically logged into their home directory. Home directories have small quotas and should be mainly used for configuration and login files. Computations should be run from project directories. Files in home directories are automatically compressed and backed up. Due to backup method used on Ceres, space freed after deleting files in home directories, will become available only after 6 days.

## Project Directories

Project directories are intended as high-level workspaces. This is where large datasets would reside, sub-projects can be created, and collaborative analysis results stored. Project directories are usually associated with ARS Research Projects.

To request a new project directory see [Request Project Storage](/support/request-storage). A direct link to the form (eAuthentication required) which includes submitting a Data Management Plan:

[Request a project directory](https://e.arsnet.usda.gov/sites/OCIO/scinet/accounts/SitePages/Project_Allocation_Request.aspx){: .usa-button }

Users may not need to request a new project directory if they're working with someone who already has a project directory. Instead the manager of the existing project directory will need to request access to the project directory for additional users by emailing [scinet_vrsc@usda.gov](mailto:scinet_vrsc@usda.gov?subject=add%20to%20project)

Directories in `/project` are not backed up, and it is not recommended to run jobs from a directory in `/KEEP`.


# Data Transfer

Given the space and access limitations of a home directory, large amounts of data or data that will be used collaboratively should be transferred to a project directory. If you have issues with transferring data, please contact [scinet_vrsc@usda.gov](mailto:scinet_vrsc@usda.gov?subject=data%20transfer%20enquiry).

## Globus Data Transfers

We recommend using Globus Online to transfer data to and from Ceres cluster. It provides faster data transfer speeds compared to scp, has graphical interface and does not require to enter GA verification code for every file transfer. To transfer data to/from a local computer, users will need to install Globus Personal which does NOT require admin privileges. More information about Globus Online for SCINet clusters can be found in the [Transferring Files User Guide](/guide/file-transfer).

## Small Data Transfers

While Globus is faster, you can also transfer data from your local machine to SCINet clusters using the scp command (the destination filenames are optional). It is recommended to transfer large files into your project directory (due to the limited space of home directories). Smaller files can be transferred to/from your home directory by replacing  `/project/yourproject`  in the examples below with  `~`

Transfer a file to your SCINet project directory:
```bash
scp yourfile sally.doe@ceres-dtn.scinet.usda.gov:/project/yourproject
```
or
```bash
scp yourfile sally.doe@atlas-dtn.hpc.msstate.edu:/project/yourproject
```

Transfer a file from your SCINet project directory:
```bash
scp sally.doe@ceres-dtn.scinet.usda.gov:/project/yourproject/yourfile .
```
or
```bash
scp sally.doe@atlas-dtn.hpc.msstate.edu:/project/yourproject/yourfile .
```

To transfer an entire directory, you can use the -r option with any one of the above commands and specify a directory to transfer.  All of the files in that directory will get transferred, for example:
```bash
scp -r sequence_files sally.doe@ceres-dtn.scinet.usda.gov:/project/yourproject
```
or
```bash
scp -r sequence_files sally.doe@atlas-dtn.hpc.msstate.edu:/project/yourproject
```

You can view the full set of options and their descriptions by typing `man scp`

Other options for small data transfers include [Cyberduck](https://cyberduck.io/) and [FileZilla](https://filezilla-project.org/).

## Shipping Hard Drives

You can send hard drives containing data to the VRSC if you have very large amounts of data (typically greater than 50GB) to transfer to Ceres or if the network speed at your location is slow. Please follow the instructions for shipping hard drives in the [Transferring Files Guide](/guide/file-transfer/#large-data-transfer-by-shipping-hard-drives).


# Tools and Software

## Available Software

Many software applications are available as modules; see [Software Overview](/guide/software) or type `module avail` on a cluster to see them.  Users can load the modules that they need to do their analysis.  We manage applications as modules to enable different versions of different applications to exist simulatneously and to be easily managed.

The `module` command is used to work with the different software application modules. The following table lists some of the most common functions of the `module` command:

Command |	Description
---|---
`module avail`  or  `module spider`	| List the modules that are available
`module list`	| List the modules that are currently loaded
`module unload <module name>`	| Remove <module name> from the environment
`module load <module name>`	| Load <module name> into the environment
`module swap <module one> <module two>`	| Replace <module one> with <module two> in the environment
`module -h`	| Lists the full help menu for the module command
----|----

## Reference Genome Assemblies

NCBI and other databases, reference genome sequences of many agricultural species are stored in a central location to free space in user’s home and project directories.
FASTA files of the sequences and associated index files for popular alignment tools (BLAST, SAMTools, BWA, Bowtie2, etc.) can be found in `/reference/data/XX/`.   

Additional sequences and index files can be added to the shared directory by contacting the Virtual Research Support Core at [scinet_vrsc@USDA.GOV](mailto:scinet_vrsc@USDA.GOV?subject=reference%20data)

## Text Editors
The following are a few of the common text editors that are available on the system:
`vi`, `emacs`, `nano`.

# Running Applications

The login node is meant to be used for setting up analysis and tasks that are not computationally or memory intensive.
If your job runs for longer than a few minutes then please use the interactive mode or batch mode described below.

SCINet clusters use SLURM as the job scheduler. It is similar to SGE and PBS.

## Compute Nodes

There are different queues or partitions on the clusters. You will specify a queue when submitting batch jobs.

Main partitions on Ceres are listed in the table below:

Name |	Nodes	|Maximum Run Time	|Function
---|---|---|---
short	|100	|48 hours|	default queue, for short runs
medium|	68|	7 days	|for medium-length runs
long	|35|	21 days |	for long runs
mem	|8|	7 days|	for applications requiring high memory
longmem|	1|	1000 hours	|for high memory applications requiring more than a week
debug|	1|	1 hour	|for testing
---|---|---|---

To learn about other partitions on Ceres, refer to [Ceres User Manual](/guide/ceres/#partitions-or-queues).

To get current details on all partitions on a cluster use the following scontrol command:
```bash
scontrol show partitions
```

At most 800 cores and 2100 GB of memory can be used by all simultaneously running jobs per user across all queues. Any additional jobs will be queued but won't start. At times these limits can be lowered to prevent a small group of users overtaking the whole cluster.

## Interactive Mode

From the Ceres login node, request an interactive session by typing `salloc`

Now you are running interactively on a single hyper-threaded core (2 logical cores) with 6000 MB of allocated memory on one of the compute nodes. The session will last for 2 days, but will timeout after 1.5 hours of inactivity (no commands runnning).

You can view and load modules for the applications you need, and execute applications from the command-line.

When complete, return to the login node by typing `exit`

For more fine grained control over the interactive environment you can use the srun command. Issue the srun command from a login node of a SCINet cluster. Command syntax is:

`srun --pty -p queue -t hh:mm:ss -A account -n tasks -N nodes /bin/bash -l`

account is usually your project name. For example if your project directory is at /project/projectname, then specify "-A projectname" on the srun command. To view all your slurm accounts, issue “sacctmgr -Pns show user format=account”.

On Ceres every user has a default Slurm account. If you have no project, then your default Slurm account is scinet, otherwise it's a projectname. If you have access to more than one project, then one of the project names is set as your default Slurm account. To change your default Slurm account issue slurm-account-selector.sh on the Ceres login node. 

See the [Ceres User Manual](/guide/ceres/#running-application-jobs-on-compute-nodes) for details on `srun`.

## Batch Mode

You can run jobs on the cluster by writing short scripts that will get executed on the cluster. For more details about running jobs in batch mode, please see the detailed [Ceres User Manual](/guide/ceres/#batch-mode).

Here is an example of a batch job submission bash script (e.g. `blast_job.sh`, for running BLAST):

```bash
#!/bin/bash
#SBATCH --job-name="blastp" #name of the job submitted
#SBATCH -p short #name of the queue you are submitting job to
#SBATCH -N 1 #number of nodes in this job
#SBATCH -n 40 #number of cores/tasks in this job, you get all 20 cores with 2 threads per core with hyperthreading
#SBATCH -t 01:00:00 #time allocated for this job hours:mins:seconds
#SBATCH -A projectname  #substitute with the name of your project
#SBATCH --mail-user=emailAddress #enter your email address to receive emails
#SBATCH --mail-type=BEGIN,END,FAIL #will receive an email when job starts, ends or fails
#SBATCH -o "stdout.%j.%N" # standard out %j adds job number to outputfile name and %N adds the node name
#SBATCH -e "stderr.%j.%N" #optional but it prints our standard error
date #optional this command prints out timestamp when the job is starting in stdout file
module load blast+    #loading latest NCBI BLAST+ module
blastp -db nr -query blastInputs -out blastout # protein blast search against nr database
date #optional printing out timestamp when the job ends
```

You would submit the script by typing: `sbatch blast_job.sh`

## Job Script Generator

You can also use Ceres Job Script Generator to generate job scripts.

[Ceres Job Script Generator](/support/ceres-job-script){: .usa-button }

## Useful SLURM Commands

Command	|Description	|Examples
---|---|---
`squeue`	|Gives information about jobs	|`squeue` or `squeue -u jane.webb`
`scancel`	|Stop and remove jobs|	`scancel 1256` or `scancel -u jane.webb`
`sinfo`	|Gives information about queues (partitions) or nodes	|`sinfo` or `sinfo -N -l`


# Building Your Own Tools

Users can build and use their own tools. It is recommended to compile on compute nodes, and not on the login node.

The[Guide to Installing R, Python, and Perl Packages](https://scinet.usda.gov/guide/packageinstall/) has examples of
installing packages in a project directory.

# SCINet Citation/Acknowledgment in Publications

Add the following sentence as an acknowledgment for using SCINet/Ceres as a resource in your manuscripts meant for publication:  

**"This research used resources provided by the SCINet project of the USDA Agricultural Research Service, ARS project number 0500-00093-001-00-D."**
