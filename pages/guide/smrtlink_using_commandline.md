---
title: SMRTLink/SMRTAnalysis using Command Line
description: Guide to use SMRTLink via CLI
permalink: /guide/smrtlink/
author: Yasasvy Nanyam
layout: page
---

#### Table of Contents
* [Instructions for SMRTLink v7](#instructions-for-smrtlink-v7)  
    - [View the available pipelines](#view-the-available-pipelines)
    - [Generate a template file for pipelines](#generate-a-template-file-for-pipelines)
    - [Check available entry points (inputs) for the pipeline](#check-available-entry-points-for-the-pipeline)
    - [Generate workflow template](#generate-workflow-template)
    - [Generate a dataset](#generate-a-dataset)
    - [Sample sbatch script](#Sample-sbatch-script)

## Instructions for SMRTLink v7

Although SMRTLink GUI is useful, it can be very limited. In particular, currently one can not use priority nodes or high memory nodes through SMRTLink GUI. GUI service may also be unavailable at times. This, however, does not affect SMRTLink command line which does not need the GUI service to be alive. 

### View the available pipelines

```
module load smrtlink/7.0.0
pbsmrtpipe show-templates
********************************************************
21 Registered User Pipelines (name -> version, id, tags)
********************************************************
  1. Assembly (HGAP 4)                                        0.2.1    pbsmrtpipe.pipelines.polished_falcon_fat
      denovo
  2. Base Modification Detection                              0.1.0    pbsmrtpipe.pipelines.ds_modification_detection
      modification-detection
  3. Base Modification and Motif Analysis                     0.1.0    pbsmrtpipe.pipelines.ds_modification_motif_analysis    
      motif-analysis
  4. CCS with Mapping                                         0.1.0    pbsmrtpipe.pipelines.sl_subreads_to_ccs_align
      ccs,mapping
  5. Circular Consensus Sequences (CCS)                       0.2.0    pbsmrtpipe.pipelines.sl_subreads_to_ccs
      ccs
  6. Convert BAM to FASTX                                     0.1.0    pbsmrtpipe.pipelines.sa3_ds_subreads_to_fastx
      converters
  7. Convert RS to BAM                                        0.1.0    pbsmrtpipe.pipelines.sa3_hdfsubread_to_subread
      converters
  8. Demultiplex Barcodes                                     0.1.0    pbsmrtpipe.pipelines.sl_ccs_barcode
      barcode,ccs
  9. Demultiplex Barcodes                                     0.1.0    pbsmrtpipe.pipelines.sa3_ds_barcode2_manual
      barcode
 10. Iso-Seq                                                  0.1.1    pbsmrtpipe.pipelines.sa3_ds_isoseq3
      ccs,isoseq
 11. Iso-Seq Classify Only                                    0.1.1    pbsmrtpipe.pipelines.sa3_ds_isoseq3_classify
      ccs,isoseq
 12. Iso-Seq with Mapping                                     0.1.0    pbsmrtpipe.pipelines.sa3_ds_isoseq3_with_genome
      ccs,isoseq
 13. Long Amplicon Analysis (LAA)                             0.2.0    pbsmrtpipe.pipelines.sa3_ds_laa
      laa
 14. Long Amplicon Analysis with Guided Clustering (LAAgc)    0.1.0    pbsmrtpipe.pipelines.sa3_ds_laagc
      alpha,laa
 15. Mapping                                                  0.1.0    pbsmrtpipe.pipelines.sl_align_ccs
      ccs,mapping
 16. Minor Variants Analysis                                  0.2.0    pbsmrtpipe.pipelines.sl_minorseq_ccs
      minorvariants
 17. Minor Variants Analysis                                  0.2.0    pbsmrtpipe.pipelines.sa3_ds_minorseq
      beta,minorvariants
 18. Resequencing                                             0.2.0    pbsmrtpipe.pipelines.sl_resequencing2
      consensus,mapping,reports
 19. Site Acceptance Test (SAT)                               0.1.0    pbsmrtpipe.pipelines.sa3_sat
      consensus,mapping,reports,sat
 20. Structural Variant Calling                               2.0.0    pbsmrtpipe.pipelines.sa3_ds_sv2_ccs
      ccs,sv
 21. Structural Variant Calling                               2.0.0    pbsmrtpipe.pipelines.sa3_ds_sv2
      sv
Run with --show-all to display (unsupported) developer/internal pipelines
```

### Generate a template file for pipelines

```
pbsmrtpipe show-template-details <pipeline ID> -j <filename>.json
```

Example below shows how to generate a template file for HGAP4 assembly.
The generated JSON file will contain options in the form of “KEY”: “VALUE“ that users could edit. 

```
pbsmrtpipe show-template-details pbsmrtpipe.pipelines.polished_falcon_fat \
-j HGAP4-template.json
```

### Check available entry points (inputs) for the pipeline

```
pbsmrtpipe show-template-details pbsmrtpipe.pipelines.polished_falcon_fat | grep -i entry
**** Entry points (1) ****
$entry:eid_subread
```

The value next to the “Entry points“ indicates the number of entry points. In this case, the entry point is a subreadset file. If a subreadset file does not exist or if there multiple subreadset files that you want to combine, [click here](#generate-a-dataset) for instructions to create datasets.

### Generate workflow template

This template is used to talk to SLURM workload manager to divvy up tasks 
 
```
pbsmrtpipe show-workflow-options -j workflow-template.json
```

To submit jobs to a different partition replace the value for the pbsmrtpipe.options.cluster_manager KEY in the generated workflow template file with one of the provided options as shown below:

```
"pbsmrtpipe.options.cluster_manager": "/system/smrtanalysis/7/slurm_template/short"
"pbsmrtpipe.options.cluster_manager": "/system/smrtanalysis/7/slurm_template/medium"
"pbsmrtpipe.options.cluster_manager": "/system/smrtanalysis/7/slurm_template/mem"
```

Users can also copy the template directory and modify values to specify a different partition. For example, to submit jobs to priority partition, in your copy of the template directory make the following changes in file *jmsenv_00.ish* :

```
JMSCONFIG_SLURM_PARTITION="priority";   # Partition 
JMSCONFIG_SLURM_START_ARGS='--qos=gbru --timelimit=7-00:00:00';  # gbru is a example, choose relevant QOS
```

in file *start.tmpl* :

```
--jmsenv "<path_to_your_template_directory>/jmsenv_00.ish" # Change the path to your custom template file
```

After these changes, make sure *"pbsmrtpipe.options.cluster_manager":* in the workflow template file points to your template directory.

> Note that only research groups that purchased nodes on the Ceres cluster have access to priority partitions. 

### Generating a dataset

Raw BAM files are usually accompanied by several XML files. In case the users don’t have these XML files, they can use the following command:
```
dataset create
```

This command takes BAM, file of file names (fofn) or XML files as input. 

For example, to analyze multiple XML SubreadSet files together, issue:
```
dataset create xyz123-combined.subreadset.xml *.subreadset.xml
```

The following types are supported - *HdfSubreadSet, TranscriptAlignmentSet, ContigSet, DataSet,ConsensusReadSet, TranscriptSet, BarcodeSet, ReferenceSet, ConsensusAlignmentSet, GmapReferenceSet, AlignmentSet, SubreadSet*

### Sample sbatch script

After creating datasets, generating templates and making necessary changes, submit a batch job using sbatch command. Below is a sample job script to submit HGAP4 assembly using smrklink v7 

```
#!/bin/bash

#SBATCH --job-name=HGAP4_assembly
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=2
#SBATCH --mem-per-cpu=4000
#SBATCH --partition=long
#SBATCH --output=HGAP4__%j.std
#SBATCH --error=HGAP4__%j.err

module load smrtlink/7.0.0
export HOME=/home/${USER}

pbsmrtpipe pipeline-id pbsmrtpipe.pipelines.polished_falcon_fat -e eid_subread:HGAP4-subreadset.xml \
--preset-json HGAP4-template.json --preset-json workflow-template.json \
--output-dir /path/to/output/dir

### Commands to get the above information ###

# Pipeline id - pbsmrtpipe show-templates
# Create dataset - dataset create HGAP4-subreadset.xml *.subreadset.xml
# Generate template for assembly - pbsmrtpipe show-template-details pbsmrtpipe.pipelines.polished_falcon_fat -j HGAP4-template.json
# Generate workflow template - pbsmrtpipe show-workflow-options -j workflow-template.json
# To check the available entry points - pbsmrtpipe show-template-details pbsmrtpipe.pipelines.polished_falcon_fat

#**** Pipeline Summary ****
#id            : pbsmrtpipe.pipelines.polished_falcon_fat
#version       : 0.2.1
#name          : Assembly (HGAP 4)
#Tags       : denovo
#Description:
# Same as polished_falcon_lean, but with reports.

#**** Entry points (1) ****
#$entry:eid_subread
```
