import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nippo/core/const.dart';
import 'package:nippo/features/user/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'post.dart';

part 'post_provider.g.dart';

class _Converter {
  _Converter._();

  static Post from(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) =>
      Post.fromJson(snapshot.data()!);

  static Map<String, dynamic> to(
    Post post,
    SetOptions? options,
  ) =>
      post.toJson();
}

@riverpod
Stream<List<Post>> posts(PostsRef ref) {
  return FirebaseFirestore.instance
      .collectionGroup(Collection.posts)
      .withConverter<Post>(
        fromFirestore: _Converter.from,
        toFirestore: _Converter.to,
      )
      .snapshots()
      .map(
        (snapshot) =>
            snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList(),
      );
}

@riverpod
Stream<List<Post>> userPosts(UserPostsRef ref, String uid) {
  return FirebaseFirestore.instance
      .collection(Collection.users)
      .doc(uid)
      .collection(Collection.posts)
      .withConverter<Post>(
        fromFirestore: _Converter.from,
        toFirestore: _Converter.to,
      )
      .snapshots()
      .map(
        (snapshot) =>
            snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList(),
      );
}

@riverpod
CollectionReference<Post> selfPostRef(SelfPostRefRef ref) {
  return ref
      .watch(userRefProvider)
      .collection(Collection.posts)
      .withConverter<Post>(
        fromFirestore: _Converter.from,
        toFirestore: _Converter.to,
      );
}
