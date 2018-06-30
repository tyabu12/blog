---
Title: プログラム検証プラットフォーム Why3 1.0.0 がリリース
Category:
- Why3
- プログラム検証
Date: 2018-06-28T19:04:39+09:00
URL: https://tyabu.hatenablog.jp/entry/why3-1.0.0
EditURL: https://blog.hatena.ne.jp/tyabu12/tyabu.hatenablog.jp/atom/entry/17391345971658528106
---

プログラム検証プラットフォーム Why3 1.0.0 がリリース
===

プログラム検証プラットフォーム Why3 1.0.0 がリリースされたので、
更新内容と軽く使ってみた所感をざっくり紹介します。

## Why3 とは

[フランス国立情報学自動制御研究所 (INRIA)](https://www.inria.fr/) が開発した、
プログラム検証のためのプラットフォームです。

[Why3 の公式HP](http://why3.lri.fr)


### 特長

- プログラムの記述には OCaml をベースにした関数型言語 (WhyML) を採用
  - WhyML → OCaml のエンコード (extract) も可能
- 関数に検証したい仕様 (事前条件、事後条件など) を付与すると、満たすべき検証条件を自動計算できる
- 検証条件の検証は、SMTソルバーや定理証明支援系にいい感じに自動エンコードしたものを渡して、外部に丸投げできる
  - [対応している外部証明器の一覧](http://why3.lri.fr/#provers)
- 上記の一連の操作が可能な IDE

まあかなりざっくり検証の手順を書くと、

1. プログラムを OCaml (ライクの言語) で書いて
2. 検証したい性質を仕様として付け加えて
3. IDE から証明器のボタンをポチッと押せば
4. お手軽に検証できちゃう

って感じです。


## ver.1.0.0 の主な変更点

以下は [Why3 のメーリングリスト](https://lists.gforge.inria.fr/mailman/listinfo/why3-club) の意訳+独自の補足です。
[原文はこちら](https://lists.gforge.inria.fr/pipermail/why3-club/2018-June/001745.html) 。

前のリリース (ver.0.88.3) からの変更は、大きく2つ。

1. WhyML プログラミング言語と、それに関する検証条件生成器
2. IDE によるユーザーインターフェースの改良

以下、それぞれについてざっくりと紹介します。


### 1. WhyML プログラミング言語と、それに関する検証条件生成器

簡潔にいうと、論理とプログラムで使われる関数の厳格で明確な区別をするようになりました。

以前までは、Why3 言語と呼ばれる論理記述言語  (紛らわしいよね) と、
WhyML と呼ばれるプログラミング言語が存在していました。

この言語をそれぞれ分けた問題として、
ある WhyMLで書いて検証した関数を、別の関数の仕様記述に利用する、
といったことができない問題がありました。
どうしてもしたいなら手で WhyML → Why3 に書き直す必要があり、えっそれってどうなの、という感じでした。

今回の更新ではこういったどちらの側にも使える関数を記述できるように、
論理もプログラムもすべて WhyML で書くことになり、
それに伴い Why3 言語は WhyML に統合されました。

もちろん以前のコードとは構文が変わったため、新しい構文に対応するよう書き直す必要があります。
以前の構文との簡単な対応関係は、ドキュメントの [付録A](http://why3.lri.fr/doc/changes.html#sec112) に記載されています。
まだ [構文のリファレンス](http://why3.lri.fr/doc/syntaxref.html) は公開されていませんが、近々掲載予定とのことです。

注意点としては、以前までできていた論理側に書いた関数 (`function` で書いた関数) をプログラム側で使おうとすると、
エラーになります (どちら側でも使いたいなら付録Aにしたがって `let function` に直せばOK) 。


### 2. IDE によるユーザーインターフェース

Why3 にはもともと GUI による IDE がありましたが、今回の更新で見た目がかなり変更されれました。

もともと、検証条件の変形や証明器による検証などの操作は左にボタンがズラッと並んでいたのですが、
今回の変更で右クリックによるコンテキストメニューから操作することになりました。

あと個人的に嬉しかった変更は、IDE 上から直接 WhyML のソースコードを編集できるようになったことですね。
まあ今までは IDE なのになんで編集できないんだろうって感じだったので。


### 所感

今回の更新は、今まで不便だなと感じていた点が結構解決された感じなので、
良いメジャーアップデートだと思います。

特に一つ目の Why3 言語と WhyML の統合は、思い切ったかなり良い変更だと思います。

ただ構文の大幅な変更やそれに伴う標準ライブラリの更新などで、まだいくつかバグがありそうな感じなので、
しばらくは試験運用しつつ、バグを見つけたら適宜 [issue報告](https://gitlab.inria.fr/why3/why3/issues) して修正をお願いしよう、という感じです。