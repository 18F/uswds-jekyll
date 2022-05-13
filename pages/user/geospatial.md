---
title: SCINet for geospatial research
description: SCINet has a number of tools available for geospatial research
permalink: /user/geospatial/
author: Rowan Gaffney and Pat Clark
layout: page

 
sidenav: Use Cases
subnav:
  - text: Use Cases
    href: '#use-cases'
  - text: When to Use SCINet?
    href: '#when-to-use-scinet'
  - text: Tools and Software
    href: '#tools-and-software'
sticky_sidenav: true
sticky_element: true
---
<br>
By: Pat Clark and Rowan Gaffney

## Use Cases
---
### **Machine Learning**
* Classification
* Clustering: [Python Notebook Example](/assets/img/geospatial/Tutorial1_Example2_Hyperspectral.html)
* Regression

### **Modeling**
* Process Based or Statistical Models

### **Time Series Analysis**
* Estimating Productivity
* Land Use / Land Change

### **Geostatistics**
* Spatial Variance or Autocorrelation
* Kriging / Interpolation

### **Processing Data**
* UAS DN/Radiance to Reflectance

## When to Use SCINet?
---
Setting up analyses to run on SCINet involves a non-trivial amount of overhead. Therefore, you should first evaluate if SCINet is an appropriate avenue for your research. Typically, analyses that are well-suited for SCINet are:
* CPU intensive workloads
* high memory workloads

Additional considerations are:
* Are my analyses already optimized?
* Will I need to parallelize my analyses (typical for CPU intensive workloads)?
* Will I require more than a single node of compute power (ie. distributed computing)?
<br>

## Tools and Software
---
The following tools/software are currently available on SCINet. (See the [Software Overview](/guide/software) for a full list of currently available software.)

### Geospatial Specific Software
* [**ENVI**](https://www.harrisgeospatial.com/Software-Technology/ENVI) (5.5): Image analysis software (1 license available)
* [**ESMF: Earth System Modeling Framework**]() (7.1): High-performance, flexible software infrastructure for building and coupling weather, climate, and related Earth science applications
* [**Proj4**](https://github.com/OSGeo/PROJ) (4.9.3): Generic coordinate transformation software
* [**GDAL/OGR: Geospatial Data Abstraction Library**](https://gdal.org/) (1.11.4): Library for reading and writing raster and vector geospatial data formats

### Applicable General Software
* [**H2O**](https://www.h2o.ai) (3.2.0.3): Distributed in-memory machine learning platform with APIs in R and Python
* [**Python**](https://www.python.org/) (3.6.6): Interpreted, high-level, general-purpose programming language
* [**R**](https://www.r-project.org/) (3.5.2): Software environment for statistical computing and graphics
* [**RStudio and RStudio Server**](https://www.rstudio.com/): An integrated development environment (IDE) for R
* [**JupyterLab**](https://jupyterlab.readthedocs.io/en/stable/): Web-based user interface for Project Jupyter

### Other
* [**SCINet Remote Sensing Container Image**](https://hub.docker.com/r/rowangaffney/data_science_im_rs): Python+R geospatial libraries and JupyterLab IDE (R, IDL, and Python kernels).
    * [User Tutorial](/assets/img/geospatial/Tutorial1-JHub.html) for JupyterLab+Dask Distrubuted using:
      * container: /project/geospatial_tutorials/data_science_im_rs_latest.sif
      * sbatch script: /project/geospatial_tutorials/data_science_nb_dask.sbatch
    *  Optionally, pull the container from dockerhub to local folder with:
```bash
singularity pull docker://rowangaffney/data_science_im_rs
```
