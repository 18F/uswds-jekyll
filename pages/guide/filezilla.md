---
title: Filezilla
description: Filezilla
permalink: /guide/filezilla/
author: Jordan Hoosman
layout: page
---


1. Download Filezilla from [https://filezilla-project.org/](https://filezilla-project.org/)
2. Filezilla a common target for hackers.  Please do not download it from any other source.
3. Install Filezilla being careful to decline their “optional offers”  you probably do not want any of these.
4. After installation open the “site manager” by clicking the icon in the upper right hand corner. This opens the Site Manager window. <img src="/assets/img/filezilla1.png">
5. In the Site manager window click “New Site” and another subwindow will pop up.
    1. Under “my sites” this will create a “New Site entry” Click on this and change it to “Ceres”
    2. In the Host box enter “ceres.scinet.usda.gov"
    3. Protocol should be “SFTP – SSH File Transfer Protocol”
    4. Logon Type should be “Interactive” (Asks for two-factor verification code)
    5. User is your Ceres username.
    6. Your window should now look like this: <img src="/assets/img/filezilla2.png">
6. Now click “Connect” at the bottom and you should be prompted for your Ceres password.  
7. After entering your password and clicking “OK” You are connected to Ceres
8. You can now transfer files in either direction by dragging them from one pane to the other. 
9. Your Ceres site definition is also saved and you can just click on the “Ceres” entry in Site Manager next time you need to move files.

<video width=500 height=500 controls>
    <source src="/assets/videos/Filezilla setup for Ceres.mp4">
</video>
