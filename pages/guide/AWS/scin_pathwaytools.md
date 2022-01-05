---
title: Pathway Tools
description: AWS
permalink: /guide/AWS/pathwaytools
author: Jordan Hoosman
layout: page
---

<style>
.code {
    display: table;
    border: 1px solid lightgrey;
    padding: 3px;
    margin-bottom: 3px;
}
</style>

The product follows the same general process as the <a href="https://confluence.scinet.science/display/SCIN/EC2+Instance">EC2 Instance</a>. For full documentation on using Pathway Tools see the <a href="http://bioinformatics.ai.sri.com/ptools/">Pathway Tools</a> <a href="http://bioinformatics.ai.sri.com/ptools/">Software documentation</a>

# Connecting to Pathway Tools
When the EC2 Instance product is "Available". Click on the WebsiteURL in the Outputs table. This is the address you will use to connect to your instance. 

# Starting Pathway Tools
To start or restart the pathways tools service use systemd commands.

<div class="code">sudo systemctl start pathway-tools.service</div>
<div class="code">sudo systemctl status pathway-tools.service</div>

