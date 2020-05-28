import 'package:nippo/models/controllers/post/post_state.dart';
import 'package:nippo/models/repositories/post_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class PostController extends StateNotifier<PostState> with LocatorMixin {
  PostController({this.uid}) : super(PostState(posts: []));
  final String uid;

  @override
  Future<void> initState() async {
    // TODO(tsuru): implement initState
    if (uid == null) {
      state = PostState(
        posts: await PostRepository().fetchAll(),
        postsByUserId: null,
      );
    } else {
      state = PostState(
        posts: null,
        postsByUserId: await PostRepository().fetchByUser(uid: uid),
      );
    }
  }
}
