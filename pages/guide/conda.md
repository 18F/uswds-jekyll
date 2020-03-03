---
title: User-Installed Software on Ceres with Conda
description: Using Conda
permalink: /guide/conda/
author: Nathan Weeks
layout: page
---


#### Table of Contents
* [Introduction](#introduction)
* [Setup](#setup)
* [Installing Software](#installing-software)
  * [Example 1: Installing Trinity into a home directory](#example-1-installing-trinity-into-a-home-directory)
  * [Example 2: Installing Tensorflow into a /KEEP directory](#example-2-installing-tensorflow-into-a-keep-directory)
* [Managing Environments](#managing-environments)


# Introduction

[Conda](https://conda.io/) is a software package manager for data science that allows unprivileged (non-administrative) Linux or MacOS users to search, fetch, install, upgrade, use, and manage supported open-source software packages and programming languages/libraries/environments (primarily Python and R, but also others such as Perl, Java, and Julia) in a directory they have write access to. Conda allows SCINet users to create reproducible scientific software environments (including outside of Ceres) without requiring the submission of a SCINet software request form for new software, or contacting the VRSC to upgrade existing software.

Many open-source scientific software packages are available:
* [Browse/search](https://anaconda.org/search) all conda packages

The [Bioconda](http://bioconda.github.io/) channel contains thousands of software packages that are useful for bioinformatics.
*	[Browse/search](https://bioconda.github.io/conda-recipe_index.html) available Bioconda software packages


# Setup

Before using conda or conda-installed software on Ceres, the *miniconda* environment module (which contains the conda software environment) must be loaded. To load the latest miniconda module available on Ceres:
```
[user.name@ceres ~]$ module load miniconda
```

You can check which version of miniconda loaded with:
```
[user.name@ceres ~]$ conda --version
```

You can see all available versions of miniconda on Ceres with:
```
[user.name@ceres ~]$ module spider miniconda
```

*(One-time setup)* Before using conda for the first time on Ceres, execute the following commands to configure conda to search the appropriate channels for software:
```
[user.name@ceres ~]$ conda config --add channels defaults
[user.name@ceres ~]$ conda config --add channels bioconda
[user.name@ceres ~]$ conda config --add channels conda-forge
```


# Installing Software

Software can be installed into separate environments (directories) that are managed separately. At least one environment must be created before installing software using the Ceres miniconda environment module.

On Ceres, suitable locations for conda environments housing conda packages include:

1. Home directory (default; subdirectory of $HOME/.conda/envs/)

  NOTE: some Conda packages (with dependencies) can take gigabytes of storage space. Use the Ceres command  `my_quota`  to check the available space in your home directory. Contact the VRSC [scinet_vrsc@USDA.GOV](mailto:scinet_vrsc@USDA.GOV?subject=home%20directory%20quota%20increase) if a home directory quota increase is needed.

2. A user-specified directory within one's project storage on the /KEEP file system, e.g.,
/KEEP/\<MY_PROJECT>/\<MY_ENVIRONMENT_DIRECTORY>

  This environment is then usable by others in the project.

**CAUTION: Avoid installing software into the /project file system if possible. It is a BeeGFS parallel file system that is tuned for fewer, larger files, and suffers degraded performance when used as the target for conda packages, which frequently contain many smaller files.**


## Example 1: Installing Trinity into a home directory

Load the latest miniconda module if you haven't already and create an environment called "trinityenv":
```
[user.name@ceres ~]$ module load miniconda
[user.name@ceres ~]$ conda create --name trinityenv
```

Note that the  `conda create` command used above without the --prefix option will create the environment in your home directory ($HOME/.conda/envs/).

To activate the environment (and update environment variables such as PATH that are required to use software installed into this environment):
```
[user.name@ceres ~]$ conda activate trinityenv
(trinityenv) [user.name@ceres ~]$
```

NOTE: In older conda versions, use source activate / deactivate instead of by conda activate / deactivate.

Now that you are inside the trinityenv environment, install software into this environment with:
```
(trinityenv) [user.name@ceres ~]$ conda install <package_name> <package_name> <package_name>
```

For example, install the [Trinity](https://github.com/trinityrnaseq/trinityrnaseq/wiki) transcriptome assembler and [Kallisto](https://pachterlab.github.io/kallisto/) RNA-Seq quantification application (an optional dependency that is not included with the default Trinity 2.8.4 installation). Note this step may take a few minutes:
```
(trinityenv) [user.name@ceres ~]$ conda install trinity kallisto
...
Proceed ([y]/n)? y
...
```

Afterwards, the Trinity and Kallisto executables are in your PATH:
```
(trinityenv) [user.name@ceres ~]$ type Trinity
Trinity is hashed (/home/user.name/.conda/envs/trinityenv/bin/Trinity)

(trinityenv) [user.name@ceres ~]$ Trinity --version
Trinity version: Trinity-v2.8.4-currently using the latest production release of Trinity.

(trinityenv) [user.name@ceres ~]$ type kallisto
kallisto is hashed (/home/scinet.username/.conda/envs/trinityenv/bin/kallisto)

(trinityenv) [user.name@ceres ~]$ kallisto version
kallisto, version 0.44.
```

To exit the environment:
```
(trinityenv) [user.name@ceres ~]$ conda deactivate
[user.name@ceres ~]$ 
```

After deactivating the trinityenv environment, Trinity and kallisto are no longer in your PATH:
```
[user.name@ceres ~]$ type Trinity
-bash: type: Trinity: not found
```


## Example 2: Installing Tensorflow into a /KEEP directory

Load the latest miniconda module if you haven't already and create an environment in your /KEEP directory by using the option  `--prefix`:
```
[user.name@ceres ~]$ module load miniconda
[user.name@ceres ~]$ conda create --prefix /KEEP/my_proj/tensorflow
...
[user.name@ceres ~]$ conda activate /KEEP/my_proj/tensorflow
(/KEEP/my_proj/tensorflow) [user.name@ceres ~]$ conda install tensorflow
... 
```

Note: conda first downloads packages into a package cache directory. By default, the package cache is in your home directory  ($HOME/.conda/pkgs). If installing a large amount of software that may cause home directory quota to be exceeded, you can configure another directory to be the package cache by adding a pkg_dirs list to the $HOME/.condarc file (YAML); e.g.:
`pkg_dirs:`
  `- /KEEP/my_proj/my_pkg_cache`
  

# Managing Environments

See the official [Conda documentation for managing environments](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html) for a complete list of commands.

To list environments that have been created in your home directory:
```
[user.name@ceres ~]$ conda env list
# conda environments:
#
trinityenv               /home/user.name/.conda/envs/trinityenv
root                  *  /software/7/apps/miniconda/4.7.12
```

To list software packages in an environment:
```
[user.name@ceres ~]$ conda list --name trinityenv
# packages in environment at /home/user.name/.conda/envs/trinityenv:
#
...
```
OR
```
[user.name@ceres ~]$ conda list --prefix /KEEP/my_proj/tensorflow
# packages in environment at /KEEP/my_proj/tensorflow:
...
```

**Tip: For reproducibility, a list of all packages/versions in an environment can be [exported to an environment file](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html?highlight=shared#sharing-an-environment), which can be used to [recreate the environment](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html?highlight=shared#creating-an-environment-from-an-environment-yml-file) (e.g., by another user, or on another system) or archived with analysis results. This makes it easy for you or anyone else to re-run your analysis on any system and is also a record of the exact software environment you used for your analysis.**

To remove an environment in your home directory:
```
[user.name@ceres ~]$ conda env remove --name trinityenv
```
To remove an environment in your /KEEP directory:
```
rm –rf /KEEP/my_proj/tensorflow
```

To remove packages not used by any environment, as well as tarballs downloaded into the conda package cache ($HOME/.conda/pkgs):
```
conda clean --all
```
