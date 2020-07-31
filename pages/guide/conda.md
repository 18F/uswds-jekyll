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
  * [Best Practices](#best-practices)
  * [Example 1: Installing Trinity into a home directory](#example-1-installing-trinity-into-a-home-directory)
  * [Example 2: Installing Tensorflow into a /KEEP directory](#example-2-installing-tensorflow-into-a-keep-directory)
* [Managing Environments](#managing-environments)


# Introduction

[Conda](https://conda.io/) is a software package manager for data science that allows unprivileged (non-administrative) Linux or MacOS users to search, fetch, install, upgrade, use, and manage supported open-source software packages and programming languages/libraries/environments (primarily Python and R, but also others such as Perl, Java, and Julia) in a directory they have write access to. Conda allows SCINet users to create reproducible scientific software environments (including outside of Ceres) without requiring the submission of a SCINet software request form for new software, or contacting the VRSC to upgrade existing software.

Many open-source scientific software packages are available:
* [Browse/search](https://anaconda.org/search) all conda packages

The [Bioconda](http://bioconda.github.io/) channel contains thousands of software packages that are useful for bioinformatics.
*	[Browse/search](https://bioconda.github.io/conda-package_index.html) available Bioconda software packages


# Setup

Before using conda or conda-installed software on Ceres, the *miniconda* environment module (which contains the conda software environment) must be loaded. To load the latest miniconda module available on Ceres:
```
[user.name@ceres ~]$ module load miniconda
```

You can see all available versions of miniconda on Ceres with:
```
[user.name@ceres ~]$ module spider miniconda
```

*(Optional one-time setup for bioconda users)* If you plan on installing software primarily from the bioconda channel, before using conda for the first time on Ceres, you may wish to configure conda [per the bioconda documentation](http://bioconda.github.io/user/install.html#set-up-channels) to search for software packages in the conda-forge, bioconda, and defaults channels (in that order):
```
[user.name@ceres ~]$ conda config --add channels defaults
[user.name@ceres ~]$ conda config --add channels bioconda
[user.name@ceres ~]$ conda config --add channels conda-forge
```

Otherwise, the conda-forge and then bioconda channels must be specified every time software is installed via `conda install` or `conda create`:

```
conda install -c conda-forge -c bioconda SOFTWARE_PACKAGE1 SOFTWARE_PACKAGE2...
```


# Installing Software

Software can be installed into separate environments (directories) that are managed separately. At least one environment must be created before installing software using the Ceres miniconda environment module.

On Ceres, suitable locations for conda environments housing conda packages include:

1. Home directory (default; subdirectory of $HOME/.conda/envs/)

  NOTE: some Conda packages (with dependencies) can take gigabytes of storage space. Use the Ceres command  `my_quota`  to check the available space in your home directory. Contact the VRSC [scinet_vrsc@USDA.GOV](mailto:scinet_vrsc@USDA.GOV?subject=home%20directory%20quota%20increase) if a home directory quota increase is needed.

2. A user-specified directory within one's project storage on the /KEEP file system, e.g.,
/KEEP/\<MY_PROJECT>/\<MY_ENVIRONMENT_DIRECTORY>

  This environment is then usable by others in the project.

## Best Practices

* **CAUTION: Avoid installing software into the /project file system if possible. It is a BeeGFS parallel file system that is tuned for fewer, larger files, and suffers degraded performance when used as the target for conda packages, which frequently contain many smaller files.**

* **Use an interactive session on a compute node to install software with conda to avoid slowing down the login node for everyone, e.g,**
  ```
  [user.name@ceres ~]$ salloc
  [user.name@ceres14-compute-60 ~]$ module load miniconda
  [user.name@ceres14-compute-60 ~]$ source activate my_env
  (my_env) [user.name@ceres14-compute-60 ~]$ conda install <package_name>
  ...
  ```


## Example 1: Installing Trinity into a home directory

Load the latest miniconda module if you haven't already and create an environment called "trinityenv":
```
[user.name@ceres ~]$ module load miniconda
[user.name@ceres ~]$ conda create --name trinityenv
```

Note that the  `conda create` command used above without the --prefix option will create the environment in your home directory ($HOME/.conda/envs/).

To activate the environment (and update environment variables such as PATH that are required to use software installed into this environment):
```
[user.name@ceres ~]$ source activate trinityenv
(trinityenv) [user.name@ceres ~]$
```

<div class="usa-alert usa-alert-error" role="alert">
  <div class="usa-alert-body">
    <h3 class="usa-alert-heading">Do not execute <tt>conda init</tt></h3>
    <div class="usa-alert-text">
      In conda &ge; 4.6, if you run <code>conda activate</code>, you will be prompted to run <code>conda init</code> to modify your shell interactive startup script (e.g, ~/.bashrc):
      <pre>
[user.name@ceres ~]$ conda activate

CommandNotFoundError: Your shell has not been properly configured to use 'conda activate'.
To initialize your shell, run

$ conda init &lt;SHELL_NAME&gt;
      </pre>
      This will have the undesirable side effect of modifying your PATH to include that particular version of miniconda every time you log in (even without loading the miniconda environment variable).
      <p />
      If you accidentally run <code>conda init</code>, edit your shell intereractive startup file (<code>$HOME/.bashrc</code> for the bash shell) and remove all lines between
      <br />
      <code>&gt;&gt;&gt; conda initialize &gt;&gt;&gt;</code>
      <br />
      and
      <br />
      <code>&lt;&lt;&lt; conda initialize &lt;&lt;&lt;</code>
      <br /><br />

      <code>conda deactivate</code> may still be used safely.
      <p />
      We will continue to monitor the <a href="https://github.com/conda/conda/issues/7980" target="_blank">GitHub issue</a> that describes the problem and other workarounds.
    </div>
  </div>
</div>

<div class="usa-alert-full-width usa-alert-full-width-info" role="region" aria-labelledby="alert-heading">
  <div class="usa-alert usa-alert-info" aria-live="assertive" role="alert">
    <div class="usa-alert-body">
      <h3 class="usa-alert-heading" id="alert-heading"><code>conda activate</code> after <code>source activate</code></h3>
      <div class="usa-alert-text">
        <p>
          If <code>conda activate</code> is needed for some advanced use cases like <a href="https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#nested-activation" target="_blank">nested ("stacked") environments</a>, it can be used after <code>source activate</code>:
          <pre>
[user.name@ceres ~]$ ml miniconda
[user.name@ceres ~]$ source activate
(base) [user.name@ceres ~]$ conda activate samtools
(samtools) [user.name@ceres ~]$
          </pre>
        </p> 
      </div>
    </div>
  </div>
</div>

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
[user.name@ceres ~]$ source activate /KEEP/my_proj/tensorflow
(/KEEP/my_proj/tensorflow) [user.name@ceres ~]$ conda install tensorflow
... 
```

Note: conda first downloads packages into a package cache directory. By default, the package cache is in your home directory  ($HOME/.conda/pkgs). If installing a large amount of software that may cause home directory quota to be exceeded, you can configure another directory to be the package cache by adding a pkgs_dirs list to the $HOME/.condarc file (YAML); e.g.:

`pkgs_dirs:`
  
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
rm -rf /KEEP/my_proj/tensorflow
```

To remove packages not used by any environment, as well as tarballs downloaded into the conda package cache ($HOME/.conda/pkgs):
```
conda clean --all
```
