import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nippo/features/user/user_repository.dart';
import 'package:state_notifier/state_notifier.dart';

import 'model/user.dart';
import 'user_state.dart';

class UserController extends StateNotifier<UserState> with LocatorMixin {
  UserController() : super(const UserState());

  @override
  void initState() {
    void sync(QuerySnapshot querySnapshot) {
      final users = <User>[];
      for (final element in querySnapshot.docs) {
        final user = User.fromJson(element.data()! as Map<String, dynamic>);
        users.add(user);
      }
      state = UserState(
        users: users,
      );
    }

    read<UserRepository>().fetchAllSnapshot(func: sync);
  }
}
