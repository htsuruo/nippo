import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nippo/models/entities/user.dart';

//part 'post.g.dart';
//
//@JsonSerializable()
//class Post {
//  Post({
//    @required this.title,
//    this.description,
//    this.createdAt,
//    this.userRef,
//    this.user,
//  });
//  final String title;
//  final String description;
//  final Timestamp createdAt;
//  final DocumentReference userRef;
//  final User user;
//  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
//  Map<String, dynamic> toJson() => _$PostToJson(this);
//}

class Post {
  Post({
    @required this.title,
    this.description,
    this.createdAt,
    this.userRef,
    this.user,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'].toString(),
      description: json['description'].toString(),
      createdAt: json['createdAt'] as Timestamp,
      userRef: json['userRef'] as DocumentReference,
    );
  }

  String title;
  String description;
  Timestamp createdAt;
  DocumentReference userRef;
  User user;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'description': description,
        'createdAt': createdAt,
        'userRef': userRef,
      };
}
