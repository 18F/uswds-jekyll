---
title: Geneious Software Guide
description: Geneious Software Use Guide
permalink: /guide/geneious/
author: VRSC
layout: page
# sidenav:  is a side navigation bar is needed it can be specified in the _data/navigation.yml file
---


Ceres has a Geneious Server setup. This server is also providing 20 floating licenses for Ceres users use.


Caveats:
* The floating license server will only work at USDA sites or via VPN due to firewall restrictions.
* Geneious and its license server should work through both the regular USDA VPN and the SCINet ocvpn vpn servers. 
* If you do encounter license server issues let us know at [scinet_vrsc@usda.gov](mailto:scinet_vrsc@usda.gov)


# Install and start Geneious

First download the Geneious client from [https://www.geneious.com/download/](https://www.geneious.com/download/)

Install it as usual and start it up.

Geneious will complain about not having a license. Click "Activate a License"

![screenshot of Geneious software No License for Geneious R11 popup](/assets/img/geneious/geneious_license_expired.png)

On the "Enter Your License Details" screen,
  - select "Use floating license server",
  - enter `geneious.scinet.usda.gov` in the "License Server" box, and
  - enter `27001` in the "Port" box.

![screenshot of Geneious software Enter Your License Details screen](/assets/img/geneious/geneious_floating_license_server.png)

After Geneious is started (see picture below):
* Click on "Geneious Server" in the list of Sources on the left
   -  If you dont see "Geneious Server" in the list of "Sources" you may need to download the "Geneious Server Plugin" from the  [Geneious Downloads Page](https://geneious.scinet.usda.gov/GeneiousServer/)
   -  Download the plugin then click on the file and it should install itself.
   -  Geneious will need to be restarted after installing new plugins.
* You will see a message on the right "you are not currently logged in to Geneious Server". Select the "Log in" button.
* On the "Login to Geneious Server" popup screen:
   - Enter  Host name: "geneious.scinet.usda.gov"
   - Click the "Use SSL" box.  You can leave the port empty, it should fill in 443 on its own.
   - Enter your Ceres username in the "User Name" box, usually firstname.lastname
   - Enter your Ceres password immediately followed by your Ceres GA code in the "Password" box  as an example if your password was "MyP@55w0rd" and GA app is showing "123456" you would use MyP@55w0rd123456
   - Click  "OK"

![screenshot of Geneious software login screen](/assets/img/geneious/geneious_login.png)

You should now be connected to the Geneious Server.
