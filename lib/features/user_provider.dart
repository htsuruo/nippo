import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nippo/core/authentication/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user/user.dart';

part 'user_provider.g.dart';

@riverpod
Future<User?> user(UserRef ref) async {
  final firUser = await ref.watch(firUserProvider.future);
  return FirebaseFirestore.instance
      .collection('users')
      .doc(firUser?.uid)
      .get()
      .then((value) {
    if (value.exists) {
      return User.fromJson(value.data()!);
    }
    return null;
  });
}
