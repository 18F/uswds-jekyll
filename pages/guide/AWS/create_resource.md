---
title: How To - Create an AWS Resource via the Service Catalog
description: AWS
permalink: /guide/AWS/createresource
author: Jordan Hoosman
layout: page
---

<style>
.greenbox {
    background-color: rgba(0, 255, 0, .1);
    border: 1px solid green;
    padding-left: 15px;
}
.redbox {
    display: inline-block;
    background-color: rgba(255, 0, 0, .1);
    border: 1px solid red;
    padding-left: 15px;
    width: 50%;
}
.yellowbox {
    background-color: rgba(255, 255, 0, .1);
    border: 1px solid yellow;
    padding-left: 15px;
}
</style>

* [Log In](#log-in)
* [AWS Service Catalog Console](#aws-service-catalog-console)
    * [Step 1: Name and Version](#step-1-name-and-version)
    * [Step 2: Product Parameters](#step-2-product-parameters)
    * [Step 3: TagOptions](#step-3-tagoptions)
    * [Steps 4-5: Notifications and Review](#steps-4-5-notifications-and-review)
* [Provisioned Product Details](#provisioned-product-details)
* [Delete a Resource - Terminate a Product](#delete-a-resource---terminate-a-product)

# Log in
In your web browser, visit <a href="https://shibboleth.scinet.science/">https://shibboleth.scinet.science/</a> and click the "Amazon Web Services" link. Log in with your SCInet username and password.

<img src="/assets/img/createresource1.png">
<img src="/assets/img/createresource2.png">

If you are presented with a role selection screen, choose your desired project to proceed to the console.

# AWS Service Catalog Console

<div>
    <div class="redbox">
        <p>You must be using the <b>US East (N. Virginia)</b> region for all AWS activities. <b>Please check beforeyour currently selected region</b> following this document's instructions. </p>
        <p>To check and update your region, click on the dropdown in the upper right of the console window, just next to "Support". Select <b>US East.(N. Virginia)</b></p>
    </div>
    <img src="/assets/img/createresource3.png">
</div>

In the main Console page, click on "Service Catalog" within the Management Tools section, or type "ServiceCatalog" into the search bar.

<div class="greenbox"><p>You will see all of AWS's service offerings listed on the main page, even though your project role likely restricts your access. Don't getoverwhelmed! If you get lost, click the AWS logo in the upper left to get back to the main console.</p></div>

<img src="/assets/img/createresource4.png">
<img src="/assets/img/createresource5.png">

The Service Catalog lists the <b>products</b> that have been assigned to your project, as well as the products that have been <b>provisioned</b> (launched) provisioned by you or on your behalf.

<div class="yellowbox">
    <p>If your Service Catalog console looks different than the one in thescreenshot, you are using the "old look". You can switch to the "newlook" by clicking on the dropdown in the upper left of <b>Service Catalog</b> the console and choosing. <b>Try the new look.</b> The products assigned to your project may differ from those shown in the screenshot.</p>
</div>

# Create a resource - Launch a Product

Click the three-dots button on the desired product card and choose Launch Product, or click on the product name and click Launch Product on thefollowing screen.

<img src="/assets/img/createresource6.png">
<img src="/assets/img/createresource7.png">

### Step 1: Name and Version

Provide a name for the product to be launched. This name will be shown in the list of provisioned products, and must contain only letters, numbers, dashes, underscores and periods. Also. select the desired version out of the available versions.

<img src="/assets/img/createresource8.png">

### Step 2: Product Parameters

Fill in the parameters as made available by the product template definition.

<div class="greenbox">
    <p>Some parameters may have limits or requirements. If you receive a warning message saying 'abcde must equal the value of "Parameter"', copy and paste the value on the left-hand side into the parameter field to proceed through the warning.</p>
</div>

<img src="/assets/img/createresource9.png">
<img src="/assets/img/createresource10.png">

### Step 3: TagOptions

You may provide optional tags to help you locate and track your resources. For most users, the default tags are sufficient.

<img src="/assets/img/createresource11.png">

### Steps 4-5: Notifications and Review

Continue through the Notifications screen by clicking Next. Finally, click Launch on the last page to launch the product

<img src="/assets/img/createresource12.png">
<img src="/assets/img/createresource13.png">

### Provisioned Product Details

After initially launch, the product details page will show the product as "Under change" with status "In progress". The page will automaticallyupdate (or you can refresh the page if desired). When complete, the product will change to "Available" with status "Succeeded"

<img src="/assets/img/createresource14.png">
<img src="/assets/img/createresource15.png">

Follow the instructions in the <a href="https://confluence.scinet.science/display/SCIN/AWS+Product+Documentation">AWS Product Documentation</a> for more details on how to use the product you just launched.

### Delete a Resource - Terminate a Product

View the list of provisioned products (resources previously launched) by clicking "Provisioned products list" in the Service Catalog console menu(the three bars icon in the upper-left).

<img src="/assets/img/createresource16.png">
<img src="/assets/img/createresource17.png">

From the three-dots menu, select "Terminate provisioned product", or choose Terminate from the Actions menu within the Provisioned product details screen.

<img src="/assets/img/createresource18.png">
<img src="/assets/img/createresource19.png">

Click "Terminate" to confirm termination of the product. The screen will show "Under change" to show that the product is in process of termination.

<img src="/assets/img/createresource20.png">
<img src="/assets/img/createresource21.png">


