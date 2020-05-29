// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$UserStateTearOff {
  const _$UserStateTearOff();

  _UserState call({List<User> users = const <User>[]}) {
    return _UserState(
      users: users,
    );
  }
}

// ignore: unused_element
const $UserState = _$UserStateTearOff();

mixin _$UserState {
  List<User> get users;

  $UserStateCopyWith<UserState> get copyWith;
}

abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
  $Res call({List<User> users});
}

class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;

  @override
  $Res call({
    Object users = freezed,
  }) {
    return _then(_value.copyWith(
      users: users == freezed ? _value.users : users as List<User>,
    ));
  }
}

abstract class _$UserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$UserStateCopyWith(
          _UserState value, $Res Function(_UserState) then) =
      __$UserStateCopyWithImpl<$Res>;
  @override
  $Res call({List<User> users});
}

class __$UserStateCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$UserStateCopyWith<$Res> {
  __$UserStateCopyWithImpl(_UserState _value, $Res Function(_UserState) _then)
      : super(_value, (v) => _then(v as _UserState));

  @override
  _UserState get _value => super._value as _UserState;

  @override
  $Res call({
    Object users = freezed,
  }) {
    return _then(_UserState(
      users: users == freezed ? _value.users : users as List<User>,
    ));
  }
}

class _$_UserState with DiagnosticableTreeMixin implements _UserState {
  const _$_UserState({this.users = const <User>[]}) : assert(users != null);

  @JsonKey(defaultValue: const <User>[])
  @override
  final List<User> users;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserState(users: $users)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserState'))
      ..add(DiagnosticsProperty('users', users));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserState &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(users);

  @override
  _$UserStateCopyWith<_UserState> get copyWith =>
      __$UserStateCopyWithImpl<_UserState>(this, _$identity);
}

abstract class _UserState implements UserState {
  const factory _UserState({List<User> users}) = _$_UserState;

  @override
  List<User> get users;
  @override
  _$UserStateCopyWith<_UserState> get copyWith;
}
