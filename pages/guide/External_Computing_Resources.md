---
title: External computing resources
description: External computing resources
permalink: /guide/external/
author: VRSC
layout: page
# sidenav:  is a side navigation bar is needed it can be specified in the _data/navigation.yml file
---

In addition to the Ceres cluster, there are external computing resources available to
the SCINet community, including Amazon Web Services, XSEDE, and the Open Science Grid. These resources may
be of interest to SCINet users that require:

* very large jobs (either numerous small jobs, or many nodes in parallel)
* special computing hardware requirements (e.g., GPUs, Xeon Phi, extremely-large memory)
* software that isn’t supported on Ceres (e.g., web apps, relational databases, VMs, Hadoop,
Spark, certain commercial software)

A brief synopsis of some resources:

# Amazon Web Services
* **What**: large ecosystem of Amazon cloud services: EC2 compute instances, S3 object storage, etc. (https://aws.amazon.com/)
* **How much**: Budget (paid for by SCINet) determined at time of request
* **Support**: SCINet VRSC; Basecamp group for SCINet AWS users
* **How to request**: Submit a [SCINet AWS Project Request](https://e.arsnet.usda.gov/sites/OCIO/scinet/accounts/SitePages/SCINet-AWS-Project-Request.aspx)

# XSEDE
* **What**: HPC compute, storage, cloud, and support from several large academic computing
centers in the United States. Most systems look & operate similarly Ceres (SSH access, SLURM
job scheduler, shared file systems, etc.)
* **How much**: Allocation amount determined by XSEDE committee. No cost to researchers in the United States.
* **How to request**:
1. Create an XSEDE account at [https://portal.xsede.org/](https://portal.xsede.org/)
2. Apply for one of the following allocations:
  * [Startup Allocation](https://portal.xsede.org/allocations/startup)
    * Some justification required; typically < 1 week time to review/approval
  * [Research Allocation](https://portal.xsede.org/allocations/research)
    * Larger allocation requiring more justification required; evaluated quarterly.
  * Contact your institution’s [XSEDE Campus Champion](https://www.xsede.org/web/site/community-engagement/campus-champions/current) (ARS: Nathan Weeks) to be added to their Campus Champions allocation, which covers most XSEDE systems.
    * No justification necessary; meant for trying XSEDE resources before applying for an allocation
3. Transfer data between SCINet and XSEDE systems via Globus (or scp/sftp).
* **Support**: XSEDE Help Desk
* See also: Bioinformatics Workbook [Introduction to XSEDE](https://isugenomics.github.io/bioinformatics-workbook/Appendix/HPC/xsede/xsede.html)

# Open Science Grid
* **What**: Excess computing capacity aggregated from > [100 U.S. institutional research computing
systems](https://gracc.opensciencegrid.org/) for [High-Throughput Computing](http://opensciencegrid.org/about/computation/) jobs.
* **How much**: Unlimited (subject to fair-share policy); no cost to researchers in U.S.
* **How to request**:
1. Sign up via OSG Connect ([http://osgconnect.net/](http://osgconnect.net/)) with your Globus ID (enter “USDAARS” for organization, if appropriate)
  * Access typically granted within days
  * Can also/instead access OSG via XSEDE, subject to XSEDE allocation policies and limits
2. Request to be added to the [Open Science Grid Users Basecamp project](https://3.basecamp.com/3625179/projects/8941891) (ping / email
Nathan Weeks, or respond in the comments).
  * You will also be added to a “SCINet” OSG project.
* Transfer data between SCINet and OSG Connect via Globus (or scp/sftp).
  * *If there is sufficient Open Science Grid interest / usage in the SCINet community, the
VRSC may explore tighter integration, allowing direct “bursting” to OSG from Ceres,
rather than logging into an OSG Connect submit host.*
