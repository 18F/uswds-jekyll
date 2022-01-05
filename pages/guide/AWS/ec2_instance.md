---
title: EC2 Instance
description: Ec2 Instance
permalink: /guide/AWS/ec2instance
author: Jordan Hoosman
layout: page
---

<style>
.greybox {
    background-color: rgba(230, 230, 230, .1);
    border: 1px solid grey;
    padding: 10px 3px;
    text-align: center;
}
.greenbox {
    background-color: rgba(0, 255, 0, .1);
    border: 1px solid green;
    padding: 10px 3px;
}
.redbox {
    display: inline-block;
    background-color: rgba(255, 0, 0, .1);
    border: 1px solid red;
    width: 50%;
}
.yellowbox {
    background-color: rgba(255, 255, 0, .1);
    border: 1px solid yellow;
    text-align: center;
}
.dbluebox {
    background-color: rgba(0, 0, 255, .1);
    border: 1px dotted blue;
    padding-left: 10px;
}
</style>

* [AWS Console](#aws-console)
    * [Step 1: Create Key Pair](#step-1-create-key-pair)
    * [Step 2: Launch the EC2 Instance](#step-2-launch-the-ec2-instance-product)
    * [Step 3: Product parameters](#step-3-product-parameters)
    * [Step 4: TagOptions](#step-4-tagoptions)
    * [Steps 5-6: Notifications and Review](#steps-5-6-notifications-and-review)
* [Provisioned Product Details](#provisioned-product-details)
* [Connectng to an Instance](#connecting-to-an-instance)
* [Terminate an Instance](#terminate-an-instance)

<div class="greybox">
    <p>If you're not already familiar with the Service Catalog and logging in to the AWS Console, read the <a href="https://confluence.scinet.science/display/SCIN/How+To+-+Create+an+AWS+Resource+via+the+Service+Catalog">How To - Create an AWS Resource via the Service Catalog</a> documentation</p>
</div>

### AWS Console

<div>
    <div class="redbox">
    <p>You must be using the<b> US East (N. Virginia)</b> region for all AWS activities. <b>Please check your currently selected region</b> before following this document's instructions.</p>
    <p>To check and update your region, click on the dropdown in the upper right of the console window, just next to "Support". Select <b>US East.(N. Virginia)</b></p>
    </div>
    <img src="/assets/img/ec2instance1.png">
</div>

In the main Console page, click on "Services" in the top menu then "EC2" within the Compute section, or type "EC2" into the search bar.

<img src="/assets/img/ec2instance2.png">
<img src="/assets/img/ec2instance3.png">

### Step 1: Create Key Pair

Click on the "Key Pairs" link in the left menu or under Resources. Then click the <b>Create Key Pair</b> button.

<img src="/assets/img/ec2instance4.png">
<img src="/assets/img/ec2instance5.png">

Click the <b>Create</b> button. Your browser will download the private key contents.

<div class="yellowbox">
    <p>Save your private key somewhere for future use. This key will enable you to log in to your EC2 instance. You only need to create a KeyPair once for multiple EC2 Instances.</p>
</div>

### Step 2: Launch the EC2 Instance product

Use the top menu to navigate to Services > <b>Service Catalog</b>. Click the three-dots button on the "EC2 Instance" product card and choose <b>Launch Product</b>, or click on the product name and click <b>Launch Product</b> on the following screen. Enter a name for the product and select a version from the list of versions.

<img src="/assets/img/ec2instance6.png">
<img src="/assets/img/ec2instance7.png">

### Step 3: Product parameters

Fill in the parameters as made available by the product template definition. Click <b>next</b>.

<div class="yellowbox">
    <p>Some parameters may have limits or requirements. If you receive a warning message saying 'abcde must equal the value of "Parameter"', copy and paste the value on the left-hand side into the parameter field to proceed through the warning</p>
</div>

<img src="/assets/img/ec2instance8.png">

### Step 4: TagOptions

You may provide optional tags to help you locate and track your resources. For most users, the default tags are sufficient. Click <b>Next</b>.

<img src="/assets/img/ec2instance9.png">

### Steps 5-6: Notifications and Review

Continue through the Notifications screen by clicking Next. Finally, click <b>Launch</b> on the last page to launch the product.

<img src="/assets/img/ec2instance10.png">
<img src="/assets/img/ec2instance11.png">

### Provisioned Product Details

After initially launch, the product details page will show the product as "Under change" with status "In progress". The page will automaticallyupdate (or you can refresh the page if desired). When complete, the product will change to "Available" with status "Succeeded"

<img src="/assets/img/ec2instance12.png">

### Connecting to an Instance

When the EC2 Instance product is "Available". Copy the PublicDNS from the Outputs table. This is the hostname you will use to connect to yourinstance. You must provide the private key that you downloaded from EC2 in Step 1. The log in username is <i>ec2-user</i>.

<div class="dbluebox">
    <p>ssh -i /path/to/keypair.pem ec2-user@&lt;PublicDNS&gt;</p>
</div>

<div class="yellowbox">
If you are using PuTTY on Windows, the private key (.pem) will have to be <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html">converted using PuTTYgen</a>.
</div>

<img src="/assets/img/ec2instance13.png">

### Terminate an Instance

View the list of provisioned products (resources previously launched) by clicking "Provisioned products list" in the Service Catalog console menu(the three bars icon in the upper-left). Click "Terminate" to confirm termination of the product.

<img src="/assets/img/ec2instance14.png">

