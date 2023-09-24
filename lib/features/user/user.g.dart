// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      name: json['name'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String?,
      signInProviders: json['signInProviders'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'signInProviders': instance.signInProviders,
    };
