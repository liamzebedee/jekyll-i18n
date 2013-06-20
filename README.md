**Jekyll i18n** is a plugin that enables simplistic multi-language site designs using Jekyll. It is written by [Liam Z](liamz.co) and licensed under the GPLv3.

This is currently what needs to be implemented:
* Localised content
* Automatic tagging of posts according to langauge

# Tutorial
The basic principle is that we distinguish between three types of content:

1. **translated** — content translated fully for a single language.
2. **localised** — generic template that has phrases localised
3. **non-content** — non-translatable or binary data

We identify the type by part of the filename. 

### Translated content
Translated content is that which has a language code directly following its title but preceding its file extension — e.g. **POST-NAME.LANG.EXT**. These files will be generated and **written to a subdirectory named after the language** — e.g. /LANG/POST-NAME.

This plugin injects itself at the last stage of permalinks, so your permalinks will remain intact. 

### Localised content
Localised content is identified differently from translated content: instead of a language code, localised content has the identifier 'mul' (which is a special language identifier for content of multiple languages).

Although not restricted to localised content, a filter is made available specifically for the purposes of translating phrases — `t`. Translation files are stored in **\_i18n/LANG.yml** and contains a mapping of keys to translations for a specific language. For example, a file fr.yml for French translations:
```
fr:
  Quote of the day: "Le citation du jour"
  interesting: intéressant
```

In a localised file, friend.mul.md for example:
```
<h3>{%t Quote of the day %}. <small>{%t interesting %}!</small></h3>
```

The following would be written to /fr/friend.html:
```
<h3>Le citation du jour. <small>intéressant!</small></h3>
```

Localised content will be generated for every language that has translations in **\_i18n**.

### Variables
This plugin makes the `page.lang` variable available, which is useful in customising layouts. 
