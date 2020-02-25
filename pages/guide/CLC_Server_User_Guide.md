---
title: CLC Server
description: Using CLC Server
permalink: /guide/clc/
author: VRSC
layout: page
# sidenav:  is a side navigation bar is needed it can be specified in the _data/navigation.yml file
---


**This document assumes that a licensed copy of CLC Genomics WorkBench 11 is installed locally and available to the user.**

# Before You Begin

Email [scinet_vrsc@USDA.GOV](mailto:scinet_vrsc@USDA.GOV?subject=CLC%20setup) so that the admins can setup the import/export directories and permissions for access.

We need the following information:
1.	Path to your project directory.
2.	Do you need access to the mem nodes for your CLC workflow?

# Installing the Genomics Server Plugin
1.	Navigate to Help -> **Plugins**
2.	Select Download Plugins
3.	Install **CLC Workbench Client Plugin** (Note: You may need to have admin privileges on your local machine to install plugins)

![screenshot of CLC software Download Plugins Screen](/scinet-site/assets/img/CLC1.png)

4.	Restart Genomic workbench

# CLC Server Login

1.	File -> CLC Server Login
2.	Enter your Ceres username and password
3.	In the Advanced section
  * **If connecting via VPN/OCVPN**
```
Server host: sn-clcserver-0.scinet.ars.usda.gov
Server port: 7777
```
  *	**If connecting via ARS Network**
```
Server host: 205.237.112.210
Server port: 7777
```
4.	Log in.

![screenshot of CLC Genomics Workbench 11.0.1 software homescreen](/scinet-site/assets/img/CLC2.png)

After successful login, you should see a directory CLC-\<your project> in the top left window.
