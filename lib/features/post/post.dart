import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_converter_helper/json_converter_helper.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  @allJsonConvertersSerializable
  const factory Post({
    // コレクショングループで引用するためにフィールドにドキュメントIDを持たせる必要がある
    // [uid]/posts/[postId] というパスにしたほうが良さそう。
    // 投稿はユーザーの所有物なのでそれが正しいはず
    // ref. https://zenn.dev/tsuruo/articles/142d35b5e6395c
    required String postId,
    required String title,
    required String description,
    @Default(UnionTimestamp.serverTimestamp()) UnionTimestamp updatedAt,
    @Default(UnionTimestamp.serverTimestamp()) UnionTimestamp createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
