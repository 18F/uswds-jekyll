---
title: Announcements
layout: categories
permalink: /announcements/
---


Various announcements from the Virtual Research Support Core to SCINet users. See also the [SCINet Forum Announcements page](https://forum.scinet.usda.gov/c/announcements/6) (must have a SCINet account to access). 

For system downtime information see the [System Downtime page](/downtime/) for planned downtime and [SCINet Forum Announcements page](https://forum.scinet.usda.gov/c/announcements/6) (must have a SCINet account to access) about unplanned outages/system status.

## 22-April-2021

SCINet has launched a new discussion forum that replaces Basecamp:

https://forum.scinet.usda.gov 

SCINet projects on Basecamp will no longer be available after April 30, 2021.

From now on all announcements will be posted on the new SCINet Forum and published in this section of the SCINet website .

SCINet users will NOT receive email notifications from SCINet Forum UNTIL they login to the Forum for the first time. To login to SCINet Forum, go to https://forum.scinet.usda.gov, click on Log In and use your SCINet credentials (what you use to log in to Ceres or Atlas). Make sure to append the GA 6-digit code at the end of the SCINet password.

If you wish to save any data from Basecamp to your computer, please do it before April 30, 2021.


## 15-April-2021

The SCINet Scientific Advisory Committee (SAC) is seeking a representative from the Northeast Area for a 3-year term. 

The SAC meets monthly to provide input on planning, educational and communication activities of the SCINet Initiative. There is also opportunity for input on planning and policy initiatives. For example, SAC members created a quarterly SCINet newsletter, facilitated a user-needs virtual meeting with scientific points-of-contact across ARS research units, launched the new SCINet website, and hold multiple computation workshops and trainings annually. 

This is a 3-year term which begins immediately and will end March 2024. Please reply to Kathleen Yeater (Kathleen.yeater@usda.gov) with nomination(s) by next Friday April 23, 2021. Self-nominations are accepted. Please provide e-mail contact information of nominees, and the SAC Membership committee will continue with the application process for the NEA representative to SAC. 


## 05-Feb-2021

**galaxy.scinet.science is set to retire Feb 15, 2021**

Due to major refactoring, updates and policy changes we could not continue using the old database and are starting with a clean slate on galaxy.scinet.usda.gov 

galaxy.scinet.science is currently in "read-only" mode where users have access but cannot launch new jobs. Users have until 7AM CST Feb 15, 2021 to access galaxy.scinet.science and download the existing files. 

If you have any issues or concerns, email scinet_vrsc@usda.gov 


## 30-Sept-2020

The Atlas Cluster at Mississippi State is now availible to all SCINet Users!  Documentation on logging in has been added to the [Quick Start Guide](https://scinet.usda.gov/guide/quickstart#accessing-scinet).  Full documention on Altas is coming soon.


## 26-Aug-2020

The network vendor will be performing maintenance on the SCINet connection to the NCAH facility which houses Ceres on tomorrow morning, 8/27 from midnight CDT to 6am CDT.  They have also reserved the same time block the next night 8/28 in case it is needed.

This may cause network interruption which would terminate login sessions, and would not allow data transfers in and out of Ceres. 

This will not affect jobs which access the on-site filesystems, like /project. 

## 24-Aug-2020

We have a directory available for medium term usage which allows researchers to run multiple jobs against data in this directory over a 90 day period.
 
This should be faster than using /project , since not everyone will be using it , and it will be kept performant.  
 
To keep this space available for all researchers, and performing well, it needs to be kept at a low level of space.  To accomplish this, files will only be allowed on this space for a period of 90 days.  
Any file older than 90 days since last access is subject to DELETION.  This is permanent and the files cannot be recovered. 
Make sure that you move files out of this directory well before the time that they will be deleted, as this is automated.  If you forget and go on vacation, or get sick, the files will still be deleted.
 
Just like /project there is no backup for this space.
If you need to keep something, use /KEEP/PROJECTNAME
 
Additional warning:  If you download archived files, they may contain files with an access date from long ago. This date will still trigger deletion, so make sure that the files have a new access date. For example, when you untar a .tar or .tgz file, use the -m flag. If you use rsync to the space, do not use the -a flag, as that preserves date stamps.  
 
The name of this space is /90daydata, and it will go live Thursday, 8/27/20 at noon EDT.
 
The VRSC will create a directory /90daydata/PROJECTNAME for each /project/PROJECTNAME  directory, so that there is no confusion among different groups.
 
There will also be a space /90daydata/shared open to all for the passing of data between project groups.
This will be readable by everyone on the system, so only put data in there that is appropriate.

 
