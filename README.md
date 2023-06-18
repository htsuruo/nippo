![Web 1280 – 2](https://user-images.githubusercontent.com/12729025/81501633-69178700-9314-11ea-99db-a808c5ffa41b.png)

<img width="944" alt="スクリーンショット 2020-05-25 11 02 27" src="https://user-images.githubusercontent.com/12729025/82771494-3e324480-9e77-11ea-899d-4d2bb3b41cd9.png">

# nippo(iroly)

* 毎日の活動に色をつけていく、日報投稿型のSNS（仮）
* Flutter（Dart2.8） + Firebase
* Flutter学習用のプロジェクト

## 目的

* 基本的なWidgetの使い方、API（外部データ）連携、webviewや外部ブラウザ起動、sharedpreferenceの値保持、アイコンやスプラッシュなど、アプリ開発において必須となる諸々をFlutterで触ってみて勘所を得ること。
* 予め用意されているWidgetを扱うだけではなく、自作Widgetを作る過程でWidgetの存在をすること（最小コストで何が実現可能かの材料を蓄えること）。
* Widget構築で手が止まらない程度に十分に慣れ、今後の構築スピードを高めること。
* pub.devを十分に活用し、パッケージをストレス無く使えるようになること。
* Flutterで自分がイメージしたデザイン、IFが実現可能か判断すること。
* ネイティブアプリと比べた操作感の違いや違和感を把握すること。
* CodeMagicなどでCI/CDを回し、TestFlightなどチーム内での共有フローを把握すること。

## サマリ

* 状態管理はStateNotifierProviderを利用し、単方向データフロー
* Widgetは基本的にStateless Widgetを利用
* 認証はFirebase Auth、DBはFirestoreを利用し足りない部分をCloud functionsで拡張
