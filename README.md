i18next-ko
==========
With this awkwardly named library, you can easily translate your
[KnockoutJS][ko] applications. It uses [i18next][i18next], so you may want to read
[their documentation][i18nextdoc] to know how to use variables and stuff.

[ko]: http://knockoutjs.com/
[i18next]: http://i18next.com/
[i18nextdoc]: http://i18next.com/pages/doc_features.html

Installation
============
If you are using npm, you can get i18next-ko with `npm install i18next-ko`. It
works like a charm with Browserify, just `require('i18next-ko')`.

If you use bower, you can get i18next-ko with `bower install i18next-ko`.

You can also use the [prebuilt standalone file][prebuilt] that works in every
environment.

Note that while i18next is included in the standalone build and as dependency in
the npm package, KnockoutJS is not.

[prebuilt]: https://raw.githubusercontent.com/leMaik/i18next-ko/master/lib/i18next-ko.js

Usage
=====

Initialization
--------------
To initialize i18next-ko, you need to call `i18nextko.init()`. It takes the
following parameters: `i18nextko.init(resourceStore, language, ko)`.

* The `resourceStore` is a i18next resource store. It looks like this:
```
  {
    en: {
      translation: {
        'testTranslation': 'Test translation'
      }
    },

    de: {
      translation: {
        'testTranslation': 'Test-Übersetzung'
      }
    }
  }
```

* The `language` is the language that will be used by default.
  Defaults to `'en'`.
* You may set `ko` to your KnockoutJS object. Usually, this is not needed but
  it may solve some issues if you use Browserify and have some dependencies that
  require different versions of KnockoutJS.
  Defaults to `window.ko`.

Note that the i18nextko object basically is a singleton. Once you initialized
it, the translations and the `i18n` binding will be available everywhere.

Using translations
------------------
i18next-ko comes with exactly one new KnockoutJS binding: The `i18n` binding.

You can use the binding in three different ways:

1. Use a string:
   `data-bind="i18n: 'testTranslation'"` sets the content of the
   element to the translation with the key `testTranslation`.

   It is automatically updated whenever the language is changed.

2. Use a key and add variables:
   `data-bind="i18n: { key: 'greeting', options: { name: name } }"`
   sets the content of the element to the translation with the given key.

   The variable `{{name}}` in the translation is replaced with the value of the
   `name` property of the view model.

   It is automatically updated whenever the language is changed or the value of
   any observable variable is changed.

3. Mix both approaches and bind multiple attributes:
   `data-bind="i18n: { html: 'testTranslation', title: { key: 'greeting',
   options: { name: name } } }"` sets the content of the element to the
   translation with the key `testTranslation`.

   The `title` attribute to the translation with the key `greeting`, using the
   `name` property of the view model for the variable `{{name}}`.

   You can use as many attributes as you want. Translations are automatically
   updated whenever the language is changed or the value of any observable
   variable is changed.

You may also get the underlying i18next object with `i18nextko.i18n`.

Changing the language
---------------------
The language can be changed with `i18nextko.setLanguage('your-language')`. This
will update every translation, as documented above.

Changing the language by using the `setLng` method of i18next directly will not
update the bindings.

Utility functions
-----------------
You can get a computed observable of a translation with `i18nextko.t()`. It
works in the same way as `i18n.t` but is updated whenever the language is
changed.
