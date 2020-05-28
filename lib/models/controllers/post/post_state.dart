import 'package:nippo/models/entities/post.dart';

class PostState {
  PostState({this.posts, this.postsByUserId});
  final List<Post> posts;
  final List<Post> postsByUserId;
}
