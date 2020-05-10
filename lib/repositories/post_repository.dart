import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nippo/models/post.dart';
import 'package:nippo/repositories/user_repository.dart';

class PostRepository {
  final Firestore fireStore = Firestore.instance;
  static const String collection = 'posts';

  Future<List<Post>> fetchAll() async {
    print('PostRepository -> fetchAll');
    final posts = await fireStore
        .collection(collection)
        .orderBy('createdAt', descending: true)
        .getDocuments();
    final postList = <Post>[];
    for (final post in posts.documents) {
      final p = Post.fromJson(post.data);
      p.user = await UserRepository().fetchOneFromRef(ref: p.userRef);
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
