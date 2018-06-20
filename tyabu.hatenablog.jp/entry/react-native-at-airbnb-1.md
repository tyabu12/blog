---
Title: React Native at Airbnb [1/5] 和訳
Category:
- 和訳
- React
- React Native
- Android
- iOS
- Airbnb
Date: 2018-06-20T19:46:00+09:00
URL: https://tyabu.hatenablog.jp/entry/react-native-at-airbnb-1
EditURL: https://blog.hatena.ne.jp/tyabu12/tyabu.hatenablog.jp/atom/entry/17391345971655926755
Draft: true
---

React Native at Airbnb [1/5] 和訳
===

## はじめに

この記事は [React Native at Airbnb](https://medium.com/airbnb-engineering/react-native-at-airbnb-f95aa460be1c) の勝手な日本語訳です。
少し前に React Native に手を出して (痛い目に遭った) 経験があったのと、面白そうな記事を Twitter で見かけたので和訳してみました。

[https://twitter.com/fladdict/status/1009286731714056194:embed#AirBnbが、Reactネイティブやめて素直にネイティブ作ることにしたらしい。“Sunsetting React Native” by Gabriel Peal https://t.co/V4sVoKJRsp]

[https://twitter.com/rejasupotaro/status/1009127703902072832:embed#すごい、5つのパートに渡ってRNをやめた経緯が書かれている / React Native at Airbnb – Airbnb Engineering & Data Science – Medium https://t.co/XAYXX0xIFW]

[https://twitter.com/atsushieno/status/1009143109475655680:embed#airbnbアプリ、かなりネイティブの機能を要求されるようになってきているし、React Nativeからフルネイティブに切り替える必要が出てきたのはそりゃまあ必然だろうって思う。もともとWebしかなかったWeb中心の企業にはRN… https://t.co/mbzifdOWaX]

随時、連載記事も和訳する予定です。

間違いなどあったらコメントください。

最終更新日: 2018/06/20

## 本文

>This is the first in a series of blog posts in which we outline our experience with React Native and what is next for mobile at Airbnb.

この記事は、我々の React Native に関する経験のあらましと、Airbnb で次のモバイル向けはなにか、というブログ連載の初記事である。

>When Airbnb launched 10 years ago, smartphones were in their infancy. Since then, smartphones have become an essential tool to navigate our everyday lives, especially as more and more people travel around the globe. As a community that enables new forms of travel for millions of people, having a world-class app is crucial. Mobile devices are oftentimes their primary or only form of communication while away from home.

10年前に Airbnb がローンチした際、スマートフォンは未成熟期であった。その後スマートフォンは、我々の毎日の生活を切り抜けるのに不可欠なツールになった。特に世界中を旅行する人々にとっては、ますます不可欠なものとなった。数百万人の旅の新しい形態を可能にしたため、世界規模のアプリケーションが必要不可欠である。モバイル端末はその中でもたいてい主要なものであり、自宅を離れていく間のコミュニケーションの唯一の方法である。

>Since our first three guests stayed in Rausch Street in 2008, mobile usage has increased from zero to millions of bookings per year. Our apps give hosts the ability to manage their listings on the go and provide travelers with inspiration to discover new places and experiences right at their fingertips.

はじめての三人のゲストが2008年に Rausch Street に滞在して以来、我々のアプリのモバイル使用による毎年の予約は0件から数百万件まで増加した。我々のアプリは指一本で、ホストに進行のリスト管理をする能力を与え、旅行者に新しい場所を発見するインスピレーションや体験を提供している。

>To keep up with the accelerated pace of mobile usage, we’ve grown our team to more than 100 mobile engineers to enable new experiences and improve existing ones.

モバイル使用の加速ペースについていくために、我々は新体験と既存の改良を可能にするために100人を超えるモバイルエンジニアを育ててきた。

### React Native への賭け (Placing a Bet on React Native)

>We are continually evaluating new technologies to enable us to improve the experience of using Airbnb for guests and hosts, move quickly, and maintain a great developer experience. In 2016, one of those technologies was React Native. Back then, we recognized how important mobile was becoming to our business but simply didn’t have enough mobile engineers to reach our goals. As a result, we began to explore alternative options. Our website is built primarily with React. It has been a highly effective and universally liked web framework within Airbnb. Because of this, we saw React Native as an opportunity to open up mobile development to more engineers as well as ship code more quickly by leveraging its cross-platform nature.

我々は、ゲストやホストがAirbnbを使う体験、素早い動作、素晴らしい開発者体験を向上するために、継続的に新しい技術を評価している。2016年の新しい技術のひとつが React Native だった。その当時、モバイルが我々のビジネスにどれだけ重要になってきているかを我々は認識していたが、我々の目標達成には全く十分なモバイルエンジニアがいなかった。結果として、我々は別の方法を探し始めた。我々のウェブサイトは主に React で書かれていた。React は高効率で Airbnb 内で万人に好かれる Web フレームワークだった。このため我々は、React Native がクロスプラットフォームの利用によりより早くコードを書ける上に、エンジニアのモバイル開発を切り開くものに見えた。

>When we began investing in React Native, we knew that there were risks. We were adding a new, fast-moving and unproven platform to our codebase that had the potential to fragment it instead of unifying it. We also knew that if we were going to invest in React Native, we wanted to do it right. Our goals with React Native were:

React Native の調査を開始した際、我々はそのリスクを知っていた。我々はコードの土台に、新しく、移り変わりが激しく、実証されていないプラットフォームを追加しており、一元化する代わりにコードの土台を寸断する潜在性をもっていた。我々はまた、もし React Native を調査するつもりなら、適切にしたいと考えていた。我々の React Native の目標は以下の4項目である.

1. Allow us to move faster as an organization.
  組織としてより早く動ける。
2. Maintain the quality bar set by native.
  ネイティブの品質基準を維持する。
3. Write product code once for mobile instead of twice.
  モバイル向けのプロダクトコードは、二度ではなく一度だけ書く。
4. Improve upon the developer experience.
  開発者の体験を向上する。

### 我々の経験 (Our Experience)

>Over the past two years, that experiment turned into a serious effort. We have built an incredibly strong integration into our apps to enable complex native features such as shared element transitions, parallax, and geofencing as well as bridges to our existing native infrastructure such as networking, experimentation, and internationalization.

過去二年に渡り、新手法は本格的なものになった。我々は、ネットワーク、実験、国際化のような既存のネイティブインフラとの橋渡しはもちろん、shared element transition、parallax、geofencing などの複雑なネイティブ機能を有効にするために、非常に強い統合化をアプリに組み込んだ。

>We have launched a number of critical products for Airbnb using React Native. React Native enabled us to launch Experiences, an entirely new business for Airbnb, as well as dozens of other features from reviews to gift cards. Many of these features were built at a time where we simply did not have enough native engineers to achieve our goals.

我々は React Native を使った Airbnb 用の重要なプロダクトをローンチしてきた。React Native は我々に、レビューからギフトカードまでの数多の機能同様に、全く新しいビジネスをローンチする体験を可能にした。その機能の多くは、目標達成に十分なネイティブエンジニアはいなかった。

>Different teams had a wide range of experiences with React Native. React Native proved to be an incredible tool at times while posing technical and organizational challenges in others. In this series, we provide a detailed account of our experiences with it and what we’re doing next.

別のチームは React Native の幅広い経験がある。React Native は、技術的にも組織的にも人類の挑戦とする一方で、時たま途方もないツールであることがわかった。この連載で我々は、その経験と次になにをしているのか、を詳しく述べた記事を提供する。

>In part two, we enumerate what worked and what didn’t with React Native as a technology.

二部では、技術としての React Native で、なにがうまくいき、なにがうまくいかないのかを列挙する。

>In part three, we enumerate some of the organizational challenges associated with building a cross-platform mobile team.

三部では、クロスプラットフォームのモバイルチームに関連した組織的な挑戦を列挙する。

>In part four, we highlight where we stand with React Native today and what its future at Airbnb looks like.

四部では、今日我々が React Native のどこを支持し、Airbnb における役割がどんなものかを、浮き彫りにする。

>In part five, we take our top learnings from React Native and use them to make native even better.

五部では、React Native から最も学んだことと、ネイティブをもっと良くするための React Native の利用について扱う。
