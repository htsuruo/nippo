import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    required this.uid,
    required this.email,
    this.photoUrl = '',
    this.displayName = '名無しさん',
    this.providerData,
    this.lastSignInTime,
    this.description = 'よろしくおねがいします。',
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
  final String uid;
  final String email;
  final String photoUrl;
  final String displayName;
  final String? providerData;
  final String? lastSignInTime;
  final String description;
}
