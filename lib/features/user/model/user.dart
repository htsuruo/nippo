import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_converter_helper/json_converter_helper.dart';
import 'package:nippo/core/const.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @allJsonConvertersSerializable
  const factory User({
    @Default('名無し') String name,
    required String email,
    required String? photoUrl,
    @Default(UnionTimestamp.serverTimestamp()) UnionTimestamp updatedAt,
    @Default(UnionTimestamp.serverTimestamp()) UnionTimestamp createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@Collection<User>(CollectionName.users)
final usersRef = UserCollectionReference();
