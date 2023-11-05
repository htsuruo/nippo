import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/features/post/detail/action_menu_button.dart';
import 'package:nippo/features/post/detail/post_detail_view.dart';
import 'package:nippo/features/post/post_provider.dart';

class PostPage extends ConsumerWidget {
  /// 投稿一覧画面からの遷移: [pid]のみでCollectionGroupで取得する
  const PostPage.fromAll({required String pid}) : this._(pid: pid);

  /// ユーザープロフィール画面からの遷移: [uid]と[pid]でDocumentReferenceから取得する
  const PostPage.fromProfile({required String pid, required String uid})
      : this._(pid: pid, uid: uid);

  const PostPage._({required this.pid, this.uid});

  final String pid;
  final String? uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = this.uid;
    final postSnapAsync = uid == null
        ? ref.watch(postProvider(pid))
        : ref.watch(userPostProvider(uid, pid));

    return Scaffold(
      appBar: AppBar(
        actions: [
          ActionMenuButton(postSnapAsync: postSnapAsync),
          const Gap(8),
        ],
      ),
      body: postSnapAsync.when(
        loading: CenteredCircularProgressIndicator.new,
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        data: (postSnap) => PostDetailView(postSnap: postSnap),
      ),
    );
  }
}
