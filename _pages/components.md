---
title: Components
layout: page
---

For some [USWDS components](https://designsystem.digital.gov/components/), there are two different files that control how data is passed to
the template:

1. `components/{component}.html` is the low-level template that assumes a similarly named global template variable. For instance, the header component operates on the `header` template variable.
1. `{component}.html` is the "concrete" implementation of the component that sets the appropriate global variable then includes the low-level template.

This separation allows you to override either of the component includes in your own Jekyll site without having to re-implement either the high- or low-level logic. For instance, if you want your header data to come directly from the Jekyll configuration file (`_config.yml`) rather than `_data/header.yml`, you can override `_includes/header.html` to look like this:

```html
{% raw %}{% assign header = site.data.header %}
{% include components/header--basic.html %}{% endraw %}
```

### Header

The [header.html include](_includes/header.html) sets the `header` template variable to `site.data.header`, the value of which is set in your Jekyll project's `_data/header.yml` file. Then it includes [components/header.html](_includes/components/header.html) to render the header's markup.

See this repo's [header.yml](_data/header.yml) for more info.

### Footer

The [footer.html include](_includes/footer.html) sets the `footer` template variable to `site.data.footer`, the value of which is set in your Jekyll project's `_data/footer.yml` file. Then it includes [components/footer.html](_includes/components/footer.html) to
render the footer's markup.

See this repo's [footer.yml](_data/footer.yml) for more info.
