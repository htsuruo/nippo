// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      uid: json['uid'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '名無しさん',
      providerData: json['providerData'] as String?,
      lastSignInTime: json['lastSignInTime'] as String?,
      description: json['description'] as String? ?? 'よろしくおねがいします。',
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'displayName': instance.displayName,
      'providerData': instance.providerData,
      'lastSignInTime': instance.lastSignInTime,
      'description': instance.description,
    };
