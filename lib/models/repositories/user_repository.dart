import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:nippo/models/entities/user.dart';

class UserRepository {
  final Firestore fireStore = Firestore.instance;
  static const String collection = 'users';

  Future<void> updateUser({@required User user}) async {
    print('UserRepository -> updateUser');
    final currentUser = await fetchOne(uid: user.uid);
    if (currentUser == null) {
      await createUser(user: user);
      return;
    }
//    currentUser.lastSignInTime = user.lastSignInTime;
    final map = currentUser.toJson();
    await fireStore.collection(collection).document(user.uid).setData(map);
  }

  Future<void> createUser({@required User user}) async {
    print('UserRepository -> createUser');
    final map = user.toJson();
    await fireStore.collection(collection).document(user.uid).setData(map);
  }

  void fetchAllSnapshot({Function(QuerySnapshot) func}) {
    print('UserRepository -> fetchAllSnapshot');
    fireStore
        .collection(collection)
        .orderBy('lastSignInTime', descending: true)
        .snapshots()
        .listen(func);
  }

  Future<User> fetchOne({@required String uid}) async {
    print('UserRepository -> fetchOne');
    final doc = await fireStore.collection(collection).document(uid).get();
    return doc.exists ? User.fromJson(doc.data) : null;
  }

  Future<User> fetchOneFromRef({@required DocumentReference ref}) async {
    print('UserRepository -> fetchOneFromRef');
    final doc = await ref.get();
    return doc.exists ? User.fromJson(doc.data) : null;
  }
}
