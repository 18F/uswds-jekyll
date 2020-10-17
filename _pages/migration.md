---
title: Migration
layout: page
---

### From [guides_style_18f](https://github.com/18F/guides-style)

See [this example pull request](https://github.com/18F/before-you-ship/pull/458).

### From earlier versions

**Note:** `uswds-jekyll` 5.x is only compatible with Jekyll 4.0 and higher.

1. Update your `uswds-jekyll` gem in your project's Gemfile. Replace the current `gem 'uswds-jekyll'` line with:

   ```ruby
   gem 'uswds-jekyll', '~> 5.0'
   ```

   Then, in the terminal, run

   ```sh
   bundle update uswds-jekyll
   ```

1. If you have an existing `_sass` folder, it needs to move to the root level, and out of any directory like `/assets`.
1. Add or move any custom styles or variables to `/_sass/_uswds-theme-custom-styles.scss`.

    If you have multiple custom styles files, add them to the `/_sass` directory and `@import` them from `_uswds-theme-custom-styles.scss`.
1. Convert manual values to tokenized values using the guidance on the [USWDS migration page](https://designsystem.digital.gov/documentation/migration/#spacing-units).
1. Don't duplicate the `h1` in the body content of `page` template pages. (This is automatically inserted at the top with the content of `page.title`.)
1. Check that certain data keys exist

   ```
   --> config.yml
   styles:
     [nothing unless adding additional stylesheets]

   --> header.yml
   type: [basic | basic-mega | extended | extended-mega]

   --> footer.yml
   type: [slim | default | big]

   --> navigation.yml
   sidenav-breakpoint: {{ breakpoint_token }}

   --> theme.yml (examples)
   colors:
     usa-banner:
       usa-banner-bg: 'base-lightest'
       usa-banner-text: 'ink'
       usa-banner-link: 'primary-dark'
       usa-banner-link-hover: 'primary-darker'
     header:
       header-bg: 'white'
       header-title: 'ink'
       header-link: 'base'
       header-link-hover: 'primary-dark'
     alt-section:
       bg-color: 'primary-darker'
       header-color: 'accent-cool'
       text-color: 'white'
       link-color: 'base-lightest'
       link-hover-color: 'white'
     hero:
       hero-bg: 'primary-darker'
       hero-header: 'accent-cool'
       hero-header-alt: 'white'
       hero-text: 'white'
       hero-link: 'accent-cool'
       hero-button-bg: 'primary'
       hero-button-text: 'white'
     top-navigation:
       top-nav-bg: 'white'
       top-nav-link: 'base-dark'
       top-nav-link-hover: 'primary'
       top-nav-link-hover-bg: 'white'
       top-nav-link-current: 'base-dark'
       top-nav-dropdown-bg: 'primary-dark'
       top-nav-dropdown-link: 'white'
       top-nav-dropdown-link-hover-bg: 'transparent'
     side-navigation:
       side-nav-bg: 'transparent'
       side-nav-link: 'ink'
       side-nav-link-hover: 'primary-dark'
       side-nav-link-hover-bg: 'base-lightest'
       side-nav-link-current: 'primary-dark'
     footer:
       primary-footer-bg: 'base-lightest'
       primary-footer-link: 'ink'
       footer-bg: 'base-lighter'
       footer-text: 'ink'
       footer-link: 'ink'
       footer-social-link: 'black-transparent-10'

   ```

1. Check that css is referencing `uswds-theme.css`
