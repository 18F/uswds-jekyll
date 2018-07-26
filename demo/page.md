---
title: Quick Start Guide
description: This is a documentation page.
permalink: /docs/

layout: post
sidenav: docs
subnav:
  - text: How to Contribute
    href: '#how-to-contribute-to-the-chicago-design-system'
  - text: Github
    href: '#github'
  - text: Jekyll
    href: '#jekyll'
  - text: Fractal
    href: '#fractal'
  - text: Mac Install
    href: '#mac-install'
---

## How To Contribute to the Chicago Design System.

This quick start guide will walk you through cloning the GitHub repository, as well as installing  Jekyll and Fractal so you can start contributing to the Chicago Design System. Once you've made edits to your local forks, you can submit a pull request through git/GitHub, which may be merged with the main project after review.

You can get involved by giving us feedback, [writing an issue](https://github.com/Chicago/design-system/issues/new), or [finding other ways to contribute](https://opensource.guide/how-to-contribute/).

We communicate about this project in our [CDS Slack workspace](https://chicagodesignsystem.slack.com/messages). Request an invitation by emailing us at [Chicago Design System](mailto:design.system@cityofchicago.org) or using our [shared invite link](https://join.slack.com/t/chicagodesignsystem/shared_invite/enQtMzM2OTA4MTQyNzIzLWVlOWFkOWQ4YWE0NWQ2YTAzOTFmYWFlMGVjNTEwZjA5ZWNmYjFkZTNhNDNhMmM1MTJiYmQ3MDk2NWZkNzg2Mjg).


## GitHub

GitHub is used for version control of the Chicago Design System. To contribute to the project, you will fork a version of the main repository to edit.

1. Navigate to the Chicago Design System repository [link](https://github.com/Chicago/design-system).
2. In the top-right corner of the page, click **Fork**.
3. You now have a forked copy of the original /Chicago/design-system repository. The next step is to make a local copy to edit.
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
cd design-system
```

## Jekyll

Jekyll is used to publish the Chicago Design System. You will need to install Jekyll in order to preview your changes to the main CDS repository site.

#### Mac Install

[Go here](https://jekyllrb.com/docs/quickstart/) for instructions on how to install Jekyll.

Once Jekyll is installed, navigate to the docs folder in the design-system respository and run:

```
bundle exec jekyll serve --baseurl ''
```

You can then pull up http://localhost:4000/ in your browser to see the design standards local clone.

## Fractal

Fractal is used to publish the atomic design elements of the Chiago Design System. You will need to install the CDS Fractal fork in order to edit and preview your changes to the CDS pattern library. [Go here](http://github.com/chicago/design-library) for more information on Fractal and atomic design.

<!---
#### Mac Install as submodule

1. Install Node.js via a package manager ([link](https://nodejs.org/en/download/package-manager/#macos))
2. Install the Fractal submodule with the commands 
```
git submodule init
git submodule update
```
-->

#### Mac Install

1. Install Node.js via a package manager ([link](https://nodejs.org/en/download/package-manager/#macos))
2. Navigate to the Chicago Design System Fractal repository [link](https://github.com/Chicago/patternlab).
3. In the top-right corner of the page, click **Fork**.
4. You now have a forked copy of the original /Chicago/patternlab repository.
5. Go to the **code** section of your fork.
6. Clock **Clone or download**
7. Copy the URL provided.
8. Open your command line or Terminal application and enter the directory where you would like to copy the repository.
9. Clone the repository with the command below by replacing `<URL>` with clone URL you copied in the previous step. The repository will be cloned into a new directory in this location.
```
git clone <URL>
```
10. Navigate to the new directory
11. Install dependencies using the command:
```
npm install
```
12. If necessary, install gulp using the command:
```
npm install gulp
```
13. Serve the patternlab site using the command:
```
gulp patternlab:serve
```
14. A browser window will open with the generated static Fractal library.
