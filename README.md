![README](./.github/images/nippo_readme_eyecatch.png)

[![Flutter](https://github.com/htsuruo/nippo/actions/workflows/flutter.yml/badge.svg)](https://github.com/htsuruo/nippo/actions/workflows/flutter.yml)

# NIPPO

- 毎日の学びを、もっと楽しく、わかりやすく。
- シンプルな日報投稿型のSNS
- Flutter + Firebaseの学習用プロジェクト

**[View Demo](https://nippo-e8922.web.app)**

## セットアップ

1. `.firebaserc`のデフォルトプロジェクトをご自身のFirebaseプロジェクトIDに変更してください。

```yaml
{
  "projects": {
    "default": "nippo-e8922"
  }
}
```

2. Firebaseプロジェクトに関する情報はgit管理対象外のため、下記コマンドにてお手元のFirebaseプロジェクトにてセットアップしてください。
   - 事前に[flutterfire_cli | Dart Package](https://pub.dev/packages/flutterfire_cli)のインストールが必要です
   - 参考: [Add Firebase to your Flutter app](https://firebase.google.com/docs/flutter/setup?platform=ios)

```sh
flutter configure
```

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
   - アプリケーション情報やらいせんず情報が閲覧できる
