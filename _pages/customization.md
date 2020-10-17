---
title: Customization
layout: page
---

Customize the USWDS Jekyll theme with [USWDS theme settings files](https://designsystem.digital.gov/documentation/settings/), [USWDS design tokens](https://designsystem.digital.gov/design-tokens/), and custom Sass or CSS. You'll need to place USWDS settings and custom Sass into a couple specific locations for the theme to find them.

1. **Settings:** Add custom USWDS settings to `_sass/_uswds-theme-settings.scss`. Settings control the USWDS output. See all available settings in the [USWDS settings documentation](https://designsystem.digital.gov/documentation/settings/). We recommend adding only your modified settings to the `_uswds-theme-settings.scss` file.

    To see an example of all the settings available to USWDS, see the files [in the USWDS GitHub repo](https://github.com/uswds/uswds/tree/develop/src/stylesheets/theme). The repo splits settings into multiple files. If you want to copy and mimic that structure, download the repo files using a tool like [DownGit](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/uswds/uswds/tree/develop/src/stylesheets/theme). Then add them to the `_sass/` directory and `@import` them from `_uswds-theme-settings.scss`.

    Whether you add only individual settings variables or import from multiple files, `_uswds-theme-settings.scss` needs to be the entry point.

1. **Custom Sass and variables:** Add any custom CSS or Sass to `_sass/_uswds-theme-custom-styles.scss`. You can use this custom styles file to `@import` any _additional_ Sass or CSS files your project needs, as long as any additional files exist in the `/_sass` directory.

    Custom Sass loads after the USWDS and default Sass, so you can use it to override the defaults. Individual sites can also [selectively override](#overriding-includes-and-layouts) individual includes and layouts.

## Overriding includes and layouts

Any [include](https://github.com/18F/uswds-jekyll/tree/master/_includes) or [layout](https://github.com/18F/uswds-jekyll/tree/master/_layouts) can be overridden by
your site by placing a file with the same name into your site's
`_includes` or `_layouts` directory. For instance:

- You can change how the side navigation is rendered (but not which
  data it receives) in the [page layout]({{ "/layouts/#page" | relative_url }}) by creating
  your own `_includes/sidenav.html`.

- You can change how and whether the side navigation is displayed
  at all in the [page layout]({{ "/layouts/#page" | relative_url }}) by overriding
  `_layouts/page.html`.
