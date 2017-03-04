# jekyll-uswds

This is a [Jekyll theme](https://jekyllrb.com/docs/themes/) for the
[U.S. Web Design Standards](https://standards.usa.gov).

## Table of contents
1. [Installation](#installation)
1. [Configuration](#configuration)
  1. [Stylesheets](#stylesheets)
  1. [Scripts](#scripts)
  1. [Asset load order](#asset-load-order)
1. [Customization](#customization)
  1. [Customizing with Sass](#customizing-with-sass)
  1. [Customizing with CSS overrides](#customizing-with-css-overrides)
  1. [Overriding includes and layouts](#overriding-includes-and-layouts)
1. [Components](#components)
  1. [Header](#header)
1. [Layouts](#layouts)
  1. [Base](#layout-base)
  1. [Docs](#layout-docs)
  1. [Landing](#layout-landing)


## Installation

You can install the theme as a Ruby Gem by adding it to your `Gemfile` like so:

```ruby
gem 'jekyll-uswds', :git => 'git://github.com/18F/jekyll-uswds.git'
```

Then fetch and update your bundled gems with:

```sh
bundle
```

and restart your Jekyll server to see the effects:

```sh
bundle exec jekyll serve
```


## Configuration

Configuration of common elements ([header](#header), [footer](#footer),
navigation, etc.) happens in your project's
[data files](https://jekyllrb.com/docs/datafiles/). See this project's
[data directory](_data) for reference configurations of each component.

The [base layout](#layout-base) also provides a mechanism for automatically
including [stylesheets](#stylesheets) and [scripts](#scripts) on a site-wide,
layout-wide, and per-page basis. See [asset load order](#asset-load-order) for
more information.


### Stylesheets

As a general rule, all stylesheets are inserted in a layouts' `<head>`, which
qualifies them as "render-blocking". Site stylesheets can be specified in
`_config.yml` or a layout or page's frontmatter YAML in the following form:

```yml
styles:
- /path/to/sheet.css
- href: /path/to/sheet.css
  media: (screen|print|all) # optional
  async: true # optional
```

Stylesheets specified as objects (in the latter item above) must have an `href`
property. The `media` defaults to `screen`, and stylesheets with `async: true`
will be loaded at the end of the document so as not to block the rendering of
the page's content.


### Scripts

As a general rule, all scripts are inserted before a layouts' `</body>`, which
prevents them from blocking the rendering of your page's content. Scripts can
be specified in `_config.yml` or a layout or page's frontmatter YAML in the
following form:

```yml
scripts:
- /path/to/script.js
- href: /path/to/script.js
  async: true # optional
```

Scripts specified as objects (in the latter item above) must have a `src`
property. Scripts with `async: true` will get an `async` attribute, which tells
the browser _not_ to let this script's laoding block the execution of
subsequent scripts. If the execution order of your scripts is **not**
important, setting `async: true` may provide performance benefits to your
users. (Conversely, if you don't know whether your scripts need to execute in a
particular order, then you should not set `async: true` because it may prevent
your scripts from running propertly.)


### Asset load order

Both [stylesheets](#stylesheets) and [scripts](#scripts) can be configured

1. Assets configured at the `site` level (in your `_config.yml`) will be loaded
   in all pages that use the USWDS [layouts](#layouts).
1. Those configured at the layout level (in that layout's frontmatter) will be
   loaded on all pages that use that layout, after site assets.
1. Those configured at the page level (in the page's frontmatter) will be
   loaded last.


## Customization

You have two options for customizing the CSS:


### Customizing with Sass

1. Create a [Sass][] (or SCSS) entry point that sets variables and then imports
   the USWDS source files:

    ```scss
    ---
    # assets/main.scss
    ---
    // set your variables or @import them here
    @import 'uswds/all';
    ```

1. Change the path to your site's default stylesheet in your `_config.yml`:

    ```yml
    styles:
      - /assets/main.css
    ```

All of the Standards' [SCSS source files](https://github.com/18F/web-design-standards/tree/master/src/stylesheets)
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

- To change how [stylesheets](#stylesheets) are loaded or referenced,
  you can create your own `_includes/styles.html`, which will subsequently
  change how stylesheets are loaded in all layouts that inherit from the USWDS
  [base layout](#layout-base).

- You can change how the side navigation is rendered (but not which
  data it receives) in the [docs layout](#layout-docs) by creating
  your own `_includes/sidenav.html`.

- You can change how and whether the side navigation is displayed at
  all in the [docs layout](#layout-docs) by overriding
  `_layouts/docs.html`.

## Components

For some [Standards components](https://standards.usa.gov/components/),
there are two different files that control how data is passed to the
template:

1. `components/{component}.html` is the low-level template that
   assumes a similarly named global template variable. For instance,
   the header component operates on the `header` template variable.
1. `{component}.html` is the "concrete" implementation of the
   component that sets the appropriate global variable then includes
   the low-level template.

This separation allows you to override either of the component
includes in your own Jekyll site without having to re-implement
either the high- or low-level logic. For instance, if you want your
header data to come directly from the Jekyll configuration file
(`_config.yml`) rather than `_data/header.yml`, you can override
`_includes/header.html` to look like this:

```html
{% assign header = site.header %}
{% include components/header.html %}
```


### Header

The `header.html` include sets the `header` template
variable to `site.data.header`, the value of which is set in your
Jekyll project's `_data/header.yml` file, and should be an object in
the following form:

```yml
# optional, defaults to 'basic'
type: (basic|extended|basic-mega|extended-mega)

primary: # optional
  links:
      # all links should have 'text'
    - text: Link text
      # link hrefs are prepended with the site.baseurl
      href: /link-href/
    - text: Section title
      # the existence of 'links' will produce a drop-down menu
      links:
        - text: Subnav text
          href: /link-to-subnav/
        - text: Another link
          href: /somewhere-else/

secondary: # optional
  search: # optional
    # if search is truthy and there is no 'action', searches will be
    # submitted to the current page URL
    action: /path/to/search-form/
    # the 'query' key determines the name of the search input, which
    # translates to the query string when submitted via GET
    query: name-of-query-string-var # default: 'search'
  links:
    - text: Link text
      href: /link-href/
```


## Layouts

This theme provides the following layouts, which you can use by setting the
`layout` frontmatter on each page, like so:

```yaml
---
layout: name
---
```

### `layout: base`
This is the bare-bones Standards layout, which does all of the basic page
scaffolding then drops the page content into the `<main>` element. All of the
other layouts "inherit" this one and provide other features in the content
block.

The base layout provides a layout frontmatter hook to add attributes
to the `<main>` element. You can see how this works in the [docs
layout](_layouts/docs.html#L3-L4).


### `layout: landing`

This layout implements the [landing page
template](https://standards.usa.gov/page-templates/landing/), which
accommodates the following frontmatter:

```yml
hero: # optional
  image: /path/to/image.jpg # optional
  callout:
    alt: Callout white text! # optional
    text: The rest of the callout
  button: # optional
    text: The button text
    href: /button-href/

# optional, but must be used in conjunction with 'intro', below
tagline: A tagline for your page
# also optional, but must be used with 'tagline', above
intro: |
  Some introductory text content.

  This will be processed as **Markdown**.

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

Check out the YAML frontmatter in the [landing demo
page](demo/landing.html) for an example of how to structure it.


### `layout: docs`

This layout implements the [document page
template](https://standards.usa.gov/page-templates/docs/), and
accommodates an optional side navigation. Supported frontmatter:

* `sidenav` is a key _into_ `site.data.sidenav`. In other words, if
  your frontmatter specifies `sidenav: foo` then links will be pulled
  from `site.data.sidenav.foo`. This value is assumed to be an array
  of link objects, each with `href` and `text` strings.

  * A page's "current" or "active" state in the sidenav is determined
    by whether a link's `href` matches `page.url` or `page.permalink`
    for each page being rendered.

  * Current/active links will display a nested subnavigation if
    `page.subnav` is a similarly formatted array of link objects.
    **Note that subnav link hrefs are not prefixed with
    `site.baseurl`** because this breaks hash links prefixed with
    `#`.

See the [docs demo page](demo/docs.md) for an example of how this
works.


[Sass]: http://sass-lang.com/guide
[Jekyll Sass]: https://jekyllrb.com/docs/assets/#sassscss
