---
Title: 簡単な論理パズルを自動で解いてみる
Category:
- Why3
- 論理パズル
- 証明
- SMTソルバー
- プログラム検証
Date: 2018-04-07T23:49:36+09:00
URL: https://tyabu.hatenablog.jp/entry/why3-logic-puzzle
EditURL: https://blog.hatena.ne.jp/tyabu12/tyabu.hatenablog.jp/atom/entry/17391345971633125887
---

[:contents]

# 今回やること
簡単な論理パズルを、自動定理証明器 (SMTソルバー) を使って、自動で解いてみる。
自動証明の超入門的な感じ。

今回 Why3 という証明プラットフォームを使いますが、日本では超絶マイナーなので恐らく知らないと思います。

## 対象読者
- ちょっと論理学知ってる人
  - 今回の検証は超簡単なので、雰囲気でなんとなくわかる気がする
- ちょっと関数型言語触ったことがある人
  - プログラムの文法は OCaml の派生
- パズルを自分で解きたくない人

## お題
いわゆる正直者、嘘つき者の論理パズル。

> 次の３人のうち、１人は正直者で、２人は嘘つきです。  
> 正直者は誰ですか。理由も踏まえて答えてください。
>
> - Ａ君『僕は正直者です。』
> - Ｂさん『Ａは嘘つきよ。わたしが正直者です。』
> - Ｃ君『Ｂは嘘つきだ。オレが正直者だ。』
[https://detail.chiebukuro.yahoo.co.jp/qa/question_detail/q1250892767:embed:cite]

## Why3
今回使う、フランスのINRIAが開発した証明プラットフォーム。
OCaml 拡張の言語で検証したいプログラムを記述すると、いい感じに検証条件を生成してくれ、いい感じに複数の定理証明器 (SMTソルバー や Coq など) を仲介して、検証できる。
検証条件ごとに別の定理証明器を使うこともできる。

公式サイト: [http://why3.lri.fr]

# 準備
## インストール
1. 下記を参考にOPAMをインストール
[https://opam.ocaml.org/doc/Install.html:embed:cite]

1. SMTソルバー (Alt-Ergo) と Why3 をインストール
```
$ opam install alt-ergo why3
```

## プログラム
まずは、三人を表す person 型を定義する:
```ocaml
type person = A | B | C
```

つぎに、正直者か嘘つき者かを表す status 型を定義する:
```ocaml
type status = Honest | Liar
```

person 型を受け取り、正直者か嘘つき者かを返す関数 status を定義する:
```ocaml
function status (person) : status
```

3人のうち1人は正直者で2人は嘘つきであるという定理を定義する:
```ocaml
axiom Honest_is_the_only_one:
  (status A = Honest /\ status B = Liar   /\ status C = Liar) \/
  (status A = Liar   /\ status B = Honest /\ status C = Liar) \/
  (status A = Liar   /\ status B = Liar   /\ status C = Honest)
```

aが「bはsだ」と言った、という証言を述語として定義する:
```ocaml
predicate evidence (a b : person) (s : status) =
  if status a = Honest then status b = s else status b <> s
```
正直者か嘘つき者かを `if` で場合分けしているのがポイント。

三人の証言を定理として記述する:
```ocaml
(* A「私は正直者です。」 *)
axiom evidence_A: evidence A A Honest

(* B「Aはうそつきです。私が正直者です。」 *)
axiom evidence_B: evidence B A Liar /\ evidence B B Honest

(* C「Bはうそつきです。本当の正直者は私です。」 *)
axiom evidence_C: evidence C B Liar /\ evidence C C Honest
```
ここでポイントなのが、`axiom evidence_A: status A = Honest` としてしまうと、Aが嘘つき者の場合に定理 `evidence_A ` が矛盾してしまう。
そこで、一つ前のステップで定義した述語 `evidence` を使い、正直者でも嘘つき者でも定理が成り立つように記述する。

これで問題の状況は記述できたので、あとは検証したいゴールを記述する:
```ocaml
(* Bは正直者である *)
goal B_is_Honest: status B = Honest
```

## 完成したプログラム

若干表記は違うけど内容は同じ。

[https://gist.github.com/96368cb1dfd3e2e342651b6c9e6fcfc2:embed#gist96368cb1dfd3e2e342651b6c9e6fcfc2]


# 検証
Why3 の IDE を起動して検証する
```
$ why3 ide honest_and_liar.why
```
goal を選択して、Alt-Ergo のボタンを押せば検証できます。
緑のチェックマークがつけば証明できた、つかないなら証明できない。

注: このとき「◯は正直者である」のゴールは一つだけにすること。
でないと矛盾したゴール以降はどんなゴールも成り立ってしまうので。

# 結果
3つのゴールのうち、`B_is_Honest` だけが証明できたので、Bが正直者ということがわかった。

# まとめ
三人の内、Bが正直者であることが自動で解けた。
問題には「理由も踏まえて答えてください。」ってあるけど、この場合だと「証明できたから」になるのかな？

もっと複雑な論理パズルだと、[Why3のマニュアル](http://why3.lri.fr/doc/) に [Einstein's Problem](http://why3.lri.fr/doc/syntax.html#sec18) がある。

Why3、すごく便利なのでぜひ遊んでみてください。
