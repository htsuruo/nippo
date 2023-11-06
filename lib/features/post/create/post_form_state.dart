import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_converter_helper/json_converter_helper.dart';
import 'package:nippo/features/post/post_provider.dart';

import '../model/post.dart';

part 'post_form_state.freezed.dart';
part 'post_form_state.g.dart';

@freezed
class PostFormState with _$PostFormState {
  const factory PostFormState({
    @Default('') String title,
    @Default('') String description,
    @PostRefConverter() DocumentReference<Post>? postRef,
  }) = _PostFormState;

  factory PostFormState.fromJson(Map<String, dynamic> json) =>
      _$PostFormStateFromJson(json);
}

class PostRefConverter extends DocumentReferenceConverterBase<Post> {
  const PostRefConverter();

  @override
  DocumentReference<Post> convert(DocumentReference<JsonMap> ref) =>
      ref.withPostConverter();
}

abstract class DocumentReferenceConverterBase<E>
    implements JsonConverter<DocumentReference<E>, Object> {
  const DocumentReferenceConverterBase();

  @override
  DocumentReference<E> fromJson(Object json) {
    return convert(json as DocumentReference<JsonMap>);
  }

  DocumentReference<E> convert(DocumentReference<JsonMap> ref);

  @override
  Object toJson(DocumentReference<E> object) =>
      FirebaseFirestore.instance.doc(object.path);
}
