---
title: Jupyter Lab/Notebook
description: Computing with the Jupyter software stack
permalink: /guide/jupyter/
author: Rowan Gaffney
layout: page
# sidenav:  is a side navigation bar is needed it can be specified in the _data/navigation.yml file
---

#### Table of Contents
* [Introduction](#introduction)
* [Jupyter on Ceres](#jupyter-on-ceres)
* [Best Practices](#best-practices)


## Introduction
---
[Project Jupyter](https://jupyter.org/index.html) is a open source software stack that supports interactive data science and scientific computing across a wide array of programming languages ([>130 supported kernels](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels)). The primary applications within Jupyter are:

  1. [JupyterHub](https://jupyterhub.readthedocs.io/en/stable/#): Jupyter's multi-user server. This application spawns, manages, and proxies multiple instances of the single-user Jupyter Lab server.
  
  2. [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/): Jupyter’s next-generation notebook interface, which includes:
    
<img src="https://jupyterlab.readthedocs.io/en/stable/_images/jupyterlab.png" width="425" align="left" hspace="5" border="1" alt="screenshot of jupyterlab software">
<!-- <img src="/scinet-site/assets/img/jupyter/jupyterlab.png" width="425" align="left" hspace="5" border="1" alt="screenshot of jupyterlab software"> -->

   <br>[Notebooks](https://jupyterlab.readthedocs.io/en/stable/user/notebook.html)<br>
   [Text Editor](https://jupyterlab.readthedocs.io/en/stable/user/file_editor.html) <br>
   [Terminal](https://jupyterlab.readthedocs.io/en/stable/user/terminal.html)<br>
   [File Browser](https://jupyterlab.readthedocs.io/en/stable/user/files.html)<br> 
   [Data Viewer](https://jupyterlab.readthedocs.io/en/stable/user/file_formats.html)<br>
   [Markdown](https://jupyterlab.readthedocs.io/en/stable/user/file_formats.html#markdown)<br> 
   Context Help<br>
   [Extensions](https://jupyterlab.readthedocs.io/en/stable/user/extensions.html)<br>
   
     
  
  Additionally, JupyterLab can provide arbitrary external processes (such as RStudio, Shiny Server, syncthing, PostgreSQL, etc), and authenticated web access to them. For more details see the [jupyter-server-proxy](https://jupyter-server-proxy.readthedocs.io/en/latest/) package.
  
  
 

## Jupyter on Ceres
---
The most succinct method for accessing the Jupyter stack on Ceres is through the JupyterHub interface. To access the hub, you must have a functioning SCINet account. To setup an account, see the [quickstart guide](https://usda-ars-gbru.github.io/scinet-site/guide/quickstart).

1. **Go To:** https://COMING_SOON

2. **Log into JupyterHub** (SCINet credentials)
  * Username: Your SCINet username.
  * Password: ???Your password followed by the 6 digit 2nd-factor-auth code.???


3. **Spawning a JupyterLab instance**.<br><br>The Spawning page includes a comprehensive set of options for customizing JupyterLab 

<img src="../../assets/img/JHub_spawner.png" width="400" align="left" hspace="0" border="1">
<!-- update image after Yash finishes edits, copy image to SCINet site-->
<!-- <img src="/scinet-site/assets/img/jupyter/JHub_spawner.png" width="400" align="left" hspace="0" border="1" alt="screenshot of Jupyter Hub spawner"> -->

  
  <u><i>Node Type</i></u>: Which partition ([Ceres partitions](https://usda-ars-gbru.github.io/scinet-site/guide/ceres/#partitions-or-queues)) to spawn JupyterLab

  <u><i>Number of Cores</i></u>: How many cores to allocate (must be an even number)
   
  <u><i>Job Duration</i></u>: How long should the Slurm (Ceres resource allocation manager) allocate to this task
   
  <u><i>Additional Slurm Options</i></u>: Additional options for Slurm (see [sbatch options](https://slurm.schedmd.com/sbatch.html)). An example may be *--mem-per-cpu=6GB*
   
  <u><i>Working Directory</i></u>: The directory to launch JupyterLab. An example may be */project/name_of_project*
   
  <u><i>Container Path</i></u>: Path to the Singularity container to use to launch JupyterLab. The defualt container is [xxxxxx](link).
   
  <u><i>Container Options</i></u>: [Additional options] for executing the container (see the [singularity exec options](http://singularity.lbl.gov/archive/docs/v2-3/docs-exec). An example may be *--bind /project/name_of_project*<br>
   
  JupyterHub will spawn an instance of JupyterLab using a singularity container. The default container is the [xxxxxx](link) (if *Container Path* is left blank). Users can specify an alternateive container on Ceres by:
  * Pointing to a prebuilt container maintained by SCINet (that includes JupyterLab) in `/references/containers/`.
  * Pointing to a prebuilt container maintained by the user. Singularity containers can be built by pulling images from:<br>
    1. [Docker Hub](): `singularity pull docker://user/image:tag`<br>
    2. [Singularity Hub](https://singularity-hub.org/): `singularity pull shub://user/image:tag`<br>
    3. Building a container locally and transferring to Ceres.
  * Pointing to a prebuilt container on an external hub. **When launching jupyter from an external hub for the first time, it will take 1-10 minutes** to serve application because the container needs to be downloaded, built, and cached. However, on subsequent tries it should be quite fast ~10-20 seconds (the image is cached in your Home directory).
    1. Example input into *Container Path*: ```docker://jupyter/datascience-notebook```

&nbsp;&nbsp;&nbsp;&nbsp;4. **Terminating JupyterLab**<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To end the JupyterLab instance go to: *File* **-->** *Hub Control Panel* **-->** *Stop Server*

If you forget to stop the server through the hub, please terminate your job by:<br>
* logging in to Ceres with ssh<br>
* `squeue -u <user.name>`, and note the job_id running jupyter<br>
* `scancel -f <job_id>`


An alternative approach to launching JupyterLab (not covered in this page) is to log into Ceres, start a job on Slurm that runs jupyterlab, and port forward the process to your local computer.

## Best Practices
---
  **Resource Conservation**
  * For short sessions (2hrs or less) please choose the brief-low partition in the "Node Type" drop down, if available.
  * For serial computing (non-parallel code) enter 2 or 4 for "*Number of Cores*" in the spawner options. If a computation is not parallelized, having more cores will not improve the computation power.
  * For parallel computing choose a reasonable number of cores to meet your needs.
  * Choose a reasonable job duration (e.g. Do not choose 48hr job duration so you can leave your session open overnight).
  * Remember to stop the jupyter server when you are done working (*File* **-->** *Hub Control Panel* **-->** *Stop Server*).
  
  
  **Parallel and Distributed Computing Packages**: Developing scripts that utilize resources of a cluster can be challenging. Below are some software packages that may assist in parallelizing computations as well as links to some Ceres specific examples.
  
  * Python
    1. [Dask](https://dask.org/)<br>
      Ceres Tutorial: [Comming Soon]()
    2. [Ipyparallel](https://ipyparallel.readthedocs.io/en/latest/)
    3. [Ray](https://ray.readthedocs.io/en/latest/)
    4. [Joblib](https://joblib.readthedocs.io/en/latest/)
  * R
    1. [rslurm](http://cyberhelp.sesync.org/rslurm/)<br>
      Ceres Example: [Comming_Soon](None)
    2. [Parallel](https://www.rdocumentation.org/packages/parallel/versions/3.6.2)
    3. [doParallel](https://cran.r-project.org/web/packages/doParallel/doParallel.pdf)
    4. [Snow](https://cran.r-project.org/web/packages/snow/snow.pdf)
