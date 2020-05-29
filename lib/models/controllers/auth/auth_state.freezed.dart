// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _AuthState call({@required User user, @required List<Post> posts}) {
    return _AuthState(
      user: user,
      posts: posts,
    );
  }
}

// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

mixin _$AuthState {
  User get user;
  List<Post> get posts;

  $AuthStateCopyWith<AuthState> get copyWith;
}

abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call({User user, List<Post> posts});
}

class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object user = freezed,
    Object posts = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed ? _value.user : user as User,
      posts: posts == freezed ? _value.posts : posts as List<Post>,
    ));
  }
}

abstract class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) then) =
      __$AuthStateCopyWithImpl<$Res>;
  @override
  $Res call({User user, List<Post> posts});
}

class __$AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(_AuthState _value, $Res Function(_AuthState) _then)
      : super(_value, (v) => _then(v as _AuthState));

  @override
  _AuthState get _value => super._value as _AuthState;

  @override
  $Res call({
    Object user = freezed,
    Object posts = freezed,
  }) {
    return _then(_AuthState(
      user: user == freezed ? _value.user : user as User,
      posts: posts == freezed ? _value.posts : posts as List<Post>,
    ));
  }
}

class _$_AuthState with DiagnosticableTreeMixin implements _AuthState {
  const _$_AuthState({@required this.user, @required this.posts})
      : assert(user != null),
        assert(posts != null);

  @override
  final User user;
  @override
  final List<Post> posts;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState(user: $user, posts: $posts)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState'))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('posts', posts));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthState &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.posts, posts) ||
                const DeepCollectionEquality().equals(other.posts, posts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(posts);

  @override
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState({@required User user, @required List<Post> posts}) =
      _$_AuthState;

  @override
  User get user;
  @override
  List<Post> get posts;
  @override
  _$AuthStateCopyWith<_AuthState> get copyWith;
}
