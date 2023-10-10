import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/core/const.dart';
import 'package:nippo/features/post/post.dart';
import 'package:nippo/features/post/post_provider.dart';
import 'package:nippo/features/user/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_repository.g.dart';

@riverpod
PostRepository postRepository(PostRepositoryRef ref) => PostRepository(ref);

class PostRepository {
  PostRepository(this._ref);
  final Ref _ref;

  Future<void> create({
    required String title,
    required String description,
  }) async {
    // Post作成時にドキュメントIDを付与したいため事前に取得する
    // REVIEW(htsuruo): addして返ってきたドキュメントIDを使いupdateする方法もあるが
    // postIdをnullableにしないといけない点とFirestoreの書き込み回数が増えてコストが微増するのでこの形にしているが不自然ではある。
    final postId =
        _ref.read(userRefProvider).collection(Collection.posts).doc().id;
    return _ref.read(selfPostRefProvider).doc(postId).set(
          Post(postId: postId, title: title, description: description),
        );
  }
}
