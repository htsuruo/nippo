import 'package:flutter/cupertino.dart';
import 'package:nippo/models/entities/post.dart';
import 'package:nippo/models/entities/user.dart';

class AuthState {
  AuthState({@required this.user, @required this.posts});
  User user;
  List<Post> posts;
}
