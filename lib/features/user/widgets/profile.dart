import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/common/common.dart';

import '../user_provider.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key, required this.uid});

  final String uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDoc = ref.watch(userProvider(uid: uid)).value;
    final user = userDoc?.data();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: CachedCircleAvatar(
            imageUrl: user?.photoUrl,
            radius: 52,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            user?.name ?? '',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(userDoc?.id ?? ''),
        ),
      ],
    );
  }
}
