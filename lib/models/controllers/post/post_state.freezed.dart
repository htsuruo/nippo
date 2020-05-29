// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PostStateTearOff {
  const _$PostStateTearOff();

  _PostState call({List<Post> posts, List<Post> postsByUserId}) {
    return _PostState(
      posts: posts,
      postsByUserId: postsByUserId,
    );
  }
}

// ignore: unused_element
const $PostState = _$PostStateTearOff();

mixin _$PostState {
  List<Post> get posts;
  List<Post> get postsByUserId;

  $PostStateCopyWith<PostState> get copyWith;
}

abstract class $PostStateCopyWith<$Res> {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) then) =
      _$PostStateCopyWithImpl<$Res>;
  $Res call({List<Post> posts, List<Post> postsByUserId});
}

class _$PostStateCopyWithImpl<$Res> implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._value, this._then);

  final PostState _value;
  // ignore: unused_field
  final $Res Function(PostState) _then;

  @override
  $Res call({
    Object posts = freezed,
    Object postsByUserId = freezed,
  }) {
    return _then(_value.copyWith(
      posts: posts == freezed ? _value.posts : posts as List<Post>,
      postsByUserId: postsByUserId == freezed
          ? _value.postsByUserId
          : postsByUserId as List<Post>,
    ));
  }
}

abstract class _$PostStateCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory _$PostStateCopyWith(
          _PostState value, $Res Function(_PostState) then) =
      __$PostStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Post> posts, List<Post> postsByUserId});
}

class __$PostStateCopyWithImpl<$Res> extends _$PostStateCopyWithImpl<$Res>
    implements _$PostStateCopyWith<$Res> {
  __$PostStateCopyWithImpl(_PostState _value, $Res Function(_PostState) _then)
      : super(_value, (v) => _then(v as _PostState));

  @override
  _PostState get _value => super._value as _PostState;

  @override
  $Res call({
    Object posts = freezed,
    Object postsByUserId = freezed,
  }) {
    return _then(_PostState(
      posts: posts == freezed ? _value.posts : posts as List<Post>,
      postsByUserId: postsByUserId == freezed
          ? _value.postsByUserId
          : postsByUserId as List<Post>,
    ));
  }
}

class _$_PostState with DiagnosticableTreeMixin implements _PostState {
  const _$_PostState({this.posts, this.postsByUserId});

  @override
  final List<Post> posts;
  @override
  final List<Post> postsByUserId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostState(posts: $posts, postsByUserId: $postsByUserId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostState'))
      ..add(DiagnosticsProperty('posts', posts))
      ..add(DiagnosticsProperty('postsByUserId', postsByUserId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostState &&
            (identical(other.posts, posts) ||
                const DeepCollectionEquality().equals(other.posts, posts)) &&
            (identical(other.postsByUserId, postsByUserId) ||
                const DeepCollectionEquality()
                    .equals(other.postsByUserId, postsByUserId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(posts) ^
      const DeepCollectionEquality().hash(postsByUserId);

  @override
  _$PostStateCopyWith<_PostState> get copyWith =>
      __$PostStateCopyWithImpl<_PostState>(this, _$identity);
}

abstract class _PostState implements PostState {
  const factory _PostState({List<Post> posts, List<Post> postsByUserId}) =
      _$_PostState;

  @override
  List<Post> get posts;
  @override
  List<Post> get postsByUserId;
  @override
  _$PostStateCopyWith<_PostState> get copyWith;
}
