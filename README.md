![README](https://github.com/HTsuruo/nippo/assets/12729025/2b2730a0-334b-4267-bc81-2dba92c1c394)

# NIPPO

- 毎日の学びを、もっと楽しく、わかりやすく。
- シンプルな日報投稿型のSNS
- Flutter + Firebaseの学習用プロジェクト

## セットアップ

- Firebaseプロジェクトに関する情報はgit管理対象外のため、下記コマンドにてお手元のFirebaseプロジェクトにてセットアップしてください。
  - 参考: [Add Firebase to your Flutter app](https://firebase.google.com/docs/flutter/setup?platform=ios)

```sh
flutter configure
```

## 機能要件

1. **ユーザー管理**
   - ユーザーの登録とログイン機能（Google, メールアドレス）
   - ユーザーごとのプロフィール情報の管理

2. **日報の作成と編集**
   - 日報の作成と保存
   - テキスト入力と編集機能
   - タイトル、日付、カテゴリ、気分情報の追加

3. **日報の閲覧と検索**
   - 日報一覧の表示
   - 日報のソートオプション（日付順）
  
4. **日報へのエンゲージメント**
   - 日報へのいいね機能

## 目的

- 基本的なWidgetの使い方、API（外部データ）連携、webviewや外部ブラウザ起動、sharedpreferenceの値保持、アイコンやスプラッシュなど、アプリ開発において必須となる諸々をFlutterで触ってみて勘所を得ること。
- 予め用意されているWidgetを扱うだけではなく、自作Widgetを作る過程でWidgetの存在をすること（最小コストで何が実現可能かの材料を蓄えること）。
- Widget構築で手が止まらない程度に十分に慣れ、今後の構築スピードを高めること。
- pub.devを十分に活用し、パッケージをストレス無く使えるようになること。
- Flutterで自分がイメージしたデザイン、IFが実現可能か判断すること。
- ネイティブアプリと比べた操作感の違いや違和感を把握すること。
- CodeMagicなどでCI/CDを回し、TestFlightなどチーム内での共有フローを把握すること。

## サマリ

- 状態管理はStateNotifierProviderを利用し、単方向データフロー
- Widgetは基本的にStateless Widgetを利用
- 認証はFirebase Auth、DBはFirestoreを利用し足りない部分をCloud functionsで拡張
