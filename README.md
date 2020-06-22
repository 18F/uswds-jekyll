[![scinet.usda.gov Build Status](https://travis-ci.org/USDA-ARS-GBRU/scinet-site.svg?branch=master)](https://travis-ci.org/USDA-ARS-GBRU/scinet-site)

# Info specific to SCINet Website Development

These are the instructions for how to contribute to the [SCINet USDA webpage](https://scinet.usda.gov) if you have been contacted to contribute.

There are two ways to do this.

1. Using Github pull requests (preferred)
2. edit online in github
2. Sent your markdown file to Adam Rivers

## The github command line

1. get a GitHub account if you don't have one
2. clone the repository to your computer: `git clone https://github.com/USDA-ARS-GBRU/scinet-site.git`
3. create a new brach for your work
4. Edit your assigned page, photos go in `/assets/img/` and docs go in the location you were assigned
5. When you are done commit your changes:

  ```
  git add .
  git commit -m "here is a description of what I did what I did"
  git push
  ```

6. Then go the main scinet repository and create a pull request

## Edit online in Github
1. get a GitHub account if you don't have one
2. go to the scinet repository: https://github.com/USDA-ARS-GBRU/scinet-site and navigate to your file and click the pencil. this will "fork the archive for you".
3 edit it and say what you did in the comment box and click "propose file change"





# Info on the Jekyll + U.S. Web Design System template

This is a [Jekyll theme](https://jekyllrb.com/docs/themes/) for the
[U.S. Web Design System](https://designsystem.digital.gov).

## Table of contents
1. [Installation](#installation)ßß
    - [Development](#development)
    - [Versioning](#versioning)
1. [Configuration](#configuration)
    - [Site title](#site-title)
    - [Site description](#site-description)
    - [Navigation](#navigation)
    - [Page subnavigation](#page-subnavigation)
    - [Hero](#hero)
    - [Tagline intro](#tagline-intro)
    - [Graphics list](#graphics-list)
    - [Color and font configuration](#color-and-font-configuration)
    - [Search](#search)
    - [Analytics](#analytics)
    - [Last modified date](#last-modified-date)
    - [Anchor JS](#anchor-js)
1. [Assets](#assets)
    - [Stylesheets](#stylesheets)
    - [Scripts](#scripts)
    - [Asset load order](#asset-load-order)
1. [Customization](#customization)
    - [Customizing with Sass](#customizing-with-sass)
    - [Customizing with CSS overrides](#customizing-with-css-overrides)
    - [Overriding includes and layouts](#overriding-includes-and-layouts)
1. [Components](#components)
    - [Header](#header)
    - [Footer](#footer)
1. [Layouts](#layouts)
    - [Default](#layout-default)
    - [Page](#layout-page)
    - [Home](#layout-home)
    - [Post](#layout-post)
    - [Project](#layout-project)
    - [Team member](#layout-team-member)



## Installation

1. Install the theme as a Ruby Gem by adding it to your `Gemfile`
   like so:

    ```ruby
    gem 'uswds-jekyll'
    ```

1. Fetch and update your bundled gems by running:

    ```sh
    bundle
    ```

1. Set the `theme` in your site's Jekyll configuration,
   `_config.yml`:

    ```yml
    theme: uswds-jekyll
    ```

You will need to restart your Jekyll server to see the effects.

### Install as a new Jekyll site

1. Create a new Jekyll site:
    ```
    jekyll new
    ```
1. Replace the default `gem "minima", "~> 2.0"` gem with the `uswds-jekyll` gem in your `Gemfile`:

    ```ruby
    gem 'uswds-jekyll', :git => 'https://github.com/18F/uswds-jekyll.git'
    ```

1. Set the `theme` in your site's Jekyll configuration,
   `_config.yml`:

    ```yml
    theme: uswds-jekyll
    ```
1. Fetch and update your bundled gems by running:

    ```sh
    bundle
    ```
1. Run Jekyll `jekyll serve` to build your site locally at http://localhost:4000/

### Development

To develop this theme and/or test it locally:

1. Clone this repo
1. Run Jekyll (`jekyll serve`) in the local clone of this repo;
   **or**
1. Create a new Jekyll project, follow the
   [installation](#installation) instructions, then change your
   `Gemfile` to point at the local clone of this repo:

    ```ruby
    gem 'uswds-jekyll', :path => '../path/to/uswds-jekyll'
    ```
### Publish to Rubygems
1. Update `spec.version = "NUMBER HERE"` in the uswds-jekyll.gemspec file to the version you want to publish
1. Run `bundle install`
1. Add a PR for the update and get it merged
1. Run `bundle exec rake release`
1. Add a GitHub release to the releases page with the same version number
1. You should see the latest version here https://rubygems.org/gems/uswds-jekyll

### Versioning

To reference a specific version of this plugin:

1. Visit the [releases page](https://github.com/18F/uswds-jekyll/releases) and
   decide which version you want to use.
1. Specify the version in your `Gemfile`.

    ```ruby
    gem 'uswds-jekyll', '1.4.1'
    ```

## Configuration

Configuration of common elements ([header](#header),
[footer](#footer), [navigation](#navigation), etc.) happens in your
project's [data files](https://jekyllrb.com/docs/datafiles/). See
this project's [data directory](_data) for reference configurations
of each component.

The [default layout](#layout-default) also provides a mechanism for
automatically including [stylesheets](#stylesheets) and
[scripts](#scripts) on a site-wide, layout-wide, and per-page
basis. See [asset load order](#asset-load-order) for more
information.


### Site title

You can change your site's title with the `title` field in your
`_config.yml`.  If you want to provide an alternate title for use
_only_ in the site header, you can set the `title` field in
`_data/header.yml`.

### Site description

You can change your site's description with the `description` field in your
`_config.yml`. If you want to override it for a particular page, you can set the `description` field in that page's frontmatter.

### Navigation

This theme's navigation system is powerful and flexible. Named
navigational lists live in your project's `_data/navigation.yml`,
e.g.

By default all links are assumed to be internal to the site. You can add `external: true` to links that are external. You can also add `class: class-name` to add a class to a specific link.

```yml
# _data/navigation.yml
primary:
  - text: Documentation
    href: /docs/
  - text: Support
    href: /help/
  - text: External link
    href: https://18f.gsa.gov
    external: true

  # link objects with a 'links' field will be presented as
  # collapsible link lists. The 'links' field can either be a
  # reference to another link list in this file, or a literal list.
  - text: Section title
    links: <links>
```

This scheme allows you to define navigational elements that can be
shared by different components, such as the [header](#header) and
[footer](#footer). See the documentation for those components for
more info.

### Page title

Set each page's title in its frontmatter:

```md
---
title: About us
---
```

### Page subnavigation

If you're using the [page layout](#layout-page), each page may declare its own
side navigation and subnavigation in its [front matter]:

```md
---
sidenav: documentation
subnav:
  - text: Section one
    href: '#section-one'
  - text: Section two
    href: '#section-two
---
## Section one

## Section two
```

As with the [header](#header) and [footer](#footer), the `sidenav` field may
either reference a common [navigation list](#navigation) from
`_data/navigation.yml` (recommended) or be a literal list of links.

The `subnav` field should be used to link to sections _within_ the current
page, because links to other pages will cause the linking page's side
navigation to collapse when visited.


`sidenav` is a key _into_ `_data/navigation.yml`. See the [navigation](#navigation) docs for more info.

A page's "current" or "active" state in the sidenav is
determined by whether a link's `href` matches `page.url` or
`page.permalink` for each page being rendered.

`subnav` is a list of links to display on this page under its own link in the side navigation.

**Note that subnav link hrefs are not prefixed with
`site.baseurl`** because this breaks hash links prefixed with
`#`.

**Pro tip:** Unless your Jekyll configuration specifies otherwise, the default
Markdown formatter (Kramdown) will automatically generate predictable `id`
attributes for your page headings and convert markdown like this:

```md
## Section one
```

into:

```html
<h2 id="section-one">Section one</h2>
```

If you're using Redcarpet, you will need to configure it to enable
the `with_toc_data` extension in your `_config.yml`, like so:

```yml
markdown: redcarpet
redcarpet:
  extensions:
    - with_toc_data
```

**Pro tip:** If you're like us and prefer your navigation sticky, you can add `sticky_sidenav: true` on [page](#layout-page), [project](#layout-project), and [team member](#layout-team-member) layouts to have the sidenav follow as you scroll.

### Hero

```yml
hero: # optional
  image: /path/to/image.jpg # optional
  callout:
    alt: Callout white text! # optional
    text: The rest of the callout
  button: # optional
    text: The button text
    href: /button-href/
```

### Tagline intro

```yml
# optional, but must be used in conjunction with 'intro', below
tagline: A tagline for your page
# also optional, but must be used with 'tagline', above
intro: |
  Some introductory text content.

  This will be processed as **Markdown**.
```

### Graphics list
```yml
# an optional list of graphics to display before or after the content
graphics:
  - image:
      # note the indentation here: graphics[n].image.src
      src: /path/to/image.ext
      alt: optional alt text
    title: Optional graphic title, rendered as an <h3>
    description: Graphic description text, processed as _Markdown_.

# optional
graphics_position: (before|after)
```

### Color and font configuration

The default colors and fonts can be configured in the `_data/theme.yml` file.


### Search

[Search.gov](https://search.gov/) is used for search and can be configured in `_config.yml`.

Before configuring your search you will need to create a search.gov account and set up your website
with search.gov.

After setting up your site on search.gov you can then add your `search_site_handle` to the `config.yml`.

### Analytics

#### Google Analytics

You can add Google Analytics to your site by uncommenting the `google_analytics_ua` line and replacing `UA-????????-??` with your Google analytics UA code.

```
# Configuration for Google Analytics, add your UA code here:
# google_analytics_ua: UA-????????-??
```

#### Digital Analytics Program (DAP)

You can add DAP to your site by uncommenting the `dap_agency` line and, if need be, replacing `GSA` with the appropriate agency key. For more information visit <https://www.digitalgov.gov/services/dap/>

```
# Configuration for DAP, add your agency ID here:
# dap_agency: GSA
```

### Last modified date

You can show the last date a page was last modified by uncommenting this line from the `footer.yml` data file.
This will add the date right before the footer component and uses the `last-modified.html` include.

```yml
# Used to show the "Last updated" date and time;
# last_updated: true
```

### Anchor JS

You can show an anchor link next to header tags by uncommenting this section from the `_config.yml` data file.
This will add an anchor link after the header tag on the page and post layouts making ech header linkable.
See https://github.com/bryanbraun/anchorjs for more information.

```yml
# anchor_js_targets: [h1, h2, h3, h4, h5, h6]
```

## Assets

The [stylesheet](_includes/styles.html) and [script](_includes/scripts.html)
includes each incorporate the USWDS CSS and JS files if the corresponding
`styles` and `scripts` lists aren't defined in your `_config.yml`. So unless
you add one or both of those manually, your HTML will include the following:

```html
<!-- in the <head> -->
<link rel="stylesheet" href="/assets/uswds/css/uswds.min.css" media="screen">
<!-- before </body> -->
<script src="/assets/uswds/js/uswds.min.js" async>
```

Read more about customizing [stylesheets](#stylesheets) and [scripts](#scripts)
below.


### Stylesheets

As a general rule, all stylesheets are inserted in a layouts'
`<head>`, which qualifies them as "render-blocking". Site
stylesheets can be specified in `_config.yml` or a layout or page's
[front matter] YAML in the following form:

```yml
styles:
  - /path/to/sheet.css
  - href: /path/to/sheet.css
    media: (screen|print|all) # optional
```

Stylesheets specified as objects (in the latter item above) must
have an `href` property. The `media` defaults to `screen`.


### Scripts

As a general rule, all scripts are inserted before a layouts'
`</body>`, which prevents them from blocking the rendering of your
page's content. Scripts can be specified in `_config.yml` or a
layout or page's [front matter] YAML in the following form:

```yml
scripts:
  - /path/to/script.js
  - src: /path/to/script.js
    async: true # optional
```

Scripts specified as objects (in the latter item above) must have a `src`
property. Scripts with `async: true` will get an `async` attribute, which tells
the browser _not_ to let this script's loading block the execution of
subsequent scripts. If the execution order of your scripts is **not**
important, setting `async: true` may provide performance benefits to your
users. (Conversely, if you don't know whether your scripts need to execute in a
particular order, then you should not set `async: true` because it may prevent
your scripts from running propertly.)


### Asset load order

Both [stylesheets](#stylesheets) and [scripts](#scripts) can be configured

1. Assets configured at the `site` level (in your `_config.yml`) will be loaded
   in all pages that use the USWDS [layouts](#layouts).
1. Those configured at the layout level (in that layout's [front
   matter]) will be loaded on all pages that use that layout, after
   site assets.
1. Those configured at the page level (in the page's [front matter])
   will be loaded last.


## Customization

You have two options for customizing the CSS: [Sass](#customizing-with-sass) or
[CSS overrides](#customizing-with-css-overrides). Individual sites can also
[selectively override](#overriding-includes-and-layouts) individual includes
and layouts.


### Customizing with Sass

Create a [Sass][] (or SCSS) entry point that sets variables and then imports
the USWDS source files:

```scss
---
# assets/css/main.scss
---
// set your variables or @import them here.

// at the very least, you should set the USWDS font and image paths
// to the correct paths relative to assets/main.css, like so:
$font-path: '../uswds/fonts';
$image-path: '../uswds/img';

@import 'uswds/all';
```

All of the USWDS [SCSS source files](https://github.com/uswds/uswds/tree/master/src/stylesheets)
are placed in the [_sass/uswds](_sass/uswds) directory and are available as
Sass imports via `@import 'uswds/<path>';`. See the [Jekyll docs][Jekyll Sass]
for more information about its Sass/SCSS support, and configuring its Sass
renderer in your site's config.


### Customizing with CSS overrides

1. Create a new CSS or Sass file that defines your customizations,
   e.g.

    ```scss
    ---
    # assets/uswds-overrides.scss
    ---
    .usa-header {
      // overrides here
    }
    ```

1. Add the new stylesheet's path to your `_config.yml` _after_
   `uswds.min.css`:

    ```yml
    styles:
      - /assets/uswds/css/uswds.min.css
      - /assets/uswds-overrides.css
    ```

### Overriding includes and layouts

Any [include](_includes) or [layout](_layouts) can be overridden by
your site by placing a file with the same name into your site's
`_includes` or `_layouts` directory. For instance:

- To change how [stylesheets](#stylesheets) are loaded or
  referenced, you can create your own `_includes/styles.html`,
  which will subsequently change how stylesheets are loaded in all
  layouts that inherit from the USWDS [default layout](#layout-default).

- You can change how the side navigation is rendered (but not which
  data it receives) in the [page layout](#layout-page) by creating
  your own `_includes/sidenav.html`.

- You can change how and whether the side navigation is displayed
  at all in the [page layout](#layout-page) by overriding
  `_layouts/page.html`.

## Components

For some [USWDS components](https://designsystem.digital.gov/components/),
there are two different files that control how data is passed to
the template:

1. `components/{component}.html` is the low-level template that
   assumes a similarly named global template variable. For
   instance, the header component operates on the `header` template
   variable.
1. `{component}.html` is the "concrete" implementation of the
   component that sets the appropriate global variable then
   includes the low-level template.

This separation allows you to override either of the component
includes in your own Jekyll site without having to re-implement
either the high- or low-level logic. For instance, if you want your
header data to come directly from the Jekyll configuration file
(`_config.yml`) rather than `_data/header.yml`, you can override
`_includes/header.html` to look like this:

```html
{% assign header = site.data.header %}
{% include components/header--basic.html %}
```


### Header

The [header.html include](_includes/header.html) sets the `header`
template variable to `site.data.header`, the value of which is set
in your Jekyll project's `_data/header.yml` file. Then it includes
[components/header.html](_includes/components/header.html) to
render the header's markup.

See this repo's [header.yml](_data/header.yml) for more info.


### Footer

The [footer.html include](_includes/footer.html) sets the `header`
template variable to `site.data.footer`, the value of which is set
in your Jekyll project's `_data/footer.yml` file. Then it includes
[components/footer.html](_includes/components/footer.html) to
render the footer's markup.

See this repo's [footer.yml](_data/footer.yml) for more info.


## Layouts

This theme provides the following layouts, which you can use by
setting the `layout` [front matter] on each page, like so:

```yml
---
layout: name
---
```
Supported (optional) front matter for page layouts.

- [page navigation](#page-subnavigation)
- [hero](#hero)
- [tagline intro](#tagline-intro)
- [graphics list](#graphics-list)

### `layout: default`

This is the bare-bones USWDS layout, which does all of the
basic page scaffolding then drops the page content into the
`<main>` element. All of the other layouts "inherit" this one and
provide other features in the content block.

The default layout provides a layout [front matter] hook to add
attributes to the `<main>` element. You can see how this works in
the [page layout](_layouts/page.html#L3-L4).

### `layout: home`

This layout implements the [home page
template](https://designsystem.digital.gov/page-templates/landing/), which
accommodates the following [front matter]:


Check out the YAML front matter in the [home demo
page](demo/home.html) for an example of how to structure it.

### `layout: page`

This layout implements the [document page
template](https://designsystem.digital.gov/page-templates/docs/).

See the [page demo page](demo/page.md) for an example of how this
works, and see [_data/navigation.yml](_data/navigation.yml) for how
to structure named navigation data for your site.

### `layout: post`

This layout is identical to the layout `page` and is included to allow for easier site creation using  `Jekyll new`.

### `layout: project`

This layout is used to show details for an individual project and uses the following front matter.

```yml
layout: project
title: Title of project
permalink: /projects/link-to-project/
description: Project description.
large_image: /path/to/image.ext
small_image: /path/to/image.ext
image_alt: The image alt text
```

To show a listing of projects on a page add `{% include project-list.html %} to the page`

### `layout: team-member`

This layout is used to show details for an individual team member and uses the following front matter.

```yml
layout: team-member
permalink: /team/link-to-team-member/
name: Team member name
image: /path/to/image.ext
job_title: Team member job title
phone: 123-456-7890
email: email@address.gov
```

To show a listing of team members on a page add `{% include team-list.html %} to the page`

[Sass]: http://sass-lang.com/guide
[Jekyll Sass]: https://jekyllrb.com/docs/assets/#sassscss
[front matter]: https://jekyllrb.com/docs/frontmatter/
