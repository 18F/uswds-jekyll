---
title: SCINet for geospatial research
description: SCINet has a number of tools available for geospatial research
permalink: /user/geospatial/
author: Rowan Gaffney and Pat Clark
layout: page
# sidenav:  is a side navigation bar is needed it can be specified in the _data/navigation.yml file


# subnav:
#  - text: Section one
#    href: '#section-one'
#  - text: Section two
#    href: '#section-two'
---

## Use Cases
### **Machine Learning**
* Classification
* Clustering: [Python Example (Not attached yet)](/assets/img/geospatial//assets/img/___.html)

### **Modeling**
* Process based or statistical models

### **Time Series Analysis**

### **Geostatistics**
* Spatial variance or autocorrelation
* Kriging / Interpolation

## When is SCINet Appropriate?
Setting up and modifying analyses to run on SCINet involves a nontrivial amount of overhead. Therefore, you should first evaluate if SCINet is an appropriate avenue for your research. Typically, analyses that are well suited in SCINET are: 
* CPU intensive workloads
* High memory workloads

Additional considerations are:
* Is my analyses already optimized?
* Will I need to parallelize my analyses (typically for cpu intensive workloads)?
* Will I require more than a single node (ie. distributed computing)

## Tools / Software
The following tools/software are currently available on SCINet.
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
* [**SCINet Remote Sensing Docker Image**](https://hub.docker.com/r/rowangaffney/data_science_im_rs): Python+R geospatial libraries and JupyterLab IDE (R, IDL, and Python kernels).
    *  Located at (read only): /project/geospatial_tutorials/data_science_im_rs.sif
       or
    *  Pull from dockerhub repository to local folder with:
```bash
singularity pull docker://rowangaffney/data_science_im_rs
```
    * [Setup Tutorial for JypuyterLab and Dask Distrubuted on SCINet](/assets/img/geospatial/Tutorial1.html)
