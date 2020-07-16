---
layout: post
title: "Geospatial Research Workflows in our Community: when we do (and when we don’t) use the HPC"
categories: [Stories]
excerpt: "Geospatial research can require different computational needs, typically dependent on the spatial scale and resolution, number of data layers, and types of analyses. Here we highlight representative workflows and computational requirements for geospatial research from ARS scientists."
---
### By: Amy Hudson and Kerrie Geil   |  07-16-2020
### USDA-ARS, Range Management Research Unit, Las Cruces, NM

![](/assets/img/SCINETJULY_userstory1_1280px.png)

Geospatial research can require different computational needs, typically dependent on the spatial scale and resolution, number of data layers, and types of analyses. Here we highlight representative workflows and computational requirements for geospatial research from ARS scientists. These workflows range from running GIS on a local desktop, to a local server, to a SCINet high performance computer (HPC). We also share perceived barriers and benefits to using the HPC. 

# GIS on a local computer

Alisa Coffin is a landscape ecologist at the Southeast Watershed Research Laboratory in Tifton, Georgia, who leverages ArcGIS to analyze geospatial data. ArcGIS is a proprietary geographic information system developed and maintained by ESRI. In Alisa’s 2015 paper in BioEnergy Research, she used ArcGIS Desktop to identify land along Georgia’s coastal plain that would both be suitable for planting biomass fuel crops and would benefit in a conservation sense (e.g. lower erosion rates). Alisa used the Spatial Analyst module of ArcMap and the “Hydrology Toolkit” to analyze 6GB of raw data (croplands, 10-meter digital elevation models, soils maps, etc.), with intermediate steps producing 118GB of files. Memory capacity problems can arise and sometimes require Alisa to ‘chunk’ the geospatial data into smaller subsets.

Alisa saves history logs to document her workflows in ArcGIS. However, as a supervisor, she finds that this method of reproducibility is not ideal because she also needs to access the history logs of the people she supervises. While Alisa did not require the use of an HPC for this analysis, she mentions that Jupyter notebooks may be a useful tool to improve reproducibility in her workflow. ArcGIS Enterprise 10.7 has a new capability of ArcGIS Notebooks which provide users with a Jupyter notebook environment hosted in the ArcGIS Enterprise portal. 

# GIS on local servers 

Sarah Goslee in the Pasture Systems and Watershed Management Research Unit at University Park, PA conducted a continental-scale analysis of drivers of agricultural diversity, recently published in the May issue of Frontiers in Sustainable Food Systems. Sarah follows principles of reproducible research by scripting in the Open-source software GRASS GIS and R, and then running these scripts on her local servers. Sarah has a 60-TB hard drive array and manually splits jobs between several high-performance linux servers. In this study, Sarah used a Random Forest model  to rank the importance of geospatially resolved climate, soil, and irrigation data to crop diversity. 

With over 24 climate, soil, and irrigation data layers being examined for the entire continental United States and aggregated to a common coarseness of 4km for 14 years (2001-2015), Sarah shared that a major reason why she has not translated her workflow to the SCINet HPC lies in the time and effort of uploading her TBs of data from her machine to the HPC. 

# Parallel Computing on the Ceres HPC

Rowan Gaffney in the Rangeland Resources and Systems Research Group in Fort Collins, CO is working with a team to quantify cattle grazing preferences using hyperspectral imagery from NSF’s National Ecological Observatory Network (NEON) and GPS cattle collar location data from the LTAR Central Plains Experimental Range (CPER) site. From the NEON imagery, Rowan has developed a high resolution (1-meter) vegetation map over the CPER site (publication forthcoming), which is a big improvement in spatial resolution over traditional methods of estimating vegetation cover classes at the ranch-scale. For each year of the NEON data that he used to develop his vegetation map, there were about 26 NEON flights collecting hyperspectral imagery in 426 different spectral bands. Multiplying the number of spectral bands by the more than 200 million imagery pixels covering the CPER site results in over 90 billion observations and ~600 GBs in memory per data year to process.

This type of “big data” processing is well suited for the SCINet HPCs, which can save a researcher countless hours of computing time versus processing on individual workstations or smaller lab servers. Rowan uploaded the NEON imagery data to the Ceres HPC on SCINet using Globus. He processed the data using an array of Python tools, including xarray, scikit-learn, and dask to run multiple simultaneous computing jobs (parallel processing) on the HPC. To support reproducibility of these efforts, the analysis was conducted in a singularity container, which was built and archived on DockerHub. Additionally, by utilizing a SCINet HPC for his research, Rowan was able to get support from the SCINet Virtual Research Support Core (VRSC) to help install software, build containers, and optimize his research code.

USDA ARS scientists conduct novel geospatial research with and without the SCINet HPC. Increasing collaboration between researchers and multiple team member groups may spread the value of the SCINet HPC along themes of reproducibility and efficiency. For example, Alisa, Sarah, and Rowan are all currently on a large team to define agroecoregions from the Long-term Agroecosystem Research network (LTAR), for which Rowan is using the HPC. SCINet efforts to improve file transfer time, the creation of a data commons, and the support of the VRSC, are promising to increase HPC usage among geospatial researchers.     

# References:

Coffin, A.W., Strickland, T.C., Anderson, W.F., Lamb, M.C., Lowrance, R.R., Smith, C.M., 2016. Potential for Production of Perennial Biofuel Feedstocks in Conservation Buffers on the Coastal Plain of Georgia, USA. Bioenergy Res. 9, 587–600. [](https://doi.org/10.1007/s12155-015-9700-4)

Goslee, S.C., 2020. Drivers of Agricultural Diversity in the Contiguous United States. Front. Sustain. Food Syst. 4, 1–12. [](https://doi.org/10.3389/fsufs.2020.00075)

