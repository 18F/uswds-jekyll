---
title: VPN using the Cisco AnyConnect Client
description: Cisco AnyConnect
permalink: /guide/anyconnect/
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

<b>Note 2:</b> The address for SCINet VPN is now <b>ocvpn.scinet.usda.gov</b>

The SCINet OpenConnect VPN server is compatible with the Cisco Anyconnect client if you already have that installed. We have tested this with OSX, Windows, Linux, and Android. Use of the SCINet VPN does require 2 factor authentication. If you have not set that up yet please read [these instructions](https://scinet.usda.gov/guide/multifactor/) and do so before continuing.

First open AnyConnect and enter <b>ocvpn.scinet.usda.gov</b> in the box and click \[Connect\]

<img src="/assets/img/anyconnectvpn1.png">

Enter your SCINet Username.

<img src="/assets/img/anyconnectvpn2.png">

Enter your password with your GA 6-digit code appended to the end. For example if your password is "qwerty" and your GA app is showing "456321" you would enter:

<div class="cmd">qwerty456321</div>

<img src="/assets/img/anyconnectvpn3.png">

You should now get the welcome banner. This may change over time from what is shown here. 
Click \[Accept\]

<img src="/assets/img/anyconnectvpn4.png">

You are now connected to the SCINet VPN.

On OSX this shows up on the status bar (typically at the top of your screen) like this:

<img src="/assets/img/anyconnectvpn5.png">

In Windows the notifications will appear in the tray (typically at the bottom of your screen) and looks like this:

<img src="/assets/img/anyconnectvpn6.png">

In linux there is no notification icon but you should see this window.

<img src="/assets/img/anyconnectvpn7.png">
