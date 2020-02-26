---
title: Getting Started with Galaxy on SCINet
description: Using Galaxy
permalink: /guide/galaxy/
author: VRSC
layout: page

---


#### Table of Contents
* [Introduction](#introduction)
* [Logging On](#logging-on)
* [FTP Transfer to Ceres Galaxy](#ftp-transfer-to-ceres-galaxy)
* [Using Galaxy](#using-galaxy)
* [Sharing Your Data and Analysis](#sharing-your-data-and-analysis)
* [Can't Find a Tool You Need?](#cant-find-a-tool-you-need)

# Introduction

**For support contact: scinet_vrsc@usda.gov**

First, a quick note on the terms “Ceres” and “SCINet”: “SCINet” is the network through which you access the high-performance computer named “Ceres”. Generally, we will refer to Ceres accounts in this tutorial because most people think of having an account on a computer, but the account is, more broadly, a network account on SCINet.

There are a few compelling reasons why we think you’re going to like using Galaxy on Ceres:
1. It is a great bioinformatics alternative for those who prefer a graphical user interface.
2. You don’t have to worry with defining queues and number of nodes in a batch command file. We have tried hard to establish appropriate default parameters to take advantage of Ceres’s parallel processing power.
3. FTP transfer is tightly integrated in the Ceres Galaxy framework, so file transfer is intuitive, and you don’t run into data limit bottlenecks as quickly.
4. Galaxy makes it easy to share your analysis with bioinformatic support should the need arise. In addition, you can share with collaborators assuming that they have a Ceres account. 
5. There is plenty of external documentation covering almost all conventional bioinformatic analyses. In fact, many workflows (see below) probably already exist that you can use directly on your data.
6. If you don’t see a tool in the current interface, it probably is in the Toolshed (see below). You can then request that an administrator install it.

In order to use SCINet Galaxy, you need an account on Ceres. [Sign up for a SCINet account](https://usda-ars-gbru.github.io/scinet-site/signup/) to start that process. New accounts will automatically get a Galaxy user name and directory. The user name should match the email you used when registering for your Ceres account and the password will match your Ceres password.



# Logging On

Ceres Galaxy is public facing, so to access it you just type or paste “https://galaxy.scinet.science” into the address bar of a web browser.  We recommend Firefox, Chrome, or Safari. MAKE SURE TO TYPE THE “https://” prefix and note the “s”. 

You will be presented with the following login screen, with boxes on the right to enter your username and password:

![screenshot of galaxy login screen](/scinet-site/assets/img/galaxy-user-guide/galaxy-logging-on-1_1280.jpg)

Your user name should match the full email address you used when registering for your Ceres account and the password should match your Ceres password followed by the Google Authenticator code (Example: password123456). After logging in, the standard Galaxy home screen should appear:

![screenshot of galaxy home screen](/scinet-site/assets/img/galaxy-user-guide/galaxy-logging-on-2_1280.jpg)

The "Tools" bar in the left window frame is where you can load, manipulate, and analyze data. The central window frame is where you will see options and parameters programs that you will be running. The right "History" frame shows all the imported files and programs you have run.  In order to begin, you need to upload data. Often data of general interest, such a genome sequences or annotations, are already available in Galaxy under the "Get Data" tab. More commonly, you will be using data that you have generated.

You will import files into Galaxy by clicking on the "Tools" sub-heading "Get Data" and then "Upload File" under "Get Data".  The following download/upload screen should appear:

![screen shot of galaxy tool to download or upload data](/scinet-site/assets/img/galaxy-user-guide/galaxy-logging-on-3_1280.jpg)

Galaxy offers a method to import data directly from your computer as "Choose local file" button. Feel free to experiment with this direct method, but we find it can be slower and fickler than FTP transfer. To that end, we will mainly focus on uploading files using a file transfer program, such as Globus or Filezilla. If you click on "Choose FTP file", Galaxy will look in your FTP upload folder on Ceres (/galaxy/upload/ceres_email_ID) for files you have uploaded, so you must first upload your data to that folder.



# FTP Transfer to Ceres Galaxy

You need to move or copy your data files to the Galaxy folder in your home directory on Ceres to make them "visible" to Galaxy. Then, you will be able to upload/import the files using Galaxy. Remember, the default quota in SCINet galaxy is only 100 GB. Please contact us to increase your default quota.

We recommend using Globus to move files to your Galaxy folder on Ceres. For instructions please see the [Transferring Files Guide](https://usda-ars-gbru.github.io/scinet-site/guide/globus/).

<!--You can also use Filezilla to move files to your Galaxy folder on Ceres. For instructions please see the [Transferring Files Guide](https://usda-ars-gbru.github.io/scinet-site/guide/globus/).
-->
NOTE: If you already have data on Ceres, simply copy files into your Galaxy folder on Ceres either via command-line (“cp” command) or by using a Filezilla-like tool. These files will appear as if you had uploaded them via FTP and can be imported using the approach described below.

Once your data files are in your Galaxy folder in your home directory on Ceres, go back to the “Upload File” screen and click “Choose FTP site”. You will see the download/upload screen with a list of your files:

![screen shot of galaxy tool to download data from ftp](/scinet-site/assets/img/galaxy-user-guide/galaxy-ftp-transfer-1_1280.jpg)

Select the file you want to import and hit “Start”.  

NOTE: IMPORTING THE DATA INTO GALAXY WILL REMOVE THE FILE THAT YOU MOVED VIA FTP.

You can close this window and the file will appear in the History pane on the right of your home screen:

![screen shot of galaxy home screen with history pane](/scinet-site/assets/img/galaxy-user-guide/galaxy-ftp-transfer-2_1280.jpg)

This is a generic way to import files and can be used regardless of file format.  You are now ready to process your data. 



# Using Galaxy

We have tried to focus on aspects of using Galaxy that are specific to USDA-ARS’s Ceres installation. There are hundreds of tutorials and videos to introduce you to the Galaxy framework, which is essentially the same no matter where it is installed. We suggest that you start at [https://galaxyproject.org/learn/](https://galaxyproject.org/learn/). A nice interactive introduction is also available at Help > Interactive Tours, or [https://galaxy.scinet.science/tours](https://galaxy.scinet.science/tours).

A common initial hang-up is getting your uploaded data in the right format. For sequencing data, you usually need to make clear what quality-scale you are using. For illumina reads, review the following link: [https://galaxyproject.org/support/fastqsanger/](https://galaxyproject.org/support/fastqsanger/). In addition, it is common for sample data from sequencing centers to be spread across multiple lanes. If you only have a few samples, you can concatenate these in Galaxy using Concatenate – Text Manipulation tool. If you have many samples, it will probably be best to concatenate those files prior to uploading using the commandline function *cat*. 

For example, for files ‘samp1_L1_R1.fq’, ‘samp1_L2_R1.fq’ use 
```
[jane.user@sn-cn-18-0 ~]$ cat *R1.fq >sample1_R1.fq
```
Also note, .gz compressed files can be concatenated using the same approach without having to uncompress them first. 

You will usually want to structure your data into Collections for batch processing and downstream analysis. See [https://galaxyproject.org/tutorials/collections/](https://galaxyproject.org/tutorials/collections/) or, for a worked example, [https://depot.galaxyproject.org/hub/attachments/documents/presentations/gcc2014/Chilton.pdf](https://depot.galaxyproject.org/hub/attachments/documents/presentations/gcc2014/Chilton.pdf). Alternatively, most tools will allow you to run the same process on multiple datasets of the same format without combining them as Collections.

Some links to common analyses are given below. Many of these analyses already exist as published workflows and can be used directly. See [https://usegalaxy.org/workflow/list_published](https://usegalaxy.org/workflow/list_published) for a searchable list. To use, download the workflow of interest, click on the “Workflow” tab at the top of your main screen, and then import the workflow according to the instructions. An example of usage is available here: [http://sepsis-omics.github.io/tutorials/modules/workflows/](http://sepsis-omics.github.io/tutorials/modules/workflows/). For those wanting to develop their own worflows, a graphic editor is available, as described here: [https://galaxyproject.org/tutorials/g101/#opening-workflow-editor](https://galaxyproject.org/tutorials/g101/#opening-workflow-editor).

**RNA-seq** – general overview ([https://galaxyproject.org/tutorials/rb_rnaseq/](https://galaxyproject.org/tutorials/rb_rnaseq/)) and galaxy specific pipeline ([https://galaxyproject.org/tutorials/nt_rnaseq](https://galaxyproject.org/tutorials/nt_rnaseq)). Also check out [https://sites.google.com/site/princetonhtseq/tutorials/rna-seq](https://sites.google.com/site/princetonhtseq/tutorials/rna-seq).

**SNP-calling** – [https://galaxyproject.org/tutorials/var_dip/](https://galaxyproject.org/tutorials/var_dip/) for diploid genomes and [https://galaxyproject.org/tutorials/var_hap/](https://galaxyproject.org/tutorials/var_hap/) for haploid genomes.

**IMPORTANT:** If you receive the job error “This job was terminated because it ran longer than the maximum allowed job run time” it means that the tool has not been appropriately configured to run on Ceres using the scale of data that you have provided. Please contact scinet_vrsc@usda.gov and we can optimize these parameters for you and for future users.   



# Sharing Your Data and Analysis

If you need some consultation on your results or on parameter settings, it can be very useful to share your analysis with someone so that you can both be viewing the same thing. To that end, we will give this aspect special emphasis. You can see a short introduction to this option at [https://moin.galaxyproject.org/Learn/Share](https://moin.galaxyproject.org/Learn/Share).

Briefly, if you are in the appropriate history, follow the clicks on the History pane indicated in red (select Settings gear icon, then select "Share or Publish" on the settings menu):

![screenshot of galaxy home screen indicating to click the gear icon on the history pane](/scinet-site/assets/img/galaxy-user-guide/galaxy-sharing-data-1_1280.jpg)


![screenshot indicating to click Share and Publish on the settings menu](/scinet-site/assets/img/galaxy-user-guide/galaxy-sharing-data-2_1280.jpg)

You will see the "Share or Publsish History Galaxy_Walkthru" screem:

![screenshot of the Share or Publish History Galaxy_Walkthru screen](/scinet-site/assets/img/galaxy-user-guide/galaxy-sharing-data-3_1280.jpg)

You can manually enter the user name you wish to share with in the drop-down space. Be careful that the user-name is exact and appropriate capitalization is observed.  

After you have gone through these steps, the person you have shared your history with will need to go to the same gear icon used above but instead click on “Histories Shared With Me”. The shared history should be present on the resultant interface.



# Can't Find a Tool You Need?

We have loaded a core subset of all tools that are available on the public Galaxy server ([https://usegalaxy.org](https://usegalaxy.org)). If you do not see a tool you need and cannot use a good alternative, you should search in the Toolshed ([https://toolshed.g2.bx.psu.edu](https://toolshed.g2.bx.psu.edu)). After identifying the relevant tool, email a Ceres Galaxy administrator: scinet_vrsc@usda.gov. If there are multiple options, we encourage the use of tools developed by either “devteam” or “iuc”. Depending on the nature of the tool you are requesting, we may ask you to supply a sample dataset for testing purposes, so anticipate having that data available. 

Additionally, there is an option for galaxy install as well on the application to [request software](https://usda-ars-gbru.github.io/scinet-site/support/request-software) installation by the VRSC. Select the Galaxy checkbox in the "Type of Application" section:

![screen shot of the software request form section type of application](/scinet-site/assets/img/galaxy-user-guide/galaxy-cant-find-a-tool-1_640.jpg)
