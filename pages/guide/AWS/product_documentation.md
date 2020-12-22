---
title: AWS Product Documentation
description: AWS Product Documentation
permalink: /guide/AWS/documentation
author: Jordan Hoosman
layout: page
---

<style>
.yellowbox {
    background-color: rgba(255, 255, 0, .1);
    border: 1px solid yellow;
    padding-left: 15px;
}
.greybox {
    background-color: rgba(230, 230, 230, .1);
    border: 1px solid grey;
    padding-left: 15px;
}
</style>

### AWS Product Documentation
* [Product Documentation Links](#product-documentation-links)
* [How To Project Monthly Costs For AWS Products](#how-to-project-monthly-costs-for-aws-products)
* [Example EC2 Projected Costs](#example-ec2-projected-costs)

### Product Documentation Links
* [EC2 Instance](/guide/AWS/ec2instance)
* [Pathway Tools](/guide/AWS/pathwayitools)
* [FAQ](/guide/AWS/faq)

### How To Project Monthly Costs For AWS Products

The following instructions will demonstrate how to calculate the projected monthly cost of an AWS project. In this example, the cost of an EC2 Instance is calculated.

##### Utilized Resources:
* [AWS Console via Oauth Authentication](https://auth.scinet.usda.gov)
* [AWS Simple Monthly Calculator](https://calculator.s3.amazonaws.com/index.html)

<div style="margin-left: 30px">
    <p>1. Navigate to <a href="https://auth.scinet.usda.gov/">https://auth.scinet.usda.gov</a> and click the link for "AWS Login"</p>
    <img src="/assets/img/productdocumentation1.png">
    <p>2. Authenticate using your SciNet credentials</p> 
    <img src="/assets/img/productdocumentation2.png">
    <p>3. Ensure you have the correct region selected "US East (N. Virginia)" in the top right dropdown menu of the AWS console:</p>
    <img src="/assets/img/productdocumentation3.png">
    <p>4. Navigate to the "Services" menu, and select "Managment Tools" > "Service Catalog"</p>
    <img src="/assets/img/productdocumentation4.png">
    <p>5. From the Service Catelog menu select "Products list"</p>
    <img src="/assets/img/productdocumentation5.png">
    <p>6. From here you can selelect the product you wish to calculate the monthly cost for, in this case we'll choose "EC2 Instance"</p>
    <img src="/assets/img/productdocumentation6.png">
    <p>7. Select the latest product version, in this case "0.2.0". You will then see the Service Catalog template in YAML format. This template contains the product configuration options you'll plug into the AWS Simple Monthly Calculator.</p>
    <img src="/assets/img/productdocumentation7.png">
    <p>8. Open a new browser tab to the [AWS Simple Monthly Calculator](https://calculator.s3.amazonaws.com/index.html)</p>
    <p>9. Navigate to the applicable product tab in the left hand sidebar the the AWS Simple Monthly calculator</p>
    <div class="yellowbox">
        <p>Uncheck the "FREE USAGE TIER: New Customers get free usage tier for first 12 months" checkbox in the top message banner</p>
    </div>
    <img src="/assets/img/productdocumentation8.png">
    <p>10. Click the "Add New Row" icon under the "Compute: Amazon EC2 Instances".</p>
    <div class="greybox">
        <p>Make mental note of the configurable parameters such as "Region", and "Type". For Billing Option you'll always select "On-Demand" and "100" for Usage.</p>
    </div>
    <img src="/assets/img/productdocumentation9.png">
    <p>11. Switch back to the browser tab containing the YAML product template, identify the avaliable options that can be used in the AWS Simple Monthly Calculator. In this case, "InstanceType" and "AWSRegionImageType2AMI" an be used.</p>
    <img src="/assets/img/productdocumentation10.png">
    <p>12. Select the desired Region and Instance Type from the list of allowed options. Let's use t2.large and us-west-1 in this example.</p>
    <p>13. Now switch back to the AWS Simple Monthly Calculator and plug in the values, always selecting the Region first since it will clear the calculator table values.</p>
    <img src="/assets/img/productdocumentation11.png">
    <img src="/assets/img/productdocumentation12.png">
    <p>14. Now enter any additional values or estimations in the form fields below:</p>
    <img src="/assets/img/productdocumentation13.png">
    <p>15. You will now see the projected monthly cost for the applicable product in the "Estimate of your Monthly Bill" tab</p>
    <img src="/assets/img/productdocumentation14.png">
    <h3>Example EC2 Projected Costs</h3>
    <img src="/assets/img/productdocumentation15.png">
</div>
