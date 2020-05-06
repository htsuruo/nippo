import 'package:flutter/material.dart';

class Post {
  Post({
    @required this.title,
    this.description,
    this.date,
    @required this.uid,
  });
  final String title;
  final String description;
  final String date;
  final String uid;
}
