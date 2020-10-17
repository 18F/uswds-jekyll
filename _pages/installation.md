---
title: Installation
layout: page
---

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

## Install as a new Jekyll site

1. Create a new Jekyll site:
   ```
   jekyll new
   ```
1. Replace the default `gem "minima", "~> 2.0"` gem with the `uswds-jekyll` gem in your `Gemfile`:

   ```ruby
   gem 'uswds-jekyll'
   ```

1. Set the `theme` in your site's Jekyll configuration, `_config.yml`:

   ```yml
   theme: uswds-jekyll
   ```

1. Fetch and update your bundled gems by running:

   ```sh
   bundle
   ```

1. Run `bundle exec jekyll serve` to build your site locally at http://localhost:4000/

## Versioning

To reference a specific version of this theme:

1. Visit the [releases page](https://github.com/18F/uswds-jekyll/releases) and decide which version you want to use.
1. Specify the version in your `Gemfile`.

   ```ruby
   gem 'uswds-jekyll', '~> 5.0'
   ```
