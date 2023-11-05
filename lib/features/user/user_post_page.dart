import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../post/detail/post_detail_view.dart';
import '../post/post_provider.dart';

class UserPostPage extends ConsumerWidget {
  const UserPostPage({super.key, required this.uid, required this.pid});

  final String? uid;
  final String? pid;

  @override
  Widget build(BuildContext context, WidgetRef ref) => PostDetailView(
        postSnapAsync: ref.watch(userPostProvider(uid, pid)),
      );
}
