---
title: AWS FAQs
description: AWS FAQ
permalink: /guide/AWS/faq
author: Jordan Hoosman
layout: page
---

* [How do I get started?](#how-do-i-get-started)
* [How do I log in?](#how-do-i-log-in)
* [I'm logged in fine, but I don't see the Service Catalog that I expect. Where did it go?](#im-logged-in-fine-but-i-dont-see-the-service-catalog-that-i-expect-where-did-it-go)
* [I'm trying to do something in the AWS Console, but I'm getting an error message saying I don't have enough permissions. What should I do?](#im-trying-to-do-something-in-the-aws-console-but-im-getting-an-error-message-saying-i-dont-have-enough-permissions-what-should-i-do)
* [I'd like to use a service that isn't covered in the Service Catalog. Can I have it added?](#id-like-to-use-a-service-that-isnt-covered-in-the-service-catalog-can-i-have-it-added)


### How do I get started?

First, if you've never used AWS before or you're unfamiliar with its current capabilities for SCInet, talk to someone at the VRSC (you can email scinet_vrsc@usda.gov) to discuss how it may apply to your problem. Before you start, you should have a reasonable idea of what you'd like to spin up and about how much it may cost.

Once you're ready to begin the process, please use the stand ARS project request form to request an AWS project.If your group already has an existing AWS project you can just request to be added to it.  The AWS project request form is here:
<a href="https://e.arsnet.usda.gov/sites/OCIO/scinet/accounts/SitePages/SCINet-AWS-Project-Request.aspx">https://e.arsnet.usda.gov/sites/OCIO/scinet/accounts/SitePages/SCINet-AWS-Project-Request.aspx</a>
This will be a space with a managed budget and controlled set of resources that you can launch, and where you can log in using your SCInet credentials.

### How do I log in?

Visit <a href="https://shibboleth.scinet.science/">https://shibboleth.scinet.science/</a> and click on the Amazon Web Services link.

### I'm logged in fine, but I don't see the Service Catalog that I expect. Where did it go?

Make sure that you have the right region selected! Your region is shown in a dropdown menu in the upper right of the screen. It should say "N. Virginia" -if it says something like "Ohio", click the menu and select "US East (N. Virginia)".

### I'm trying to do something in the AWS Console, but I'm getting an error message saying I don't have enough permissions. What should I do?

If you're ***not in the Service Catalog***, then you probably aren't allowed to take that action directly. Most creation and deletion operations ***must*** be done through the Service Catalog. If you're trying to do something that isn't already in the Service Catalog, contact the VRSC for assistance. 
If you ***are in the Service Catalog***, you may see occasional harmless notices of a permission problem, which I believe is due to a bug. If you see errors that are preventing you from performing a task, contact the VRSC for troubleshooting

### I'd like to use a service that isn't covered in the Service Catalog. Can I have it added?

The VRSC will need to evaluate whether your desired service is appropriate for being included in the Service Catalog. Some services currently aren't suitable for various reasons; unfortunately, if this is thecase, it's likely because we couldn't control costs or permissions for that service sufficiently to prevent other users from interfering with you. If it is possible, make the request and be patient -it can take some time to write the proper template in asecure and reliable manner.
