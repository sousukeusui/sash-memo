# SashMemo
![readme_top](https://github.com/sousukeusui/sash-memo/assets/75169104/f7abf4d9-cb2e-456e-b27b-68b3b5418bc4)

## 概要
サッシ関連工事の現場調査時の現場情報、施工内容などを保存しておくためのアプリケーションです。<br>

現調内容を紙のメモにまとめようとすると煩雑になりやすく必要な項目のメモ忘れなどがしばしばあります。<br>
SashMemoはフォーマット化されているので現調時のメモ忘れ防止や、素早い現場情報の確認が可能です。<br>
特に採寸データの詳細は図面を用いて表示されるので、寸法の詳細が非常にわかりやすくまとめられます。

## 開発の背景
#### 当初の予定<br>
当初「SashMemo」プロジェクトはポートフォリオを作ることだけに意識を向けて作成しようとしたアプリケーションでした。<br>
アプリ名も違ければ、内容も全く異なったものでした。<br>

当初予定していたものは、施工会社（ユーザー）とそのクライアントの双方で成り立たせるアプリケーションで現在の「SashMemo」より非常に規模の大きいものとなっておりました。<br>
<br>
#### 変更の理由
当初予定していたアプリケーションの大まかな設計を行い、細かい設計を行いたかったので同期にヒアリングを行ったところ、「クライアントを巻き込むので使いにくい」というご指摘受けました。<br>
同時に「こういうアプリが欲しい」と提案され、その内容が「現調メモ」をアプリケーション化するというものでした。<br>

それが「SashMemo」の始まりであり、「現調内容保存」「現場情報管理」「発注状況把握」の問題解決を行うアプリケーションに変更いたしました。<br>
<br>
#### 紙メモの課題
紙のメモの課題が大きく2つありました。<br>
<br>
#####  1.メモ自体を探す手間<br>
1日に何件もの現場を訪れ現調のメモを残すのですが、それが何十件と溜まって行きます。<br>

例えば２週間前に行った現場の内容を少し確認したいと思ってもかなりの時間がかかることは容易に想像ができます。<br>
そもそもどこにメモをしたかわからない場合も同様です。<br>

少し確認したい場合でも時間を要することが課題であり、一元管理を目指すきっかけとなりました。<br>
<br>
#####  2.メモした内容が煩雑<br>
現場のメモは見つかったがまとまりがないメモや急いで書いたメモで、内容の把握が困難だったり寸法の採り忘れに気づくことがしばしばあります。<br>
その原因はメモがフォーマット化されておらず、煩雑になるためです。<br>

現調というものは細かい情報が数多く必要となり、メモが汚くなりがちです。<br>
紙でのフォーマット化も良いですが、一つの現場で紙の枚数が２枚３枚と増えてしまう場合があります。<br>
その結果1が起こり、本末転倒の事態に陥ることが想像できます。<br>

この事態を解決するには紙でのフォーマット化ではなくアプリケーション化するのが良いと思いました。<br>
<br>
##### 感じたこと
以上大きな２つの問題を解決するべく「SashMemo」というアプリケーションを作成いたしました。<br>
想像と実際の現場が求めていることはかなり違うと気づくことができ、要件定義のためのヒアリングがとても重要になってくることにも気づくことができました。
ポートフォリオを作るのではなく実際に使ってくれるサービスを作ろうという意識になりました。<br>

##  機能の説明
| トップページ | 新規登録・ログイン機能 |
|:----:|:----:|
|　![readme_top](https://github.com/sousukeusui/sash-memo/assets/75169104/9461c0ec-2b06-40b6-b5f4-87b42bc19a83)<br>トップページ画面です。<br>サッシのイメージ画像を大きく表示しています。|　![新規登録・ログイン](https://github.com/sousukeusui/sash-memo/assets/75169104/9d6ca542-d589-4f4b-8bd0-96ccc21ed661)<br>新規登録・ログインは<br>メールアドレス以外に「LINE」「Google」が使えます。|

####  現場情報
| 作成機能 | 一覧機能 |
|:----:|:----:|
|　![現場作成](https://github.com/sousukeusui/sash-memo/assets/75169104/96b5c392-bf87-4b38-820b-f1ee825ee50b)|　![現場一覧](https://github.com/sousukeusui/sash-memo/assets/75169104/06b85b4a-afec-4e70-8dd9-37bc816c726f)|

####  現場メモ
| 作成機能 | 一覧機能 |
|:----:|:----:|
|![step1](https://github.com/sousukeusui/sash-memo/assets/75169104/c3f68686-9546-4a8b-b5fe-0dc2cedc54a8)|![現場メモ一覧](https://github.com/sousukeusui/sash-memo/assets/75169104/af27e66a-59fe-4a54-9ded-4045342fd7cc)|

| 詳細機能 | 発注・未発注切り替え |
|:----:|:----:|
![メモ詳細](https://github.com/sousukeusui/sash-memo/assets/75169104/1678436e-3570-4315-af93-e3317bd0d30a)||

##  使用技術


##  ER図
![ER図２](https://github.com/sousukeusui/sash-memo/assets/75169104/6ca50f76-fb29-4e0f-a5cc-430f94cf1178)

##  画面設計
画面設計はfigmaを使って行いました。下記のURLをご参照ください.<br>
https://www.figma.com/design/o1HBirabLqXaRB4qK1M1sY/SashMemo%2B?m=dev&node-id=0-1&t=O8fru7i7Lm1gxhDq-1<br>

## 今後の展望
