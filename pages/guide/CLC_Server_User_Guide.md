---
title: CLC Server
description: Using CLC Server
permalink: /guide/clc/
author: VRSC
layout: page
# sidenav:  is a side navigation bar is needed it can be specified in the _data/navigation.yml file
---


**This document assumes that a licensed copy of CLC Genomics WorkBench 22 is installed locally and available to the user.**

# Before You Begin

Email [scinet_vrsc@USDA.GOV](mailto:scinet_vrsc@USDA.GOV?subject=CLC%20setup) so that the admins can setup the import/export directories and permissions for access.

We need the following information:
1.	Path to your project directory.
2.	Do you need access to the mem nodes for your CLC workflow?

# CLC Server Login

1.	File -> Connections -> CLC Server Connection
2.	Server Name and Port
	
  * **If connecting via VPN/OCVPN**
```
Server name: 10.1.5.210
Server port: 7777
```
  *	**If connecting via ARS Network**
```
Server host: 205.237.112.197
Server port: 7777
```
3.	Username and Password(GA code not required) 

4.	Log in.

![screenshot of CLC Genomics Workbench 22.0.2 software homescreen](/assets/img/CLC2.png)

After successful login, you should see a directory CLC-\<your project> in the top left window.

