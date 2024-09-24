// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
// コレクショングループで引くためにフィールドにドキュメントIDをもたせる必要がある
// フォームからインプットする時点ではドキュメントIDが決まらないのでnullableにしておく
// 利用時には`late final`の非null版を利用すること
  @Deprecated('Use late field postId instead')
  @JsonKey(name: FieldName.postId)
  String? get nullablePostId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  UnionTimestamp get updatedAt => throw _privateConstructorUsedError;
  UnionTimestamp get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {@Deprecated('Use late field postId instead')
      @JsonKey(name: FieldName.postId)
      String? nullablePostId,
      String title,
      String description,
      UnionTimestamp updatedAt,
      UnionTimestamp createdAt});

  $UnionTimestampCopyWith<$Res> get updatedAt;
  $UnionTimestampCopyWith<$Res> get createdAt;
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nullablePostId = freezed,
    Object? title = null,
    Object? description = null,
    Object? updatedAt = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      nullablePostId: freezed == nullablePostId
          ? _value.nullablePostId
          : nullablePostId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ) as $Val);
  }

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UnionTimestampCopyWith<$Res> get updatedAt {
    return $UnionTimestampCopyWith<$Res>(_value.updatedAt, (value) {
      return _then(_value.copyWith(updatedAt: value) as $Val);
    });
  }

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UnionTimestampCopyWith<$Res> get createdAt {
    return $UnionTimestampCopyWith<$Res>(_value.createdAt, (value) {
      return _then(_value.copyWith(createdAt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Deprecated('Use late field postId instead')
      @JsonKey(name: FieldName.postId)
      String? nullablePostId,
      String title,
      String description,
      UnionTimestamp updatedAt,
      UnionTimestamp createdAt});

  @override
  $UnionTimestampCopyWith<$Res> get updatedAt;
  @override
  $UnionTimestampCopyWith<$Res> get createdAt;
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nullablePostId = freezed,
    Object? title = null,
    Object? description = null,
    Object? updatedAt = null,
    Object? createdAt = null,
  }) {
    return _then(_$PostImpl(
      nullablePostId: freezed == nullablePostId
          ? _value.nullablePostId
          : nullablePostId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ));
  }
}

/// @nodoc

@allJsonConvertersSerializable
class _$PostImpl extends _Post {
  _$PostImpl(
      {@Deprecated('Use late field postId instead')
      @JsonKey(name: FieldName.postId)
      this.nullablePostId,
      required this.title,
      required this.description,
      this.updatedAt = const UnionTimestamp.serverTimestamp(),
      this.createdAt = const UnionTimestamp.serverTimestamp()})
      : super._();

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

// コレクショングループで引くためにフィールドにドキュメントIDをもたせる必要がある
// フォームからインプットする時点ではドキュメントIDが決まらないのでnullableにしておく
// 利用時には`late final`の非null版を利用すること
  @override
  @Deprecated('Use late field postId instead')
  @JsonKey(name: FieldName.postId)
  final String? nullablePostId;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey()
  final UnionTimestamp updatedAt;
  @override
  @JsonKey()
  final UnionTimestamp createdAt;

  @override
  String toString() {
    return 'Post(nullablePostId: $nullablePostId, title: $title, description: $description, updatedAt: $updatedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.nullablePostId, nullablePostId) ||
                other.nullablePostId == nullablePostId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, nullablePostId, title, description, updatedAt, createdAt);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post extends Post {
  factory _Post(
      {@Deprecated('Use late field postId instead')
      @JsonKey(name: FieldName.postId)
      final String? nullablePostId,
      required final String title,
      required final String description,
      final UnionTimestamp updatedAt,
      final UnionTimestamp createdAt}) = _$PostImpl;
  _Post._() : super._();

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

// コレクショングループで引くためにフィールドにドキュメントIDをもたせる必要がある
// フォームからインプットする時点ではドキュメントIDが決まらないのでnullableにしておく
// 利用時には`late final`の非null版を利用すること
  @override
  @Deprecated('Use late field postId instead')
  @JsonKey(name: FieldName.postId)
  String? get nullablePostId;
  @override
  String get title;
  @override
  String get description;
  @override
  UnionTimestamp get updatedAt;
  @override
  UnionTimestamp get createdAt;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
