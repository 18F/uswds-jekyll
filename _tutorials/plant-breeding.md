---
title: Quantitative Trait Locus (QTL) Analysis for Breeding
description: Quantitative Trait Locus Analysis for Breeding research
author:
layout: page
---
By: Justin Vaughn

# Performing QTL-seq data processing on Ceres

## What is QTL-seq?

Bulk segregant analysis (BSA) is used to find genes by identifying biased allele frequencies between two population that have been pooled based on distinctive phenotypes.  The technique has historically been limited by the qualitative nature of older genotyping platforms.  Next-generation sequencing allows for more precise characterization of allele frequencies in a population. This capacity was first realized in yeast studies, where extremely large populations sizes (>100,000) individuals were used and extreme individuals within the population were pooled and resequenced (Ehrenreich et al., 2010).  Plant researchers quickly attempted to apply the above approach, commonly referred to as “QTL-seq”, to quantitative traits such as cold-tolerance (Yang et al., 2013), fungal rice blast (Takagi et al., 2013), and wheat grain protein (Trick et al., 2012), among others.  Though much of the work in QTL-seq is in the field and lab, the last portion does require bioinformatics.  To that end, we provide the following work-flow.

## Getting everything ready to run this pipeline (aka: things I won't discuss how to do)

1. Get sequencing data on Ceres and in a working directory
2. Combine reads across sequencing lanes, if needed
3. Create and run job scripts

## Processing raw reads to get allele depth in each bulk

Sequencing data for each bulk should be mapped to a reference genome using bowtie or bwa with appropriate parameters.  A plausible job script might look something like this:
```bash
#!/bin/bash

#SBATCH --job-name="qtl_seq"
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 40
#SBATCH -t 48:00:00
#SBATCH --mail-user=your.email@usda.gov
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH -o "stdout.%j.%N"
#SBATCH -e "stderr.%j.%N"

module load bwa
module load samtools

#map reads from low bulk sample
bwa mem -t 40 reference.fasta lowBulk_R1.fastq.gz lowBulk_R2.fastq.gz | samtools view -
bS - | samtools sort - > lowBulk.sort.bam
samtools index lowBulk.sort.bam

#map reads from high bulk sample
bwa mem -t 40 reference.fasta highBulk_R1.fastq.gz highBulk_R2.fastq.gz | samtools view -
bS - | samtools sort - > highBulk.sort.bam
samtools index highBulk.sort.bam

#End of file
```

Call variants and add information about the allele frequency in each sample:
```bash
#!/bin/bash

#SBATCH --job-name="qtl_seq"
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 40
#SBATCH -t 48:00:00
#SBATCH --mail-user=your.email@usda.gov
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH -o "stdout.%j.%N"
#SBATCH -e "stderr.%j.%N"

module load samtools
module load bcftools

#map reads to reference.fa using bwa or bowtie to generate highBulk.bam and lowBulk.bam
samtools faidx reference.fasta #creates index
samtools mpileup -g -t AD -f reference.fasta highBulk.sort.bam lowBulk.sort.bam > output.bcf #calls variants and adds fequency information
bcftools call -vc -V indels output.bcf > output_snps.bcf #filter to snps
#The inclusion of repeats in your experiment can dramatically reduce your signal strength; therefore, poor mapping quality and excess depth of coverage are two key features to filter on.  So the next step is optional but something like it is highly recommended
bcftools filter -i 'MQ>50 && DP>5 && DP<60' -O b output_snps.bcf > filt_output_snps.bcf
bcftools convert filt_output_snps.bcf -O z -o output_snps.vcf.gz #convert to compressed VCF
```

## Examining differential frequency of alleles visually and identifying peak genomic regions

