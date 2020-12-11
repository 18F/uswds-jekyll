---
title: aws-saml - Retrieve API keys for command-line and scriptusage
description: aws-saml
permalink: /guide/AWS/saml
author: Jordan Hoosman
layout: page
---

<style>
.dotbox {
    border: 1px dotted blue;
    padding-left: 15px;
}
</style>

* [Introduction](#introduction)
* [Installation](#installation)
* [Usage](#usage)
    * [Full usage documentation](#full-usage-documentation)

# Introduction

The aws-saml tool can be used in conjunction with the Shibboleth SAML identity provider to retrieve time-limited API keys suitable for commandline use. It interactively prompts you for your password, and if you have multiple roles available, you are prompted if not otherwise specified on thecommand line. The resulting credentials are normally stored in your standard AWS credential file, but a command line flag can be provided tohave the credentials output to standard output in Bash format for scripting. These credentials normally expire after one hour; by providing therefresh flag to the tool, it will fork into the background and keep the credentials refreshed as long as your login cookie remains valid.

# Installation

The tool is currently stored at <a href="https://stash.scinet.science/projects/UAAI/repos/aws-saml-cli/browse">https://stash.scinet.science/projects/UAAI/repos/aws-saml-cli/browse</a>. From here, the code can be cloned to your local machine, and installed with the command 

<div class="dotbox">
    <p>$ pip install .</p>
</div>

from the directory containing <i>setup.py</i>

# Usage

Once installed, basic usage is simple.

<div class="dotbox">
    <p>$ aws-saml -u your.username</p>
</div>

On first usage, you will be prompted for an IDP Entry URL. For SCInet's Shibboleth server, this is: 
<a href="https://shibboleth.scinet.science/idp/profile/SAML2/Unsolicited/SSO?providerId=urn:amazon:webservices">https://shibboleth.scinet.science/idp/profile/SAML2/Unsolicited/SSO?providerId=urn:amazon:webservices</a>
When prompted for your password, enter your SCInet password. 
If prompted for a role, enter the number corresponding to the role you'd like to use for this session.

<div class="dotbox">
    <p>Please choose the role you would like to assume:</p>
    <p>[ 0 ]:  arn:aws:iam::123456789012:role/SAML-proj-beta_testers</p>
    <p>[ 1 ]:  arn:aws:iam::123456789012:role/SAML-admin</p>
    <p>Selection: 1</p>
</div>

# Full usage documentation

<div class="dotbox">
<pre>
usage: aws-saml [-h] [--username USERNAME] [--prompt-role] [--role ROLE]
                        [--credentials FILE] [--profile PROFILE] [--verbose]
                        [--stdout] [--refresh] [--no-ssl-verify]

Retrieve AWS credentials via SAML.optional arguments:
    -h, --help            show this help message and exit  
    --username USERNAME, -u USERNAME
                            Login username  
    --prompt-role, -R     Prompt for role selection  
    --role ROLE, -r ROLE  Desired role name  
    --credentials FILE, -c FILE
                            Destination file for AWS credentials  
    --profile PROFILE, -p PROFILE
                            AWS credential file profile  
    --verbose, -v  
    --stdout, -s          
                            Print credentials in bash format to standard output  
    --refresh             Fork into the background, keeping token fresh  
    --no-ssl-verify       Disable SSL certificate verification for IDP
(allows self-signed certificates - INSECURE)
</pre>
</div>