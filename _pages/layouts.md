---
title: Layouts
layout: page
---

This theme provides the following layouts, which you can use by setting the `layout` [front matter] on each page, like so:

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

## `layout: default`

This is the bare-bones USWDS layout, which does all of the basic page scaffolding then drops the page content into the `<main>` element. All of the other layouts "inherit" this one and provide other features in the content block.

The default layout provides a layout [front matter] hook to add attributes to the `<main>` element. You can see how this works in the [page layout](_layouts/page.html#L3-L4).

## `layout: home`

This layout implements the [home page
template](https://designsystem.digital.gov/page-templates/landing/), which accommodates the following [front matter]:

Check out the YAML front matter in the [home demo page](_pages/home.html) for an example of how to structure it.

## `layout: page`

This layout implements the [document page template](https://designsystem.digital.gov/page-templates/docs/).

See the [page demo page](_pages/docs.md) for an example of how this works, and see [\_data/navigation.yml](_data/navigation.yml) for how to structure named navigation data for your site.

## `layout: post`

This layout is identical to the layout `page` and is included to allow for easier site creation using `Jekyll new`.

## `layout: project`

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

## `layout: team-member`

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

[sass]: http://sass-lang.com/guide
[jekyll sass]: https://jekyllrb.com/docs/assets/#sassscss
[front matter]: https://jekyllrb.com/docs/frontmatter/
