---
title: SCINet for genomics research
description: SCINet has a number of tools available for genomics research
permalink: /user/genomics/
author: Erin Scully
layout: page

 
sidenav: Use Cases
subnav:
  - text: Use Case
    href: '#use-case'
  - text: Tools and Software
    href: '#tools-and-software'
sticky_sidenav: true
sticky_element: true
---

<br>
By: Erin Scully

## Use Case

ARS scientists in several locations throughout the United States are combining forces to provide high quality genome assemblies, gene models, and functional annotations for the 100 most dangerous and damaging arthropod pests of US agriculture in an effort called the [Ag100Pest Initiative](http://i5k.github.io/ag100pest). Insect genomes are surprisingly complex and variable, ranging from slightly over 100 Mb to over 2 Gb in size. Furthermore, their structural complexities vary as many arthropod genomes contain multicopy gene families arranged in large tandem arrays and large repetitive regions. Using new methods for generating long-read sequencing libraries from low DNA inputs typically obtained from single small-bodied insects, genome assemblies of several arthropods have been generated using PacBio Sequel II instrument and assembled using tools deployed on the SCINet Ceres HPC system, including the spotted lanternfly (*Lycorma delicatula*) quarantine pest ([see Kingan et al. 2019](https://doi.org/10.1093/gigascience/giz122)).

As part of this initiative, [**a functional annotation pipeline**](https://agbase-docs.readthedocs.io/en/latest/agbase/workflow.html) was developed to facilitate the addition of Gene Ontology (GO) terms, Kyoto Encyclopedia of Genes and Genomes (KEGG) pathway annotations, and IntePproScan results to gene models generated for *de novo* genome and transcriptome projects. Unlike other GO tools, this pipeline allows the user to customize criteria for adding GO and KEGG terms to gene models, such as the degree of functional validation, minimum bit scores, raw scores, e-values, and percent identities. This tool is now deployed on the SCINet Ceres HPC system.

The [National Agricultural Library (NAL)](https://www.nal.usda.gov/main/) maintains all Ag100Pest genome assemblies and annotations at the [i5k workspace](https://i5k.nal.usda.gov/). Integration with [WebApollo](https://genomearchitect.readthedocs.io/en/latest/) facilitates manual curation and sharing of gene sets of interest with collaborators.  


## Tools and Software

ARS is among the world’s leading producer and user of genomic, transcriptomic, proteomic, and other -omics data for non-model organisms of agricultural importance, including pathogens, insects, animals, and plants. On-going projects in the agency related to these efforts include *de novo* genome and transcriptome assembly and annotation, whole genome resequencing for population, strain, and biotype analyses, and comparative genomics and gene family evolution.

SCINet hosts the following tools to facilitate these studies (see the [Software Overview](/guide/software) for a full list of software currently available on Ceres):

**GOanna** Gene Ontology tool ([see instructions for using on Ceres](https://agbase-docs.readthedocs.io/en/latest/goanna/using_goanna_ceres.html))

### Genome assemblers
for long-reads, short-reads, and hybrid approaches and tools for generating Hi-C maps:<br>
ALLPATHS, Canu, DISCOVAR, FALCON, Juicer, MECAT, SALSA, SOAPdenovo, SPAdes, and Supernova

### Transcriptome assemblers
ABySS, Trinity, and Velvet

### Gene prediction and annotation tools
Augustus, BUSCO, GeneMark, Glimmer, InterProScan, MAKER, Prokka, RepeatMasker , RepeatModeler, TransDecoder, Trinotate, and tRNAScan

### RNA-Seq analysis
Ballgown, Bowtie, Cufflinks, HISAT2, kallisto, PASA, Salmon, and Stringtie

### Comparative Genomics
BLAST, Circos, DIAMOND, MCScanX, and OrthoFinder

### Phylogenetics
GARLI, PhyML, and RAxML

### GUI tools for working with genomic data
Floating licenses for Geneious Prime GUI (graphic user interface) tools are available through SCINet. 

Additionally, GUI server licenses for [Geneious](/guide/geneious) and [CLC Workbench](/guide/clc) are also available. 

A [Galaxy](/guide/galaxy) instance is also available on Ceres, allowing users to run popular command line tools through a GUI.
<br><br><br>

**SCINet users can also install other freely-available software to suit their research needs or request system-wide installation by contacting the [Virtual Research Support Core](/support/vrsc).** 
