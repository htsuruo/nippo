import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nippo/core/const.dart';
import 'package:nippo/features/user/model/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_provider.g.dart';

@riverpod
Stream<List<Post>> posts(PostsRef ref) {
  return postsQuery
      .orderBy(FieldName.createdAt, descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((p) => p.data()).toList());
}

@riverpod
Stream<Post?> post(
  PostRef ref, {
  String? postId,
  String? uid,
}) {
  if (uid == null) {
    // コレクショングループで取得
    return postsQuery
        .where(FieldName.postId, isEqualTo: postId)
        .snapshots()
        .map((s) => s.docs.map((e) => e.data()).firstOrNull);
  }

  // ドキュメントで取得
  return usersRef.doc(uid).posts.doc(postId).snapshots().map((e) => e.data);
}

@riverpod
Stream<List<Post>> userPosts(
  UserPostsRef ref,
  String uid,
) {
  return postsQuery
      .orderBy(FieldName.createdAt, descending: true)
      .snapshots()
      .map(
        (snapshot) => snapshot.docs.map((p) => p.data()).toList(),
      );
}
