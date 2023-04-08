---
permalink: /docs/assets/
title: アセット
---

JekyllはRubyのgemによって、[Sass](https://sass-lang.com/)に組み込みで対応しており、また[CoffeeScript](https://coffeescript.org/)を使用することができます。これらを使用するには、まず適切な拡張子（`.sass`、`.scss`、`.coffee`のうちいずれか）のファイルを作成し、以下のように***2行の3つのダッシュで始まる***ようにする必要があります。

```sass
---
---

// start content
.my-definition
  font-size: 1.2em
```

Jekyllはこれらのファイルを他の通常のページと同じように扱い、出力されたファイルは出所と同じディレクトリに配置します。例えば、サイトのソースフォルダに`css/styles.scss`という名前のファイルがあった場合、Jekyllは処理を行い、サイトの出力先のフォルダの中に`css/styles.css`を配置します。

<div class="note info">
  <h5>Jekyllはアセットファイルの全てのLiquidフィルタとタグを処理します</h5>
  <p><a href="{{ '/docs/templates/' | relative_url }}">Liquidテンプレート構文</a>と競合する<a href="https://mustache.github.io">Mustache</a>や他のJavaScriptテンプレート言語を使用している場合、コードの前後に<code>{&#37; raw &#37;}</code>タグと<code>{&#37; endraw &#37;}</code>タグを置く必要があります。</p>
</div>

## Sass/SCSS

Jekyll allows you to customize your Sass conversion in certain ways.

Place all your partials in your `sass_dir`, which defaults to
`<source>/_sass`. Place your main SCSS or Sass files in the place you want
them to be in the output file, such as `<source>/css`. For an example, take
a look at [this example site using Sass support in Jekyll][example-sass].

If you are using Sass `@import` statements, you'll need to ensure that your
`sass_dir` is set to the base directory that contains your Sass files:

```yaml
sass:
    sass_dir: _sass
```

The Sass converter will default the `sass_dir` configuration option to
`_sass`.

[example-sass]:
https://github.com/jekyll/jekyll-sass-converter/tree/master/docs

<div class="note info">
  <h5>The <code>sass_dir</code> is only used by Sass</h5>
  <p>

    Note that the <code>sass_dir</code> becomes the load path for Sass imports,
    nothing more. This means that Jekyll does not know about these files
    directly. Any files here should not contain the empty front matter as
    described above. If they do, they'll not be transformed as described above. This
    folder should only contain imports.

  </p>
</div>

You may also specify the output style with the `style` option in your
`_config.yml` file:

```yaml
sass:
    style: compressed
```

These are passed to Sass, so any output style options Sass supports are
valid here, too.

For more information on Sass configuration options, see the [Sass
configuration]({{ '/docs/configuration/sass/' | relative_url }}) docs.

## Coffeescript

To enable Coffeescript in Jekyll 3.0 and up you must

* Install the `jekyll-coffeescript` gem
* Ensure that your `_config.yml` is up-to-date and includes the following:

```yaml
plugins:
  - jekyll-coffeescript
```
