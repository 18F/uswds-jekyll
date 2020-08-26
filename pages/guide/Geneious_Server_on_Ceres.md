---
title: Geneious Software Use
description: Geneious Software Use Guide
permalink: /guide/geneious/
author: VRSC
layout: page
# sidenav:  is a side navigation bar is needed it can be specified in the _data/navigation.yml file
---


Ceres has a Geneious Server setup. This server is also providing 20 floating licenses for Ceres users use.


Caveats:
* The floating license server will only work at USDA sites or via VPN due to firewall restrictions.
* Geneious and its license server should work through the both regular USDA VPN and the SCINet ocvpn vpn servers. 
* If you do encounter license server issues let us know at [scinet_vrsc@usda.gov](mailto:scinet_vrsc@usda.gov)

First download the Geneious client from [https://www.geneious.com/download/](https://www.geneious.com/download/)

Install and start Geneious

Geneious will complain about not having a license.  click "Activate a License"

![screenshot of Geneious software No License for Geneious R11 popup](/assets/img/geneious/geneious_license_expired.png)

On the "Enter Your License Details" screen,
  - select "Use floating license server",
  - enter `geneious.scinet.usda.gov` in the "Server" box, and
  - enter `27001` in the "Port" box.

![screenshot of Geneious software Enter Your License Details screen](/assets/img/geneious/geneious_floating_license_server.png)

After Geneious is started (see picture below):
1. click on "Geneious Server" in the list of Sources on the left
2. You will see a message on the right "you are not currently logged in to Geneious Server". Select the "Log in" button.
3. On the "Login to Geneious Server" popup screen:
   - Enter  Host name: "geneious.scinet.usda.gov"
   - Click the "Use SSL" box.  You can leave the port empty, it should fill in 443 on its own.
   - Enter your Ceres username in the "User Name" box, usually firstname.lastname
   - Enter your Ceres password immedialy followed by your GA code in the "Password" box  MyP@55w0rd123456
   - Click  "OK"

![screenshot of Geneious software login screen](/assets/img/geneious/geneious_login.png)

You should now be connected to the Geneious Server.
