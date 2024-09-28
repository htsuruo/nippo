import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:json_converter_helper/json_converter_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../user/model/user.dart';
import '../user/user_provider.dart';

part 'post_repository.g.dart';

@riverpod
PostRepository postRepository(PostRepositoryRef ref) => PostRepository(ref);

class PostRepository {
  PostRepository(this._ref);
  final Ref _ref;

  void create({required Post post}) {
    final auth = _ref.read(authUserProvider).value;
    if (auth == null) {
      throw Exception('User is not authenticated');
    }
    usersRef.doc(auth.id).posts.add(post);
  }

  void update({
    required Post post,
  }) {
    final auth = _ref.read(authUserProvider).value;
    if (auth == null) {
      throw Exception('User is not authenticated');
    }
    usersRef.doc(auth.id).posts.doc(post.id).update(
          updatedAt: const UnionTimestamp.serverTimestamp(),
        );
  }

  void delete({required Post post}) {
    final auth = _ref.read(authUserProvider).value;
    if (auth == null) {
      throw Exception('User is not authenticated');
    }
    usersRef.doc(auth.id).posts.doc(post.id).delete();
  }
}
