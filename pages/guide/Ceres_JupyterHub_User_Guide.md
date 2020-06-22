---
title: Jupyter Lab/Notebook
description: Computing with the Jupyter software stack
permalink: /guide/jupyter/
author: Rowan Gaffney, Kerrie Geil, and Brian Nadon
layout: page
# sidenav:  is a side navigation bar is needed it can be specified in the _data/navigation.yml file
---

#### Table of Contents
* [Introduction](#introduction)
* [Launching Jupyter](#launching-jupyter)
* [Environments and Software](#environments-and-software)
* [Best Practices](#best-practices)

---
# Introduction
## Background
[Project Jupyter](https://jupyter.org/index.html) is a open source software stack that supports interactive data science and scientific computing across a wide array of programming languages ([>130 supported kernels](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels)). The primary applications within Jupyter are:

  1. [JupyterHub](https://jupyterhub.readthedocs.io/en/stable/#): Jupyter's multi-user server. This application spawns, manages, and proxies multiple instances of the single-user JupyterLab server.
  
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
  <br>
  <br>

  ## Why Jupyter
  Jupyter is popular amoung data scientiests and researchers ([Perkel, 2018](https://www.nature.com/articles/d41586-018-07196-1)) because it offers:
  * Interactive data exploration features
  * A browser based user interface, making it easy to work on remote systems such as HPC and Cloud
  * Language agnostic (supports >130 kernels)
  * Easy ways to convert analyses and results into shareable formats ([nbconvert](https://nbconvert.readthedocs.io/en/latest/)) such as slides, html, pdf, latex, etc.
  * Ease of sharing, collaborating, and archiving analyses and results
  * A broad software stack that works with other Open Source projects, such as:
    * [My Binder]()
    * [repo2docker](https://github.com/jupyter/repo2docker)
    * GitHub (renders notebooks)
    * Access and authentication to arbitrary external processes (such as RStudio Server, Shiny Server, PostgreSQL, etc) via [jupyter-server-proxy](https://jupyter-server-proxy.readthedocs.io/en/latest/).
  * Customizability and Extensibility
  * An open source code base
 
---
# Launching Jupyter
There are multiple approaches for accessing the Jupyter stack on Ceres. 

* Port Foward with Putty - [Video Coming Soon]()
* Port Foward with Secure Shell (SSH) - [Video Coming Soon]()
* **JupyterHub (see below) - the recommended approach**

The simplist and most succinct method to launch JupyterLab is thru the JupyterHub interface. To access, you will need functioning SCINet credentials. To setup a SCINet account, see the [quickstart guide](https://usda-ars-gbru.github.io/scinet-site/guide/quickstart). Below are the instructions for JupyterHub.

1. **Go To:** [https://jupyterhub.scinet.usda.gov/](https://jupyterhub.scinet.usda.gov/)
2. **Log into JupyterHub** (SCINet credentials)
   * Username: SCINet username
   * Verification Code: 6 digit time-sensitive code
   * Password: SCINet password
3. **Spawning a JupyterLab Instance**
  
   The Spawning page includes a comprehensive set of options for customizing JupyterLab.<br><br>
<img src="../../assets/img/JHubspawner.png" width="400" align="left" hspace="20" border="1">

**Standard Options**
   * <u><i> Node Type</i></u> (Required): Which partition ([Ceres partitions](https://usda-ars-gbru.github.io/scinet-site/guide/ceres/#partitions-or-queues)) to spawn JupyterLab.
   * <u><i> Number of Cores</i></u> (Required): How many cores to allocate (must be an even number).
   * <u><i> Job Duration</i></u> (Required): How long should the Slurm (Ceres resource allocation software) allocate to this task.
   * <u><i> Slurm Sbatch Args</i></u> (Optional): Additional options for Slurm (see [sbatch options](https://slurm.schedmd.com/sbatch.html)). An example may be *--mem-per-cpu=6GB*.
   * <u><i> Working Directory</i></u> (Optional): The directory to launch JupyterLab. An example may be */lustre/project/name_of_project*, defaults to your $HOME directory.

   **Container Options**
   * <u><i>Full Path to the Container</i></u>  (Optional): If you wish to luanch JupyterLab with a containers, specify the Ceres path or Hub URL to the container.
   * <u><i>Container Exec Args</i></u>  (Optional): [Additional options] for executing the container (see the [singularity exec options](http://singularity.lbl.gov/archive/docs/v2-3/docs-exec). An example may be *--bind /lustre/project/name_of_project*.<br>

4. **Terminating JupyterLab**
  
   To end the JupyterLab instance go to: *File* **-->** *Hub Control Panel* **-->** *Stop Server*

Below is a video (COMING SOON) showing the above process.

<div style="text-align:center;">
<video controls width="500" title="JupyterHub + Ceres">
    <source src=".....mp4"
            type="video/mp4">
</video>
</div>

---
# Environments and Software

## Default Environment
The default environment includes:
  * Python and the IPython kernel.
  * JupyterLab (and/or Jupyter Notebook)
  * Ability to load Ceres maintained software (see below)
  * Slurm Que Manager

## Bring Your Own Environment
  If you have an environment (e.g. a conda environment) in your $HOME directory (e.g. ~/.conda/envs/my_env) with a Jupyter Kernel installed, JupyterLab will detect this environmnet as a seperate kernel. For instance, a conda environment named <i>my_env</i> with the IPyKernel will appear as <i>Python [conda env:myenv]</i> in the list of optional kernels in JupyterLab.

## Use Ceres Maintained Software
  The default environment includes an extension (located on the left vertical section of JupyterLab) to load Ceres software into the current environment. This is the software visible with the `module avail` command.

## Containerized Environment
JupyterHub will spawn an instance of JupyterLab using a singularity container (see the container options above). The container selected needs to have JupyterLab installed. Users can specify a container in the <i>Container Path</i> section on the Spawner Options page. There are several ways to access containers on Ceres:
   * Pointing to a prebuilt container either maintained by the yourself or by the VRSC (located at `/references/containers/`).
   * Pointing to a prebuilt container on an external hub, such as [Docker Hub](https://hub.docker.com/) or [Singularity Hub](https://singularity-hub.org/). **When launching JupyterLab from a container located on a <i>Hub</i> for the first time, it will take 1-10 minutes** to start JupyterLab because the container needs to be downloaded, built, and cached. However, on subsequent tries it should be quite fast ~10-20 seconds (the image is now cached in your $HOME directory). If the container is modified on the <i>Hub</i>, it will be re-downloaded, built, and cached.
     1. An example input into *Container Path*: ```docker://jupyter/datascience-notebook```
     2. Project Jupyter maintains a set of containers ([Jupyter Stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#image-relationships)) which include:
        * [Scipy-Notebook](https://hub.docker.com/r/jupyter/scipy-notebook/)
        * [R-Notebook](https://hub.docker.com/r/jupyter/r-notebook/)
        * [Tensorflow-Notebook](https://hub.docker.com/r/jupyter/tensorflow-notebook/)
        * [DataScience-Notebook](https://hub.docker.com/r/jupyter/datascience-notebook/)
        * [PySpark-Notebook](https://hub.docker.com/r/jupyter/pyspark-notebook/)
        * [All-Spark-Notebook](https://hub.docker.com/r/jupyter/all-spark-notebook/)
---
# Best Practices
## Resource Conservation
  * For short sessions, select partitions that are have been designated for shorter duration jobs (such as brief-low/2hr limit or short/48hrs) in the "Node Type" drop down.
  * For serial computing (non-parallel code) enter 2 or 4 for "*Number of Cores*" in the spawner options. If a computation is not parallelized, having more cores will not improve the computation power. If you need more memory, use the *--mem-per-cpu=XXGB* in the *Slurm Sbatch Args* on the spawner page.
  * For parallel computing choose a reasonable number of cores to meet your needs.
  * Choose a reasonable job duration.
  * Remember to stop the jupyter server when you are done working (`File --> Hub Control Panel --> Stop Server`).
  
## Reproducible Research
  * <b>Version Control</b>: The gold standard are version control systems like [Github](https://github.com/) or [Gitlab](https://about.gitlab.com/).
  * <b>Legible and Interperable Code</b>: Coding documents should include information about the mechanics of the code (commenting within code blocks) as well as the underlying scientific narrative (adding markdown cells surronding anlaysis and results).
  * <b>Archiving Computational Environment</b>: Containerized environments, such as [Docker](https://www.docker.com/) and [Singularity](https://sylabs.io/docs/), provide the best approach for archiving computatoinal environments. Services such as Docker Hub and Singularity Hub can store images associated with specific research or publications. Another approach is to capture computational environments as text output, such as a [conda requirements.txt](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-from-an-environment-yml-file) file.
  * <b>Data Providence/Archiving</b>: If utilizing a public dataset, the source and version should be documented. If using non-public data, the data should be published to a public repository, such as [NAL](https://www.nal.usda.gov/main/) or [AgCross](https://agcros-usdaars.opendata.arcgis.com/pages/general-information/).

  A detailed tutorial about conducting reproducible research can be found at: [Coming Soon!]()

## Tutorials and Packages for Parallel Computing
Developing code/scripts that utilize resources of a cluster can be challenging. Below are some software packages that may assist in parallelizing computations as well as links to some Ceres specific examples.

  1. Python - [Dask](https://dask.org/)<br>
  2. Python - [Ipyparallel](https://ipyparallel.readthedocs.io/en/latest/)<br>
  3. Python - [Ray](https://ray.readthedocs.io/en/latest/)<br>
  4. Python - [Joblib](https://joblib.readthedocs.io/en/latest/)<br>
  1. R - [rslurm](http://cyberhelp.sesync.org/rslurm/)<br>
  2. R - [Parallel](https://www.rdocumentation.org/packages/parallel/versions/3.6.2)<br>
  3. R - [doParallel](https://cran.r-project.org/web/packages/doParallel/doParallel.pdf)<br>
  4. R - [Snow](https://cran.r-project.org/web/packages/snow/snow.pdf)<br>
