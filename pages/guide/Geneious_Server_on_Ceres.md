---
title: Geneious Software Use
description: Geneious Software Use Guide
permalink: /guide/geneious/
author: VRSC
layout: page
# sidenav:  is a side navigation bar is needed it can be specified in the _data/navigation.yml file
---


Ceres has a Geneious Server setup. This server is also providing 20 floating licenses for Ceres users use.

To use the Geneious server you will need to be at an "integrated site", use the VPN, or use SSH tunneling.

Caveats:
* Integrated sites currently include: Clay Center, NE; Albany, CA; Stoneville, MS; Fort Collins, CO; Beltsville, MD.  
* The floating license server does not work over SSH tunnels, but the server can still be used if you have a perpetual license or a floating license server at your site.

First download the Geneious client from [https://www.geneious.com/download/](https://www.geneious.com/download/)

Install and start Geneious

Geneious will complain about not having a license.  click "Activate a License"

![screenshot of Geneious software No License for Geneious R11 popup](/assets/img/geneious/geneious_license_expired.png)

On the "Enter Your License Details" screen,
  - select "Use floating license server",
  - enter `sn-geneiousserver-0.scinet.ars.usda.gov` in the "Server" box, and
  - enter `27001` in the "Port" box.

![screenshot of Geneious software Enter Your License Details screen](/assets/img/geneious/geneious_floating_license_server.png)

After Geneious is started (see picture below):
1. click on "Geneious Server" in the list of Sources on the left
2. You will see a message on the right "you are not currently logged in to Geneious Server". Select the "Log in" button.
3. On the "Login to Geneious Server" popup screen:
   - Enter a Host name:
     - If you logged into the VPN or are at an integrated site fill in:
       `sn-geneiousserver-0.scinet.ars.usda.gov`
     - If you are using an SSH tunnel type:
       `localhost`
   - In all cases type `8080` in the "Port" box
   - Enter your Ceres username in the "User Name" box, usually firstname.lastname
   - Enter your Ceres password in the "Password" box
   - Click  "OK"

![screenshot of Geneious software login screen](/assets/img/geneious/geneious_login.png)

You should now be connected to the Geneious Server.
