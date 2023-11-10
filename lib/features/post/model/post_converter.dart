import 'package:cloud_firestore/cloud_firestore.dart';

import 'post.dart';

Post _from(
  DocumentSnapshot<Map<String, dynamic>> snapshot,
  SnapshotOptions? options,
) =>
    Post.fromJson(snapshot.data()!);

Map<String, dynamic> _to(
  Post post,
  SetOptions? options,
) =>
    post.toJson();

extension DocumentReferencePostConverter on DocumentReference {
  DocumentReference<Post> withPostConverter() {
    return withConverter<Post>(
      fromFirestore: _from,
      toFirestore: _to,
    );
  }
}

extension CollectionReferencePostConverter on CollectionReference {
  CollectionReference<Post> withPostConverter() {
    return withConverter<Post>(
      fromFirestore: _from,
      toFirestore: _to,
    );
  }
}

extension QueryPostConverter on Query {
  Query<Post> withPostConverter() {
    return withConverter<Post>(
      fromFirestore: _from,
      toFirestore: _to,
    );
  }
}
