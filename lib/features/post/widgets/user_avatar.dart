import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/core/router/router.dart';
import 'package:nippo/features/post/model/post.dart';
import 'package:nippo/features/user/user_provider.dart';

class UserAvatar extends ConsumerWidget {
  const UserAvatar({super.key, required this.postRef});

  final DocumentReference<Post> postRef;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // users/[uid]/posts/[postId]
    final userSnapshot =
        ref.watch(userProvider(uid: postRef.path.split('/')[1])).value;
    const placeHolder = CircleAvatar();
    return userSnapshot == null
        ? placeHolder
        : CachedCircleAvatar(
            onTap: () {
              UserPageRoute(uid: userSnapshot.id).push<void>(context);
            },
            imageUrl: userSnapshot.data()?.photoUrl ?? '',
          );
  }
}
