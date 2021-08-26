---
title: From Ceres To Atlas
description: Guide to transitioning from Ceres cluster to Atlas cluster
permalink: /guide/ceres2atlas/
author: Marina Kraeva
layout: page
---

#### Table of Contents
* [Quotas](#quotas)
* [Software](#software)
  * [Using Containers](#using-containers)
  * [Conda](#conda) 
* [Submitting a job](#submitting-a-job)

This guide lists differences between the Atlas and Ceres clusters to ease transition from one cluster to another.

# Quotas

All project directories exist on both clusters, however they may have different quotas and data in the project (and home) directories is not automatically synced between the clusters. The default project directory quota on Atlas is 1TB. 

On Ceres usage and quota information for home and project directories that user belongs to is displayed at login (to speed-up logins, the usage data is calculated once a day). To get the current usage information, users can issue the my_quotas command. On Atlas "quota -s" command reports usage and quota for the home directory and "/apps/bin/reportFSUsage -p proj1,proj2,proj3" provides that information for specific projects.

# Software

Not all software installed on Ceres is available on Atlas. However software packages provided as containers are daily synced to Atlas.

## Using Containers

On Ceres users may not realize that some of the software listed in the output of the "module avail" command is installed as singularity containers. On Atlas one needs to load singularity module before issuing "module avail" to see available containers.

## Conda

To build a Conda environment on Ceres, one can load miniconda module ("module load miniconda"). On Atlas one needs first to install miniconda in their home directory:

```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```

Since home directories on both clusters have 5GB quota, it's recommended to move the installed miniconda to a project directory and create a symbolic link to the new location in the home directory:

```
mv ~/miniconda3 /project/project_folder/software/.
ln -s /project/project_folder/software/miniconda3 ~/.
```

