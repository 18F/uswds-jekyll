---
title: Guide to Installing R, Python, and Perl Packages
description: Installing R, Python, and Perl packages
permalink: /guide/packageinstall/
author: VRSC
layout: page
# sidenav:  is a side navigation bar is needed it can be specified in the _data/navigation.yml file
---

#### Table of Contents
* [Installing R packages](#installing-r-packages)
* [Python](#python)
* [Perl](#perl)

The Ceres login node provides access to a wide variety of scientific software tools which users can access and use via the module system (see [Ceres User Manual](/guide/ceres/) for more information). These software tools were compiled and optimized for use on Ceres by members of the Virtual Research Support Core (VRSC) team. Most users will find the software tools they need for their research among the provided packages and thus will not need to compile their own software packages.

The popular R, Perl and Python languages have many packages/modules available. Some of the packages are installed on Ceres and are available with the r/perl/python_2/python_3 modules. To see the list of installed packages, visit the [Software Overview](/guide/software) page or use  `module help <module_name>`  command. If users need packages that are not available, they can either request VRSC to add packages, or they can download and install packages in their home/project directories. We recommend installing packages in the project directories since collaborators on the same project most probably would need same packages. In addition, home quotas are much lower than quotas for project directories.

The following instructions are for a few commonly used software packages to help users install these packages without admin intervention.

# Installing R Packages

Users can install R packages using the  `install.packages()`  command.

The default location is the user's home directory. User can specify other directories to which they have access privileges, such as project directory. Installing R packages in a project directory is recommended as users working on the same project have access to the same environment.

To install packages in a project directory, go to the project directory:
```
cd <path/to/the/project/directory>
```
and create a ".Renviron" file containing the following line:

`R_LIBS_USER=<path/to/the/project/directory>/R_packages/%v`

Then when R is started from the directory `<path/to/the/project/directory>`, the R packages for the given version of R will be saved in the above location.

Load an environment module for the desired version of R and start R:
```
$ module load r/4.0.3
$ R
R version 4.0.3 (2020-10-10) -- "Bunny-Wunnies Freak Out"
```

To install A3 package issue the  `install.packages()`  command and answer "y" to both questions:
```
> install.packages("A3",repos="http://cran.r-project.org")
Warning in install.packages("A3") :
'lib = "/lustre/project/software/7/apps/r/4.0.3/lib64/R/library"' is not writable
Would you like to use a personal library instead? (yes/No/cancel) yes
Would you like to create a personal library
<path/to/the/project/directory>/R_packages/4.0
to install packages into? (yes/No/cancel) yes
```

To see the library paths, issue  `.libPaths()`  command from within R:
```
> .libPaths();
[1] "<path/to/the/project/directory>/R_packages/4.0"
[2] "/lustre/project/software/7/apps/r/4.0.3/lib64/R/library"
```

# Python

Users can install python packages(via pip) to their home directory. This creates a "site-packages" directory within the user's home directory.
```
$ module load python_3
$ pip3 install --user <package.name>
```

By default the packages for python 3.5 are stored in ~/.local/lib/python3.5/site-packages

If users intend to share the python environment with users working on the same project (or to install packages in a non-standard location), using **virtualenv** is a much better way to deal with managing python packages.

After loading the python module, create a virtual environment by:
```
$ virtualenv <path/to/the/project/directory/name.of.the.project>
```

This creates a directory in your current project directory. This example below shows a virtualenv "virt_test" being created and activated.
```
$ virtualenv virt_test
Using base prefix '/software/apps/python_3/gcc/64/3.5.0'
New python executable in /root/virt_test/bin/python3.5
Also creating executable in /root/virt_test/bin/python
Installing setuptools, pip, wheel...done.
$ source virt_test/bin/activate
$ source virt_test/bin/activate
(virt_test) $ pip3 list
pip (9.0.1)
setuptools (36.0.1)
wheel (0.29.0)
```

Note that this virtual environment starts clean without using any global python site-packages that are already installed. Use  **`--system-site-packages`**  if you want to use global site-packages.

To exit this environment, run deactivate:
```
(virt_test) $ deactivate
```

This virtual environment can be activated again anytime.

For instructions on how to manage Python packages using Conda, see [User-installed Software on Ceres with Conda](/guide/conda).

# Perl

There are multiple ways to install modules in Perl and depending on the use case, one may be preferable over the others.

**cpanm** is a convenient tool to install modules in the home directory.
```
$ module load perl
$ cpanm Test::More
```

Running the above command creates a "perl5" directory within the users' home directory and contains all the required binaries and libraries associated with the "Test::More" module. Add **PERL5LIB** to the environment
```
$ export PERL5LIB=$HOME/perl5/lib/perl5:$PERL5LIB
```

Perl modules can also be installed in other directories. For example, the user can have the modules available to the rest of the project members so that everyone involved works in the same environment.

**local::lib** provides the flexibility for users to install modules in any custom location (as long as they have write permissions).
```
$ eval "$(perl -I/path/to/the/project/dir/perl5/lib/perl5 -
Mlocal::lib=/path/to/the/project/dir/perl5)"
```

In addition to creating "perl5" directory within the specified project directory, the above
command adds perl local::lib environment variables.

Then use cpanm to install the required modules.
```
$ cpanm Test::More
```

Note: The package source files will still be downloaded to your home directory (~/.cpanm/sources)

Note: All users working on the project can access modules that were installed using local:lib and perlbrew, but only the original user can perform perl module installs.

**perlbrew** is another tool that can create perl environments. perlbrew offers a lot of flexibility to users as they can install different versions of perl based on the requirements of the project.
```
$ module load perl
$ perlbrew availableperl-5.27.1
perl-5.26.0
perl-5.24.1
......
```

Set the **PERLBREW_ROOT** variable to a preferred location.
```
$ export PERLBREW_ROOT=/path/to/project/dir/perlbrew
$ perlbew init
```

To install the latest stable release
```
$ perlbrew --notest install stable
```

To install a specific version of perl
```
$ perlbrew --notest install perl-5.24.0
$ perlbrew list
perl-5.26.0
perl-5.24.0
```

To use the latest perl,
```
$ perlbrew use 5.26.0
```

Users can then use cpanm to install modules based on their requirements.

It is also possible to switch between different perl installs(if you have them installed)
```
$ perlbrew switch 5.24.0
```

This switches from 5.26.0 to 5.24.0

Note: All users working on the project can access modules that were installed using local:lib and perlbrew, but only the original user can perform perl module installs.
