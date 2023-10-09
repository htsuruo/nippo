import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nippo/core/const.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../user/user_provider.dart';
import 'post.dart';

part 'post_provider.g.dart';

@riverpod
CollectionReference<Post> userPostRef(UserPostRefRef ref) {
  return ref
      .watch(userRefProvider)
      .collection(Collection.posts)
      .withConverter<Post>(
        fromFirestore: (snapshot, options) => Post.fromJson(snapshot.data()!),
        toFirestore: (post, options) => post.toJson(),
      );
}

@riverpod
Stream<List<Post>> posts(PostsRef ref) {
  return ref.watch(userPostRefProvider).snapshots().map(
        (snapshot) =>
            snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList(),
      );
}
