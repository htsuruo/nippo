import 'package:flutter/material.dart';

class Post {
  Post({
    @required this.title,
    this.description,
    this.date,
    @required this.uid,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'].toString(),
      description: json['description'].toString(),
      date: json['date'].toString(),
      uid: json['createUser'].toString(),
    );
  }

  String title;
  String description;
  String date;
  String uid;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'description': description,
        'date': date,
        'createUser': uid,
      };
}
