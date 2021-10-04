---
title: "SCINet Standard Operating Procedure: Managing Data on ARS HPC and Storage Infrastructure"
description: Suggested best practices for managing data on SCINet infrastructure
permalink: /guide/data_management_sop/
author: Brian Stucky et al.
layout: page
---

#### Table of Contents
* [Overview](#overview)
* [Definitions](#definitions)
* [Detailed instructions, using Globus](#detailed-instructions-using-globus-preferred)
* [Alternative instructions, not using Globus](#alternative-instructions-not-using-globus)

# Overview

This document describes recommended procedures for managing data on ARS HPC and storage infrastructure. The key concept is to only use “Tier 1 storage” (that is, storage that is local to a given HPC cluster) as required for actively running compute jobs. Tier 1 storage is not backed up and should not be used for archival purposes. Juno, on the other hand, is periodically backed up to tape and can be used for long-term storage of data and results.  We recommend immediate adoption of the procedures described here for new projects. These procedures should also be followed for “old” projects after first moving extant project data in Tier 1 storage to Juno using one of the procedures described below.


![Schematic diagram of recommended data management workflow using Globus.](/assets/img/data_management_sop-fig_1.png)
*Figure 1. Recommended procedures for managing data on ARS HPC infrastructure using Globus.*

# Definitions
* **Juno:** Large, multi-petabyte ARS storage device at the National Agricultural Library in Maryland, accessed by users; periodically backed up to tape device.  Includes periodic file system snapshots that allow users to recover accidentally deleted files.
* **Tape backup:** Off-site backup of Juno, located at Mississippi State University, accessible by VRSC staff for disaster recovery following major system data loss.
* **Tier 1 Storage:** Project-specific working directory (/project/) and scratch disk (/90daydata/) on either of of the HPC clusters, local to computing resources at the National Centers for Animal Health in Ames, Iowa or Mississippi State University. These locations are for storing intermediate results while performing a series of computational jobs. This storage is not backed up.


# Detailed instructions, using Globus (preferred)

Using Globus is recommended for file transfer performance and reliability. The recommended data management workflow using Globus is illustrated in Figure 1.

See the SCINet [Globus Data Transfer guide](https://scinet.usda.gov/guide/file-transfer/#globus-data-transfer) for instructions on how to use Globus.[WN4] [SBRABM5] 

1. Copy raw data and custom software (e.g., custom scripts, ideally also versioned in Git repositories; conda environments/environment.yml, Singularity image/definition files) from a local workstation or other data source to a project directory on Juno using Globus (search for Globus collection “NAL DTN 0”) (Figure 1.1).  On Juno, the data should be copied to `/LTS/project/PROJNAME/`.
1. If not already there, copy data to Tier 1 storage on the cluster you will run on, either Ceres or Atlas, using Globus.  This will either be in `/project` or into scratch space in `/90dayadata` for short-term use (Figure 1.2).
1. Use ssh to log in to your chosen HPC cluster (Ceres or Atlas; see [Logging in to SCINet](https://scinet.usda.gov/guide/ceres/#logging-in-to-scinet)); (e.g.:
```
ssh FIRST.LAST@ceres.scinet.usda.gov
```
) and run your compute job (Figure 1.3).
1. Copy any results you need to keep to Juno so that they are preserved (Figure 1.4).
1. If desired, you can also copy results to your local workstation (Figure 1.5). 
Note that step 1 might not be necessary for all data used for a project. For example, suppose you need to use a large, publicly available satellite-derived dataset for a project. In this case, the data probably do not need to be stored on Juno and can simply be placed directly on Tier 1 storage and deleted when they are no longer needed.


# Alternative instructions, not using Globus

It is also possible to move data on SCINet infrastructure using traditional command-line tools like `scp` and `rsync`.  We are still in the process of finalizing some system configuration details that affect use of these tools, and we will publish instructions for using them as soon as possible.

