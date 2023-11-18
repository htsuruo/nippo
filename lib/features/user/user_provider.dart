import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nippo/core/authentication/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'model/user.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
DocumentReference<User> authUserRef(AuthUserRefRef ref) {
  final firUser = ref.watch(firUserProvider).value;
  return ref.watch(userRefProvider(firUser?.uid));
}

@Riverpod(keepAlive: true)
DocumentReference<User> userRef(UserRefRef ref, String? uid) {
  final firUser = ref.watch(firUserProvider).value;
  return userCollectionRef.doc(firUser?.uid);
}

@riverpod
Stream<DocumentSnapshot<User>> user(UserRef ref, {required String? uid}) =>
    ref.watch(userRefProvider(uid)).snapshots();
