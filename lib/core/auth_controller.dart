import 'package:nippo/core/auth_repository.dart';
import 'package:nippo/features/post/post_repository.dart';
import 'package:state_notifier/state_notifier.dart';

import '../features/user/model/user.dart';
import 'auth_state.dart';

class AuthController extends StateNotifier<AuthState> with LocatorMixin {
  AuthController()
      : super(AuthState(user: User(uid: '0', email: 'sample@gmail.com')));

  Future<void> updateData() async {
    print('AuthController -> initState');
    if (await read<AuthRepository>().isLogin()) {
      final user = await read<AuthRepository>().currentUser();
      state = state.copyWith(
        user: User(email: user?.email ?? '', uid: user!.uid),
        posts: await read<PostRepository>().fetchByUser(uid: user.uid),
      );
    }
  }

  Future<void> signOut() async => AuthRepository().signOut();
}
