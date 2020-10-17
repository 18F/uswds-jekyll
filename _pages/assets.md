---
title: Assets
layout: page
---

The [stylesheet](https://github.com/18F/uswds-jekyll/blob/master/_includes/styles.html) and [script](https://github.com/18F/uswds-jekyll/blob/master/_includes/scripts.html) includes each incorporate the USWDS CSS and JS files if the corresponding `styles` and `scripts` lists aren't defined in your `_config.yml`. So unless you add one or both of those manually, your HTML will include the following:

```html
<!-- in the <head> -->
<link rel="stylesheet" href="/assets/uswds/css/uswds.min.css" media="screen">
<!-- before </body> -->
<script src="/assets/uswds/js/uswds.min.js" async>
```

Read more about customizing [stylesheets](#stylesheets) and [scripts](#scripts) below.

## Stylesheets

As a general rule, all stylesheets are inserted in a layouts' `<head>`, which qualifies them as "render-blocking". Site stylesheets can be specified in `_config.yml` or a layout or page's [front matter] YAML in the following form:

```yml
styles:
  - /path/to/sheet.css
  - href: /path/to/sheet.css
    media: (screen|print|all) # optional
```

Stylesheets specified as objects (in the latter item above) must have an `href` property. The `media` defaults to `screen`.

## Scripts

As a general rule, all scripts are inserted before a layouts' `</body>`, which prevents them from blocking the rendering of your page's content. Scripts can be specified in `_config.yml` or a layout or page's [front matter] YAML in the following form:

```yml
scripts:
  - /path/to/script.js
  - src: /path/to/script.js
    async: true # optional
```

Scripts specified as objects (in the latter item above) must have a `src` property. Scripts with `async: true` will get an `async` attribute, which tells the browser _not_ to let this script's loading block the execution of subsequent scripts. If the execution order of your scripts is **not** important, setting `async: true` may provide performance benefits to your users. (Conversely, if you don't know whether your scripts need to execute in a particular order, then you should not set `async: true` because it may prevent your scripts from running propertly.)

## Asset load order

Both [stylesheets](#stylesheets) and [scripts](#scripts) can be configured

1. Assets configured at the `site` level (in your `_config.yml`) will be loaded
   in all pages that use the USWDS [layouts]({% link _pages/layouts.md %}).
1. Those configured at the layout level (in that layout's [front
   matter]) will be loaded on all pages that use that layout, after
   site assets.
1. Those configured at the page level (in the page's [front matter])
   will be loaded last.
