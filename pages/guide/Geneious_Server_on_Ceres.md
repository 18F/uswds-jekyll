---
title: Geneious Software Use
description: Geneious Software Use Guide
permalink: /guide/geneious/
author: VRSC
layout: page
# sidenav:  is a side navigation bar is needed it can be specified in the _data/navigation.yml file
---


Ceres  has a Geneious Server setup.  This server is also providing 20 floating licenses for Ceres users use.

To use the Geneious server you will need to be at an "integrated site", use the VPN, or use SSH tunneling.

Caviats:
* Integrated sites currently include:  Clay Center NE;Albany,CA; Stoneville MS; Fort Collins, CO; Beltsville MD.  
* The floating license server does not work over SSH tunnels, but the server can still be used if you have a perpetual license or a floating license server at your site.

First download the Geneious client from [https://www.geneious.com/download/](https://www.geneious.com/download/)

Install and start Geneious

Geneious will complain about not having a license.  click [Activate a License]

![](/assets/img/geneious_license_expired.png)

For license details Select "Use floating license server" and enter:  

```
Server: sn-geneiousserver-0.scinet.ars.usda.gov
Port: 27001
```

![](/assets/img/geneious_floting_license_server.png)

After Geneious is started click on Geneious Server (Step 1 in diagram)

That will show the "you are not currently logged in to Geneious Server [ Log in ]

Dialog shown as Step 2.  Click that button.

That will bring up the Log in  subwindow shown below.

If you logged into the VPN or are at an integrated site fill in:

`Host Name: sn-geneiousserver-0.scinet.ars.usda.gov`

If you are using an SSH tunnel use:

`Host Name: localhost`

In all cases for port use 8080

`Port: 8080`

User Name is your Ceres Username, usually firstname.lastname

Password is your Ceres Password.

Click  [OK]

![](/assets/img/geneious_login.png)

You should now be connected to the Geneious Server.
