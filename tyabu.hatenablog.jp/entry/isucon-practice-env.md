---
Title: ISUCON 練習環境まとめ
Category:
- ISUCON
- 環境構築
Date: 2018-08-18T22:20:00+09:00
URL: https://tyabu.hatenablog.jp/entry/isucon-practice-env
EditURL: https://blog.hatena.ne.jp/tyabu12/tyabu.hatenablog.jp/atom/entry/10257846132612159407
---

ISUCON 練習環境まとめ
===

最近 ISUCON の過去問をやることが多く、環境構築でつまずいたり、何度も調べるのが面倒なのでまとめました。

<s>ISUCONは過去問環境の構築から始まっています！</s>

過去問環境の立ち上げで困っている方、結構いると思うので助けになれば嬉しいです。

随時更新予定なので、情報ありましたらコメントなど頂けると助かります。

tyabu12 のと ISUCON 6 予選の AMI は、公式のと matuu さんのをほんの少し弄って僕が作ったやつなので、不具合などあれば教えてください。

過去の ISUCON や社内向け ISUCON を公開してくれる運営の方々や、多くのローカル用環境作ってくださった matsuu さんには、めちゃめちゃ感謝です。

## 更新履歴

- 2018/10/08 ISUCON8予選、HISCON2018 の追加

[:contents]

