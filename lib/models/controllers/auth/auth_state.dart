import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nippo/models/entities/post.dart';
import 'package:nippo/models/entities/user.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(null) User user,
    @Default(<Post>[]) List<Post> posts,
  }) = _AuthState;
}
