// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    throw UnsupportedError(
      '''本ファイルは`firebase_options.dart`をgit監視対象外としている影響でCIが失敗するため作成したダミーです。
      実際は`flutterfire configure`で生成された`firebase_options.dart`を使用してください。''',
    );
  }
}
