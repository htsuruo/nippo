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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
// コレクショングループで引くためにフィールドにドキュメントIDをもたせる必要がある
// フォームからインプットする時点ではドキュメントIDが決まらないのでnullableにしておく
// 利用時には`late final`の非null版を利用すること
  @Deprecated('Use late field postId instead')
  @JsonKey(name: Field.postId)
  String? get nullablePostId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  UnionTimestamp get updatedAt => throw _privateConstructorUsedError;
  UnionTimestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {@Deprecated('Use late field postId instead')
      @JsonKey(name: Field.postId)
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

  @override
  @pragma('vm:prefer-inline')
  $UnionTimestampCopyWith<$Res> get updatedAt {
    return $UnionTimestampCopyWith<$Res>(_value.updatedAt, (value) {
      return _then(_value.copyWith(updatedAt: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UnionTimestampCopyWith<$Res> get createdAt {
    return $UnionTimestampCopyWith<$Res>(_value.createdAt, (value) {
      return _then(_value.copyWith(createdAt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$_PostCopyWith(_$_Post value, $Res Function(_$_Post) then) =
      __$$_PostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Deprecated('Use late field postId instead')
      @JsonKey(name: Field.postId)
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
class __$$_PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res, _$_Post>
    implements _$$_PostCopyWith<$Res> {
  __$$_PostCopyWithImpl(_$_Post _value, $Res Function(_$_Post) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nullablePostId = freezed,
    Object? title = null,
    Object? description = null,
    Object? updatedAt = null,
    Object? createdAt = null,
  }) {
    return _then(_$_Post(
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
class _$_Post extends _Post {
  _$_Post(
      {@Deprecated('Use late field postId instead')
      @JsonKey(name: Field.postId)
      this.nullablePostId,
      required this.title,
      required this.description,
      this.updatedAt = const UnionTimestamp.serverTimestamp(),
      this.createdAt = const UnionTimestamp.serverTimestamp()})
      : super._();

  factory _$_Post.fromJson(Map<String, dynamic> json) => _$$_PostFromJson(json);

// コレクショングループで引くためにフィールドにドキュメントIDをもたせる必要がある
// フォームからインプットする時点ではドキュメントIDが決まらないのでnullableにしておく
// 利用時には`late final`の非null版を利用すること
  @override
  @Deprecated('Use late field postId instead')
  @JsonKey(name: Field.postId)
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Post &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, nullablePostId, title, description, updatedAt, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostCopyWith<_$_Post> get copyWith =>
      __$$_PostCopyWithImpl<_$_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostToJson(
      this,
    );
  }
}

abstract class _Post extends Post {
  factory _Post(
      {@Deprecated('Use late field postId instead')
      @JsonKey(name: Field.postId)
      final String? nullablePostId,
      required final String title,
      required final String description,
      final UnionTimestamp updatedAt,
      final UnionTimestamp createdAt}) = _$_Post;
  _Post._() : super._();

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override // コレクショングループで引くためにフィールドにドキュメントIDをもたせる必要がある
// フォームからインプットする時点ではドキュメントIDが決まらないのでnullableにしておく
// 利用時には`late final`の非null版を利用すること
  @Deprecated('Use late field postId instead')
  @JsonKey(name: Field.postId)
  String? get nullablePostId;
  @override
  String get title;
  @override
  String get description;
  @override
  UnionTimestamp get updatedAt;
  @override
  UnionTimestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_PostCopyWith<_$_Post> get copyWith => throw _privateConstructorUsedError;
}
