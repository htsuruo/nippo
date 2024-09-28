import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/core/router/router.dart';
import 'package:nippo/features/user/model/user.dart';
import 'package:nippo/features/user/user_provider.dart';

class UserAvatar extends ConsumerWidget {
  const UserAvatar({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // users/[uid]/posts/[postId]
    // TODO(htsuruo): uidいれるべきところがpostIdになっている
    final user = ref.watch(userProvider(uid: post.id)).value;
    return CachedCircleAvatar(
      // TODO(htsuruo): `applyUnlessNull`に書き換える
      onTap: user == null
          ? null
          : () {
              UserPageRoute(uid: user.id).push<void>(context);
            },
      imageUrl: user?.photoUrl,
    );
  }
}
