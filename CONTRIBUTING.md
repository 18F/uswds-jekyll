## Welcome!

We're so glad you're thinking about contributing to an 18F open source project! If you're unsure about anything, just ask -- or submit the issue or pull request anyway. The worst that can happen is you'll be politely asked to change something. We love all friendly contributions.

We want to ensure a welcoming environment for all of our projects. Our staff follow the [18F Code of Conduct](https://github.com/18F/code-of-conduct/blob/master/code-of-conduct.md) and all contributors should do the same.

We encourage you to read this project's CONTRIBUTING policy (you are here), its [LICENSE](LICENSE.md), and its [README](README.md).

If you have any questions or want to read more, check out the [18F Open Source Policy GitHub repository](https://github.com/18f/open-source-policy), or just [shoot us an email](mailto:18f@gsa.gov).

## Development

To develop this theme and/or test it locally:

1. Clone this repo

1. Check the version of USWDS in `package.json` — update to the newest version if necessary, and sync its new files to the theme.

   > `rake update`

1. Start Jekyll to preview the effects of your changes. This will build the Jekyll site, watch the Sass files, and recompile the Sass when there are changes.

   > `npm start`

   **or**

   Create a new Jekyll project, follow the
   [installation](#installation) instructions, then change your
   `Gemfile` to point at the local clone of this repo:

   ```ruby
   gem 'uswds-jekyll', :path => '../path/to/uswds-jekyll'
   ```

## Updating the U.S. Web Design System

Run `rake update`

## NPM scripts

- `start`: Starts the jekyll site
- `setup-uswds`: Copies assets from the USWDS package to their theme locations, but running the following scipts, which can also be run separately:
  - `sync-assets`: Copies assets to `assets/uswds`
  - `sync-sass`: Copies Sass cource files to `_sass/uswds/src/`
  - `sync-default-settings`: Copies default settings files to `_sass/uswds/settings`
  - `sync-theme-settings`: Copies only theme settings files to `_sass/settings`

## Releasing a new version

1. Update the gem version in [`uswds-jekyll.gemspec`](uswds-jekyll.gemspec)
1. `bundle install`
1. Add a PR for the update and get it merged
1. `bundle exec rake release` which creates the tag based on the version in the gemspec file and pushes the tag to Github and the gem to RubyGems.
1. Add a GitHub release to the releases page with the same version number
1. You should see the latest version [on RubyGems](https://rubygems.org/gems/uswds-jekyll)

## Public domain

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
