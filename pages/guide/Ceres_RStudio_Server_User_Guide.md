---
title: Rstudio Server
description: Using Rstudio
permalink: /guide/rstudio/
author: VRSC
layout: page
# sidenav:  is a side navigation bar is needed it can be specified in the _data/navigation.yml file
---


#### Table of Contents
* [Introduction](#introduction)
* [SCINet Options for RStudio](#scinet-options-for-rstudio)
* [RStudio Server on Ceres](#rstudio-server-on-ceres)
* [Starting RStudio Server](#starting-rstudio-server)
* [Stopping RStudio Server](#stopping-rstudio-server)
* [SSH Port Forwarding (instead of VPN)](#ssh-port-forwarding-instead-of-vpn)
* [Requesting Additional Compute Resources](#requesting-additional-compute-resources)

# Introduction

[RStudio](https://www.rstudio.com/products/rstudio/) is an integrated development environment for the R programming language, with limited support for other programming languages (including Python, bash, and SQL). RStudio provides a powerful graphical environment for [importing data in a number of formats](https://support.rstudio.com/hc/en-us/articles/218611977-Importing-Data-with-RStudio) (including CSV, Excel spreadsheets, SAS, and SPSS); manipulating, analyzing, and visualizing data; version control with git or SVN; a graphical R package manager that provides point/click search/installation/uninstallation of R packages from its substantial ecosystem (including the Bioconductor repository, which provides almost 1500 software tools “for the analysis and comprehension of high-throughput genomic data.”); and [many other features](https://www.rstudio.com/products/rstudio/features/).

RStudio Server is a client/server version of RStudio that runs on a remote server and is accessed via the client’s web browser. A graphical file manager allows file upload/download from Ceres via web browser.

# SCINet Options for RStudio

SCINet users can use RStudio in one of the following ways:
1. To run RStudio and access data on your local workstation, download the open source RStudio Desktop.
2. To run an RStudio Server virtual machine on and access data in Amazon Web Services, contact the SCINet VRSC.
3. To run RStudio Server on and access data in Ceres, follow the directions in this guide.

Videos demonstrating the procedure for different access methods (VPN vs. SSH port forwarding) are available on SCINet VRSC Basecamp ([chrome-ssh.mp4](https://public.3.basecamp.com/p/5Myb2X5CR2uZKr8EU2ZJgpmi), [vpn.mp4](https://public.3.basecamp.com/p/aznzZYeWLejJFHyTp6ZT6E8s)).

# RStudio Server on Ceres
RStudio Server is currently available on Ceres using a Docker image (imported into Singularity) provided by the Rocker project. The provided geospatial image provides not only geospatial libraries, but also LaTeX / publishing libraries, and Tidyverse data science libraries. Other R packages can be easily installed into your home directory from within RStudio.

Running RStudio Server on Ceres allows SCINet users to access any data on Ceres that they can access from the command line (SSH). To use RStudio Server on Ceres, a user submits a SLURM job script. This allows RStudio Server to run on any available Ceres compute resources (including large-memory nodes). A default job script that should suffice for most users is provided.

After a user is done using RStudio Server, they should save their work in RStudio, and then stop RStudio Server by cancelling the job with the slurm  `scancel`  command.

A few Ceres-specific notes:
1. **RStudio terminal** (bash command shell): since RStudio Server is running in a container with a Debian base image, you won’t be able to access software environment modules (e.g., that you would normally see when logging into Ceres and issuing the  `module list`  command), as those are installed on the (CentOS) host.
2. **Data access:** your home directory is mounted inside the RStudio Server container, and the VRSC has configured Singularity to mount the /project directory.  $TMPDIR (which on a compute node is per-job local scratch on the compute node’s direct attached storage that gets deleted at the end of SLURM job) is mounted inside the container at /tmp.
3. **Software installation:** The provided SLURM job script creates a ~/.Renviron file in your home directory that allows RStudio to install additional R packages into your home directory (the container image is immutable). Installing a lot of R libraries may contribute to the default 10G soft limit quota on your home directory being surpassed.

# Starting RStudio Server

0. (If using VPN) Connect to SCINet VPN (see instructions on SCINet VRSC Basecamp [VPN Using the OpenConnect Client](https://public.3.basecamp.com/p/dwGmuqTLhAErovKeJCEggjNC), [VPN Using the Cisco AnyConnect Client](https://public.3.basecamp.com/p/TDE9ws88dd6XygPA2ekdGEJY)).
1. Log into Ceres via SSH (see the [Quick Start Guide](https://usda-ars-gbru.github.io/scinet-site/guide/quickstart#accessing-scinet) for instructions).
2. Submit the RStudio SLURM job script with the following command:
```
sbatch /reference/containers/RStudio/3.5.0/rstudio.job
```
  * (Optional) By default, this SLURM job is limited to a 4 hour time limit, 1 processor core, and 6600 MB memory. To customize, see the section [Requesting Additional Compute Resources](#requesting-additional-compute-resources) below.
3. After the job has started, view the "$HOME/rstudio-JOBID.out" file for login information (where JOBID is the SLURM job ID reported by the sbatch command).
<pre><code>
[jane.user@sn-cn-8-1 ~]$ sbatch /reference/containers/RStudio/3.5.0/rstudio.job
Submitted batch job 214664
[jane.user@sn-cn-8-1 ~]$ cat ~/rstudio-214664.out
VPN Users:
1. Connect to SCINet VPN and point your web browser to http://sn-cn-6-0:57088
2. log in to RStudio Server using the following credentials:
   user: jane.user
   password: 4wjRJfpIvQDtKdDZpmzY
SSH users:
1. SSH tunnel from your workstation using the following command (macOS or Linux only;
   for how to enter this in PuTTY on Windows see the Ceres RStudio User Guide)
   ssh -N -L 8787:sn-cn-6-0:57088 jane.user@login.scinet.science
   and point your web browser to http://localhost:8787
2. log in to RStudio Server using the following credentials:
   user: jane.user
   password: 4wjRJfpIvQDtKdDZpmzY
When done using RStudio Server, terminate the job by:
1. Exit the RStudio Session ("power" button in the top right corner of the RStudio window)
2. On the Ceres command line, issue the command
   scancel -f 214664 
</code></pre>
4. (*If using VPN*) Point your web browser to the listed hostname / port (in this example, http://sn-cn-6-0:57088), then enter your SCINet user name and the temporary password (valid only for this job only; in this example *4wjRJfpIvQDtKdDZpmzY*)
![screenshot of signing into RStudio in a web browser](/scinet-site/assets/img/RStudio.png)


# Stopping RStudio Server

1. Click the Quit Session (“power”) button in the top-right corner of the RStudio window (see picture below), or select “File > Quit Session...”
![screenshot of the Quit Session power button in RStudio](/scinet-site/assets/img/RStudio2.gif)
2. After the “R Session has Ended” window appears, cancel the SLURM job from the Ceres command line. E.g., if the job ID is 214664:
```
[jane.user@sn-cn-8-1 ~]$ scancel -f 214664
```
  * Be sure to specify the  `scancel -f`  /  `--full`  option as demonstrated above.
3. (If using SSH Port Forwarding instead of VPN) Close the terminal / PuTTY window in which the SSH tunnel was established.


# SSH Port Forwarding (instead of VPN)

## Windows + PuTTY users
1. Open a new PuTTY window
2. In Session > Host Name, enter: **login.scinet.science**
3. In the category: Connection > SSH > Tunnels, enter 8787 in Source Port, the Destination hostname:port listed in the job script output (in this example: **sn-cn-6-0:57088**), click “Add”, then click “Open”.
![screenshot of PuTTY software Connection-SSH-Tunnels screen](/scinet-site/assets/img/putty-annotated.png)
4. Point your browser to http://localhost:8787. Enter your SCINet user name, and one-time password listed in the job script output file.

## macOS / Linux users

1. Enter the use a new macOS/Linux terminal window and enter the SSH command listed in the job script output file. In this example:
```
ssh -N -L 8787:sn-cn-6-0:57088 jane.user@login.scinet.science
```
There will be no output after logging in. Keep the window / SSH tunnel open for the duration of the RStudio session.
2. Point your browser to http://localhost:8787. Enter your SCINet user name, and one-time password listed in the job script output file.


# Requesting Additional Compute Resources

The default job resources (4 hour time limit, 1 processor core, 6600 MB memory) may be customized by:
* sbatch command-line options, e.g., to specify an 8-hour wall time limit, 16 G memory, and 2 processor cores (= 4 hardware threads):
```
sbatch --time=08:00:00 --mem=16G --cpus-per-task=4 /reference/containers/RStudio/3.5.0/rstudio.job
```
* Copying the job script to a directory one has write access to and modifying the appropriate SLURM #SBATCH directives.
* Using the [Ceres Job Script Generator](http://go.usa.gov/x9fH7) (eAuthentication required) to create a new job RStudio Server job script
  * In the **Job Script Template** drop down menu, select RStudio Server
