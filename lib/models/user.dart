import 'package:flutter/material.dart';

class User {
  User(
      {@required this.uid,
      @required this.email,
      this.photoUrl = '',
      @required this.displayName,
      this.providerData,
      this.lastSignInTime,
      this.description = 'よろしくおねがいします。'});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'].toString(),
      email: json['email'].toString(),
      displayName: json['displayName'].toString(),
      photoUrl: json['photoUrl'].toString(),
      providerData: json['providerData'].toString(),
      lastSignInTime: json['lastSignInTime'].toString(),
      description: json['description'].toString(),
    );
  }

//  in sns login, get fire base auth.
  final String uid;
  final String email;
  final String photoUrl;
  final String displayName;
  final String providerData;
  final String lastSignInTime;

//  custom data.
  final String description;

  Map<String, String> toJson() => {
        'email': email,
        'photoUrl': photoUrl,
        'displayName': displayName,
        'providerData': providerData,
        'lastSignInTime': lastSignInTime.toString(),
        'description': description,
      };
}
