import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:nippo/models/user.dart';

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
    currentUser.lastSignInTime = user.lastSignInTime;
    final map = currentUser.toJson();
    await fireStore.collection(collection).document(user.uid).setData(map);
  }

  Future<void> createUser({@required User user}) async {
    print('UserRepository -> createUser');
    final map = user.toJson();
    await fireStore.collection(collection).document(user.uid).setData(map);
  }

  Future<List<User>> fetchAll() async {
    print('UserRepository -> fetchUserAll');
    final docs = await fireStore.collection(collection).getDocuments();
    final users = <User>[];
    for (final doc in docs.documents) {
      final user = User.fromJson(doc.data);
      users.add(user);
    }
    return users;
  }

  Future<User> fetchOne({@required String uid}) async {
    print('UserRepository -> fetchOne');
    final doc = await fireStore.collection(collection).document(uid).get();
    return doc.exists ? User.fromJson(doc.data) : null;
  }

  DocumentReference fetchOneForRef({@required String uid}) {
    print('UserRepository -> fetchOne');
    return fireStore.collection(collection).document(uid);
  }
}
