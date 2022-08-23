---
title: SCINet Ceres User Manual
description: A Guide to getting started with the Ceres HPC
permalink: /guide/ceres/
author: VRSC
layout: page
# sidenav:  is a side navigation bar is needed it can be specified in the _data/navigation.yml file
---

#### Table of Contents
* [Onboarding Videos](#onboarding-videos)
* [Technical Overview](#technical-overview)
* [System Configuration](#system-configuration)
  * [Software Environment](#software-environment)
* [System Access](#system-access)
  * [Logging in to SCINet](#logging-in-to-scinet)
  * [File Transfers](#file-transfers)
    * [Globus Online Data Transfers](#globus-online-data-transfers)
    * [Using scp to Transfer data](#using-scp-to-transfer-data)
    * [Other ways to Transfer data](#other-ways-to-transfer-data)
    * [Large Data Transfers](#large-data-transfers)
* [Modules](#modules)
  * [Useful Modules Commands](#useful-modules-commands)
  * [Loading and Unloading Modules](#loading-and-unloading-modules)
  * [Module: command not found](#module-command-not-found)
* [Quotas on Home and Project Directories](#quotas-on-home-and-project-directories)
  * [Local Sharing of Files with Other Users](#local-sharing-of-files-with-other-users)
* [Running Application Jobs on Compute Nodes](#running-application-jobs-on-compute-nodes)
  * [Partitions or Queues](#partitions-or-queues)
  * [Slurm accounts](#slurm-accounts)
  * [Interactive Mode](#interactive-mode)
  * [Requesting the proper number of nodes and cores](#requesting-the-proper-number-of-nodes-and-cores)
  * [Batch Mode](#batch-mode)
    * [Serial Job](#serial-job)
    * [Running a simple OpenMP Job](#running-a-simple-openmp-job)
    * [Parallel MPI Job](#parallel-mpi-job)
  * [Useful SLURM Commands](#useful-slurm-commands)
  * [Local Scratch Space on Large Memory Nodes](#local-scratch-space-on-large-memory-nodes)
* [Compiling Software, Installing R/Perl/Python Packages and Using Containers](#compiling-software-installing-rperlpython-packages-and-using-containers)
* [Citation/Acknowledgment](#scinet-citationacknowledgment-in-publications)

# Onboarding Videos
Users who are new to the HPC environment may benefit from the following Ceres onboarding video which covers much of the material contained in this guide plus some Unix basics.

[Ceres Onboarding (Intro to SCINet Ceres HPC) (length 42:13)](https://www.youtube.com/watch?v=FspDMlHaJUY)

Note: /KEEP storage discussed in the video at 16:20 is no longer available. Instead data that cannot be easily reproduced should be manually backed up to [Juno](https://scinet.usda.gov/guide/storage/#juno-archive-storage). The instructional video at [https://www.youtube.com/watch?v=I3lnsCAfx3Q](https://www.youtube.com/watch?v=I3lnsCAfx3Q) demonstrates how to transfer files between local computer, Ceres, Atlas and Juno using Globus.

The video includes:
- logging on to Ceres
- changing your password
- home and project directories
- data transfer to/from SCINet clusters
- basic SLURM job scheduler commands
- computing in interactive mode with salloc
- accessing Ceres software modules
- computing in batch mode with a batch script


# Technical Overview

Ceres is the dedicated high performance computing (HPC) infrastructure for ARS researchers on ARS SCINet. Ceres is designed to enable large-scale computing and large-scale storage. Currently, the following compute nodes are available on the Ceres cluster.

120 regular compute nodes, each having:

* 72 logical cores on 2 x 18 core Intel Xeon Processors (6140 2.30GHz 25MB Cache or 6240 2.60GHz 25MB Cache) with hyper-threading turned ON
* 384GB DDR3 ECC Memory
* 250GB Intel DC S3500 Series 2.5” SATA 6.0Gb/s SSDs (used to host the OS and provide small local scratch storage)
* 1.5TB SSD used for temporary local storage
* Mellanox ConnectX®­3 VPI FDR InfiniBand

76 regular compute nodes, each having:

* 96 logical cores on 2 x 24 core Intel Xeon Processors (6240R 2.40GHz 36MB Cache) with hyper-threading turned ON
* 384GB DDR3 ECC Memory
* 250GB Intel DC S3500 Series 2.5” SATA 6.0Gb/s SSDs (used to host the OS and provide small local scratch storage)
* 1.5TB SSD used for temporary local storage
* Mellanox ConnectX®­3 VPI FDR InfiniBand

4 large memory nodes, each having:

* 80 logical cores on 2 x 20 core Intel Xeon Processors (6148 2.40GHz 27.5MB Cache or 6248 2.50GHz 27.5MB Cache) with hyper-threading turned ON
* 768GB DDR3 ECC Memory
* 250GB Intel DC S3500 Series 2.5” SATA 6.0Gb/s SSDs (used to host the OS and provide small local scratch storage)
* 1.5TB SSD used for temporary local storage
* Mellanox ConnectX®­3 VPI FDR InfiniBand


11 large memory nodes, each having:

* 80 logical cores on 2 x 20 core Intel Xeon Processors (6148 2.40GHz 27.5MB Cache or 6248 2.50GHz 27.5MB Cache) with hyper-threading turned ON
* 1,536GB DDR3 ECC Memory
* 250GB Intel DC S3500 Series 2.5” SATA 6.0Gb/s SSDs (used to host the OS and provide small local scratch storage)
* 1.5TB SSD used for temporary local storage
* Mellanox ConnectX®­3 VPI FDR InfiniBand


11 large memory nodes, each having:

* 96 logical cores on 2 x 24 core Intel Xeon Processors (6248R 3GHz 27.5MB Cache or 6248 2.50GHz 27.5MB Cache) with hyper-threading turned ON
* 1,536GB DDR3 ECC Memory
* 250GB Intel DC S3500 Series 2.5” SATA 6.0Gb/s SSDs (used to host the OS and provide small local scratch storage)
* 1.5TB SSD used for temporary local storage
* Mellanox ConnectX®­3 VPI FDR InfiniBand


1 GPU node that has:

* 72 logical cores on 2 x 18 core Intel Xeon Processors (6140 2.30GHz 25MB Cache) with hyper-threading turned ON
* 2 Tesla V100
* 384GB DDR3 ECC Memory
* 250GB Intel DC S3500 Series 2.5” SATA 6.0Gb/s SSDs (used to host the OS and provide small local scratch storage)
* 1.5TB SSD used for temporary local storage
* Mellanox ConnectX®­3 VPI FDR InfiniBand


In addition there are a specialized data transfer node and several service nodes.

In aggregate, there are more than 9000 compute cores (18000 logical cores) with 110 terabytes (TB) of total RAM, 500TB of total local storage, and 3.7 petabyte (PB) of shared storage.

Shared storage consists of 2.3PB high-performance Lustre space, 1.4PB high-performance BeeGFS space and 300TB of backed-up ZFS space.


# System Configuration
Since most HPC compute nodes are dedicated to running HPC cluster jobs, direct access to the nodes is discouraged. The established HPC best practice is to provide login nodes. Users access a login node to submit jobs to the cluster’s resource manager (SLURM), and access other cluster console functions. All nodes run on Linux CentOS 7.8.

## Software Environment

Domain | Software
--- | ---
Operating System	| CentOS
Scheduler	| SLURM
Software | For the full list of installed scientific software refer to the [Software Overview](/guide/software) page or issue the  `module spider`  command on the Ceres login node.  
Modeling	| BeoPEST, EPIC, KINEROS2, MED-FOES, SWAT, h2o
Compilers | GNU (C, C++, Fortran), clang, llvm, Intel Parallel Studio
Languages | Java 6, Java 7, Java 8, Python, Python 3, R, Perl 5, Julia, Node
Tools and Libraries | tmux, Eigen, Boost, GDAL, HDF5, NetCDF, TBB, Metis, PROJ4, OpenBLAS, jemalloc
MPI libraries | MPICH, OpenMPI
Profiling and debugging | PAPI

For more information on available software and software installs refer to sections [Modules](#modules) and [Compiling Software, Installing R/Perl/Python Packages and Using Containers](#compiling-software-installing-rperlpython-packages-and-using-containers).

# System Access
## Logging in to SCINet
### ssh
Users can connect directly to Ceres using an ssh client. ssh is usually available on any Linux or MacOS machine, and on Microsoft Windows 10 (in powershell):
```
$ ssh <SCINet UserID>@ceres.scinet.usda.gov
```

For older Microsoft Windows machines, we recommend using PuTTY or OpenSSH (see the [Quick Start Guide](/guide/quickstart))

When you log in to SCINet HPC you will be on the Ceres login node. The login node is a shared resource among all SCINet users that are currently logged in to the system. **Please do NOT run computationally or memory intensive tasks on the login node, this will negatively impact performance for all other users on the system.** See section [Running Application Jobs on Compute Nodes](#running-application-jobs-on-compute-nodes) for instructions on how to run such tasks on compute nodes.


### MFA
Logins to the Ceres cluster require the use of multi-factor authentication (MFA). Ceres uses Google Authenticator (GA) for MFA. Information required to set up your SCINet GA account is sent along with the temporary password in the Welcome email. When ssh-ing to the cluster you will first be prompted for Verification Code, and then for password. **Note that when you type the code or the password, nothing will be shown on the screen.** See detailed instructions in the [MFA guide](/guide/multifactor).

### Password expiration
When a new SCINet account is created, the temporary password set by the system expires right away. Passwords set by users expire after 60 days. Users can still login to Ceres with the expired password, but they're prompted to change their password right away. Users can also initiate password change on their own by issuing the command  `passwd`  on the Ceres login node. **When prompted for the current password, users need to enter the old (possibly expired) password**.

If you have forgotten your login password, please email the VRSC: [scinet_vrsc@USDA.GOV](mailto:scinet_vrsc@USDA.GOV?subject=forgot%20login%20password)

## File Transfers
* Given the space and access limitations of a home directory, large amounts of data or data that will be used collaboratively should be transferred to a project directory (see section [Quotas on Home and Project Directories](#quotas-on-home-and-project-directories))
* Please use the data transfer node, ceres-dtn.scinet.usda.gov, instead of the login node to transfer data to/from the cluster. 
* If you have to transfer very large amounts of data or if network speed at your location is slow, please submit a request to the Virtual Research Support Core (VRSC) to ingress data from a hard drive as described below (section [Large Data Transfers](#large-data-transfers)).
* If you have issues with transferring data, please contact the VRSC at [scinet_vrsc@USDA.GOV](mailto:scinet_vrsc@USDA.GOV?subject=help%20with%20transferring%20data).

### Globus Online Data Transfers

We recommend using Globus Online to transfer data to and from the Ceres cluster. It provides faster data transfer speeds compared to scp, has a graphical interface, and does not require a GA verification code for every file transfer. To transfer data to/from a local computer, users will need to install Globus Personal which does NOT require admin privileges. More information about Globus Online for Ceres can be found in the [Guide for Transferring Files](/guide/file-transfer/).

### Using scp to Transfer Data
Like ssh, scp is usually available on any Linux or MacOS machine, and on Microsoft Windows 10 (in powershell).

To transfer data when logged in to your local machine (the destination filenames are optional):

1. Transfer To SCINet:
```
$ scp <PathToSourceFolderOnLocalResource>/<LocalFilename> <SCINet UserID>@ceres-dtn.scinet.usda.gov:/<PathToDestinationFolderOnSCINet>/[<RemoteFilename>]
```

2. Transfer From SCINet:
```
$ scp <SCINet UserID>@ceres-dtn.scinet.usda.gov:/<PathToSourceFolderOnSCINet>/<RemoteFilename> ~/<PathToDestinationFolderOnLocalResource>/[<LocalFilename>]
```

To transfer data when logged in to SCINet (the destination filenames are optional):

1. Transfer To SCINet:
```
$ scp <Username>@<RemoteServer>:/<PathToSourceFolderOnRemoteResource>/<RemoteFilename>  ~/<PathToDestinationFolderOnSCINet>/[<LocalFilename>]
```

2. Transfer From SCINet:
```
$ scp <PathToSourceFolderOnSCINet>/<LocalFilename> <Username>@<RemoteServer>:/<PathToDestinationFolderOnRemoteResource>/[<RemoteFilename>]
```

To transfer an entire directory, you can use the  `-r`  option with any one of the above commands and specify a directory to transfer.  All of the files under that directory will get transferred e.g.

```
$ scp -r <PathToSourceFolderOnLocalResource> <SCINet UserID>@ceres-dtn.scinet.usda.gov:/<PathToDestinationFolderOnSCINet>
```

You can type the following to view the full set of options and their descriptions:

```
$ man scp
```

### Other Ways to Transfer Data

Other programs that have a GUI to transfer data are:

* Cyberduck - [https://cyberduck.io/](https://cyberduck.io/)

* FileZilla - [https://filezilla-project.org/](https://filezilla-project.org/)

Cyberduck supports multiple protocols (including Amazon S3, iRODS, and Google Drive) and is more secure than FileZilla.

### Large Data Transfers

Large data transfers will be facilitated by the VRSC and involves users shipping hard disk drives (not USB drives) with their data on it to the VRSC in Ames, Iowa.  The VRSC will then upload the data directly and put it in a project directory specified by the user.  

You can send hard drives containing data to the VRSC if you have very large amounts of data (typically greater than 50GB) to transfer to Ceres or if the network speed at your location is slow. Please follow these instructions:

1. Submit an email request to the VRSC [scinet_vrsc@USDA.GOV](mailto:scinet_vrsc@USDA.GOV?subject=large%20data%20transfer%20request) for a data transfer with the following information:

   * Amount of data
   * Target project directory
   * Type of filesystem the data is coming from (Window, Mac, Linux)

   If you don't already have a project directory please request one first: [Request Project Storage](https://e.arsnet.usda.gov/sites/OCIO/scinet/accounts/SitePages/Project_Allocation_Request.aspx) (eAuthentication required)

2. Copy the data onto a SATA hard drive or SSD

   * You will be responsible for purchasing your own drive(s)
   * Any type of hard drive (not a USB drive) is fine but SSDs will be more tolerant of the postal system
   * Disks must be EXT4, NTFS, HFS, XFS, or FAT formatted

3. Ship the disk to the following address and email the tracking information to scinet_vrsc@USDA.GOV. Include a print out of your email containing the data transfer request to VRSC in your package. Send to:

   Nathan Humeston<br>
   74 Durham<br>
   613 Morrill Rd<br>
   Ames, IA 50011-2100  

4. Once we receive the data we will copy it over to the appropriate project directory and notify you once it is complete.

5. Please include a prepaid return shipping label so that we can send the drive(s) back to you after the data transfer is complete. Otherwise the drive(s) will not be returned.

# Modules

The Environment Modules package provides dynamic modification of your shell environment. This also allows a single system to accommodate multiple versions of the same software application and for the user to select the version they want to use. Module commands set, change, or delete environment variables, typically in support of a particular application.

## Useful Modules Commands

Here are some common module commands and their descriptions:

Command | Description
--- | ---
`module list` | List modules currently loaded in your environment
`module avail` / `module spider` | List available modules
`module unload <module name>` | Remove \<module name> from the environment
`module load <module name>` | Load \<module name> into the environment
`module help <module name>`	| Provide information about \<module name>
`module swap <module one> <module two>` | Replace \<module one> with \<module two> in the environment

For example to use NCBI-BLAST installed on Ceres, follow these steps:
```
$ module load blast+
```

This will load latest version of NCBI-BLAST into your environment and you can use all commands that come with this installation. To see the path to the loaded software and the version type
```
$ which blastp
```

which should display something like:
```
/software/7/apps/blast+/2.9.0/bin/blastp
```

If you want to load legacy NCBI-BLAST on Ceres, follow the example below:
```
$ module load blast
$ which blastall
```
should display something like
```
/software/7/apps/blast/2.2.26/bin/blastall
```

If you would like to find out more about a particular software module, you can use the  `module help`  command, e.g.
```
$ module help blast
```

will output basic information about the blast package, including an URL to the package website.

## Loading and Unloading Modules

You must remove some modules before loading others, to switch versions or dependencies.

For example, if you have already loaded a blast+ module using the "module load blast+" command to use latest version of NCBI-BLAST, but later you want to load a previous version of blast+ (2.2.30), then follow the steps below:
```
$ module swap blast+ blast+/2.2.31
```
or:

```
$ module unload blast+
$ module load blast+/2.2.31
```
```
$ which blastp
```

The last command should display
```
/software/7/apps/blast+/2.2.31/bin/blastp
```

Another example. If you want to compile parallel C, C++, or Fortran code and wanted to use OpenMPI instead of MPICH which is currently loaded in your environment, you can use  `module swap`  or  `module unload`:
```
$ module swap mpich openmpi
```
or:
```
$ module unload mpich
$ module load openmpi
```

Some modules depend on other modules, so additional modules may be loaded or unloaded with one module command. For example, BEAST requires a Java module, so loading the "beast" module automatically loads the correct Java version:
```
$ module load beast
$ which java
```
should display something like:
```
/software/7/apps/java/1.8.0_121/bin/java
```

If you find yourself regularly using a set of module commands, you may want to add these to your configuration files (.bashrc for Bash users, .cshrc for C shell users).

## Module: command not found

The error message module: command not found is sometimes encountered when switching from one shell to another or attempting to run the module command from within a shell script or batch job. The reason that the module command may not be inherited as expected is that it is defined as a function for your login shell. If you encounter this error execute the following from the command line (interactive shells) or add to your shell script:
```
$ source /etc/profile.d/modules.sh
```


# Quotas on Home and Project Directories

Each file on a Linux system is associated with one user and one group. On Ceres, files in a user's home directory by default are associated with the user's primary group, which has the same name as user's SCINet account. Files in the project directories by default are associated with the project groups. Group quotas that control the amount of data stored are enabled on both home and project directories.

At login, current usage and quotas are displayed for all groups that a user belongs to. The `my_quotas` command provides the same output:
```
$ my_quotas
```

If users need more storage than what is available in the home directory, they should visit the [Request a Project Storage](/support/request-storage) page. Several users may work on the same project and share the same project directory.

Project directories are located in the 2.3PB Lustre space that is mounted on all nodes as /lustre/project and is also accessible as /project. Directories in /project are not backed up. **It is not recommended to run jobs from a directory in /KEEP.**

Since on Ceres usage and quotas are based on groups, it's important to have files in the home directories to be associated with the users' primary groups, and files in the project directories to be associated with project groups. Sometimes it may happen that files that were originally located in a home directory, were later moved to a project directory with the group ownership preserved. In this case even though files will be located in a project directory, they still will count against home directory quota. To fix this, change the group ownership of these files to the project directory group. The following command will change group association of all files in the project directory in /project (it may take a while if there are too many files in the directory):
```
$ chgrp -R proj-<project_directory_name> /project/<project_directory_name>
```

To search for files owned by your primary group in a project directory, issue:
```
$ find /project/<project_directory_name> -group <SCINet UserID> -type f
```

For more information about storage options, refer to [SCINet Storage Guide](/guide/storage).

## Local Sharing of Files with Other Users
Users who would like to share files with other users can use /90daydata/shared directory. Files older than 90 days will be automatically deleted.

NOTE: Files in /90daydata/shared folder by default are accessible to everybody on the system. Thus, this mechanism for sharing should only be used for files of a non-confidential nature.


# Running Application Jobs on Compute Nodes

Users will run their applications on the cluster in either interactive mode or in batch mode. Interactive mode ( `salloc`  or  `srun`  command) is familiar to anyone using the command line: the user specifies an application by name and various arguments, hits Enter, and the application runs. However, in interactive mode on a cluster the user is automatically switched from using a login node to using a compute node. This keeps all the intense computation off the login nodes, so that login nodes can have all the resources necessary for managing the cluster. You should always use interactive mode when you are running your application but not using batch mode. **Please do not run your applications on the login nodes, use the interactive mode.**

Interactive mode should only be used when interaction is required, for example when preparing or debugging a pipeline. Otherwise the batch mode should be used. Batch mode requires the user to write a short job script (see examples at section [Batch Mode](#batch-mode)) or use the [Ceres Job Script Generator](/support/ceres-job-script).

Ceres uses Simple Linux Utility for Resource Management (SLURM) to submit interactive and batch jobs to the compute nodes. Requested resources can be specified either within the job script or using options with the  `salloc`,  `srun`, or  `sbatch`  commands.

## Partitions or Queues

Compute jobs are run on functional groups of nodes called partitions or queues. Each different partition has different capabilities (e.g. regular memory versus high memory nodes) and resource restrictions (e.g. time limits on jobs). Nodes may appear in several partitions. 

Some of the Ceres compute nodes have been purchased by individual researchers or research groups. These nodes are available to the owners in the priority* partitions but can also be used by anyone on the cluster through \*-low and scavenger* partitions. These partitions have been introduced to increase usage of the priority nodes while still allowing node owners to have guaranteed fast access to priority nodes. All \*-low partitions have 2-hour time limit. Scavenger* partitions have 3-weeks time limit, but jobs in this partition will be killed when resources are requested for the jobs in priority* partitions. Since jobs in the scavenger* partitions can be killed at any moment, running in those partitions does not affect job priorities in the community partitions.

The following table lists partitions. Number of nodes in a specific partition can be adjusted from time to time and be different from the one published in this document.

#### Community partitions

Name | Nodes | Logical Cores per Node | Maximum Simulation Time | Default Memory per Core | Function
--- | --- |--- |--- |--- |---
short	| 41 | 72,96 | 48 hours | 3000 MB | short simulation queue (default)
medium	| 32 | 72,96 | 7 days | 3000 MB | medium length simulation queue
long	| 11 | 72,96 | 21 days | 3000 MB | long simulation queue
long60	| 2 | 72 | 60 days	| 3000 MB | extra long simulation queue
mem	| 4 | 80 | 7 days	| 16000 MB | large memory queue
longmem	| 1 | 80 | 1000 hours | 16000 MB | long simulation large memory queue
mem768	| 1 | 80 | 7 days | 7900 MB | new node with 768GB of memory
debug	| 2 | 72,96 | 1 hour | 3000 MB | for testing scripts and runs before submitting them

#### Partitions that allow all users access to priority nodes

Name | Nodes | Logical Cores per Node | Maximum Simulation Time | Default Memory per Core | Function
--- | --- |--- |--- |--- |---
mem768-low | 3	| 80 | 2 hours	| 7900 MB | priority nodes with 768GB of memory
mem-low	| 16 | 80,96 | 2 hours | 16000 MB | priority nodes with 1.5TB of memory
gpu-low	| 1 | 72 | 2 hours | 3000 MB | priority GPU node
brief-low | 92 | 72,96 | 2 hours | 3000 MB | all new nodes with 384GB of memory
scavenger | 49 | 72,80 | 21 days | 3000 MB | non-GPU priority nodes; scavenger jobs can be killed at any moment
scavenger-gpu | 1 | 72 | 21 days | 3000 MB | GPU priority node; jobs can be killed at any moment

#### Priority partitions available only to those users who purchased nodes

Name | Nodes | Maximum Simulation Time | Default Memory per Core | Function
--- | --- |--- |--- |---
priority | 49 | 2 weeks | 3000 MB | priority nodes with 384GB memory
priority-mem | 16 | 2 weeks | 16000 MB | priority nodes with 1.5TB memory
priority-mem768 | 3 | 2 weeks | 7900 MB | priority nodes with 768 GB memory
priority-gpu | 1 | 2 weeks | 3000 MB | priority GPU node


**At most 1440 cores and 5760 GB of memory can be used by all simultaneously running jobs per user** across all community and \*-low partitions. In addition, up to 800 cores and 2100 GB of memory can be used by jobs in scavenger* partitions. Any additional jobs will be queued but won't start. At times these limits can be lowered to prevent a small group of users overtaking the whole cluster.

Users that have access to priority partitions are limited by the amount of resources purchased by the group. For example, if a group has purchased one 768GB node, then group members cannot use more than an equivalent of one 768GB node across all jobs simulteniously running in priority-mem768 partition even when there are idle nodes in the partition. However all users on the system can use these idle nodes through \*-low and scavenger* partitions. Each group that has purchased nodes on Ceres, has a special QOS created for it. To list QOSes for your account, issue "sacctmgr -Pns show user format=qos". The group's QOS needs to be specified when submitting a job to a priority partition via the "-q" salloc/sbatch/srun option. When users submit a job to a priority partition, any node in the partition can be assigned to the job. 

To get current details on all partitions use the following scontrol command:
```
$ scontrol show partitions
```

### Allocation of Cores

On Ceres hyper-threading is turned on. That means that each physical core on a node appears as two separate processors to the operating system and can run two threads. The smallest unit of allocation per job is a single hyper-threaded core, or 2 logical cores, corresponding to specifying  `-n 2`  on  `salloc/srun/sbatch`  commands (i.e. jobs cannot access a single hyper-thread within a core). If a job requests an odd number of cores (`-n 1, -n 3,`...) SLURM will automatically allocate the next larger even number of cores.

### Allocation of Memory

Each allocated core comes with a default amount of memory listed in the table above for different SLURM partitions. If a job attempts to use more memory than what was allocated to a job it will be killed by SLURM. In order to make more memory available to a given job, users can either request the appropriate total number of cores or request more memory per core via the  `--mem-per-cpu`  flag to  `salloc/srun/sbatch`  commands.

For example, to support a job that requires 60GB of memory in the short partition, a user could request 20 logical cores (`-n 20`) with their default allocation of 3000MB or 2 logical cores with 30GB of memory per core via  `--mem-per-cpu 30GB`. Please note that a single hyper-threaded core (2 logical cores) is the smallest unit of allocation. Of course, any other mix of memory per core and total number of cores totaling 60GB would work as well depending on the CPU characteristics of the underlying simulation software.

### Allocation of Time

When submitting interactive or batch job users can specify time limit by using the  `-t`  (`–time=`) option on  `salloc/srun/sbatch`  commands. If the time limit is not explicitly specified, it will be set to the partition's Maximum Simulation Time (see the table above).


## Slurm accounts

To provide better Ceres usage report all Ceres users have been assigned Slurm accounts based on their project groups. If you don't have a project, then your default and only Slurm account is scinet. If you have more than one project, then your default Slurm account is one of the project names. You can specify a different Slurm account when submitting a job by using “-A <account_name>” option on salloc/srun/sbatch command or adding “#SBATCH -A <account_name>” to the job script.
  
 To see all your Slurm accounts and your default account at any time, use “sacctmgr -Pns show user format=account,defaultaccount”
  
 You can change your default Slurm account running slurm-account-selector.sh on the login node.
 

## Interactive Mode

A user can request an interactive session on Ceres using SLURM's  `srun`  or  `salloc`  commands. The simplest way to request an interactive job is by entering the command  `salloc`:
```
$ salloc
```

which will place you in an interactive shell. This interactive shell has a duration of 2 days and will request a single hyper-threaded core (2 logical cores) with 6000 MB of allocated memory on one of the compute nodes.

To prevent users from requesting interactive nodes and then not using them, there is an inactivity timeout set up. If there is no command running on a node for an hour and a half, the job will be terminated. Otherwise the interactive job is terminated when the user types exit or the allocated time runs out.

For more fine grained control over the interactive environment you can use the  `srun`  command. Issue the  `srun`  command from a login node. Command syntax is:
```
$ srun --pty -p queue -t hh:mm:ss -n tasks -N nodes /bin/bash -l
```

Option |Value
--- | ---
-p |	queue (partition)
-t	| maximum runtime
-n	| number of cores
-N	| number of nodes

The following example commands illustrate an interactive session where the user requests 1 hour in the short queue, using 1 compute node and 20 logical cores (half of the cores available on the original compute node), using the bash shell, followed by a BLAST search of a protein database.

Start the interactive session:
```
$ srun --pty -p short -t 01:00:00 -n 20 -N 1 /bin/bash -l
```

Load NCBI-BLAST+ on the compute node:
```
$ module load blast+
```

Uncompress the nr.gz FASTA file that contains your sequence database:
```
$ gzip -d nr.gz
```

Generate the blast database:

```
$ makeblastdb -in nr -dbtype prot
```

Search the nr database in serial mode with a set of queries in the FASTA file blastInputs.fa:

```
$ blastp -db nr -query blastInputs.fa -out blastout
```

Return to the login node:

```
$ exit
```

## Requesting the Proper Number of Nodes and Cores

SLURM allows you to precisely choose the allocation of compute cores across nodes. Below are a number of examples that show different ways to allocate an 8 core job across the Ceres cluster

`salloc/srun/sbatch`  options | core distribution across nodes
--- | ---
`-n 8`                       | pick any available cores across the cluster (may be on several nodes or not)
`-n 8 -N 8`                  | spread 8 cores across 8 distinct nodes (i.e. one core per node)
`-n 8 --ntasks-per-node=1`   | same as  `-n 8 -N 8`
`-n 8 -N 4`                 |  request 8 cores on 4 nodes (however the spread might be uneven, i.e. one node could end up with 5 cores and one core each for the remaining 3 nodes)
`-n 8 --ntasks-per-node=2`  |  request 8 cores on 4 nodes with 2 cores per node
`-n 8 -N 1`                  | request 8 cores on a single node
`-n 8 --ntasks-per-node=8`   | same as  `-n 8 -N 1`

## Batch Mode
### Serial Job

Jobs can be submitted to various partitions or queues using SLURM's `sbatch` command. The following is an example of how to run a blastp serial job using a job script named "blastSerialJob.sh". The content of blastSerialJob.sh is as follows:
```bash
#!/bin/bash
#SBATCH --job-name="blastp"   #name of this job
#SBATCH -p short              #name of the partition (queue) you are submitting to
#SBATCH -N 1                  #number of nodes in this job
#SBATCH -n 40                 #number of cores/tasks in this job, you get all 20 physical cores with 2 threads per core with hyper-threading
#SBATCH -t 01:00:00           #time allocated for this job hours:mins:seconds
#SBATCH --mail-user=emailAddress   #enter your email address to receive emails
#SBATCH --mail-type=BEGIN,END,FAIL #will receive an email when job starts, ends or fails
#SBATCH -o "stdout.%j.%N"     # standard output, %j adds job number to output file name and %N adds the node name
#SBATCH -e "stderr.%j.%N"     #optional, prints our standard error
date                          #optional, prints out timestamp at the start of the job in stdout file
module load blast+            #loading latest NCBI BLAST+ module
blastp -db nr -query blastInputs -out blastout  # protein blast search against nr database
date                          #optional, prints out timestamp when the job ends
#End of file
```

Launch the job like this:
```
$ sbatch blastSerialJob.sh
```

### Running a Simple OpenMP Job

The following example will demonstrate how to use threads. We will use the following OpenMP C code to print "hello world" on each thread. First copy and paste this code into a file, e.g. "testOpenMP.c".
```
#include <omp.h>
#include <stdio.h>
int main(int argc, char* argv[]){
 int id;
 #pragma omp parallel private(id)
  {
  id=omp_get_thread_num();
  printf("%d: hello world \n",id);
 }
 return 0;
}
```

Now load the gcc module and compile the code :
```
$ module load gcc
$ gcc testOpenMP.c -fopenmp -o testOpenMP
```

Now create a batch job script (OMPjob.sh) to test number of threads you requested:
```bash
#!/bin/bash
#SBATCH --job-name=OpenMP
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 20
#SBATCH --threads-per-core=1
#SBATCH -t 00:30:00
#SBATCH -o "stdout.%j.%N"
#SET the number of openmp threads
export OMP_NUM_THREADS=20
./testOpenMP
# End of file
```

Launch the job using the batch script like this:
```
$ sbatch OMPjob.sh
```

The stdout* file from the above job script should contain 20 lines with "hello world" from each thread.

### Parallel MPI Job

The following is the example to run Hybrid RAxML which uses both MPI and PTHREADS. It will start 2 MPI processes (one per node) and each process will run 40 threads (one thread per logical core).

Create a SLURM script like this (for example, RAxMLjob.sh, but use your own alignment file rather than "align.fasta"):
```bash
#!/bin/bash
#SBATCH --job-name=raxmlMPI
#SBATCH -p short
#SBATCH -N 2
#SBATCH --ntasks-per-node=40
#SBATCH -t 01:00:00
#SBATCH -o "stdout.%j.%N"
# We requested 2 nodes, 40 logical cores per node for a total of 80 logical cores for this job
module load raxml            #loading latest raxml module, which will also load an MPI module
mpirun -np 2 raxmlHPC-MPI-AVX -T 40 -n raxmlMPI -f a -x 12345 -p 12345 -m GTRGAMMA -# 100 -s align.fasta
# End of file
```

And execute it with sbatch:
```
$ sbatch RAxMLjob.sh
```

## Useful SLURM Commands

Command | Description | Example
--- | --- | ---
`squeue`	| Gives information about jobs	| `squeue`  or  `squeue -u jane.webb`
`scancel`	| Stop and remove jobs	| `scancel <job id>`  or  `scancel -u jane.webb`
`sinfo`	| Gives information about queues (partitions) or nodes	| `sinfo`  or  `sinfo -N -l`
`scontrol` | Provides more detailed information about jobs, partitions or nodes | `scontrol show job <job id>`  or  `scontrol show partition <partition name>`  or  `scontrol show nodes`
`seff` | Provides resource usage report for a finished job | `seff <job id>`

## Local Scratch Space 

All compute nodes have 1.5 TB of fast local temporary data file storage space supported by SSDs. This local scratch space is significantly faster and supports more input/output operations per second (IOPS) than the mounted filesystems on which the home and project directories reside. A job sets up a unique local space accessible available only with the job script via the environmental $TMPDIR variable. You can use this for any scratch space disk space you need, or if you plan to compute on an existing large data set (such as a sequence assembly job) it might be beneficial to copy all your input data to this space at the beginning of your job, and then do all your computation on $TMPDIR. You must copy any output data you need to keep back to permanent storage before the job ends, since $TMPDIR will be erased upon job exit. The following example shows how to copy data in, and then run from $TMPDIR.

```bash
#!/bin/bash
#SBATCH --job-name="my sequence assembly"   #name of the job submitted
#SBATCH -p short              #name of the queue you are submitting job to
#SBATCH -N 1                  #number of nodes in this job
#SBATCH -n 40                 #number of cores/tasks in this job, you get all 20 cores with 2 threads per core with hyper-threading
#SBATCH -t 01:00:00           #time allocated for this job hours:mins:seconds
#SBATCH --mail-user=emailAddress   #enter your email address to receive emails
#SBATCH --mail-type=BEGIN,END,FAIL #will receive an email when job starts, ends or fails
#SBATCH -o "stdout.%j.%N"     # standard out %j adds job number to output file name and %N adds the node name
#SBATCH -e "stderr.%j.%N"     #optional, it prints out standard error

# start staging data to the job temporary directory in $TMPDIR
MYDIR=`pwd`
/bin/cp –r $MYDIR $TMPDIR/
cd $TMPDIR
 
# add regular job commands like module load and running scientific software
 
# copy output data off of local scratch
/bin/cp -r output $MYDIR/output
 
# If you do not know the output names, you can issue:
#   rsync –a $TMPDIR/*  $MYDIR/
# which will only copy back new or changed files, but rsync takes longer.
 
#End of file
```  


# Compiling Software, Installing R/Perl/Python Packages and Using Containers

The Ceres login node provides access to a wide variety of scientific software tools that users can access and use via the module system. These software tools were compiled and optimized for use on Ceres by members of the Virtual Research Support Core (VRSC) team. Most users will find the software tools they need for their research among the provided packages and thus will not need to compile their own software packages.

If users would like to compile their own software with GNU compilers, they will need to load the gcc module. It is recommended to **compile on compute nodes and not on the login node**. However, before embarking on compiling their own software packages we strongly encourage users to contact the VRSC team to ensure that their required tool(s) might not be better distributed as a shared package within the official software modules tree. All new software needs to be approved by SOC committee before being centrally installed on the system. To request a new software package to be installed, visit the [Request Software](/support/request-software) page.

The popular R, Perl, and Python languages have many packages/modules available. Some of the packages are installed on Ceres and are available with the r/perl/python_2/python_3 modules. To see the list of installed packages, visit the [Software Overview](/guide/software) page or use  `module help <module_name>`  command. If users need packages that are not available, they can either request VRSC to add packages, or they can download and install packages in their home/project directories. We recommend installing packages in the project directories since collaborators on the same project most probably would need the same packages. In addition, home quotas are much lower than project directories quotas. See the [Guide to Installing R, Python, and Perl Packages](/guide/packageinstall/) for instructions and examples on how to add packages/modules for these languages.

Another resource for installing your own software programs is the Conda package manager. See the [User-Installed Software on Ceres Using Conda Guide](/guide/conda).

Some software packages may not be available for the version of Linux running on the Ceres cluster. In this case users may want to run containers. Containers are self-contained application execution environments that contain all necessary software to run an application or workflow, so users don't need to worry about installing all the dependencies. There are many pre-built container images for scientific applications available for download and use. See the document [Singularity on Ceres](/guide/singularity) for instructions and examples on how to download and run Docker and Singularity containers on Ceres.

# SCINet Citation/Acknowledgment in Publications

Add the following sentence as an acknowledgment for using CERES as a resource in your manuscripts meant for publication:  

**"This research used resources provided by the SCINet project of the USDA Agricultural Research Service, ARS project number 0500-00093-001-00-D."**
