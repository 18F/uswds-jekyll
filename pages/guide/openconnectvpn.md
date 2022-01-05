---
title: VPN using the OpenConnect Client
description: OpenConnect VPN
permalink: /guide/openconnect/
author: Jordan Hoosman
layout: page
---

<style>
.cmd {
    background-color: rgb(245, 245, 245);
    padding: 5px;
}
</style>

<b>Note:</b> You need to setup two factor authentication before using SCINet VPN. [Follow the instructions here.](/guide/multifactor)

<b>Note 2:</b> The SCINet VPN address recently changed to: <b>ocvpn.scinet.usda.gov</b>

These instructions are for the open source OpenConnect clients from: [http://www.infradead.org/openconnect/](http://www.infradead.org/openconnect/)

These instructions are for the GUI versions of the installers. There are command line versions available as well, but those are not covered here.

### Installation for Windows

Download the OpenConnect Windows Client from here:
[https://github.com/openconnect/openconnect-gui/releases](https://github.com/openconnect/openconnect-gui/releases)

### Installation for Unix
Download and installation instructions for assorted UNIX variants are here:
[http://www.infradead.org/openconnect/packages.html](http://www.infradead.org/openconnect/packages.html)

### Installation for OSX

The OpenConnect GUI client for OSX is available via [MacPorts](https://www.macports.org/). Please follow the links on that site to install MacPorts (This involves installing and configuring Xcode for command line support from the apps store as well) . After you have MacPorts working on your system you need to run:

<div class="cmd">sudo port install openconnect-gui</div>

This will take a few minutes.

### Configuring and running on Windows

Open the client and click the "Edit connection details" button as shown below.

<img src="/assets/img/openconnectvpn1.png">

for Gateway enter:

<div class="cmd">https://ocvpn.scinet.usda.gov</div>

and click [Save & Connect]

<img src="/assets/img/openconnectvpn2.png">

Enter your SCINet Username

<img src="/assets/img/openconnectvpn3.png">

Enter your password with your GA 6-digit code appended to the end. For example if your password is "qwerty" and your GA app is showing "456321" you would enter:

<div class="cmd">qwerty456321</div>

<img src="/assets/img/openconnectvpn4.png">

The "Green Lock" indicates that you should now be connected.

<img src="/assets/img/openconnectvpn5.png">

You can also see the connection status in the system tray 

<img src="/assets/img/openconnectvpn6.png">

### Configuring and running on OSX

After installation openconnect-gui will appear on your Applications menu under "MacPorts". 

<img src="/assets/img/openconnectvpn7.png">

However <i><b>this will not work</b></i> as the the VPN need to run with elevated privileges.

To run open a terminal and use:

<div class="cmd">sudo /Applications/MacPorts/openconnect-gui.app/Contents/MacOS/openconnect-gui</div>

After opening the client enter <b>ocvpn.scinet.science</b> and click \[Connect\]

<img src="/assets/img/openconnectvpn8.png">

Enter your SCINet username.

<img src="/assets/img/openconnectvpn9.png">

Enter your password with your GA 6-digit code appended to the end. For example if your password is "qwerty" and your GA app is showing "456321" you would enter:

<div class="cmd">qwerty456321</div>

<img src="/assets/img/openconnectvpn10.png">

If you have a "Green Light" You should now be connected.  

<img src="/assets/img/openconnectvpn11.png">
