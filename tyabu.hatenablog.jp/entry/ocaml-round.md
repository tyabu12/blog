---
Title: OCamlの浮動小数点数演算時の丸め方向の設定
Category:
- OCaml
- 浮動小数点数
- 丸め演算
Date: 2017-04-19T00:00:00+09:00
URL: https://tyabu.hatenablog.jp/entry/ocaml-round
EditURL: https://blog.hatena.ne.jp/tyabu12/tyabu.hatenablog.jp/atom/entry/8599973812323614267
---

<p>[:contents]</p>
<p>OCamlの浮動小数点数には整数への丸め関数は存在するが、演算時の丸め方向を設定することはできない。</p>
<p>丸め方向まで気にすることは通常はないが、精度保証を要求されるプログラムを書く場合には、演算時の丸め方向まで考慮する必要がある。</p>
<p>ちなみにC (C99) ((fegetround, fesetround – cppreference.com<br /><a href="http://en.cppreference.com/w/c/numeric/fenv/feround">http://en.cppreference.com/w/c/numeric/fenv/feround</a></p>
<p>)) やC++11 ((std::fegetround, std::fesetround – cppreference.com<br /><a href="http://en.cppreference.com/w/cpp/numeric/fenv/feround">http://en.cppreference.com/w/cpp/numeric/fenv/feround</a>)) にはfesetroundという関数があり、この関数を用いることで浮動小数点数の演算時の丸め方向を指定することができる。</p>
<h3>丸め方向を指定した演算の実装</h3>
<p>そこで今回、OCamlで丸め方向を指定した演算を実装してみた。<br />実装方法は以下の通り。</p>
<ol>
<li>OCamlのCを呼び出す機能 ((Calling C libraries – OCaml<br /> <a href="http://ocaml.org/learn/tutorials/calling_c_libraries.html#WrappingcallstoClibraries">http://ocaml.org/learn/tutorials/calling_c_libraries.html#WrappingcallstoClibraries</a>)) によりCの関数を呼び出す<br />この際演算したい2つの浮動小数変数と演算時の丸め方向を引数としてCの関数に渡す</li>
<li>呼び出されたCの関数内で浮動小数点数の演算の丸め方向をfesetroundにより指定</li>
<li>続けてCの関数内で演算を行い、演算結果を返す (この際浮動小数点数の演算の丸め方向を元に戻すことに注意)</li>
<li>呼び出し元のOCamlで演算結果を受け取る</li>
</ol>
<p>以下、加算を例に簡単に実装方法を紹介する。</p>
<h3>丸め方向を指定した演算の実装の詳細</h3>
<h4>OCamlからCを呼び出すラッパー部分</h4>
<p>まずCを呼び出すラッパー部分のOCamlは以下のようになる:</p>
<p>[https://gist.github.com/8e8917bf5b172adf455c21e1552e2f66:embed#gist8e8917bf5b172adf455c21e1552e2f66]</p>
<p>round_mode が丸め方向用の型定義であり、external から始まる文でOCamlで add 関数が呼び出された際に呼び出すCの関数 addc と、呼び出す際に渡す引数に丸め方向と演算する2つの浮動小数点数を指定している。 </p>
<p>なお、round_modeのそれぞれの説明を以下に示す:</p>
<ul>
<li>NearestTiesToEven<br />最近接への丸め、等しいなら偶数へ</li>
<li>ToZero<br />0方向への丸め</li>
<li>Up<br />+∞方向への丸め</li>
<li>Down<br />-∞方向への丸め</li>
</ul>
<p>本当なら NearestTiesToAway (最近接への丸め、等しいなら奇数へ) もサポートしたかったが、fesetroundの仕様 (IEEE-754) により断念した。</p>
<h4>OCamlから呼び出されるCの丸め指定付き演算</h4>
<p>次に呼び出されたCの関数は以下のようになる:</p>
<p>[https://gist.github.com/fabdf392e69a2e9d805a08128ffeeccd:embed#gistfabdf392e69a2e9d805a08128ffeeccd] </p>
<p>OCamlから呼び出されるため少し書き方が異なるが、addc 関数内で演算の前に change_round_mode 関数で丸め方向を設定し、演算後は丸め方向を元に戻し、演算結果を返している。<br />演算後は丸め方向を元に戻さないと、OCamlでの演算に影響を及ぼすことがあるので注意が必要である。</p>
<p>なお、OCamlからCを呼び出す方法は以下を参考にした:</p>
<blockquote>
<p>Calling C libraries – OCaml <a href="https://ocaml.org/learn/tutorials/calling_c_libraries.html#WrappingcallstoClibraries">https://ocaml.org/learn/tutorials/calling_c_libraries.html#WrappingcallstoClibraries</a></p>
</blockquote>
<h4>丸め指定付き演算のサンプル</h4>
<p>次に実際に丸め指定付きで加算演算した結果を表示してみる簡単なプログラムを以下に示す:</p>
<p>[https://gist.github.com/187dddfa963987d4c9eb385f20210983:embed#gist187dddfa963987d4c9eb385f20210983]</p>
<p>それぞれの丸め方向について演算を行い、表示するプログラムである。</p>
<h4>Makefile</h4>
<p>正直OCamlのMakefileの書き方は良くわかってないので解説はしない。OCamlMakefile ((GNU make でのコンパイル – OCaml<br /><a href="http://ocaml.org/learn/tutorials/compiling_with_gnu_make.ja.html">http://ocaml.org/learn/tutorials/compiling_with_gnu_make.ja.html</a>)) を使うと簡潔に書けるみたいだが、Cのラッパー部分の書き方がよくわからない。分かる人は教えて下さい。</p>
<p>コンパイル方法は以下を参考にした:</p>
<blockquote>
<p>C関数をラップしてOCamlに接続する方法 (How to wrap C functions to OCaml)</p>
<p><a href="http://www.geocities.jp/harddiskdive/ocaml-wrapping-c/ocaml-wrapping-c.html">http://www.geocities.jp/harddiskdive/ocaml-wrapping-c/ocaml-wrapping-c.html</a></p>
</blockquote>
<p>Makefileは以下のようになる:</p>
<p>[https://gist.github.com/e552b2b83dc8875a5faa6a357b23651f:embed#giste552b2b83dc8875a5faa6a357b23651f]</p>
<p>make すると実行ファイルとして、バイトコードコンパイルした test と、ネイティブコードコンパイルした testopt が生成される。</p>
<h3>丸め指定付き演算のサンプルの実行結果</h3>
<p>サンプルの実行結果は以下のようになる:</p>
<p>[https://gist.github.com/81f8edadd19b5d8801983c13526695e4:embed#gist81f8edadd19b5d8801983c13526695e4]</p>
<p>丸め方向付きで正しく演算できていることが確認出来る。 </p>
<h3>まとめ</h3>
<p>OCamlの浮動小数点数演算時の丸め方向を指定することができるようになった。やったね！</p>
<p>なお、今回のプログラムはGitHubにあげてある。四則演算に加えて平方根までサポートしている。</p>
<p><a href="https://github.com/tyabu12/ocaml-round">https://github.com/tyabu12/ocaml-round</a></p>
<p>もしバグや改良できる点などがありましたら教えてください。</p>
