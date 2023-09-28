import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_converter_helper/json_converter_helper.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  @allJsonConvertersSerializable
  const factory Post({
    required String title,
    required String description,
    @Default(UnionTimestamp.serverTimestamp()) UnionTimestamp updatedAt,
    @Default(UnionTimestamp.serverTimestamp()) UnionTimestamp createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
