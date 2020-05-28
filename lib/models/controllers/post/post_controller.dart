import 'package:nippo/models/controllers/post/post_state.dart';
import 'package:nippo/models/repositories/post_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class PostController extends StateNotifier<PostState> with LocatorMixin {
  PostController() : super(PostState(posts: []));

  @override
  Future<void> initState() async {
    // TODO(tsuru): implement initState
    state = PostState(posts: await PostRepository().fetchAll());
  }
}
