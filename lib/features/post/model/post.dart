import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_converter_helper/json_converter_helper.dart';
import 'package:nippo/core/const.dart';
import 'package:nippo/features/user/model/user.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  @allJsonConvertersSerializable
  factory Post({
    // コレクショングループで引くためにフィールドにドキュメントIDをもたせる必要がある
    // フォームからインプットする時点ではドキュメントIDが決まらないのでnullableにしておく
    // 利用時には`late final`の非null版を利用すること
    @Deprecated('Use late field postId instead')
    @JsonKey(name: FieldName.postId)
    String? nullablePostId,
    required String title,
    required String description,
    @Default(UnionTimestamp.serverTimestamp()) UnionTimestamp updatedAt,
    @Default(UnionTimestamp.serverTimestamp()) UnionTimestamp createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Post._();

  // ignore: deprecated_member_use_from_same_package
  late final String postId = nullablePostId!;
}

@Collection<User>(CollectionName.users)
@Collection<Post>('${CollectionName.users}/*/${CollectionName.posts}')
final postsRef = PostCollectionReference();

extension PostDocumentReferenceX on DocumentReference<Post> {
  String? get uid => parent.parent?.id;
}
