---
title: SCINet File Transfer
description: Using Globus for fast file transfer and other methods
permalink: /guide/file-transfer/
author: VRSC
layout: page
# sidenav:  is a side navigation bar is needed it can be specified in the _data/navigation.yml file
---

#### Table of Contents
* [Best Practices](#best-practices)
* [Globus](#globus-data-transfer) (recommended)
  * [Login](#login)
  * [Copying Data](#copying-data)
  * [Globus Connect Personal](#globus-connect-personal)
* [Small Data Transfer Using scp and rsync](#small-data-transfer-using-scp-and-rsync)
* [Large Data Transfer by Shipping Hard Drives](#large-data-transfer-by-shipping-hard-drives)
* [Other Ways to Transfer Data](#other-ways-to-transfer-data)
* [Data Transfer to NCBI](#data-transfer-to-ncbi)


# Best Practices

* Globus Online is the recommended method for transferring data to and from the Ceres cluster. It provides faster data transfer speeds compared to scp, has a graphical interface, and does not require a GA verification code for every file transfer.
* Given the space and access limitations of a home directory, large amounts of data or data that will be used collaboratively should be transferred to a project directory. See the Ceres User Manual section [Quotas on Home and Project Directories](/guide/ceres/#quotas-on-home-and-project-directories) for more information on home and project directory quotas.
* If you have to transfer very large amounts of data or if network speed at your location is slow, please submit a request to the Virtual Research Support Core (VRSC) to ingress data from a hard drive as described below (section [Large Data Transfer by Shipping Hard Drives](#large-data-transfer-by-shipping-hard-drives)).
* If you have issues with transferring data, please contact the VRSC at [scinet_vrsc@USDA.GOV](mailto:scinet_vrsc@USDA.GOV?subject=help%20with%20transferring%20data).


# Globus Data Transfer

Globus Online is the recommended method for transferring data to and from the Ceres cluster. It provides faster data transfer speeds compared to scp, has a graphical interface, and does not require a GA verification code for every file transfer. To transfer data to/from a local computer, users will need to install Globus Connect Personal which does NOT require admin privileges.

The instructional video at [https://www.youtube.com/watch?v=I3lnsCAfx3Q](https://www.youtube.com/watch?v=I3lnsCAfx3Q) demonstrates how to transfer files between local computer, Ceres, Atlas and Juno using Globus.

## Login
* In a browser, navigate to [https://www.globus.org/](https://www.globus.org/), click ‘Log In’ in the upper right corner.
* There are several ways to login to the Globus Web App. Login using one of the available methods:
  1. ORCiD iD login (recommended). You can use your ORCiD, a persistent digital identifier for individual researchers, to sign into Globus (all ARS researchers should have an ORCiD). Click on "Sign in with ORCiD iD" at the bottom of the page. If you don't yet have an ORCiD, please visit [https://orcid.org/](https://orcid.org/) to obtain one.
  2. Globus ID login. You can create an account on Globus ID and use it to log into Globus. See the link to Globus ID under the list of organizational logins.
  3. Organizational login. Many organizations, mostly universities, have organizational logins. ARS currently does not provide an organizational login. If your organization provides an organizational login, select your organization from the list and login with your organization credentials at the familiar login page.
  4. Google account login. Click on “Sign in with Google” at the bottom of the page if you want to use your google account.
* You should now be on the Globus ‘File Manager’ page. You should see two panels. If you don't, click on the 2-panels icon at the top right of the screen. You should now see two panels:

![Globus online homescreen showing two panels](/assets/img/file-transfer/globus-homescreen.png)

## Copying Data
* The two panes represent the two systems that you want to copy data between. You will need to select a Collection (an Endpoint) for each pane and most likely, authenticate.
* Click in the ‘Collection’ box on one of the panes. A selection window will appear. Recent collections will be listed under recent tab. Click on other tabs to see collections that you've bookmarked, created or got from other people. In the Recent tab you will also see "Install Globus Connect Personal" button. See below how to install Globus Connect Personal on your computer to transfer data to/from this computer.
* If you see your desired collection, click it and continue. If you do not see your desired collection start typing the name in the box at the top. When your collection appears, select it.
* If authentication is required for the selected collection, required fields or other instructions will appear.
* Type or select “Ceres DTN” for Ceres DTN, "msuhpc2#Atlas-dtn" for Atlas DTN or "NAL DTN 0" for Juno. You will be prompted to login.
* Username is your Ceres username. Your password is your Ceres password **PLUS the six digits generated by Google Authenticator** for access to the Ceres cluster. You would use ‘Password123456’ for the password field where ‘123456’ would be the current code from Google Authenticator and ‘Password’ would be your normal SCINet password.
* To transfer data between Ceres and Atlas clusters, log into Ceres DTN in one pane and to Atlas DTN in the other pane. Similarly, to transfer data to/from Juno, log into NAL TN 0 in one of the panels.
* Once you have logged in on both panes you will need to navigate to the data you want to copy in one pane (source pane) and navigate to the location you want it copied to on the other pane (destination pane). You can either click on directory names or type the full path in the Path box (under the Collection box).
* Before you start your copy, look at the Transfer & Sync Options at the bottom of the page (click on arrow to see available options). To see a short description of each option click on "i" next to the option.
* To start the transfer click the blue box with the arrow at the bottom of the page pointing in the direction of the destination pane.
* You may now click ‘Activity’ at the left to see a list of current and prior transfers. Click on "File Manager" at the top left of the page to get back to the main page.

## Globus Connect Personal
To transfer files to your personal computer you may use Globus Connect Personal. A link “Install Globus Connect Personal” can be found in the Recent tab and in the "More Options" tab in the list of Collections. Click on "Collection" box to get to the list.  The install instructions are available at [https://docs.globus.org/how-to/globus-connect-personal-windows/](https://docs.globus.org/how-to/globus-connect-personal-windows/).

By default, Globus Connect Personal prompts to be installed in C:\Program Files which requires administrator rights. However you don't need Administrator rights to install Globus Connect Personal on your local machine. If you do not have Administrator rights browse to a place you have write access to (e.g. your Desktop folder) or contact your local IT staff for assistance.


# Small Data Transfer Using scp and rsync

scp is usually available on any Linux or MacOS machine, and on Microsoft Windows 10 (in PowerShell). 
It’s best used when you need to transfer a single file.

Below are examples of scp commands to be issued on your local machine. In these examples
* `<local_path_to_file/>` can be omitted, in this case current directory on your local machine will be used
* `<remote_path_to_file/>` can be omitted, in this case home directory on Ceres or Atlas will be used
* `dest.ext` can be omitted, in this case the name of the file being transferred will be used.

Transfer To Ceres:
```
scp <local_path_to_file/>file.ext  <SCINetID>@ceres-dtn.scinet.usda.gov:<remote_path_to_file/>dest.ext
```
Transfer To Atlas:
```
scp <local_path_to_file/>file.ext <SCINetID>@atlas-dtn.hpc.msstate.edu:<remote_path_to_file/>dest.ext
```

Transfer From Ceres:
```
scp <SCINetID>@ceres-dtn.scinet.usda.gov:<remote_path_to_file/>file.ext  <local_path_to_file/>dest.ext
```
Transfer From Atlas:
```
scp <SCINetID>@atlas-dtn.hpc.msstate.edu:<remote_path_to_file/>file.ext  <local_path_to_file/>dest.ext
```


It is not advised to use "`scp -r`" command to transfer directories to Ceres, since the setgid bit on directories at destination is not inherited. 
This is not a problem if directories are copied to /home/$USER but is a problem when copying to /project area and usually results in quota exceeded errors.

If you decide to use scp to transfer directories to /project, you will have to manually set a setgid bit on the directory and all subdirectories after the transfer using "`chmod g+s <dir_name>`" command. The following command will set ownership of the files in a directory in /project to the project group and set the setgid bit:
```
find /project/<project_name>/<dir> -exec chgrp proj-<project_name> {} + -a -type d -exec chmod g+s {} + 
```
To learn more about `scp` command and all available options issue "`man scp`".

Instead of `scp` one can use `rsync` command for bulk transfers. `rsync` synchronizes files and directories from one location to another while minimizing data transfer as only the outdated or inexistent elements are transferred. It is installed by default on macOS and is available on many Linux hosts. The following command will recursively transfer all new and updated files in the directory `<dir_name>` on the local machine into directory `/project/<project_name>/<dir_name>` on Ceres:
```
rsync -avz --no-p --no-g <dir_name> <SCINetID>@ceres-dtn.scinet.usda.gov:/project/<project_name>
```
To learn more about `rsync` command and all available options issue "`man rsync`".

# Large Data Transfer by Shipping Hard Drives

Large data transfers will be facilitated by the VRSC and involves users shipping hard disk drives (not thumb drives) with their data on it to the VRSC in Ames, Iowa.  The VRSC will then upload the data directly and put it in a project directory specified by the user.  

You can send hard drives containing data to the VRSC if you have very large amounts of data (typically greater than 50GB) to transfer to Ceres or if the network speed at your location is slow. Please follow these instructions:

1. Submit an email request to the VRSC [scinet_vrsc@USDA.GOV](mailto:scinet_vrsc@USDA.GOV?subject=large%20data%20transfer%20request) for a data transfer with the following information:

   * Amount of data
   * Target project directory.
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


# Other Ways to Transfer Data

Other programs that have a GUI to transfer data and are suitable for smaller file transfers are:

* Cyberduck - [https://cyberduck.io/](https://cyberduck.io/)

* FileZilla - [https://filezilla-project.org/](https://filezilla-project.org/)

Cyberduck supports multiple protocols (including Amazon S3, iRODS, and Google Drive) and is more secure than FileZilla.


# Data Transfer to NCBI

To transfer data to/from NCBI, ssh to a DTN node and use either ncftp commands (ncftpput, ncftpget) or Aspera command (ascp). Since ftp connections can be unstable we recommend using Aspera for large file transfers.

To use Aspera, you will need a private key file that you can acquire by following instructions listed on Page 3 of the document at [https://www.ncbi.nlm.nih.gov/books/NBK242625](https://www.ncbi.nlm.nih.gov/books/NBK242625)
