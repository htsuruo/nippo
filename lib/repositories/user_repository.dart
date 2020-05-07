import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nippo/models/user.dart';

class UserRepository {
  Future<void> createUser({User user}) async {
    print('UserRepository -> createUser');
    final fireStore = Firestore.instance;
    final model = User(
      uid: user.uid,
      email: user.email,
      photoUrl: user.photoUrl,
      displayName: user.displayName,
      providerData: user.providerData,
      lastSignInTime: user.lastSignInTime,
    );
    final map = model.toJson();
    await fireStore.collection('users').document(user.uid).setData(map);
  }

  Future<void> updateUser({User user}) async {
    print('UserRepository -> updateUser');
    final fireStore = Firestore.instance;
    final snap = await fireStore.collection('users').document(user.uid).get();
    print(snap.data);
    final model = User(
      uid: user.uid,
      email: user.email,
      photoUrl: user.photoUrl,
      displayName: user.displayName,
      providerData: user.providerData,
      lastSignInTime: user.lastSignInTime,
    );
    final map = model.toJson();
    await fireStore.collection('users').document(user.uid).setData(map);
  }

  Future<List<User>> fetchUserAll() async {
    print('UserRepository -> fetchUserAll');
    final fireStore = Firestore.instance;
    final docs = await fireStore.collection('users').getDocuments();
    final users = <User>[];
    for (final doc in docs.documents) {
      final user = User.fromJson(doc.data);
      users.add(user);
    }
    return users;
  }
}
