---
title: SCINet High-Performance Computer Systems
description: SCINet High-Performance Computer Systems
permalink: /about/compute
author: Kerrie Geil
layout: page

 
sidenav: About
subnav:
  - text: Ceres HPC Cluster
    href: '#ceres-hpc-cluster--ames-ia'
  - text: Atlas HPC Cluster
    href: '#atlas-hpc-cluster--starkville-ms'
  - text: SCINet Cloud Computing Services
    href: '#scinet-cloud-computing-services'
sticky_sidenav: true
sticky_element: true
---

## Ceres HPC Cluster | Ames, IA
Ceres is an ARS-owned high-performance computing (HPC) cluster connected to SCINet and located in Ames, IA. The original cluster build included 72 regular compute nodes, 5 high memory nodes, and a two Petabyte file system for a range of scientific applications. The cluster has been extended multiple times and currently has 196 regular compute nodes, 26 high-memory nodes and one GPU node. A small subset of nodes, called “priority” nodes, has been funded by Research Units. “Priority” nodes are available to all ARS users when not in use by their funders. The ['Technical Overview' in the Ceres User Manual](/guide/ceres/#technical-overview) describes the number of logical cores and available memory for each type of node.

All nodes run on Linux Centos and compute jobs are managed by the SLURM scheduler. The system is configured with a login node, which users access to submit compute jobs to the SLURM scheduler.

Compute jobs are run on functional groups of nodes called partitions or queues. Each partition has different capabilities (e.g. regular memory versus high memory nodes) and resource restrictions (e.g. time limits on jobs). There are 10+ different partitions on Ceres to which users can submit compute jobs. For details on the current partitions/queues, see ['Partitions or Queues' in the Ceres User Manual](/guide/ceres/#partitions-or-queues).

Members of the SCINet Virtual Research Support Core (VRSC) in Ames, IA are the operational administrators of the Ceres HPC cluster. The VRSC maintains the system hardware, software, and provides user support. To learn more about the VRSC, visit the [VRSC page](/support/vrsc/). For a current list of command-line software managed by the VRSC through the module system, see the [Software Overview](/guide/software).

All Ceres users (ARS and formal collaborators) receive 5GB of storage in their /home directory and can request additional storage in a /project directory.

Additional technical information about the Ceres HPC cluster can be found in the [Ceres User Manual](/guide/ceres/).

New users may also want to reference the [Ceres Quick Start Guide](/guide/quickstart).

Many additional user guides are available under the "User Guides" dropdown list.

Other helpful links:<br>
[Apply for a SCINet Account](/about/signup/) to access Ceres<br>
[SCINet/Ceres FAQs](/support/faq/)<br>
[Request Project Storage](/support/request-storage)<br>
[Request Software](/support/request-software)<br>


## Atlas HPC Cluster | Starkville, MS 
ARS researchers also have access to a Cray system in Starkville, MS through an agreement with the Mississippi State University (MSU) to supplement Agency scientific computing capacity. Same SCINet credentials are used to connect to Atlas as to other SCINet HPC clusters.

Atlas cluster consists of 228 standard compute nodes, 8 high memory compute nodes and 4 GPU nodes. All nodes run on Linux Centos and compute jobs are managed by the SLURM scheduler. The system is configured with a login node, which users access to submit compute jobs to the SLURM scheduler. More information about Atlas cluster can be found in the [Atlas User Guide](https://www.hpc.msstate.edu/computing/atlas). Also, ARS has an agreement with MSU that supports the [Advancing Agricultural Research through High-Performance Computing project](https://storymaps.arcgis.com/stories/38dcc50ccb8147f4b31b9fe20d19a66a). 


## SCINet Cloud Computing Services
In addition to the ARS in-house compute infrastructure, cloud computing services are available to augment the HPC capability of Ceres with cloud resources.<br>
[Request SCINet Cloud Computing](/support/request-AWS)

<!--
## Page specific instructions
Ceres
configuration
nodes storage queues
operators
network connections
links to operating docs
Info on next generation HPS's coming online
-->
