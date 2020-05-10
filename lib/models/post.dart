import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nippo/models/user.dart';

class Post {
  Post({
    @required this.title,
    this.description,
    this.date,
    this.user,
    this.userRef,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'].toString(),
      description: json['description'].toString(),
      date: json['date'].toString(),
      user: json['createUser'] as User,
      userRef: json['createUserRef'] as DocumentReference,
    );
  }

  String title;
  String description;
  String date;
  User user;
  DocumentReference userRef;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'description': description,
        'date': date,
        'createUser': user,
      };
}
