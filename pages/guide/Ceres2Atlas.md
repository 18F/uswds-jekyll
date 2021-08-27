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
  * [Seeing All Environment Modules](#seeing-all-environment-modules)
  * [Conda](#conda) 
* [Submitting a Job](#submitting-a-job)
  * [Slurm account](#slurm-account)
  * [Partitions](#partitions)
  * [Nodes](#nodes)
  * [Internet Connection](#internet-connection)
  * [salloc](#salloc)

This guide lists differences between the Atlas and Ceres clusters to ease transition from one cluster to another.

# Quotas

All project directories exist on both clusters, however they may have different quotas. Data in the project (and home) directories is not automatically synced between the clusters. The default project directory quota on Atlas is 1TB. 

On Ceres usage and quota information for home and project directories that user belongs to is displayed at login (to speed-up logins, the usage data is calculated once a day). To get the current usage information, users can issue the "`my_quotas`" command. On Atlas "`quota -s`" command reports usage and quota for the home directory and "`/apps/bin/reportFSUsage -p proj1,proj2,proj3`" provides that information for specific projects.

# Software

Not all software installed on Ceres is available on Atlas. However software packages provided as containers are synced to Atlas daily.

## Using Containers

On Ceres users may not realize that some of the software listed in the output of the "`module avail`" command is installed as singularity containers. On Atlas one needs to load singularity module before issuing "`module avail`" to see environment modules for the software packages installed as containers.

```
module load singularity
module avail
```

## Seeing All Environment Modules

Similar to containers, some modules on Atlas are not reported by the "`module avail`" command and can not be loaded without loading an appropriate gcc module: 

```
module load gcc/10.2.0
module avail
module load canu/2.2
```

To see all available modules on Atlas, one can use "`module spider`" command instead of the "`module avail`" command. This command will also work on Ceres, but it's not necessary to use it.

```
Atlas-login-1[7] marina.kraeva$ module spider canu

--------------------------------------------------------------------------------------------------------------------
  canu:
--------------------------------------------------------------------------------------------------------------------
     Versions:
        canu/2.1.beta
        canu/2.1
        canu/2.2

--------------------------------------------------------------------------------------------------------------------
  For detailed information about a specific "canu" package (including how to load the modules) use the module's full name.
  Note that names that have a trailing (E) are extensions provided by other modules.
  For example:

     $ module spider canu/2.2
--------------------------------------------------------------------------------------------------------------------
```

## Conda

To build a Conda environment on Ceres, one can load miniconda module ("`module load miniconda`"). On Atlas one needs first to install miniconda in their home directory:

```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```

Since home directories on both clusters have 5GB quota, it's recommended to move the installed miniconda to a project directory and create a symbolic link to the new location in the home directory:

```
mv ~/miniconda3 /project/project_folder/software/.
ln -s /project/project_folder/software/miniconda3 ~/.
```

# Submitting a Job

Job scripts from one cluster may not work on the other cluster.
