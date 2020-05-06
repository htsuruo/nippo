import 'package:flutter/material.dart';

class User {
  User({
    @required this.uid,
    this.email,
    this.photoUrl,
    this.displayName,
    this.providerData,
    this.lastSignInTime,
  });
  final String uid;
  final String email;
  final String photoUrl;
  final String displayName;
  final String providerData;
  final DateTime lastSignInTime;
}
