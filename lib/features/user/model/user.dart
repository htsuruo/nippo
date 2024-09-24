import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_converter_helper/json_converter_helper.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Collection<User>('users')
@freezed
class User with _$User {
  // @allJsonConvertersSerializable
  @JsonSerializable(
    converters: [
      ...firestoreJsonConverters,
      ...allJsonConverters,
    ],
  )
  const factory User({
    @Default('名無し') String name,
    required String email,
    required String? photoUrl,
    @Default(UnionTimestamp.serverTimestamp()) UnionTimestamp updatedAt,
    @Default(UnionTimestamp.serverTimestamp()) UnionTimestamp createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

final usersRef = UserCollectionReference();