From this point, it may be worthwile to download your resultant compressed VCF file and then run processing and viewing programs locally.  Alternatively, you can also use RStudio on Ceres as documented in the auxiliary section below ("Using Rstudio on Scinet CERES in 3 steps").  We focus on a QTL-seq analysis software called QTLSurge.  Many others exist, such as [QTLseqr](https://github.com/bmansfeld/QTLseqr).  Importantly, these other programs may not be completely compatible with the pipeline we have described above.

QTLsurge is designed to be run under RStudio as a Shiny app and requires some dependent libraries.  These are already installed on Ceres, so you can skip step 0 if working there:  

1. Install dependancies: [RStudio](https://www.rstudio.com/products/rstudio/download/) then, using Rstudio package manager, install zoo, ggplot2, and shiny libraries.
2. Download the programs: QTLsurge.R and vcf2freq.pl from [QTLsurge](https://github.com/USDA-ARS-GBRU/QTLsurge) and put in an appropriate folder.
3. Open QTLsurge.R in RStudio
4. Press "Run App" button
5. If using a Windows machine (not Ceres), you may also have to [install Perl.](https://learn.perl.org/installing/windows.html)

QTLsurge requires a tab delimited file containing chromosome ID in the first column, SNP location in the second column, high-bulk allele frequency in the third column, low-bulk allele frequency in the fourth column, deltaSNP (difference between high and low frequency) value in the fifth column, and cycle number in sixth column (see `test/test.freq`).  Regardless of sign, all deltaSNP values are converted to absolute values for plotting and window calculation.

A testing file (`test/test.freq`) is located on the github page.  This file demonstrates the required input format and can be used to test that your app is working correctly.

Create such a file from the data produced above:

```bash
gunzip output_snps.vcf.gz #uncompresses as output_snps.vcf and removes output_snps.vcf.gz
perl vcf2freq.pl output_snps.vcf 0 >output_frequency_file.txt #vcf2freq.pl is supplied as a helper program, converts to QTLsurge format.  The last argument is the cycle you are on.  Use 0 if this is your initial, standard QTL-seq experiment.  This script is not robust to variation in genotype format and only accepts "GT:PL:AD" format that results from the pipeline described above.
```

Browse to this file and open it.  A graph, similar to the one below will appear momentarily.  You can step through each chromosome using the interface and look for peaks that are above the genome-wide threshold (95th percentile based on raw deltaSNP values).  Because raw data of this kind is very noisy, a sliding window average is supplied.  The appropriate window size is a function of population size, recombination rate, marker density, and read depth.  Generally, if read depth is >40x, your window size should decrease as your population size increases.  A good rule-of-thumb is that few windows should have an average that extends beyond 3 standard error units of a directly adjacent window, assuming your overlap-to-window-size is ~20%.  The red line indicates the average of window and the gray shading indicates 3 standard error units. Note: Setting the overlap size very low will cause QTLSurge to respond slowly and should only be used when zoomed in to a <1MB range.

![image](/assets/img/loadedFileOverview.png)

For a standard QTL-seq experiment, this might be a stopping point for publication.  QTLsurge provides further support for iterative rounds of genotyping that allow a researcher to further pinpoint genes and/or confirm the peaks that they have discovered.  The QTLsurge page describes these possible experiments and analyses in more detail.

## Using Rstudio on Scinet CERES in 3 steps

### Log into CERES, and run a pre-made Rstudio script

Open up two terminals or putty windows (important for later) and use one to connect to [username]@scinet.science.  Then, either use the file in /reference/containers/RStudio/3.6.0/rstudio.job, or create an Rstudio script at: https://e.arsnet.usda.gov/sites/OCIO/scinet/accounts/ceres_job_script_generator/Home.aspx .

(If using the generator, make sure you select “Rstudio” in the ‘Job Script template’ dropdown menu).  I recommend copying the /reference/ or generated script into your desired working directory. You should now edit the script to request the time and resources you want.  Some R modules, like those for coexpression analysis, need many threads and lots of memory, so you’ll want to edit the “--mem”and “--nodes” lines in the script to request the memory and CPUs you need. Also, for the next step, you may wish to edit the “--output” line to change where the output  (instructions) from this job will go to be the working directory you want, as the default is always /home/[username]. Those instructions will tell you what to do next in detail.

### Submit the job and read the instructions in the generated rstudio-out file

The outputted “rstudio-[lots of numbers].out” file will have instructions on how to connect to your now-running Rstudio session.  You can either a) create an ssh tunnel with an “ssh -N -L 8787:hostname:port” command, then open a browser window at “localhost:8787” (you can then minimize the terminal window you used to do the “ssh -N -L” command); or b) connect to the SciNET VPN, and go to the hostname:8787 address indicated in the rstudio-out file in your browser of choice.

### Log into the Rstudio server

If you did the above step correctly, your browser should be presenting you with an Rstudio login screen. Following the instructions in the same output file above, log into the server in the browser window using the credentials supplied in that file (your Scinet user name and a randomly-generated one-time password).  
