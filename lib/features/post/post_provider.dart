import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nippo/core/const.dart';
import 'package:nippo/features/post/model/post_converter.dart';
import 'package:nippo/features/user/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'model/post.dart';

part 'post_provider.g.dart';

// REVIEW(htsuruo): ドキュメントIDが取得できるようにQueryDocumentSnapshotから返すProviderにしてみた。
// ただ、仮にデータソースをFirestoreからSupabaseやREST APIに差し替えたくなった場合は不都合が生じそう。
// List<Post>のデータモデルを返却する形にしておけば、差し替えは容易そうだがFirestoreを使う場合は割り切ったほうが良いのだろうか。
@riverpod
Stream<List<QueryDocumentSnapshot<Post>>> posts(PostsRef ref) {
  return FirebaseFirestore.instance
      .collectionGroup(CollectionName.posts)
      .withPostConverter()
      .orderBy(FieldName.createdAt, descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs);
}

@riverpod
Stream<DocumentSnapshot<Post>?> post(
  PostRef ref, {
  String? postId,
  String? uid,
}) {
  if (uid == null) {
    // コレクショングループで取得
    return FirebaseFirestore.instance
        .collectionGroup(CollectionName.posts)
        .withPostConverter()
        .where(FieldName.postId, isEqualTo: postId)
        .snapshots()
        .map((s) => s.docs.firstOrNull);
  }

  // ドキュメントで取得
  return FirebaseFirestore.instance
      .collection(CollectionName.users)
      .doc(uid)
      .collection(CollectionName.posts)
      .doc(postId)
      .withPostConverter()
      .snapshots();
}

@riverpod
Stream<List<QueryDocumentSnapshot<Post>>> userPosts(
  UserPostsRef ref,
  String uid,
) {
  return FirebaseFirestore.instance
      .collection(CollectionName.users)
      .doc(uid)
      .collection(CollectionName.posts)
      .withPostConverter()
      .orderBy(FieldName.createdAt, descending: true)
      .snapshots()
      .map(
        (snapshot) => snapshot.docs.toList(),
      );
}

@riverpod
CollectionReference<Post> selfPostRef(SelfPostRefRef ref) {
  return ref
      .watch(authUserProvider)
      .collection(CollectionName.posts)
      .withPostConverter();
}
