import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/features/post/post.dart';
import 'package:nippo/features/post/post_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_repository.g.dart';

@riverpod
PostRepository postRepository(PostRepositoryRef ref) => PostRepository(ref);

class PostRepository {
  PostRepository(this._ref);
  final Ref _ref;

  Future<DocumentReference<Post>> create({required Post post}) =>
      _ref.read(userPostRefProvider).add(post);
}
