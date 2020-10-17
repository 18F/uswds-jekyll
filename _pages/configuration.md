---
title: Configuration
layout: page
---

Configuration of common elements ([header](#header), [footer](#footer), [navigation](#navigation), etc.) happens in your project's [data files](https://jekyllrb.com/docs/datafiles/). See this project's [data directory](_data) for reference configurations of each component.

The [default layout](#layout-default) also provides a mechanism for automatically including [stylesheets](#stylesheets) and [scripts](#scripts) on a site-wide, layout-wide, and per-page basis. See [asset load order](#asset-load-order) for more information.

## Site title

You can change your site's title with the `title` field in `_config.yml`. If you want to provide an alternate title for use _only_ in the site header, you can set the `title` field in `_data/header.yml`.

## Site description

You can change your site's description with the `description` field in `_config.yml`. If you want to override it for a particular page, you can set the `description` field in that page's frontmatter.

## Navigation

This theme's navigation system is powerful and flexible. Named navigational lists live in your project's `_data/navigation.yml`.

By default all links are assumed to be internal to the site. You can add `external: true` to links that are external. You can also add `class: class-name` to add a class to a specific link.

```yml
# _data/navigation.yml

primary:
  - text: Documentation
    href: /docs/
  - text: Support
    href: /help/
    class: highlight
  - text: "18F"
    href: https://18f.gsa.gov
    external: true

  # link objects with a 'links' field will be presented as
  # collapsible link lists. The 'links' field can either be
  # a reference to another link list in this file, or
  # a literal list.

  - text: Section title
    links: <links>
```

This scheme allows you to define navigational elements that can be shared by different components, such as the [header](#header) and [footer](#footer). See the documentation for those components for more info.

## Page title

Set each page's title in its frontmatter:

```
---
title: About us
---
```

## Page subnavigation

If you're using the [page layout](#layout-page), each page may declare its own side navigation and subnavigation in its front matter:

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

As with the [header](#header) and [footer](#footer), the `sidenav` field may either reference a common [navigation list](#navigation) from `_data/navigation.yml` (recommended) or be a literal list of links.

The `subnav` field should be used to link to sections _within_ the current page, because links to other pages will cause the linking page's side navigation to collapse when visited.

`sidenav` is a key _into_ `_data/navigation.yml`. See the [navigation](#navigation) docs for more info.

A page's "current" or "active" state in the sidenav is determined by whether a link's `href` matches `page.url` or `page.permalink` for each page being rendered.

`subnav` is a list of links to display on this page under its own link in the side navigation.

**Note that subnav link hrefs are not prefixed with `site.baseurl`** because this breaks hash links prefixed with `#`.

**Pro tip:** Unless your Jekyll configuration specifies otherwise, the default Markdown formatter (Kramdown) will automatically generate predictable `id` attributes for your page headings and convert markdown like this:

```md
## Section one
```

into:

```html
<h2 id="section-one">Section one</h2>
```

If you're using Redcarpet, you will need to configure it to enable the `with_toc_data` extension in your `_config.yml`, like so:

```yml
markdown: redcarpet
redcarpet:
  extensions:
    - with_toc_data
```

**Pro tip:** If you're like us and prefer your navigation sticky, you can add `sticky_sidenav: true` on [page](#layout-page), [project](#layout-project), and [team member](#layout-team-member) layouts to have the sidenav follow as you scroll.

## Hero

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

## Tagline intro

```yml
# optional, but must be used in conjunction with 'intro', below
tagline: A tagline for your page
# also optional, but must be used with 'tagline', above
intro: |
  Some introductory text content.

  This will be processed as **Markdown**.
```

## Graphics list

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

## Color configuration

The default colors can be configured in the `_data/theme.yml` file. Other settings can be configured using USWDS theme settings. (See the [customization](#customization) section, below.)

## Search

[Search.gov](https://search.gov/) is used for search and can be configured in `_config.yml`.

Before configuring your search you will need to create a search.gov account and set up your website
with search.gov.

After setting up your site on search.gov you can then add your `search_site_handle` to the `config.yml`.

## Analytics

### Google Analytics

You can add Google Analytics to your site by uncommenting the `google_analytics_ua` line and replacing `UA-????????-??` with your Google analytics UA code.

```
# Configuration for Google Analytics, add your UA code here:
# google_analytics_ua: UA-????????-??
```

### Digital Analytics Program (DAP)

You can add DAP to your site by uncommenting the `dap_agency` line and, if need be, replacing `GSA` with the appropriate agency key. And optionally, `dap_subagency` may also be specified. For more information visit <https://www.digitalgov.gov/services/dap/>

```
# Configuration for DAP, add your agency ID here:
# dap_agency: GSA
# dap_subagency: TTS
```

## Last modified date

To show the last date a page was last modified by:

1. Add this line to the `footer.yml` data file:

    ```yml
    last_updated: true
    ```

1. Add the following to your `Gemfile`:

    ```ruby
    group :jekyll_plugins do
      gem "jekyll-last-modified-at"
    end
    ```

This will add the date right before the footer component.

## Anchor JS

You can show an anchor link next to header tags by uncommenting this section from the `_config.yml` data file. This will add an anchor link after the header tag on the page and post layouts making ech header linkable. See https://github.com/bryanbraun/anchorjs for more information.

```yml
# anchor_js_targets: [h1, h2, h3, h4, h5, h6]
```
