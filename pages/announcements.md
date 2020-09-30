---
title: Announcements
layout: categories
permalink: /announcements/
---


Various announcements from the Virtual Research Support Core to SCINet users. See also the [SCINet VRSC Basecamp message board](https://3.basecamp.com/3625179/buckets/5538276/message_boards/764923015) (must have a SCINet account to access). 

For system downtime information see the [System Downtime page](/downtime/) for planned downtime and [SCINet VRSC Basecamp message board](https://3.basecamp.com/3625179/buckets/5538276/message_boards/764923015) (must have a SCINet account to access) about unplanned outages/system status.

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

 
