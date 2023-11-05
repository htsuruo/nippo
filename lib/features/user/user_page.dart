import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/features/user/widgets/user_scaffold.dart';

class UserPage extends ConsumerWidget {
  const UserPage({super.key, required this.uid});

  final String? uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return UserScaffold(uid: uid);
  }
}