Ansible ファイル群
[https://github.com/matsuu/ansible-isucon:embed:cite]

Vagrant ファイル群
[https://github.com/matsuu/vagrant-isucon:embed:cite]

Docker ファイル群
[https://github.com/matsuu/docker-isucon:embed:cite]

## ISUCON 過去予選

### ISUCON 8 予選

[https://github.com/isucon/isucon8-qualify:embed:cite]

### ISUCON 7 予選

[https://github.com/isucon/isucon7-qualify:embed:cite]

|環境|image|bench|
|:---|:---|:---|
|VPS|[ConoHa](https://www.conoha.jp/guide/isucon.php)|image と同様|
|AMI|コミュニティAMI で isucon7 をググろう|image と同様|
|Vagrant|[matsuu/isucon7-qualifier](https://app.vagrantup.com/matsuu/boxes/isucon7-qualifier) (動作未確認)|image と同様？|

### ISUCON 6 予選

[https://github.com/isucon/isucon6-qualify:embed:cite]

|環境|image|bench|
|:---|:---|:---|
|AMI|ami-0df64f5754d9865c2 (tyabu12 m4.large)|ami-017f0c1f27151d3bf (tyabu12 m4.large)|
|Vagrant|[tyabu12/isucon6-qualifier-image](https://app.vagrantup.com/tyabu12/boxes/isucon6-qualifier-image) ([Vagrantfile](https://github.com/matsuu/vagrant-isucon/tree/master/isucon6-qualifier))|[tyabu12/isucon6-qualifier-bench](https://app.vagrantup.com/tyabu12/boxes/isucon6-qualifier-bench) ([Vagrantfile](https://github.com/matsuu/vagrant-isucon/tree/master/isucon6-qualifier))|

### ISUCON 5 予選

[https://github.com/isucon/isucon5-qualify:embed:cite]

|環境|image|bench|
|:---|:---|:---|
|GCE|TODO|TODO|
|Vagrant|TODO ([Vagrantfile](https://github.com/matsuu/vagrant-isucon/tree/master/isucon5-qualifier))|TODO ([Vagrantfile](https://github.com/matsuu/vagrant-isucon/tree/master/isucon5-qualifier))|

### ISUCON 4 予選

[https://github.com/isucon/isucon4/tree/master/qualifier:embed:cite]

|環境|image|bench|
|:---|:---|:---|
|AMI|ami-e3577fe2 (公式)|?|
|Vagrant|TODO ([Vagrantfile](https://github.com/matsuu/vagrant-isucon/tree/master/isucon4-qualifier))|?|

### ISUCON 3 予選

[https://github.com/isucon/isucon3/tree/master/qualifier:embed:cite]

|環境|image|bench|
|:---|:---|:---|
|AMI|TODO|?|
|Vagrant|TODO ([Vagrantfile](https://github.com/matsuu/vagrant-isucon/tree/master/isucon3-qualifier))|?|

## ISUCON 過去本戦

### ISUCON 7 本戦

[https://github.com/isucon/isucon7-final:embed:cite]

|環境|image|bench|
|:---|:---|:---|
|GCE|TODO|TODO|

### ISUCON 6 本戦

[https://github.com/isucon/isucon6-final:embed:cite]

公式の Azure でできるっぽい？ (未確認)

### ISUCON 5 本戦

[https://github.com/isucon/isucon5-final:embed:cite]

公式に [GCEイメージ](https://github.com/isucon/isucon5-final/blob/master/IMAGE.md) がありますが、リンク切れしてますね…。

|環境|api|image|bench|
|:---|:---|:---|:---|
|GCE|TODO|TODO|TODO|
|Vagrant|TODO? ([Vagrantfile](https://github.com/matsuu/vagrant-isucon/tree/master/isucon5-final))|TODO? ([Vagrantfile](https://github.com/matsuu/vagrant-isucon/tree/master/isucon5-final))|TODO? ([Vagrantfile](https://github.com/matsuu/vagrant-isucon/tree/master/isucon5-final))|

### ISUCON 4 本戦

[https://github.com/isucon/isucon4/tree/master/final:embed:cite]

|環境|image|bench|
|:---|:---|:---|
|AMI|ami-86e8e287 (公式)|ami-84e8e285 (公式)|
|Vagrant|TODO?|TODO?|

### ISUCON 3 本戦

[https://github.com/isucon/isucon3/tree/master/final:embed:cite]

|環境|image|bench|
|:---|:---|:---|
|AMI|TODO|TODO|
|Vagrant|TODO|TODO|

## 社内向け ISUCON

### HISCON (Heartbeats)

[https://github.com/heartbeatsjp/hisucon2018:embed:cite]

### ISHOCON

こちらは showwin さんという方が個人で作られたそうで、Wantedly 社などで教材として使われてたこともあるみたいです。

#### ISHOCON2

[https://github.com/showwin/ISHOCON2:embed:cite]

|環境|image|bench|
|:---|:---|:---|
|AMI|ami-d9b661a6 (公式 c4.large)| ami-78b66107 (公式 c4.large)|

#### ISHOCON1

[https://github.com/showwin/ISHOCON1:embed:cite]

|環境|image|bench|
|:---|:---|:---|
|AMI|ami-03134665 (公式 c4.xlarge)| - |

### pixiv ISUCON 2016

[https://github.com/catatsuy/private-isu:embed:cite]

go dep でコケる場合は、こっち使うと幸せになれます。
https://github.com/tyabu12/private-isu

|環境|image|bench|
|:---|:---|:---|
|AMI|ami-18b05179 (公式 c4.large)|ami-53ef0e32 (公式 c4.xlarge)|
|Vagrant|[tyabu12/pixiv-isucon2016-image](https://app.vagrantup.com/tyabu12/boxes/pixiv-isucon2016-image) ([Vagrantfile](https://github.com/tyabu12/vagrant-pixiv-isucon2016))|[tyabu12/pixiv-isucon2016-bench](https://app.vagrantup.com/tyabu12/boxes/pixiv-isucon2016-bench) ([Vagrantfile](https://github.com/tyabu12/vagrant-pixiv-isucon2016))|

### R-ISUCON (Recruit Technologies)

[https://github.com/recruit-tech/r-isucon:embed:cite]

※ benchmark がまだないっぽいです。

### Y!SUCON (Yahoo! JAPAN)

[https://github.com/yahoojapan/yisucon:embed:cite]

|環境|image|bench|
|:---|:---|:---|
|Vagrant|[tyabu12/yisucon-image](https://app.vagrantup.com/tyabu12/boxes/yisucon-image) ([Vagrantfile](https://github.com/tyabu12/vagrant-yisucon))|[tyabu12/yisucon-bench](https://app.vagrantup.com/tyabu12/boxes/pixiv-isucon2016-bench) ([Vagrantfile](https://github.com/tyabu12/vagrant-yisucon))|


## ベンチスクリプト (おまけ)

bench の Vagrant から image にベンチマークを投げるスクリプトです。

### ISUCON 7 予選
<script src="https://gist.github.com/tyabu12/56befa8498153e59fd0806e5cd5a3ac1.js"></script>

### ISUCON 6 予選
<script src="https://gist.github.com/tyabu12/54d250962b32023b08477fc6815d42e2.js"></script>

### pixiv ISUCON 2016
<script src="https://gist.github.com/tyabu12/50093c87547e2ae0f90712e2b9ff5b94.js"></script>
