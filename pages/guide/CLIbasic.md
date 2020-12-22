---
title: List of basic CLI commands
description: List of basic CLI commands
permalink: /guide/CLI/
author: Marina Kraeva
layout: page
---



**man *command*** - Show manual for *command*

**pwd** - Output the current directory that you are in

**ls** - List the content of the current directory

 >**ls -a** - List all the content, including hidden files 

 >**ls -l** - List the content and its information


**mkdir *foldername*** – Create a new folder *foldername*

**cd *foldername*** – Change the working directory to *foldername*

 >**cd** - Return to $Home directory 

 >**cd ..** - Go up a directory 

 >**cd -** - Return to the previous directory


**my_quotas** - reports storage usage and quota information for home and project directories


**emacs, nano, vi** – Editors 

**cp *source destination*** – Copy *source* to *destination*

 >**cp -r *source destination*** – Copy a folder recursively from *source* to *destination*

**mv *source destination*** - Move (or rename) a file from *source* to *destination*

**rm *file*** - Remove *file*

 >**rm -r *folder*** - Remove *folder* and its contents recursively

**cat *file*** – Print contents of *file* on the screen

**less *file*** - View and paginate *file*

**head *file*** - Show first 10 lines of *file* 

**tail *file*** - Show last 10 lines of *file*


**history** – Show list of commands issued earlier

***!commandnumber*** – Reissue command number *commandnumber*


**which *command*** – Shows the full path of *command*


**module avail** or **module spider** – Show all available software modules

>**module avail *swname*** – Show all modules that have *swname* in the name

**module load *modulename*** – Load module *modulename* in your environment

**module unload *modulename*** - Unload module *modulename* from your environment

**module list** – List all modules currently loaded in your environment

**module help *modulename*** – Show information about module *modulename*

**module purge** – Unload all modules from your environment

**module use *path*** – Add *path* where to search for available modules


**salloc -p debug -N 1 -n 2 --mem=7G -t 2:00:00** – Request 2 cores and 7 GB of memory in debug partition for 2 hours

**exit** – Close session (should be used to close interactive session)

**sbatch *jobscript*** – Submit *jobscript* into queue

**squeue** – Show all jobs currently running or waiting in the queue

**sinfo** – Show available partitions (queues)

**scancel *jobnumber*** – Cancel job *jobnumber*

**seff *jobnumber*** – Get resource usage information for job *jobnumber* (use it for jobs that have already finished)

