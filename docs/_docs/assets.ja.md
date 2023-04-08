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

Jekyllでは何らかの方法にSassの変換をカスタマイズできます。

全ての部分的なファイルを`sass_dir`に配置してください。既定では`<source>/_sass`です。メインのSCSSやSassファイルを出力後に配置したい場所に置きます。例えば`<source>/css`です。一例として、[JekyllのSass対応を使ったサイトの例][example-sass]を見てください。

Sassの`@import`文を使用している場合は、`sass_dir`がSassファイルを含む基底ディレクトリに設定されていることを確認する必要があるでしょう。

```yaml
sass:
    sass_dir: _sass
```

Sass変換器は`sass_dir`の設定オプションとして`_sass`を既定にしているでしょう。

[example-sass]:
https://github.com/jekyll/jekyll-sass-converter/tree/master/docs

<div class="note info">
  <h5><code>sass_dir</code>はSassのみの使用です</h5>
  <p>

    <code>sass_dir</code>はSassをインポートするための読み込みパスになるだけで、それ以上のことはありません。つまりJekyllはこれらのファイルを直接は知らないのです。ここのファイルには前述したような空のフロントマターを含めるべきではありません。含んでいたとしても前述したようには変換されません。このフォルダは、インポート用のファイルのみが含まれます。

  </p>
</div>

`_config.yml`ファイルの`style`オプションで出力スタイルを指定することもできます。

```yaml
sass:
    style: compressed
```

これらはSassに渡されるので、Sassで対応している出力スタイルオプションは全てここでも妥当です。

Sassの設定オプションについての詳細は、[Sassの設定]({{ '/docs/configuration/sass/' | relative_url
}})のドキュメントを参照してください。

## Coffeescript

JekyllでCoffeeScriptを有効にするには3.0以上でなければなりません。

* `jekyll-coffeescript` gemをインストールしてください
* `_config.yml`が最新の状態であり、以下が含まれていることを確認してください。

```yaml
plugins:
  - jekyll-coffeescript
```
