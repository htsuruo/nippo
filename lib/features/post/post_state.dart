import 'package:freezed_annotation/freezed_annotation.dart';

import 'post.dart';

part 'post_state.freezed.dart';

@freezed
class PostState with _$PostState {
  const factory PostState({
    @Default([]) List<Post> posts,
    @Default([]) List<Post> postsByUserId,
  }) = _PostState;
}
