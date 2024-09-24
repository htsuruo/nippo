![README](./.github/images/nippo_readme_eyecatch.png)

[![Flutter](https://github.com/htsuruo/nippo/actions/workflows/flutter.yml/badge.svg)](https://github.com/htsuruo/nippo/actions/workflows/flutter.yml)

# NIPPO

- 毎日の学びを、もっと楽しく、わかりやすく。
- シンプルな日報投稿型のSNS
- Flutter + Firebaseの学習用プロジェクト

**[View Demo](https://nippo-e8922.web.app)**

※デモは現在 [#32](https://github.com/htsuruo/nippo/issues/32) のため利用できません。

## Get started

### 1. Firebaseプロジェクトの作成

1.`.firebaserc`のデフォルトプロジェクトをご自身のFirebaseプロジェクトIDに変更してください。

```yaml
{
  "projects": {
    "default": "nippo-e8922"
  }
}
```

2.Firebaseプロジェクトに関する情報はgit管理対象外のため、下記コマンドにてお手元のFirebaseプロジェクトにてセットアップしてください。
   - 事前に[flutterfire_cli | Dart Package](https://pub.dev/packages/flutterfire_cli)のインストールが必要です
   - 参考: [Add Firebase to your Flutter app](https://firebase.google.com/docs/flutter/setup?platform=ios)

```sh
flutterfire configure
```

### 2. App Checkのデバッグトークンを登録

Firebase コンソールからApp Checkのデバッグトークンを登録します。デバッグトークンを自身のFirebaseプロジェクトに登録しておくことで、開発環境でリクエストが弾かれないようにします。

ref. [Use App Check with the debug provider with Flutter  |  Firebase App Check](https://firebase.google.com/docs/app-check/flutter/debug-provider)

#### Androidの場合

`flutter run`でデバッグコンソールに以下のようにデバッグトークンが出力されますので、これをFirebaseコンソールに登録します。

```bash
D/com.google.firebase.appcheck.debug.internal.DebugAppCheckProvider(10075): Enter this debug secret into the allow list in the Firebase Console for your project: xxxxxxx
```

#### iOSの場合

- Apple Developer Programから「Device Check」を有効にした`.p8`の認証キーをFirebaseコンソールに登録
- `-FIRDebugEnabled`をRunのArgumentsに登録

詳細: https://firebase.google.com/docs/app-check/flutter/debug-provider#apple_platforms

## 機能要件

1. **日報**
   - 投稿された全ての日報が一覧で表示できる
   - 日報詳細画面で件名と全文が表示できる
   - プロフィール画面では選択されたユーザーの日報のみが一覧で表示できる
   - 自分の日報を作成できる

2. **認証・ユーザー**
   - Google認証でユーザー登録・ログインができる
   - ログアウトができる
   - ログインしているユーザーの名前,プロフィール画像,uidが表示できる

3. **設定**
   - 認証プロバイダおよび最終ログインなどのログイン情報が閲覧できる
   - アプリケーション情報や来線図情報が閲覧できる

## セキュリティ周り

本レポジトリはFirebase APIキーを公開していますが、データリソースへのアクセスを筆頭に、APIの不正利用からの保護を行っているため、第三者からの意図しないリクエストで超過料金が請求されるなどのリスクが無いように配慮しています。また、第三者からの攻撃だけでなく開発者の実装ミス（ex. Cloud Functionsの無限ループミス）などによる事故に気づけるよう、[Cloud Billingの予算アラート](https://cloud.google.com/billing/docs/how-to/budgets?hl=ja)を設定し気付けるようにしています。

- APIキーの制限
- APIリソースの保護（App Check）
- データの保護（Security Rule）

※本アプリケーションでは未設定ですが、[Using Cloud Monitoring to monitor App Check and Security Rules](https://firebase.blog/posts/2022/12/monitoring-app-check-and-rules/) のようにCloud Monitoringで閾値を設定し、Slackなどにレポートする形も良さそうです。

### APIキーの制限

各プラットフォームのAPIキーが利用可能なドメイン等をホワイトリストで管理し、アクセス元を制限しています。具体的には、Google Cloud コンソールの認証情報によりAPIキーを制限を設定しています。これにより、ホワイトリスト以外のクライアントからAPIキーが利用されるのを防ぎます。

| プラットフォーム | 制限内容 |
| --- | --- |
| iOS+,Android | `com.htsuruo.nippo`のバンドルID,パッケージ名のみ利用を制限 |
| Web | Firebase Hostingのデフォルトサイトおよび独自のドメインに制限 |

### APIリソースの保護

Firebase App Checkを有効化（Enforcement）し、本アプリケーションで有効化しているAPIリソースに対する不正なAPIアクセスをブロックしています。APIキーの制限ではドメインなりすましやシミュレータ実行で迂回されてしまう可能性がありますが、App Checkでは検証された実機以外からのアクセスを受け付けません。

- ref. [Flutter アプリで App Check を使ってみる  |  Firebase ドキュメント](https://firebase.google.com/docs/app-check/flutter/default-providers?hl=ja)

### データの保護

本アプリケーションはCloud Firestore を利用しているため、セキュリティルールによって保護しています。
サービス提供において最も重要なインシデントである、ユーザー情報の漏洩やサービスの深刻な破壊がされるリスクを防ぎます。
また、アプリケーションの利用者が他人のデータを勝手に編集・削除するような、想定されない操作を制限しアプリケーションのデータを健全に保ちます。また、[単体テスト](https://github.com/htsuruo/nippo/tree/main/firebase/functions/src/test/rules)にて意図通りのルール設定になっていることを検証済です。

- ref. https://github.com/htsuruo/nippo/blob/main/firebase/firestore.rules
