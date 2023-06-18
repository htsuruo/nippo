import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nippo/models/entities/user.dart';

class UserRepository {
  final firestore = FirebaseFirestore.instance;
  static const String collection = 'users';

  Future<void> updateUser({required User user}) async {
    final currentUser = await fetchOne(uid: user.uid);
    final map = currentUser!.toJson();
    await firestore.collection(collection).doc(user.uid).set(map);
  }

  Future<void> createUser({required User user}) async {
    final map = user.toJson();
    await firestore.collection(collection).doc(user.uid).set(map);
  }

  void fetchAllSnapshot({required Function(QuerySnapshot) func}) {
    firestore
        .collection(collection)
        .orderBy('lastSignInTime', descending: true)
        .snapshots()
        .listen(func);
  }

  Future<User?> fetchOne({required String uid}) async {
    final doc = await firestore.collection(collection).doc(uid).get();
    return doc.exists ? User.fromJson(doc.data()!) : null;
  }

  Future<User?> fetchOneFromRef({required DocumentReference ref}) async {
    final doc = await ref.get();
    return doc.exists
        ? User.fromJson(doc.data()! as Map<String, dynamic>)
        : null;
  }
}
