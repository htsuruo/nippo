// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'user.dart';

// **************************************************************************
// Generator: FirestoreConverterGen
// **************************************************************************

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND

User _from(
  DocumentSnapshot<Map<String, dynamic>> snapshot,
  SnapshotOptions? _,
) =>
    User.fromJson(snapshot.data()!);

Map<String, dynamic> _to(
  User data,
  SetOptions? options,
) =>
    data.toJson();

extension on DocumentReference {
  DocumentReference<User> withUserConverter() {
    return withConverter<User>(
      fromFirestore: _from,
      toFirestore: _to,
    );
  }
}

CollectionReference<User> get userCollectionRef =>
    FirebaseFirestore.instance.collection('users').withConverter<User>(
          fromFirestore: _from,
          toFirestore: _to,
        );

Query<User> get userCollectionGroup =>
    FirebaseFirestore.instance.collectionGroup('users').withConverter<User>(
          fromFirestore: _from,
          toFirestore: _to,
        );

class UserRefConverter
    implements JsonConverter<DocumentReference<User>, Object> {
  const UserRefConverter();

  @override
  DocumentReference<User> fromJson(Object json) {
    return (json as DocumentReference<Map<String, dynamic>>)
        .withUserConverter();
  }

  @override
  Object toJson(DocumentReference<User> object) =>
      FirebaseFirestore.instance.doc(object.path);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      name: json['name'] as String? ?? '名無し',
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String?,
      updatedAt: json['updatedAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : const UnionTimestampConverter()
              .fromJson(json['updatedAt'] as Object),
      createdAt: json['createdAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : const UnionTimestampConverter()
              .fromJson(json['createdAt'] as Object),
    );

const _$$UserImplFieldMap = <String, String>{
  'name': 'name',
  'email': 'email',
  'photoUrl': 'photoUrl',
  'updatedAt': 'updatedAt',
  'createdAt': 'createdAt',
};

// ignore: unused_element
abstract class _$$UserImplPerFieldToJson {
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? email(String instance) => instance;
  // ignore: unused_element
  static Object? photoUrl(String? instance) => instance;
  // ignore: unused_element
  static Object? updatedAt(UnionTimestamp instance) =>
      const UnionTimestampConverter().toJson(instance);
  // ignore: unused_element
  static Object? createdAt(UnionTimestamp instance) =>
      const UnionTimestampConverter().toJson(instance);
}

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'updatedAt': const UnionTimestampConverter().toJson(instance.updatedAt),
      'createdAt': const UnionTimestampConverter().toJson(instance.createdAt),
    };
