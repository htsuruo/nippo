// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'post.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters, duplicate_ignore
// ignore_for_file: type=lint

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class PostCollectionReference
    implements
        PostQuery,
        FirestoreCollectionReference<Post, PostQuerySnapshot> {
  factory PostCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$PostCollectionReference;

  static Post fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Post.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Post value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<Post> get reference;

  @override
  PostDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<PostDocumentReference> add(Post value);
}

class _$PostCollectionReference extends _$PostQuery
    implements PostCollectionReference {
  factory _$PostCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$PostCollectionReference._(
      firestore.collection('posts').withConverter(
            fromFirestore: PostCollectionReference.fromFirestore,
            toFirestore: PostCollectionReference.toFirestore,
          ),
    );
  }

  _$PostCollectionReference._(
    CollectionReference<Post> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Post> get reference =>
      super.reference as CollectionReference<Post>;

  @override
  PostDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return PostDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<PostDocumentReference> add(Post value) {
    return reference.add(value).then((ref) => PostDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$PostCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class PostDocumentReference
    extends FirestoreDocumentReference<Post, PostDocumentSnapshot> {
  factory PostDocumentReference(DocumentReference<Post> reference) =
      _$PostDocumentReference;

  DocumentReference<Post> get reference;

  /// A reference to the [PostCollectionReference] containing this document.
  PostCollectionReference get parent {
    return _$PostCollectionReference(reference.firestore);
  }

  @override
  Stream<PostDocumentSnapshot> snapshots();

  @override
  Future<PostDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String? nullablePostId,
    FieldValue nullablePostIdFieldValue,
    String title,
    FieldValue titleFieldValue,
    String description,
    FieldValue descriptionFieldValue,
    UnionTimestamp updatedAt,
    FieldValue updatedAtFieldValue,
    UnionTimestamp createdAt,
    FieldValue createdAtFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String? nullablePostId,
    FieldValue nullablePostIdFieldValue,
    String title,
    FieldValue titleFieldValue,
    String description,
    FieldValue descriptionFieldValue,
    UnionTimestamp updatedAt,
    FieldValue updatedAtFieldValue,
    UnionTimestamp createdAt,
    FieldValue createdAtFieldValue,
  });
}

class _$PostDocumentReference
    extends FirestoreDocumentReference<Post, PostDocumentSnapshot>
    implements PostDocumentReference {
  _$PostDocumentReference(this.reference);

  @override
  final DocumentReference<Post> reference;

  /// A reference to the [PostCollectionReference] containing this document.
  PostCollectionReference get parent {
    return _$PostCollectionReference(reference.firestore);
  }

  @override
  Stream<PostDocumentSnapshot> snapshots() {
    return reference.snapshots().map(PostDocumentSnapshot._);
  }

  @override
  Future<PostDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(PostDocumentSnapshot._);
  }

  @override
  Future<PostDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(PostDocumentSnapshot._);
  }

  Future<void> update({
    Object? nullablePostId = _sentinel,
    FieldValue? nullablePostIdFieldValue,
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? updatedAt = _sentinel,
    FieldValue? updatedAtFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
  }) async {
    assert(
      nullablePostId == _sentinel || nullablePostIdFieldValue == null,
      "Cannot specify both nullablePostId and nullablePostIdFieldValue",
    );
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      updatedAt == _sentinel || updatedAtFieldValue == null,
      "Cannot specify both updatedAt and updatedAtFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    final json = {
      if (nullablePostId != _sentinel)
        _$$PostImplFieldMap['nullablePostId']!:
            _$$PostImplPerFieldToJson.nullablePostId(nullablePostId as String?),
      if (nullablePostIdFieldValue != null)
        _$$PostImplFieldMap['nullablePostId']!: nullablePostIdFieldValue,
      if (title != _sentinel)
        _$$PostImplFieldMap['title']!:
            _$$PostImplPerFieldToJson.title(title as String),
      if (titleFieldValue != null)
        _$$PostImplFieldMap['title']!: titleFieldValue,
      if (description != _sentinel)
        _$$PostImplFieldMap['description']!:
            _$$PostImplPerFieldToJson.description(description as String),
      if (descriptionFieldValue != null)
        _$$PostImplFieldMap['description']!: descriptionFieldValue,
      if (updatedAt != _sentinel)
        _$$PostImplFieldMap['updatedAt']!:
            _$$PostImplPerFieldToJson.updatedAt(updatedAt as UnionTimestamp),
      if (updatedAtFieldValue != null)
        _$$PostImplFieldMap['updatedAt']!: updatedAtFieldValue,
      if (createdAt != _sentinel)
        _$$PostImplFieldMap['createdAt']!:
            _$$PostImplPerFieldToJson.createdAt(createdAt as UnionTimestamp),
      if (createdAtFieldValue != null)
        _$$PostImplFieldMap['createdAt']!: createdAtFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? nullablePostId = _sentinel,
    FieldValue? nullablePostIdFieldValue,
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? updatedAt = _sentinel,
    FieldValue? updatedAtFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
  }) {
    assert(
      nullablePostId == _sentinel || nullablePostIdFieldValue == null,
      "Cannot specify both nullablePostId and nullablePostIdFieldValue",
    );
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      updatedAt == _sentinel || updatedAtFieldValue == null,
      "Cannot specify both updatedAt and updatedAtFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    final json = {
      if (nullablePostId != _sentinel)
        _$$PostImplFieldMap['nullablePostId']!:
            _$$PostImplPerFieldToJson.nullablePostId(nullablePostId as String?),
      if (nullablePostIdFieldValue != null)
        _$$PostImplFieldMap['nullablePostId']!: nullablePostIdFieldValue,
      if (title != _sentinel)
        _$$PostImplFieldMap['title']!:
            _$$PostImplPerFieldToJson.title(title as String),
      if (titleFieldValue != null)
        _$$PostImplFieldMap['title']!: titleFieldValue,
      if (description != _sentinel)
        _$$PostImplFieldMap['description']!:
            _$$PostImplPerFieldToJson.description(description as String),
      if (descriptionFieldValue != null)
        _$$PostImplFieldMap['description']!: descriptionFieldValue,
      if (updatedAt != _sentinel)
        _$$PostImplFieldMap['updatedAt']!:
            _$$PostImplPerFieldToJson.updatedAt(updatedAt as UnionTimestamp),
      if (updatedAtFieldValue != null)
        _$$PostImplFieldMap['updatedAt']!: updatedAtFieldValue,
      if (createdAt != _sentinel)
        _$$PostImplFieldMap['createdAt']!:
            _$$PostImplPerFieldToJson.createdAt(createdAt as UnionTimestamp),
      if (createdAtFieldValue != null)
        _$$PostImplFieldMap['createdAt']!: createdAtFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is PostDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class PostQuery implements QueryReference<Post, PostQuerySnapshot> {
  @override
  PostQuery limit(int limit);

  @override
  PostQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  PostQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  PostQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  PostQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  PostQuery whereNullablePostId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  PostQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  PostQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  PostQuery whereUpdatedAt({
    UnionTimestamp? isEqualTo,
    UnionTimestamp? isNotEqualTo,
    UnionTimestamp? isLessThan,
    UnionTimestamp? isLessThanOrEqualTo,
    UnionTimestamp? isGreaterThan,
    UnionTimestamp? isGreaterThanOrEqualTo,
    bool? isNull,
    List<UnionTimestamp>? whereIn,
    List<UnionTimestamp>? whereNotIn,
  });
  PostQuery whereCreatedAt({
    UnionTimestamp? isEqualTo,
    UnionTimestamp? isNotEqualTo,
    UnionTimestamp? isLessThan,
    UnionTimestamp? isLessThanOrEqualTo,
    UnionTimestamp? isGreaterThan,
    UnionTimestamp? isGreaterThanOrEqualTo,
    bool? isNull,
    List<UnionTimestamp>? whereIn,
    List<UnionTimestamp>? whereNotIn,
  });

  PostQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByNullablePostId({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByDescription({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByUpdatedAt({
    bool descending = false,
    UnionTimestamp startAt,
    UnionTimestamp startAfter,
    UnionTimestamp endAt,
    UnionTimestamp endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByCreatedAt({
    bool descending = false,
    UnionTimestamp startAt,
    UnionTimestamp startAfter,
    UnionTimestamp endAt,
    UnionTimestamp endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });
}

class _$PostQuery extends QueryReference<Post, PostQuerySnapshot>
    implements PostQuery {
  _$PostQuery(
    this._collection, {
    required Query<Post> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<PostQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(PostQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<PostQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(PostQuerySnapshot._fromQuerySnapshot);
  }

  @override
  PostQuery limit(int limit) {
    return _$PostQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PostQuery limitToLast(int limit) {
    return _$PostQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  PostQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$PostQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PostQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$PostQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PostQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$PostQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PostQuery whereNullablePostId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$PostQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$PostImplFieldMap['nullablePostId']!,
        isEqualTo: isEqualTo != null
            ? _$$PostImplPerFieldToJson.nullablePostId(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$$PostImplPerFieldToJson.nullablePostId(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$$PostImplPerFieldToJson.nullablePostId(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$PostImplPerFieldToJson.nullablePostId(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$PostImplPerFieldToJson.nullablePostId(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$PostImplPerFieldToJson.nullablePostId(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn:
            whereIn?.map((e) => _$$PostImplPerFieldToJson.nullablePostId(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$PostImplPerFieldToJson.nullablePostId(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  PostQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$PostQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$PostImplFieldMap['title']!,
        isEqualTo: isEqualTo != null
            ? _$$PostImplPerFieldToJson.title(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$$PostImplPerFieldToJson.title(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$$PostImplPerFieldToJson.title(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$PostImplPerFieldToJson.title(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$PostImplPerFieldToJson.title(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$PostImplPerFieldToJson.title(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$$PostImplPerFieldToJson.title(e)),
        whereNotIn: whereNotIn?.map((e) => _$$PostImplPerFieldToJson.title(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  PostQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$PostQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$PostImplFieldMap['description']!,
        isEqualTo: isEqualTo != null
            ? _$$PostImplPerFieldToJson.description(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$$PostImplPerFieldToJson.description(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$$PostImplPerFieldToJson.description(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$PostImplPerFieldToJson.description(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$PostImplPerFieldToJson.description(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$PostImplPerFieldToJson.description(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$$PostImplPerFieldToJson.description(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$PostImplPerFieldToJson.description(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  PostQuery whereUpdatedAt({
    UnionTimestamp? isEqualTo,
    UnionTimestamp? isNotEqualTo,
    UnionTimestamp? isLessThan,
    UnionTimestamp? isLessThanOrEqualTo,
    UnionTimestamp? isGreaterThan,
    UnionTimestamp? isGreaterThanOrEqualTo,
    bool? isNull,
    List<UnionTimestamp>? whereIn,
    List<UnionTimestamp>? whereNotIn,
  }) {
    return _$PostQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$PostImplFieldMap['updatedAt']!,
        isEqualTo: isEqualTo != null
            ? _$$PostImplPerFieldToJson.updatedAt(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$$PostImplPerFieldToJson.updatedAt(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$$PostImplPerFieldToJson.updatedAt(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$PostImplPerFieldToJson.updatedAt(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$PostImplPerFieldToJson.updatedAt(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$PostImplPerFieldToJson.updatedAt(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$$PostImplPerFieldToJson.updatedAt(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$PostImplPerFieldToJson.updatedAt(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  PostQuery whereCreatedAt({
    UnionTimestamp? isEqualTo,
    UnionTimestamp? isNotEqualTo,
    UnionTimestamp? isLessThan,
    UnionTimestamp? isLessThanOrEqualTo,
    UnionTimestamp? isGreaterThan,
    UnionTimestamp? isGreaterThanOrEqualTo,
    bool? isNull,
    List<UnionTimestamp>? whereIn,
    List<UnionTimestamp>? whereNotIn,
  }) {
    return _$PostQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$PostImplFieldMap['createdAt']!,
        isEqualTo: isEqualTo != null
            ? _$$PostImplPerFieldToJson.createdAt(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$$PostImplPerFieldToJson.createdAt(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$$PostImplPerFieldToJson.createdAt(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$PostImplPerFieldToJson.createdAt(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$PostImplPerFieldToJson.createdAt(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$PostImplPerFieldToJson.createdAt(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$$PostImplPerFieldToJson.createdAt(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$PostImplPerFieldToJson.createdAt(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  PostQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PostQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PostQuery orderByNullablePostId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$PostImplFieldMap['nullablePostId']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PostQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PostQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$PostImplFieldMap['title']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PostQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PostQuery orderByDescription({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$PostImplFieldMap['description']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PostQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PostQuery orderByUpdatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$PostImplFieldMap['updatedAt']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PostQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PostQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$PostImplFieldMap['createdAt']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PostQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$PostQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class PostDocumentSnapshot extends FirestoreDocumentSnapshot<Post> {
  PostDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Post> snapshot;

  @override
  PostDocumentReference get reference {
    return PostDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Post? data;
}

class PostQuerySnapshot
    extends FirestoreQuerySnapshot<Post, PostQueryDocumentSnapshot> {
  PostQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory PostQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Post> snapshot,
  ) {
    final docs = snapshot.docs.map(PostQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        PostDocumentSnapshot._,
      );
    }).toList();

    return PostQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<PostDocumentSnapshot> _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    PostDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<PostDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Post> snapshot;

  @override
  final List<PostQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<PostDocumentSnapshot>> docChanges;
}

class PostQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Post>
    implements PostDocumentSnapshot {
  PostQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Post> snapshot;

  @override
  final Post data;

  @override
  PostDocumentReference get reference {
    return PostDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      nullablePostId: json['postId'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      updatedAt: json['updatedAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : const UnionTimestampConverter()
              .fromJson(json['updatedAt'] as Object),
      createdAt: json['createdAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : const UnionTimestampConverter()
              .fromJson(json['createdAt'] as Object),
    );

const _$$_PostFieldMap = <String, String>{
  'nullablePostId': 'postId',
  'title': 'title',
  'description': 'description',
  'updatedAt': 'updatedAt',
  'createdAt': 'createdAt',
};

// ignore: unused_element
abstract class _$$_PostPerFieldToJson {
  // ignore: unused_element
  static Object? nullablePostId(String? instance) => instance;
  // ignore: unused_element
  static Object? title(String instance) => instance;
  // ignore: unused_element
  static Object? description(String instance) => instance;
  // ignore: unused_element
  static Object? updatedAt(UnionTimestamp instance) =>
      const UnionTimestampConverter().toJson(instance);
  // ignore: unused_element
  static Object? createdAt(UnionTimestamp instance) =>
      const UnionTimestampConverter().toJson(instance);
}

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'postId': instance.nullablePostId,
      'title': instance.title,
      'description': instance.description,
      'updatedAt': const UnionTimestampConverter().toJson(instance.updatedAt),
      'createdAt': const UnionTimestampConverter().toJson(instance.createdAt),
    };
