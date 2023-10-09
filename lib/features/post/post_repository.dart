import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/core/const.dart';
import 'package:nippo/features/post/post.dart';
import 'package:nippo/features/user/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_repository.g.dart';

@riverpod
PostRepository postRepository(PostRepositoryRef ref) => PostRepository(ref);

class PostRepository {
  PostRepository(this._ref);
  final Ref _ref;
  late final _selfRef = _ref
      .read(userRefProvider)
      .collection(Collection.posts)
      .withConverter<Post>(
        fromFirestore: (snapshot, options) => Post.fromJson(snapshot.data()!),
        toFirestore: (post, options) => post.toJson(),
      );

  Future<DocumentReference<Post>> create({required Post post}) =>
      _selfRef.add(post);
}
