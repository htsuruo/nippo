import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/core/authentication/auth_provider.dart';
import 'package:nippo/core/const.dart';
import 'package:nippo/features/post/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_repository.g.dart';

@riverpod
PostRepository postRepository(PostRepositoryRef ref) => PostRepository(ref);

class PostRepository {
  PostRepository(this._ref);
  final Ref _ref;
  final _firestore = FirebaseFirestore.instance;
  late final _selfRef = _firestore
      .collection(Collection.users)
      .doc(_ref.read(uidProvider).value)
      .collection(Collection.posts)
      .withConverter<Post>(
        fromFirestore: (snapshot, options) => Post.fromJson(snapshot.data()!),
        toFirestore: (post, options) => post.toJson(),
      );

  Future<DocumentReference<Post>> create({required Post post}) =>
      _selfRef.add(post);
}
