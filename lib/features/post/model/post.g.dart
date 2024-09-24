// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      nullablePostId: json['postId'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      updatedAt: json['updatedAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : const UnionTimestampConverter()
              .fromJson(json['updatedAt'] as Object),
      createdAt: json['createdAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : const UnionTimestampConverter()
              .fromJson(json['createdAt'] as Object),
    );

const _$$PostImplFieldMap = <String, String>{
  'nullablePostId': 'postId',
  'title': 'title',
  'description': 'description',
  'updatedAt': 'updatedAt',
  'createdAt': 'createdAt',
};

abstract final class _$$PostImplJsonKeys {
  static const String nullablePostId = 'postId';
  static const String title = 'title';
  static const String description = 'description';
  static const String updatedAt = 'updatedAt';
  static const String createdAt = 'createdAt';
}

// ignore: unused_element
abstract class _$$PostImplPerFieldToJson {
  // ignore: unused_element
  static Object? nullablePostId(String? instance) => instance;
  // ignore: unused_element
  static Object? title(String instance) => instance;
  // ignore: unused_element
  static Object? description(String instance) => instance;
  // ignore: unused_element
  static Object? updatedAt(UnionTimestamp instance) =>
      const UnionTimestampConverter().toJson(instance);
  // ignore: unused_element
  static Object? createdAt(UnionTimestamp instance) =>
      const UnionTimestampConverter().toJson(instance);
}

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'postId': instance.nullablePostId,
      'title': instance.title,
      'description': instance.description,
      'updatedAt': const UnionTimestampConverter().toJson(instance.updatedAt),
      'createdAt': const UnionTimestampConverter().toJson(instance.createdAt),
    };
