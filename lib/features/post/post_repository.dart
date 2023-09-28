import 'package:cloud_firestore/cloud_firestore.dart';

import 'post.dart';

class PostRepository {
  final firestore = FirebaseFirestore.instance;
  static const String collection = 'posts';
  final int limit = 20; // TODO(tsuruoka): 仮

  void fetchSnapshot({required Function(QuerySnapshot) func}) {
    firestore
        .collection(collection)
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .snapshots()
        .listen(func);
  }

  Future<List<Post>> fetchByUser({required String uid}) async {
    final posts = await firestore
        .collection('users')
        .doc(uid)
        .collection(collection)
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .get();
    final postList = <Post>[];
    for (final post in posts.docs) {
      final p = Post.fromJson(post.data());
      postList.add(p);
    }
    return postList;
  }

//  usersコレクションのサブコレクションとして追加する.
  Future<void> create({required Post post, required String uid}) async {
    // post.createdAt = Timestamp.fromDate(DateTime.now());
    final map = post.toJson();
    await firestore
        .collection('users')
        .doc(uid)
        .collection(collection)
        .doc()
        .set(map);
  }
}
