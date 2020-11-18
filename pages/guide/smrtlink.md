---
title: SMRTLink
description: SMRTLink
permalink: /guide/smrtlink/
author: Jordan Hoosman
layout: page
---

##### Before you begin:
Email scinet_vrsc@iastate.edu to add you to SMRTLink user list and project directory

#### Table of Contents
* [Accessing SMRTLink](#accessing-smrtlink)
* [Managing Data](#managing-data)
* [Creating Projects withini SMRTLink](#creating-projects-within-smrtlink)
* [Importing Data](#importing-data)
* [Adding BAM dataset to projects](#adding-bam-dataset-to-projects)
* [References](#references)

## Accessing SMRTLink

Follow instruction on Basecamp on connecting via VPN(Skip this step if you are in one of the connected sites).

Go to sn-cn-6-3.scinet.ars.usda.gov:9090 ( Note: Only works on Google Chrome web browser)

Login with your ceres username and password.

## Managing Data

SMRTLink User Guide attached below provides a general overview on navigating and using SMRTLink. There are, of course, a few things that the users need to be aware to use it on Ceres.

The project directory is located at <span style="background-color:grey">/project/smrtanalysis</span>

The users need to station their data in their project directories first and them move(not copy!) the files over to / project /smrtanalysis. Moving files should be near instantaneous. The purpose of staging the data in your original project directory is to make sure that the files are associated with your project and NOT with proj-smrtanalysis.

Although this requires one additional hop to transfer data, we feel this is easier for both users and admins as we don't have to deal with multiple project s just to use SMRTLink. This way the files will be owned by your original project. This also streamlines the process of requesting for increase in quota and for us to keep track of project quotas.

All users need to copy their input data to the project directory as SMRTLink has read privileges for this project alone(the data will still be owned by the respective user and associated group). It is suggested that the project investigator(Bioinfomatician in SMRTLink) create a directory and copy relevant data over the directory that can be easily identified by project members. <b>SMRTLink will not write any data to the project directory, all the intermediate and final output will be stored in $SMRT_ROOT/userdata within the respective job ID.</b>

## Creating Projects within SMRTLink

To create a new project within SMRTLink, navigate to "Data Management" and click on "Create Project" 

In this page a bioinformtician can enter project name, description, add datasets from the existing database and add other users to the project.

To add users, simply search for a user by name, select user and assign access level to the user.

<img src="/assets/img/smrtlink1.png">

From the main "Data Management" page, users can navigate between BAM Data, RS II Data, and Projects

<img src="/assets/img/smrtlink2.png">

The projects are visible to only users who have access to it.

## Importing Data

From the "Data Management" main page, click on "View or Import Data" and then click import and select the appropriate format.

<b>Note:</b> Make sure that the project directory is "All my projects" otherwise users will encounter an error during data import.

Users can navigate to the desired location - /project/smrtanalysis -> "your data directory" and click import.

Once the BAM data is imported, users may add the dataset to their project directory. RS II data needs to be converted to BAM before user canadd the dataset to a project.

## Adding BAM dataset to projects

From the "Data Management" main page, navigate to "Projects" and select the desired project.

Click "select datasets" and add the required dataset and save.

## References

[SMRTLink User Guide](http://programs.pacificbiosciences.com/l/1652/2018-03-20/3wrpm5/1652/190672/SMRT_Link_User_Guide__v5.1.0_.pdf)
[SMRTLink Installation](https://wiki.its.iastate.edu/download/attachments/287113243/SMRT_Link_Installation_v501.pdf?version=1&modificationDate=1512494698000&api=v2)