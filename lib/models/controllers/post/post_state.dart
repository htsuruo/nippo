import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nippo/models/entities/post.dart';

part 'post_state.freezed.dart';

@freezed
abstract class PostState with _$PostState {
  const factory PostState({
    List<Post> posts,
    List<Post> postsByUserId,
  }) = _PostState;
}
