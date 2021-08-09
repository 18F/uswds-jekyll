---
title: SCINet Storage
description: Guide to storage options on SCINet HPC clusters
permalink: /guide/storage/
author: Marina Kraeva
layout: page
---

#### Table of Contents
* [Ceres HPC Cluster](#ceres-hpc-cluster)
  * [Quotas](#quotas)
  * [Home Directories](#home-directories) (/home/firstname.lastname)
  * [Project Directories](#project-directories) (/project/project_name)
  * [KEEP](#keep) (/KEEP/project_name)
  * [Large Short-term Storage](#large-short-term-storage) (/90daydata/project_name and /90daydata/shared)
  * [Temporary Local Node Storage](#temporary-local-node-storage) ($TMPDIR)  
* [Atlas HPC Cluster](#atlas-hpc-cluster)
  * [Atlas Home Directories](#atlas-home-directories) (/home/firstname.lastname)
  * [Atlas Project Directories](#atlas-project-directories) (/project/project_name)
  * [Atlas Large Short-term Storage](#atlas-large-short-term-storage) (/90daydata/project_name and /90daydata/shared)
* [Archive Storage at NAL](#archive-storage-at-nal)

# Ceres HPC Cluster

There are multiple places to store data on the Ceres cluster that all serve different purposes. 

Most users will only use home directories and project directories in /project and /KEEP.

## Quotas

Home directories and directories in `/project`  and `/KEEP` have quotas. Current usage and quotas for home and project 
directories that user belongs to are displayed at login. The `my_quotas` command provides the same information.

Quotas on Ceres are based off file group ownership/association. By default files in a home directory are associated with the user's
primary group that has the same name as the user name, while files in a project directory are associated with the project
group (proj-<project_name>). Sometimes when users move files from one directory to another or rsync files using "-a" or "-g" 
option, files in the new location will retain group from the old location. To avoid this, use "cp" and "rm" instead of "mv" 
to move data between home and project directories, and use "-rlptoD" rsync options instead  of "-a". 

The "lfs quota -g <first.last> /project" will report usage and quota for the user <first.last>'s primary group in /project . This quota is 
intentionally set to a small value. The non-zero usage indicates that there are files associated with the user's primary group
in /project . To fix this, the user can issue "chmod -R proj-<project_name> /project/proj-<project_name>" , which will
set ownership of the files in the project directory <project_name> to the project group.

## Home Directories

Home directories are private, they are only accessible to the user and the system administrators. When a user logs 
into Ceres, they are automatically logged into their home directory `/home/firstname.lastname`. 

Home directories on Ceres have 5GB quotas and are intended to be mainly used for configuration and login files. Computations 
should be run from project directories in `/project` or `/90daydata`. Software installs that require a lot of space, 
such as conda virtual environments, should be done in [`/project`](#project-directories).

Files in home directories are automatically compressed and backed up. Due to backup method used on Ceres, space freed 
after deleting files in home directories, becomes available only after 6 days.

## Project Directories

Project directories are intended as high-level workspaces. This is where large datasets would reside, sub-projects can be 
created, and collaborative analysis results stored. Project directories are usually associated with ARS Research Projects.

To request a new project directory see [Request Project Storage](/support/request-storage). A direct link to the form 
(eAuthentication required) which includes submitting a Data Management Plan:

[Request a project directory](https://e.arsnet.usda.gov/sites/OCIO/scinet/accounts/SitePages/Project_Allocation_Request.aspx){: .usa-button }

Directories in `/project` are not backed up, however users can copy important data from a directory in `/project` to a 
corresponding directory in `/KEEP` that is backed up nightly. User should not run jobs from a directory in `/KEEP`.

Many software applications are available on Ceres as [modules](https://scinet.usda.gov/guide/ceres/#modules), however sometimes 
users need to install software by themselves. Since home directories have a small quota, it is recommended to install software, 
such as Python, Perl, R packages and conda virtual environments in `/projectproject_name`. 
The [Conda Guide](https://scinet.usda.gov/guide/conda/#example-2-installing-tensorflow-into-a-keep-directory) provides instructions 
on how to install conda virtual environments in `/project`, while 
[Guide to Installing R, Python, and Perl Packages](https://scinet.usda.gov/guide/packageinstall/) has examples of
installing packages in a project directory.

## KEEP

`/KEEP` is used to keep important data. Like in `/home`, 
files in `/KEEP` are automatically compressed and backed up. It is recommended to copy important data from a directory in 
`/project` to a corresponding directory in `/KEEP`. Note, that due to backup method used on Ceres, space freed after deleting files 
in directories in `/KEEP`, becomes available only after 6 days.


## Large Short-term Storage

Most users will run computations from `/project/project_name`. Project directories in `/project` have large quotas, however sometimes 
users need even more space for a short period of time. In this case computations can be run from `/90daydata/project_name` which does 
not have quota. However, files in `/90daydata` older than 90 days will be automatically deleted. This is permanent and the files cannot 
be recovered. Just like `/project` there is no backup for this space. If you need to keep something, copy data to `/KEEP/project_name`.

`/90daydata/shared` is open to all users on Ceres. Anyone can create a directory in `/90daydata/shared` and put data which will be readable 
by everyone on the system unless file owner limits access using `chmod` command. Files older than 90 days will be automatically deleted.

Warning: If you download archived files, they may contain files with an access date from long ago. This date will still trigger deletion, 
so make sure that the files have a new access date. For example, when you untar a .tar or .tgz file, use the `-m` flag. If you use `rsync` to 
the space, do not use the `-a` flag, as that preserves date stamps.

## Temporary Local Node Storage

One can use the storage on the disk drive on each of the compute nodes by reading and writing to `$TMPDIR` (1.5TB on most compute nodes, 
for details see [Ceres Technical Overview](https://scinet.usda.gov/guide/ceres/#technical-overview)).  This is temporary storage that can 
be used only during the execution of your job. Only processes executing on a node have access to this space.  Multiple jobs running on the 
same node share this space, so an individual job may be able to use less than total available space. If all local space is needed for a job, 
request the whole node.

To use this local storage the following workflow should be used.  These steps may be taken interactively (when salloc'd to a compute node) 
or in batch-mode. In batch mode the copy commands below should be added to the job script.

1.	Copy calculation input to the local filesystem, e.g., 
```
cp /project/<project_name>/<input files> $TMPDIR
``` 
where `<project_name>` is the name of your project directory and `<input files>` contains the folders/files to be used by your job (to copy the 
whole folder use `-r` option).

2.	Run your code, getting input from files located in `$TMPDIR` and writing output to `$TMPDIR`

3.	Copy final results to storage location, e.g.:
```
cp $TMPDIR/<final results> /project/<project_name>/<final results>
```

Note that files in `$TMPDIR` will disappear at the conclusion of your job.  Any data which is not copied out of `$TMPDIR` cannot be recovered 
after your job has finished.

This storage is useful for workflows that extensively use disk space reading and writing multiple small files.

# Atlas HPC Cluster

## Atlas Home Directories

Home directories are private, they are only accessible to the user and the system administrators. When a user logs 
into Atlas, they are automatically logged into their home directory `/home/firstname.lastname`. 

Home directories on Atlas have 5GB quota. `/home/firstname.lastname` should be mainly used for configuration and login files. Computations should be run from project directories in `/project`.

## Atlas Project Directories

Project directories on Atlas are located in `/project`. Same project directory names are used across all SCINet HPC clusters, however quotas and data in
these directories may differ. For each project directory on Ceres, a directory with the same name is created in `/project` on Atlas. Default quota for
`/project/project_name` is set to 1TB. Contact SCINet VRSC at scinet_vrsc@usda.gov if more space is needed. 

As on Ceres, directories in `/project` are not backed up. Users can copy important data from a directory in `/project` on Atlas to a 
corresponding directory in [`/KEEP`](#keep) on Ceres that is backed up nightly.

## Atlas Large Short-term Storage

Most users will run computations from `/project/project_name`. Project directories in `/project` have large quotas, however sometimes 
users need even more space for a short period of time. In this case computations can be run from `/90daydata/project_name` which does 
not have quota. However, files in `/90daydata` older than 90 days will be automatically deleted. This is permanent and the files cannot 
be recovered. Just like `/project` there is no backup for this space. If you need to keep something, copy data to `/KEEP/project_name` on Ceres.

`/90daydata/shared` is open to all users on Atlas. Anyone can create a directory in `/90daydata/shared` and put data which will be readable 
by everyone on the system unless file owner limits access using `chmod` command. Files older than 90 days will be automatically deleted.

Warning: If you download archived files, they may contain files with an access date from long ago. This date will still trigger deletion, 
so make sure that the files have a new access date. For example, when you untar a .tar or .tgz file, use the `-m` flag. If you use `rsync` to 
the space, do not use the `-a` flag, as that preserves date stamps.
