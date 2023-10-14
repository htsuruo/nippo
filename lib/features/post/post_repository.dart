import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/features/post/post_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'model/post.dart';

part 'post_repository.g.dart';

@riverpod
PostRepository postRepository(PostRepositoryRef ref) => PostRepository(ref);

class PostRepository {
  PostRepository(this._ref);
  final Ref _ref;

  Future<void> create({required Post post}) async {
    final doc = _ref.read(selfPostRefProvider).doc();
    await doc.set(post.copyWith(nullablePostId: doc.id));
  }
}
