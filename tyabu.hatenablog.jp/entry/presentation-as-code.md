---
Title: Presentation as Code
Date: 2018-05-08T20:36:29+09:00
URL: https://tyabu.hatenablog.jp/entry/presentation-as-code
EditURL: https://blog.hatena.ne.jp/tyabu12/tyabu.hatenablog.jp/atom/entry/17391345971642685662
Draft: true
---

## 背景

- サーベイした論文の要約を書きたい
- 書いた要約は後で探しやすいように管理したい
- どうせなら書いた要約を、そのままゼミ発表とかで使えたら良いね
- 論文読むときは別に順番通りに読まないし、バージョン管理とかできると便利かも

## 提案手法

***Presentation as Code*** しよう

## どうするのか

### 採用言語

Markdown 一択ですね。

- シンプルな言語構造
  - 見やすい
  - 書きやすい
- 高い汎用性

### スライド生成

Markdown からのスライド生成
→ すでにツールは色々存在

|ツール名|コマンドライン|
|:---|:---:|
|[reveal.js](https://github.com/hakimel/reveal.js)|？|
|[remark.js](https://github.com/gnab/remark)|？|
|[Marp](https://yhatt.github.io/marp/)|☓|
|[Swipe](https://www.swipe.to/markdown/)|？|
|[Qiita](https://github.com/increments/qiita-markdown)|？|
|[md2gslides](https://github.com/gsuitedevs/md2googleslides)|△ (GoogleSlide のみ) |

### バージョン管理

git 一択ですね。

### デプロイ

主要なスライドホストサービスは主に3つ。

|サービス|API|再アップロード|
|:---|:---:|:---:|
|SlideShare|◯|☓|
|SpeakerDeck|☓|◯|
|GoogleSlide|？|？|
