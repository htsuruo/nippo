import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nippo/models/post.dart';

class PostRepository {
  final Firestore fireStore = Firestore.instance;
  static const String collection = 'posts';

  Future<List<Post>> fetchAll() async {
    print('PostRepository -> fetchAll');
    final posts = await fireStore
        .collection(collection)
        .orderBy('date', descending: true)
        .getDocuments();
    final postList = <Post>[];
    for (final post in posts.documents) {
      final p = Post.fromJson(post.data);
      print(p);
      postList.add(p);
    }
    return postList;
  }

  Future<void> createPost({Post post}) async {
    print('PostRepository -> createPost');
    final map = post.toJson();
    await fireStore.collection(collection).document().setData(map);
  }
}
