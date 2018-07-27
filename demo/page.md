---
title: Quick Start Guide
description: This is a documentation page on how to get started with the Chicago Design System.
permalink: /docs/

layout: post
sidenav: pages
subnav:
  - text: How to Use the CDS
    href: '#how-to-start-using-the-chicago-design-system'
  - text: How to Contribute
    href: '#how-to-contribute-to-the-chicago-design-system'
  - text: Github
    href: '#github'
  - text: Fractal
    href: '#fractal'
---

## How to start using the Chicago Design System

Designers: Check out the [Getting Started for Designers](https://designsystem.digital.gov/getting-started/designers/) information.

Developers: Follow the instructions below to get started. For a fuller account of how to use the CDS fork of USWDS, go [here](https://github.com/uswds/uswds).

## How to contribute to the Chicago Design System.

This quick start guide will walk you through cloning the GitHub repository, as well as installing  Jekyll and Fractal so you can start contributing to the Chicago Design System. Once you've made edits to your local forks, you can submit a pull request through git/GitHub, which may be merged with the main project after review.

To use the Design System on your project, you’ll need to reference the CSS (Cascading Style Sheets) and JavaScript files in each HTML page or dynamic templates in your project.

We offer both files, the CSS and the JavaScript, in two versions — a minified version, and an un-minified one. (In the examples above, we are using the minified files.) Use the minified files in a production environment or to reduce the file size of your downloaded assets. And the un-minified files are better if you are in a development environment or would like to debug the CSS or JavaScript assets in the browser.

And that’s it — you should now be able to copy our code samples into your index.html and start using the Design System.

You can get involved by giving us feedback, [writing an issue](https://github.com/Chicago/design-system/issues/new), or [finding other ways to contribute](https://opensource.guide/how-to-contribute/).

We communicate about this project in our [CDS Slack workspace](https://chicagodesignsystem.slack.com/messages). Request an invitation by emailing us at [Chicago Design System](mailto:design.system@cityofchicago.org) or using our [shared invite link](https://join.slack.com/t/chicagodesignsystem/shared_invite/enQtMzM2OTA4MTQyNzIzLWVlOWFkOWQ4YWE0NWQ2YTAzOTFmYWFlMGVjNTEwZjA5ZWNmYjFkZTNhNDNhMmM1MTJiYmQ3MDk2NWZkNzg2Mjg).


## GitHub

GitHub is used for version control of the Chicago Design System. To contribute to the project, you will fork a version of the pattern library to edit.

1. Navigate to the Chicago Design System Design Library repository [link](https://github.com/Chicago/design-library).
2. In the top-right corner of the page, click **Fork**.
3. You now have a forked copy of the original /Chicago/design-library repository. The next step is to make a local copy to edit.
4. Go to the **code** section of your fork.
5. Clock **Clone or download**
6. Copy the URL provided.
7. Open your command line or Terminal application and enter the directory where you would like to copy the repository.
8. Clone the repository with the command below by replacing `<URL>` with the fork URL you copied in the previous step. The repository will be cloned into a new directory in this location.
```
git clone <URL>
```
9. Navigate into the directory of the repository you just created with the command below.
```
cd design-library
```

## Fractal

Fractal is used to publish the atomic design elements of the Chiago Design System. You will need to install the CDS Fractal fork in order to edit and preview your changes to the CDS pattern library. [Go here](https://fractal.build/guide) for more information on Fractal and [here](http://bradfrost.com/blog/post/atomic-web-design/) for more information on atomic design.

1. If you haven't already, install npm. npm is a package manager for Node based projects. Below is a link to find the install method that coincides with your operating system:
    * Node v4.2.3+, [Installation guides](https://nodejs.org/en/download/)
1. Navigate to the design-library directory
2. Run
```
npm install
```
3.  Run npm start to make sure it's up and running
```
npm start
```
4. Make changes to the components in the 'src' folder
5. Run 
```
npm install
```
6. Install [fractal](https://fractal.build/guide/cli)
```
npm i -g @frctl/fractal
``` 
7. Run fractal build to generate the static site
```
fractal build
``` 
8. Open the docs folder static site to make sure it generated correctly
9. Sync with the repo
10. Make a pull request
