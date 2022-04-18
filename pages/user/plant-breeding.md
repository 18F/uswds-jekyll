---
title: SCINet for plant breeding research
description: SCINet plant breeding research use case
permalink: /user/plant-breeding/
author:
layout: page

 
sidenav: Use Cases
subnav:
  - text: Use Case
    href: '#use-case'
sticky_sidenav: true
sticky_element: true
---

By: Justin Vaughn

The [USDA’s National Plant Germplasm System](https://www.ars-grin.gov/) maintains the world’s foremost collection of crop diversity. In order the make that diversity useful to breeders and stakeholders, the USDA seeks to characterize the agronomic and, more recently, genetic properties of the plants in these collections. Genome sequencing is the ultimate genetic characterization of an individual. To that end, the USDA is engaged in sequencing key individuals to represent each crop. This information, when combined with trait data, can reveal the genetic basis of plant traits.

When a reference genome of a species is available, sequencing an individual usually involves getting millions of short sequence reads from random parts of the genome and then aligning those reads to the reference. Once aligned, additional algorithms are used to identity differences relative to the reference, which requires extensive computation. Though it is possible to process a few whole genomes on local computers, USDA's crop collections range from hundreds to thousands of individuals. With its multi-threaded architecture and large static and dynamic memory capacity, SCINet’s computational cluster, Ceres, makes work on this scale possible.



## Use Case

ARS scientists are currently characterizing numerous crop collections at the whole genome level. Two examples, spearheaded by the [Genomics and Bioinformatics Research Unit (GBRU)](https://www.ars.usda.gov/southeast-area/stoneville-ms/genomics-and-bioinformatics-research/), are focused on US rice and cotton. GBRU in collaboration with the [Dale Bumper National Rice Research Center](https://www.ars.usda.gov/southeast-area/stuttgart-ar/dale-bumpers-national-rice-research-center/) has sequenced 166 rice varieties and produced a gold-standard set of genetic variants in rice. This effort required months of processing time on Ceres as well as software developed in human genetics (HaplotypeCaller). These variants will be released to RiceBase ([ricebase.org](https://ricebase.org/)) and can be explored in an interactive app called HaploStrata ([github.com/USDA-ARS-GBRU/HaploStrata](https://github.com/USDA-ARS-GBRU/HaploStrata)). Cotton, because of its complex history and polyploid structure, is still in the process of being analyzed on Ceres. When finished, the results will be coupled with phenotypic data to give new insight into the regions of the genome that can be targeted to further enhance the US fiber industry.


See also this Ceres data processing tutorial for plant breeding scientists: [Quantitative Trait Locus (QTL) Analysis for Breeding](/tutorials/plant-breeding/)
