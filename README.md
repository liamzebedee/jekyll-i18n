[![Gem Version](https://badge.fury.io/rb/jekyll-i18n.png)](http://badge.fury.io/rb/jekyll-i18n)

**Jekyll i18n** is a plugin that enables simplistic multi-language site designs using Jekyll. It is written by [Liam Edwards-Playne](liamz.co) and licensed under the GPLv3.

**NOTE: I've moved on from actively developing this gem (I transitioned to WordPress :P), but I am happy to accept pull requests should they be submitted**.

# Install
> gem install jekyll-i18n

Then add `require 'jekyll-i18n` to `_plugins/ext.rb`.

# Tutorial
The basic principle is that we distinguish between two types of content:

1. **translated** — content translated fully for a single language.
3. **non-content** — non-translatable or binary data

We identify the type by part of the filename. 

### Translated content
Translated content is that which has a language code directly following its title but preceding its file extension — e.g. **PAGE-NAME.LANG.EXT**. These files will be generated and **written to a subdirectory named after the language** — e.g. /LANG/PAGE-NAME.

This plugin injects itself at the last stage of permalinks, so your permalinks will remain intact. 

### Non-content
Non-content is simply written to its usual location. 

### Tags and Filters
For the purposes of translating specific phrases, there is a `t` tag and filter made available. Translation files are stored in **\_i18n/LANG.yml** and contains a mapping of keys to translations for a specific language. For example, a file fr.yml for French translations:
```
fr:
  Quote of the day: "La citation du jour"
  interesting: intéressant
```

In a file with translated content, test.md for example:
```
<h3>{%t Quote of the day %}. <small>{%t interesting %}!</small></h3>
```

The following would be written to /fr/test.html:
```
<h3>La citation du jour. <small>intéressant!</small></h3>
```

### Variables
This plugin makes the `page.lang` variable available.

### Accessing language-specific posts
To aid in accessing language-specific posts, such as for the purposes of post archives, we automatically tag the post based on its language. You can access all French posts under the Liquid variable `site.tags.fr`. 

### Translating permalinks
For translated permalinks (e.g. /archives/ for English and /articles/ for French) it suffices to use the permalink field in the page. For a page _archives.fr.md_ you could do:
```
---
permalink: /articles/
title: Articles.
---
...
```

I have yet to produce an automated solution that makes use of the translation files to localise the page permalink. 
