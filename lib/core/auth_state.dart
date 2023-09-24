import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nippo/features/post/post.dart';

import '../features/user/user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required User user,
    @Default(<Post>[]) List<Post> posts,
  }) = _AuthState;
}
