import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nippo/models/entities/post.dart';

part 'post_state.freezed.dart';

@freezed
class PostState with _$PostState {
  const factory PostState({
    required List<Post> posts,
    required List<Post> postsByUserId,
  }) = _PostState;
}
