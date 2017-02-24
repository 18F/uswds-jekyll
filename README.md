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

### `layout: landing`
This layout implements the [landing page
template](https://standards.usa.gov/page-templates/landing/), which
accommodates the following frontmatter:

* `hero` is an optional object with the following keys:
  * `image` is the optional URL of the hero image to use, which will
    be applied using inline CSS.
  * `callout` is optional, and can be a string (in which case it is output
    as-is) or object with `alt` (optional) and `text` string keys, in
    which the `alt` string is output before the text.
  * `button` is an optional link object with `href` and `text` keys
    that is styled as a red call to action button.
* `tagline` and `intro` are optional strings that, if both are
  provided, are rendered immediately after the hero in a grid layout.
  The `intro` text will be processed as Markdown.
* `graphics` is an optional list of objects, each of which should
  have an `image` object (with `src` and `alt` keys that correspond
  to their HTML equivalents), an optional `title` (rendered as an
  `<h3>`), and a `description`, which is processed as Markdown.
  * By default, the  graphics are rendered before the page content by
    the layout. The optional `graphics_position` key can be set to
    `after` to render the graphics after the content.

### `layout: docs`
This layout implements the [document page
template](https://standards.usa.gov/page-templates/docs/), and provides a space
for [side navigation](#side-navigation) via the `sidenav` frontmatter.
