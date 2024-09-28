import 'package:nippo/core/authentication/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'model/user.dart';

part 'user_provider.g.dart';

@riverpod
Future<User?> authUser(UserRef ref) async {
  final firUser = await ref.watch(firUserProvider.future);
  return firUser == null
      ? null
      : ref.watch(userProvider(uid: firUser.uid)).value;
}

@riverpod
Future<User?> user(UserRef ref, {required String uid}) {
  return usersRef
      .doc(uid)
      .snapshots()
      .map((snap) => snap.data)
      // StreamにはfirstOrNullがないので、firstWhereで代用
      .firstWhere((_) => true);
}
