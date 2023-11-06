// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'post_form_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostFormState _$$_PostFormStateFromJson(Map<String, dynamic> json) =>
    _$_PostFormState(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      postRef: _$JsonConverterFromJson<Object, DocumentReference<Post>>(
          json['postRef'], const PostRefConverter().fromJson),
    );

Map<String, dynamic> _$$_PostFormStateToJson(_$_PostFormState instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'postRef': _$JsonConverterToJson<Object, DocumentReference<Post>>(
          instance.postRef, const PostRefConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
