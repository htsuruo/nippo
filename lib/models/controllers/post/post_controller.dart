import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nippo/models/controllers/post/post_state.dart';
import 'package:nippo/models/entities/post.dart';
import 'package:nippo/models/repositories/post_repository.dart';
import 'package:nippo/models/repositories/user_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class PostController extends StateNotifier<PostState> with LocatorMixin {
  PostController() : super(const PostState());

  @override
  Future<void> initState() async {
    // TODO(tsuru): implement initState
    Future<void> sync(QuerySnapshot querySnapshot) async {
      final posts = <Post>[];
      for (final element in querySnapshot.documents) {
        final post = Post.fromJson(element.data);
        post.user =
            await read<UserRepository>().fetchOneFromRef(ref: post.userRef);
        posts.add(post);
      }
      state = state.copyWith(
        posts: posts,
      );
    }

    read<PostRepository>().fetchSnapshot(func: sync);
  }

  Future<void> fetchByUser({String uid}) async {
    state = state.copyWith(
      postsByUserId: await read<PostRepository>().fetchByUser(uid: uid),
    );
  }
}
