import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:nippo/models/entities/post.dart';

class PostRepository {
  final Firestore fireStore = Firestore.instance;
  static const String collection = 'posts';
  final int limit = 20; //TODO(tsuruoka):仮

  void fetchSnapshot({Function(QuerySnapshot) func}) {
    print('PostRepository -> fetchSnapshot');
    fireStore
        .collection(collection)
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .snapshots()
        .listen(func);
  }

  Future<List<Post>> fetchByUser({@required String uid}) async {
    print('PostRepository -> fetchByUser');
    final posts = await fireStore
        .collection('users')
        .document(uid)
        .collection(collection)
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .getDocuments();
    final postList = <Post>[];
    for (final post in posts.documents) {
      final p = Post.fromJson(post.data);
      postList.add(p);
    }
    return postList;
  }

//  usersコレクションのサブコレクションとして追加する.
  Future<void> createPost({Post post, String uid}) async {
    print('PostRepository -> createPost');
    post.createdAt = Timestamp.fromDate(DateTime.now());
    final map = post.toJson();
    await fireStore
        .collection('users')
        .document(uid)
        .collection(collection)
        .document()
        .setData(map);
  }
}
