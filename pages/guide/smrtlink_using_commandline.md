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

* [Instructions for SMRTLink v10](#instructions-for-smrtlink-v10)
    - [View the available workflows](#view-the-available-workflows)
    - [View input options for a workflow](#view-input-options-for-a-workflow)
    - [Use cromwell config files for Ceres](#use-cromwell-config-files-for-ceres)
    - [Sample batch script](#sample-batch-script)

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

## Instructions for SMRTLink v10

Unlike v7 of SMRTLink, v10 uses [Cromwell workflow manager](https://cromwell.readthedocs.io/en/stable/) which offers additional flexibility and compatibility with SLURM. Commandline version of v10 does not depend on web GUI service and is always available.

There are two main steps involved - provide input parameters for your workflow and then submit the job via SLURM. 

### View the available workflows

```
module load smrtlink/10.0.0
$ pbcromwell show-workflows


cromwell.workflows.pb_hgap4: Assembly (HGAP4)
cromwell.workflows.pb_basemods: Base Modification Analysis
cromwell.workflows.pb_ccs_demux: CCS with Demultiplexing
cromwell.workflows.pb_ccs_mapping: CCS with Mapping
cromwell.workflows.pb_ccs: Circular Consensus Sequencing (CCS)
cromwell.workflows.pb_bam2fastx: Convert BAM to FASTX
cromwell.workflows.pb_demux_subreads: Demultiplex Barcodes
cromwell.workflows.pb_demux_ccs: Demultiplex Barcodes
cromwell.workflows.pb_export_ccs: Export Reads
cromwell.workflows.pb_assembly_hifi: Genome Assembly
cromwell.workflows.pb_isoseq3_ccsonly: Iso-Seq Analysis
cromwell.workflows.pb_isoseq3: Iso-Seq Analysis
cromwell.workflows.pb_laa: Long Amplicon Analysis (LAA)
cromwell.workflows.pb_align_subreads: Mapping
cromwell.workflows.pb_align_ccs: Mapping
cromwell.workflows.pb_mark_duplicates: Mark PCR Duplicates
cromwell.workflows.pb_assembly_microbial: Microbial Assembly
cromwell.workflows.pb_mv_ccs: Minor Variants Analysis
cromwell.workflows.pb_resequencing: Resequencing
cromwell.workflows.pb_sat: Site Acceptance Test (SAT)
cromwell.workflows.pb_sv_ccs: Structural Variant Calling
cromwell.workflows.pb_sv_clr: Structural Variant Calling
cromwell.workflows.pb_trim_adapters: Trim gDNA Amplification Adapters
```

### View input options for a workflow

Using *Genome Assembly* as an example - 

```
$ pbcromwell show-workflow-details pb_assembly_hifi


Workflow Summary
Workflow Id    : cromwell.workflows.pb_assembly_hifi
Name           : Genome Assembly
Description    : Genome assembly at any scale using HiFi reads
Required Inputs:
Optional Inputs: ConsensusReadSet XML
Tags           : ccs, assembly, cromwell
Task Options:
  reads = None
    Reads (file)
  ipa2_genome_size = 0
    Genome Length (integer)
  ipa2_downsampled_coverage = 0
    Downsampled coverage (integer)
  ipa2_advanced_options =
    Advanced Assembly Options (string)
  ipa2_run_polishing = True
    Run polishing (boolean)
  ipa2_run_phasing = True
    Run phasing (boolean)
  ipa2_run_purge_dups = True
    Purge duplicate contigs from the assembly (boolean)
  ipa2_ctg_prefix = ctg.
    Ipa2 ctg prefix (string)
  ipa2_reads_db_prefix = reads
    Ipa2 reads db prefix (string)
  ipa2_cleanup_intermediate_files = True
    Cleanup intermediate files (boolean)
  dataset_filters =
    Filters to Add to the Data Set (string)
  filter_min_qv = 20
    Min. CCS Predicted Accuracy (Phred Scale) (integer)


Example Usage:

  $ pbcromwell run pb_assembly_hifi \

  $ pbcromwell run pb_assembly_hifi \
      -e input1.consensusreadset.xml \
      --task-option reads=None \
      --task-option ipa2_genome_size=0 \
      --task-option ipa2_downsampled_coverage=0 \
      --task-option ipa2_advanced_options="" \
      --task-option ipa2_run_polishing=True \
      --task-option ipa2_run_phasing=True \
      --task-option ipa2_run_purge_dups=True \
      --task-option ipa2_ctg_prefix="ctg." \
      --task-option ipa2_reads_db_prefix="reads" \
      --task-option ipa2_cleanup_intermediate_files=True \
      --task-option dataset_filters="" \
      --task-option filter_min_qv=20 \
      --config cromwell.conf \
      --nproc 8
```   

### Use cromwell config files for Ceres

As shown above, the *pbcromwell run* command requires a cromwell config file for the jobs to be submitted via SLURM. On ceres, the config files are avaiable in a central location. Users can point to the files directly or can copy and modify based on their individual requirements. The config files are located at 
```
/system/smrtanalysis/10/slurm_template/cromwell-slurm-short.conf
/system/smrtanalysis/10/slurm_template/cromwell-slurm-medium.conf
/system/smrtanalysis/10/slurm_template/cromwell-slurm-mem.conf
```
The file names correspond to the partitions the jobs will be submitted to. 

Priority users can copy those files to their work directory and modify the following (lines 130-131)

```
        runtime-attributes = """
        Int cpu = 8
        Int requested_memory_mb_per_core = 8000
        String queue_name = "short"
        String? jms_args
        """
```

to

```
        runtime-attributes = """
        Int cpu = 8
        Int requested_memory_mb_per_core = 8000
        String queue_name = "priority"
        String? jms_args = "--qos=your_QOS --time=14:00:00" 
        """
```
 
Users can also modify the CPU threads or memory per core values but these default values should suffice for most workflows. 

### Sample batch script

```
#!/bin/bash

#SBATCH -N 1 # No. of nodes used
#SBATCH -n 4      # Threads 
#SBATCH -t 240    # Minutes

module load smrtlink/10

pbcromwell run pb_assembly_hifi \
      -e input1.consensusreadset.xml \
      --task-option reads=None \                       # Task options vary based on the workflow
      --task-option ipa2_genome_size=0 \               # These task options are optional and will use default values if not specified
      --task-option ipa2_downsampled_coverage=0 \
      --task-option ipa2_advanced_options="" \
      --task-option ipa2_run_polishing=True \
      --task-option ipa2_run_phasing=True \
      --task-option ipa2_run_purge_dups=True \
      --task-option ipa2_ctg_prefix="ctg." \
      --task-option ipa2_reads_db_prefix="reads" \
      --task-option ipa2_cleanup_intermediate_files=True \
      --task-option dataset_filters="" \
      --task-option filter_min_qv=20 \
      --config /system/smrtanalysis/10/slurm_template/cromwell-slurm-short.conf \
      --nproc 8 \                                     # this option is required for some stages in the pipeline
      --backend SLURM \                               # Set the default backend
      --tmp-dir \${TMPDIR} \                          # Use TMPDIR variable
      -c 8 \                                          # Number of chunks
      --output-dir hifi-out			      # 
```
