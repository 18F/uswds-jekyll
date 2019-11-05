---
title: FAQ's
description: Frequently asked Questions
permalink: /support/faq/
author: VRSC
layout: page
# sidenav:  is a side navigation bar is needed it can be specified in the _data/navigation.yml file
---
# My terminal window keeps freezing. Is there something I can do to stop this?
As a result of the current networking infrastructure, working at the command line can be difficult sometimes because displaying hundreds of lines freezes the display. The solution to this is to enable SSH compression. There are a few different ways to do ssh using compression Do ssh -C from the command line, instead of ssh In Putty, click on SSH on the left, then check Enable compression In Unix, alter your ~/.ssh/config file to contain these lines:

```
Host login.scinet.science  
Compression yes
```

# I log in at the command line but the system keeps logging me out. Is there something I can do to stop this?
On Linux or Mac OS just create a ~/.ssh/config entry similar to this:

```
Host ceres
HostName login.scinet.science
User  ForwardAgent yes
ForwardX11 yes
TCPKeepAlive yes
ServerAliveInterval 20
ServerAliveCountMax 30
```

That will send a "keepalive" signal every 20 seconds and keep retrying for up to 30 failures. This also simplifies your login to just: `ssh ceres`

If you don't want to use the config file method you can just add these options to the ssh command: `ssh -o TCPKeepAlive=yes -o ServerAliveInterval=20 -o ServerAliveCountMax=30 @login.scinet.science -XA`

Using PuTTY on windows you can do the same via the Connections tab. Set the "Seconds between keepalives" to 20 and check the "Enable TCP keepalives"

# How do I change my password on Ceres?
If your password is expired you should be prompted to change your password when you attempt to login.

If you are still able to login, do so and type "passwd"  you will be prompted for your old password and asked for a new one.

```
[first.last@sn-cn-8-1:~] $ passwd
Changing password for user first.last
Current Password:

New password:
Retype new password:
passwd: all authentication tokens updated successfully.
```

A video demonstrating the process here:
[How_to_ssh_to_Ceres_and_change_password.mp4 - SCINet Virtual Research Support Core](https://3.basecamp.com/3625179/buckets/5538276/uploads/1058337600)

# What are the password requirements?
* AT LEAST 12 characters long and have AT LEAST 3 different character classes:
  lower case letters, upper case letters, digits and special symbols (?^[ etc.)
* different from the expired password: at least 5 character changes (inserts,
  removals, or replacements) are required
* difficult to guess or brute force. Palindromes, passwords containing your
  username, and other patterns will be denied.

Older passwords CAN NOT be reused.

# How do I compile software?

Ceres has development libraries available on all nodes.  There is a system version of gcc which is version 4.8.5 and well maintained by CentOS.  the VRSC also makes availbile modules with newer versions of gcc (currently version 5.3.0), the intel compilers (currently 2016.3 and 2017.3), and clang(3.7.1) Use:

`module load gcc`

or

`module load intel`

or

`module load clang`

use "module avail intel" or "module avail gcc" to see all of the versions that are available at any given time to make use of them.   Note that after using these compilers you will will probably need to load the modules again in the future to run the code  you compiled as well.

# How do I compile MPI codes?
Load the module for the MPI library you wish to use, generally open openmpi, but mpich is availible as well. MPI is included by default with the intel compiler.

```
module avail openmpi
module load openmpi
```

The table below summarizes the relevant GNU compiler names and command line flags for serial, OpenMP and MPI codes.

 |               | Serial      | MPI        | OpenMP                   | MPI+OpenMP
| --- | --- | --- | --- | --- |
| Fortran  | gfortran  | mpif90  | gfortran -fopenmp  | mpif90 -fopenmp
 | C            | gcc          | mpicc   | gcc -fopenmp          | mpicc -fopenmp
 | C++        | g++          | mpicxx  | g++ -fopenmp          | mpicxx -fopenmp
