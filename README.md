# jekyll-uswds

This is a [Jekyll theme](https://jekyllrb.com/docs/themes/) for the
[U.S. Web Design Standards](https://standards.usa.gov).

## Installation

You can install the theme as a Ruby Gem by adding it to your `Gemfile` like so:

```ruby
gem 'jekyll-uswds', :git => 'git://github.com/18F/jekyll-uswds.git'
```

Then fetch and updated your bundled gems with:

```sh
bundle
```

and restart your Jekyll server to see the effects:

```sh
bundle exec jekyll serve
```

## Configuration

Configuration of common elements ([header](#header),
[footer](#footer), navigation, etc.) happens in your project's
[data files](https://jekyllrb.com/docs/datafiles/). See this
project's [data directory](_data) for reference configurations of
each component.

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

The `components/header.html` include assumes a `header` template
variable that is an object in the following form:

```yml
type: (basic|extended|basic-mega|extended-mega)
primary:
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
