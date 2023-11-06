import 'package:cloud_firestore/cloud_firestore.dart';
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

  void create({required Post post}) {
    final doc = _ref.read(selfPostRefProvider).doc();
    doc.set(post.copyWith(nullablePostId: doc.id));
  }

  Future<void> update({
    required DocumentReference<Post> reference,
    required Post post,
  }) =>
      reference.update(post.toJson());

  void delete({required DocumentReference<Post> postRef}) => postRef.delete();
}
