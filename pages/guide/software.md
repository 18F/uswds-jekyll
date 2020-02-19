---
title: Software preinstalled on Ceres
description: Software preinstalled on Ceres
permalink: /guide/software
author:
layout: page
# sidenav:  is a side navigation bar is needed it can be specified in the _data/navigation.yml file

# subnav:
#  - text: Section one
#    href: '#section-one'
#  - text: Section two
#    href: '#section-two'
---
# Graphical Software

Software | information
---|---
Galaxy Server | SCINet Runs its own [Galaxy Server](https://galaxy.scinet.science).  Galaxy is an open source, web-based platform for data intensive bioinformatic research.
[CLC Workbench](/guide/clc/) | SCINet has a license key to CLC Workbench
[Geneious](/guide/geneious) |SCINet has a license key to Geneious
[Rstudio](/guide/rstudio) | SCINet runs a R studio Server
Jupyter |  Jupyter notebooks can be run on Ceres


# Command-line software on SCINet clusters

Each SCINet cluster has software preinstalled on it. Some general software is available in the global environment but most specialized scientific software is managed by the Module system. This software can be loaded with a command like `module load bamtools` or a specific version can be selected  `module load bamtools/2.5.1`.  Available modules are listed below.

## The command-line software I need is not on the list!

No problem. you have two options: you can install the software yourself or you can request the software be installed for you.

### Option 1: Install the software yourself

The easiest way to do this is to use a [conda](https://docs.conda.io/en/latest/) environment. often times installing the software you need is as easy as typing `conda create --name my_environment my_program`. Thousands of biological packages and their dependencies can be installed with a single command using the Bioconda repository for the Conda package manager. You can also install a package directly from Github or elsewhere and compile it yourself.

You can also install and or compile software manually in your `$HOME` or `$PROJECT` directories. This is the fastest and easiest way to get your software.

### Option 2: Request a new module be installed

If you need software that you think will be useful to many SCINet users you can
request that the software be installed as a module. Doing this requires an agency-level security review and takes a few weeks. modules can be requested through this [Software request form](https://e.arsnet.usda.gov/sites/OCIO/scinet/Lists/Software%20Approval/Main1.aspx) (eAuthentication required, non-ARS users should contact their sponsor).


## Ceres command-line software managed by the Module system

List updated  October 28, 2019. To generate this list run `module avail`.

{% assign mydata=site.data.applications-parsed %}
<table>
    <caption>Software available through the Module system on Ceres </caption>

    <thead>
    {% for column in mydata[0] %}
        <th>{{ column[0] }}</th>
    {% endfor %}
    </thead>
    <tbody>
    {% for row in mydata %}
        <tr>
        {% for cell in row %}
            <td>{{ cell[1] }}</td>
        {% endfor %}
        </tr>
    {% endfor %}
    </tbody>
</table>
